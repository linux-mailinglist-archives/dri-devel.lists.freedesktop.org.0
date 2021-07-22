Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F5D3D2D87
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34F16ECA1;
	Thu, 22 Jul 2021 20:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936AD6EDA3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:16:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 69F6E60EB6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626985014;
 bh=8uN1+J3iLV97SINpsSA9/Axag79f9HPDs5Xg5J6QldE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JVU9SLxTeEVcvWpSAcbM1S2dGz4CqkT9npaQfUHmAI0pQp3pG8vSJ7MTj5ZUGd07x
 6MfKmwGx89nJAxahBof+kYSJFwQezWQNoq39kywRGX/E2lWn8thFyr35kraI+9sOkb
 8oViDHz4Z/29dZHhh1LLLcbXpwKGDETbNXyOsEEDH285S/kCszdM4HXUartgpWqYsI
 vzyISNYAApm59inpewDb7CTThB9PoTf00PxmYpeJJm7pU7yoNpBNbf5Ktnqj37xfKx
 AkoDz5GlcUr46F2/wYFiJ5d5j4sr/kiOgFHhDOG82q2QL5SKuKi+Ts48ApXJ+DiDE9
 a9r2VD3vd6YaA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5F4F960237; Thu, 22 Jul 2021 20:16:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213823] Broken power management for amdgpu
Date: Thu, 22 Jul 2021 20:16:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213823-2300-7sc7Owh0JI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213823-2300@https.bugzilla.kernel.org/>
References: <bug-213823-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213823

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Please attach your full dmesg outputs.  Can you bisect?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
