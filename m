Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8563290D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 17:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBEE10E12F;
	Mon, 21 Nov 2022 16:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F39E10E30A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 16:11:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F02C612F3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 16:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71144C433B5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669047083;
 bh=WFqeKHLSxm/ALp7MBh0eTuekahPCpEGZvcn+HR+qHtA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jOaMZGXjmntIATm+mDtZ5aoCH6EROLMDYKCkZriteDWC1J48Ui5axu2D9s9AHq/aA
 XgA7L0WkhZrFYls8bzcqw3JDlY/mcrsHMD0G1W5WUDSzTkdTEemIdroCWABx+MOn33
 T5Fa8734pCz4wJ968ul+gyTAzBO1IW4Ew2t0XdoSwuQu/eM4Zk/CZsozQlnkTxbs97
 vUk+/KWVVt4GO3+9UacCAAAVrZLO+Qe3vxd3bEQM+D0XUgK6wrfPEfkgQsvR2LIAJD
 lHFoKqXgdJ4TDWzmy+Uzsj/0LwcGzSMAfbpYZ04Pl8YtANrVF52BnbUKUVKg3F1UeN
 isXidKctIfzBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 56456C433E9; Mon, 21 Nov 2022 16:11:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216716] [drm:psp_resume [amdgpu]] *ERROR* PSP resume failed on
 r9 7950x igpu
Date: Mon, 21 Nov 2022 16:11:23 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216716-2300-8cwEs9ArZ2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216716-2300@https.bugzilla.kernel.org/>
References: <bug-216716-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216716

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please follow the guidelines and file a report here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
