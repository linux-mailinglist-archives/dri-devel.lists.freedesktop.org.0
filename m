Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C190999E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 20:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417F710E008;
	Sat, 15 Jun 2024 18:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wgh9poVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309C010E0F9
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 18:45:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3ECECCE03BC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 18:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7690FC116B1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718477115;
 bh=vNtq5iXIcXZ3HyPcHbRomPKY61kD2kZ3vOieSRoQkBo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Wgh9poVeEM26UMyrswLrUEW+ZgHp4mFE9KlEhT539qs5FBZoPH0wWdv126RahM0s3
 TAoYOWiDEm2myiEl155KIijWQcs7zfftD6R+Rfi+LUjU2spi5ZcbdLJ8Ur4YwU27Dc
 h/dKLVT8vfrb69imJ/RbvJjbNiO7XfOLxm4Ih5v4ooYMIy1YtLKcTN7j2roy982FYF
 +Z1DIIKvVvrMirEaUPHkwvv5yaMyFwJrIcg1XKTb7ewx76bb0FFUVRTmoJNsFOAPr+
 kJcXppM0aDTx27a4JM6c4EHvFURJcIYnS/6WfrJSPAMFh4I8kwxir3uQSCBasMkVHD
 FQCbyRw3Uzm8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6D6EAC53BB8; Sat, 15 Jun 2024 18:45:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206309] Experimental amdgpu w/ Dell E6540 with HD 8790M (MARS
 XTX), massive performance improvement after ACPI suspend
Date: Sat, 15 Jun 2024 18:45:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jerbear3.14159@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206309-2300-zJbZNFi9hi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206309-2300@https.bugzilla.kernel.org/>
References: <bug-206309-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206309

--- Comment #4 from jerbear3.14159@gmail.com ---
Thanks for the quick reply. Guess I'll have to dust off ye ol' Windows
installer and confirm once and for all who's to blame here. I'll post my
findings here probably in a few weeks when I can. Thanks again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
