Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAB194F5BB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 19:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB3F10E16E;
	Mon, 12 Aug 2024 17:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dTp7A890";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3456E10E16E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 17:17:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E793960F8B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 17:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D5C0C32782
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723483003;
 bh=zikKIszuA5BA9aUrabdsMrXrY8C0n8zRWIpJp3/9Dik=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dTp7A890xPDiC20cc9ovDNYZRMIFUV1g2ylV7TqwQFJFbUmI6T8hrC0AAJ/YDmYAw
 3BJ8lEkxoZpMh023IClcPTAXFhhMJlDQsnPjOrM8B6TFVfTMR8fGWPNWr0PQJjUE9y
 BNkxzY8R7ovl6amokjIQQqrBaqpWOFTqt46rizJ1fHVaE3czZQUfjMu6D/mVrDObpQ
 rCU3KpW1nxY1UpnsMdx2e0iLF1YS/ZHxARsst+mVyhuTqwhiANb1OSCSNA3VdqTqF2
 DPP/IDjG6n4wkx97rFG/K0M0SVIsoIUu4F4jQ9BAw6bVclJJ7zqcCEFaFp3J3kWQrQ
 Qt7xNprcqg6DQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 93390C53B7E; Mon, 12 Aug 2024 17:16:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219152] 6.11 regression: AMD 7950x iGPU fails to initialize
 (with bisect)
Date: Mon, 12 Aug 2024 17:16:43 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219152-2300-IgTQmXyX2u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219152-2300@https.bugzilla.kernel.org/>
References: <bug-219152-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219152

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
