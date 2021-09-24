Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D991D417B11
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 20:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331BF6E209;
	Fri, 24 Sep 2021 18:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB646E209
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 18:28:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F13F861265
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 18:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632508099;
 bh=FFLpbF0TIkXIOnGOc36XOPUmWNnop2lQlCEU0U3LQcY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JDlprkq6ZUMxmrf1o2aXMYhBRbcBjHwU2c6MG359P48ZKr+x2yED4sS+H8DnnsVaC
 0zFwHKWS+SpdGwr6RIPUcQ5whTTdIl/++ff7TOksD+Z2mWyfb4ZhW02jGibBYI0SCn
 USTFoIbsfKhYdDamD+au36G2SpbZ3V/aYXpCDTjjx7uinFAZ8Dcz4UYuF09XllqyoO
 7noy7zo8UXvetHUJpOjmhUDFqFqP0/kxkiEqEA8OZQLERU6aXbmWNb0Mc6taQpxjEX
 LRudoYDjAJMMc18EWUcR89ZACHOBoMQ5QVcrqRCzvq1Y2j4mDoIK0FmBncEa1mNew8
 IOfqwN0e2iFQw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id ED8FD60FF3; Fri, 24 Sep 2021 18:28:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 85421] radeon stalled, GPU lockup, reset and failed on resume;
 crashed by firefox.
Date: Fri, 24 Sep 2021 18:28:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dufresnep@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-85421-2300-1KfaLHfcvx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-85421-2300@https.bugzilla.kernel.org/>
References: <bug-85421-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D85421

Paul Dufresne (dufresnep@zoho.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dufresnep@zoho.com

--- Comment #41 from Paul Dufresne (dufresnep@zoho.com) ---
I discovered on Ubuntu, that from 17.04 (since using glamor rather than EXA=
), I
do get similar bug on resume on a RS780C (Radeon 3100 card [2008]).
Problem gone away when using EXA acceleration... on Mint 20.2 at least.

Details in: https://bugs.launchpad.net/bugs/1944991

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
