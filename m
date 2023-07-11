Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BE74F002
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ABC10E38B;
	Tue, 11 Jul 2023 13:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504A010E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:19:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5805614F6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 158AEC433CB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689081551;
 bh=3pmOdbU5DMD4snn/RqwtW4hv5cLx2XRKrCnqGJZVZZE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eXZjGqPaIK2pg8yHq7nU3cYDnkO/kprJguorEQ6DWMSAIYeAg4aSpa/Jn63n827X2
 Cp0pmqQSWFzJ0s5bTnW0QkpQVz62P2WBNmg/nUdtc8qxpx6eCWABf98gPC6hnqvMLe
 XJN/7zE1I14lZYQeq275mWNRSIV9HNpuc9L+vRw0GIvj4ocNZAbGUXh91I+NJnwSto
 S5sk60slo8Bm8Yu97Zak70DXh+VJocP4mLQ5qCAuW7Rk3vjIdFr3XUH81i2h+3cXOB
 gme1DZ79g0NtefyPq941VFr4cll6dDxPKZ1O/ZMmMEQVs07Au1ZG7AIpzjqV9V8r+E
 ng4k7iRIqG0Sw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 06960C53BD2; Tue, 11 Jul 2023 13:19:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Tue, 11 Jul 2023 13:19:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hermann-san@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-I8BRGecm6h@https.bugzilla.kernel.org/>
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

--- Comment #57 from hermann-san@gmx.de ---
I've tried a lot of things.   Changing Kernel, Upgrading to the next major =
OS
Version. replacing the graphics card and more. Nothing helped.=20=20
Unfortunately I did ignore a SATA error message in the system log because I=
 was
so focused on amdgpu.
So you may check your system log. it can give you a hint that it may have t=
o do
with the SATA conroller

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
