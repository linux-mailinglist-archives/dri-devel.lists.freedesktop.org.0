Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DFC93AFF8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 12:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969A410E08E;
	Wed, 24 Jul 2024 10:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AQ7X4eVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07FB10E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:50:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 09039CE1062
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45CD5C4AF0E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721818251;
 bh=ExanWLKvobMKDAJf9bdFTV7WOe8zzadLnCQ00M6YdyQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AQ7X4eVrXmIzohxB4LtqkFgN1kpKqrgn8CmYJXSKF43/PCD6LQV31PkwGTHZZkm3D
 UMGCN0tkRP/nxITGy0m6DtAw4CgUZlL3WGB+n+r4PTNW8B7EFbscMcPAeWHXLmCTJS
 BoLWbD+Ui++YuoyjEZpUnGzVKs1ARhBNCI2To0plZWMoUkoNMcqOytCxGgNKYYcsW1
 29PEJNz/EcLNG1TbqjFgm/99BU7wSvf+QhP17IYh8bsU/T96si5gfr+tcq+CwaEpT9
 dHUORTdudyPZNxrb+3F5vA+mE+ZW8zGc9Q0Nyig+QDlf4u27R0q6UW8mflWHSA+Qcf
 Qgn9fSmQvo1kA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 32F37C53B7F; Wed, 24 Jul 2024 10:50:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219091] amdgpu: after updating to linux 6.10, screen flickering
 occurs
Date: Wed, 24 Jul 2024 10:50:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219091-2300-U944lW2ov9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219091-2300@https.bugzilla.kernel.org/>
References: <bug-219091-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219091

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report to https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
