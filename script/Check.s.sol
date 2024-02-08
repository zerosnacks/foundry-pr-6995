// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console, VmSafe} from "forge-std/Script.sol";

contract CheckScript is Script {
    function setUp() public {}

    function run() public {
        vm.addr(uint256(vm.envBytes32("MAINNET_KEY")));
        vm.deriveKey("test test test test test test test test test test test junk", 0);
        vm.createWallet(uint256(vm.envBytes32("MAINNET_KEY")));
        vm.rememberKey(uint256(vm.envBytes32("MAINNET_KEY")));

        vm.startBroadcast(uint256(vm.envBytes32("MAINNET_KEY")));
        vm.stopBroadcast();

        vm.sign(uint256(vm.envBytes32("MAINNET_KEY")), "");
        vm.signP256(uint256(vm.envBytes32("MAINNET_KEY")), "");

        vm.broadcast(uint256(vm.envBytes32("MAINNET_KEY")));

        VmSafe.Wallet memory wallet = vm.createWallet(uint256(vm.envBytes32("MAINNET_KEY")));
        vm.getNonce(wallet);

        vm.getNonce(address(1));
    }
}
