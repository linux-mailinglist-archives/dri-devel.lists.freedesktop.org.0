Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676C5B2D3D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 06:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F63B10E176;
	Fri,  9 Sep 2022 04:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE2410E176
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 04:09:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F92061EA6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 04:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA353C433D7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 04:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662696537;
 bh=xZrwoI9lm+9ZQYmBZZibfFR4zFNXYrq7Vqcdkuqasg0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fIc4CNKUFxfWa8MVDQ2R5+1puGEcQ5r6snT/Jt2x6iwtsa8uYTDOOBQEjPYYk07jK
 g31wKvWgxdavk8x6LoSrZbOUOlXohvU10NeAUKBCigRJJke2C7kfgMcuq+IC0IVWk2
 nVaPL15X7VaaaoVaWnN3V91sWwsS33LE6EVtNvwfL1ycK8bV76vGWqunvCvySBJPFO
 3lGIElpIh3MUO4oLsYO9QDliF5oQz9ovpsaKQmohqwe9kQaiwfwk6jQSdRrKNdelaI
 kpQEixsMuthVnIIzuCtwEJFgo3VORwf576waxdpHSQEnEQG8ok8LOSdoJX8inFlYqd
 XatHK2d24RltA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CD133C433E6; Fri,  9 Sep 2022 04:08:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Fri, 09 Sep 2022 04:08:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oparada1988@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-kdoEcDpBhu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

Oscar Parada (oparada1988@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oparada1988@gmail.com

--- Comment #48 from Oscar Parada (oparada1988@gmail.com) ---
Came to add that this issue is still ongoing. Ubuntu 22.04.1

This happens recently when I stream, I'm able to play for a couple of minut=
es
then screen goes black, comes back all is frozen, mouse cursor moves but I
can't click.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
