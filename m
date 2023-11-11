Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2BD7E8944
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 05:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961E310E0BB;
	Sat, 11 Nov 2023 04:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F5910E0BB
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:55:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39945CE1727
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45295C433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699678498;
 bh=QWWcG343fIagMRm+38GBtaG0SztOf7wz9yxLmUCR4DM=;
 h=From:To:Subject:Date:From;
 b=YH3zoOMmEv41TXYkU1E20zqfm60C6PPlx8+CNngGcq0yBi9MvIGeADSPn/foiE/80
 Y2XnteOVe40km72hO1HK1NwagQAPcNMRbOQ9DbdZXRCyXHlM+DlBY0IzZDbiBIT12u
 BFJxJQBAvgB3DMGSfd8uz+rpY+5dkHw1auSU7ylvwTKSPz2NYwmO6pIQ6Pl+gZuxyp
 Uy0IYvekY0JLDkFEO0t6vfTwmnezhPHGSoSWjuppHSSg2E2OE4aMlYAliV7pTef2jH
 0RZQzxieJy5i7ifT0oUBMmaK4ihsOQoFnrR5h7DjgsvsEgnTwl2AbKZpEe4ha0ZfbI
 Dw/ztzsiSc7CQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 29EB7C53BD0; Sat, 11 Nov 2023 04:54:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218133] New: kernel panic when opening spotify 6.5.0.10.12
 ubuntu 23.10
Date: Sat, 11 Nov 2023 04:54:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpollind@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218133-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218133

            Bug ID: 218133
           Summary: kernel panic when opening spotify 6.5.0.10.12 ubuntu
                    23.10
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mpollind@gmail.com
        Regression: No

this problem does not happen when I downgrade my kernel to 6.3.7.


Linux version 6.5.0-10-generic (buildd@lcy02-amd64-118)
(x86_64-linux-gnu-gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0, GNU ld (GNU Binut=
ils
for Ubuntu) 2.41) #10-Ubuntu SMP PREEMPT_DYNAMIC Fri Oct 13 13:49:38 UTC 20=
23

-----

Nov 10 20:31:06 michaelpollind kernel: UBSAN: array-index-out-of-bounds in
/build/linux-UiLXaH/linux-6.5.0/drivers/gpu/drm/amd/amdgpu/../pm/powerplay/=
hwmgr/vega10_processpptables.c:361:55
Nov 10 20:31:06 michaelpollind kernel: index 2 is out of range for type
'ATOM_Vega10_MM_Dependency_Record [1]'
Nov 10 20:31:06 michaelpollind kernel: CPU: 10 PID: 343 Comm: (udev-worker)=
 Not
