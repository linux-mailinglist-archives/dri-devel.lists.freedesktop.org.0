Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE11380BF39
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 03:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB7910E070;
	Mon, 11 Dec 2023 02:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018D010E070
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 02:41:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 14A6ACE0AC6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 02:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E2E5C433C7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 02:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702262504;
 bh=CCaSCnoshjxQHjqB3DkEy9Dn3DljdAeyNT2cA8FEhAY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FeNU0ctAsONDjcxkmtR6P8rO2UECrqo1ClIPbrEvvLsn5tNqjg/PESfMd+Gk++5bX
 6DjkZ1LKRrBfLWdDA/LWkWL7FgEYwCADIuxPKsNd/uzFglSLvFHMP15D/9pl0D+Cnf
 SiC/vry3gXvdfNUKu9x+TFAXFeMJu31WZzxcB6cPEIphWxZh4L7FIbeL4pLvkNni49
 /9iWYIejOV8XYm551SU/9ffV1VYKT6XuyLA9WlxSwglpXGFyvaOZJBMwDxTQFlw5lX
 FCOeNKQKJ5cqtRzQYdKqstpH9IqOMhg0VGjRZHiHQ2rZ0zTJlzwmuRDHiTNibiKkC5
 P3J/Hqq/XGLVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 32FDAC53BD0; Mon, 11 Dec 2023 02:41:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218250] Regression nouveau driver
Date: Mon, 11 Dec 2023 02:41:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218250-2300-KSmmckIFWm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218250-2300@https.bugzilla.kernel.org/>
References: <bug-218250-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218250

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #1 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to Jaime P=C3=A9rez from comment #0)
> Created attachment 305577 [details]
> dmesg
>=20
> ae1aadb1eb8d3cbc52e42bee71d67bd4a71f9f07 is the first bad commit
> commit ae1aadb1eb8d3cbc52e42bee71d67bd4a71f9f07
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Thu Nov 16 00:39:33 2023 +1000
>=20
>     nouveau: don't fail driver load if no display hw present.
>=20=20=20=20=20
>     If we get back ENODEV don't fail load. There are nvidia devices
>     that don't have display blocks and the driver should work on those.
>=20=20=20=20=20
>     Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")
>     Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/270
>     Signed-off-by: Dave Airlie <airlied@redhat.com>
>     Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>     Link:
> https://patchwork.freedesktop.org/patch/msgid/20231115143933.261287-1-
> airlied@gmail.com
>=20
>  drivers/gpu/drm/nouveau/nouveau_display.c | 5 +++++
>  1 file changed, 5 insertions(+)

What problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
