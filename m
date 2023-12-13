Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B33180A652
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 15:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294EF10E1B7;
	Fri,  8 Dec 2023 14:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D52210EAB1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 14:55:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8856461D62
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 14:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39902C433CA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 14:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702047326;
 bh=eUMQq9T+TApBxu6iQOUQip4Kes/02lUTCh8mCv/C9XI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UPhYt5XuYFk6qWDoOJqSz4VzD4Ct52xbP7F/x6IAet5iBHGXBOuuMfiMY1WAj/vvi
 VTo5GFEF6tOizDBLH2agTiE5tJbajxSUIHNyqv08mBrRQ8qGV7rumCMUkJm0xz3S2r
 oRzMQZk8UjP2L0gjH5InngYAbJ8aM0XHcPk9a3DN6iwrHwAHJyAAbQRjHUqFc5dtaZ
 yZ0mhZVC0Vd+DO2W+JLySFpT6X9N+7p2f0ict2iCPGur+LyS6VLaM4ds0KF9u/KxYF
 9XtbDkeuNpRdHtGMEE7w++jL602Q75TO29Sr232HXWUvemJKLSbeMZh3X+FTtrt3rg
 JemTqVfxsZWLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 24D61C53BD2; Fri,  8 Dec 2023 14:55:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218241] amdgpu: MODE2 reset
Date: Fri, 08 Dec 2023 14:55:24 +0000
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
Message-ID: <bug-218241-2300-RWnNEXc42V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218241-2300@https.bugzilla.kernel.org/>
References: <bug-218241-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218241

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
