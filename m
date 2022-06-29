Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A9456009B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FB610FA36;
	Wed, 29 Jun 2022 13:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F39A10FAD7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:01:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01608B8246A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFDEEC341C8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656507657;
 bh=92lA8bbTMc7eCN9zx/OZgQX2z7/KL5g3voXV25BWJVg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ILSK4jA35AIWCgIQe+3UsPeik5e8RwUdWTysxpa4uT07iq/IrW4GuA3HuHYzexjMD
 1tRcYVzfBHbbs4n8ngygKxBlAfm28t6IhMGfwAbxTtzqaND8xur4o9VL+MVzItZSgE
 R9jXDhnUCSse5zMNlMpcTVNJGXvd5lRY98lrXuihUDh61OmrsdLlSBli+9zt3Sz3hg
 wzl+qRKrCbIDBDFbD3+NGwGT/SqXyhJidn4CRRZZQ6qryT5Syn7mcDTdIE/+JWfqVb
 oEph0vvY2+yDfEXNcjpA7UDWY43QLTu7SvaeKt0yvzFfPa9mS86mEjoDfKjurYBFWe
 VpyQMDKCJWItg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A4B0AC05FD2; Wed, 29 Jun 2022 13:00:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Wed, 29 Jun 2022 13:00:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-Xh52Y3uf2d@https.bugzilla.kernel.org/>
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

--- Comment #29 from Alex Deucher (alexdeucher@gmail.com) ---
Do they also work when you set amdgpu.dc=3D0 or has that always had problem=
s for
you?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
