Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C549F93515B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 19:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5579510E806;
	Thu, 18 Jul 2024 17:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cw2qDgw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EA910E806
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 17:51:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97F8E61B30
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 17:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B820C4AF15
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721325071;
 bh=O09K363cEpKeR/0KwraulOkG1tzee/DUup+TsuEdkwo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Cw2qDgw2l759GxhLonzRClQkymyyqbf69H3FXZa/+S7q4NPdA5srKk0T9ATNvCixV
 oSqOupEK8J6FxAVk+DSEwKYWKC1R7QvEonTu/EI9hkmKmhqSmFfeHk+wICJXw0ZKzb
 nkHtY4zbN4Upk7+DiYO/r7vOvpIZGnK1DoYGvoFeyyPstvd0iuPoPGltcspPL5L3/1
 PHVEGixD0pLH/XBa6gjORVLCGxCPd7/KbcrmQENgV/eIGy3z4n52fTbmbKLijayAdF
 3cSzvf2BOGTKZjuEVG2vNKp7d62c5K5GfZfDbbu2dNoqfjKfJgBgL5XCihrFKGs2dx
 1xD9Jy8OE4a1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 85C73C53BC1; Thu, 18 Jul 2024 17:51:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Thu, 18 Jul 2024 17:51:10 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201497-2300-cSy4Gbc6Y4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201497

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aros@gmx.com

--- Comment #34 from Artem S. Tashkinov (aros@gmx.com) ---
If no one wants this bug to be fixed, I will close the freedesktop issue. T=
he
AMD team can't do much if the affected people are not willing to collaborat=
e.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
