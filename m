Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C4C390292
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A2F6EA2E;
	Tue, 25 May 2021 13:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BD26EA2E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:33:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 496EC6141B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621949583;
 bh=jZfYpMeVhZBeaI+jIrVr0ZwkoBpua3Sf2i5NUpmj2A4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lHB6XmLuH1EherZZpPIQWq9oNJEd/Sw2lhXgO3eGIoc0d1lqYJy6vjrtKlKTujzGp
 YHSEMO0Et/VbP4uatSgW8ZsQiBhLaqj9KaUYLmzadpPMIm9TVducpTvxHFmu/dZY3q
 3aJiUcrnVI0WyOYFCNvg0s8nWEe1iXUnTe+7CJVT7+p3SmvbWTIDMptxj7stbWa5Wq
 KWOu7q7m5NU6NbVS+raXIwshgxUzPJ20w5mowl7yK51WQuZIpKVkJWjIls8YJ9kO9Z
 EduRtyR658ofra/9T3hva7X0lDKKo0uo3J1/j6+h+Tv5Mlvn+rrAmjItYbTS54ECXA
 5HaBJQehq3IHg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3AD4361157; Tue, 25 May 2021 13:33:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] plymouth animation freezes during shutdown
Date: Tue, 25 May 2021 13:33:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mail2021ac62@detlef-pogrzeba.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212469-2300-wg7bSiai8R@https.bugzilla.kernel.org/>
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

--- Comment #6 from DieKleene (mail2021ac62@detlef-pogrzeba.de) ---
That is no solution.=20
The same error occurs on Ubuntu Studio with playmouth.=20

Only Sparky Linux, with Kernel 4.9, runs without any problems.=20

This is a problem with the 5.x kernel.=20
I've already reported a bug for this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
