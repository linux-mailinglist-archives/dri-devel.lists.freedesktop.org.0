Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B47BCBC08
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 08:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D7210E117;
	Fri, 10 Oct 2025 06:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TO/BfKkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E500B10E267
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 06:02:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C4FDF6020A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 06:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71D5CC4CEF1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 06:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760076148;
 bh=6kE4mq9gTLYrLyp0oZs0TT3I1TyARXRU4QllagStsh8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TO/BfKkCrCt+lkNkTjXk0ROGureDr2CjItcJO7Dz3VbSy9qm+CAZi6M02yYFX+T4a
 Aw5RThLa6cs8Ugvqv3cpWNEY6BMMLNvk2WyIiMPBDZILVCaJWdzoItnjHbaWk+fTFm
 amFx+A20fLqHvT5TUQL7FMwGeWNW80Fo1SOB++UcKYrOHNiW53Bf9nwR0pqG5Du29C
 4qeA4HrcID2qhROTwBp5ZpxCyombSps/JnaUjn87kIWhg8ojncoehUsjDedyXiWYCf
 2nmnDUvqri1Sv868k7roLlQ2xhU92I2wScGmvtwB3wfx5bRiLywEZcC1m3E68ca9Wv
 I2PWTc5qNhbNw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 68714C41612; Fri, 10 Oct 2025 06:02:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220653] RX6700XT fails to do S3 suspend, then hangup on recovery
Date: Fri, 10 Oct 2025 06:02:28 +0000
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
Message-ID: <bug-220653-2300-nLG6vqwQ6Y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220653-2300@https.bugzilla.kernel.org/>
References: <bug-220653-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220653

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please post here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
