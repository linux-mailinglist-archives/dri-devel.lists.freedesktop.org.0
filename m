Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD1E98D01B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 11:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED3410E6D7;
	Wed,  2 Oct 2024 09:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y6Y141YZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B8E10E6D7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:27:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3EF595C3645
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EADADC4CED4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727861239;
 bh=QwUyGI4dLFSIRRT9jRQBRwvOmsvLPJtY1Cuq+Kr105E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Y6Y141YZo2c8Dz7BnpbkCBXIEZ9sOVZBfUGewfntbwmsmR0NEpF1lrMmZNcNberRY
 8+xKZ/rKxDElOAyKpWNThj1OS7S1cqWrwWdPQBkwV/FPk4sh0x1FYSAHJJS/EQS5YX
 DiZ1NenxAcilVNO6DXSdp5JJ5t0uEP+/8fhieyByhipE659k5i35hAKClo/nu4DdN5
 UCtQqitmhLOow+4QvnRJYfHcg+0LhN64D/GRay83edwU3jLDSTUD9SUc4qlX/tlVe+
 9pmTZzMu0xXrW+Ma50bFhI6JVyesx6QcoisvdqETCFkqMxv8pAewa9jdpoUdhPCMJ+
 se6fKcHzjAdHw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E2D16C53BBF; Wed,  2 Oct 2024 09:27:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203033] nouveau hung task
Date: Wed, 02 Oct 2024 09:27:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rootkit85@yahoo.it
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-203033-2300-OupLzogNnI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203033-2300@https.bugzilla.kernel.org/>
References: <bug-203033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203033

Matteo Croce (rootkit85@yahoo.it) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
