Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903EB64C637
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 10:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E2910E3A3;
	Wed, 14 Dec 2022 09:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1B010E3A3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 09:45:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7954618C2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 09:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18FB0C433F1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671011113;
 bh=eL/ZliJ+odpu4kWQ4AZw/LQP+ggpHTUUKIXyQyE96Ik=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dIBUQs1UTmM64x3597aHoNCJTrfcJyER3qAmVUXSCHBdFnLEO2FuqGWaTjDutnLIW
 6Bt7R4SQ2bf5d8h3WQaXc4SA3Ij1ePHwrb1WkUvuxZ+SMAs++jDIadYMjILbiKarY3
 F7NuG1DVf9T1LCy/mr9hNV9yV3lwgcylEzgl1j4FHv98US2XU5HU7UjQZonGnj9FfU
 BgiZ7qm4MK6vLRaf3LY8PMjwwrN1ry0TK/j1L3+lBBpy+z32VdL8LhWKJgXkCzezME
 z+vU3dpFOBTsX5CqO1r6hS6bWvQjZMTxPmk3vSfGFN6WYyumnagn7t/ces6YLF9L0m
 QpSqEhouzVYyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E3655C43141; Wed, 14 Dec 2022 09:45:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216806] [Raven Ridge] console disappears after framebuffer
 device loads
Date: Wed, 14 Dec 2022 09:45:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-216806-2300-lC1vM06NnK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216806-2300@https.bugzilla.kernel.org/>
References: <bug-216806-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216806

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
