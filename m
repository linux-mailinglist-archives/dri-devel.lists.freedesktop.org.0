Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C8477021C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF73010E713;
	Fri,  4 Aug 2023 13:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68A310E70B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:44:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32DB962030
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BF82C433C7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691156693;
 bh=6Rwkf4FA/80fgTrHgvmYaQ38VzDSmaXeEMZYAzpdbQA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DDSljKcbGL8xRO1c2kepyAiRUG6fYOmEHBNm923K2BWa/VP0X7l2ZJ74DfHxt442m
 onEwo97hrQhYSqvH6PUdXjL2jpgMD0pJjNH6HZFZi8l92w7Tll/PRYiTRdSi7kCHAY
 fQo2qIBIv+WXO4T7tBMW+/1BCy/WOJKJRcK8WcBXu3DxAO/EUuE2P22Wv+3R7ziilK
 P/OgeXrgUrI7lXeZrBASesaPoQgae3OqAngCPl0bvT6TmKZi7ArSexmmRWaWUbAvNA
 Ex+Jbn3AMgg1ijmvVrv2mfFqFisgsOtoATAU3p3cgnLjOEbAx395QT3GFr0C6Zx3He
 WcYG0JsyPMHSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7E2B7C53BD1; Fri,  4 Aug 2023 13:44:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 04 Aug 2023 13:44:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: colombojrj@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217664-2300-9NeBcMomrI@https.bugzilla.kernel.org/>
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

Jose Roberto (colombojrj@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |colombojrj@gmail.com

--- Comment #8 from Jose Roberto (colombojrj@gmail.com) ---
Hi, I am having the same problem. My laptop is Thinkpad T480 with intel gpu=
. I
discovered that it suspends and wake-up properly with AC pluged. But it fai=
ls
to wake-up in battery mode.

OpenSuse Leap and Tumbleweed -> dead
Debian 12                    -> dead
Gentoo with kernel 6         -> dead

I will try with gentoo kernel 5.

Any ideas of how to debug this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
