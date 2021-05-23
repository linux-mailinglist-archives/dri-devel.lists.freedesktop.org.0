Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDD038D84B
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 04:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174376E029;
	Sun, 23 May 2021 02:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504546E029
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 02:34:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EEA9061182
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 02:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621737258;
 bh=Tt/fXJkmhDMNwKTJgMg9Am7pMsMi204BInszybv6Zlo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YhdqeW3w1m8xFOqk8qtPZsW7maQdHaum9WKNR8s8fVmNbzjQsAm1WgPB0Go+fG6JG
 rKiZNDLGHED0VPnlprKfsSHnYRcA9deVmN0EstnCk4vrhtYbOd+vl86ROVdoNqVf+5
 pbYoydnwwrrZb5jcR076Bd/MdLi4af9o0d8TiDSYWyjhKEgRnyUb/KeYZYMDec+rR3
 oaIycKBGugu4Ya8eGH/8yzGpGb6sCREHXM14n0B0Mnr5ozkvIndjFaZXIoAlnofi6v
 JlodFcuuTmxy94R26+cDy2nNcjCHlzmxXOz/Tl9MCtXLVbWGGj0HZXPF6Q6BVhuTA7
 BKMR0lqHfN9aw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E061E612AB; Sun, 23 May 2021 02:34:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208573] Black screen on boot if two displays plugged in with
 NAVI 10
Date: Sun, 23 May 2021 02:34:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrej@podzimek.org
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208573-2300-CI00Eiwyeb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208573-2300@https.bugzilla.kernel.org/>
References: <bug-208573-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208573

Andrej Podzimek (andrej@podzimek.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andrej@podzimek.org

--- Comment #13 from Andrej Podzimek (andrej@podzimek.org) ---
And here we go, the bug is back in 5.12.5 or so (probably also in earlier 5=
.12
kernels).

In my case this occurs with 4 virtual and 2 physical screens connected (dua=
l 5k
MST) and a Radeon Pro W5700.

The issue this was deduplicated against has lots of extra investigation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
