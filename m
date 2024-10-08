Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54599959D4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 00:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6A610E25C;
	Tue,  8 Oct 2024 22:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JR9bzqB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 343 seconds by postgrey-1.36 at gabe;
 Tue, 08 Oct 2024 22:09:14 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD4610E25C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 22:09:14 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XNVQR2MVkz9smf
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 00:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1728425007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2Z6ROqJX/JwULz3twbm891D1NPzFJMib0yysYG0+/34=;
 b=JR9bzqB39w9WqbVl6i+3xQaV+xRVL6OJRnw+6hFbPwNz/injRYUgqgyWr6IHUaPmgfs2Wh
 UhIS1PPqHRMFMwq1XHNWhnWQwo86OYJxGhDysC8oA80qh7LTnOnfxOOqleCLLGkRKEYOMB
 CIZe1mIfHzA8v6AILFuZis8u/bsfvULohthBMD6PB5g1LRtO1dMBiC0D1czPYgpjfUn5eb
 +F+r5z6jy8y8UKckSbubDgzInAawfJ6PNUGKSyNOz1AziMvkil/cRZE/bSqCBNyxyg5F/u
 Rl69toZK/fsXpuLTESGcGaiIbC9QrVHLTiSWM4HwRoHGYPJW+7DmYNb2qBq9bw==
Date: Wed, 9 Oct 2024 00:03:21 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: dri-devel@lists.freedesktop.org
Subject: radeon drm fails to load on v6.12-rc2 "Bogus possible_clones:
 [ENCODER:46:TV-46] possible_clones=0x4 (full encoder mask=0x7)" ( Thinkpad
 T60)
Message-ID: <20241009000321.418e4294@yea>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 7ed03a3a80d2fa615e8
X-MBO-RS-META: 7nkgu8zdkd1s7y91nqgiftyqxk1ac56s
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings!

On kernel v6.12-rc I get no X and dmesg (via netconsole) shows this at loading radeon drm:

