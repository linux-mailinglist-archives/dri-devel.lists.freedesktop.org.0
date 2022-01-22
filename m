Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B1D496E50
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 00:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBEE10E131;
	Sat, 22 Jan 2022 23:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F44710E131
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 23:54:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADFB260FDB
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 23:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B554C340F3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642895681;
 bh=TNiCh7/1Q5Seqjos/zqabQwTk9Rz/vX4wePYNCENZ9I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EPTLP5HK1kOgOduJ5wx2Y/5+7niJPa+OakfaXmAqHmNSNWar8I4LpE+LLJtkLp+Fb
 ggVsmEYfJXy5iRR/VWaPsTEaKMYxsGZFC+QDjG50Tez90HI2UlQ0TlTASOWrGzh3Hv
 /xCbV6kLU57d7M7hQHdInp6ZHn+KP1PtGEww7v64iDH0CvG6F5QEnL4uv9p3Y9NALh
 gdDVMU7dGypndH7cfpX9L/fQf+NMpTjkWZfa812sfbH26NTXSH/3RC/QLHNAtCO/g3
 pjfOpSNmIcFvLjUJ+YfenhRhjiQmMC1losZG7ZQvq/amliwliPgBVDU4TL3O4QApT0
 ccz5U6+wHSd2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0B176CC13B0; Sat, 22 Jan 2022 23:54:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 22 Jan 2022 23:54:38 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-1OB3sNF4Zn@https.bugzilla.kernel.org/>
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

techxgames@outlook.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |techxgames@outlook.com

--- Comment #55 from techxgames@outlook.com ---
I don't know if it's related, but my display freaks out before shutting off.
It's still on, and it doesn't reboot when I do it by SSH.  I have to do it =
on
the desktop itself.

Jan 22 06:17:30 Y4M1-II kernel: [drm:amdgpu_device_fw_loading [amdgpu]] *ER=
ROR*
resume of IP block <psp> failed -62
Jan 22 06:17:30 Y4M1-II kernel: [drm:psp_resume [amdgpu]] *ERROR* PSP resume
failed
Jan 22 06:17:30 Y4M1-II kernel: [drm:psp_hw_start [amdgpu]] *ERROR* PSP cre=
ate
ring failed!
Jan 22 06:17:30 Y4M1-II kernel: [drm] PSP is resuming...
Jan 22 06:17:30 Y4M1-II kernel: [drm] VRAM is lost due to GPU reset!
Jan 22 06:17:30 Y4M1-II kernel: [drm] PCIE GART of 512M enabled (table at
0x0000008000753000).
Jan 22 06:17:30 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset
succeeded, trying to resume
Jan 22 06:17:26 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 06:17:19 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU smu mode1
reset
Jan 22 06:17:19 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU mode1 reset
Jan 22 06:17:19 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: MODE1 reset
Jan 22 06:17:19 Y4M1-II kernel: [drm:amdgpu_device_ip_suspend_phase2 [amdgp=
u]]
*ERROR* suspend of IP block <psp> failed -22
Jan 22 06:17:19 Y4M1-II kernel: [drm:psp_suspend [amdgpu]] *ERROR* Failed to
terminate ras ta
Jan 22 06:17:19 Y4M1-II kernel: [drm] psp gfx command UNLOAD_TA(0x2) failed=
 and
response status is (0x0)
Jan 22 06:17:16 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 06:17:16 Y4M1-II kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Fail=
ed
to initialize parser -125!
Jan 22 06:17:15 Y4M1-II kernel: [drm] REG_WAIT timeout 1us * 200 tries -
hubp2_set_blank line:950
Jan 22 06:17:15 Y4M1-II kernel: [drm] REG_WAIT timeout 1us * 200 tries -
hubp2_set_blank line:950
Jan 22 06:17:15 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Failed to disa=
ble
gfxoff!
Jan 22 06:17:15 Y4M1-II kernel: [drm:drm_atomic_helper_wait_for_flip_done
[drm_kms_helper]] *ERROR* [CRTC:80:crtc-1] flip_done timed out
Jan 22 06:17:15 Y4M1-II kernel: [drm:drm_atomic_helper_wait_for_flip_done
[drm_kms_helper]] *ERROR* [CRTC:77:crtc-0] flip_done timed out
Jan 22 06:17:10 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: Bailing on TDR=
 for
s_job:18e3f, as another already in progress
Jan 22 06:17:10 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 22 06:17:10 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process Xorg pid 1688 thread Xorg:cs0 pid 1731
Jan 22 06:17:10 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
gfx_0.0.0 timeout, signaled seq=3D112513, emitted seq=3D112515
Jan 22 06:17:10 Y4M1-II kernel: amdgpu 0000:0c:00.0: amdgpu: GPU reset begi=
n!
Jan 22 06:17:10 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Jan 22 06:17:10 Y4M1-II kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma1 timeout, signaled seq=3D7058, emitted seq=3D7059
Jan 22 06:17:10 Y4M1-II kernel: [drm:amdgpu_dm_commit_planes [amdgpu]] *ERR=
OR*
Waiting for fences timed out!
Jan 22 06:17:05 Y4M1-II kernel: [drm:amdgpu_dm_commit_planes [amdgpu]] *ERR=
OR*
Waiting for fences timed out!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
