Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C78D3C08
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 18:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D35D10E31D;
	Wed, 29 May 2024 16:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EAuMJEGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D7E10E31D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:14:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3C84FCE1843
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E59CBC116B1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716999244;
 bh=N0H/exlCUZ0rhJMKi1V7032s7fPl9m3SNNdnkVMleE8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EAuMJEGOSprsYFKRXnX1yl4FQIBDi/SZ/m6p+MfkPwPYazdFa95OJMDVmtu/nlnxm
 9ru9gO6Q7q2P2b8llk9LEGuT7he8LTAUht8pMAnVJgfokkC4SXvMnCrAdddCPpOGMZ
 moqbL4jNnqtHKLOhxbByAmjEVVojZUE33WB6MtjrKomhLohOJAV0UjrTbg8Zs0+uk9
 z8yYXxZH1yLSNG25L4MADyj8jq/6y4NLQdhvqv+7wmjbRAxrCq3t9axrsA50tYHk6W
 9yVxnu1TO/AEbyum8KPesGS1Bw49fq0BOxDIlzWmDq1mx5UXrJ5drjavYZqQISHrBy
 X2+AoQDzXH0IQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D8B9DC53BA7; Wed, 29 May 2024 16:14:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Wed, 29 May 2024 16:14:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jean-christophe@guillain.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_bisect_commit
Message-ID: <bug-218900-2300-l16GRm2eEZ@https.bugzilla.kernel.org/>
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

Jean-Christophe Guillain (jean-christophe@guillain.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Bisected commit-id|                            |c4cb23111103a841c2df3005859
                   |                            |7398443bcad5f

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
