Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF3137C81
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2020 10:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F736E22E;
	Sat, 11 Jan 2020 09:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0006E22E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 09:06:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205815] amdgpu: When playing a wine game, got black screen then
 screen flickers, game crashes and back to normal
Date: Sat, 11 Jan 2020 09:06:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ramaspaceship@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205815-2300-jNIUTJsCVx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205815-2300@https.bugzilla.kernel.org/>
References: <bug-205815-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=205815

--- Comment #2 from Bernard MAUDRY (ramaspaceship@free.fr) ---
Hi,

I moved to kernel 5.4.8.
And I got this first error at boot:
janv. 11 09:24:39 Rama kernel: ------------[ cut here ]------------
janv. 11 09:24:39 Rama kernel: WARNING: CPU: 2 PID: 168 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1464
dcn_bw_update_from_pplib+0xaa/0x2f0 [amdgpu]
janv. 11 09:24:39 Rama kernel: Modules linked in: amdgpu(+) gpu_sched
i2c_algo_bit ttm drm_kms_helper xhci_pci ahci xhci_hcd crc32c_intel libahci drm
libata i2c_piix4 nvme u
janv. 11 09:24:39 Rama kernel: CPU: 2 PID: 168 Comm: systemd-udevd Not tainted
5.4.0-2-amd64 #1 Debian 5.4.8-1
janv. 11 09:24:39 Rama kernel: Hardware name: Micro-Star International Co., Ltd
MS-7B86/B450-A PRO (MS-7B86), BIOS A.C0 11/08/2019
janv. 11 09:24:39 Rama kernel: RIP: 0010:dcn_bw_update_from_pplib+0xaa/0x2f0
[amdgpu]
janv. 11 09:24:39 Rama kernel: Code: 0c 24 85 c9 74 24 8d 71 ff 48 8d 44 24 04
48 8d 54 f4 0c eb 0d 48 83 c0 08 48 39 d0 0f 84 2e 01 00 00 44 8b 00 45 85 c0
75 eb <0f> 0b e8
janv. 11 09:24:39 Rama kernel: RSP: 0018:ffffa1434054b6b0 EFLAGS: 00010246
janv. 11 09:24:39 Rama kernel: RAX: ffffa1434054b6b4 RBX: ffff90a5bf9c0000 RCX:
0000000000000004
janv. 11 09:24:39 Rama kernel: RDX: ffffa1434054b6d4 RSI: 0000000000000003 RDI:
0000000000000247
janv. 11 09:24:39 Rama kernel: RBP: ffffa1434054b7f0 R08: 0000000000000000 R09:
0000000000000004
janv. 11 09:24:39 Rama kernel: R10: 0000000000000000 R11: 0000000000000001 R12:
ffffa1434054b740
janv. 11 09:24:39 Rama kernel: R13: ffff90a5bfe43300 R14: 0000000000000001 R15:
ffffa1434054b888
janv. 11 09:24:39 Rama kernel: FS:  00007f4d0e05ed40(0000)
GS:ffff90a5d0480000(0000) knlGS:0000000000000000
janv. 11 09:24:39 Rama kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
janv. 11 09:24:39 Rama kernel: CR2: 00007f4d0e049b2e CR3: 0000000381214000 CR4:
00000000003406e0
janv. 11 09:24:39 Rama kernel: Call Trace:
janv. 11 09:24:39 Rama kernel:  ? amdgpu_atom_execute_table_locked+0x12a/0x200
[amdgpu]
janv. 11 09:24:39 Rama kernel:  dcn10_create_resource_pool+0x832/0xb70 [amdgpu]
janv. 11 09:24:39 Rama kernel:  ? _cond_resched+0x15/0x30
janv. 11 09:24:39 Rama kernel:  ? __kmalloc+0x252/0x260
janv. 11 09:24:39 Rama kernel:  dc_create_resource_pool+0xc8/0x120 [amdgpu]
janv. 11 09:24:39 Rama kernel:  dc_create+0x23d/0x6d0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
janv. 11 09:24:39 Rama kernel:  amdgpu_dm_init+0x13d/0x1c0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  ?
phm_wait_for_register_unequal.part.0+0x50/0x80 [amdgpu]
janv. 11 09:24:39 Rama kernel:  dm_hw_init+0xe/0x20 [amdgpu]
janv. 11 09:24:39 Rama kernel:  amdgpu_device_init.cold+0x147b/0x1794 [amdgpu]
janv. 11 09:24:39 Rama kernel:  amdgpu_driver_load_kms+0x53/0x1a0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  drm_dev_register+0x111/0x150 [drm]
janv. 11 09:24:39 Rama kernel:  amdgpu_pci_probe+0x154/0x1b0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  local_pci_probe+0x42/0x80
janv. 11 09:24:39 Rama kernel:  pci_device_probe+0x104/0x1a0
janv. 11 09:24:39 Rama kernel:  really_probe+0x147/0x3c0
janv. 11 09:24:39 Rama kernel:  driver_probe_device+0xb6/0x100
janv. 11 09:24:39 Rama kernel:  device_driver_attach+0x53/0x60
janv. 11 09:24:39 Rama kernel:  __driver_attach+0x8a/0x150
janv. 11 09:24:39 Rama kernel:  ? device_driver_attach+0x60/0x60
janv. 11 09:24:39 Rama kernel:  bus_for_each_dev+0x78/0xc0
janv. 11 09:24:39 Rama kernel:  bus_add_driver+0x14d/0x1f0
janv. 11 09:24:39 Rama kernel:  driver_register+0x6c/0xc0
janv. 11 09:24:39 Rama kernel:  ? 0xffffffffc0b0b000
janv. 11 09:24:39 Rama kernel:  do_one_initcall+0x46/0x1f4
janv. 11 09:24:39 Rama kernel:  ? _cond_resched+0x15/0x30
janv. 11 09:24:39 Rama kernel:  ? kmem_cache_alloc_trace+0x1d4/0x210
janv. 11 09:24:39 Rama kernel:  ? do_init_module+0x23/0x230
janv. 11 09:24:39 Rama kernel:  do_init_module+0x5c/0x230
janv. 11 09:24:39 Rama kernel:  load_module+0x2359/0x2500
janv. 11 09:24:39 Rama kernel:  ? __do_sys_finit_module+0xaa/0x110
janv. 11 09:24:39 Rama kernel:  __do_sys_finit_module+0xaa/0x110
janv. 11 09:24:39 Rama kernel:  do_syscall_64+0x52/0x160
janv. 11 09:24:39 Rama kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
janv. 11 09:24:39 Rama kernel: RIP: 0033:0x7f4d0e84a0a9
janv. 11 09:24:39 Rama kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08
0f 05 <48> 3d 01
janv. 11 09:24:39 Rama kernel: RSP: 002b:00007ffcdc7e9aa8 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
janv. 11 09:24:39 Rama kernel: RAX: ffffffffffffffda RBX: 000055da6b197d70 RCX:
00007f4d0e84a0a9
janv. 11 09:24:39 Rama kernel: RDX: 0000000000000000 RSI: 00007f4d0e74dcad RDI:
0000000000000011
janv. 11 09:24:39 Rama kernel: RBP: 00007f4d0e74dcad R08: 0000000000000000 R09:
000055da6b180268
janv. 11 09:24:39 Rama kernel: R10: 0000000000000011 R11: 0000000000000246 R12:
0000000000000000
janv. 11 09:24:39 Rama kernel: R13: 000055da6b18d030 R14: 0000000000020000 R15:
000055da6b197d70
janv. 11 09:24:39 Rama kernel: ---[ end trace 4b5009355813079d ]---

