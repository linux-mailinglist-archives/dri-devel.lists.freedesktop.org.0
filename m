Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641193394B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 10:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA99B10EA0C;
	Wed, 17 Jul 2024 08:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I7EioVF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1472010EA0C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 08:42:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C3BF61680
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 08:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5529C4AF17
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721205729;
 bh=7Dphdh9/G9ukpWcV1ixvxapqlORhg01Z7UpbvDmIFTg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I7EioVF6FTLVopdqCenvPh0QQwijaEk8aFQO1jWG60I976z24v6d35XoLlZ0ePHNe
 nNN40rETIvw2M7MXqp2p0T6WXXLdtJu08Gp1YzWwBFIgJaNIkiHDST7VFitF4OQvz9
 n2XeW6T1PDvoGEjngp9fpCDjwusW6hNxSB6U8zxvAUHwFMRzJUdNNux8PW9ZVs5YyS
 OGLLXmH+/AceBwl35dtyxNXj5p1HOEzLPOsw6Q5DM/qGR//6+od3nvzMMH0VhWdyhg
 tBv0S+MIpEk67Mo8H/LIz3A7MPUPFwVDCoPxE9Y+65fRXAnk2bZ52MKd8LZMILxRWE
 l8hYzyoe1QWQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AE835C53BB8; Wed, 17 Jul 2024 08:42:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Wed, 17 Jul 2024 08:42:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc
Message-ID: <bug-201497-2300-sqvS7tgDe2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201497

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                URL|                            |https://gitlab.freedesktop.
                   |                            |org/drm/amd/-/issues/3494

--- Comment #33 from Artem S. Tashkinov (aros@gmx.com) ---
Please take it to here: https://gitlab.freedesktop.org/drm/amd/-/issues/3494

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
