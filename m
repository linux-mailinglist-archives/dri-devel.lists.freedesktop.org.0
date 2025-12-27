Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64372CE0174
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 20:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C603F10EEDF;
	Sat, 27 Dec 2025 19:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b3+RVgHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313E210EEDF
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:30:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C0FC40C1F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1DC4C4CEFB
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766863816;
 bh=c95/Hul1oJqAzDwkJA2T7Q4DaT4AxBGYSVtFjyEiSzI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=b3+RVgHPIAMBODFcoM/SpjugSLzhd8uGRzCIbsl+gxafaJAPeaWLZjlY7OoTHiY1D
 nz/Ayw3CjlPIz5hIgOtJYwOaxqgdyaF2Z0jHfGjTCoo+0osKlL8ushAAQaxOT1dZSx
 Ll7iMxFNLYuO0luWatHxJ8RBeYMWnSFtxHlwKLrPsa3uQmKPKdahypVBez1rC9BWc5
 tYa6R95sMd3cZNkw+1ax5Y2EE1Ucjzye8F1HOCQlP5fChyPjVaBZHO3NeAMRrtOXXi
 Gy8bVPY6xAiQc9V6ivuPoa12nIfRHr2JvIdCERurRuAihzlimVKS9b7KJiWivFUUkm
 ZpxOvbWJkPgwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D6FD2C41614; Sat, 27 Dec 2025 19:30:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220906] Regression: 4K display output fails on ThinkPad
 Thunderbolt 4 Dock with AMD GPU (Worked in 6.17.1, broken in 6.17.11)
Date: Sat, 27 Dec 2025 19:30:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danandrei@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220906-2300-mmHj5qKRkS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220906-2300@https.bugzilla.kernel.org/>
References: <bug-220906-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220906

--- Comment #5 from Andrei (danandrei@gmail.com) ---
Created attachment 309090
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309090&action=3Dedit
dmesg_6.17.6-300.fc43.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
