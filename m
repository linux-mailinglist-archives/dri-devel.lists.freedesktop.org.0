Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2084F496E51
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 00:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0B410E28D;
	Sat, 22 Jan 2022 23:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC1210E28D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 23:56:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EE4360FD4
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 23:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C83FC3410D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 23:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642895798;
 bh=wvUfr8QPQb4LQSkRxGa/zqsMeSibKTqGrkx94q2LSKs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VJfv1N/WLaZofr5RMxYEdfHAy+40PDj7gnzzr0fjhSj76+1x3oYGLp3Usu/+t2ZB5
 25m7rmc/STXWKXORXJbVElm8LKsUZCDTmT08vbqkSsb0dz+ipRA1omXLLwslUlOvTy
 gtZNt51safdTszP1ANMDbzlWYwK7qPRNcf3ShF6MLrNyPK91ZNHBf2HDgO8rQt3JVX
 +bjVd43FnbMsrHV0jJA5nM/eDfn/InD7qXcmut1GKBlnCwt6RcT3frOUrSffJIBbYq
 8oXFVchrlpTRUabh647wVYcEpjzn/w6exvbIiRWNOpitM/+XBCron3fnzmY1r88D4P
 mJEytq8e2i+Mw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6D332CC13AC; Sat, 22 Jan 2022 23:56:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 22 Jan 2022 23:56:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: techxgames@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-DUQJkbkTzQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #56 from techxgames@outlook.com ---
Another instance, when my desktop has been idle for a while and the display=
 has
been shut off for a while, the display won't come back on.  Here's the jour=
nal
entry I think is relevant to this:

Jan 22 08:07:58 Y4M1-II kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan 22 08:07:58 Y4M1-II kernel:       Tainted: G           OE=20=20=20=20
5.15.11-76051511-generic #202112220937~1640185481~21.10~b3a2c21
Jan 22 08:07:58 Y4M1-II kernel: INFO: task Xorg:1692 blocked for more than =
120
seconds.
Jan 22 08:07:58 Y4M1-II kernel:  </TASK>
Jan 22 08:07:58 Y4M1-II kernel:  ret_from_fork+0x22/0x30
Jan 22 08:07:58 Y4M1-II kernel:  ? set_kthread_struct+0x50/0x50
Jan 22 08:07:58 Y4M1-II kernel:  ? process_one_work+0x3d0/0x3d0
Jan 22 08:07:58 Y4M1-II kernel:  kthread+0x11e/0x140
Jan 22 08:07:58 Y4M1-II kernel:  worker_thread+0x53/0x420
Jan 22 08:07:58 Y4M1-II kernel:  process_one_work+0x22b/0x3d0
Jan 22 08:07:58 Y4M1-II kernel:  drm_sched_job_timedout+0x6f/0x110 [gpu_sch=
ed]
Jan 22 08:07:58 Y4M1-II kernel:  amdgpu_job_timedout+0x14f/0x170 [amdgpu]
Jan 22 08:07:58 Y4M1-II kernel:  amdgpu_device_gpu_recover.cold+0x6ec/0x8f8
[amdgpu]
Jan 22 08:07:58 Y4M1-II kernel:  ? drm_fb_helper_set_suspend_unlocked+0x33/=
0xa0
[drm_kms_helper]
Jan 22 08:07:58 Y4M1-II kernel:  amdgpu_device_pre_asic_reset+0xdd/0x480
[amdgpu]
Jan 22 08:07:58 Y4M1-II kernel:  amdgpu_device_ip_suspend+0x21/0x70 [amdgpu]
Jan 22 08:07:58 Y4M1-II kernel:  amdgpu_device_ip_suspend_phase1+0xa3/0x180
[amdgpu]
Jan 22 08:07:58 Y4M1-II kernel:  ? amdgpu_device_set_cg_state+0x12f/0x280
[amdgpu]
Jan 22 08:07:58 Y4M1-II kernel:  ? nv_common_set_clockgating_state+0x9f/0xb0
[amdgpu]
Jan 22 08:07:58 Y4M1-II kernel:  dm_suspend+0xaa/0x270 [amdgpu]
Jan 22 08:07:58 Y4M1-II kernel:  mutex_lock+0x34/0x40
Jan 22 08:07:58 Y4M1-II kernel:  __mutex_lock_slowpath+0x13/0x20
Jan 22 08:07:58 Y4M1-II kernel:  __mutex_lock.constprop.0+0x263/0x490
Jan 22 08:07:58 Y4M1-II kernel:  schedule_preempt_disabled+0xe/0x10
Jan 22 08:07:58 Y4M1-II kernel:  schedule+0x4e/0xb0
Jan 22 08:07:58 Y4M1-II kernel:  __schedule+0x23d/0x590
Jan 22 08:07:58 Y4M1-II kernel:  <TASK>
Jan 22 08:07:58 Y4M1-II kernel: Call Trace:
Jan 22 08:07:58 Y4M1-II kernel: Workqueue: events drm_sched_job_timedout
[gpu_sched]
Jan 22 08:07:58 Y4M1-II kernel: task:kworker/12:1    state:D stack:    0 pi=
d:=20
246 ppid:     2 flags:0x00004000
Jan 22 08:07:58 Y4M1-II kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jan 22 08:07:58 Y4M1-II kernel:       Tainted: G           OE=20=20=20=20
5.15.11-76051511-generic #202112220937~1640185481~21.10~b3a2c21
Jan 22 08:07:58 Y4M1-II kernel: INFO: task kworker/12:1:246 blocked for more
than 120 seconds.
Jan 22 08:05:24 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Bailing on TDR=
 for
