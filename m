Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDDE3DA3EC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 15:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BC86E12A;
	Thu, 29 Jul 2021 13:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F6A6E12A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:23:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5EB4F60F42
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627565000;
 bh=E8Op1puKZIgHXgQDpp4vp32ZS0lMgArtJXfdsukF468=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tCnmX8YFZh4cUK7rDoBzBa2uwXFE1L8lHX3Y8yHl80riLqqyFwiW/bs2bvBXgUVe5
 tpZJxNSWj9ToxsCwv4pquEy4lGfl0qPIik4FtNXV1t3S+cn07kQWwwA6p/TH5aQRNv
 +eBalGb45JrApHPyMTPUnk3mesly4Q9T2AbUdNvtk9n+G5WeS/YoiisXKqBlBJ+Ur1
 xqameNWGh3APHJx7Rwnxhh0iNJTPJ1XAzEgo4sa60SsktrXJqIoy3SocV2JCY5LnLY
 rk6fX7gBkHxeUDdJcZysz0vD72iXb6aF6cSM2/KlRReOCHEmJEqy1pJ3QT0NWtSqb1
 S9Pb24wiex91A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 54F4960EE6; Thu, 29 Jul 2021 13:23:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210263] brightness device returns ENXIO (?) on brightness
 restore at boot, with bootoption "quiet"
Date: Thu, 29 Jul 2021 13:23:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jplatte+linux@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210263-2300-xBGVQllbsA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210263-2300@https.bugzilla.kernel.org/>
References: <bug-210263-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210263

Jonas Platte (jplatte+linux@posteo.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jplatte+linux@posteo.de

--- Comment #4 from Jonas Platte (jplatte+linux@posteo.de) ---
Workaround works for me too, on a Lenovo Ideapad 530S-14ARR with an AMD Ryz=
en
2500U. I also set acpi_backlight=3Dvendor to fix the same error message for
backlight:acpi_video1. (No idea why it tries to restore backlight brightness
twice)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
