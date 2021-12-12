Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA986471BA8
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 17:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F5C10E9ED;
	Sun, 12 Dec 2021 16:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1618110E9ED
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 16:55:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50B29B80D4A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 16:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26972C341C5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639328122;
 bh=RriIoJDaCxzPNNYrK98y/U7y+USeJ9F4uZZ5Wy5opHQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ppsgyAB2/DSSKnQlZ6aPDbZ6qTe+nx9+NMN5Ffm36TWe1Gk+2+MVrHVyyZlJ9+NrM
 JjTvW6B9DHU/Ozp04qoZC12789gf8XSjgFV9XdsYSe5eJAS0s7R3bDrEaPNZ4r9NDG
 aNfzSQSLXftVjjtmu3aqHQg3YwOdUvtWTFUTWDK8rND8a1wsqGEtCRiDucV8EFnewL
 aZyQ5IJvtM+kIfCODqs+0XH6Ynl0/2H7PHZAJeWlv9pT4h7U1EBdRSMxIG6ywuir/K
 8WvKmnvQDKGaLdHGKew74/4TTAu9vJtOOY9GbpjaDkwAYg1kHKfsUj76qyjYmXupJd
 0rK73GnxU9M4w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 10C9B61106; Sun, 12 Dec 2021 16:55:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207763] Noisy Screen in Linux with kernel 5
Date: Sun, 12 Dec 2021 16:55:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roccatos@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207763-2300-4xgW0PIN5C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207763-2300@https.bugzilla.kernel.org/>
References: <bug-207763-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D207763

roccatos@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |roccatos@gmail.com

--- Comment #9 from roccatos@gmail.com ---
same problem.
(i guess with "noisy" you mean "unreadable")
i face the problem with mint and manjaro installer
kali installation worked but the problem occurred after the first reboot

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
