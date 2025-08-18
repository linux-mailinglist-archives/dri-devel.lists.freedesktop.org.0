Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BCB2B0EB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 20:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F013810E4B8;
	Mon, 18 Aug 2025 18:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tvwFgFAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECBF10E4B4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:57:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EC8A5C62C9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09934C16AAE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755543421;
 bh=Q7cQms0VpVYJsFfcAc26tZGqMQUOZNJMK9wUTIEEqvE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tvwFgFACoLR8xrccSOqsW2DjACkqby2mJuPBWy8mXuW3itr5P8D8nCKqo3FRD9V/6
 1TBEbZbryIay1nOKdiLnyAzN/RnmQ1ff+98PfnBo0HIY3CzHoTzNWskWgloOgnLmdp
 777hh1R6/OMygdNKU4Sia3jWiOVXREUr3OHaBy0F5R1AdfSjaW/qOyr9bDOsqH3VnN
 i14HYLtCHIYJQfenUe1MaMMBgebQlmcGBcejGeFW+w8tM9ag4yLXkJMq/Jj8MyLoxa
 Pqr/z61liagoFhAdru16PXKoydKcu6WUPyOroqisBR/zXOKrqwb/1MbKs+ia7B7yB2
 3z96SXSzMjhIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E8BADC53BC5; Mon, 18 Aug 2025 18:57:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 46181] No Brightness control-nouveau
Date: Mon, 18 Aug 2025 18:57:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: francisco278herrera@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-46181-2300-2sjt1WXIW0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-46181-2300@https.bugzilla.kernel.org/>
References: <bug-46181-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D46181

francisco278herrera@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |francisco278herrera@gmail.c
                   |                            |om

--- Comment #2 from francisco278herrera@gmail.com ---
I believe this is fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
