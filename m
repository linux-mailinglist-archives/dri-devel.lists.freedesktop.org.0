Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0745251F024
	for <lists+dri-devel@lfdr.de>; Sun,  8 May 2022 21:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C83310FDBB;
	Sun,  8 May 2022 19:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C3610E7E3
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 19:23:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BD436145F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 19:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA465C385BC
 for <dri-devel@lists.freedesktop.org>; Sun,  8 May 2022 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652037814;
 bh=ymKj8kmDnfNBVxSmLLMkUGPzAPuFzrhxbYxaVbHUhyY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UVntnZP7CkAV4zkzRxYV3OOoVWql1iawvcsJBYO/sEvlscVXIROR/tKLAFrdygWyT
 OY1kNJl0lmhu48xSgvQUL7cPl6Iff1dyr9KFlLVTbOTGOTs5qdNTnlz5boX/XrsBEi
 sGBlgqdfdfI3DxtHI6noWc1ruDHbTX3OHgR6/G8W9cKCPpcxNgLl/gJnexfqpg85eh
 kgGDuJbSLorMEVvLK/9RrzK6+Ht+bu+oSbot7VeIpWYX2Mghig1iXaSP/cZB/i+OP3
 X7WAMEOZFuvTJ+imdIHPLPWNH3Vk5bDVLElMDhIYZIGQPdBL4vPbkXOlgGWSkCNoub
 jw6iOZg/aZ94Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BAAC2C05FD0; Sun,  8 May 2022 19:23:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 08 May 2022 19:23:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m@nueljl.in
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-UFlBPnsu4J@https.bugzilla.kernel.org/>
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

Manuel Jes=C3=BAs de la Fuente (m@nueljl.in) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |m@nueljl.in

--- Comment #40 from Manuel Jes=C3=BAs de la Fuente (m@nueljl.in) ---
Can still reproduce using the following:

- Ryzen 9 5900XT
- Radeon RX 6700XT

- Linux 5.17.4-1-default (openSUSE Tumbleweed with KDE Plasma)
- Mesa 22.0.2-308.2

May 08 20:18:32 localhost.localdomain kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2371535, emitted
seq=3D2371537
May 08 20:18:32 localhost.localdomain kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process kwin_x11 pid 1795 thread
kwin_x11:cs0 pid 1801
May 08 20:18:32 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
GPU
reset begin!
May 08 20:18:33 localhost.localdomain kernel: amdgpu 0000:2d:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
May 08 20:18:33 localhost.localdomain kernel: [drm:gfx_v10_0_hw_fini [amdgp=
u]]
*ERROR* KGQ disable failed
May 08 20:18:33 localhost.localdomain kernel: amdgpu 0000:2d:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
May 08 20:18:33 localhost.localdomain kernel: [drm:gfx_v10_0_hw_fini [amdgp=
u]]
*ERROR* KCQ disable failed
May 08 20:18:33 localhost.localdomain kernel: [drm:gfx_v10_0_hw_fini [amdgp=
u]]
*ERROR* failed to halt cp gfx
May 08 20:18:33 localhost.localdomain kernel: [drm] free PSP TMR buffer
May 08 20:18:33 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu:
MODE1 reset
May 08 20:18:33 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
GPU
mode1 reset
May 08 20:18:33 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
GPU
smu mode1 reset
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
GPU
reset succeeded, trying to resume
May 08 20:18:34 localhost.localdomain kernel: [drm] PCIE GART of 512M enabl=
ed
(table at 0x0000008000300000).
May 08 20:18:34 localhost.localdomain kernel: [drm] VRAM is lost due to GPU
reset!
May 08 20:18:34 localhost.localdomain kernel: [drm] PSP is resuming...
May 08 20:18:34 localhost.localdomain kernel: [drm] reserve 0xa00000 from
0x82fe000000 for PSP TMR
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
RAS:
optional ras ta ucode is not available
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu:
SECUREDISPLAY: securedisplay ta ucode is not available
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
SMU
is resuming...
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
smu
driver if version =3D 0x0000000e, smu fw if version =3D 0x00000012, smu fw =
version
=3D 0x00413500 (65.53.0)
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
SMU
driver if version not matched
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
SMU
is resumed successfully!
May 08 20:18:34 localhost.localdomain kernel: [drm] DMUB hardware initializ=
ed:
version=3D0x0202000C
May 08 20:18:34 localhost.localdomain kernel: [drm] kiq ring mec 2 pipe 1 q=
 0
