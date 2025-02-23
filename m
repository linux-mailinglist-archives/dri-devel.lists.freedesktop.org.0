Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7ADA420F9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D20F10E3CE;
	Mon, 24 Feb 2025 13:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nRtql3Mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558A210E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 20:39:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C0ECB5C6348
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 20:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D8BFC4CEE9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740343187;
 bh=DW4Q5sfNE6Ctl1YAAY2eSMTxZNd2Y2i3drXpD2UU5wo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nRtql3MhOPLvNeVq9bF+kULXrakpaiGy039lU7wEXOJddQF0DeKWU12k0HiOlV7bD
 TPtQg3BF5wA2U89PHJ0scTPv5dM5/CWNEyWDPbtkpXXjd43Lua+Z/sWWN2d3IYSxBR
 Jed0zQ34O7ci6a70Gid14KFnBhgEebtchvg8y7jvoapUeG+ZppoPXrvnRUsDRJdb4C
 vmFX1PzWqh4NqOe3EDzhLthQh33LmUVgiIFc7pvnVTEtrqro9pNC42vzmGINsUTEp/
 OQXN7l1C99E7LMw5flXMC5ISCJvbS/ocSTHU7ZokRp0PsCsoHPH+k9drwOWiLwKYQ4
 qOLD4GHwDtDQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 650BEC41616; Sun, 23 Feb 2025 20:39:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219808] Commit 5009628d8509dbb90e1b88e01eda00430fa24b4b Breaks
 AMDGPU
Date: Sun, 23 Feb 2025 20:39:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219808-2300-dx2EDiicKZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219808-2300@https.bugzilla.kernel.org/>
References: <bug-219808-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219808

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
