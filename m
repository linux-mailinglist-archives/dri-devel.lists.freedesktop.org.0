Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC37D6523A1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 16:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7293110E0B7;
	Tue, 20 Dec 2022 15:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (unknown [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADBD10E07F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 15:13:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C56A0B8167E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 15:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B4A1C433D2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671549183;
 bh=/oLbD5RMMW/CJjzM2bOJ6O7MF3k7gYEwukr8QNRvWy8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WPHU6ugRzuuqXo6T6v/vnGGc5PLCE/FtHKjPmZhR3ebMyL30xG39HN6ipjoHdPs9g
 pCsP3/LsM/xQU2lXiDbKFj65dQFVyJ+Isxal0dkfs1RFrJUH/Ipya9z6zZbVyUSLuz
 EMLFPXGT0QoJ/HfIXGuf2CuRH64rYaNtv7JVtALa5l0CouOSwTtCbHUVHoHWSpz/nX
 S6mSqSckh225MlXiv9YOglA7MOlxtJoyBXaiOSsT0ZSoiCqVZTDn8bxQZnmvyg0DPk
 fnqWEaBRtf4WVBi1wbr29HBtr3BfNTu3AT0/NS0B8P2OGZH8X1dZRS3MwIgu5P3wxN
 LEyXHBv4P9DxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6AD32C43141; Tue, 20 Dec 2022 15:13:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Tue, 20 Dec 2022 15:13:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216625-2300-LSp5DHPJnG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216625-2300@https.bugzilla.kernel.org/>
References: <bug-216625-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216625

--- Comment #8 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Pierre Ossman from comment #7)
>=20
> Is that also handled by mesa, or some other component?

Yes, mesa handles video APIs (VAAPI, OpenMAX, VDPAU) as well as 3D (OpenGL,
Vulkan).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
