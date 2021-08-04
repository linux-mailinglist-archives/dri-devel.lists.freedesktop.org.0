Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BED073E01CD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 15:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531A26E95F;
	Wed,  4 Aug 2021 13:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5506E95F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 13:19:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4401760F6F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628083143;
 bh=9awgla94peVmnnIMJKvX1O2CU+Ev7ytdMu7hNrC8HQ0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ssq7czeWENZq8XLRGYm26nghprTpxxpUuB5wknu+n9DQGuidY0LB/YcUik2iFwYPr
 3XbwUe+7GIrL0bjAdOoHpCPFtXn1P4avOIPr/rpqEntuL+ihhiTgoxAc1tWufYJ7sH
 TkDmt9gfQw6ojmHd0XfOg/GhZtycxVxnmCyVK7P3z/HTeA1ORKuT/3SmJvzLlRJzVX
 GLX1CKNQd3AXOtIiDURQYbwxpficbD58XIBYj4bh82ezzZmZOKghDXKhl6YCXfjUs3
 oazlxGXqPmPZrvFBVEcTMIlvSpRvkGCU9esQY2ymJGlUfYNlNZ8rl2pYtd5nCDRSfh
 whPwZtLbHkp0Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4072660E98; Wed,  4 Aug 2021 13:19:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208981] trace with B550I AORUS PRO AX and AMD Ryzen 5 PRO 4650G
Date: Wed, 04 Aug 2021 13:19:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: florian.laroche@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208981-2300-X29yV1XcCW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208981-2300@https.bugzilla.kernel.org/>
References: <bug-208981-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208981

--- Comment #10 from Florian La Roche (florian.laroche@gmail.com) ---
This seems to be fixed after updating to BIOS F12 from 2021-01-18,
BIOS Revision: 5.17.

There are even newer BIOS revisions available, but they only work with RAM =
at
2133 MT/s instead of the usual 3200 MT/s and seem to be unstable.

best regards,

Florian La Roche

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
