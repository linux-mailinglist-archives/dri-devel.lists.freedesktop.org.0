Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8E4557863
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C95B10ED2D;
	Thu, 23 Jun 2022 11:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B99710ED2D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:06:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18A3961EF2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88A17C341E5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655982357;
 bh=XtRFjoQz29BjnY4c1JpUS/6x09D+JQubV58LixqGvH0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Fyt2EknMv69EYb3EWs0fdrOyxcM2tLHA5sOC7dXbQ+dGDkh6N/6qdRiicRQqrTQrj
 /+/+O1b+qZZbdBvVlyzwJWvN0WDnTgLqAHLmfeV3xp+oBz5UAjop2VBrEA4XjnpdVh
 tOZn0vUKTm4xpALeNu3RldMLhI2MVSbicyMsHMBJdRbeMYibLBgt1LFwAlA9tie/If
 6q/UR7knkYcP/944zycWU84Pc5602iVL4WQV11sX6nT9fH5vetwRgJDHsGbNsdTFzO
 CJFIEO4jaOyHciCatUuJppap5l4ovCDf/EOB/P5tlob4Bty9wL1aMygJ2yiBs3sDXD
 6pruASHAV0DPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7A585CC13B5; Thu, 23 Jun 2022 11:05:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 23 Jun 2022 11:05:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: s48gs.w@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-fTn2kZuaiB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #77 from Danil (s48gs.w@gmail.com) ---
but even creating nvidia_icd.json
{
    "file_format_version" : "1.0.0",
    "ICD": {
        "library_path": "/usr/lib64/libGLX_nvidia.so.0",
        "api_version" : "1.3.211"
    }
}

does not help wine, Wine still crashing with same error on trying
use/initialize Nvidia
but I can use Nvidia outside of Wine from native apps (and Vulkan works), s=
o it
must be related to AMD gpu driver somehow (before it was not happening, I f=
irst
time seeing wine crashing this way(in previous times when I tested AMD GPU
integrated))

P.S. I have second PC with same AMD Vega 8 integrated GPU, and there it wor=
ks
fine(never crashed/freeze even once), other PC has other motherboard, this =
why
I originally think it problem with motherboard, but current "boot option" h=
elp
to make integrated GPU stable on this PC.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
