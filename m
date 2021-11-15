Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BA445197D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 00:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C186E3AC;
	Mon, 15 Nov 2021 23:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22896E3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:19:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 711D96120F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637018352;
 bh=k+j2Vjl4xIWV/Y2OZSmLOof8xNQQantPkInfqfuWAR0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DHT1DmFJqFFQyvdvouGoGhlAEWDKNwg9M1ITZBVCAudhl0SZ+hYclBlre6REs2BTq
 GqDpHXxko1CG2DjPo0qXAIu0YT1N7rynGVppYP1wNgXDrRynpLT1t0Us01xRJUNsUW
 SE+Yic8NcMt3opFt3yGqRusfSU/qCrEC4+u85KVev3RwfDv0NyxL+VgyJ7NPr4Jcc4
 tadGmdSLnLnfeEiZQfEGhTGZFZQY3r/53v6snaIYUBt8YzxKQQ4ak7QuLqgbUO/qoj
 7rdsuEyqYjo5VVyeV+TyMGdCTdZd/2da5EjXmCCPkLugdNjkbYw/5ooFD9LmNxt4/b
 AaTW2Wk3GXhjw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6DE4960E8B; Mon, 15 Nov 2021 23:19:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214921] amdgpu hangs HP Laptop on shutdown
Date: Mon, 15 Nov 2021 23:19:12 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214921-2300-gmwMgiPbUI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214921-2300@https.bugzilla.kernel.org/>
References: <bug-214921-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214921

--- Comment #6 from spasswolf@web.de ---
Tested the patch with linux-5.15.2, linux-next-20211115 and linux-5.16-rc1.=
 It
solves the hang on suspend (or shutdown) problem in all cases but resuming =
from
suspend is still broken on linux-5.15.2 when the IOMMU is missing:
https://bugzilla.kernel.org/show_bug.cgi?id=3D214963

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
