Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F284C2D0F4
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 17:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7182810E14B;
	Mon,  3 Nov 2025 16:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PXvOD4xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8C010E14B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 16:19:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EFCAF41B70
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 16:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE1D7C113D0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762186742;
 bh=o/HUj+nSwXUjHtzIwK+7YX+AKqsoxOfZoC6I+rA4qbw=;
 h=From:To:Subject:Date:From;
 b=PXvOD4xg7cHmzLngtIMpq96nVLy3LQ5Mcxv+ycf4aUYRhsKeyOizpz572P5cHQRFN
 RFKxnOlsDvWnHwvyRAwMG6AFgLNA77kT7F3Bu4l/yTCw9CAkd8pKuxGF6DKGyXFSM0
 0IbzNhNTsyAylwTNTIjmuPTbyKqiogKC+fem/3Rq+1XBpuDoFrlrYZFcj4TVb0IoyP
 Bm9Wv37Inpjws6qxAkljPekoYG7Uty2Sg//84PrN41uHmkVyFfHWDo6eeiAtVRTcpT
 zkFYcqhBupG7tNIGmcxUtzHI2Y0CVtclZKbYplRVNod4SirqhgGaCXoRvmFV1UGVfL
 PZNSVfxAb0PUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C8B1BC41613; Mon,  3 Nov 2025 16:19:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220742] New: UBSAN: array-index-out-of-bounds in
 drivers/gpu/drm/radeon/radeon_atombios.c:2720:34 with AMD G-T56N
Date: Mon, 03 Nov 2025 16:19:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: federicoleva@tiscali.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220742-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D220742

            Bug ID: 220742
           Summary: UBSAN: array-index-out-of-bounds in
                    drivers/gpu/drm/radeon/radeon_atombios.c:2720:34 with
                    AMD G-T56N
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: federicoleva@tiscali.it
        Regression: No

Created attachment 308886
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308886&action=3Dedit
dmesg from AMD G-T56N

Booting kernel 6.17.1-300.fc43.x86_64 on an AMD G-T56N (Motherboard aE350x-=
HD
R1.03 55DE5100020) produces this stack trace:

----------------

