Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B058D35B0
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 13:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA68210E6D1;
	Wed, 29 May 2024 11:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rO1bAzfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DACF10E592
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 11:39:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C77CBCE17CF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 11:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01540C32786
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 11:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716982746;
 bh=akHq3/PblYU9EYissHw3/URv8T5eKnHAhqDqENgxI9Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rO1bAzfvRPY29su0lQz9TkEfguJzj7MxnMiBjreQJgRSmSpJqa/evug9WP6KCTeSM
 fOEgKM3keYGL/DR6LtMrbbTbnOdp63d/iL/oQtwsy/eXD68rWYMHunT/CsMEB4gCzG
 hRBsADRe8LTvcExAxjKO1uPy8oMsfmoefDSc5QHhab0cIhmrmKICOuTUb2Kyn3LdJ+
 umjoreP0J8wy4bMGIbr/Js/h7EaRN8rXtVakWIWBe6mz5uhNcSXt9qiRUff3U3Y0Ia
 pT97bYvPKmKlSq2YQ3HsS/ZfDx/OkRh6HHi6/GGKPwvoggIXqh0fWiGsRBH1JLbZIv
 jGvRWZ2JYCA1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EAF02C53BB7; Wed, 29 May 2024 11:39:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Wed, 29 May 2024 11:39:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.ispatch
Message-ID: <bug-218900-2300-aZG0lKdYpD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #306364|0                           |1
           is patch|                            |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