Then I get a lot of errors like this one (the offset in
write_i2c_default_retimer_setting varies, it can be also 0xc6, 0x120, 0x170,
0x1c9, 0x218), a serie of them at boot, every now and then :
janv. 11 09:24:39 Rama kernel: ------------[ cut here ]------------
janv. 11 09:24:39 Rama kernel: WARNING: CPU: 2 PID: 168 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:1894
write_i2c_default_retimer_setting+0x74/0x340 [amdgpu]
janv. 11 09:24:39 Rama kernel: Modules linked in: amdgpu(+) gpu_sched
i2c_algo_bit ttm drm_kms_helper xhci_pci ahci xhci_hcd crc32c_intel libahci drm
libata i2c_piix4 nvme u
janv. 11 09:24:39 Rama kernel: CPU: 2 PID: 168 Comm: systemd-udevd Tainted: G  
     W         5.4.0-2-amd64 #1 Debian 5.4.8-1
janv. 11 09:24:39 Rama kernel: Hardware name: Micro-Star International Co., Ltd
MS-7B86/B450-A PRO (MS-7B86), BIOS A.C0 11/08/2019
janv. 11 09:24:39 Rama kernel: RIP:
0010:write_i2c_default_retimer_setting+0x74/0x340 [amdgpu]
janv. 11 09:24:39 Rama kernel: Code: 24 06 44 0f b6 44 24 07 ba 5d 00 00 00 44
0f b6 c8 48 c7 c6 d8 74 98 c0 bf 04 00 00 00 45 89 cd e8 61 2b b7 ff 45 84 ed
75 02 <0f> 0b 41
janv. 11 09:24:39 Rama kernel: RSP: 0018:ffffa1434054b1c8 EFLAGS: 00010246
janv. 11 09:24:39 Rama kernel: RAX: 0000000000000000 RBX: 0000000000000000 RCX:
000000000000000a
janv. 11 09:24:39 Rama kernel: RDX: 000000000000005d RSI: ffffffffc09874d8 RDI:
0000000000000004
janv. 11 09:24:39 Rama kernel: RBP: ffff90a5bcfd01b8 R08: 0000000000000013 R09:
0000000000000000
janv. 11 09:24:39 Rama kernel: R10: 0000000000000001 R11: 0000000000000300 R12:
0000000000000000
janv. 11 09:24:39 Rama kernel: R13: 0000000000000000 R14: ffff90a5bf9c0000 R15:
0000000000000000
janv. 11 09:24:39 Rama kernel: FS:  00007f4d0e05ed40(0000)
GS:ffff90a5d0480000(0000) knlGS:0000000000000000
janv. 11 09:24:39 Rama kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
janv. 11 09:24:39 Rama kernel: CR2: 00007f4d0e049b2e CR3: 0000000381214000 CR4:
00000000003406e0
janv. 11 09:24:39 Rama kernel: Call Trace:
janv. 11 09:24:39 Rama kernel:  core_link_enable_stream+0x8fd/0x910 [amdgpu]
janv. 11 09:24:39 Rama kernel:  ? generic_reg_update_ex+0x9c/0x120 [amdgpu]
janv. 11 09:24:39 Rama kernel:  ? dce110_apply_ctx_to_hw+0x55a/0x5a0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  dce110_apply_ctx_to_hw+0x55a/0x5a0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  dc_commit_state+0x26b/0x5a0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  amdgpu_dm_atomic_commit_tail+0xcf9/0x1d70
[amdgpu]
janv. 11 09:24:39 Rama kernel:  ? ktime_get_raw+0x2e/0x80
janv. 11 09:24:39 Rama kernel:  ? fill_dc_plane_info_and_addr+0x370/0x370
[amdgpu]
janv. 11 09:24:39 Rama kernel:  ? dm_plane_helper_prepare_fb+0x220/0x2a0
[amdgpu]
janv. 11 09:24:39 Rama kernel:  ? commit_tail+0x94/0x110 [drm_kms_helper]
janv. 11 09:24:39 Rama kernel:  commit_tail+0x94/0x110 [drm_kms_helper]
janv. 11 09:24:39 Rama kernel:  drm_atomic_helper_commit+0xb8/0x130
[drm_kms_helper]
janv. 11 09:24:39 Rama kernel:  drm_client_modeset_commit_atomic+0x179/0x1e0
[drm]
janv. 11 09:24:39 Rama kernel:  drm_client_modeset_commit_force+0x50/0x150
[drm]
janv. 11 09:24:39 Rama kernel: 
drm_fb_helper_restore_fbdev_mode_unlocked+0x49/0xa0 [drm_kms_helper]
janv. 11 09:24:39 Rama kernel:  drm_fb_helper_set_par+0x2c/0x50
[drm_kms_helper]
janv. 11 09:24:39 Rama kernel:  fbcon_init+0x2a9/0x5e0
janv. 11 09:24:39 Rama kernel:  visual_init+0xce/0x130
janv. 11 09:24:39 Rama kernel:  do_bind_con_driver+0x1b9/0x2a0
janv. 11 09:24:39 Rama kernel:  do_take_over_console+0x115/0x180
janv. 11 09:24:39 Rama kernel:  do_fbcon_takeover+0x58/0xb0
janv. 11 09:24:39 Rama kernel:  register_framebuffer+0x1e4/0x300
janv. 11 09:24:39 Rama kernel: 
__drm_fb_helper_initial_config_and_unlock+0x2fa/0x440 [drm_kms_helper]
janv. 11 09:24:39 Rama kernel:  amdgpu_fbdev_init+0xbc/0xf0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  amdgpu_device_init.cold+0x1323/0x1794 [amdgpu]
janv. 11 09:24:39 Rama kernel:  amdgpu_driver_load_kms+0x53/0x1a0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  drm_dev_register+0x111/0x150 [drm]
janv. 11 09:24:39 Rama kernel:  amdgpu_pci_probe+0x154/0x1b0 [amdgpu]
janv. 11 09:24:39 Rama kernel:  local_pci_probe+0x42/0x80
janv. 11 09:24:39 Rama kernel:  pci_device_probe+0x104/0x1a0
janv. 11 09:24:39 Rama kernel:  really_probe+0x147/0x3c0
janv. 11 09:24:39 Rama kernel:  driver_probe_device+0xb6/0x100
janv. 11 09:24:39 Rama kernel:  device_driver_attach+0x53/0x60
janv. 11 09:24:39 Rama kernel:  __driver_attach+0x8a/0x150
janv. 11 09:24:39 Rama kernel:  ? device_driver_attach+0x60/0x60
janv. 11 09:24:39 Rama kernel:  bus_for_each_dev+0x78/0xc0
janv. 11 09:24:39 Rama kernel:  bus_add_driver+0x14d/0x1f0
janv. 11 09:24:39 Rama kernel:  driver_register+0x6c/0xc0
janv. 11 09:24:39 Rama kernel:  ? 0xffffffffc0b0b000
janv. 11 09:24:39 Rama kernel:  do_one_initcall+0x46/0x1f4
janv. 11 09:24:39 Rama kernel:  ? _cond_resched+0x15/0x30
janv. 11 09:24:39 Rama kernel:  ? kmem_cache_alloc_trace+0x1d4/0x210
janv. 11 09:24:39 Rama kernel:  ? do_init_module+0x23/0x230
janv. 11 09:24:39 Rama kernel:  do_init_module+0x5c/0x230
janv. 11 09:24:39 Rama kernel:  load_module+0x2359/0x2500
janv. 11 09:24:39 Rama kernel:  ? __do_sys_finit_module+0xaa/0x110
janv. 11 09:24:39 Rama kernel:  __do_sys_finit_module+0xaa/0x110
janv. 11 09:24:39 Rama kernel:  do_syscall_64+0x52/0x160
janv. 11 09:24:39 Rama kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
janv. 11 09:24:39 Rama kernel: RIP: 0033:0x7f4d0e84a0a9
janv. 11 09:24:39 Rama kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08
0f 05 <48> 3d 01
janv. 11 09:24:39 Rama kernel: RSP: 002b:00007ffcdc7e9aa8 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
janv. 11 09:24:39 Rama kernel: RAX: ffffffffffffffda RBX: 000055da6b197d70 RCX:
00007f4d0e84a0a9
janv. 11 09:24:39 Rama kernel: RDX: 0000000000000000 RSI: 00007f4d0e74dcad RDI:
0000000000000011
janv. 11 09:24:39 Rama kernel: RBP: 00007f4d0e74dcad R08: 0000000000000000 R09:
000055da6b180268
janv. 11 09:24:39 Rama kernel: R10: 0000000000000011 R11: 0000000000000246 R12:
0000000000000000
janv. 11 09:24:39 Rama kernel: R13: 000055da6b18d030 R14: 0000000000020000 R15:
000055da6b197d70
janv. 11 09:24:39 Rama kernel: ---[ end trace 4b5009355813079e ]---

