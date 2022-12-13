Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F464BE0B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 21:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5908A10E353;
	Tue, 13 Dec 2022 20:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBDB10E353
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:42:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA9EC6153A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2643AC433F0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670964133;
 bh=XijBFGAokj3L2suC35AP7u91WFEutirS/nk+FxEKlIo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qAaNzk5GPv5MLzy9CL2AcloVPUMHov1fSfvRhyvHh4//ELH+Oq292F5o6hhLpkXyS
 b/aJogDd5VSStbZfAJcBK2GkMi2UNVFiqXCSua3LIvWJ1KZdF3HWPzZ/KdVzRO/q+S
 xEw2hHjUy1+5D+HOW7QO3ofixTpuNpNHSSF1U5P2CZbS8de64iNIzH2RGm8VHCIbB0
 0PMGMRrgRQyzyboFNJOfiu0+WIXid4UJs4Nx6LE4wUwLas1PANYf2JRX9CtA+zEAm1
 hgSO5hmAVeNVDTSOW5wZB6nq9VQcFa7qZHSqArhF48L74YjnQxTzo1gmLYDiE2BML1
 +C1oztfHRnEuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 04E9EC43144; Tue, 13 Dec 2022 20:42:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216806] [Raven Ridge] console disappears after framebuffer
 device loads
Date: Tue, 13 Dec 2022 20:42:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216806-2300-tVU3gWlJQM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216806-2300@https.bugzilla.kernel.org/>
References: <bug-216806-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216806

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
please make sure CONFIG_DRM_FBDEV_EMULATION is set in your kernel config.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
