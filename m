Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD603192B7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 20:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E216E49D;
	Thu, 11 Feb 2021 19:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A62F6E49D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 19:02:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C090064DE3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 19:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1613070153;
 bh=eS3NKoKKzp2m0DErmxnWAWjfhgn4gmoac9IGlvppULU=;
 h=Date:From:To:Subject:From;
 b=YJlwpkqNvS81KfHpzougQm2ouloDE0xLJgnIjIIbJPWaVU2x3ezcU541/+jHBl4kz
 gjc/t5TnucI+BYsBuSEvwlas7QJIw0B9BrhJvc4QH+ZsqCmy8ZSkujcp+BlgjRpjLq
 CSRIfG48R/MKU8X33H54GpWm0hjjd0ywrwMMXNK4=
Date: Thu, 11 Feb 2021 11:02:32 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: dri-devel@lists.freedesktop.org
Subject: Fw: [Bug 211707] New: BUG: unable to handle page fault for address:
 ffffa147bdf6b91d
Message-Id: <20210211110232.dfcff34195ba6241b9bbd5d8@linux-foundation.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like a recent regression?

Begin forwarded message:

Date: Thu, 11 Feb 2021 14:27:43 +0000
From: bugzilla-daemon@bugzilla.kernel.org
To: akpm@linux-foundation.org
Subject: [Bug 211707] New: BUG: unable to handle page fault for address: ffffa147bdf6b91d


https://bugzilla.kernel.org/show_bug.cgi?id=211707

            Bug ID: 211707
           Summary: BUG: unable to handle page fault for address:
                    ffffa147bdf6b91d
           Product: Memory Management
           Version: 2.5
    Kernel Version: 5.11-rc7
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Page Allocator
          Assignee: akpm@linux-foundation.org
          Reporter: erhard_f@mailbox.org
                CC: michel@daenzer.net
        Regression: No

Created attachment 295231
  --> https://bugzilla.kernel.org/attachment.cgi?id=295231&action=edit
kernel dmesg (5.11-rc7, eMachines E620)