tainted 6.5.0-10-generic #10-Ubuntu
Nov 10 20:31:06 michaelpollind kernel: Hardware name: Gigabyte Technology C=
o.,
Ltd. X670E AORUS MASTER/X670E AORUS MASTER, BIOS F13d 09/14/2023
Nov 10 20:31:06 michaelpollind kernel: Call Trace:
Nov 10 20:31:06 michaelpollind kernel:  <TASK>
Nov 10 20:31:06 michaelpollind kernel:  dump_stack_lvl+0x48/0x70
Nov 10 20:31:06 michaelpollind kernel:  dump_stack+0x10/0x20
Nov 10 20:31:06 michaelpollind kernel:  __ubsan_handle_out_of_bounds+0xc6/0=
x110
Nov 10 20:31:06 michaelpollind kernel:=20
init_powerplay_extended_tables+0x6e7/0xab0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  vega10_pp_tables_initialize+0x156/0=
x4e0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  hwmgr_hw_init+0x78/0x1e0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  pp_hw_init+0x16/0x50 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_ip_init+0x48b/0x900
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_init+0x975/0x1160
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_driver_load_kms+0x1a/0x1c0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_pci_probe+0x175/0x490 [amdgp=
u]
Nov 10 20:31:06 michaelpollind kernel:  local_pci_probe+0x44/0xb0
Nov 10 20:31:06 michaelpollind kernel:  pci_call_probe+0x55/0x190
Nov 10 20:31:06 michaelpollind kernel:  pci_device_probe+0x84/0x120
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  really_probe+0x1c4/0x410
Nov 10 20:31:06 michaelpollind kernel:  __driver_probe_device+0x8c/0x180
Nov 10 20:31:06 michaelpollind kernel:  driver_probe_device+0x24/0xd0
Nov 10 20:31:06 michaelpollind kernel:  __driver_attach+0x10b/0x210
Nov 10 20:31:06 michaelpollind kernel:  ? __pfx___driver_attach+0x10/0x10
Nov 10 20:31:06 michaelpollind kernel:  bus_for_each_dev+0x8a/0xf0
Nov 10 20:31:06 michaelpollind kernel:  driver_attach+0x1e/0x30
Nov 10 20:31:06 michaelpollind kernel:  bus_add_driver+0x127/0x240
Nov 10 20:31:06 michaelpollind kernel:  driver_register+0x5e/0x130
Nov 10 20:31:06 michaelpollind kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdg=
pu]
Nov 10 20:31:06 michaelpollind kernel:  __pci_register_driver+0x62/0x70
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_init+0x69/0xff0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  do_one_initcall+0x5b/0x340
Nov 10 20:31:06 michaelpollind kernel:  do_init_module+0x91/0x290
Nov 10 20:31:06 michaelpollind kernel:  load_module+0xba1/0xcf0
Nov 10 20:31:06 michaelpollind kernel:  ? vfree+0xff/0x2d0
Nov 10 20:31:06 michaelpollind kernel:  init_module_from_file+0x96/0x100
Nov 10 20:31:06 michaelpollind kernel:  ? init_module_from_file+0x96/0x100
Nov 10 20:31:06 michaelpollind kernel:  idempotent_init_module+0x11c/0x2b0
Nov 10 20:31:06 michaelpollind kernel:  __x64_sys_finit_module+0x64/0xd0
Nov 10 20:31:06 michaelpollind kernel:  do_syscall_64+0x59/0x90
Nov 10 20:31:06 michaelpollind kernel:  ? exit_to_user_mode_prepare+0x9b/0x=
b0
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  ? syscall_exit_to_user_mode+0x37/0x=
60
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  ? do_syscall_64+0x68/0x90
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  ? do_syscall_64+0x68/0x90
Nov 10 20:31:06 michaelpollind kernel:=20
entry_SYSCALL_64_after_hwframe+0x6e/0xd8
Nov 10 20:31:06 michaelpollind kernel: RIP: 0033:0x7f0dac788c7d
Nov 10 20:31:06 michaelpollind kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 =
00
00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c =
8b
4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6b 81 0d 00 f7 d8 64 8=
9 01
48
Nov 10 20:31:06 michaelpollind kernel: RSP: 002b:00007ffc6df452d8 EFLAGS:
00000246 ORIG_RAX: 0000000000000139
Nov 10 20:31:06 michaelpollind kernel: RAX: ffffffffffffffda RBX:
0000555928ce21e0 RCX: 00007f0dac788c7d
Nov 10 20:31:06 michaelpollind kernel: RDX: 0000000000000004 RSI:
00007f0dac90444a RDI: 0000000000000017
Nov 10 20:31:06 michaelpollind kernel: RBP: 00007f0dac90444a R08:
0000000000000040 R09: fffffffffffffde0
Nov 10 20:31:06 michaelpollind kernel: R10: fffffffffffffe18 R11:
0000000000000246 R12: 0000000000020000
Nov 10 20:31:06 michaelpollind kernel: R13: 0000555928cccca0 R14:
0000000000000000 R15: 0000555928cce110
Nov 10 20:31:06 michaelpollind kernel:  </TASK>
Nov 10 20:31:06 michaelpollind kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Nov 10 20:31:06 michaelpollind kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Nov 10 20:31:06 michaelpollind kernel: UBSAN: array-index-out-of-bounds in
/build/linux-UiLXaH/linux-6.5.0/drivers/gpu/drm/amd/amdgpu/../pm/powerplay/=
hwmgr/vega10_processpptables.c:585:27
Nov 10 20:31:06 michaelpollind kernel: index 1 is out of range for type
'ATOM_Vega10_CLK_Dependency_Record [1]'
Nov 10 20:31:06 michaelpollind kernel: CPU: 10 PID: 343 Comm: (udev-worker)=
 Not
