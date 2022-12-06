Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4482564499D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 17:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277C110E32D;
	Tue,  6 Dec 2022 16:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6611410E32D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:46:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC6AD617DE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27218C433D7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670345178;
 bh=M0KbIMauS1zJxK7GpjWQKwDLN2sAzz2lkzxoIK3l/4M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HyUT5CQ5btVYWoCd2s4JGs0AQ4FkfSBZhZ5Wtxyz7d1gOQtp4eQ/4KoBTXtwspRvQ
 BuDlD9Ct/JKZXjNsRGEeK8/3tLbjNP3z1W9fE15B4KxJXhQoH4t0NnPRO4+5aqwYR3
 sOchbd0JXgt4dx9SbxRV4wm+vcZe8cG3AA29Qp0nxw2w5JL2vXNA/xHf75J36obnKr
 kcwTWXjHOH+Qf79inHbLvVpQtxooGrShl5FtnAUGc3UQ5qccy56Sh9TY1Mva6+QmfH
 O6vICoylMEA1KBPewOREGLoFVhNz9Y/iT6o1jf2Nchh9yKJ99PyuL4vQuH3RjyrSNF
 1JUWchMNYPODA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 16F7EC433E7; Tue,  6 Dec 2022 16:46:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216780] problem of Mesa drawing boxes after resume from suspend
 with Geforce4 420 Go
Date: Tue, 06 Dec 2022 16:46:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: estellnb@elstel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216780-2300-VSIxQZjC5R@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216780-2300@https.bugzilla.kernel.org/>
References: <bug-216780-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216780

--- Comment #1 from Elmar Stellnberger (estellnb@elstel.org) ---
Created attachment 303369
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303369&action=3Dedit
after resume from s2ram: screen distortions in the status tray and on moving
the Pidgin window

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
