Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6387A4A380C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 19:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87560112E0D;
	Sun, 30 Jan 2022 18:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330B8112E0D
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 18:30:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87EBFB82994
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 18:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EE2AC340EF
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 18:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643567438;
 bh=8XqcyeBCYtMfACpbFqniXV8gQXOduuyzeYO5IZjrW0s=;
 h=From:To:Subject:Date:From;
 b=BXPWzReCE1Rf+mb3YRP6Kxb9R8cXXOJuE2NhIzumxzDOvgLhGz/tZ8ZGEj6o5ZKJs
 XS6cEf1Sc1ms9hVgk4dSECOq8jO34rGTyZN0gEMqP//HQEoMwvpxAaj1ExFxkfqAWk
 fXYvWSAnYFNj3JNXcPLWWvGj5O9N6sGXUzwECW3tfMxOiexSR/pc3BVCLicKe8Chsd
 rCXmu0XFqqZCZd8US+Hg1TCj1XPS9PyP4ryuagkokmJE62R9oPOocWFZCzNPNQR/hU
 LavAOskn3rJOi/2yV1z4po9jaZbJSYReY++cVHFjuSqTq0hT3tTS2LqcUAbWfJWH7M
 CorItQHU3IYpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F2731C05FD2; Sun, 30 Jan 2022 18:30:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215549] New: My 6900XT can't recover while it's idle (but not
 asleep), and sometimes doesn't show at boot
Date: Sun, 30 Jan 2022 18:30:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: techxgames@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215549-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215549

            Bug ID: 215549
           Summary: My 6900XT can't recover while it's idle (but not
                    asleep), and sometimes doesn't show at boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.15-76051515-generic
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: techxgames@outlook.com
        Regression: No

Created attachment 300352
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300352&action=3Dedit
dmesg

After the display has been idle, and screen timeout occurs after a while (n=
ot
exactly sure cuz it happens while I was asleep),  the GPU "resets" and disp=
lay
us unable to recover.

