Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4696E754424
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 23:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF9410E056;
	Fri, 14 Jul 2023 21:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA7D10E056
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 21:12:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A139F61D9C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 21:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD926C433CC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 21:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689369172;
 bh=tobyotgSMzXvKJBPvrQV8Bl1WAPuRa4EkIwYsoWJAgA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BMtcgwZeLdtAtP6LH0igsEGMcUmxeL7deN0MAM3ddExTIXJfw4VCbSkOgLIYRYVZb
 ptyYqgcaHKFXKKdbGpke188O+4NxQjsBDVVmQ/GIpDBHHO/mUJ/P84TIDNLTIUqSfV
 Q2Yo2ggVqCWBWDNGQeDGPlBgFcr9mrRr0NmX0pk/bFQes/rWNwcX+3U4+LGlMyeGU0
 emiJtKPc1G8aA8H0FNIEpkSB9GIRmuGmguoudy3jfgGKM8E5OWGn7VQ9PrSpeYvpvD
 gCqrf1hOuTGfjaBhFhN1sne+6GOuOy8urkUIaZ8aAE8Ypx9uSKEIj3AEPzrgMz5uiO
 CRCA2qQ7C9Tpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9DD72C53BD0; Fri, 14 Jul 2023 21:12:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 199979] amdgpu: changing pwm1_enable from 1 to 2 does not
 resume automatic fan control
Date: Fri, 14 Jul 2023 21:12:52 +0000
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
Message-ID: <bug-199979-2300-7xuHHrMkmf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199979-2300@https.bugzilla.kernel.org/>
References: <bug-199979-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D199979

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here if that's still an issue in 6.4.3.

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
