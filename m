Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6970A789B51
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 06:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC7110E04A;
	Sun, 27 Aug 2023 04:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF0B10E04A
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 04:11:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E00F61DD6
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 04:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C610BC433CB
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 04:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693109500;
 bh=gWAOeBJuzNcwKtPKeNdO6Hfyx9jfE8oQt0Y/ZeWCtyg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PHEo6eBqblmf04hzkLbAwOIusIRNIN6GRwIxmjuy5CtgpzfnSe5ue0Io7RY/1Qaon
 KmEljX4DnpsAWRA0i3T+cQOTgPzmOEK/ULvgS7/HIYCBwnspEVzqF5Qnt8HsW9/ZaA
 8a5gE93Tqa2g8A0EqNXnfvDF9/Go0RTAn5MxeGR2iAcswxW6QRLCX/yyPmTVumYXcf
 McgHjKDhn1FNe77AbPYrhB2fVwHO2RYDLh2ahik7s5n0u0LyR9gLblRXcFIkPpwxoz
 ikvTg0l2vv8NN5kX9Z14jPOmI3Yx3ZvoQHDEVjxNu/pO19URWJA0v/AlYUmRN1nu6T
 VbUUs2/SQhFLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B4BF2C53BD4; Sun, 27 Aug 2023 04:11:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Sun, 27 Aug 2023 04:11:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-UQGzhMUqSD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #37 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you please use the s2idle script without the modules loaded?  It will
capture other debugging information I'd like to see to come up with a next
step.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
