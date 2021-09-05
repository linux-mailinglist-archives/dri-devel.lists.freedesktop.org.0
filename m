Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 704F9400E86
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 09:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DB389DE5;
	Sun,  5 Sep 2021 07:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F8789DE5
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 07:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4A5F060FE6
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630825967;
 bh=Ae50lVoCUxDKYxRwp08QxpxxEt5/QCzOcaaTAou/ZmY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=q1cv/DBQeCKnsY332xUt/3JPSWYuCT9d8mT+3I7npxDQy3biylQBcRc81SYV1dFg2
 ujgEJoM1k2Gv/WCGMQbc+dqfQU0Jt90aOrIar5RCiRJfKfcUWYek4zcAU87WIxYnl3
 pWjvP8liVKwCbmTwPbqSgjCP2vEo0ZG3kRUOitnXQ5SajlgxK9JnQms0nP9+TIxk7I
 lJ9kQ/QtwB4gBQTsjkckchKiuxvkmUM2FTOIznNUCE2/TzLzNB38wJ0DVOQNDdXttk
 c/359tvFu2eGOw9Ar5ld1KbKRf+asypEuvl6a9AvQGkHaCvpV6iyMYePK1dsCWl2fG
 JFPa0PSMPbacw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 47CE960F3A; Sun,  5 Sep 2021 07:12:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] plymouth animation freezes during shutdown
Date: Sun, 05 Sep 2021 07:12:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: asterix52@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212469-2300-cgzZ4pp8DM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212469-2300@https.bugzilla.kernel.org/>
References: <bug-212469-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212469

--- Comment #12 from Norbert (asterix52@gmx.de) ---
The plymouth git works (Ubuntu 21.10).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