Journal entry:
```
 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan 23 05:51:48 Y4M1-II kernel:       Tainted: G           OE=20=20=20=20
5.15.11-76051511-generic #202112220937~1640185481~21.10~b3a2c21
Jan 23 05:51:48 Y4M1-II kernel: INFO: task latte-dock:cs0:3095 blocked for =
more
than 120 seconds.
Jan 23 05:51:48 Y4M1-II kernel:  </TASK>
Jan 23 05:51:48 Y4M1-II kernel: R13: 000000000000000f R14: 00000000fffffffd
R15: 00007fdd0409ef58
Jan 23 05:51:48 Y4M1-II kernel: R10: 0000000000000000 R11: 0000000000000246
R12: 000055e87e1b4cd0
Jan 23 05:51:48 Y4M1-II kernel: RBP: 00000000c0186444 R08: 00007fdd9bdb4a00
R09: 00007fdd9bdb48c0
Jan 23 05:51:48 Y4M1-II kernel: RDX: 00007fdd9bdb48e0 RSI: 00000000c0186444
RDI: 000000000000000f
Jan 23 05:51:48 Y4M1-II kernel: RAX: ffffffffffffffda RBX: 00007fdd9bdb48e0
RCX: 00007fddad9379cb
Jan 23 05:51:48 Y4M1-II kernel: RSP: 002b:00007fdd9bdb4878 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Jan 23 05:51:48 Y4M1-II kernel: RIP: 0033:0x7fddad9379cb
Jan 23 05:51:48 Y4M1-II kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
Jan 23 05:51:48 Y4M1-II kernel:  ? do_syscall_64+0x69/0xc0
Jan 23 05:51:48 Y4M1-II kernel:  ? do_syscall_64+0x69/0xc0
Jan 23 05:51:48 Y4M1-II kernel:  ? syscall_exit_to_user_mode+0x27/0x50
Jan 23 05:51:48 Y4M1-II kernel:  do_syscall_64+0x5c/0xc0
Jan 23 05:51:48 Y4M1-II kernel:  __x64_sys_ioctl+0x91/0xc0
Jan 23 05:51:48 Y4M1-II kernel:  amdgpu_drm_ioctl+0x4e/0x80 [amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  ? futex_wake+0x7c/0x180
Jan 23 05:51:48 Y4M1-II kernel:  ? amdgpu_cs_vm_handling+0x420/0x420 [amdgp=
u]
Jan 23 05:51:48 Y4M1-II kernel:  drm_ioctl+0x264/0x4b0 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  drm_ioctl_kernel+0xae/0xf0 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  ? amdgpu_cs_vm_handling+0x420/0x420 [amdgp=
u]
Jan 23 05:51:48 Y4M1-II kernel:  amdgpu_cs_ioctl+0xf8/0x230 [amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  ? amdgpu_cs_ib_fill+0x1e3/0x230 [amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  amdgpu_cs_parser_bos+0x406/0x4e0 [amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  amdgpu_ttm_alloc_gart+0x150/0x1a0 [amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  amdgpu_gart_invalidate_tlb+0x43/0x60 [amdg=
pu]
Jan 23 05:51:48 Y4M1-II kernel:  gmc_v10_0_flush_gpu_tlb+0x285/0x310 [amdgp=
u]
Jan 23 05:51:48 Y4M1-II kernel:  dma_fence_wait_timeout+0xb7/0xd0
Jan 23 05:51:48 Y4M1-II kernel:  ? dma_fence_free+0x20/0x20
Jan 23 05:51:48 Y4M1-II kernel:  dma_fence_default_wait+0x1c4/0x1f0
Jan 23 05:51:48 Y4M1-II kernel:  schedule_timeout+0xfb/0x140
Jan 23 05:51:48 Y4M1-II kernel:  schedule+0x4e/0xb0
Jan 23 05:51:48 Y4M1-II kernel:  __schedule+0x23d/0x590
Jan 23 05:51:48 Y4M1-II kernel:  <TASK>
Jan 23 05:51:48 Y4M1-II kernel: Call Trace:
Jan 23 05:51:48 Y4M1-II kernel: task:plasmashel:cs0  state:D stack:    0 pi=
d:
2546 ppid:  2338 flags:0x00000000
Jan 23 05:51:48 Y4M1-II kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan 23 05:51:48 Y4M1-II kernel:       Tainted: G           OE=20=20=20=20
5.15.11-76051511-generic #202112220937~1640185481~21.10~b3a2c21
Jan 23 05:51:48 Y4M1-II kernel: INFO: task plasmashel:cs0:2546 blocked for =
more
than 120 seconds.
Jan 23 05:51:48 Y4M1-II kernel:  </TASK>
Jan 23 05:51:48 Y4M1-II kernel: R13: 000000000000000f R14: 0000557ba68b8b80
R15: 0000557ba6196c10
Jan 23 05:51:48 Y4M1-II kernel: R10: 0000000000000006 R11: 0000000000000246
R12: 000000000000026e
Jan 23 05:51:48 Y4M1-II kernel: RBP: 00000000c01c64a3 R08: 0000000000000080
R09: 0000000000000000
Jan 23 05:51:48 Y4M1-II kernel: RDX: 00007fff428d7060 RSI: 00000000c01c64a3
RDI: 000000000000000f
Jan 23 05:51:48 Y4M1-II kernel: RAX: ffffffffffffffda RBX: 00007fff428d7060
RCX: 00007fbafbd9a9cb
Jan 23 05:51:48 Y4M1-II kernel: RSP: 002b:00007fff428d7028 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Jan 23 05:51:48 Y4M1-II kernel: RIP: 0033:0x7fbafbd9a9cb
Jan 23 05:51:48 Y4M1-II kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
Jan 23 05:51:48 Y4M1-II kernel:  ? asm_exc_page_fault+0x8/0x30
Jan 23 05:51:48 Y4M1-II kernel:  ? exc_page_fault+0x89/0x160
Jan 23 05:51:48 Y4M1-II kernel:  ? do_syscall_64+0x69/0xc0
Jan 23 05:51:48 Y4M1-II kernel:  ? __x64_sys_writev+0x1c/0x20
Jan 23 05:51:48 Y4M1-II kernel:  ? syscall_exit_to_user_mode+0x27/0x50
Jan 23 05:51:48 Y4M1-II kernel:  do_syscall_64+0x5c/0xc0
Jan 23 05:51:48 Y4M1-II kernel:  __x64_sys_ioctl+0x91/0xc0
Jan 23 05:51:48 Y4M1-II kernel:  amdgpu_drm_ioctl+0x4e/0x80 [amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  ? amdgpu_drm_ioctl+0x6f/0x80 [amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  ? drm_mode_setplane+0x330/0x330 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  drm_ioctl+0x264/0x4b0 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  drm_ioctl_kernel+0xae/0xf0 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  drm_mode_cursor_ioctl+0x48/0x60 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  ? drm_mode_setplane+0x330/0x330 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  drm_mode_cursor_common+0xed/0x210 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  drm_mode_cursor_universal+0x13e/0x260 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  __setplane_atomic+0xfa/0x110 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  drm_atomic_helper_disable_plane+0x8d/0xf0
[drm_kms_helper]
Jan 23 05:51:48 Y4M1-II kernel:  drm_atomic_commit+0x4a/0x50 [drm]
Jan 23 05:51:48 Y4M1-II kernel:  drm_atomic_helper_commit+0x123/0x150
[drm_kms_helper]
Jan 23 05:51:48 Y4M1-II kernel:  ? drm_atomic_helper_swap_state+0x10b/0x370
[drm_kms_helper]
Jan 23 05:51:48 Y4M1-II kernel:  commit_tail+0xc5/0x170 [drm_kms_helper]
Jan 23 05:51:48 Y4M1-II kernel:  ? wait_for_completion_timeout+0x1d/0x20
Jan 23 05:51:48 Y4M1-II kernel:  ? usleep_range_state+0x90/0x90
Jan 23 05:51:48 Y4M1-II kernel:  ? __wait_for_common+0x3e/0x150
Jan 23 05:51:48 Y4M1-II kernel:  ? __cond_resched+0x1a/0x50
Jan 23 05:51:48 Y4M1-II kernel:  ? drm_atomic_helper_check_planes+0xf9/0x200
[drm_kms_helper]
Jan 23 05:51:48 Y4M1-II kernel:  ? dm_plane_helper_prepare_fb+0x137/0x290
[amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  ? amdgpu_bo_gpu_offset+0x76/0xd0 [amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  ? amdgpu_bo_destroy+0x30/0x80 [amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  ?
__raw_callee_save___native_queued_spin_unlock+0x15/0x23
Jan 23 05:51:48 Y4M1-II kernel:  ? amdgpu_vm_del_from_lru_notify+0x12/0x80
[amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  ? try_wait_for_completion+0x51/0x60
Jan 23 05:51:48 Y4M1-II kernel:  ? ttm_bo_mem_compat+0x20/0x90 [ttm]
Jan 23 05:51:48 Y4M1-II kernel:  ? page_counter_cancel+0x2e/0x80
Jan 23 05:51:48 Y4M1-II kernel:  amdgpu_dm_atomic_commit_tail+0x5a5/0x1440
[amdgpu]
Jan 23 05:51:48 Y4M1-II kernel:  mutex_lock+0x34/0x40
Jan 23 05:51:48 Y4M1-II kernel:  __mutex_lock_slowpath+0x13/0x20
Jan 23 05:51:48 Y4M1-II kernel:  __mutex_lock.constprop.0+0x263/0x490
Jan 23 05:51:48 Y4M1-II kernel:  schedule_preempt_disabled+0xe/0x10
Jan 23 05:51:48 Y4M1-II kernel:  schedule+0x4e/0xb0
Jan 23 05:51:48 Y4M1-II kernel:  __schedule+0x23d/0x590
Jan 23 05:51:48 Y4M1-II kernel:  <TASK>
Jan 23 05:51:48 Y4M1-II kernel: Call Trace:
Jan 23 05:51:48 Y4M1-II kernel: task:           state:D stack:    0 pid: 17=
30
ppid:  1726 flags:0x00400004
Jan 23 05:51:48 Y4M1-II kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan 23 05:51:48 Y4M1-II kernel:       Tainted: G           OE=20=20=20=20
5.15.11-76051511-generic #202112220937~1640185481~21.10~b3a2c21
Jan 23 05:51:48 Y4M1-II kernel: INFO: task Xorg:1730 blocked for more than =
120
seconds.
Jan 23 05:50:43 Y4M1-II libvirtd[1594]: internal error: connection closed d=
ue
to keepalive timeout
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:34 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Bailing on TDR=
 for
s_job:61bc, as another already in progress
Jan 23 05:49:34 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Bailing on TDR=
 for
s_job:3823, as another already in progress
Jan 23 05:49:34 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 23 05:49:34 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Jan 23 05:49:34 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Bailing on TDR=
 for
s_job:15ee, as another already in progress
Jan 23 05:49:34 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 23 05:49:34 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma0 timeout, signaled seq=3D14371, emitted seq=3D14373
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma3 timeout, signaled seq=3D25020, emitted seq=3D25022
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma1 timeout, signaled seq=3D5614, emitted seq=3D5616
Jan 23 05:49:34 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma2 timeout, signaled seq=3D8001, emitted seq=3D8003
Jan 23 05:49:33 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:33 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:33 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:33 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:33 Y4M1-II kernel: amdgpu_cs_ioctl: 36 callbacks suppressed
Jan 23 05:49:29 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:29 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:29 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:29 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:29 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:29 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:29 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:28 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:28 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:28 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:28 Y4M1-II kernel: amdgpu_cs_ioctl: 95 callbacks suppressed
Jan 23 05:49:23 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset end =
with
ret =3D -62
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset(2)
failed
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 23 05:49:23 Y4M1-II kernel: [drm:amdgpu_device_fw_loading [amdgpu]] *ER=
ROR*
resume of IP block <psp> failed -62
Jan 23 05:49:23 Y4M1-II kernel: [drm:psp_resume [amdgpu]] *ERROR* PSP resume
failed
Jan 23 05:49:23 Y4M1-II kernel: [drm:psp_hw_start [amdgpu]] *ERROR* PSP cre=
ate
ring failed!
Jan 23 05:49:23 Y4M1-II kernel: [drm] PSP is resuming...
Jan 23 05:49:23 Y4M1-II kernel: [drm] VRAM is lost due to GPU reset!
Jan 23 05:49:23 Y4M1-II kernel: [drm] PCIE GART of 512M enabled (table at
0x0000008000753000).
Jan 23 05:49:23 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset
succeeded, trying to resume
Jan 23 05:49:12 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: ASIC reset fai=
led
with error, -62 for drm dev, 0000:0c:00.0
Jan 23 05:49:12 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU mode1 reset
failed
Jan 23 05:49:12 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: SMU: I'm not d=
one
with your previous command!
Jan 23 05:49:07 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU smu mode1
reset
Jan 23 05:49:07 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU mode1 reset
Jan 23 05:49:07 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: MODE1 reset
Jan 23 05:49:07 Y4M1-II kernel: [drm:amdgpu_device_ip_suspend_phase2 [amdgp=
u]]
*ERROR* suspend of IP block <psp> failed -22
Jan 23 05:49:07 Y4M1-II kernel: [drm:psp_suspend [amdgpu]] *ERROR* Failed to
terminate ras ta
Jan 23 05:49:07 Y4M1-II kernel: [drm] psp gfx command UNLOAD_TA(0x2) failed=
 and
response status is (0x0)
Jan 23 05:49:05 Y4M1-II kernel: [drm:amdgpu_device_ip_suspend_phase2 [amdgp=
u]]
*ERROR* suspend of IP block <smu> failed -62
Jan 23 05:49:05 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Fail to disable
dpm features!
Jan 23 05:49:05 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Failed to disa=
ble
smu features.
Jan 23 05:49:05 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: SMU: I'm not d=
one
with your previous command!
Jan 23 05:49:00 Y4M1-II kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ
disable failed
Jan 23 05:49:00 Y4M1-II kernel: amdgpu 0000:0c:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
Jan 23 05:48:59 Y4M1-II kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ
disable failed
Jan 23 05:48:59 Y4M1-II kernel: amdgpu 0000:0c:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
Jan 23 05:48:59 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Failed to disa=
ble
gfxoff!
Jan 23 05:48:54 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 23 05:48:54 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process Xorg pid 1730 thread Xorg:cs0 pid 1737
Jan 23 05:48:54 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
gfx_0.0.0 timeout, signaled seq=3D4631274, emitted seq=3D4631276
```

