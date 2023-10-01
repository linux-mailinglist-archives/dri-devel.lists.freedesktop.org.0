Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD697B49BD
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 23:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D52E10E035;
	Sun,  1 Oct 2023 21:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEF410E035
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 21:32:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2DFA460C12
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 21:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0AA7C433C7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 21:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696195939;
 bh=v1h+odejGGjghPwW97+QUep0otog11a71TRwM+f7LdI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oZbx1j6WYJ6Di+gyO2kFnCZyuHydNFx9SbJNkNMbiV5/4Fc/MgJIU9A4+t9/R/U20
 0YMAhLtgqaBaPlcaAy2krEEbX9QtiV6sfiJJfxXsLTu5xYEDnDkfn5W81OxdS6Usqb
 vrvAXOD7ocHATkYd4Pyoi7HJO2tDwVSxZom/s8RK5kUjyrfWWvQM4kF7loGqKtPvJr
 8z3tYTZI9Ji1Z6xDHiqeRZhZmzAQiVPHKHuTXICof88+1/KVwjlIkuTc2wnT4uxWeR
 B8O81cFios4hkHkojI7YkJH8EquFJE17AiYlHTXw3crcqBT3ygDA67KCRUSLeaTz6E
 T/580LoxFI5ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CE825C4332E; Sun,  1 Oct 2023 21:32:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 198123] Console is the wrong color at boot with radeon 6670
Date: Sun, 01 Oct 2023 21:32:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: devzero@web.de
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-198123-2300-eUr2Rs7yyE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-198123-2300@https.bugzilla.kernel.org/>
References: <bug-198123-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D198123

Roland Kletzing (devzero@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |devzero@web.de

--- Comment #52 from Roland Kletzing (devzero@web.de) ---
i have some similar broken console colour issue with rx300 s6 since kernel =
6.1.
 not sure if it's related, but wanted to let you know.=20=20

for most of the time, text is barely visible and contrast totally sucks, so=
 i
always need to use nomodeset for boot as a workaround

and - same here:  after starting X and switching back to console, the probl=
em
disappears

https://gitlab.freedesktop.org/drm/misc/-/issues/31

still busy with git bisecting

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
