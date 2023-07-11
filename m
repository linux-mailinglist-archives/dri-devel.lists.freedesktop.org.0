Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B23574EFFA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED98810E387;
	Tue, 11 Jul 2023 13:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C576D10E387
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:15:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 181AC614FD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 145AFC433C8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689081300;
 bh=XnNif8RgO1YKGCTe9aDAyFt2B6qgy9rtd+PQaVQBb4U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=M2iLbrRG5NYqTIRWvLXdgXNrcMysy+RE8lLb3zwnB3FWtKUzAZwLbndBbwuugOoga
 uanYwaEVylZtMPU6J+TreWnbZkPHqCzCaYpiY7atbE7jvuHn08Hf0OKYK/BjJPrnLY
 HPO8C3glz1StuldBigqQHMuoTypMu2cTDdD6z+0tkkfq9vYjHM/IZakzCteitIQMGs
 Qxcvp3sOOZLqj7dDFAaWUFrv1z7/pfp4PEvb01K2lRQH9JtzKdGAA1MQ6dzLF9Q1Cm
 pDf0MJfj40jF/cB6O9HXOF2MNCJaxPojEWC8zM4DpSaAYady8ryhKnt5Y+grON1QUW
 fHsVhO/7HKPvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 04C1DC53BD0; Tue, 11 Jul 2023 13:15:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Tue, 11 Jul 2023 13:14:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hermann-san@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-WLnW4EYbIN@https.bugzilla.kernel.org/>
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

hermann-san@gmx.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hermann-san@gmx.de

--- Comment #56 from hermann-san@gmx.de ---
I got the same issue and for me the culprit was not amdgpu graphics driver =
but
a defective onboard SATA controller. I've changed the cable to which a
secondary SSD was connected to (not even the system disk with the OS instal=
led)
to a different onboard controller ( I have 3) and the issue was solved.
My mainboard is quite old (10 years) and was heavily used.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
