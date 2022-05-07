Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B491D51E487
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 07:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D904112709;
	Sat,  7 May 2022 05:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BACD112709
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 05:54:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 006B8B82A25
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 05:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4423C385B9
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651902872;
 bh=l15Dw8QpWDjQQCikidz9wMgJ2m4hHUD5eRDL7VLqVaI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VwYQJ4cSaPPPbb3oGAmbU44k8ANxcNhuituK8RWa3mrQaJuTeUh2+rdaTHrLdUMAn
 8wXj01d5NVd5ieLfCB8ObhBIbwKfYJI4AGDhtveiHlBr4rkr40+Q+EksAjwATAbN19
 2qkFWLsAkqFhY5afz41HLjttQgW14I7zKR2aIen5pqiAeQyCeJcTLtnKPjJuE94TtN
 dwGCVHNaV75PZHdcvRH+KujIDxANLpwNPBPVxXqdGeMfw82Bx7A+VyRfgv8tIfGELO
 f07OlqWak2EMxfKFuCceNNRJX5xRmyVkOw79OM0uCX4UCLpMI8qvjRm1Swx+FT1bnZ
 cJn65FEn+IeXA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A263DCC13AF; Sat,  7 May 2022 05:54:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sat, 07 May 2022 05:54:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-DSg86trvlW@https.bugzilla.kernel.org/>
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

MasterCATZ (mastercatz@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mastercatz@hotmail.com

--- Comment #37 from MasterCATZ (mastercatz@hotmail.com) ---
Now my R9 290 keeps doing this with the latest drivers on Ubuntu 22.04

Every time I try watching anime through kodi

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
