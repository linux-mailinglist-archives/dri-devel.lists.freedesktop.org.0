Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A4F41E372
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 23:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3B56EC92;
	Thu, 30 Sep 2021 21:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917516EC92
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 21:38:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 652FF619F7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 21:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633037890;
 bh=bjuPaDMdfz71v+KAOEu+rzjr6dBVXbxDg/R8qLnzDjA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jhVTMbE9mGC71/1EK0sc1mJXCIUBITvvcb1mVwnSa9qiwMZ01o7vj2swZCQt5nH/9
 ce1JrxfFtQ1phHGvAr8SkIUCGJK5LvNMGxWboGbKX3Q57tY0eDbTn/BGN4fCWLfEn3
 Tund/5FoDx0X++bGPo4r4NmMMyn4+2f8ZOEVDUZifFj+Y2ak2iLXlR0G36cTEZzdWZ
 +S+YiGh1uRqcXTLwxNw+gcFaVwQrzRwS+EJJ0MM8cxIbCvMIHGDrUcUWn5zeg1WrDd
 3TOW2TQIKt8MTEDiAaXWUFXAuC+25JzhPRHpNE2pT0iCOkinxhG56yqr/OGGaj2fHC
 cZ/dq9ste4x2A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6244660C4C; Thu, 30 Sep 2021 21:38:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214587] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout, signaled seq=5900910, emitted seq=5900912
Date: Thu, 30 Sep 2021 21:38:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214587-2300-vCl1wlYlh8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214587-2300@https.bugzilla.kernel.org/>
References: <bug-214587-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214587

--- Comment #1 from Lahfa Samy (samy@lahfa.xyz) ---
The computer did unfreeze then after the reset of the GPU but it seems hash=
cat
cannot use the GPU anymore for some reason, I'm not too sure why, but I thi=
nk I
need to reboot my machine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
