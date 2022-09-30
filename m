Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD21E5F0E4F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B476410ED45;
	Fri, 30 Sep 2022 15:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB7C10ED45
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 15:00:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C5B2B82914
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 15:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56EE0C43145
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664550011;
 bh=pYYycekh3428ySTvSvmQ5+eqpzg1FxPMJLtJc0RNf/4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=K4wmAZR4BXjIW8CFGEgIkODkoU8XXwjh3SPT7yZTsGENJ0tNm6Wl5mDQoSjG7G3NU
 yeIxpxyTbRbQCt2pmp5JFXtRL8qGusFEzI1Jv6o6yxQg1qT+ZJ7eoVvf3LrWh0idCj
 uzOrYwvOgFdMLdczkfvmhYLWuVi6xRevPn0/7flZ0s4svVONlOFqvHo0TsXak0M8W+
 iPln0ikMTILMEgMBmg8Zwf/XGV7Xo6nWSqXa6KLt5xGRTiGTE9kwd+P19xOOSFPDsh
 TbHwZCw4GiVwlBMWmP87Vh5333kZoqs1IyakCnH/8foWXAES6nR335Y2RA/gz6e7Xj
 IyRRr20BrkGdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 46313C05F8D; Fri, 30 Sep 2022 15:00:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Fri, 30 Sep 2022 15:00:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: halturin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-z0DUzKsL7s@https.bugzilla.kernel.org/>
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

Taras (halturin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |halturin@gmail.com

--- Comment #22 from Taras (halturin@gmail.com) ---
Experiencing the same issue on 5.19.11 (NixOS 22.11pre411613.7e52b35fe98) w=
ith
RX 6800. Random freezing when I use vivaldi browser.=20


 vivaldi-stable.desktop[49450]:
[49444:49444:0930/100113.311398:ERROR:CONSOLE(0)] "Uncaught (in promise) Er=
ror:
A listener indicated an asynchronous response by returning true>
 vivaldi-stable.desktop[49450]:
[49444:49444:0930/100116.501866:ERROR:CONSOLE(0)] "Uncaught (in promise) Er=
ror:
A listener indicated an asynchronous response by returning true>
 kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fe=
nces
timed out!
 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma3 timeout,
signaled seq=3D114786, emitted seq=3D114788
 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process  pid 0 thread  pid 0
 kernel: amdgpu 0000:4c:00.0: amdgpu: GPU reset begin!
 kernel: amdgpu 0000:4c:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR*
ring kiq_2.1.0 test failed (-110)
 kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ disable failed
 kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* failed to halt cp gfx
 kernel: [drm] free PSP TMR buffer
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e3bb00 flags=3D0x0010]
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e22300 flags=3D0x0010]
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e30c00 flags=3D0x0010]
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e16000 flags=3D0x0010]
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e38600 flags=3D0x0010]
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e2ea00 flags=3D0x0010]
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e3d000 flags=3D0x0010]
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e37700 flags=3D0x0010]
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e32400 flags=3D0x0010]
 kernel: amdgpu 0000:4c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D=
0x0038
address=3D0xf7d00e31c00 flags=3D0x0010]
 kernel: CPU: 12 PID: 96188 Comm: kworker/u256:1 Tainted: G        W=20=20=
=20=20=20=20=20=20
5.19.11 #1-NixOS
 kernel: Hardware name: Micro-Star International Co., Ltd. MS-7C60/TRX40 PRO
