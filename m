Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05A3B383C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 22:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C486E04A;
	Thu, 24 Jun 2021 20:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7D76E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:58:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B9C6F6054E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624568333;
 bh=49WWaHv1V/HJIFkX0SPU7DR/DMh/hKojJ5novWWvhdw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tRu5KGpqe7XBkyHH3ysWtLgVUwCrzHFPpxMw5Gm+SFQI93+nNasKmriNp7homTv8C
 i2PuopuGEYK4Dali4+5oKb2nhwmq4Urt4qOAAAcNimtHpwL0SmtaSOKjju1yC15Ghp
 T0LiVjx/HDciRc6WEthEoinlC6/sH1+Tpgan0jPZXFjPv/r2HLnilwLXgb1RFy6uD7
 VyQtWiQUP7PHUGKcSU3lm3Y1vpLNHeSWdolODp46tG3USRNjgrGMBZWO4QR7KJcd0a
 Ix6zB/KuvxFJ2XffCwWYBznH3CmF7n2aSTj3htXRfFqGr0tgeHqvSKhaKXCydCV1bs
 DO3VTM3W70caQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B099E6113A; Thu, 24 Jun 2021 20:58:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213569] Amdgpu temperature reaching dangerous levels
Date: Thu, 24 Jun 2021 20:58:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mileikasjos@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213569-2300-cAHQRCk7Ag@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213569-2300@https.bugzilla.kernel.org/>
References: <bug-213569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213569

miloog (mileikasjos@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mileikasjos@mailbox.org

--- Comment #1 from miloog (mileikasjos@mailbox.org) ---
I can confirm.

But in a different scenario. I'm using debian bullseye with lts kernel and
latest amdgpu firmware. I don't change any fan control mechanism.

5.10.44 and 5.10.45 works fine but 5.10.46 if i'm only start sway (wayland
window manager) my gpu usage is at 100% without doing anything.

It's a vega 56.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