[...]
[drm] PCIE GART of 512M enabled (table at 0x0000000000040000).
radeon 0000:01:00.0: WB enabled
radeon 0000:01:00.0: fence driver on ring 0 use gpu addr 0x0000000008000000
radeon 0000:01:00.0: radeon: MSI limited to 32-bit
[drm] radeon: irq initialized.
[drm] Loading R500 Microcode
[drm] radeon: ring at 0x0000000008001000
[drm] ring test succeeded in 0 usecs
[drm] ib test succeeded in 0 usecs
stackdepot: allocating hash table of 65536 entries via kvcalloc
acpi device:06: registered as cooling_device2
[drm] Radeon Display Connectors
[drm] Connector 0:
[drm]   VGA-1
[drm]   DDC: 0x7e40 0x7e40 0x7e44 0x7e44 0x7e48 0x7e48 0x7e4c 0x7e4c
[drm]   Encoders:
[drm]     CRT1: INTERNAL_KLDSCP_DAC1
[drm] Connector 1:
[drm]   LVDS-1
[drm]   DDC: 0x7e60 0x7e60 0x7e64 0x7e64 0x7e68 0x7e68 0x7e6c 0x7e6c
[drm]   Encoders:
[drm]     LCD1: INTERNAL_LVTM1
[drm] Connector 2:
[drm]   DVI-I-1
[drm]   HPD1
[drm]   DDC: 0x7e50 0x7e50 0x7e54 0x7e54 0x7e58 0x7e58 0x7e5c 0x7e5c
[drm]   Encoders:
[drm]     DFP1: INTERNAL_KLDSCP_TMDS1
------------[ cut here ]------------
Bogus possible_clones: [ENCODER:46:TV-46] possible_clones=0x4 (full encoder mask=0x7)
WARNING: CPU: 0 PID: 170 at drivers/gpu/drm/drm_mode_config.c:615 drm_mode_config_validate+0x113/0x39c
Modules linked in: iwl3945(+) radeon(+) iwlegacy bcachefs mac80211 thinkpad_acpi snd_hda_intel snd_intel_dspcfg nvram libarc4 snd_hda_codec platform_profile uhci_hcd cfg80211 drm_suballoc_helper snd_hwdep sparse_keymap ehci_pci lz4hc_compress i2c_algo_bit ehci_hcd drm_ttm_helper snd_hda_core lz4_compress snd_pcm ttm lz4_decompress crc64 drm_display_helper usbcore acpi_cpufreq rfkill snd_timer battery snd soundcore usb_common video wmi thermal ac backlight evdev input_leds joydev button processor pkcs8_key_parser coretemp hwmon dm_mod fuse configfs loop
CPU: 0 UID: 0 PID: 170 Comm: (udev-worker) Tainted: G        W          6.12.0-rc2-P3-dirty #2
Tainted: [W]=WARN
Hardware name: LENOVO 2007F2G/2007F2G, BIOS 79ETE7WW (2.27 ) 03/21/2011
EIP: drm_mode_config_validate+0x113/0x39c
Code: 4b 24 8b 43 2c 0f a3 c8 8b 75 e4 73 08 89 d1 f7 d1 85 c8 74 17 52 50 ff 73 1c ff 73 08 68 be 86 9a dd e8 70 13 b1 ff 83 c4 14 <0f> 0b 8b 4b fc 8b 91 ac 02 00 00 81 c1 ac 02 00 00 31 c0 39 ca 74
EAX: 00000000 EBX: c33b1f04 ECX: 00000000 EDX: 00000000
ESI: c2fe0004 EDI: 00000004 EBP: c1e059f8 ESP: c1e059d0
DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210292
CR0: 80050033 CR2: b77f053b CR3: 01e08000 CR4: 000006f0
Call Trace:
 ? show_regs+0x4e/0x5c
 ? __warn+0x87/0xdc
 ? drm_mode_config_validate+0x113/0x39c
 ? report_bug+0x94/0x108
 ? exc_overflow+0x3c/0x3c
 ? handle_bug+0x41/0x60
 ? exc_invalid_op+0x17/0x40
 ? handle_exception+0x101/0x101
 ? enqueue_pushable_dl_task+0x127/0x128
 ? drm_mode_std+0x4/0x278
 ? exc_overflow+0x3c/0x3c
 ? drm_mode_config_validate+0x113/0x39c
 ? drm_mode_std+0x4/0x278
 ? exc_overflow+0x3c/0x3c
 ? drm_mode_config_validate+0x113/0x39c
 drm_dev_register+0x1d/0x1c8
 radeon_pci_probe+0xd7/0x12c [radeon]
 pci_device_probe+0x80/0x100
 really_probe+0xad/0x1fc
 __driver_probe_device+0x64/0x138
 driver_probe_device+0x1a/0x70
 __driver_attach+0x7c/0xb8
 bus_for_each_dev+0x63/0x8c
 driver_attach+0x14/0x20
 ? driver_attach+0x20/0x20
 bus_add_driver+0xc7/0x1cc
 driver_register+0x50/0xd0
 __pci_register_driver+0x5c/0x68
 init_module+0x5c/0x1000 [radeon]
 do_one_initcall+0xb1/0x268
 ? alloc_debug_processing+0x38/0x12c
 ? _raw_spin_unlock_irqrestore+0xb/0x18
 ? check_bytes_and_report+0x2a/0xd0
 ? check_bytes_and_report+0x2a/0xd0
 ? init_object+0x77/0xd8
 ? alloc_debug_processing+0x38/0x12c
 ? _raw_spin_unlock_irqrestore+0xb/0x18
 ? __radix_tree_replace+0xb8/0xcc
 ? radix_tree_iter_tag_clear+0x18/0x28
 ? idr_alloc_u32+0x81/0xa0
 ? idr_alloc_cyclic+0x38/0x7c
 ? __kernfs_new_node+0x117/0x164
 ? check_bytes_and_report+0x2a/0xd0
 ? init_object+0x77/0xd8
 ? alloc_debug_processing+0x38/0x12c
 ? _raw_spin_unlock_irqrestore+0xb/0x18
 ? ___slab_alloc+0x38b/0x700
 ? 0xf80ac000
 do_init_module+0x50/0x1ac
 load_module+0xd54/0xe94
 __ia32_sys_finit_module+0x1b0/0x250
 ia32_sys_call+0x270b/0x2e08
 __do_fast_syscall_32+0x88/0xb4
 ? __ia32_sys_openat+0x19/0x24
 ? syscall_exit_to_user_mode+0x6c/0x78
 ? __do_fast_syscall_32+0x92/0xb4
 ? lock_mm_and_find_vma+0x2a/0xd0
 ? do_user_addr_fault+0x1c4/0x2b0
 ? irqentry_exit_to_user_mode+0x60/0x6c
 do_fast_syscall_32+0x29/0x58
 do_SYSENTER_32+0x12/0x18
 entry_SYSENTER_32+0x98/0xf8
