Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726E38F50B
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 23:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138966E24E;
	Mon, 24 May 2021 21:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4086E6E24E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:42:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 21F256141A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621892566;
 bh=+GDx6/yxVdOf1s4lpwIsizrheI6OWnT1kiQLdN8nQlE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sMERm6Y3EkGuqPW1ekI1NrGK9wmGeUmqPZCibdYzdp5i53EOjGFldAwLiGWDAVT4F
 dwr0g6CZnvVU/PVSnaHHhJkqoY7QTm0IKz0B1NrjHAVQJD/1sFsoJnFn/ZzkBtMalF
 Vw3glXJ/jrZ5zaY7J/0HLFoOg8ehvBhVv8cbKzeSA4Toq2+3ZbUqQUbGbhzyevB+N4
 MbZaSJSYgQJjGZrlWVWd3eCGx23U+Gze6Lz3s25EhD5Mlud4RuCYi2dZxUV9XcWMbv
 68Up+Oq7HAWlq3u79mNjZQaigg70IHbP4qdw2qqhq4XLwZRBq9b97J/rPoHRrvoQww
 9kWEDI1SDJmxA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 15ACC61105; Mon, 24 May 2021 21:42:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Mon, 24 May 2021 21:42:45 +0000
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
Message-ID: <bug-213201-2300-Sk2ZipVQIN@https.bugzilla.kernel.org/>
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

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Happens on 5.11.x and 5.10.x too. This may take a while...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
