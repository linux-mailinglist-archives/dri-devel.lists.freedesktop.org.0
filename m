Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F19F44F2E2
	for <lists+dri-devel@lfdr.de>; Sat, 13 Nov 2021 12:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4A36FC64;
	Sat, 13 Nov 2021 11:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505F66FC64
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 11:49:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 24DDB60F42
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636804186;
 bh=pRgJOO0KlR8gPTGUB5X7EapTugDxD5hVa1MRFYoGq3Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hDz50Dp6ee2GqCYZjKpbhZ03Wk9YJKn8W7xjelHpQ0OGHbSTU2HDvje6HxRTabHVa
 jkjVLupuFd8lq2GLSfIJBeuLMamYbg+jrAppExr3qu7hz5At4nrF/JjZ09vMAk3CTW
 YSdIaHYub1kZgxDpWxjRKtGdGBbPBrXymZvAYbJa3I6nVkA+rtsxore7UCgrldsZIv
 XmaOLlVFySC5vz5egwyKdnY5OS32IaSMP/OsSqeZrNKKuWpcWYOjirvMk4p/KaGHmD
 KgPzV6rw367Jymnx8Bof1XYYzj0PUUGESo8XSJOgd518fDfTxnHP5xhVccee6FYu9P
 GmU1FT6l6QDdA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1C0A26112E; Sat, 13 Nov 2021 11:49:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215003] apple_gmux fails to initialize and iGPU unclaimed on
 MacBook Pro 16" 2019
Date: Sat, 13 Nov 2021 11:49:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dreifachstein@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215003-2300-ELvwkFRqix@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215003-2300@https.bugzilla.kernel.org/>
References: <bug-215003-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215003

--- Comment #1 from Xiaolei Yu (dreifachstein@gmail.com) ---
Commenting out the `vga_switcheroo_client_probe_defer` lines make the iGPU
usable but gpu switching is still not working.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