EIP: 0xb7f8d539
Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 0f 1f 00 58 b8 77 00 00 00 cd 80 90 0f 1f
EAX: ffffffda EBX: 0000001c ECX: b7b7b54c EDX: 00000000
ESI: 0175c540 EDI: 00000001 EBP: 00000007 ESP: bfae9aac
DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200246
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
Bogus possible_clones: [ENCODER:48:TMDS-48] possible_clones=0x1 (full encoder mask=0x7)
WARNING: CPU: 0 PID: 170 at drivers/gpu/drm/drm_mode_config.c:615 drm_mode_config_validate+0x113/0x39c
Modules linked in: iwl3945(+) radeon(+) iwlegacy bcachefs mac80211 thinkpad_acpi snd_hda_intel snd_intel_dspcfg nvram libarc4 snd_hda_codec platform_profile uhci_hcd cfg80211 drm_suballoc_helper snd_hwdep sparse_keymap ehci_pci lz4hc_compress i2c_algo_bit ehci_hcd drm_ttm_helper snd_hda_core lz4_compress snd_pcm ttm lz4_decompress crc64 drm_display_helper usbcore acpi_cpufreq rfkill snd_timer battery snd soundcore usb_common video wmi thermal ac backlight evdev input_leds joydev button processor pkcs8_key_parser coretemp hwmon dm_mod fuse configfs loop
CPU: 0 UID: 0 PID: 170 Comm: (udev-worker) Tainted: G        W          6.12.0-rc2-P3-dirty #2
Tainted: [W]=WARN
Hardware name: LENOVO 2007F2G/2007F2G, BIOS 79ETE7WW (2.27 ) 03/21/2011
EIP: drm_mode_config_validate+0x113/0x39c
Code: 4b 24 8b 43 2c 0f a3 c8 8b 75 e4 73 08 89 d1 f7 d1 85 c8 74 17 52 50 ff 73 1c ff 73 08 68 be 86 9a dd e8 70 13 b1 ff 83 c4 14 <0f> 0b 8b 4b fc 8b 91 ac 02 00 00 81 c1 ac 02 00 00 31 c0 39 ca 74
EAX: 00000000 EBX: c33b2204 ECX: 00000000 EDX: 00000000
ESI: c2fe0004 EDI: 00000001 EBP: c1e059f8 ESP: c1e059d0
DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210292
CR0: 80050033 CR2: b77f053b CR3: 01e08000 CR4: 000006f0
Call Trace:
 ? show_regs+0x4e/0x5c
 ? __warn+0x87/0xdc
 ? drm_mode_config_validate+0x113/0x39c
 ? report_bug+0x94/0x108
 ? exc_overflow+0x3c/0x3c
 ? handle_bug+0x41/0x60
 ? exc_invalid_op+0x17/0x40
 ? handle_exception+0x101/0x101
 ? enqueue_pushable_dl_task+0x127/0x128
 ? drm_mode_std+0x4/0x278
 ? exc_overflow+0x3c/0x3c
 ? drm_mode_config_validate+0x113/0x39c
 ? drm_mode_std+0x4/0x278
 ? exc_overflow+0x3c/0x3c
 ? drm_mode_config_validate+0x113/0x39c
 drm_dev_register+0x1d/0x1c8
 radeon_pci_probe+0xd7/0x12c [radeon]
 pci_device_probe+0x80/0x100
 really_probe+0xad/0x1fc
 __driver_probe_device+0x64/0x138
 driver_probe_device+0x1a/0x70
 __driver_attach+0x7c/0xb8
 bus_for_each_dev+0x63/0x8c
 driver_attach+0x14/0x20
 ? driver_attach+0x20/0x20
 bus_add_driver+0xc7/0x1cc
 driver_register+0x50/0xd0
 __pci_register_driver+0x5c/0x68
 init_module+0x5c/0x1000 [radeon]
 do_one_initcall+0xb1/0x268
 ? alloc_debug_processing+0x38/0x12c
 ? _raw_spin_unlock_irqrestore+0xb/0x18
 ? check_bytes_and_report+0x2a/0xd0
 ? check_bytes_and_report+0x2a/0xd0
 ? init_object+0x77/0xd8
 ? alloc_debug_processing+0x38/0x12c
 ? _raw_spin_unlock_irqrestore+0xb/0x18
 ? __radix_tree_replace+0xb8/0xcc
 ? radix_tree_iter_tag_clear+0x18/0x28
 ? idr_alloc_u32+0x81/0xa0
 ? idr_alloc_cyclic+0x38/0x7c
 ? __kernfs_new_node+0x117/0x164
 ? check_bytes_and_report+0x2a/0xd0
 ? init_object+0x77/0xd8
 ? alloc_debug_processing+0x38/0x12c
 ? _raw_spin_unlock_irqrestore+0xb/0x18
 ? ___slab_alloc+0x38b/0x700
 ? 0xf80ac000
 do_init_module+0x50/0x1ac
 load_module+0xd54/0xe94
 __ia32_sys_finit_module+0x1b0/0x250
 ia32_sys_call+0x270b/0x2e08
 __do_fast_syscall_32+0x88/0xb4
 ? __ia32_sys_openat+0x19/0x24
 ? syscall_exit_to_user_mode+0x6c/0x78
 ? __do_fast_syscall_32+0x92/0xb4
 ? lock_mm_and_find_vma+0x2a/0xd0
 ? do_user_addr_fault+0x1c4/0x2b0
 ? irqentry_exit_to_user_mode+0x60/0x6c
 do_fast_syscall_32+0x29/0x58
 do_SYSENTER_32+0x12/0x18
 entry_SYSENTER_32+0x98/0xf8
EIP: 0xb7f8d539
Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 0f 1f 00 58 b8 77 00 00 00 cd 80 90 0f 1f
EAX: ffffffda EBX: 0000001c ECX: b7b7b54c EDX: 00000000
ESI: 0175c540 EDI: 00000001 EBP: 00000007 ESP: bfae9aac
DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200246
---[ end trace 0000000000000000 ]---


I applied "[PATCH v2] drm/radeon: add late_register for connector" hoping this would help but it didn't make a difference.

Some details about the Mobility Radeon X1300:
 # lspci -s 01:00.0 -v
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] RV515/M52 [Mobility Radeon X1300] (prog-if 00 [VGA controller])
	Subsystem: Lenovo Device 2005
	Flags: bus master, fast devsel, latency 0, IRQ 16
	Memory at d8000000 (32-bit, prefetchable) [size=128M]
	I/O ports at 2000 [size=256]
	Memory at ee100000 (32-bit, non-prefetchable) [size=64K]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
	Capabilities: [50] Power Management version 2
	Capabilities: [58] Express Legacy Endpoint, IntMsgNum 0
	Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit+
	Kernel driver in use: radeon
	Kernel modules: radeon

Regards,
Erhard
