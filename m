Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB79E5E83
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 19:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C903610E2D9;
	Thu,  5 Dec 2024 18:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CH6XT8fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CF410E2D9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 18:54:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 53D82A43E99
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 18:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04331C4CEDE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733424875;
 bh=aWGnxq7C32mrDQFU4lKNswTyODwEND8pIJhcMWZZlwU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CH6XT8fyWbyk9JHP/PaprYvWdeCqr2u5Fc+DsfM8WY5ecye8PBvSER8NuIqvOnEiO
 YcTtY21kRDgrJ66Sle1Ml3+9JsLha9f8FsUEYiPnVQLll+hvnUzPDcLVQHpovrzBag
 ee2IVoTEIuFk8jANHz7U41XnkvzVuTXDLoXEMTo/mPCbd0TuiJB44IWcjs4hbxH6zs
 6pu7KdS072coZahEOSZe3quaVhzLjCij6fuifdtiV+PdIjl/UwtAVtMGZyfShu/vut
 LwLBEHweDx3FpnxhjcUW+3FU67h6H+if30vZYXhOFF2PZPTaTpukMAyUHfB+azaGWI
 jTdBsoIUyCnRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E88EBC41612; Thu,  5 Dec 2024 18:54:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219563] amdgpu graphical glitches on Thinkpad E14 G6 with panel
 self-refresh enabled
Date: Thu, 05 Dec 2024 18:54:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219563-2300-6liNczdEPm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219563-2300@https.bugzilla.kernel.org/>
References: <bug-219563-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219563

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please refile here: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
