Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25023DDA4F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 16:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AA46E043;
	Mon,  2 Aug 2021 14:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4375D6E043
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 14:13:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EB3A760FF2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627913588;
 bh=OQiTZCmG8cNDXiaPFdA9TOB2zFdBz6br1OsEHIYxw+Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=glTof441UFxxKPTsdIwGyQneCZGDqyMc1Jkqh05AJ0mKVLKQYyQQcZILazwqzc+NB
 Zr4CVbQ61EmpBApIe7WprxwfpNDnAXs0zzAz5U/xR64yeYGswc6kqre6GacA/R30BD
 LlUmArG85HwZtsq9vxCm7hKoU8hC/5anozHJ77ZD25/JwJCYFE6eYtYcq93d4OoNGM
 w5bKP0l+pRJLRDZXcTmBqMMl019tYQ71iw7OUlEMz1pa7jerYznKd609MzxXgSwyfs
 MXd4jM3KxX5e42I1vi150D2G3y6NC3jvaO8yqSNL/8A8UB2Zaogdq8jCaNcEJPG+RY
 V/8MwFM5PGHIQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E3BE1606A5; Mon,  2 Aug 2021 14:13:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Mon, 02 Aug 2021 14:13:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-uhlLKmP7vq@https.bugzilla.kernel.org/>
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

--- Comment #17 from Alex Deucher (alexdeucher@gmail.com) ---
Does up/downgrading the mesa driver help?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
