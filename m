Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D22881894
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E2A10F1E9;
	Wed, 20 Mar 2024 20:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BSY2K/ou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6626B10F1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:28:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 81A2F610A0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E7E4C433C7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710966518;
 bh=8hipNFuc6J6JucaJQ63lbBtcsXYM8F7k8bhoQmw3gco=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BSY2K/ou9ycYOYQIwlMuI2h2EqTEoJDKG9wSKrz6vLeiH3cUPCTI5tKYU+nahwvHD
 rdbgFS+CyMrEEC+Lwk1ZuzH4iJjwZ1IkceOHeHWsFnMOKCl6jZmWz0rU5KJNXPgxYF
 UuctuovOpLskDLGxyV+6coHuqnFkrDiw30bi4IvCS5naIx+AeFug6OMYYPOPjDOgND
 Q9s9GJSigIs7Ipy/psuAwwA9ZGeC7gplsvYLe8NhPmSartcdpObg9WX9KDvFEDwXOC
 lFq5iFI1X/rWeBAgrcbDxOY59z19ZjLXIcBbC9w6nlRVy8vTCIJn2Svhh9KwQLz9PE
 3rrh1FnQSo4sA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 48BF8C53BCD; Wed, 20 Mar 2024 20:28:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218617] Linux Kernel Bug Report: "Scheduling while atomic"
 Kernel Panic and System Freeze on NVIDIA RTX 2000 Ada Generation Laptop GPU
Date: Wed, 20 Mar 2024 20:28:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: sarah.salzstein@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218617-2300-rXlMYA98i7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218617-2300@https.bugzilla.kernel.org/>
References: <bug-218617-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218617

--- Comment #2 from Sarah S. (sarah.salzstein@gmail.com) ---
Thank you for letting me know!

Sincerely,
Sarah S.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
