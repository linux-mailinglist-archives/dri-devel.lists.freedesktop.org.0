Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E0F793E53
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A5E10E1AF;
	Wed,  6 Sep 2023 14:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4B410E1AF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 14:07:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 264B6B81A7A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 14:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7633C433C9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694009255;
 bh=IhACJnd1sfDsrM7aTuM0kFKlf6lWdmLdY187072zZQ0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KgoIVDRWd/dRFY/SQC4mIGoRjkJ4KJbqStgmmVDyVdsAQg0LN8G0hRGoBIltevr8k
 ATJsroGTAXI7j1rzsviK06emvEbgYC9S/x+x+UF12ndNQObk7UFOgRdRNfaiI2SimO
 +LOFLZfedlWu6s4r3HsTdiZ33Vg2wyaJmBBcIYEARei49KAxPGBDgI/7IAqdE+Y9Ce
 MpbUAO+StB7KITIDvN6m8c2kwcSoJewFX+lBeo9rAVDlnKDAdQUuliXTPeDZgOIAbh
 5NHa36cvtOGB25dL9uNB2TIAOTA2BA+Tgex4wpJqBg8ECz/e8sdo/mHl5DLHOmy8jT
 FLC8HGOFoesWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AC835C53BD1; Wed,  6 Sep 2023 14:07:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217876] RIP: 0010:calculate_phy_pix_clks+0xd1/0xe0 [amdgpu]
Date: Wed, 06 Sep 2023 14:07:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217876-2300-TDeLY8dhxz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217876-2300@https.bugzilla.kernel.org/>
References: <bug-217876-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217876

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost here: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
