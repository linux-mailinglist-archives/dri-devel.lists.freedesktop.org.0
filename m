Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA5471BA9
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 17:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE3510E9FC;
	Sun, 12 Dec 2021 16:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5EB10EA01
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 16:57:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CB825CE0B77
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 16:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02991C341CC
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639328239;
 bh=urk3eQokt1WDBabxgrD15/3gmdPkp4shZriVLiHEX5Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IQmNW3v9jDMNnkSD1iWraCS3jC640+P0YL3EDDgN67CG8DsiZvuAL1IMUv9uIHHDX
 I5lJkbXCRBRp8U6Nqr9GrpkmeqRQp3J914js99dh743yqGmUN6aB3HJjYnv7lt6LNT
 rRoVkIkliLAHnvVtpWrzwIUuNbi4/EyoieYzWzb42d6t2Cj4MrUDTPW+OW6peKgkzO
 LoglEV6tUzdp2ysvUbEHKCnGuU1f5TuFoClJMA+nLac79TsWgfbdapJrgij5rZ8+og
 qEh6JdLs2w2aJ5Wq6o1in/HuvFTlWvYHhLSSVoCx4fdlBqG+CSgI5KEclIzGQmtzh+
 Jak9RzngbaoyA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DCACA61106; Sun, 12 Dec 2021 16:57:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207763] Noisy Screen in Linux with kernel 5
Date: Sun, 12 Dec 2021 16:57:18 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207763-2300-Sw7vOkzHuB@https.bugzilla.kernel.org/>
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

--- Comment #10 from roccatos@gmail.com ---
i forgot to mention that i have "AMD RV620/M82 [Mobility Radeon HD 3450/347=
0]"
i tried same live usb with persistence on other pc (buitin intel somewhat) =
and
all worked fine

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
