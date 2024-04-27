Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D828B4731
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 18:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDE610F6C2;
	Sat, 27 Apr 2024 16:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E5Tvuamv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3240810F6B3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 16:47:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8371761C4A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 16:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2855FC2BD11
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714236420;
 bh=6zReHPWhQ2ejd8eEOBD1jCcCGwV/FwDXam9qZA3f2mA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E5TvuamvS8CZ90nyiRi5Cq4J1FDh8ql96rWIDWsERiyMvMNem67HoN8wsmMj6W/nD
 tx1CMIH2nzpZIg0t3uRdGMMoHEoxLhd+hJpLs/zNOyFbDAsBka9ZX3BTjWOnw/FhjT
 GY+ZzrTL/sPDxCOptt34/FIyf3MbUos22/KG6nXVGyNNAiAkACOyMnOXh9f+4FLNff
 V6qfVAobejAhPU358+NG4YiAp1o3BOkYDukQaN9LTWyz8/erP3PGbayWIhdpg5zson
 XChiTuwd5m5mH/k58gbDBClh3sI5GlQfWkixHbSZ8G2ZUxAnLyknItf/vmVYTrBpHj
 qlmDoSCp05S+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 17636C43230; Sat, 27 Apr 2024 16:47:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218785] HP Victus by HP Laptop 16-e0xxx. HDMI connection
 doesn't detect counterpart projector.
Date: Sat, 27 Apr 2024 16:46:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icegood1980@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218785-2300-JIuE5ItnMg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218785-2300@https.bugzilla.kernel.org/>
References: <bug-218785-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218785

--- Comment #1 from Sergey Ivanov (icegood1980@gmail.com) ---
laptop has two videocards:

root@ice-home:/home/ice# lshw -C display
  *-display=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
       description: VGA compatible controller
       product: TU117M [GeForce GTX 1650 Mobile / Max-Q]
       vendor: NVIDIA Corporation
       physical id: 0
       bus info: pci@0000:01:00.0
       logical name: /dev/fb0
       version: a1
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress vga_controller cap_list fb
       configuration: depth=3D32 latency=3D0 mode=3D1920x1080 visual=3Dtrue=
color
xres=3D1920 yres=3D1080
       resources: iomemory:ff0-fef iomemory:ff0-fef memory:fb000000-fbffffff
memory:ffe0000000-ffefffffff memory:fff0000000-fff1ffffff ioport:f000(size=
=3D128)
memory:fc000000-fc07ffff
  *-display
       description: VGA compatible controller
       product: Cezanne [Radeon Vega Series / Radeon Vega Mobile Series]
       vendor: Advanced Micro Devices, Inc. [AMD/ATI]
       physical id: 0
       bus info: pci@0000:07:00.0
       logical name: /dev/fb0
       version: c6
       width: 64 bits
       clock: 33MHz
       capabilities: pm pciexpress msi msix vga_controller bus_master cap_l=
ist
fb
       configuration: depth=3D32 driver=3Damdgpu latency=3D0 resolution=3D1=
920,1080
       resources: irq:46 memory:d0000000-dfffffff memory:e0000000-e01fffff
ioport:c000(size=3D256) memory:fc500000-fc57ffff

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
