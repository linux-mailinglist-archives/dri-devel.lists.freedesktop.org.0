Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA6787FF5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F8B10E608;
	Fri, 25 Aug 2023 06:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A06710E608
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:33:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFD9764DA3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6379AC433CC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692945195;
 bh=OWP7L+o6Rn3Ocavi1Knj4PpGtVn9d4NbZLnF0h0K51I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hVtWbLaw+Zamnu6V5VOAShbUW5WLQ/ldlsikvtgYXCzTxRbF6n+8H3agUrVYvkaKY
 c5qyxVal5pHOMOjPDfYGM9dXyFT/K3UkZElqzVFq8hcC4bxLtfFX3Ng5ls/MmYEcs1
 wkjRuEiyFQZmzWCpkmpDBRC4Kzq3CQ0y6rMmADT04gWQ/KdMn8AE812V3VVb+CXoK2
 WpqMO7rn0/5Y9THFSvGpMHDCpDLXs1UKMNNpBUe1mv9jCfxOS/klfyyus59Na5ODaU
 3PhdvRxIdbJmKNFgNAAkdybQsrsK7Isqxw/zdEfr+6NSQoI2d86Av3QMASAexgjDa4
 a0RP9anU02E6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4FEE0C53BC6; Fri, 25 Aug 2023 06:33:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 25 Aug 2023 06:33:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-JSh3PlTNTg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #34 from popus_czy_to_ty (penteljapan@o2.pl) ---
banned nouveau by nvidia guide -->
https://docs.nvidia.com/ai-enterprise/deployment-guide-vmware/0.1.0/nouveau=
.html

lsd@Crawler-E25:~$ lspci -k | grep -EA3 'VGA|3D|Display'
01:00.0 VGA compatible controller: NVIDIA Corporation GA107M [GeForce RTX 3=
050
Mobile] (rev a1)
        Subsystem: CLEVO/KAPOK Computer GA107M [GeForce RTX 3050 Mobile]
        Kernel modules: nvidiafb, nouveau
01:00.1 Audio device: NVIDIA Corporation Device 2291 (rev a1)
--
05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c6)
        Subsystem: CLEVO/KAPOK Computer Cezanne [Radeon Vega Series / Radeon
Vega Mobile Series]
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

----
/var/lib/systemd/pstore  is empty,

doesnt return back from suspend on your script (im trying to do it manually=
 but
doesnt do anything as before)

a) before baning nouveau
b) after

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
