Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461569E201
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 15:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFD810E18A;
	Tue, 21 Feb 2023 14:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C497510E18A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 14:08:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C0A3B80EBF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 14:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46992C433D2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676988512;
 bh=6L0FhoM4p1Q8fAr459AR5OmNFDWguTWaQsCVDebcrqs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Z/4CXq5w1zbsmbPNHIP0EIP1hjbm2ZGQEvRQlkxq8eocUfeVrHB1Y0pCIUTxxdcUg
 1exrb4K8e9SUMokPRYUnatQ75+3Cn/RTKPfpVIsHHoOn4wiAx/Chiz/SEhMVHLAOvP
 TsQqlbGzadcl+Cx+5e/9GTUL6S4D/jLI/7g9J5TVRrIE+2Hbiqf7OzFc+A9xfMLPl1
 gS/OKMV+vc97g3tYUsY0PskHu2mtq+ZTgslXGPfDulYbRTtRoWNcQuwLRgWpYZeg5r
 k/9FavEVWIkIy/sAw2yRD83z/ZgZAap3cPqcRQEtZrf76/2xrZAXUXhnTx/DqC2rGJ
 3ABLa6gInqGmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 02BB3C43144; Tue, 21 Feb 2023 14:08:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217065] Linux 6.2.0 - AMDGPU cannot start, ends in a blank
 screen.
Date: Tue, 21 Feb 2023 14:08:30 +0000
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
Message-ID: <bug-217065-2300-XOIrfMnwVH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217065-2300@https.bugzilla.kernel.org/>
References: <bug-217065-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217065

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
