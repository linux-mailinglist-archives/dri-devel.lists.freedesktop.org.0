Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AC458F256
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 20:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97168F2DF;
	Wed, 10 Aug 2022 18:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6758B7ED
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 18:28:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15A4C61459
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 18:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75051C43140
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 18:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660156117;
 bh=VZXtYeybhW5tdnrEGgCVqhqfLneEuLRvGIY1xk7AsL4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nqoSNFprkSBO5d9Q8ddcjX1E7pysRLtB8zvUmJHu3Hyf2M0F6rq01/tiFJMG1NACc
 wtpBH/sF8hBFlzx3EnJHmvTSBd4iOZpDD/AAqdiR3hA36dRlPRvoj3YjVSOeoP2DYB
 M90ak+afWMHMiWE1Zp12AJd36F71/KMaMHtP9c5vVcf/BvtFldMYdwzO7pRPdyKEbY
 GGLu5Dv2TfGx7YmhxrEnjgvF9a6zobBrH9YV2dnrr+/ex0iq2h/BXl0ETug2YER6fJ
 Cg6wXsYzH0qPxQagvzDsJZ3emSAvXyrGV2S9D3dVVITBqa1ysRBQRCd78fPRq7x6zv
 QlV7SmEu8yJ5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 64DDEC0422F; Wed, 10 Aug 2022 18:28:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215618] vblank related lockup during start of SteamVR using
 Valve Index HMD
Date: Wed, 10 Aug 2022 18:28:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: farmboy0@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215618-2300-89t6gJT9TI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215618-2300@https.bugzilla.kernel.org/>
References: <bug-215618-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215618

--- Comment #4 from farmboy0@googlemail.com ---
The issue still happens with 5.18.9.

The issue has also been reported to mesa and someone bisected it to the
following commit:

https://gitlab.freedesktop.org/drm/amd/-/issues/1980#note_1400657

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
