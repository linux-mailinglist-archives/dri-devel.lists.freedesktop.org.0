Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D84356402B
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 15:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EE02BEFC;
	Sat,  2 Jul 2022 13:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0DC2BEFE
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 13:01:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 20514B82065
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 13:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0F74C341CD
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 13:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656766886;
 bh=tXE/FTWhQQQozFTF6ershX87r7SBtbw2P5oIr5TCjMc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Hxq/PMCNQgddfb2R2txbn/Wwa20CwPWIkt3STyNJ/LrlPbYrM4Pfb0QYCfa0osGJE
 u1d3AIQ/BKoAA3h3GeE+0RGi3mCNnQfYga8aBliy4V42LB/s6XzeTkDuknYvzefzBl
 OqFAqiNeY+gHmm92YKXFReUdwtrJe+SLYIBQysFXJ+/bk/Vyqe80jcZGPM4tDbJ3d+
 4yDYbbWtFaeatkMMwG492c68qKsCy7AZKfk9bVufBO82dtb9r6s2J4rOndy4oqXUQd
 JgdAJlTy89c+uOUpK+hncawL0Da53j3gjWQzK31W/1p7G0Zo2MxCluXHeJKP1eLUwV
 NFY8I0i3hXC8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B0AD7C05FD2; Sat,  2 Jul 2022 13:01:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216198] uvd page faults on Radeon
Date: Sat, 02 Jul 2022 13:01:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216198-2300-8iDFjzUak6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216198-2300@https.bugzilla.kernel.org/>
References: <bug-216198-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216198

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost here https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
