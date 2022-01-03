Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C0482F80
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 10:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAB110E207;
	Mon,  3 Jan 2022 09:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C504410E207
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 09:36:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 658C9B80989
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 09:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 120E7C36AF0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641202573;
 bh=0fws0cJXIYCcLz0Vh2p0DvDKBkkSxNwNzbK8K5KdbYE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WmJTMTHE7rStajxXDQVhYkNs7Tkw5fPxfUO9d692ZEWr708a0tHo+kq+fFC0aaEBW
 ELpDd5v0NsF76W+aMhCywdH82hB0HmpcS358CFpPpixX733aYZtGpLg7QKW241yY7a
 ElG3RBko59p47fuw6Bb9KNWoOHZCINJks8/FKMC72m0Z8Ccbr5TfL/BNXMeTV1fltR
 psNPBCrbUbnanWwh9agShAJuiPAQ3L5P7bdtP+o0C3M7XVlXbVknxeKqIfelEd2HXx
 emqqzdVaB0qo11JGLdyts8QITJP00K5l2NuXDPfoZKyIsAsR+FjDAaG1XTwRDmXh87
 OX2gII2dKUKFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F1AABC05FD8; Mon,  3 Jan 2022 09:36:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Mon, 03 Jan 2022 09:36:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-215436-2300-bjSaGYjKqq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

spasswolf@web.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.16-rc{1-7}                |5.16-rc{1-8}

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
