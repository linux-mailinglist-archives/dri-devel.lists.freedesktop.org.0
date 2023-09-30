Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0C7B3FEE
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 12:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DD910E163;
	Sat, 30 Sep 2023 10:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C13810E163
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 10:25:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 53AC760B33
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 10:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 263CCC433C8
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696069557;
 bh=PffAAn38O3DC22IiVdpIdYp3TDF2ea1XfIBoUvpCKes=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FAeLE8C2F8XDqlCQQ8ZDdHJ1D+iMWAJfnpAvtK/zGPQkoGXuKzn3i5IEzGXzFjJZa
 QxTkXtrAtoPHWDzbNM5V2IE7rQA59hNQ2L6JcF41Rc4tFm6ztLQuGliny/IBSFy+O8
 o0CM8nYSEXjQrOhk6s5E1A6eN6f44O3k1tGjZCcuT01NEjnn8O+0L0s7XmbcJalJdV
 4l6p7ivD7B+eDwK4f1D9lFuYZ8M5yCDOQpP9TwWMzNiOgDJq0BRY+b8v0STH2en55Q
 sfnyyJEzcLGPhCGQMIjDkpm4I6/TkDfey90aC/orIXagUrojNWl31VTePTZyec1MdP
 A4FqC94A83DRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 17257C53BD3; Sat, 30 Sep 2023 10:25:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 30 Sep 2023 10:25:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-201957-2300-oi475Tbe5G@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #92 from Artem S. Tashkinov (aros@gmx.com) ---
AMDGPU development is on its own bug tracker:

https://gitlab.freedesktop.org/drm/amd/-/issues

If you're still affected, check for existing bug reports and if there are n=
one,
please repost over there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