Sometimes, at boot it doesn't show anything either:
```
Jan 27 05:54:39 Y4M1-II kernel: RIP: 0010:vcn_v3_0_sw_fini+0x5d/0xd0 [amdgp=
u]
Jan 27 05:54:39 Y4M1-II kernel: Modules linked in: usbhid amdgpu(+) gpu_sch=
ed
i2c_algo_bit drm_ttm_helper ttm crct10dif_pclmul drm_kms_helper crc32_pclmul
cec crc32c_intel rc_core gh>
Jan 27 05:54:39 Y4M1-II kernel:  amdgpu_driver_release_kms+0x12/0x30 [amdgp=
u]
Jan 27 05:54:39 Y4M1-II kernel:  amdgpu_device_fini_sw+0xbb/0x2a0 [amdgpu]
Jan 27 05:54:39 Y4M1-II kernel: RIP: 0010:vcn_v3_0_sw_fini+0x5d/0xd0 [amdgp=
u]
Jan 27 05:54:39 Y4M1-II kernel: amdgpu: probe of 0000:0c:00.0 failed with e=
rror
-110
Jan 27 05:54:39 Y4M1-II kernel: [drm:psp_v11_0_ring_destroy [amdgpu]] *ERRO=
R*
Fail to stop psp ring
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Fail to disable
thermal alert!
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: amdgpu: finish=
ing
device.
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Fatal error du=
ring
GPU init
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu:
amdgpu_device_ip_init failed
Jan 27 05:54:39 Y4M1-II kernel: [drm:amdgpu_device_init.cold [amdgpu]] *ERR=
OR*
hw_init of IP block <gfx_v10_0> failed -110
Jan 27 05:54:39 Y4M1-II kernel: [drm:amdgpu_gfx_enable_kcq.cold [amdgpu]]
*ERROR* KCQ enable failed
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error queuing DMUB command: status=3D2
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_cmd_queue [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: [drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR*
Error waiting for DMUB idle: status=3D3
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: SMU is initial=
ized
successfully!
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: use vbios prov=
ided
pptable
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: SECUREDISPLAY:
securedisplay ta ucode is not available
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Will use PSP to
load VCN firmware
Jan 27 05:54:39 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: PSP runtime
database doesn't exist
```

In order for me to reproduce, I set the display timeout to 10 min (sleep is
disabled).  Anything close to that, and I can still recover the display.  If
left unattended for longer, the display is unable to recover.

Hardware and System Info:
 - CPU: Ryzen 9 5900X
 - GPU: Asrock 6900XT Phantom Gaming D `0c:00.0 VGA compatible controller
[0300]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21 [Radeon RX 6800/6800=
 XT
/ 6900 XT] [1002:73bf] (rev c0)`
 - System Memory: 64GB
 - Display(s): 1440P Asus TUF Gaming VG27AQ1A (primary) + 4K BenQ EW3270U
 - Type of Display Connection: DP
 - Distro name and Version: Kubuntu 21.10
 - Kernel version: Linux Y4M1-II 5.15.11-76051511-generic
#202112220937164018548121.10~b3a2c21 SMP Wed Dec 22 15:41:49 U x86_64 x86_64
x86_64 GNU/Linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
