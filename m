Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D378E785964
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 15:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00E710E41F;
	Wed, 23 Aug 2023 13:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D21D10E41F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 13:32:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F12660F98
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 13:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C44EC433CA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692797570;
 bh=PqChREVA/jvLVphyqOE78SJHGEZjzLmYH0xm+s1lpZo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E7B+TdCNOhQYaXQVFq4kJPC7IqTpIHwKU0qzeZGsSZNVCZhI4rxCjdZ4PB3wpuwJr
 6aotjHDBVWkSWZ+u8pRhghBFC6Mcy2dmsWNG5VWmtkfs2CBdsqSexM3icJE/wIsToI
 krqhsPzOP32NaT34VIAgx/IOGKNemYFjG5I/orISxzTq4dFuZxb8Y4gcAWnpbmRVnM
 oXEpB/9YwsfXiRaE+vP5ELeSMPu4gpf3qhNnqZ58HsnA4g4d+hwHPxk6JtTs5AoaLs
 cBIU1V8SHovYhquZKbtgyys457+K2wWDUBF/SzxLNVKTy7HNyx1bwancObMyBIsZhp
 0uFD4MPWXKCKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3613BC53BD4; Wed, 23 Aug 2023 13:32:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 23 Aug 2023 13:32:49 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217664-2300-tUhnofP7OL@https.bugzilla.kernel.org/>
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
                 CC|                            |mario.limonciello@amd.com

--- Comment #24 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Kernel Version: 6.2.0-25-generic (64-bit)

This is the upstream kernel bug tracker and you're filing a bug on a distro
kernel.

Can you please try against a supported upstream mainline kernel not a distro
kernel?  This might be missing patches.

You can find mainline kernel builds for Ubuntu here:
https://kernel.ubuntu.com/~kernel-ppa/mainline/

I suggest trying 6.4.11.

> [  145.070506] PM: suspend entry (s2idle)
> [  152.723268] amd_pmc AMDI0005:00: Last suspend didn't reach deepest sta=
te

This system is using s2idle.  In this case, disabling amdgpu won't be usefu=
l to
identify a platform issue because the system won't reach the deepest state
without it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
