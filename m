Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21982537033
	for <lists+dri-devel@lfdr.de>; Sun, 29 May 2022 09:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BEA112306;
	Sun, 29 May 2022 07:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F5C112306
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 07:40:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62001B80ABA
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 07:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91321C341C4
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653810039;
 bh=qZtZdc/1C5etRJMexGn89ol8Y/iY/YW/a5e1F/Z0ATM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MGpgCA0+bjQygFTIHVKt2TDR982ygB6FJRr4pDr8aF7lZymhWchAhVGvI+gXlQD4J
 ftegMZFvQij5de7NmQVTc1l7zKQMxvIY6hMhpg2kekgVybXXGLPIfq8xP+77WcAnFS
 Mk/vVaztxdfnYN9lBqVlqh3v9p4wWOyS/OqDVox6tvIGzW+tTNm3TFaXPVNbMb1hEV
 W1ngu0unB0RRogHQTT5vNpHNtzsWrZnMBh6BZJan+VbamdcGIREnYxbwLUU6m1+5OY
 pd1n/jYyMzOCcM0mma/SKj1ldd1T4JedAk1vslcn52rrnjVZVTMnLm8wzl7uGafOG+
 CMeN6p7dpseJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7F9C1CC13B4; Sun, 29 May 2022 07:40:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sun, 29 May 2022 07:40:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nix.sasl@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-4iZYQxMua7@https.bugzilla.kernel.org/>
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

Nix\ (nix.sasl@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nix.sasl@gmail.com

--- Comment #17 from Nix\ (nix.sasl@gmail.com) ---
I have the exact bug, Lenovo LENOVO 81LW AMD Ryzen 3 3200U with Radeon Vega
Mobile Gfx
When run the OpenCL geekbench test or OpenCL in libreoffice.
With Vulkan works fine.

[11824.771725] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[11829.688441] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D1319920, emitted seq=3D1319922
[11829.688735] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xorg pid 1908 thread Xorg:cs0 pid 2276
[11829.689018] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
[11829.787762] [drm] free PSP TMR buffer
[11829.823613] CPU: 0 PID: 40202 Comm: kworker/u32:0 Tainted: G        W  O=
E=20=20=20
 5.18.0-2-MANJARO #1 e81df7241f6a360dc27e43ab195df7d97a8118f5
[11829.823619] Hardware name: LENOVO 81LW/LNVNB161216, BIOS ARCN37WW 05/14/=
2021
[11829.823621] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sche=
d]
[11829.823630] Call Trace:
[11829.823633]  <TASK>
[11829.823634]  dump_stack_lvl+0x48/0x5d
[11829.823640]  amdgpu_do_asic_reset+0x2a/0x470 [amdgpu
3e08061ca61bf3b1e24b4c9d96c6f8977494b21f]
[11829.823954]  amdgpu_device_gpu_recover_imp.cold+0x535/0x8ca [amdgpu
3e08061ca61bf3b1e24b4c9d96c6f8977494b21f]
[11829.824258]  amdgpu_job_timedout+0x18c/0x1c0 [amdgpu
3e08061ca61bf3b1e24b4c9d96c6f8977494b21f]
[11829.824541]  drm_sched_job_timedout+0x73/0x100 [gpu_sched
ac691790925fcace6384349a4c749a4fc130c519]
[11829.824548]  process_one_work+0x1c4/0x380
[11829.824552]  worker_thread+0x51/0x380
[11829.824554]  ? rescuer_thread+0x3a0/0x3a0
[11829.824557]  kthread+0xdb/0x110
[11829.824560]  ? kthread_complete_and_exit+0x20/0x20
[11829.824563]  ret_from_fork+0x1f/0x30
[11829.824568]  </TASK>
[11829.824571] amdgpu 0000:03:00.0: amdgpu: MODE2 reset
[11829.824616] amdgpu 0000:03:00.0: amdgpu: GPU reset succeeded, trying to
resume
[11829.825038] [drm] PCIE GART of 1024M enabled.
[11829.825039] [drm] PTB located at 0x000000F400900000
[11829.825055] [drm] PSP is resuming...
[11829.845091] [drm] reserve 0x400000 from 0xf47fc00000 for PSP TMR
[11829.919126] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[11829.925670] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot
available
[11830.673326] [drm] kiq ring mec 2 pipe 1 q 0
[11830.684064] [drm] VCN decode and encode initialized successfully(under S=
PG
Mode).
[11830.684072] amdgpu 0000:03:00.0: amdgpu: ring gfx uses VM inv eng 0 on h=
ub 0
[11830.684076] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1
on hub 0
[11830.684078] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4
on hub 0
[11830.684079] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 5
on hub 0
[11830.684082] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 6
on hub 0
[11830.684083] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 7
on hub 0
[11830.684085] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 8
on hub 0
[11830.684087] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 9
on hub 0
[11830.684089] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 10
on hub 0
[11830.684091] amdgpu 0000:03:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng =
11
on hub 0
[11830.684093] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on=
 hub
