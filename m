Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD037B395
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 03:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC36E1D3;
	Wed, 12 May 2021 01:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98A86E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 01:35:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 966CC61928
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620783312;
 bh=Lib14/aKcJeITVFfedYsLoKpISRCJCqk/pu+/jBISnk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pRgddJEQmLR3iFRdsb9x8axKinIWWlKKHrjKnPtHWmmLa+UtCYKUVe5WPWDbB0y+t
 reJUNpP30n+QxfOXOVnFnGkIKmHw8OfALfZQrvo5jWwBlQm/NUwBiEWy6zkfh3K2Lp
 x7JdX6YRGUnnJIDyWCZtzTpjQf9YtXY1m4t2GEs1YOIVpGJdBnvHD/Tmkq7DRqCfkY
 IyDxILRL2Px2Cpeu7bmrFLX/sAMGJnjnF+UtZHaVlNbwTwtnxBcNGdsFl6MZ/mS8km
 +S5XrQs1mRLO04/bqwkl05rSHElVPjNj0x0/bIFRbE2nWtfdpUzAh6PS48rRL919ro
 sdoojTVuvGBNQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 89F0C61264; Wed, 12 May 2021 01:35:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212957] [radeon] kernel NULL pointer dereference during system
 boot
Date: Wed, 12 May 2021 01:35:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@dennisfoster.us
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212957-2300-qBOJHEN5y7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212957-2300@https.bugzilla.kernel.org/>
References: <bug-212957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212957

--- Comment #4 from Dennis Foster (mail@dennisfoster.us) ---
Created attachment 296723
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296723&action=3Dedit
journalctl - bad commit

Attached is a part of the system log after checking out the bisected commit.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
