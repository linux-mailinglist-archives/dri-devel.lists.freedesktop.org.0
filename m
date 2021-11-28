Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B2846093E
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 20:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1B56E0AC;
	Sun, 28 Nov 2021 19:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA836E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 19:16:01 +0000 (UTC)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CA82610E8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 19:16:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6716B60720
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 19:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638126960;
 bh=k3ppCWtqcOOUxKh1AIFPHhIndtYNInN8Bx6v4dX5/z4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MzXGf4DrtE2RTPbM/CNLRFVJkTFt5RM7BT4/utE+k3rvKfWw4G3xZXMk79SUl2OLj
 6JMrSuqUP/x8x8elGuPmBt/Wrfcdv5MTrTKjR8uEdYXTtozBThQD700npn/z8d/dQn
 HAqnww2iAA4F+AFgR4oxlyL4bR5idoyWYwKA+IBxLUHk/3/o7nNyFesyBNTLfVj/zF
 ojOOF4pIXpTIs3z8fmXIHKKKxnde39dla5DzeKk70QnsFTSwUIsIvT6tderPrGmpO8
 ACCl0LuOfADPBCfVcsFn5MZk3rgU/pO4S2P8ps83/gzfPupFZiP+HNF8+UyI/Q1LRJ
 Vz6+OEcbC2PCQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5150B610E5; Sun, 28 Nov 2021 19:16:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214921] amdgpu hangs HP Laptop on shutdown
Date: Sun, 28 Nov 2021 19:16:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmw.gover@yahoo.co.uk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214921-2300-5KhRMaUWmV@https.bugzilla.kernel.org/>
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

--- Comment #7 from Paul Gover (pmw.gover@yahoo.co.uk) ---
Kernel 5.15.5 (which IIUC contains the patch or equivalent) works for me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
