Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4AE8323CC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 04:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CED10E939;
	Fri, 19 Jan 2024 03:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EF110E939
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 03:33:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 70652614CC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 03:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F3FCC433C7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 03:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705635174;
 bh=+PtVCKtuWLBi3B8MajZWE5Mn5ksNLQpucx5i/YDjtcg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qJVvgv8cvVU0BnUGYLDPP+UDg054+yp1qvr8e6+HscOaKBIW54F3RIpU43Hpnts2C
 52T1xc1+HYSBgAIZZEDklPkF/v6y/BsAL02unxe2ItXrTKsdz7OqGQcpiSJ2/WIjSQ
 T+JqK15FFgBQN8Z+L4QwM444jMLJLu1A2Obf64ckBq7WfO/+gfjRdUh/4/mIf81DuI
 dh1yLDZsWbSdZdlk/p3lgI2okHlGMiWlLNY0ISQjKaP1Ywex5Zc6hyWkN6N5525OkH
 yPGXPKiDJCTLPYYfWGzaL13+7iFMV9dhb4OlsyyHqe8ph2pAtndfySo9ZHazfqgGaW
 lBQtxBTLtwy5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0FA0DC53BD0; Fri, 19 Jan 2024 03:32:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 198551] amdgpu error on shutdown or gpu intense game
Date: Fri, 19 Jan 2024 03:32:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: troy28217@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-198551-2300-In71fIfQRl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-198551-2300@https.bugzilla.kernel.org/>
References: <bug-198551-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D198551

CassiRunnells (troy28217@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |troy28217@outlook.com

--- Comment #6 from CassiRunnells (troy28217@outlook.com) ---
Ensure that you are using the latest version of the AMDGPU driver. Visit the
official AMD website and download the latest driver for your GPU.Check if t=
here
are any available updates for your Linux kernel. A newer kernel might inclu=
de
improvements and fixes for GPU-related issues.(https://ricepuritytest2024.c=
om/)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