[...]
BUG: unable to handle page fault for address: ffffa147bdf6b91d
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 52001067 P4D 52001067 PUD 0 
Oops: 0000 [#1] SMP NOPTI
CPU: 1 PID: 623 Comm: udevd Not tainted 5.11.0-rc7-E620 #2
Hardware name: eMachines        eMachines E620  /Nile       , BIOS V1.03      
09/30/2008
RIP: 0010:get_freepointer+0x6/0x1a
Code: 89 f0 48 89 d6 48 89 ca 48 83 ef 70 49 8b 48 30 48 c7 c0 fb ff ff ff 48
85 c9 74 07 e8 f2 47 87 00 48 98 c3 8b 47 28 48 01 c6 <48> 8b 06 48 89 f2 48 33
87 b0 00 00 00 48 0f ca 48 31 d0 c3 48 8b
RSP: 0018:ffffac5c807cb898 EFLAGS: 00010286
RAX: 0000000000000030 RBX: ffffa14707082078 RCX: 000000000000022a
RDX: ffffa14702180980 RSI: ffffa147bdf6b91d RDI: ffffa14700042a00
RBP: 0000000000000dc0 R08: ffffa147bdf6b8ed R09: 0000000000000229
R10: 0000000000000000 R11: ffffa147070822d0 R12: ffffa14700042a00
R13: ffffa14700042a00 R14: 0000000000000050 R15: ffffffffc08b1d88
FS:  00007ff6aaf13b68(0000) GS:ffffa1472df00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffa147bdf6b91d CR3: 0000000104156000 CR4: 00000000000006e0
Call Trace:
 kmem_cache_alloc_trace+0x97/0x157
 radeon_ttm_tt_create+0x21/0x66 [radeon]
 ttm_tt_create+0x8d/0xa3 [ttm]
 ttm_bo_handle_move_mem+0x85/0xf9 [ttm]
 ? radeon_update_memory_usage+0x4b/0x4b [radeon]
 ttm_bo_validate+0x138/0x1aa [ttm]
 ttm_bo_init_reserved+0x282/0x2ba [ttm]
 ttm_bo_init+0x56/0x8f [ttm]
 ? radeon_update_memory_usage+0x4b/0x4b [radeon]
 radeon_bo_create+0x17d/0x255 [radeon]
 ? radeon_update_memory_usage+0x4b/0x4b [radeon]
 radeon_ring_init+0x3e/0x12d [radeon]
 r100_cp_init+0x1ea/0x469 [radeon]
 rs690_startup+0x114/0x196 [radeon]
 ? radeon_pm_init+0x607/0x626 [radeon]
 rs690_init+0x29f/0x2eb [radeon]
 radeon_device_init+0x899/0xa7d [radeon]
 radeon_driver_load_kms+0x83/0x15c [radeon]
 drm_dev_register+0xf4/0x1bc [drm]
 radeon_pci_probe+0x134/0x178 [radeon]
 pci_device_probe+0x95/0x104
 really_probe+0x144/0x326
 driver_probe_device+0x63/0x92
 device_driver_attach+0x37/0x50
 __driver_attach+0x8d/0x93
 ? device_driver_attach+0x50/0x50
 bus_for_each_dev+0x71/0xa7
 bus_add_driver+0x106/0x1b7
 driver_register+0x99/0xd2
 ? 0xffffffffc09da000
 do_one_initcall+0xe2/0x24a
 ? trace_kmalloc+0x9a/0xc7
 ? kmem_cache_alloc_trace+0x130/0x157
 do_init_module+0x56/0x1f5
 __do_sys_finit_module+0x94/0xbb
 do_syscall_64+0x33/0x40
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7ff6aaea39d8
Code: 4c 89 4c 24 48 4c 8b 4c 24 60 48 89 54 24 10 48 8b 7e 08 48 89 74 24 18
48 8b 51 18 c7 44 24 08 08 00 00 00 48 8b 76 10 0f 05 <48> 89 c7 e8 40 08 fe ff
48 83 c4 58 c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fffffd2e470 EFLAGS: 00000202 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 00007ff6aae1c9d0 RCX: 00007ff6aaea39d8
RDX: 0000000000000000 RSI: 00007ff6aae168e7 RDI: 000000000000001b
RBP: 0000000000020000 R08: 0000000000000000 R09: 00007ff6aaebb6dd
R10: 000000000000001b R11: 0000000000000202 R12: 0000000000000000
R13: 00007ff6aa487d30 R14: 00007ff6aae168e7 R15: 0000000000000000
Modules linked in: radeon(+) snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio mac80211 snd_hda_intel evdev snd_intel_dspcfg input_leds
snd_hda_codec led_class ath snd_hwdep psmouse snd_hda_core i2c_algo_bit lm83
drm_ttm_helper snd_pcm ohci_pci ttm snd_timer k8temp drm_kms_helper adm1021
hwmon snd ohci_hcd ehci_pci cfbfillrect soundcore syscopyarea cfbimgblt
cfg80211 ehci_hcd sysfillrect i2c_piix4 sysimgblt fb_sys_fops sr_mod usbcore
cfbcopyarea usb_common cdrom drm video drm_panel_orientation_quirks rfkill fb
battery libarc4 ac font fbdev backlight thermal button processor
CR2: ffffa147bdf6b91d
---[ end trace 1a80b76ad6066c81 ]---


Some data about the machine:

 # inxi -b
System:    Kernel: 5.11.0-rc7-E620 x86_64 bits: 64 Desktop: MATE 1.24.0 Distro:
Gentoo Base System release 2.7 
Machine:   Type: Laptop System: eMachines product: eMachines E620 v: V1.03
serial: LXN270Y0048480D3CA1601 
           Mobo: eMachines model: Nile serial: LXN270Y0048480D3CA1601 BIOS:
eMachines v: 1.03 date: 09/30/2008 
Battery:   ID-1: BAT1 charge: N/A condition: N/A 
CPU:       Info: Dual Core AMD Athlon X2 3250e [MCP] speed: 1496 MHz 
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] RS690M [Radeon Xpress
1200/1250/1270] driver: radeon v: kernel 
           Display: x11 server: X.Org 1.20.10 driver: ati,radeon unloaded:
fbdev,modesetting resolution: 1280x800~60Hz 
           OpenGL: renderer: ATI RS690 v: 2.1 Mesa 20.2.6 
Network:   Device-1: Qualcomm Atheros AR242x / AR542x Wireless Network Adapter
driver: ath5k 
           Device-2: Realtek RTL810xE PCI Express Fast Ethernet driver: r8169 
Drives:    Local Storage: total: 256.17 GiB used: 10.38 GiB (4.1%) 
Info:      Processes: 150 Uptime: 2m Memory: 3.59 GiB used: 403.2 MiB (11.0%)
Shell: Bash inxi: 3.1.06 


Probably connected to bug #211537.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