[   11.958963] [drm] radeon kernel modesetting enabled.
[   11.959183] radeon 0000:00:01.0: vgaarb: deactivate vga console
[   11.959909] Console: switching to colour dummy device 80x25
[   11.960368] [drm] initializing kernel modesetting (PALM 0x1002:0x9806
0xA0A0:0x080A 0x00).
[   11.960591] ATOM BIOS: AMD
[   11.960713] radeon 0000:00:01.0: VRAM: 384M 0x0000000000000000 -
0x0000000017FFFFFF (384M used)
[   11.960724] radeon 0000:00:01.0: GTT: 1024M 0x0000000018000000 -
0x0000000057FFFFFF
[   11.960738] [drm] Detected VRAM RAM=3D384M, BAR=3D256M
[   11.960743] [drm] RAM width 32bits DDR
[   11.961254] [drm] radeon: 384M of VRAM memory ready
[   11.961265] [drm] radeon: 1024M of GTT memory ready.
[   11.961300] [drm] Loading PALM Microcode
[   11.983040] [drm] Internal thermal controller without fan control
[   11.983069] ------------[ cut here ]------------
[   11.983072] UBSAN: array-index-out-of-bounds in
drivers/gpu/drm/radeon/radeon_atombios.c:2720:34
[   11.983081] index 16 is out of range for type 'UCHAR [*]'
[   11.983090] CPU: 1 UID: 0 PID: 618 Comm: (udev-worker) Not tainted
6.17.1-300.fc43.x86_64 #1 PREEMPT(lazy)=20
[   11.983099] Hardware name: AOpen DE35-HD/aE350x-HD R1.03, BIOS R1.03
02/21/2013
[   11.983103] Call Trace:
[   11.983110]  <TASK>
[   11.983116]  dump_stack_lvl+0x5d/0x80
[   11.983129]  ubsan_epilogue+0x5/0x2b
[   11.983140]  __ubsan_handle_out_of_bounds.cold+0x54/0x59
[   11.983154]  radeon_atombios_parse_power_table_6+0x3bc/0x3e0 [radeon]
[   11.983547]  radeon_atombios_get_power_modes+0x220/0x240 [radeon]
[   11.983827]  radeon_pm_init_dpm+0x77/0x240 [radeon]
[   11.984120]  evergreen_init+0x154/0x2b0 [radeon]
[   11.984416]  radeon_device_init+0x484/0xa60 [radeon]
[   11.984663]  ? pci_find_capability+0x79/0xb0
[   11.984671]  radeon_driver_load_kms+0xa1/0x260 [radeon]
[   11.984919]  radeon_pci_probe+0xef/0x1b0 [radeon]
[   11.985165]  local_pci_probe+0x42/0x90
[   11.985173]  pci_call_probe+0x5b/0x190
[   11.985178]  ? kernfs_create_link+0x61/0xb0
[   11.985186]  pci_device_probe+0x95/0x140
[   11.985192]  really_probe+0xde/0x340
[   11.985199]  ? pm_runtime_barrier+0x55/0x90
[   11.985208]  __driver_probe_device+0x78/0x140
[   11.985215]  driver_probe_device+0x1f/0xa0
[   11.985221]  ? __pfx___driver_attach+0x10/0x10
[   11.985227]  __driver_attach+0xcb/0x1e0
[   11.985233]  bus_for_each_dev+0x85/0xd0
[   11.985240]  bus_add_driver+0x12f/0x210
[   11.985248]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
[   11.985489]  driver_register+0x75/0xe0
[   11.985495]  ? radeon_register_atpx_handler+0xe/0x30 [radeon]
[   11.985798]  do_one_initcall+0x5b/0x300
[   11.985813]  do_init_module+0x84/0x280
[   11.985821]  init_module_from_file+0x8a/0xe0
[   11.985831]  idempotent_init_module+0x114/0x310
[   11.985839]  __x64_sys_finit_module+0x6d/0xd0
[   11.985845]  ? syscall_trace_enter+0x8d/0x1d0
[   11.985853]  do_syscall_64+0x7e/0x250
[   11.985867]  ? vfs_read+0x165/0x390
[   11.985875]  ? vfs_read+0x165/0x390
[   11.985882]  ? __x64_sys_pread64+0x9c/0xd0
[   11.985888]  ? do_syscall_64+0xb6/0x250
[   11.985895]  ? __do_sys_newfstatat+0x3b/0x80
[   11.985903]  ? do_syscall_64+0xb6/0x250
[   11.985909]  ? do_syscall_64+0xb6/0x250
[   11.985915]  ? irqentry_exit_to_user_mode+0x2c/0x1c0
[   11.985921]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   11.985928] RIP: 0033:0x7f9d7327734d
[   11.985947] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 83 6a 0f 00 f7 d8 64 89 01 48
[   11.985953] RSP: 002b:00007ffce08c2738 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   11.985961] RAX: ffffffffffffffda RBX: 000055980313aa40 RCX:
00007f9d7327734d
[   11.985964] RDX: 0000000000000004 RSI: 00007f9d729175e1 RDI:
000000000000003c
[   11.985967] RBP: 00007ffce08c27d0 R08: 0000000000000000 R09:
0000559803141710
[   11.985970] R10: 0000000000000000 R11: 0000000000000246 R12:
00007f9d729175e1
[   11.985973] R13: 0000000000020000 R14: 000055980313b000 R15:
0000000000000000
[   11.985979]  </TASK>
[   11.986103] ---[ end trace ]---
[   11.986279] [drm] Found smc ucode version: 0x00010601
[   11.986429] [drm] radeon: dpm initialized
[   12.019635] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   12.033668] [drm] PCIE GART of 1024M enabled (table at 0x000000000016200=
0).
[   12.033966] radeon 0000:00:01.0: WB enabled
[   12.033976] radeon 0000:00:01.0: fence driver on ring 0 uses gpu addr
0x0000000018000c00
[   12.033983] radeon 0000:00:01.0: fence driver on ring 3 uses gpu addr
0x0000000018000c0c
[   12.034441] radeon 0000:00:01.0: fence driver on ring 5 uses gpu addr
0x0000000000072118
[   12.034856] radeon 0000:00:01.0: radeon: MSI limited to 32-bit
[   12.035042] radeon 0000:00:01.0: radeon: using MSI.
[   12.035104] [drm] radeon: irq initialized.

------

Boot works but Wayland was very slow, not sure if hardware acceleration was
working. There are more logs at https://linux-hardware.org/?probe=3D13c250c=
955

(This is a mini-PC formerly used as POS with Windows. Just a retrocomputing
curiosity, but this CPU/APU architecture was quite popular in 2011 and some
might cling to it for its rather low power usage.)

Sorry if this is the wrong component, please forward where appropriate.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
