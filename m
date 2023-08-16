Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AABE77E548
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 17:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E99310E399;
	Wed, 16 Aug 2023 15:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808AF10E37F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 15:38:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA3F7625F5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 15:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A264C433CA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692200309;
 bh=8BWfNE3wg72sui15XERUy5KZX4m+w/AhygqNGegwxdQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nJWQSSWHXqLrmhoO9pUIUH/oZiBcfZ3otuPXCH20a5URB56DixDeDns6Svr1IrB7D
 qg49ivit1YXMMVpui4vkaBDH86Io5GYvQb48CaIBVQ5pRK7e6gCjCo3GLMNLMsugHQ
 qJ9/9Zu3NooA1/eqYRFnoE5qHmlIBEFVe1vXPKjhgOzenMqc4fzanUZaApkajsCu3B
 7kDsAPCAXcBPCyU2utlup++XWddMS4p7g2JEu4bo4nVpLytI6kczXVcNDd/nSiFD1J
 EzMHbeeeVulT8R7L3j17m6p+b2Lr0fcjmdld3J3yPli1S9cwapFN7RISwWCZYVg6X2
 xulXsJJ7HAMng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 41C06C53BD4; Wed, 16 Aug 2023 15:38:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 16 Aug 2023 15:38:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: colombojrj@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-e3pv2PYXEc@https.bugzilla.kernel.org/>
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

--- Comment #11 from Jose Roberto (colombojrj@gmail.com) ---
If I may: have you tried to disable (or even better, uninstall) tlp? Most of
modern GNU/Linuxes come with it previously installed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
