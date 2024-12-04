Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4669E375D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024E410E13C;
	Wed,  4 Dec 2024 10:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n8RLKl+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7294010E13C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:20:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2F00CA40D81
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03DFDC4AF09
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733307646;
 bh=LHhR/E6xf4B2cv0CSxnyYmRwf3ELoJdz/5uDvA9HjVw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=n8RLKl+vKXHhsyCnkes7fy0DTLWDbQsZlTGFg14XmOIjKLeZaoyskt3oXe7rI/97U
 Ztc0ypgu4riaQfZnXHnPhCoGzYE5Rq9PdzxF/OS6KfmEtjNBHSSmHb85qi6g2seKL4
 YUm9vF1pxuXfk5ck6Jgm5G2//agO8MPpYCkClIMml1/wD5spE+FD00ojM8Ob/Q7zhu
 fDdPOBgiJy1sf+IABmg+fefJEQeYsDrcGwDp/i/NNTEOxticmSjjy3e6L6ki86x5nS
 FsLZUOq++p3i4DvZ/wkTqqzgAcEc+cZltTEzgkdOglgPZY+U5GIqNiFNOw6duc1g3y
 xsZI6YG4s0+5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E97E4C41614; Wed,  4 Dec 2024 10:20:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219556] AMDGPU monitoring is broken
Date: Wed, 04 Dec 2024 10:20:45 +0000
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
Message-ID: <bug-219556-2300-L621bE0Oid@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219556-2300@https.bugzilla.kernel.org/>
References: <bug-219556-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219556

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost here https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
