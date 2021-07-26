Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7353D682E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 22:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927EC73186;
	Mon, 26 Jul 2021 20:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12D673186
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 20:35:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6717260F9B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627331739;
 bh=5IbJhLFhNq4MJCuxf6dS1ZbdsLNNGlz9Io5gtp//a+0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KWpRYB3hGOqlqV4EHZB6+1i75NqNLfOZ3hT4CD2SKHnrKFu6/IoI5/5OHX83O2FgE
 WK/v39qV/2kSUlz3ZH4frJAJfC2VIHezDbRMCsvEzdFdkA1SZ2twQXvWB+M343in/P
 C1mxYNnNUJuIdZM5DzO3JBHwwhjG2rcnAdAZosfbk121yUdlF24vcaqeUkC45SiJ3L
 HZtp8zv9NZtHmmy4ggWx+Rt8gRFAk0HqcZN5L27LECYfLUhs+75ibpjZ6g/1umCzOF
 Ji+Mx1npdQPDiVk22iJKyVjXkX/48GSFb5TzPsgmKxxuPoVFO7kUXPfrVQdxnlqFo8
 lYPCUllL2rQeA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 629E96017E; Mon, 26 Jul 2021 20:35:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Mon, 26 Jul 2021 20:35:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jesper@jnsn.dev
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-FvqTCJT2VJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

jesper@jnsn.dev changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jesper@jnsn.dev

--- Comment #14 from jesper@jnsn.dev ---
I'm now seeing this bug again. This time it happening while launching dota2.

Hardware:
 RX 5700 XT
 Ryzen 3800X

Software:
 Mesa 21.1.5 (arch mainline)
 Linux 5.13.4.arch2-1

Log (Notice that it's most recent first):
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: GPU
reset(2) succeeded!
 Jul 26 22:15:55 delusionalStation kernel: [drm:amdgpu_cs_ioctl [amdgpu]]
*ERROR* Failed to initialize parser -125!
 Jul 26 22:15:55 delusionalStation kernel: [drm] Skip scheduling IBs!
 ... A bunch of repeats
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: rec=
over
vram bo from shadow done
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: rec=
over
vram bo from shadow start
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
jpeg_dec uses VM inv eng 5 on hub 1
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
vcn_enc1 uses VM inv eng 4 on hub 1
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
vcn_enc0 uses VM inv eng 1 on hub 1
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
vcn_dec uses VM inv eng 0 on hub 1
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
sdma1 uses VM inv eng 13 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
sdma0 uses VM inv eng 12 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
kiq_2.1.0 uses VM inv eng 11 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
comp_1.3.1 uses VM inv eng 10 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
comp_1.2.1 uses VM inv eng 9 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
comp_1.1.1 uses VM inv eng 8 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
comp_1.0.1 uses VM inv eng 7 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
comp_1.3.0 uses VM inv eng 6 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
comp_1.2.0 uses VM inv eng 5 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
comp_1.1.0 uses VM inv eng 4 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
comp_1.0.0 uses VM inv eng 1 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: ring
gfx_0.0.0 uses VM inv eng 0 on hub 0
 Jul 26 22:15:55 delusionalStation kernel: [drm] JPEG decode initialized
successfully.
 Jul 26 22:15:55 delusionalStation kernel: [drm] VCN decode and encode
initialized successfully(under DPG Mode).
 Jul 26 22:15:55 delusionalStation kernel: [drm] kiq ring mec 2 pipe 1 q 0
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: SMU=
 is
resumed successfully!
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: SMU=
 is
resuming...
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu:
SECUREDISPLAY: securedisplay ta ucode is not available
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: RAP:
optional rap ta ucode is not available
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: RAS:
optional ras ta ucode is not available
 Jul 26 22:15:55 delusionalStation kernel: [drm] reserve 0x900000 from
0x81fe400000 for PSP TMR
 Jul 26 22:15:55 delusionalStation kernel: [drm] PSP is resuming...
 Jul 26 22:15:55 delusionalStation kernel: [drm] VRAM is lost due to GPU re=
set!
 Jul 26 22:15:55 delusionalStation kernel: [drm] PCIE GART of 512M enabled
(table at 0x0000008000300000).
 Jul 26 22:15:55 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: GPU
reset succeeded, trying to resume
 Jul 26 22:15:51 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: BACO
reset
 Jul 26 22:15:51 delusionalStation kernel: [drm] free PSP TMR buffer
 Jul 26 22:15:51 delusionalStation kernel: [drm:gfx_v10_0_hw_fini [amdgpu]]
*ERROR* failed to halt cp gfx
 Jul 26 22:15:51 delusionalStation kernel: [drm:gfx_v10_0_hw_fini [amdgpu]]
*ERROR* KCQ disable failed
 Jul 26 22:15:51 delusionalStation kernel: amdgpu 0000:0a:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
 Jul 26 22:15:51 delusionalStation kernel: [drm:gfx_v10_0_hw_fini [amdgpu]]
*ERROR* KGQ disable failed
 Jul 26 22:15:51 delusionalStation kernel: amdgpu 0000:0a:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
 Jul 26 22:15:51 delusionalStation kernel: amdgpu 0000:0a:00.0: amdgpu: GPU
reset begin!
 Jul 26 22:15:51 delusionalStation kernel: [drm:amdgpu_job_timedout [amdgpu=
]]
*ERROR* Process information: process dota2 pid 31372 thread dota2:cs0 pid 3=
1391
 Jul 26 22:15:51 delusionalStation kernel: [drm:amdgpu_job_timedout [amdgpu=
]]
*ERROR* ring gfx_0.0.0 timeout, signaled seq=3D13190067, emitted seq=3D1319=
0069
 Jul 26 22:15:51 delusionalStation kernel: [drm:amdgpu_dm_atomic_commit_tail
[amdgpu]] *ERROR* Waiting for fences timed out!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
