Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888527CF7EF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 14:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E6E10E4CE;
	Thu, 19 Oct 2023 12:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD1410E4CE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 12:03:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DE321B8289E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 12:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41132C433C9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697716978;
 bh=d6R30AxXpQPN649dsohILjOxdHJqKTQLsABg2j0oaMo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A1HQM7TsdkB6dwlOVNKCKIqYLI97QQwELp0g7ElcAHG9zrfFZaSt+XTtuOb34EsrC
 UZ2hn6fOkcOA1oRyNdjmXQtcGD9jc05dacD6emlKBLuBqJMK2zHmGlAvuhiltVh4XX
 Fag+W+V4HSt0nDuTyKUsKpC7kRu6FPPqr3KeBiv9PWbT1A/OMvS0h3V/xakSa3y71w
 pPvWMjhe/hC327PnmeTNHiEC8SeD4tnLDgRanPWyKYmJE88OeYLTZa/0rTd953YEc6
 MXcY4s7MzI0SGfpgo+CCJ0X7uPkeUpDCZeUrKOpfYNrE45+e37qHUj8lbTAsNiRM3g
 x2CdglJ0SUhyA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 28DE6C53BD0; Thu, 19 Oct 2023 12:02:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215631] Some Desktop oriented mode setting drivers are missing
 DRM PRIME support
Date: Thu, 19 Oct 2023 12:02:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bluescreen_avenger@verizon.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215631-2300-w2gAxgcuIA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215631-2300@https.bugzilla.kernel.org/>
References: <bug-215631-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215631

bluescreen_avenger@verizon.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #2 from bluescreen_avenger@verizon.net ---
I think=20
6b85aa68d9d5a27556b8b1015e7e515a371e77de
71e801b9b44f86ce8c816b06960c705f901c50e5
71a7974ac7019afeec105a54447ae1dc7216cbb3=20
resolve this

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