1
[11830.684094] amdgpu 0000:03:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 =
on
hub 1
[11830.684096] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4=
 on
hub 1
[11830.684098] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5=
 on
hub 1
[11830.684100] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6=
 on
hub 1
[11830.688342] [drm:amdgpu_dm_set_vline0_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_vline0_irq_state: crtc is NULL at id :3
[11830.688698] [drm:amdgpu_dm_set_vline0_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_vline0_irq_state: crtc is NULL at id :3
[11830.689009] [drm:amdgpu_dm_set_vline0_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_vline0_irq_state: crtc is NULL at id :3
[11830.689319] [drm:amdgpu_dm_set_crtc_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_crtc_irq_state: crtc is NULL at id :3
[11830.689628] [drm:amdgpu_dm_set_crtc_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_crtc_irq_state: crtc is NULL at id :3
[11830.689933] [drm:amdgpu_dm_set_crtc_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_crtc_irq_state: crtc is NULL at id :3
[11830.690243] [drm:amdgpu_dm_set_pflip_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_pflip_irq_state: crtc is NULL at id :3
[11830.690551] [drm:amdgpu_dm_set_pflip_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_pflip_irq_state: crtc is NULL at id :3
[11830.690860] [drm:amdgpu_dm_set_pflip_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_pflip_irq_state: crtc is NULL at id :3
[11830.691169] [drm:amdgpu_dm_set_pflip_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_pflip_irq_state: crtc is NULL at id :3
[11830.691478] [drm:amdgpu_dm_set_vupdate_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_vupdate_irq_state: crtc is NULL at id :3
[11830.691807] [drm:amdgpu_dm_set_vupdate_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_vupdate_irq_state: crtc is NULL at id :3
[11830.692112] [drm:amdgpu_dm_set_vupdate_irq_state [amdgpu]] *ERROR*
amdgpu_dm_set_vupdate_irq_state: crtc is NULL at id :3
[11830.696428] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow sta=
rt
[11830.696430] amdgpu 0000:03:00.0: amdgpu: recover vram bo from shadow done
[11830.696432] [drm] Skip scheduling IBs!
[11830.696434] [drm] Skip scheduling IBs!
[11830.696498] amdgpu 0000:03:00.0: amdgpu: GPU reset(2) succeeded!
[11830.696501] [drm] Skip scheduling IBs!
[11830.696511] [drm] Skip scheduling IBs!
[11830.696518] [drm] Skip scheduling IBs!
[11830.696523] [drm] Skip scheduling IBs!
[11830.696529] [drm] Skip scheduling IBs!
[11830.696535] [drm] Skip scheduling IBs!
[11830.696541] [drm] Skip scheduling IBs!
[11830.696547] [drm] Skip scheduling IBs!
[11830.696554] [drm] Skip scheduling IBs!
[11830.696631] [drm] Skip scheduling IBs!
[11830.696729] [drm] Skip scheduling IBs!
[11830.696748] [drm] Skip scheduling IBs!
[11830.696822] [drm] Skip scheduling IBs!
[11830.696832] [drm] Skip scheduling IBs!
[11830.696850] [drm] Skip scheduling IBs!
[11830.696857] [drm] Skip scheduling IBs!
[11830.696864] [drm] Skip scheduling IBs!
[11830.696870] [drm] Skip scheduling IBs!
[11830.696876] [drm] Skip scheduling IBs!
[11830.696883] [drm] Skip scheduling IBs!
[11830.696898] [drm] Skip scheduling IBs!
[11830.696905] [drm] Skip scheduling IBs!
[11830.696913] [drm] Skip scheduling IBs!
[11830.696930] [drm] Skip scheduling IBs!
[11830.697050] [drm] Skip scheduling IBs!
[11830.697059] [drm] Skip scheduling IBs!
[11830.697098] [drm] Skip scheduling IBs!
[11830.697107] [drm] Skip scheduling IBs!
[11830.697116] [drm] Skip scheduling IBs!
[11830.697125] [drm] Skip scheduling IBs!
[11830.697142] [drm] Skip scheduling IBs!
[11830.699931] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11830.708071] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11830.708980] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11830.710191] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11830.711089] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11830.711615] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11830.712737] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11830.713297] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11830.713959] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[11830.714583] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
