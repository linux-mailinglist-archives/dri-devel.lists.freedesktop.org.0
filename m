Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2F3ECA96
	for <lists+dri-devel@lfdr.de>; Sun, 15 Aug 2021 21:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5D789C13;
	Sun, 15 Aug 2021 19:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B96B89C13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 19:03:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BB89961351
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 19:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629054228;
 bh=p3NQnXGwHY49mjI5jHy+8l+eioko6iy+zGwVRaJvzeo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GwiwTkkZ9QqvInw4z2oszLUc2eN2I5+f4i1/Dgib0hTlexwhzJ2j9EjhAjH7JBdI2
 09V7cwHWjDPNCrMFzUb5EfMMbim5qlWuINiw3vbUbdjkooBMvD47/cfvUFnEx2zXaH
 PdUMqXdXR+jXNHo+fvgZAxEZpgBPmFlgR5S+6XNSgAFFufYUiYQaJpk7fP1B5sR9xy
 GawvQnh1POWVtMD8jqNG7KKdauUKytPSmRhzqGDD6ysaXs88HkzuRdX+T35D4A+CEU
 rMHRPkWui4sj0qGm5XqrDL/8SuRU5SbT0S/GiyNAIwSa8Vg/v+zU2wUEUnu5qdvZlx
 +sRjFmhQ9CrCg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B742460FD7; Sun, 15 Aug 2021 19:03:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 15 Aug 2021 19:03:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ctjansson@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-9PHxHk36Ft@https.bugzilla.kernel.org/>
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

ctjansson@protonmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ctjansson@protonmail.com

--- Comment #19 from ctjansson@protonmail.com ---
I just triggered this bug aswell playing Payday 2.

I have also triggered this bug when playing World of Warcraft in june.=20

OS: EndeavourOS Linux x86_64
Kernel: 5.13.10-arch1-1
Mesa: 21.1.6
DE: GNOME 40.3
CPU: Ryzen 9 5900X
GPU: RX 6800 XT

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
