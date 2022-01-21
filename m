Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC42D49673C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29B810E342;
	Fri, 21 Jan 2022 21:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8AE10E342
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:19:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDC4CB81CE8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75515C340E1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642799951;
 bh=G2XgrPpfZqfuacbH/lHdCjwYlxa6h2g1wX7xh1KClIk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SqBcmWaWLBQG5ncrNeG9ys8y9qwbyM43fXRSLqkmEbhUY1GfJvfOtmDvQlwo1/qhi
 8b/cgCsJQ4hHvCR9AUiEFWzl7EtIBRW4oq5KlWI//qLbuBoRgsz4eHAbj7YEvExZpk
 sysAnm0MY6WRYsusqbEfNUp2utA+SSHe1Lwub1nQ8krayRqYXvuznFiQZFQTwAIraL
 lSVOeyMPoE8aLFKGTk37JWx+EC2jYtb18yKL5WbHhcKZvmOq6yQ2V+gFQ5DaguSlrZ
 XliQHEvOqGwfkMRQ6Dzs5gioukj2NVoGdzbBPttOyTfG0srWugEbi380Kn4wseRkCX
 IMSVodroB+CeA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5C443CC13AC; Fri, 21 Jan 2022 21:19:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Fri, 21 Jan 2022 21:19:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215511-2300-WTVQU7IPdC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Can you bisect to see what broke it and/or what fixed it originally?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
