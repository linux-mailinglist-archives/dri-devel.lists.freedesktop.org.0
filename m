Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CA581A150
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 15:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A56D10E5C4;
	Wed, 20 Dec 2023 14:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CB210E5C4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:43:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F2D54B81D92
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57424C433CA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703083386;
 bh=182KQb2CyJfWvNu2nvPcIvRcnmKEc12yLM77BdEwmGI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Cul7wRha7irAqe3J5rr3ODBH+k1DVuaf5C3+TKfigTkmf8FCQNhtM83q9lethPqqK
 3p2yBWy9nA0dAD7lM+ePgh1dZUPCqaIUY3ZgWxXlv7sME2JnQK2P1hO2+N/btPPEa9
 R9moC9cLZke/lnyJLNtERaKAb7Ld9zgRvmi8aWSx9WJSu6zEf8CmDtvSSqRw5YnMZD
 LTZzeTaFbU10ELDebTuU7Qshr/0bgQQKIDoaOYUrFhxZ88Ku9WXG+4v1MgdIYHFDbG
 5ofZCnK4U4VZQ2bW4sJZRQbrcM68C+ozPdWwiByb9enay3h2r+8dZ/I05IC8a2mqK+
 FSB/jfrV3zP/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 43622C53BD0; Wed, 20 Dec 2023 14:43:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218292] Built in Screen (Laptop) won't wake up from sleep (AMD
 Graphics)
Date: Wed, 20 Dec 2023 14:43:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@bewi.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218292-2300-ErUunYWn2A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218292-2300@https.bugzilla.kernel.org/>
References: <bug-218292-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218292

--- Comment #5 from mail@bewi.at ---
Sorry i forgot to say. I don't tried the 6.5 Kernel. v6.1. works. v6.6. doe=
sn't
work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