When the screen freezes, ther eis the followin trace:
janv. 10 14:26:22 Rama kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
janv. 10 14:26:27 Rama kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
janv. 10 14:26:27 Rama kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
janv. 10 14:26:27 Rama kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
janv. 10 14:26:27 Rama kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
gfx timeout, signaled seq=314302, emitted seq=314304
janv. 10 14:26:27 Rama kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process Homeworld2.exe pid 2521 thread Homeworld2:cs0 pid
2556
janv. 10 14:26:27 Rama kernel: amdgpu 0000:27:00.0: GPU reset begin!

followed by a serie of traces with write_i2c_default_retimer_setting.

Then:
janv. 10 14:26:28 Rama kernel: amdgpu 0000:27:00.0: GPU reset succeeded, trying
to resume
janv. 10 14:26:28 Rama kernel: [drm] PCIE GART of 1024M enabled (table at
0x000000F400900000).
janv. 10 14:26:28 Rama kernel: [drm] PSP is resuming...
janv. 10 14:26:28 Rama kernel: [drm] reserve 0x400000 from 0xf47fc00000 for PSP
TMR
janv. 10 14:26:28 Rama kernel: [drm] psp command failed and response status is
(0x7)
followed by a serie of traces with write_i2c_default_retimer_setting.

And then:
janv. 10 14:26:28 Rama kernel: ------------[ cut here ]------------
janv. 10 14:26:28 Rama kernel: WARNING: CPU: 0 PID: 4547 at
include/linux/dma-fence.h:533 drm_sched_resubmit_jobs+0x161/0x170 [gpu_sched]
janv. 10 14:26:28 Rama kernel: Modules linked in: rfkill binfmt_misc
edac_mce_amd kvm_amd ccp rng_core nls_ascii nls_cp437 kvm vfat fat irqbypass
crct10dif_pclmul crc32_pclm
janv. 10 14:26:28 Rama kernel:  hid_generic usbhid hid sd_mod amdgpu gpu_sched
i2c_algo_bit ttm drm_kms_helper ahci libahci drm libata xhci_pci crc32c_intel
xhci_hcd r8169 r
janv. 10 14:26:28 Rama kernel: CPU: 0 PID: 4547 Comm: kworker/0:1 Tainted: G   
    W         5.4.0-2-amd64 #1 Debian 5.4.8-1
