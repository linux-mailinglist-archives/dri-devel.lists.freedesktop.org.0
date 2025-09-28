Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906F0BA7675
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 20:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A69010E15E;
	Sun, 28 Sep 2025 18:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LvXug8Uq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8210E10E15E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 18:56:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2150843A35
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 18:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00151C4CEF0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 18:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759085806;
 bh=hfXGDoKxLqQKbYdLqxNg0ng+090YYT3+VFNyd2LX4QE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LvXug8UqV2PeTdm0Edpl9YLXD2uSIkfUkdxBg+qYdq/kws1S1mTnkhv3Uk8YEdQMW
 M4S2z88vTWqhNeuvihR3gJ0kGd6+oexS1amfDFgjpeuKMMby6MpIecOqSq7haNXe/a
 Ivrt+5lnilcK4fvek0/ruJPEzn0kZH4AKb+mw3As58aOPLDxPvXDK+gj64TVj0ALqu
 fxndKZRHnmcemsgLlZ429fUrJqzsAr4wfHLJkd1aBA5RymumjyrQyw6LGO3x/HkR2d
 MwkJ9E7SOdBGuL8Du+rLXW88KCp2G3/dpJw3vQkGDCXOjrFxvJB9F+VC1yrtl1HxpT
 T0E8mg4MrIvWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E9967C3279F; Sun, 28 Sep 2025 18:56:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220608] Tegra-X1 (t210) error on nouveau_drm initialization
Date: Sun, 28 Sep 2025 18:56:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220608-2300-Q7LGeeLlCy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220608-2300@https.bugzilla.kernel.org/>
References: <bug-220608-2300@https.bugzilla.kernel.org/>
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

--- Comment #2 from dofficialgman@gmail.com ---
(In reply to dofficialgman from comment #1)
> Created attachment 308727 [details]
> typical dmesg logs

sorry forgot to actually turn on the display in that log for a few minutes.
append this to the end.

[  327.783862] Console: switching to colour frame buffer device 480x135
[  327.808636] drm drm: [drm] fb0: tegradrmfb frame buffer device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
