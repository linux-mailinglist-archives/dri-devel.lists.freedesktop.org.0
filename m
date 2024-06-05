Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9EB8FC724
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 11:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258B610E570;
	Wed,  5 Jun 2024 09:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N1YHWF8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19F310E570
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:02:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B7CC61796
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFDD6C32786
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717578126;
 bh=CvupMjeJyQGFt4m0etlNw+y9A4k7nMWJIaz3ODcSxJI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=N1YHWF8bOYgHX5FGnYIC9IQEnnZq6gMUbgKgfzIYm6hn5V9iPSNGyU8H1PyZRLAvE
 3oN3O+4MWPV5sU/8jjT1KwIDPQlYwJnsiJK5dToAe2O5AbMWU5RAGNA55s0PS+gVzy
 JHD12t8+9mP06q+fIgtqRtoL6RC7+3zIEMZtJcnlDQzqqo1ClHyf6BLUvlURkESOjG
 d9ly2D/syeJ3/uwEhMDuDs3p7clAaE9kQ5NAtSIYhukDCYJIKZ0OZasLpd27M1Pbce
 Dano+dcP0k76w8so6zHSyxl7nsTRXlTvOdtVNe3XwLYjgrN9yURAMUxJWXtbVZaQXJ
 3PDdohmhuxtYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C8D40C433E5; Wed,  5 Jun 2024 09:02:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Wed, 05 Jun 2024 09:02:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-usSeNVsrPf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #102 from MasterCATZ (mastercatz@hotmail.com) ---
issue seems to only be with xorg , used wayland today and could not trigger=
 it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
