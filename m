Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386CD798B56
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 19:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F1310E919;
	Fri,  8 Sep 2023 17:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFAD10E919
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 17:16:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B83D0B821CF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 17:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 546BAC433CA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 17:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694193387;
 bh=J9UsNyAcZ0ZXuusyBvdJNnwdkSvYCEQLV6GkpXcvwKQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sMM8sjxBt7Q0u8gHN3kWi9jGbRWQJag3qeocM0oFCij920RI8Xg0+tpnJmWptEOik
 suP2AkojbTI4kq9RnKhhvC9Jgp3Jre/s4tALPPlThOf9ryH4Lkvw6MHq+iIQLBZooF
 vtHgKgi+25kV1wUDu6gsIn3ac/DEaByI7FAIVuIa+XZKM7Ep9AtBLXZ5B6IECQHk2Y
 kcUDiteki4C3FBKHR07HVv553PzQgXDDIRsSeOp3IWOJVOXyKSekzE/pG0YqKei4Pk
 p/Oql29jTjZ7BZdQkwNFrY2UobXh+Q7g61Lf8cxfYrVR/d1MbTIzk6lXGGbKpgd6to
 1lsaqG18lkKoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3B9DDC53BD0; Fri,  8 Sep 2023 17:16:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217889] WARNING: CPU: 0 PID: 5172 at
 drivers/gpu/drm/ttm/ttm_bo.c:362 ttm_bo_release+0x309/0x330 [ttm]  after
 resolution change
Date: Fri, 08 Sep 2023 17:16:27 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217889-2300-gbkLF3vSpA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217889-2300@https.bugzilla.kernel.org/>
References: <bug-217889-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217889

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead https://gitlab.freedesktop.org/drm/amd/-/issues

Make sure you've tested and confirmed this issue is reproducible in 6.5.2.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
