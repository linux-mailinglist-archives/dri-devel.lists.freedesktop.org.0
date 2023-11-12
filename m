Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B477E91E9
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 19:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAA710E137;
	Sun, 12 Nov 2023 18:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF5110E137
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 18:05:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DF1A0CE0C70
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 18:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21567C433C9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699812318;
 bh=ClYwdIzjYcPPUzndp33Gj34VB1GDMe+3o5vE4SnHyAk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fdUr6Z1OUg5alcVFV48yHa52qzymnh1Ph223bjud8Y3HaabNG6JIXZUTGS/QqkEV3
 nrKRPrWf0y8w6Phc1IcrzbmZLRC3SoYDgoerXmuHmuSYZBArWYm3rtFuvOWfqVroMz
 v2tQUPMfVInLHliJNeAL9eeKgE40wsxvOh2U30N6R/X79K7bKg/66oAOn2W2Eysmie
 pEbJdEGWpKtY7ppzEVpjQDNb4EZApvD5qXf3JShYAf83CR94w3ksGJarn0eZQO/Y6t
 thQeACGtPgQEf7X74Jw7eT+ovqaxYU25hGJ+GhpyDE38jfdsGJrt4ILoKwHJ7m1pdw
 eNfRXnlTo66hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 03941C53BCD; Sun, 12 Nov 2023 18:05:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218133] kernel panic when opening spotify/firefox 6.5.0.10.12
 ubuntu 23.10  vega 64
Date: Sun, 12 Nov 2023 18:05:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218133-2300-3sxFy9yCor@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218133-2300@https.bugzilla.kernel.org/>
References: <bug-218133-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218133

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
The warnings are harmless (they are just variable sized arrays) and have
already been adjusted in 6.7.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
