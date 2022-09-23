Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520CD5E7F45
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 18:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527C310E582;
	Fri, 23 Sep 2022 16:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8379910E582
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 16:07:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1053F6234C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 16:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 777B0C433D6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663949220;
 bh=kB6bZSpGBW3sFdWbjslYQbPApIngOBqCXFwrEwOHiUA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=O1NiZFSAlhvCQBrSr45R8jwhhgrAAwEHQfpauUdm/uyoPRngw9g9XSYmtybAPTkQU
 /dh5x7hWoQho455LVstKlPl+TViUodhnIxSlL9/QgLtXelsbRyhfs/OrJI6GDRXf9j
 cgdTBY5opY1yaHi/o4bnBUWeeHrRmLhlllr/XfB8wnd9A8/85Edcy1udFekQ6nN+0f
 XApOqJ8x+m8mXb05pxU5CFbcohsAC62IEmFQi9QFeUz5cQtpgTdmogVjD9KyO6D4yb
 PWC1PfU9mE1qpQoPpygszvOheSnDCk95V+tAvGk1w86tmUwBVSUlyCYam2+MaR/B9v
 gR72jpYVXXDcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5AC5AC433E7; Fri, 23 Sep 2022 16:07:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Fri, 23 Sep 2022 16:07:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-2300-XCnswRbtIR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-2300@https.bugzilla.kernel.org/>
References: <bug-216516-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #7 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Mario Limonciello (AMD) from comment #6)
>
> Thorsten - this is not a regression,=20

don't worry, I already had feared something like this might be the case; I =
for
a moment had even considered asking about the S3 support status myself in my
initial comment, but then settled on "stay out of this, Mario will known be=
tter
what to do" :-D

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
