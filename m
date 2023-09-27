Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A697B04CC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7087F10E522;
	Wed, 27 Sep 2023 12:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0BB10E4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 12:57:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A004CB817C0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 12:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05C37C433CA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695819453;
 bh=xPynw7EaU+//5e+K1W+t/TV/ddTmAONMI7/m2XY6hwU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nzBAvIti+RxyABYnFjUroo5CgYZ/7jouWnMiM3D2JVHIn+AY4JD191nQ+/mfzn2o8
 mq5S/EzSiWVJS7bu4p2QZCqbP9/WDM02PKnk4J25ac1pMI3FihMxsiDyWHU3QKR12Z
 Nf1QENw+PMfGfy/+owbDeMXF2b19gcVcSnEDhlwVVxm7lq1YYKYL7gN2Bs71+8BIPe
 Nj490e9n4hpPE1FtJdsKrtlWnVlw6K/LwWFB0LZKF+DbUlfCAAlpkNDvUaZSiAakt2
 fwZlkhy4WIzUDKpTvPG+EK6eHLzxKOZshYr6l81otDZLfQp4F5D2ZfDobFUSCg60n1
 6p6Od+sidwvAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E0285C53BD5; Wed, 27 Sep 2023 12:57:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210429] AMDGPU - DRM connector force-probe after DPMS causes
 monitor to reconnect
Date: Wed, 27 Sep 2023 12:57:32 +0000
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
Message-ID: <bug-210429-2300-ofIutX5nHr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210429-2300@https.bugzilla.kernel.org/>
References: <bug-210429-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210429

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Is this reproducible with 6.5.5 or 6.1.55?

If it is, please report here: https://gitlab.freedesktop.org/drm/amd/-/issu=
es

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
