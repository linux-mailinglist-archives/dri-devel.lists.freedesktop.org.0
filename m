Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65874CEB8F
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 13:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB9610F212;
	Sun,  6 Mar 2022 12:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FEC10F3CB
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 12:35:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECE9560E87
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 12:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE201C340FE
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 12:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646570098;
 bh=Sf9KYUVQmZ2pm0PTxgHB1md1ke4LXEWqm6qpkrMdpxg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=emTI9Eo9jNgCl0iMgeUxo9z3SnG4EePkvyehFujxfqCUaZVeKhDah9otm1Efl4jwP
 hiEZ52PllT0oF2H18nVY2rFQEcC/WGvtsg1oU3K4NPxXXCtXZHXYH4PV4bI4i5a6CB
 DTVlwzZhg1Mx57xOh0Z/OPGo2J10wkcg4vh0CW8Re1BrDmRtOHFu+eMSeBQLnH182T
 q2pkyHrRFzWxXgyqqfWESenbmGT1xJqEGk/9YylBUMhMql7eESL4FOv+z2sLM0IySL
 rh/SicpE95TSmIFmVThmn/zBc96iBZ4Heyg9dN1yseuB435udEJUVPlNvnHLhJCsUN
 Ua9NJFeFcDRGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9DBD6C05FF5; Sun,  6 Mar 2022 12:34:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 06 Mar 2022 12:34:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zccrs@live.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-sStF6A1zUU@https.bugzilla.kernel.org/>
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

zccrs (zccrs@live.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |zccrs@live.com

--- Comment #32 from zccrs (zccrs@live.com) ---
Also seeing it on Archlinux x86_64:

Kernel: 5.17.0-rc6-next-20220304-1-next-git
Mesa: 21.3.7-2

Hardware:=20
GPU: VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Ceza=
nne
(rev c9)
CPU: AMD 5600G

Running the gnome 41 with wayland

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