janv. 10 14:26:28 Rama kernel: Hardware name: Micro-Star International Co., Ltd
MS-7B86/B450-A PRO (MS-7B86), BIOS A.C0 11/08/2019
janv. 10 14:26:28 Rama kernel: Workqueue: events drm_sched_job_timedout
[gpu_sched]
janv. 10 14:26:28 Rama kernel: RIP: 0010:drm_sched_resubmit_jobs+0x161/0x170
[gpu_sched]
janv. 10 14:26:28 Rama kernel: Code: 41 5c 41 5d 41 5e 41 5f c3 49 8b 46 10 31
f6 48 c7 80 80 00 00 00 00 00 00 00 49 8b 7c 24 70 31 c0 83 e7 01 74 04 0f 0b
eb ba <0f> 0b eb
janv. 10 14:26:28 Rama kernel: RSP: 0018:ffffb01243bbfd40 EFLAGS: 00010246
janv. 10 14:26:28 Rama kernel: RAX: 0000000000000000 RBX: ffff8e41ff507950 RCX:
0000000000000000
janv. 10 14:26:28 Rama kernel: RDX: ffff8e41fc507d80 RSI: 0000000000000000 RDI:
0000000000000000
janv. 10 14:26:28 Rama kernel: RBP: 0000000000000001 R08: 0000000000000c21 R09:
0000000000000004
janv. 10 14:26:28 Rama kernel: R10: 0000000000000000 R11: 0000000000000001 R12:
ffff8e41fc507d40
janv. 10 14:26:28 Rama kernel: R13: ffff8e417635d400 R14: ffff8e418f966c00 R15:
ffff8e4207897c38
janv. 10 14:26:28 Rama kernel: FS:  0000000000000000(0000)
GS:ffff8e4210400000(0000) knlGS:0000000000000000
janv. 10 14:26:28 Rama kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
janv. 10 14:26:28 Rama kernel: CR2: 000000001121e000 CR3: 000000038546e000 CR4:
00000000003406f0
janv. 10 14:26:28 Rama kernel: Call Trace:
janv. 10 14:26:28 Rama kernel:  amdgpu_device_gpu_recover+0x6e1/0x959 [amdgpu]
janv. 10 14:26:28 Rama kernel:  amdgpu_job_timedout+0x103/0x130 [amdgpu]
janv. 10 14:26:28 Rama kernel:  drm_sched_job_timedout+0x3e/0x90 [gpu_sched]
janv. 10 14:26:28 Rama kernel:  process_one_work+0x1b4/0x370
janv. 10 14:26:28 Rama kernel:  worker_thread+0x50/0x3c0
janv. 10 14:26:28 Rama kernel:  kthread+0xf9/0x130
janv. 10 14:26:28 Rama kernel:  ? process_one_work+0x370/0x370
janv. 10 14:26:28 Rama kernel:  ? kthread_park+0x90/0x90
janv. 10 14:26:28 Rama kernel:  ret_from_fork+0x22/0x40
janv. 10 14:26:28 Rama kernel: ---[ end trace 20b80ad817532eb4 ]---
janv. 10 14:26:28 Rama kernel: amdgpu 0000:27:00.0: GPU reset(2) succeeded!
janv. 10 14:26:28 Rama kernel: [drm] Skip scheduling IBs!
janv. 10 14:26:28 Rama kernel: ------------[ cut here ]------------
janv. 10 14:26:28 Rama kernel: WARNING: CPU: 0 PID: 286 at
include/linux/dma-fence.h:533 drm_sched_main+0x2f0/0x340 [gpu_sched]
janv. 10 14:26:28 Rama kernel: Modules linked in: rfkill binfmt_misc
edac_mce_amd kvm_amd ccp rng_core nls_ascii nls_cp437 kvm vfat fat irqbypass
crct10dif_pclmul crc32_pclm
janv. 10 14:26:28 Rama kernel:  hid_generic usbhid hid sd_mod amdgpu gpu_sched
i2c_algo_bit ttm drm_kms_helper ahci libahci drm libata xhci_pci crc32c_intel
xhci_hcd r8169 r
janv. 10 14:26:28 Rama kernel: CPU: 0 PID: 286 Comm: gfx Tainted: G        W   
     5.4.0-2-amd64 #1 Debian 5.4.8-1
