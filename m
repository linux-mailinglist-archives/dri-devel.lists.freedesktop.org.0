Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0E3F79BB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 18:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191D26E3AA;
	Wed, 25 Aug 2021 16:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7669A6E3AA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:03:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4926761423
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629907394;
 bh=/GjP91og9eFALRoaPzek/AzFikcLaczyP9RkNo5OZlc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LZSFYvsXM56nwpY7KYxsHLu7dzEk92xDPFFFZ6+dvPHP5TPO9oZ0zsAP3rc5jlT0g
 /SsHwxTZGkwF+VczMk1FVNDKCcfo6poGswIQTHkcHQtLwuQlTz7DjAfx2gK8a6Ppnh
 iGkyaoBkOinqrVOb/Ir68o9hleyz/l920vLErLGmsAMqWqxvW+LjukNh4A1PpnjFsM
 cBD6Pbny2psJIjLfceKpt3VUuFa2Rz+y7jd8Q8nLTauOVCc25eSmRfolPC5X4JMID8
 biLs1RdkBHuoklkkXFVMHVJbFU+ec852LJ7wD6vn0e8VFtte4eAJBlPqELJWZx3Xo8
 GK23rur681Xvw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4709F61002; Wed, 25 Aug 2021 16:03:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Wed, 25 Aug 2021 16:03:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: info@aloisnespor.info
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-wbyOx72Bsb@https.bugzilla.kernel.org/>
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

--- Comment #20 from Alois Nespor (info@aloisnespor.info) ---
(In reply to Alois Nespor from comment #15)
> i can confirm, have same problem now with Ryzen 5 3400G (RX Vega 11).
>=20
> kernel 5.13.4 and mesa 21.1.5

seems fixed with linux-firmware 20210818.c46b8c3 for me
see
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/?id=3Dd7b50e61669dc137924337d03d09b8986eb752a3
they revert some fw due stability issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
