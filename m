Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B953B6AF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDB1112D2E;
	Thu,  2 Jun 2022 10:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9428C112D2E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:12:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 216BFB81E95
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44E30C341CC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654164739;
 bh=tc47/iKmOH2Wh/46ylaSskz/ZctLd3TKdNerFYcpTFs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gFhGwN9tzDkYEqOrdDkj2JI34fQi4PzbtLdPl4tqu43k7iP5MvEocoioP4xYPFCUY
 EPK1xllor085JE+ZfxYEs1q+jciGjseyX4P57heI5XlY19DQI++Qbm4Yb8IRWCFtH8
 v81SSgLC23Kw12u063QVLBOKZ2MfyKbFwoub7GeIxm7qt+K7M4d9WiPmmdScOaWZU7
 kgLAIsxHQiIPW3d3L2522q3xDZSZxoqsnydi2e9R1iJmzF7wlTgEGAzKagk8mkRebT
 ZwtWC21aummyFisYtjx1WrOsXM3+Enn32oNAYAy883y/LuN4ralk/PQ7aOgp+iQ2g8
 8WQB66bVzTe/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 35DDDCC13B5; Thu,  2 Jun 2022 10:12:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Thu, 02 Jun 2022 10:12:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: birbwatcher@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-hRm6SF3i4l@https.bugzilla.kernel.org/>
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

--- Comment #47 from Ryzen Buntu (birbwatcher@protonmail.com) ---
I updated mesa using the kisak-mesa PPA, didn't notice any changes. But aft=
er
disabling AMP/DOCP (using my 3600 ram at 3600mhz), and the auto setting on =
my
BIOS set it to 2133mhz, I can play skylines without any issue at all.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