janv. 10 14:26:28 Rama kernel: Hardware name: Micro-Star International Co., Ltd
MS-7B86/B450-A PRO (MS-7B86), BIOS A.C0 11/08/2019
janv. 10 14:26:28 Rama kernel: RIP: 0010:drm_sched_main+0x2f0/0x340 [gpu_sched]
janv. 10 14:26:28 Rama kernel: Code: 96 b8 42 f7 eb b0 4c 89 fe 48 89 ef e8 19
f2 ff ff e9 e5 fe ff ff 49 8b 55 70 31 ed 31 c0 83 e2 01 74 07 0f 0b e9 0a ff
ff ff <0f> 0b e9
janv. 10 14:26:28 Rama kernel: RSP: 0018:ffffb012415d7e90 EFLAGS: 00010246
janv. 10 14:26:28 Rama kernel: RAX: 0000000000000000 RBX: ffff8e418f964c00 RCX:
0000000000000000
janv. 10 14:26:28 Rama kernel: RDX: 0000000000000000 RSI: 0000000000000286 RDI:
0000000000000286
janv. 10 14:26:28 Rama kernel: RBP: 0000000000000000 R08: 0000000000000c40 R09:
0000000000000004
janv. 10 14:26:28 Rama kernel: R10: 0000000000000000 R11: 0000000000000001 R12:
ffff8e41ff507950
janv. 10 14:26:28 Rama kernel: R13: ffff8e41fc506f00 R14: ffff8e41ff507ae8 R15:
ffff8e418f964c58
janv. 10 14:26:28 Rama kernel: FS:  0000000000000000(0000)
GS:ffff8e4210400000(0000) knlGS:0000000000000000
janv. 10 14:26:28 Rama kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
janv. 10 14:26:28 Rama kernel: CR2: 000000001121e000 CR3: 000000038546e000 CR4:
00000000003406f0
janv. 10 14:26:28 Rama kernel: Call Trace:
janv. 10 14:26:28 Rama kernel:  ? finish_wait+0x80/0x80
janv. 10 14:26:28 Rama kernel:  kthread+0xf9/0x130
janv. 10 14:26:28 Rama kernel:  ? drm_sched_select_entity+0xc0/0xc0 [gpu_sched]
janv. 10 14:26:28 Rama kernel:  ? kthread_park+0x90/0x90
janv. 10 14:26:28 Rama kernel:  ret_from_fork+0x22/0x40
janv. 10 14:26:28 Rama kernel: ---[ end trace 20b80ad817532eb5 ]---
janv. 10 14:26:28 Rama kernel: [drm] Skip scheduling IBs!
janv. 10 14:26:28 Rama kernel: ------------[ cut here ]------------
janv. 10 14:26:28 Rama kernel: WARNING: CPU: 0 PID: 286 at
include/linux/dma-fence.h:533 drm_sched_main+0x2f0/0x340 [gpu_sched]
janv. 10 14:26:28 Rama kernel: Modules linked in: rfkill binfmt_misc
edac_mce_amd kvm_amd ccp rng_core nls_ascii nls_cp437 kvm vfat fat irqbypass
crct10dif_pclmul crc32_pclm
janv. 10 14:26:28 Rama kernel:  hid_generic usbhid hid sd_mod amdgpu gpu_sched
i2c_algo_bit ttm drm_kms_helper ahci libahci drm libata xhci_pci crc32c_intel
xhci_hcd r8169 r
janv. 10 14:26:28 Rama kernel: CPU: 0 PID: 286 Comm: gfx Tainted: G        W   
     5.4.0-2-amd64 #1 Debian 5.4.8-1
