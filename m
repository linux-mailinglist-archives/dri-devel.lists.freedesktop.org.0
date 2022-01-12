Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E1048C6C7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 16:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095DB10E276;
	Wed, 12 Jan 2022 15:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650D510E276
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 15:08:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C457FB81F6B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 15:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74E86C36AE5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642000129;
 bh=JTenDfZ/A73bGYmYWafgkP6/9aW5qIKzH/O/nhkvexI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jfCBF9A7DH3C9T/mjDHDnW+mHbGQ3/dfbrE17puf3sgDfPODOceNCezwLioaCyTdh
 IeL22l+mds5I/Gl3NYowLVNlIZoLHsN/rL+mNWeyNa/bsVS+8Fj0SkQloBFvfaAaxU
 H4pdfVMquV7GU8q4EJtO2As2rrwOIlhyp4GxLpdB5sXPs+27ahaRQ1u1xVQ6Z6oRio
 VhyoyxCVKJWyFPYKl5AZ/UgbxFcZLPnMal3CLxGWYEh1Ax2/mSJ2aCRY5xJr0JC/Mt
 2cJPYrNh0Jz0xmVdmPTL5wuvPAeVV8WCbJsfdL4K798s5+vSKSoXIcNzUip/UwVgfr
 4bUVRJnVIQlsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 64F56CC13A8; Wed, 12 Jan 2022 15:08:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210263] brightness device returns ENXIO (?) on brightness
 restore at boot, with bootoption "quiet"
Date: Wed, 12 Jan 2022 15:08:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ninelore@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210263-2300-UEadgH0kBO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210263-2300@https.bugzilla.kernel.org/>
References: <bug-210263-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210263

--- Comment #8 from ninelore@protonmail.com ---
(In reply to Fabian from comment #5)
> As of Kernel 5.15, I don't need fbcon=3Dnodefer anymore. By default the
> backlight works and is set on start. I still get from time to time an
> boot-error by systemd, but that can be also worked around by loading amdg=
pu
> early.
>=20
> Can someone confirm this?

(In reply to jaromir.obr from comment #6)
> @Fabian
> I have the same experience. I was running kernel 5.13 on Ubuntu 21.10 and
> when I upgraded to mainline kernel 5.15.13 (using
> https://github.com/pimlie/ubuntu-mainline-kernel.sh), the service
> "systemd-backlight@backlight:amdgpu_bl0.service" starts as expected and
> backlight seems to be restored.
>=20
> With kernel 5.13 it failed: "Failed to start Load/Save Screen Backlight
> Brightness of backlight:amdgpu_bl0" and I was not able to start it manual=
ly.

Can confirm this bug is fixed with 5.15

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
