Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8F581B40
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 22:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA156A541A;
	Tue, 26 Jul 2022 20:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6FFA5435
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 20:43:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB2BC615DB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 20:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE8A9C43143
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658868177;
 bh=wOX8jEXzRWZy1AqZnkMGQChtDYxAlBoJlWjWzgr9gj4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YW79V2XLbEy2bFZGZutN01SU3uGyrRkKfVnJcs4e2sBhDVuSYGd86pbSYcAakKpMu
 2lY8lnRDF5X0Qmy2BAYbs3SlFtTf1JY1IJplP6p7VuvIaHLwTr+sm7Yo63bhWkP3cm
 I3IXQybPCv7iXUA+puQiu4nmfUZbaI7OU2/rGqEC1u/81/y3a1hUwiuS2PkSwSUN9c
 Fm8mrEaDi1NCXu+WF6Nk/X7fErFYqWJdoiv4czDDcWRZfC9R+zDRa2vs8vgybchjb5
 JSKIFw/pbaoEdnHuqIPNVWlhJ4yj3ghK9gVkYqCGXahT5ATWXotQ5bA9YuiYTYO4KS
 /A9QyJtcAeWJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E0800C433E6; Tue, 26 Jul 2022 20:42:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Tue, 26 Jul 2022 20:42:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michal.przybylowicz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-jHqz2gSBww@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

Michal Przybylowicz (michal.przybylowicz@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.przybylowicz@gmail.c
                   |                            |om

--- Comment #20 from Michal Przybylowicz (michal.przybylowicz@gmail.com) ---
I have the same issue but on kernel: 5.18.14-xanmod1-x64v2, I have this as =
long
as I remember almost 6mc now... On different kernels. I have also tried lat=
est
firmware (manually downloaded) and lastest amdgpu, still the same. This hap=
pens
seemingly randomly but always when i use vivaldi (based on chrome).


Jul 26 22:35:48 dagon kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
Jul 26 22:35:48 dagon kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ri=
ng
gfx_0.0.0 timeout, signaled seq=3D12513753, emitted seq=3D12513755
Jul 26 22:35:48 dagon kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process vivaldi-bin pid 1540 thread vivaldi-bi:cs0 pid
1564
Jul 26 22:35:48 dagon kernel: amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
Jul 26 22:35:48 dagon kernel: amdgpu 0000:03:00.0: [drm:amdgpu_ring_test_he=
lper
[amdgpu]] *ERROR* ring kiq_2.1.0 test failed (-110)
Jul 26 22:35:48 dagon kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ
disable failed
Jul 26 22:35:48 dagon kernel: amdgpu 0000:03:00.0: [drm:amdgpu_ring_test_he=
lper
[amdgpu]] *ERROR* ring kiq_2.1.0 test failed (-110)
Jul 26 22:35:48 dagon kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ
disable failed
Jul 26 22:35:48 dagon kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* fail=
ed
to halt cp gfx
Jul 26 22:35:49 dagon kernel: [drm] free PSP TMR buffer
Jul 26 22:35:49 dagon kernel: CPU: 2 PID: 131736 Comm: kworker/u32:3 Not
tainted 5.18.14-xanmod1-x64v2 #0~git20220723.debb916
Jul 26 22:35:49 dagon kernel: Hardware name: Micro-Star International Co., =
Ltd.
MS-7C80/MAG Z490 TOMAHAWK (MS-7C80), BIOS 1.B0 03/31/2022
Jul 26 22:35:49 dagon kernel: Workqueue: amdgpu-reset-dev
drm_sched_job_timedout [gpu_sched]
Jul 26 22:35:49 dagon kernel: Call Trace:
Jul 26 22:35:49 dagon kernel:  <TASK>
Jul 26 22:35:49 dagon kernel:  dump_stack_lvl+0x44/0x5c
Jul 26 22:35:49 dagon kernel:  amdgpu_do_asic_reset+0x21/0x41b [amdgpu]
Jul 26 22:35:49 dagon kernel:  amdgpu_device_gpu_recover_imp.cold+0x55c/0x8=
f9
[amdgpu]
Jul 26 22:35:49 dagon kernel:  amdgpu_job_timedout+0x151/0x180 [amdgpu]
Jul 26 22:35:49 dagon kernel:  ? __switch_to_asm+0x42/0x70
Jul 26 22:35:49 dagon kernel:  ? __schedule+0x388/0x1180
Jul 26 22:35:49 dagon kernel:  drm_sched_job_timedout+0x5f/0xf0 [gpu_sched]
Jul 26 22:35:49 dagon kernel:  process_one_work+0x1ea/0x330
Jul 26 22:35:49 dagon kernel:  worker_thread+0x45/0x3b0
Jul 26 22:35:49 dagon kernel:  ? process_one_work+0x330/0x330
Jul 26 22:35:49 dagon kernel:  kthread+0xbb/0xe0
Jul 26 22:35:49 dagon kernel:  ? kthread_complete_and_exit+0x20/0x20
Jul 26 22:35:49 dagon kernel:  ret_from_fork+0x1f/0x30
Jul 26 22:35:49 dagon kernel:  </TASK>
Jul 26 22:35:49 dagon kernel: amdgpu 0000:03:00.0: amdgpu: MODE1 reset
Jul 26 22:35:49 dagon kernel: amdgpu 0000:03:00.0: amdgpu: GPU mode1 reset
Jul 26 22:35:49 dagon kernel: amdgpu 0000:03:00.0: amdgpu: GPU smu mode1 re=
set
Jul 26 22:35:49 dagon kernel: amdgpu 0000:03:00.0: amdgpu: GPU reset succee=
ded,
trying to resume

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
