Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281606C2411
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 22:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090B110E31D;
	Mon, 20 Mar 2023 21:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7678610E31D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 21:47:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 493C1CE12DF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 21:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE91CC4339C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 21:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679348822;
 bh=UITk1woOKSoca6A0PjzAaCkBEWwy8VbaoEDB5MQdsYc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Lu9u8qWgzyZXrsROfX0V7HjyjcM0LjLLS58mIo+146JW8c95/KEwvBHjU/QXXTVZF
 vWzm5ZsgGu5wK0k0JFEiXuu2SEwuMFKhcImyUkcfM67iDyXvDe9QJ3kybhvZCHskSe
 ZHE7DYVoeFKI0bcXwVDjzJm7SkPERCAAabh0SJyI3fSF6SQZZiSb1rntY2fN6jRiIm
 awkZu4Mbv0i1DAP0X/0Dfu/+qlv5He6KXntYeKPIfjrDFexs1AmJxP6fjBzwZp+HpH
 uRPrY60bxEz5EZu8cbONi07Soc9jwV1h9FcZzs0TEobQyoSaFMIPC9ngrpJjIuUM2i
 ygmUEH4Ci6myw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 93E73C43144; Mon, 20 Mar 2023 21:47:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214853] [amdgpu] UBSAN shows several null-ptr-deref in
 ../dc/bios/command_table2.c some array-index-out-of-bounds in
 ../dc/bios/bios_parser2.c and an invalid-load in ../amdgpu_dm/amdgpu_dm.c
Date: Mon, 20 Mar 2023 21:47:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214853-2300-n0ytGiLAYV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214853-2300@https.bugzilla.kernel.org/>
References: <bug-214853-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214853

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Closing in favour of https://gitlab.freedesktop.org/drm/amd/-/issues/2473.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
