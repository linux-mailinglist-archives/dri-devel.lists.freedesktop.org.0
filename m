Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3578BACA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 00:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642CC10E0F0;
	Mon, 28 Aug 2023 22:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9949310E0F0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:03:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 211A4637C2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89540C433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693260212;
 bh=fn3StUPNXWGss0KsWvpibKIwNe+SD7Adqn5rzhdJHMg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ouyaDLq15p8YhvNvr5ZpioCN+qcLo2cL5PD3OvJPN90LU0ME/ceH8TcGVtWer44Gy
 /W1TYjkR6PTwjEnNeWg3DBvHrU6lmNTm25lUxee4Op27OBndbzCr3sBgfTci0x2l9P
 Y0kh5uqphO4jMF5+uCmw95wfnr8Qa71R/Cl2HBWFxO28qxDjofwuWDscB7HpWMY4Z0
 3LDtU3gvoXMPTZQN4daxsVXedFIJwrZRO767XGSdtf0S9qgNLM3FRLOZCn4HBCseKo
 WSm65Gx/LmXinNA0F3EfnN04dzgLpDfXNdUrTuekhn0WEktR8tRV+P0ehlQXOj2uKM
 c8a7M4kw0gwBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7A8A4C53BCD; Mon, 28 Aug 2023 22:03:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Medion AMD Laptop doesn't wake up from s2idle with SATA
 disk
Date: Mon, 28 Aug 2023 22:03:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: Serial ATA
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-217664-2300-ozaC2w4gR4@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Laptop doesnt wake up from  |Medion AMD Laptop doesn't
                   |suspend mode.               |wake up from s2idle with
                   |                            |SATA disk

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
