Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D081879E879
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 14:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A233B10E4B5;
	Wed, 13 Sep 2023 12:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B94C10E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:59:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7754D61924
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6D2DC433CD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694609937;
 bh=6+Kxx87UnubyagYhsg+7y2yf6FyGMNgQgwApc+GkRqU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=V7U9j6sjn0rs0HrnWC9DLfJ+I8AsANkydK0YfZI3SvssWxe3jnAEjHkCF3kpJvHdn
 P9S/xtJbGq2Fy57QQy128O2KfCiaw3Y7qAsfo1W7VDarBFfEETvgZojGYYAMaihHAe
 H5ogVD+FvZgdg8igAnWVzXMLkZTx8Ob9TzyRv+jPY58y84eZiNAAgB2uuFYHtyVWQ+
 l3/fDqJWElrM2+4YLcGeGZbr8wVofQ2qwu2OzLPzBojH2PknNKydXrzbgPQapRqUwn
 ZZzeBBMSe2Dw2A3bG/QtOc/Ii8A7YAJ/gUTBesfnKQeso+zhma8ZLdPPhf2DKPuCXA
 /KPP18ZFDXPyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9712BC53BD2; Wed, 13 Sep 2023 12:58:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Wed, 13 Sep 2023 12:58:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cyp561@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213983-2300-gH3rzF01DL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213983-2300@https.bugzilla.kernel.org/>
References: <bug-213983-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

Cyp (cyp561@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cyp561@gmail.com

--- Comment #8 from Cyp (cyp561@gmail.com) ---
Don't know if they're useful, but there's couple more crash logs (with kern=
el
6.1.31, card Radeon HD 4350/4550) at https://bugs.gentoo.org/912225

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
