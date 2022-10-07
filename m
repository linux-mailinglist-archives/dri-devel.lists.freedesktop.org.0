Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4E5F8037
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 23:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B2A10E370;
	Fri,  7 Oct 2022 21:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD3310E367
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 21:41:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6995861DFF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 21:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA465C4314D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665178898;
 bh=5jDXDHjHADWJLtXVVo3KOTQFjhinmXyRSeOzCXu/YYU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vBfjJ/lHxKgTdEa/EaWxyy7KCfhCroaFIusuxvQE1XwqHP1A+KJ0g7xgLCDqZ7Y76
 EOqaRzrrRgYLvbHMvJ13hrKHAeDuV6hMC6TOWNxh4zKSO3PX3hn0evWe7sfkaQ8zyA
 COgdkICncwzoPtCh8Pmb9WjrkrQSQBlKR+58KFLMTGQNrQtiEt01/RF8N3Bqq00B5e
 jOAUjX1M/Po34Po/e5HgRpQQn+BYM2MDq5HySBTjez/IcxSfhDSljbpFiiEelMm1PE
 hoKDJ7Db6DegCm+rE0qHKbfNwClRt/qAYI8SFpv/89XyZq8MhJEV5TTpFNzNC0WocG
 zQV08A5x+tedw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A769AC433EA; Fri,  7 Oct 2022 21:41:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Fri, 07 Oct 2022 21:41:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: laurentc92500@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-IkymUq51qB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

laurentc92500@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |laurentc92500@gmail.com

--- Comment #50 from laurentc92500@gmail.com ---
I had the same problem with my Sapphire RX 6700 while playing War Thunder or
Grid games. I got black screen and then return on the desktop but nothing w=
as
possible to do but launching a shell and see the same error message :

[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!

I found the solution by forcing the VSYNC everywhere

> I enabled VSYNC in all games with the native refresh rate of my monitor=20
> I also use mangohud to limit the FPS to 120 with VSYNC "ON" for Vulkan and
> OpenGL in the "performance" menu

My configuration (from neofetch) :

OS: Debian GNU/Linux bookworm/sid x86_64=20
Host: MS-7B79 1.0=20
Kernel: 5.18.0-0.deb11.4-amd64 (from bullseye-backport)=20
MESA : 22.2.0-1=20=20
Resolution: 2560x1440 / 165hz=20
DE: MATE 1.26.0=20
WM: Metacity (Marco)=20
Theme: Menta [GTK2/3]=20
Icons: menta [GTK2/3]=20=20
CPU: AMD Ryzen 5 2600X (12) @ 3.600GHz=20
GPU: AMD ATI Radeon RX 6700=20
Memory: 1801MiB / 15925MiB

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
