Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140CF3D2D18
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A036E831;
	Thu, 22 Jul 2021 20:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF106E831
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:04:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7E38760EB5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626984252;
 bh=+DRg6r3Wa1u5W9IjlJxv7CPSKB+vvSrybkmyY2AD/XA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C96Ho5dY45lLFWUL6UsYoUSwgbIcco5qiWO3F/atFZG5/lCag72zWmzpy2Cf0l6q+
 K5sUg9vSg81fPVO2Jy21+0njLMgAC/3rFlLvhLBlgk2dAjGwRL1D6pjKspb6NJO+MD
 j9frwh90x/mZEOrIWD7PMWJzUVPRzt7e+TTf03+hvbUsB/41+ZF4Ko9zditfyGDxJa
 jmwCl5IH2cuO4uM4OWOkv6uGf044cvHKdXcOcyaUZO/+oWlWYT46PoXENN0kDhoG3w
 ttG3W3W0VYXnw/Yy8/o8hXPsQlJh1HMaXVJNfpXzLTfX32Sbk+ltIF4q/CK4X6C5jn
 36iMC+h031veA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7B79A602AD; Thu, 22 Jul 2021 20:04:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213823] Broken power management for amdgpu
Date: Thu, 22 Jul 2021 20:04:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bruno.n.pagani@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-213823-2300-OL51bsXIMC@https.bugzilla.kernel.org/>
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

Bruno Pagani (bruno.n.pagani@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bruno.n.pagani@gmail.com

--- Comment #1 from Bruno Pagani (bruno.n.pagani@gmail.com) ---
Created attachment 298005
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298005&action=3Dedit
amdgpu dmesg output on 5.13

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
