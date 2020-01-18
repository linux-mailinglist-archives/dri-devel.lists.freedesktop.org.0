Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551DB141774
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 13:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFD489FF9;
	Sat, 18 Jan 2020 12:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F20E89FF9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 12:24:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206247] New: 5.4.x: WARNING: CPU: 1 PID: 561 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1464
 dcn_bw_update_from_pplib+0xa5/0x2e0 [amdgpu]
Date: Sat, 18 Jan 2020 12:24:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: udovdh@xs4all.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206247-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=206247

            Bug ID: 206247
           Summary: 5.4.x: WARNING: CPU: 1 PID: 561 at
                    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_cal
                    cs.c:1464 dcn_bw_update_from_pplib+0xa5/0x2e0 [amdgpu]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.x
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: udovdh@xs4all.nl
        Regression: No

[   35.250541] ------------[ cut here ]------------
[   35.278240] WARNING: CPU: 1 PID: 561 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1464
dcn_bw_update_from_pplib+0xa5/0x2e0 [amdgpu]
[   35.357964] Modules linked in: amdgpu(+) gpu_sched hid_generic aesni_intel
ttm sr_mod cdrom usbhid i2c_dev autofs4
[   35.419996] CPU: 1 PID: 561 Comm: systemd-udevd Not tainted 5.4.13 #13
[   35.459106] Hardware name: Gigabyte Technology Co., Ltd. X570 AORUS PRO/X570
AORUS PRO, BIOS F11 12/06/2019
[   35.517545] RIP: 0010:dcn_bw_update_from_pplib+0xa5/0x2e0 [amdgpu]
[   35.554572] Code: 0c 24 85 c9 74 24 8d 71 ff 48 8d 44 24 04 48 8d 54 f4 0c
eb 0d 48 83 c0 08 48 39 d0 0f 84 2a 01 00 00 44 8b 00 45 85 c0 75 eb <0f> 0b e8
84 9e 93 e7 4c 89 e2 be 04 00 00 00 4c 89 ef e8 54 59 fe
[   35.667119] RSP: 0018:ffffa45ac04fb6c0 EFLAGS: 00010246
[   35.698421] RAX: ffffa45ac04fb6c4 RBX: ffff9f808a330000 RCX:
0000000000000004
[   35.741178] RDX: ffffa45ac04fb6e4 RSI: 0000000000000003 RDI:
ffffffffa8deae51
[   35.783937] RBP: ffffa45ac04fb800 R08: 0000000000000000 R09:
00000000000003c5
[   35.826696] R10: 0000000000000002 R11: 00000000000000f0 R12:
ffffa45ac04fb750
[   35.869455] R13: ffff9f80865a8400 R14: 0000000000000001 R15:
000000000000000a
[   35.912212] FS:  00007f1f6579a940(0000) GS:ffff9f809ee40000(0000)
knlGS:0000000000000000
[   35.960700] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.995125] CR2: 000055fb7c7b9e98 CR3: 0000000409b72000 CR4:
00000000003406e0
[   36.037884] Call Trace:
[   36.052577]  dcn10_create_resource_pool+0x82d/0xb30 [amdgpu]
[   36.086480]  ? __kmalloc+0xeb/0xf0
[   36.106891]  dc_create_resource_pool+0xbe/0x130 [amdgpu]
[   36.138767]  dc_create+0x213/0x6b0 [amdgpu]
[   36.163871]  amdgpu_dm_init+0x138/0x1c0 [amdgpu]
[   36.191574]  ? phm_wait_for_register_unequal.part.0+0x4a/0x80 [amdgpu]
[   36.230741]  dm_hw_init+0x9/0x20 [amdgpu]
[   36.254801]  amdgpu_device_init.cold+0x119b/0x1344 [amdgpu]
[   36.288230]  amdgpu_driver_load_kms+0x41/0xc0 [amdgpu]
[   36.319020]  drm_dev_register+0x10c/0x150
[   36.343071]  amdgpu_pci_probe+0xcd/0x130 [amdgpu]
[   36.371257]  ? pci_match_device+0xd2/0x100
[   36.395787]  pci_device_probe+0xc9/0x140
[   36.419277]  really_probe+0x142/0x3b0
[   36.441204]  device_driver_attach+0x4e/0x60
[   36.466254]  __driver_attach+0x85/0x140
[   36.489221]  ? device_driver_attach+0x60/0x60
[   36.515314]  bus_for_each_dev+0x73/0xb0
[   36.538283]  bus_add_driver+0x13f/0x1e0
[   36.561249]  driver_register+0x67/0xb0
[   36.583694]  ? 0xffffffffc0389000
[   36.603540]  do_one_initcall+0x47/0x16f
[   36.626507]  ? ___cache_free+0x2c/0x1f0
[   36.649475]  do_init_module+0x51/0x200
[   36.671921]  load_module+0x24b6/0x26e0
[   36.694370]  ? vfs_read+0xee/0x120
[   36.714733]  ? __do_sys_finit_module+0xaa/0x110
[   36.741866]  __do_sys_finit_module+0xaa/0x110
[   36.767960]  do_syscall_64+0x63/0x410
[   36.789886]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   36.820144] RIP: 0033:0x7f1f667401ad
[   36.841551] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d ab 5c 0c 00 f7 d8 64 89 01 48
[   36.954097] RSP: 002b:00007fffc9e46388 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   36.999461] RAX: ffffffffffffffda RBX: 000055fb7c7ef480 RCX:
00007f1f667401ad
[   37.042217] RDX: 0000000000000000 RSI: 000055fb7c7e2aa0 RDI:
000000000000000f
[   37.084976] RBP: 0000000000020000 R08: 0000000000000000 R09:
0000000000000007
[   37.127736] R10: 000000000000000f R11: 0000000000000246 R12:
000055fb7c7e2aa0
[   37.170493] R13: 0000000000000000 R14: 000055fb7c7e7c40 R15:
000055fb7c7ef480
[   37.213251] ---[ end trace fdc62e5509be6ed6 ]---

This bootuip message has been shown for quite a while

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