tainted 6.5.0-10-generic #10-Ubuntu
Nov 10 20:31:06 michaelpollind kernel: Hardware name: Gigabyte Technology C=
o.,
Ltd. X670E AORUS MASTER/X670E AORUS MASTER, BIOS F13d 09/14/2023
Nov 10 20:31:06 michaelpollind kernel: Call Trace:
Nov 10 20:31:06 michaelpollind kernel:  <TASK>
Nov 10 20:31:06 michaelpollind kernel:  dump_stack_lvl+0x48/0x70
Nov 10 20:31:06 michaelpollind kernel:  dump_stack+0x10/0x20
Nov 10 20:31:06 michaelpollind kernel:  __ubsan_handle_out_of_bounds+0xc6/0=
x110
Nov 10 20:31:06 michaelpollind kernel:=20
init_powerplay_extended_tables+0x886/0xab0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  vega10_pp_tables_initialize+0x156/0=
x4e0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  hwmgr_hw_init+0x78/0x1e0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  pp_hw_init+0x16/0x50 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_ip_init+0x48b/0x900
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_init+0x975/0x1160
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_driver_load_kms+0x1a/0x1c0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_pci_probe+0x175/0x490 [amdgp=
u]
Nov 10 20:31:06 michaelpollind kernel:  local_pci_probe+0x44/0xb0
Nov 10 20:31:06 michaelpollind kernel:  pci_call_probe+0x55/0x190
Nov 10 20:31:06 michaelpollind kernel:  pci_device_probe+0x84/0x120
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  really_probe+0x1c4/0x410
Nov 10 20:31:06 michaelpollind kernel:  __driver_probe_device+0x8c/0x180
Nov 10 20:31:06 michaelpollind kernel:  driver_probe_device+0x24/0xd0
Nov 10 20:31:06 michaelpollind kernel:  __driver_attach+0x10b/0x210
Nov 10 20:31:06 michaelpollind kernel:  ? __pfx___driver_attach+0x10/0x10
Nov 10 20:31:06 michaelpollind kernel:  bus_for_each_dev+0x8a/0xf0
Nov 10 20:31:06 michaelpollind kernel:  driver_attach+0x1e/0x30
Nov 10 20:31:06 michaelpollind kernel:  bus_add_driver+0x127/0x240
Nov 10 20:31:06 michaelpollind kernel:  driver_register+0x5e/0x130
Nov 10 20:31:06 michaelpollind kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdg=
pu]
Nov 10 20:31:06 michaelpollind kernel:  __pci_register_driver+0x62/0x70
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_init+0x69/0xff0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  do_one_initcall+0x5b/0x340
Nov 10 20:31:06 michaelpollind kernel:  do_init_module+0x91/0x290
Nov 10 20:31:06 michaelpollind kernel:  load_module+0xba1/0xcf0
Nov 10 20:31:06 michaelpollind kernel:  ? vfree+0xff/0x2d0
Nov 10 20:31:06 michaelpollind kernel:  init_module_from_file+0x96/0x100
Nov 10 20:31:06 michaelpollind kernel:  ? init_module_from_file+0x96/0x100
Nov 10 20:31:06 michaelpollind kernel:  idempotent_init_module+0x11c/0x2b0
Nov 10 20:31:06 michaelpollind kernel:  __x64_sys_finit_module+0x64/0xd0
Nov 10 20:31:06 michaelpollind kernel:  do_syscall_64+0x59/0x90
Nov 10 20:31:06 michaelpollind kernel:  ? exit_to_user_mode_prepare+0x9b/0x=
b0
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  ? syscall_exit_to_user_mode+0x37/0x=
60
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  ? do_syscall_64+0x68/0x90
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  ? do_syscall_64+0x68/0x90
Nov 10 20:31:06 michaelpollind kernel:=20
entry_SYSCALL_64_after_hwframe+0x6e/0xd8
Nov 10 20:31:06 michaelpollind kernel: RIP: 0033:0x7f0dac788c7d
Nov 10 20:31:06 michaelpollind kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 =
00
00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c =
8b
4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6b 81 0d 00 f7 d8 64 8=
9 01
48
Nov 10 20:31:06 michaelpollind kernel: RSP: 002b:00007ffc6df452d8 EFLAGS:
00000246 ORIG_RAX: 0000000000000139
Nov 10 20:31:06 michaelpollind kernel: RAX: ffffffffffffffda RBX:
0000555928ce21e0 RCX: 00007f0dac788c7d
Nov 10 20:31:06 michaelpollind kernel: RDX: 0000000000000004 RSI:
00007f0dac90444a RDI: 0000000000000017
Nov 10 20:31:06 michaelpollind kernel: RBP: 00007f0dac90444a R08:
0000000000000040 R09: fffffffffffffde0
Nov 10 20:31:06 michaelpollind kernel: R10: fffffffffffffe18 R11:
0000000000000246 R12: 0000000000020000
Nov 10 20:31:06 michaelpollind kernel: R13: 0000555928cccca0 R14:
0000000000000000 R15: 0000555928cce110
Nov 10 20:31:06 michaelpollind kernel:  </TASK>
Nov 10 20:31:06 michaelpollind kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Nov 10 20:31:06 michaelpollind kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Nov 10 20:31:06 michaelpollind kernel: UBSAN: array-index-out-of-bounds in
/build/linux-UiLXaH/linux-6.5.0/drivers/gpu/drm/amd/amdgpu/../pm/powerplay/=
hwmgr/vega10_processpptables.c:587:5
Nov 10 20:31:06 michaelpollind kernel: index 1 is out of range for type
'ATOM_Vega10_CLK_Dependency_Record [1]'
Nov 10 20:31:06 michaelpollind kernel: CPU: 10 PID: 343 Comm: (udev-worker)=
 Not