janv. 10 14:26:28 Rama kernel: Hardware name: Micro-Star International Co., Ltd
MS-7B86/B450-A PRO (MS-7B86), BIOS A.C0 11/08/2019
janv. 10 14:26:28 Rama kernel: RIP: 0010:drm_sched_main+0x2f0/0x340 [gpu_sched]
janv. 10 14:26:28 Rama kernel: Code: 96 b8 42 f7 eb b0 4c 89 fe 48 89 ef e8 19
f2 ff ff e9 e5 fe ff ff 49 8b 55 70 31 ed 31 c0 83 e2 01 74 07 0f 0b e9 0a ff
ff ff <0f> 0b e9
janv. 10 14:26:28 Rama kernel: RSP: 0018:ffffb012415d7e90 EFLAGS: 00010246
janv. 10 14:26:28 Rama kernel: RAX: 0000000000000000 RBX: ffff8e420b46ec00 RCX:
0000000000000000
janv. 10 14:26:28 Rama kernel: RDX: 0000000000000000 RSI: 0000000000000282 RDI:
0000000000000282
janv. 10 14:26:28 Rama kernel: RBP: 0000000000000000 R08: 0000000000000c59 R09:
0000000000000004
janv. 10 14:26:28 Rama kernel: R10: 0000000000000000 R11: 0000000000000001 R12:
ffff8e41ff507950
janv. 10 14:26:28 Rama kernel: R13: ffff8e419ce69740 R14: ffff8e41ff507ae8 R15:
ffff8e420b46ec58
janv. 10 14:26:28 Rama kernel: FS:  0000000000000000(0000)
GS:ffff8e4210400000(0000) knlGS:0000000000000000
janv. 10 14:26:28 Rama kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
janv. 10 14:26:28 Rama kernel: CR2: 000000001121e000 CR3: 000000038546e000 CR4:
00000000003406f0
janv. 10 14:26:28 Rama kernel: Call Trace:
janv. 10 14:26:28 Rama kernel:  ? finish_wait+0x80/0x80
janv. 10 14:26:28 Rama kernel:  kthread+0xf9/0x130
janv. 10 14:26:28 Rama kernel:  ? drm_sched_select_entity+0xc0/0xc0 [gpu_sched]
janv. 10 14:26:28 Rama kernel:  ? kthread_park+0x90/0x90
janv. 10 14:26:28 Rama kernel:  ret_from_fork+0x22/0x40
janv. 10 14:26:28 Rama kernel: ---[ end trace 20b80ad817532eb6 ]---
janv. 10 14:26:28 Rama kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
initialize parser -125!
janv. 10 14:26:28 Rama kernel: [drm] Skip scheduling IBs!

followed by repeated errors on drm_sched_main.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
