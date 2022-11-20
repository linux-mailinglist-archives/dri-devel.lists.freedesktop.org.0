Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3591A6316A6
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 22:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B3C10E0E1;
	Sun, 20 Nov 2022 21:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4316610E0E1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 21:57:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85DA960D3C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 21:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6235C4314D
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 21:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668981472;
 bh=5zncm2LX40yHS6B6lCD8aziXf4cmqdGo6Nn5HyCbpro=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PhONLo1HpKb90fs7cQVxWpkBZ3/sLoOJxFMEh9EX8VE65lzzY+5R0OfCQ7DII2CqJ
 IUoNp9wUbLhLxjgZlP4rzTGH4wYJw4TMECulYl2O4zfmTG2lMLoCnq591mRNgGHHSp
 tvEj98yNTxzIknOUI9lHxmX7TTo2BYLkw/lfo+FH99zAsO+er10DctkYxNZhpJPf2u
 P36nify+qM43WLK8hPjhueKbmdq1Tt/KjQlIv+4szYhfqXqWcRjZaCJ9Yap69vk4jD
 55qaryLSs6+ZCI29iGBlXigYLKN3QnJnYaRXog58OYlv09bZP3Psufj/BJXFRVYU/J
 IXJWa1yRUpRdA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D447BC433E9; Sun, 20 Nov 2022 21:57:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sun, 20 Nov 2022 21:57:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sgasgar@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-usxsIxzpfz@https.bugzilla.kernel.org/>
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

Viktor (sgasgar@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sgasgar@gmail.com

--- Comment #29 from Viktor (sgasgar@gmail.com) ---
Same problem on Lenovo Thinkpad T14 Gen3 with Ryzen 7 and Radeon 680M.
Spontaneous freezes on kernels 5.17.* and 6.0.*.=20
Here is the log:
Nov 20 22:31:39 calculate kernel: [drm:amdgpu_dm_commit_planes [amdgpu]]
*ERROR* Waiting for fences timed out!
Nov 20 22:31:39 calculate kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma0 timeout, signaled seq=3D146659, emitted seq=3D146661
Nov 20 22:31:39 calculate kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Nov 20 22:31:39 calculate kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset be=
gin!
Nov 20 22:31:39 calculate kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring gfx_0.0.0 timeout, signaled seq=3D986766, emitted seq=3D986766
Nov 20 22:31:39 calculate kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process X pid 4963 thread X:cs0 pid 5224
Nov 20 22:31:39 calculate kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset be=
gin!
Nov 20 22:31:39 calculate kernel: amdgpu 0000:04:00.0: amdgpu: Bailing on T=
DR
for s_job:df2df, as another already in progress
Nov 20 22:31:40 calculate kernel: amdgpu 0000:04:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
Nov 20 22:31:40 calculate kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* =
KGQ
disable failed
Nov 20 22:31:40 calculate kernel: amdgpu 0000:04:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
Nov 20 22:31:40 calculate kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* =
KCQ
disable failed
Nov 20 22:31:40 calculate kernel: [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR*
failed to halt cp gfx
Nov 20 22:31:40 calculate kernel: [drm] free PSP TMR buffer
Nov 20 22:31:40 calculate kernel: amdgpu 0000:04:00.0: amdgpu: MODE2 reset
Nov 20 22:31:40 calculate kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset
succeeded, trying to resume
Nov 20 22:31:40 calculate kernel: [drm] PCIE GART of 512M enabled (table at
0x000000F4008C9000).
Nov 20 22:31:40 calculate kernel: [drm] PSP is resuming...
Nov 20 22:31:40 calculate kernel: [drm] reserve 0xa00000 from 0xf43f400000 =
for
PSP TMR
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: RAS: optional
ras ta ucode is not available
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: RAP: optional
rap ta ucode is not available
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: SECUREDISPLA=
Y:
securedisplay ta ucode is not available
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: SMU is
resuming...
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: SMU is resum=
ed
successfully!
Nov 20 22:31:41 calculate kernel: [drm] DMUB hardware initialized:
version=3D0x0400001A
Nov 20 22:31:41 calculate kernel: [drm] kiq ring mec 2 pipe 1 q 0
Nov 20 22:31:41 calculate kernel: [drm] VCN decode and encode initialized
successfully(under DPG Mode).
Nov 20 22:31:41 calculate kernel: [drm] JPEG decode initialized successfull=
y.
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring gfx_0.0=
.0
uses VM inv eng 0 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.=
0.0
uses VM inv eng 1 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.=
1.0
uses VM inv eng 4 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.=
2.0
uses VM inv eng 5 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.=
3.0
uses VM inv eng 6 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.=
0.1
uses VM inv eng 7 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.=
1.1
uses VM inv eng 8 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.=
2.1
uses VM inv eng 9 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.=
3.1
uses VM inv eng 10 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring kiq_2.1=
.0
uses VM inv eng 11 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring sdma0 u=
ses
VM inv eng 12 on hub 0
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_dec=
_0
uses VM inv eng 0 on hub 1
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_enc=
_0.0
uses VM inv eng 1 on hub 1
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_enc=
_0.1
uses VM inv eng 4 on hub 1
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: ring jpeg_dec
uses VM inv eng 5 on hub 1
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: recover vram=
 bo
from shadow start
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: recover vram=
 bo
from shadow done
Nov 20 22:31:41 calculate kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset(2)
succeeded!
Nov 20 22:31:41 calculate kernel: [drm] Skip scheduling IBs!
Nov 20 22:31:41 calculate kernel: [drm] Skip scheduling IBs!
Nov 20 22:31:41 calculate kernel: [drm] Skip scheduling IBs!
Nov 20 22:31:41 calculate kernel: [drm] Skip scheduling IBs!
Nov 20 22:31:41 calculate kernel: [drm] Skip scheduling IBs!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
