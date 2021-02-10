Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE883164FD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 12:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B5B6EC5E;
	Wed, 10 Feb 2021 11:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B41E89911
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 11:19:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CC3F464E35
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 11:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612955952;
 bh=Y0cXF2p0SQCE7/yCznbZgLLkfLOWjS32LT03nDIPtg0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lJGLLPH35v5oQLRUHPgWzNnIk7VcfT/aJtM2WafSey0mBV5PpP2n0fEVXTrUQeskJ
 XgixweFQoc3MPM2p+GTeOw9w0hbsocdku3sOpU2W9zmK4NOuMGSfVlRZQCg4xXkCK1
 Lz8TQuAcPufX2qKz8kO/m4Edmog3sRW4nrl9oj+p7xlMfhofgEV6NOSdiB0ZOZKtMD
 wrpsqwEk+gaHECWCIXxug5jiJLAhkVXp9n2X24MLBe4OzM2w25/eTXlsHcBFDCtRRH
 nK83hTkTYI7e/GRhWIwRX/SCZ343hOkJ5v2JjUTNGENW/E6nl5LH1GkViq4YW8vXpZ
 zLaB+CfrAbwaQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BF56665259; Wed, 10 Feb 2021 11:19:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210263] brightness device returns ENXIO (?) on brightness
 restore at boot, with bootoption "quiet"
Date: Wed, 10 Feb 2021 11:19:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ninelore@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210263-2300-OVXINRtVDz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210263-2300@https.bugzilla.kernel.org/>
References: <bug-210263-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=210263

--- Comment #2 from ninelore@protonmail.com ---
I just found out that this Issue does NOT occur when you additionally add the
fbcon=nodefer kernel parameter.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
