Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E387238F3A6
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 21:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A8089A5D;
	Mon, 24 May 2021 19:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3F889A5D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 19:29:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F36061414
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 19:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621884577;
 bh=c8xKwq51t72SCfjdC9uBgNJkDrQO5y7Fn5unWkU6lVM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uWdBwsOwC7zsmCY2elE1LD6e+f0mHOQgD+4LE1p98fxpQ+dCR7vyXQEwICO9MQ9xk
 Om7VhfEDnSKTtts7U74X4PJvbK6ug9SZgKUa3ebhmYbrUXVkseKY1SKHU/k6VdD0WL
 pRWJM038agRb5fzjSQTJ7/FerrEeG50oURoiKhKP1Vl5QenDXR9wTk8CsGIWPL+XK1
 fehKpD64aa61x9PXKW29iKQ4dcfxLSOXGFs+G7Yr8Pmbfi8tStQEVJC13uHbQ6fIUD
 z3Bue3MVcA9OnIIABCM+w2P+vZcRG3ajbn1/gMir9JFo6SkhgY+2lXgski9YmjSxFU
 8UKXJBR1P97gQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2557061105; Mon, 24 May 2021 19:29:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Mon, 24 May 2021 19:29:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213201-2300-pAfnVYXoaU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213201-2300@https.bugzilla.kernel.org/>
References: <bug-213201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213201

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
As I bought this machine just recently I can't tell. But I will try to bise=
ct.

I got this Kaveri-based one instead of the Excavator-based one from bug
#211875. With bug #211875 it was not fit for it's purpose unfortunately so I
sold it again. This Kaveri-based one here fares much better. Only this memo=
ry
leak but no grave issues otherwise.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
