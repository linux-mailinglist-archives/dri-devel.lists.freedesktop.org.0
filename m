Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A43B5263
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jun 2021 09:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BE96E07D;
	Sun, 27 Jun 2021 07:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C296E10C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 07:11:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3429261C35
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 07:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624777860;
 bh=T2QhkcYWHZ3MMIV6ceqODzJsSl2mMsGYsQRyDyOUAQ8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hw5A4R0wxBZzQsus3zEaHn3B51NewxLnwC29ermPrOGI1Uty93WvQe/iDxvL4KKIL
 KeRy7QQjpKxbh4Wv2cqDNUqjcDmvEgKi8eRzm4+o0nAKFU7o0t7YvrHnVz4tKLkZud
 XSJqRTu1Nva93Vc/I9gNgbjeaxPIIjiOkBp2AnDReIqR+NAA11GjMrQ/EjQhIzcRvk
 3DUJVPytXxHSTCvcDpzn/GcocH9NIqg0Xrx8AIAITIoheswhqicqqEDP8qUmzGm7eY
 gVaPngfKxJcjsK8O1Kb8jqSqvAk0DxF6mIiYiP8VjLEvES3SRF9Im/MUPtKeuUsJyG
 cCkDA7SToegxw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 27A5561246; Sun, 27 Jun 2021 07:11:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213599] amdgpu: navi RX 5500XT Very high idle power consumption
 (22 Watts)
Date: Sun, 27 Jun 2021 07:10:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: high
X-Bugzilla-Who: yuya@tcha.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213599-2300-dgqVke6BDI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213599-2300@https.bugzilla.kernel.org/>
References: <bug-213599-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213599

--- Comment #4 from Yuya Nishihara (yuya@tcha.org) ---
Yep. In my case, it's gfx9 but both gfx9/10 should be affected according to=
 Bug
213561. LTS branches will need backport of these patches.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
