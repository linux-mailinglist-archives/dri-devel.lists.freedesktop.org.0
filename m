Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E88510ED0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 04:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44C10EED7;
	Wed, 27 Apr 2022 02:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BBB10EED7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:33:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90F2061C3C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01583C385AF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651026804;
 bh=mUUXbxv34mMiMHNN43Lk1SC9d0/lun+ahWZNPThi07w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AhwKvUO7f9hSaKXO9CwDIcUUV5g+gkBUfGRhMgs380g4S4y2EVkexlj3Cn2Y/Hv2p
 0vriK/nNwTmnuKXABjzzIZRaUJKY+7nHqeaYUxcGT9n4aTWjhFwN5mWeP9eJ1FprOX
 OvEx81jFSTlAZngFNreVfS3ha2K3KSvbXVA91rrMbZp9B0ytdiHi7R7ONpe8xeQ+vX
 JoINh0TMUqBswdaX2fEWcYv5BU+CfzYdtMFpAhCl2iuFEZm6LbYEp8zdwzHcT8uOI2
 ggJI3uLWucRBvO0KNYmTCPPNUwVuBBXkzutkQSaPNAruoHdBYxqfhsQh1rT4rPoP3b
 tLcTjWfoUx6nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DAC11C05FD2; Wed, 27 Apr 2022 02:33:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215892] 6500XT [drm:amdgpu_dm_init.isra.0.cold [amdgpu]]
 *ERROR* Failed to register vline0 irq 30!
Date: Wed, 27 Apr 2022 02:33:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ulatec@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215892-2300-TZk8vzxpV9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215892-2300@https.bugzilla.kernel.org/>
References: <bug-215892-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215892

--- Comment #3 from Mark Johnston (ulatec@gmail.com) ---
Created attachment 300814
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300814&action=3Dedit
lspci

The hardware configuration that was most recently tested.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