tainted 6.5.0-10-generic #10-Ubuntu
Nov 10 20:31:06 michaelpollind kernel: Hardware name: Gigabyte Technology C=
o.,
Ltd. X670E AORUS MASTER/X670E AORUS MASTER, BIOS F13d 09/14/2023
Nov 10 20:31:06 michaelpollind kernel: Call Trace:
Nov 10 20:31:06 michaelpollind kernel:  <TASK>
Nov 10 20:31:06 michaelpollind kernel:  dump_stack_lvl+0x48/0x70
Nov 10 20:31:06 michaelpollind kernel:  dump_stack+0x10/0x20
Nov 10 20:31:06 michaelpollind kernel:  __ubsan_handle_out_of_bounds+0xc6/0=
x110
Nov 10 20:31:06 michaelpollind kernel:=20
init_powerplay_extended_tables+0x8e9/0xab0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  vega10_pp_tables_initialize+0x156/0=
x4e0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  hwmgr_hw_init+0x78/0x1e0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  pp_hw_init+0x16/0x50 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_ip_init+0x48b/0x900
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_init+0x975/0x1160
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_driver_load_kms+0x1a/0x1c0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_pci_probe+0x175/0x490 [amdgp=
u]
Nov 10 20:31:06 michaelpollind kernel:  local_pci_probe+0x44/0xb0
Nov 10 20:31:06 michaelpollind kernel:  pci_call_probe+0x55/0x190
Nov 10 20:31:06 michaelpollind kernel:  pci_device_probe+0x84/0x120
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  really_probe+0x1c4/0x410
Nov 10 20:31:06 michaelpollind kernel:  __driver_probe_device+0x8c/0x180
Nov 10 20:31:06 michaelpollind kernel:  driver_probe_device+0x24/0xd0
Nov 10 20:31:06 michaelpollind kernel:  __driver_attach+0x10b/0x210
Nov 10 20:31:06 michaelpollind kernel:  ? __pfx___driver_attach+0x10/0x10
Nov 10 20:31:06 michaelpollind kernel:  bus_for_each_dev+0x8a/0xf0
Nov 10 20:31:06 michaelpollind kernel:  driver_attach+0x1e/0x30
Nov 10 20:31:06 michaelpollind kernel:  bus_add_driver+0x127/0x240
Nov 10 20:31:06 michaelpollind kernel:  driver_register+0x5e/0x130
Nov 10 20:31:06 michaelpollind kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdg=
pu]
Nov 10 20:31:06 michaelpollind kernel:  __pci_register_driver+0x62/0x70
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_init+0x69/0xff0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  do_one_initcall+0x5b/0x340
Nov 10 20:31:06 michaelpollind kernel:  do_init_module+0x91/0x290
Nov 10 20:31:06 michaelpollind kernel:  load_module+0xba1/0xcf0
Nov 10 20:31:06 michaelpollind kernel:  ? vfree+0xff/0x2d0
Nov 10 20:31:06 michaelpollind kernel:  init_module_from_file+0x96/0x100
Nov 10 20:31:06 michaelpollind kernel:  ? init_module_from_file+0x96/0x100
Nov 10 20:31:06 michaelpollind kernel:  idempotent_init_module+0x11c/0x2b0
Nov 10 20:31:06 michaelpollind kernel:  __x64_sys_finit_module+0x64/0xd0
Nov 10 20:31:06 michaelpollind kernel:  do_syscall_64+0x59/0x90
Nov 10 20:31:06 michaelpollind kernel:  ? exit_to_user_mode_prepare+0x9b/0x=
b0
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  ? syscall_exit_to_user_mode+0x37/0x=
60
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  ? do_syscall_64+0x68/0x90
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  ? do_syscall_64+0x68/0x90
Nov 10 20:31:06 michaelpollind kernel:=20
entry_SYSCALL_64_after_hwframe+0x6e/0xd8
Nov 10 20:31:06 michaelpollind kernel: RIP: 0033:0x7f0dac788c7d
Nov 10 20:31:06 michaelpollind kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 =
00
00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c =
8b
4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6b 81 0d 00 f7 d8 64 8=
9 01
48
Nov 10 20:31:06 michaelpollind kernel: RSP: 002b:00007ffc6df452d8 EFLAGS:
00000246 ORIG_RAX: 0000000000000139
Nov 10 20:31:06 michaelpollind kernel: RAX: ffffffffffffffda RBX:
0000555928ce21e0 RCX: 00007f0dac788c7d
Nov 10 20:31:06 michaelpollind kernel: RDX: 0000000000000004 RSI:
00007f0dac90444a RDI: 0000000000000017
Nov 10 20:31:06 michaelpollind kernel: RBP: 00007f0dac90444a R08:
0000000000000040 R09: fffffffffffffde0
Nov 10 20:31:06 michaelpollind kernel: R10: fffffffffffffe18 R11:
0000000000000246 R12: 0000000000020000
Nov 10 20:31:06 michaelpollind kernel: R13: 0000555928cccca0 R14:
0000000000000000 R15: 0000555928cce110
Nov 10 20:31:06 michaelpollind kernel:  </TASK>
Nov 10 20:31:06 michaelpollind kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Nov 10 20:31:06 michaelpollind kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Nov 10 20:31:06 michaelpollind kernel: UBSAN: array-index-out-of-bounds in
/build/linux-UiLXaH/linux-6.5.0/drivers/gpu/drm/amd/amdgpu/../pm/powerplay/=
hwmgr/vega10_processpptables.c:714:27
Nov 10 20:31:06 michaelpollind kernel: index 1 is out of range for type
'ATOM_Vega10_CLK_Dependency_Record [1]'
Nov 10 20:31:06 michaelpollind kernel: CPU: 10 PID: 343 Comm: (udev-worker)=
 Not