May 08 20:18:34 localhost.localdomain kernel: [drm] VCN decode and encode
initialized successfully(under DPG Mode).
May 08 20:18:34 localhost.localdomain kernel: [drm] JPEG decode initialized
successfully.
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
gfx_0.0.0 uses VM inv eng 0 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
comp_1.0.0 uses VM inv eng 1 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
comp_1.1.0 uses VM inv eng 4 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
comp_1.2.0 uses VM inv eng 5 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
comp_1.3.0 uses VM inv eng 6 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
comp_1.0.1 uses VM inv eng 7 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
comp_1.1.1 uses VM inv eng 8 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
comp_1.2.1 uses VM inv eng 9 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
comp_1.3.1 uses VM inv eng 10 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
kiq_2.1.0 uses VM inv eng 11 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
sdma0 uses VM inv eng 12 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
sdma1 uses VM inv eng 13 on hub 0
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
vcn_dec_0 uses VM inv eng 0 on hub 1
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
vcn_enc_0.0 uses VM inv eng 1 on hub 1
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
vcn_enc_0.1 uses VM inv eng 4 on hub 1
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
ring
jpeg_dec uses VM inv eng 5 on hub 1
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu:
recover vram bo from shadow start
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu:
recover vram bo from shadow done
May 08 20:18:34 localhost.localdomain kernel: [drm] Skip scheduling IBs!
May 08 20:18:34 localhost.localdomain kernel: [drm] Skip scheduling IBs!
May 08 20:18:34 localhost.localdomain kernel: amdgpu 0000:2d:00.0: amdgpu: =
GPU
reset(2) succeeded!
May 08 20:18:34 localhost.localdomain kernel: [drm] Skip scheduling IBs!

[ ... the previous line, but loads of times ]

May 08 20:18:34 localhost.localdomain kernel: [drm] Skip scheduling IBs!
May 08 20:18:34 localhost.localdomain kernel: amdgpu_cs_ioctl: 46 callbacks
suppressed
May 08 20:18:34 localhost.localdomain kernel: [drm:amdgpu_cs_ioctl [amdgpu]]
*ERROR* Failed to initialize parser -125!

[ ... the previous line, but loads of times. These are the '-125!' ones ]

May 08 20:18:44 localhost.localdomain kernel: [drm:amdgpu_cs_ioctl [amdgpu]]
*ERROR* Failed to initialize parser -125!
May 08 20:18:44 localhost.localdomain xembedsniproxy[1862]: Container window
visible, stack below
May 08 20:18:44 localhost.localdomain kernel: [drm:amdgpu_cs_ioctl [amdgpu]]
*ERROR* Failed to initialize parser -125!


One interesting detail/partial workaround is that underclocking the RAM spe=
ed
helps reduce it. Setting it to 2400 especifically (native speed of the 32GB=
 of
ram is 3600) makes it happen much less often (still does happen though).

Another thing is that it might be somehow related to the GPU's built in aud=
io
conflicting with intel's snd_hda_intel, which is part of a few other's logs
(sometimes appearing for me too). Audio is also choppy until a Pulse restart
with pulseaudio -k, which might be the cause for this first freeze with RAM=
 at
2400. This may be unrelated though, and is just conjecture from my part.

Happy to help debug the issue if anyone can guide me through the process a =
bit.
Will also take a look at reporting this to the Mesa side too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
