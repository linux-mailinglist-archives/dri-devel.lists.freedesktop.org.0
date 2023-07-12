Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4384575040D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 12:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA9710E4C5;
	Wed, 12 Jul 2023 10:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29C910E4BB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 10:03:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6938F60C82
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 10:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEB70C433C7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 10:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689156185;
 bh=JugQmd0Rpz0unRUOTvD9PHbPd1smL6lofk5jlDiGCNU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tyJ61HMkgHHwgqp9sT8xpoT5mgMnFkjoyWLdIqT0OUw6TeS5NIpmF55VFb/bc07vZ
 dSalWP/yyUMm8B1z4jvPQz4aAS6gMAxZPORRZU08DZTxwxQ6Tja1tiEZAxOnjwIUeD
 78jqe2X7wOMCLx9pSgxndCoMcAtqyfSiZfqZlCAHM9gPcrY0PxMY1/aTHeEc/ng8ob
 +8DIhue4/MNbR4+qQsGnVNdUd1TNF91tP6hntAOYNg8zgDyey+WYuHa4B3bemPaKzQ
 cuemRpQVg8k77tjRZO0HiqgOZo+VTNbRvOaOGxs3QIvOEfmR8K0kyljxTsuoaUGdOK
 ljqVsEdujljgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B5C21C53BCD; Wed, 12 Jul 2023 10:03:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 12 Jul 2023 10:03:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-RWkX2tU9kB@https.bugzilla.kernel.org/>
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

--- Comment #1 from popus_czy_to_ty (penteljapan@o2.pl) ---
second card. somehow didnt add it, cant edit.

01:00.0 VGA compatible controller: NVIDIA Corporation GA107M [GeForce RTX 3=
050
Mobile] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: CLEVO/KAPOK Computer GA107M [GeForce RTX 3050 Mobile]
        Physical Slot: 0
        Flags: bus master, fast devsel, latency 0, IRQ 80, IOMMU group 9
        Memory at d0000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at fb00000000 (64-bit, prefetchable) [size=3D4G]
        Memory at fc00000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at 3000 [size=3D128]
        Expansion ROM at d1080000 [virtual] [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=3D14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] Secondary PCI Express
        Capabilities: [bb0] Physical Resizable BAR
        Capabilities: [c1c] Physical Layer 16.0 GT/s <?>
        Capabilities: [d00] Lane Margining at the Receiver <?>
        Capabilities: [e00] Data Link Feature <?>
        Kernel driver in use: nvidia
        Kernel modules: nvidiafb, nouveau, nvidia_drm, nvidia

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
