Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805D2454B19
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 17:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28C089DC0;
	Wed, 17 Nov 2021 16:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D4389D84
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 16:38:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F0AC61C4F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637167085;
 bh=97vfyNRyg8WY6lYDcvTCyvnKbXPHUR0/7k+Q5FajVeE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GHOc7gJ2vDApCM0AO2SLJGOHcK2OQuYU4ENCLg8oeThhKf/kP/OFQqABD6p6Sqnrc
 MSUsgZt22ln505J1fxAnmKkGxkBeNsVmt3mK9twVu2hEXpR+kLhx5jPqjS/NjUFIv8
 hsfaFNM0F3k5/QDuJeEqV0ZyqgK8cSkhSHpQ7JuAV9zpMuNsLvDGiGWmmxiFKcruXc
 MFr90DDA9KW6+ZSljO9mZySifnVEswpF42r07J7/dcrD16FJnL2PEmYSRFNh5xkK/+
 QoeAQVKoFP5USKqXCM1C65WZYMbvJQUFoJAy6lV6EJme56d/gQ39tnZE22bZLExiK/
 6mZQyOha6AsEg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2789360F50; Wed, 17 Nov 2021 16:38:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214921] amdgpu hangs HP Laptop on shutdown
Date: Wed, 17 Nov 2021 16:38:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214921-2300-NVNlG3VXSF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214921-2300@https.bugzilla.kernel.org/>
References: <bug-214921-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214921

spasswolf@web.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