tainted 6.5.0-10-generic #10-Ubuntu
Nov 10 20:31:06 michaelpollind kernel: Hardware name: Gigabyte Technology C=
o.,
Ltd. X670E AORUS MASTER/X670E AORUS MASTER, BIOS F13d 09/14/2023
Nov 10 20:31:06 michaelpollind kernel: Call Trace:
Nov 10 20:31:06 michaelpollind kernel:  <TASK>
Nov 10 20:31:06 michaelpollind kernel:  dump_stack_lvl+0x48/0x70
Nov 10 20:31:06 michaelpollind kernel:  dump_stack+0x10/0x20
Nov 10 20:31:06 michaelpollind kernel:  __ubsan_handle_out_of_bounds+0xc6/0=
x110
Nov 10 20:31:06 michaelpollind kernel:=20
get_pix_clk_voltage_dependency_table.isra.0+0xf9/0x130 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:=20
init_powerplay_extended_tables+0x42f/0xab0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  vega10_pp_tables_initialize+0x156/0=
x4e0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  hwmgr_hw_init+0x78/0x1e0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  pp_hw_init+0x16/0x50 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_ip_init+0x48b/0x900
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_init+0x975/0x1160
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_driver_load_kms+0x1a/0x1c0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_pci_probe+0x175/0x490 [amdgp=
u]
Nov 10 20:31:06 michaelpollind kernel:  local_pci_probe+0x44/0xb0
Nov 10 20:31:06 michaelpollind kernel:  pci_call_probe+0x55/0x190
Nov 10 20:31:06 michaelpollind kernel:  pci_device_probe+0x84/0x120
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  really_probe+0x1c4/0x410
Nov 10 20:31:06 michaelpollind kernel:  __driver_probe_device+0x8c/0x180
Nov 10 20:31:06 michaelpollind kernel:  driver_probe_device+0x24/0xd0
Nov 10 20:31:06 michaelpollind kernel:  __driver_attach+0x10b/0x210
Nov 10 20:31:06 michaelpollind kernel:  ? __pfx___driver_attach+0x10/0x10
Nov 10 20:31:06 michaelpollind kernel:  bus_for_each_dev+0x8a/0xf0
lines 1606-1634
Nov 10 20:31:06 michaelpollind kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Nov 10 20:31:06 michaelpollind kernel: UBSAN: array-index-out-of-bounds in
/build/linux-UiLXaH/linux-6.5.0/drivers/gpu/drm/amd/amdgpu/../pm/powerplay/=
hwmgr/vega10_processpptables.c:714:27
Nov 10 20:31:06 michaelpollind kernel: index 1 is out of range for type
'ATOM_Vega10_CLK_Dependency_Record [1]'
Nov 10 20:31:06 michaelpollind kernel: CPU: 10 PID: 343 Comm: (udev-worker)=
 Not
