Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13178FC72D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 11:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4AF10E152;
	Wed,  5 Jun 2024 09:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QFAaM1uk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDF310E152
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:03:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA9F5617A2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD685C4AF08
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717578213;
 bh=t7B6aVYIRUhL93TiMjgQxDd8og3TDCOxL3mOYPvkTiw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QFAaM1ukD4KTf7yAP3/LdeBM/w52CW8vqesjXR8g7d5p/fv460mznnj7qb6/gWAfh
 N8/WakKQDx2yTJw16tVUejIZ5OSrB0ScwG1aBmhYDge2wBkZbku9P3dEkSCJCc6AQp
 4fG+NelJybmwt6ZhVeqBelMWd4+m+k6pvTUbxE2BDWWQzqF74u/aFb7edekHPdyOvi
 ZcGEUeQTfMlKLYftdGeABZYLLB43AVMKT8tRUio/scczW4v2Sy5qK1V/gkjwmmRqdJ
 eayiOYXDa/4zWu2faL2+gd9RbwNEugR2cgBr/E4yYehe6N25z7gWPRIMXv55nVKfR9
 gF9hOALEaQHIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AEF17C53BA7; Wed,  5 Jun 2024 09:03:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Wed, 05 Jun 2024 09:03:31 +0000
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
Message-ID: <bug-201957-2300-tlDIrOChzh@https.bugzilla.kernel.org/>
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

--- Comment #103 from MasterCATZ (mastercatz@hotmail.com) ---
and 6.9.3 also crashed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
