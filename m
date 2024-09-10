Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C077974485
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 23:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD6810E854;
	Tue, 10 Sep 2024 21:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u8ExseNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD0810E854
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 21:07:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6739F5C05EF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 21:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86AC9C4CED3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 21:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726002432;
 bh=uXNnBvuZ5RGN0+Ivh4+xocjVQ6011iaaRNUwg0GiiOw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=u8ExseNzEh/Rh5Rz+qrzomvftgprCKCdjxg5QBdPaZMLkr2I7Uj70IsR6gJzm1vLa
 v28uFJCbuDWA3wdK/VhFhgIRWjsHSchbEt9+kHmpTfp0/zpaBgW271djaq++u8X/QM
 aKmgz34KZt6zcKCcarwFxZ0wkmpOZ/5sb6P6w92Ld1dkmXdgDB5MPZs/cqvKJ4GMY5
 +AGFopR+PqbOBfIIvBxVhSN7lIG2+2nORcZCg64vY1ZF/tMKFWVtp5eG0df+xn07Ym
 RU4woTghGauzzTz11qDTzztIZa9/5W2j+phTZ5smFGBIfmUouYI1z6MdI37Br/QDUn
 a4a1AorDfuv3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 81969C53BC5; Tue, 10 Sep 2024 21:07:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 195159] nouveau incorrect ACPI usgage results in ACPI Error :
 AE_AML_PACKAGE_LIMIT
Date: Tue, 10 Sep 2024 21:07:11 +0000
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
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-195159-2300-G7jo41AVdb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-195159-2300@https.bugzilla.kernel.org/>
References: <bug-195159-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D195159

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #14 from Artem S. Tashkinov (aros@gmx.com) ---
The nouveau project is severely underfunded and understaffed, so don't expe=
ct
this bug report to be fixed any time soon or ever.

Also, it makes sense to file it where it should belong:
https://gitlab.freedesktop.org/drm/nouveau/-/issues/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
