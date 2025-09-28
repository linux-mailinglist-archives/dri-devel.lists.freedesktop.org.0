Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698C5BA765D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 20:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8766F10E158;
	Sun, 28 Sep 2025 18:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tPMRWHSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FAA10E158
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 18:49:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7B602621AE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 18:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23B02C4CEF7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 18:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759085341;
 bh=q0ZpA+bu3IiQT9yq+bqjmbTVMfobmlvEIkGuRagzFLc=;
 h=From:To:Subject:Date:From;
 b=tPMRWHSuohmL24TEAGiBhyeVohdtkhQXx3sqBCJW05Oo9oUTiMJ9k82ukssb9HBfB
 cOxV25720vKQTJbXSkGJu9p9anMOKqL/nxOffOX4pANcsNehKW66qv5iHJzlzC3S0y
 FfmRgu/y5XNodfRRtPgrrAg3c3SUA2Oorh+aTJQdhvGLNX1MBnYRh9p5y7nO/6Ywo7
 NSM8Zw8fj4eWjLRI5WSK7dFcn2hMc3Fss5HF63lwa9Fp8UzdWdu3gxv43ancDe9jkN
 3b3P5Wiss8BPHWmMgRjDFYWx6zorRXMdyc1avGvcLKTn+RHPH7F2LKk/nZGQsAfun1
 B5YL7h48bRrkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 18496C3279F; Sun, 28 Sep 2025 18:49:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220608] New: Tegra-X1 (t210) error on nouveau_drm initialization
Date: Sun, 28 Sep 2025 18:49:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: dofficialgman@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220608-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220608

            Bug ID: 220608
           Summary: Tegra-X1 (t210) error on nouveau_drm initialization
           Product: Drivers
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dofficialgman@gmail.com
        Regression: No

Created attachment 308726
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308726&action=3Dedit
gdb of glmark2-drm segfault

I am running the latest kernel release (6.16 at the time of writing) with a=
 few
in-progress patches added in order to support my hardware and non-boot clock
speeds (none of which affect the presence of this issue). The latest MESA
stable release (25.2.3) is also used compiled with debug symbols.

The issue I am running into is that all graphics using the MESA drivers (X1=
1,
Wayland, DRM, etc) fail to initialize which seems to come down to nouveau_d=
rm
failing (see attached gdb from glmark2-drm).

I have also attached some typical dmesg boot logs incase they contain any
useful information.

I am not a programmer by trade but I am fully able to compile MESA and the
Linux kernel with any test patches that may be useful in debugging this iss=
ue.
Just let me know what would be helpful.

My hardware in use is the Jetson Nano 2GB Devkit. My kernel branch is
https://gitlab.com/theofficialgman/linux/-/tree/6.16-jetson-nano-2gb?ref_ty=
pe=3Dheads

Thanks,
theofficialgman

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
