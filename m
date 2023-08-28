Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7038678BA66
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 23:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82DF10E0DF;
	Mon, 28 Aug 2023 21:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34CE10E0DF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 21:38:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 622E365200
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 21:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9529C433CC
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 21:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693258692;
 bh=pJNPyNGTmmXcPS1DHPmmylB43l0d2zhgupfDkAMlF3o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NOWpICJ5Pj1uJ3nkeP+66kYaoweL+SCwgoNftypdLnMIj+LqMz/M8R5RvMk/89IiQ
 Gz74wZaSxu5jk/EQ5qFJRglvFb1vPUdzuz2h+pq2oHXKi3mKm6RH2ESbCkaTjZSuY3
 4Oaf2OATZ9z7g0b0Gs0EH7f58pOpYXpq7KjyUbUi5KUOfjBACzH57f7LNKm7gHexH9
 LL7pNyl6JwBioTGJ7G3v0bioHjYZBdGcV03z1rpZMuzPQeqncsP/W2M02JRW+QMjm9
 wl5vQflYlGaQ3XCRGXq1ap0O/AioW59HI4Amlrzf5TgfSYjcCmpkB+0QGYeenVQPlj
 NEcB2CLgPVfJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B93EDC53BCD; Mon, 28 Aug 2023 21:38:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Mon, 28 Aug 2023 21:38:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-YAgL1a1qwn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #45 from popus_czy_to_ty (penteljapan@o2.pl) ---
also i changed value from =3D3 to =3D0 on CONFIG_SATA_MOBILE_LPM_POLICY and=
 i was
able to compile it smoothly and run, but still no change

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
