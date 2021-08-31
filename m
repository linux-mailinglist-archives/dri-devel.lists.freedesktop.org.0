Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2545B3FC4C4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 11:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C59089A08;
	Tue, 31 Aug 2021 09:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED00389A08
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 09:39:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C4F5E60F6B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630402777;
 bh=RS0KgSbwcKs4/5OP3n0WDawSi92hdUV718JZky+vAOk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=T53DxHJyqb1fw164UzRCU4IY++cTk+8/8trG3XjYcNcMV0vekqIunmTTbHDktQAwX
 9TZsSDAEVhoZIf0IzjJm07qdlfri6G0iI+w0B/d+ysoSHfP7uqkoRqADlfdtC5C03r
 qHT6y9gPm+9Nhd//CKzUKrCQb7Tom/SEKdMPJu5RjRNMAChh2abq9gZwGt/CsKn0Ag
 ufciiHA1FOYEwvD1m6a0vWUJ07sBHNOE3/GKeHm5L9ZcciskjESwHu2Maz8In4k7Dv
 U4s48XYWSv7/CymK/9HXf8k8Di/wvTGwyobIaTumf6j1hmwW/9ECwsYGpCcq+LdIrW
 AyPzgHYvz2Mjg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BABDD60F55; Tue, 31 Aug 2021 09:39:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [NAVI] Several memory leaks in amdgpu and ttm
Date: Tue, 31 Aug 2021 09:39:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xiehuanjun@uniontech.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214029-2300-w0vxOmBfmz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

xiehuanjun (xiehuanjun@uniontech.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |xiehuanjun@uniontech.com

--- Comment #6 from xiehuanjun (xiehuanjun@uniontech.com) ---
hi

use your .config (with CONFIG_DEBUG_KMEMLEAK=3Dy) to make a kernel image and
install this image ,then reboot the system, the issue will be reproduced?

thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