WIFI (MS-7C60), BIOS 2.80 05/17/2022
 kernel: Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sched]
 kernel: Call Trace:
 kernel:  <TASK>
 kernel:  dump_stack_lvl+0x45/0x5e
 kernel:  amdgpu_do_asic_reset+0x28/0x438 [amdgpu]
 kernel:  amdgpu_device_gpu_recover_imp.cold+0x5ad/0x90a [amdgpu]
 kernel:  amdgpu_job_timedout+0x153/0x190 [amdgpu]
 kernel:  drm_sched_job_timedout+0x76/0x110 [gpu_sched]
 kernel:  process_one_work+0x1e5/0x3b0
 kernel:  worker_thread+0x50/0x3a0
 kernel:  ? rescuer_thread+0x390/0x390
 kernel:  kthread+0xe8/0x110
 kernel:  ? kthread_complete_and_exit+0x20/0x20
 kernel:  ret_from_fork+0x22/0x30
 kernel:  </TASK>
 kernel: amdgpu 0000:4c:00.0: amdgpu: MODE1 reset
 kernel: amdgpu 0000:4c:00.0: amdgpu: GPU mode1 reset
 kernel: amdgpu 0000:4c:00.0: amdgpu: GPU smu mode1 reset
 kernel: amdgpu 0000:4c:00.0: amdgpu: GPU reset succeeded, trying to resume
 kernel: [drm] PCIE GART of 512M enabled (table at 0x0000008000300000).
 kernel: [drm] VRAM is lost due to GPU reset!
 kernel: [drm] PSP is resuming...
 kernel: [drm] reserve 0xa00000 from 0x83fe000000 for PSP TMR
 kernel: amdgpu 0000:4c:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode=
 is
not available
 kernel: amdgpu 0000:4c:00.0: amdgpu: SMU is resuming...
 kernel: amdgpu 0000:4c:00.0: amdgpu: smu driver if version =3D 0x00000040,=
 smu
fw if version =3D 0x00000041, smu fw program =3D 0, version =3D 0x003a5400 =
(58.84.0)
 kernel: amdgpu 0000:4c:00.0: amdgpu: SMU driver if version not matched
 kernel: amdgpu 0000:4c:00.0: amdgpu: use vbios provided pptable
 kernel: amdgpu 0000:4c:00.0: amdgpu: SMU is resumed successfully!
 kernel: [drm] DMUB hardware initialized: version=3D0x02020013
 kernel: [drm] kiq ring mec 2 pipe 1 q 0
 kernel: [drm] VCN decode and encode initialized successfully(under DPG Mod=
e).
 kernel: [drm] JPEG decode initialized successfully.
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on h=
ub 0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on =
hub
0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on =
hub
0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on =
hub
0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on =
hub
0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on =
hub
0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on =
hub
0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on =
hub
0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on=
 hub
0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on =
hub
0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on hub 0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring sdma2 uses VM inv eng 14 on hub 0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring sdma3 uses VM inv eng 15 on hub 0
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng 0 on h=
ub 1
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv eng 1 on=
 hub
1
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv eng 4 on=
 hub
1
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring vcn_dec_1 uses VM inv eng 5 on h=
ub 1
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring vcn_enc_1.0 uses VM inv eng 6 on=
 hub
1
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring vcn_enc_1.1 uses VM inv eng 7 on=
 hub
1
 kernel: amdgpu 0000:4c:00.0: amdgpu: ring jpeg_dec uses VM inv eng 8 on hu=
b 1
 kernel: amdgpu 0000:4c:00.0: amdgpu: recover vram bo from shadow start
 kernel: amdgpu 0000:4c:00.0: amdgpu: recover vram bo from shadow done
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: amdgpu 0000:4c:00.0: amdgpu: GPU reset(1) succeeded!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm] Skip scheduling IBs!
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser
-125!
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 vivaldi-stable.desktop[49450]:
[49657:49664:0930/100759.348288:ERROR:display.cc(286)] Frame latency is
negative: -210.699 ms
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[3076]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: amdgpu_cs_query_fence_status failed.
 org.gnome.Totem[67100]: amdgpu: The CS has been cancelled because the cont=
ext
is lost.
 org.gnome.Totem[67100]: amdgpu: The CS has been cancelled because the cont=
ext
is lost.
 org.gnome.Totem[67100]: amdgpu: The CS has been cancelled because the cont=
ext
is lost.
 org.gnome.Totem[67100]: amdgpu: The CS has been cancelled because the cont=
ext
is lost.
 org.gnome.Totem[67100]: amdgpu: The CS has been cancelled because the cont=
ext
is lost.
 org.gnome.Totem[67100]: amdgpu: The CS has been cancelled because the cont=
ext
is lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.
 gnome-shell[2555]: amdgpu: The CS has been cancelled because the context is
lost.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