tainted 6.5.0-10-generic #10-Ubuntu
Nov 10 20:31:06 michaelpollind kernel: Hardware name: Gigabyte Technology C=
o.,
Ltd. X670E AORUS MASTER/X670E AORUS MASTER, BIOS F13d 09/14/2023
Nov 10 20:31:06 michaelpollind kernel: Call Trace:
Nov 10 20:31:06 michaelpollind kernel:  <TASK>
Nov 10 20:31:06 michaelpollind kernel:  dump_stack_lvl+0x48/0x70
Nov 10 20:31:06 michaelpollind kernel:  dump_stack+0x10/0x20
Nov 10 20:31:06 michaelpollind kernel:  __ubsan_handle_out_of_bounds+0xc6/0=
x110
Nov 10 20:31:06 michaelpollind kernel:=20
get_pix_clk_voltage_dependency_table.isra.0+0xf9/0x130 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:=20
init_powerplay_extended_tables+0x42f/0xab0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  vega10_pp_tables_initialize+0x156/0=
x4e0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  hwmgr_hw_init+0x78/0x1e0 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  pp_hw_init+0x16/0x50 [amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_ip_init+0x48b/0x900
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_device_init+0x975/0x1160
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_driver_load_kms+0x1a/0x1c0
[amdgpu]
Nov 10 20:31:06 michaelpollind kernel:  amdgpu_pci_probe+0x175/0x490 [amdgp=
u]
Nov 10 20:31:06 michaelpollind kernel:  local_pci_probe+0x44/0xb0
Nov 10 20:31:06 michaelpollind kernel:  pci_call_probe+0x55/0x190
Nov 10 20:31:06 michaelpollind kernel:  pci_device_probe+0x84/0x120
Nov 10 20:31:06 michaelpollind kernel:  ? srso_alias_return_thunk+0x5/0x7f
Nov 10 20:31:06 michaelpollind kernel:  really_probe+0x1c4/0x410
Nov 10 20:31:06 michaelpollind kernel:  __driver_probe_device+0x8c/0x180
Nov 10 20:31:06 michaelpollind kernel:  driver_probe_device+0x24/0xd0
Nov 10 20:31:06 michaelpollind kernel:  __driver_attach+0x10b/0x210
Nov 10 20:31:06 michaelpollind kernel:  ? __pfx___driver_attach+0x10/0x10
Nov 10 20:31:06 michaelpollind kernel:  bus_for_each_dev+0x8a/0xf0
Nov 10 20:31:06 michaelpollind kernel:  driver_attach+0x1e/0x30
Nov 10 20:31:06 michaelpollind kernel:  bus_add_driver+0x127/0x240

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