s_job:1123, as another already in progress
Jan 22 08:05:24 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Bailing on TDR=
 for
s_job:43c, as another already in progress
Jan 22 08:05:24 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 22 08:05:24 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 22 08:05:24 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 22 08:05:24 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Jan 22 08:05:24 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Jan 22 08:05:24 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Jan 22 08:05:24 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma0 timeout, signaled seq=3D4303, emitted seq=3D4305
Jan 22 08:05:24 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma3 timeout, signaled seq=3D1084, emitted seq=3D1086
Jan 22 08:05:24 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma2 timeout, signaled seq=3D4379, emitted seq=3D4381
Jan 22 08:05:20 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:20 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:19 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:19 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:19 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:19 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:19 Y4M1-II kernel: amdgpu_cs_ioctl: 59 callbacks suppressed
Jan 22 08:05:14 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset end =
with
ret =3D -62
Jan 22 08:05:14 Y4M1-II kernel: snd_hda_intel 0000:0c:00.1: CORB reset
timeout#2, CORBRP =3D 65535
Jan 22 08:05:14 Y4M1-II kernel: snd_hda_intel 0000:0c:00.1: refused to chan=
ge
power state from D3hot to D0
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
...
Jan 22 08:05:14 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset(2)
failed
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm] Skip scheduling IBs!
Jan 22 08:05:14 Y4M1-II kernel: [drm:amdgpu_device_fw_loading [amdgpu]] *ER=
ROR*
resume of IP block <psp> failed -62
Jan 22 08:05:14 Y4M1-II kernel: [drm:psp_resume [amdgpu]] *ERROR* PSP resume
failed
Jan 22 08:05:14 Y4M1-II kernel: [drm:psp_hw_start [amdgpu]] *ERROR* PSP cre=
ate
ring failed!
Jan 22 08:05:14 Y4M1-II kernel: [drm] PSP is resuming...
Jan 22 08:05:14 Y4M1-II kernel: [drm] VRAM is lost due to GPU reset!
Jan 22 08:05:14 Y4M1-II kernel: [drm] PCIE GART of 512M enabled (table at
0x0000008000753000).
Jan 22 08:05:14 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset
succeeded, trying to resume
Jan 22 08:05:03 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: ASIC reset fai=
led
with error, -62 for drm dev, 0000:0c:00.0
Jan 22 08:05:03 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU mode1 reset
failed
Jan 22 08:05:03 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: SMU: I'm not d=
one
with your previous command!
Jan 22 08:04:58 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU smu mode1
reset
Jan 22 08:04:58 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU mode1 reset
Jan 22 08:04:58 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: MODE1 reset
Jan 22 08:04:58 Y4M1-II kernel: [drm:amdgpu_device_ip_suspend_phase2 [amdgp=
u]]
*ERROR* suspend of IP block <psp> failed -22
Jan 22 08:04:58 Y4M1-II kernel: [drm:psp_suspend [amdgpu]] *ERROR* Failed to
terminate ras ta
Jan 22 08:04:58 Y4M1-II kernel: [drm] psp gfx command UNLOAD_TA(0x2) failed=
 and
response status is (0x0)
Jan 22 08:04:56 Y4M1-II kernel: [drm:amdgpu_device_ip_suspend_phase2 [amdgp=
u]]
*ERROR* suspend of IP block <smu> failed -62
Jan 22 08:04:56 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Fail to disable
dpm features!
Jan 22 08:04:56 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Failed to disa=
ble
smu features.
Jan 22 08:04:51 Y4M1-II kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ
disable failed
Jan 22 08:04:51 Y4M1-II kernel: amdgpu 0000:0c:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
Jan 22 08:04:50 Y4M1-II kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ
disable failed
Jan 22 08:04:50 Y4M1-II kernel: amdgpu 0000:0c:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
Jan 22 08:04:50 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 22 08:04:50 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process Xorg pid 1692 thread Xorg:cs0 pid 1745
Jan 22 08:04:50 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
gfx_0.0.0 timeout, signaled seq=3D570767, emitted seq=3D570769

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
