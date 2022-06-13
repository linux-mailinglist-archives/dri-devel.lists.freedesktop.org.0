Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B898F54857F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 15:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C11010E7E5;
	Mon, 13 Jun 2022 13:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FF710E7E5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 13:48:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3815AB8101F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 13:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6243C3411B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655128100;
 bh=4xEqvUtj+DMpv+x9UeCRCnmdTm8OsrIXA1CErM1KYXs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QRX1y6Ri+FH1gtrCXBMc/1I3YjEyXZOgU//ofN2/SssdFVr9yhTnwjTJb4NhpkQ9o
 o1WMRwkQXlxSfeCwjmnoR9jZ+tFiOFLcZNCZAtj6qNlCkSDDTOaeZ6iG8XuhUagqTu
 gV5AarsN+uvHCRyxCj9lCyef+rjFDXdFNNIaZnDjwTDsGcTBYJwBsrIHW7Lv8uP8xv
 WaCO2Pm+sUycoBJxTZvaoPek7noKDzz9jppZhlS0h3kaioHNiy8ki2N4Z6yMr4nvCU
 7OOd2ejsY/leBZ97540N5NhFw+8HoG10RFmK/3gIG6EAuS50Mh6JwCRIQCnLS4WeFu
 n+f/couXqRwkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D02AACC13B3; Mon, 13 Jun 2022 13:48:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Mon, 13 Jun 2022 13:48:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216119-2300-jCBBywAztk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
Does this patch fix it in your case?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv5.18&id=3Df95af4a9236695caed24fe6401256bb974e8f2a7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
