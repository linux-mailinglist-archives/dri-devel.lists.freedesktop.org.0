Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7B8FE66E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 14:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D42010E91A;
	Thu,  6 Jun 2024 12:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pxCspmq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA8510E91A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 12:26:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D76161D5A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 12:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 322B9C3277B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717676772;
 bh=7hXcjtmilGt7K4/rMAah1g0K7GJnukn6GLTcY8zP300=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pxCspmq98IZppykrEAl6FYvwpKagfvUZmtRy2TTa11zGbtnZLV/ZHIZpuu7fBQ7Tt
 X8G8MuN/1EoQyTl2XdDY6QYyX+U3DyUpbrH/vHRuITmlO0f7mhmyFpdtqvM++XHLOZ
 sfxthyYNHfyQd7IK/2yOhEkyvywZOtoBHSvX3qTru3gc6VYw3C1FJsqRuTItQ0bEES
 CBTrE7i6DkSpZTHxgqHe+ODFsJlbk94YxFCyY/F3Km05680nZUTjUxyiFiigWgbNBZ
 3pnS0HOhYQ0jwlbiKvHdhY1LHAZErKtkeqGm2asi8fcgjhrIynEp5P7Dgapj7jvyNx
 wCmmZCsjtKLMA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 296F3C53BB7; Thu,  6 Jun 2024 12:26:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Thu, 06 Jun 2024 12:26:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: i.r.e.c.c.a.k.u.n+bugzilla.kernel.org@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218900-2300-CzNcq4RVMj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

Hanabishi (i.r.e.c.c.a.k.u.n+bugzilla.kernel.org@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |i.r.e.c.c.a.k.u.n+bugzilla.
                   |                            |kernel.org@gmail.com

--- Comment #14 from Hanabishi (i.r.e.c.c.a.k.u.n+bugzilla.kernel.org@gmail=
.com) ---
*** Bug 218921 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
