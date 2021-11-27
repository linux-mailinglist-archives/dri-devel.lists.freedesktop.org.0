Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB8445FC3F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 04:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D017D6EC9F;
	Sat, 27 Nov 2021 03:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 588 seconds by postgrey-1.36 at gabe;
 Sat, 27 Nov 2021 03:01:38 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CF56EC9F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 03:01:38 +0000 (UTC)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 14751B829EF
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 02:51:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4532B603CE
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637981505;
 bh=pjt79LKsKXEHFXx1Qh6askejZ9EFSWmcZkefI/dcBHo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ETWFye6GXY408i+UbGDSW1E+K1zPWDR3p9Qx9TCqK8Tp7RO8Om4Z8KxF+/T/7pVHd
 Sik2ueArzu0s1lPkB5u/wL9+e1rFu2YQP5ND9VFcd0Sl9q2VCGXXmB79VI9IGKb1Ji
 FcCNDc1Y4iA5frVmpkPtRs0jdDkT3WRW+3mDWGAka36N4l2qVh2ICSA7zC5dcfh4Q2
 Dh2Z4dmd/mOWJHDzFKTnkUKbBjR5U8i0pi9M6ECZytk4ISz1I/KKXkKGzi6qJ0EphE
 wa4dVy5CqbkZyfJ41kBfiW4RtB3FN6cN8Fx+KOXbaXPTj/9L99ioBmcBmxo5KHeopA
 ZrKZAMzNXZiyA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4262E60F4D; Sat, 27 Nov 2021 02:51:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sat, 27 Nov 2021 02:51:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jjc@jclark.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-1L9n7MW14n@https.bugzilla.kernel.org/>
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

James Clark (jjc@jclark.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jjc@jclark.com

--- Comment #28 from James Clark (jjc@jclark.com) ---
I am seeing this on Ubuntu 21.10:


Kernel: 5.13.0
Mesa: 21.2.2

Hardware:
CPU: 3950X
GPU: RX 6600

This is regular desktop use: Chrome 96 with Wayland enabled
(--ozone-platform=3Dwayland --enable-features=3DVaapiVideoDecoder
--enable-gpu-rasterization -enable-drd --enable-zero-copy
--enable-canvas-oop-rasterization)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
