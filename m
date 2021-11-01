Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3224C442160
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 21:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198FB89F2D;
	Mon,  1 Nov 2021 20:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C264589F2D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 20:05:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 97F4A61355
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 20:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635797126;
 bh=t3Ge3hFG0ycLcutyCMH54pyU3nVE+SHT+OOgy8QSYU8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Xev0GR7yx6LSZfkHdZalIzR+gxl52boLbLoOKiG3xzyiaRHsjmad46T9yAM86/RcD
 R4I4hJ7PpndJfPIfrZNJzYKvu+eV15sGlMpgF4A8nOFdRRUTKiYJ/U5wrOB2pcBofM
 lenKcRateXAc3vkQyyTfaKYNfvabCcqnuUZRdzcDYD06fiu4wbhm/5G05J82YFoJO5
 vnBHTSLmER6P5suvaF/khY3HxkfYW23Vkn6jZ9bERHle5N3LM88yTgLbtYI4uKPxvf
 kTXhto+DQP9a1hFXbWmZ7fl7A5bSPB2rtfeWZigUsHzFgVKOlGFK2eANss9yEMI0z2
 /gd/lrAJcF0dw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8A2D460FC1; Mon,  1 Nov 2021 20:05:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214859] drm-amdgpu-init-iommu~fd-device-init.patch introduce bug
Date: Mon, 01 Nov 2021 20:05:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: towo@siduction.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214859-2300-G1Bf91DR4U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214859-2300@https.bugzilla.kernel.org/>
References: <bug-214859-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214859

--- Comment #3 from towo@siduction.org ---
Additional info, after installing the kernel from a working system, 1st boot
with that kernel is working flawless. Rebooting with that kernel and the bo=
ot
is hanging a long time, then the desktop starts but the system is not really
usuable. All the problems do not happen after reverting
714d9e4574d54596973ee3b0624ee4a16264d700.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
