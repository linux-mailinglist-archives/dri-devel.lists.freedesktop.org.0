Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61237446B8
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 07:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE98610E52B;
	Sat,  1 Jul 2023 05:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735E210E52B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:10:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7922A61058
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBF79C433B7
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688188203;
 bh=eSd23DQbSL2m7hh5s/HmJYaUaVeJCrdYbhwucMWeX0U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gDoU2lH3VVuwTZYiwHPctRZq3RoGlW1ao/LgoQJawsS2UpmJA7MW2hl9KRxmD8gal
 My+uPChKdbiHklAUCk9nfXGLhQll2YAqoLo28NwN1kkHnMCTnJeWn/YXvr7M+zUHny
 tHLFUB/MjOLuUhD7U91dPDC1r33uLloijmIcqJLtNrg53h81I8pZbS57kdHRoIkD/b
 oR3h6PAP+HaAzBgmI3jVbqxBrS2THyTzJgrhSVeKyTdUU90PzAp+tSMhrQOPnL4gZn
 MZ9gU2bbo9GYeb3AdK5RZI1ohR5/Klcf0GAO1sO2JBw6suWrvxm0puewDC8olieMmZ
 ZJVuGTILCJwWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AC1AEC4332E; Sat,  1 Jul 2023 05:10:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sat, 01 Jul 2023 05:10:01 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-nWZbSmNgI4@https.bugzilla.kernel.org/>
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

--- Comment #54 from MasterCATZ (mastercatz@hotmail.com) ---
Still getting this using kodi playing back video files=20

VGA: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21 [Radeon RX 6800/6800 XT=
 /
6900 XT] (rev c1)
OpenGL driver: radeonsi
Kernel driver: amdgpu
name of display: :0
display: :0  screen: 0
direct rendering: Yes
Extended renderer info (GLX_MESA_query_renderer):
    Vendor: AMD (0x1002)
    Device: AMD Radeon RX 6800 XT (navi21, LLVM 15.0.7, DRM 3.52,
6.3.7-060307-generic) (0x73bf)
    Version: 22.2.5
    Accelerated: yes
    Video memory: 16384MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.6
    Max compat profile version: 4.6
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.2
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 15612 MB, largest block: 15612 MB
    VBO free aux. memory - total: 64314 MB, largest block: 64314 MB
    Texture free memory - total: 15612 MB, largest block: 15612 MB
    Texture free aux. memory - total: 64314 MB, largest block: 64314 MB
    Renderbuffer free memory - total: 15612 MB, largest block: 15612 MB
    Renderbuffer free aux. memory - total: 64314 MB, largest block: 64314 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 16384 MB
    Total available memory: 80745 MB
    Currently available dedicated video memory: 15612 MB
OpenGL vendor string: AMD
OpenGL renderer string: AMD Radeon RX 6800 XT (navi21, LLVM 15.0.7, DRM 3.5=
2,
6.3.7-060307-generic)
OpenGL core profile version string: 4.6 (Core Profile) Mesa
22.2.5-0ubuntu0.1~22.04.3
OpenGL core profile shading language version string: 4.60
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL version string: 4.6 (Compatibility Profile) Mesa
22.2.5-0ubuntu0.1~22.04.3
OpenGL shading language version string: 4.60
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 22.2.5-0ubuntu0.1~22.0=
4.3
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20


Linux aio 6.3.7-060307-generic #202306090936 SMP PREEMPT_DYNAMIC Fri Jun  9
09:47:18 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux


[ 2258.155741] audit: type=3D1326 audit(1688042651.943:6): auid=3D1000 uid=
=3D1000
gid=3D1000 ses=3D3 pid=3D90303 comm=3D"GLXVsyncThread"
exe=3D"/snap/firefox/1075/usr/lib/firefox/firefox" sig=3D0 arch=3Dc000003e
syscall=3D312 compat=3D0 ip=3D0x7f9931a4d89d code=3D0x50000
[ 2258.155748] audit: type=3D1326 audit(1688042651.943:7): auid=3D1000 uid=
=3D1000
gid=3D1000 ses=3D3 pid=3D90303 comm=3D"GLXVsyncThread"
exe=3D"/snap/firefox/1075/usr/lib/firefox/firefox" sig=3D0 arch=3Dc000003e
syscall=3D312 compat=3D0 ip=3D0x7f9931a4d89d code=3D0x50000
[ 2258.441783] audit: type=3D1326 audit(1688042652.231:8): auid=3D1000 uid=
=3D1000
gid=3D1000 ses=3D3 pid=3D90303 comm=3D"Renderer"
exe=3D"/snap/firefox/1075/usr/lib/firefox/firefox" sig=3D0 arch=3Dc000003e
syscall=3D312 compat=3D0 ip=3D0x7f9931a4d89d code=3D0x50000
[ 2258.441792] audit: type=3D1326 audit(1688042652.231:9): auid=3D1000 uid=
=3D1000
gid=3D1000 ses=3D3 pid=3D90303 comm=3D"Renderer"
exe=3D"/snap/firefox/1075/usr/lib/firefox/firefox" sig=3D0 arch=3Dc000003e
syscall=3D312 compat=3D0 ip=3D0x7f9931a4d89d code=3D0x50000
[ 2258.441796] audit: type=3D1326 audit(1688042652.231:10): auid=3D1000 uid=
=3D1000
gid=3D1000 ses=3D3 pid=3D90303 comm=3D"Renderer"
exe=3D"/snap/firefox/1075/usr/lib/firefox/firefox" sig=3D0 arch=3Dc000003e
syscall=3D312 compat=3D0 ip=3D0x7f9931a4d89d code=3D0x50000
[ 2530.160394] SGI XFS with ACLs, security attributes, realtime, quota, no
debug enabled
[ 2530.186991] JFS: nTxBlock =3D 8192, nTxLock =3D 65536
[ 2530.206696] ntfs: driver 2.1.32 [Flags: R/O MODULE].
[ 2530.236948] QNX4 filesystem 0.2.3 registered.
[28907.642523] audit: type=3D1326 audit(1688069301.590:11): auid=3D1000 uid=
=3D1000
gid=3D1000 ses=3D3 pid=3D27503 comm=3D"snap-store"
exe=3D"/snap/snap-store/558/usr/bin/snap-store" sig=3D0 arch=3Dc000003e sys=
call=3D93
compat=3D0 ip=3D0x7fa7293d74fb code=3D0x50000
[28945.318371] audit: type=3D1326 audit(1688069339.266:12): auid=3D1000 uid=
=3D1000
gid=3D1000 ses=3D3 pid=3D27503 comm=3D"pool-org.gnome."
exe=3D"/snap/snap-store/558/usr/bin/snap-store" sig=3D0 arch=3Dc000003e sys=
call=3D93
compat=3D0 ip=3D0x7fa7293d74fb code=3D0x50000
[40466.865037] audit: type=3D1326 audit(1688080860.862:13): auid=3D1000 uid=
=3D1000
gid=3D1000 ses=3D3 pid=3D134010 comm=3D49736F6C617465642057656220436F
exe=3D"/snap/firefox/1075/usr/lib/firefox/firefox" sig=3D0 arch=3Dc000003e
syscall=3D312 compat=3D0 ip=3D0x7f7b10b3689d code=3D0x50000
[54258.842221] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[54258.842227] Bluetooth: BNEP filters: protocol multicast
[54258.842232] Bluetooth: BNEP socket layer initialized
[55169.508273] mmap: matroskademux0: (1738806): VmData 874659840 exceed data
ulimit 851849621. Update limits or use boot option ignore_rlimit_data.
[55169.508555] matroskademux0:[1738807]: segfault at 0 ip 0000000000000000 =
sp
00007f92f07a3cc8 error 14 likely on CPU 14 (core 2, socket 0)
[55169.508567] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55169.645680] matroskademux0:[1738837]: segfault at 0 ip 0000000000000000 =
sp
00007f101f9a2cc8 error 14
[55169.645683] matroskademux0:[1738836]: segfault at 0 ip 0000000000000000 =
sp
00007f10221a3cc8 error 14
[55169.645693]  in totem-video-thumbnailer[564c838df000+3000]
[55169.645696]  in totem-video-thumbnailer[564c838df000+3000]
[55169.645697]  likely on CPU 5 (core 6, socket 0)
[55169.645701] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55169.645703]  likely on CPU 6 (core 8, socket 0)
[55169.645708] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55169.925048] matroskademux0:[1738905]: segfault at 0 ip 0000000000000000 =
sp
00007fbccf3ebcc8 error 14 likely on CPU 6 (core 8, socket 0)
[55169.925059] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55170.047631] matroskademux0:[1738950]: segfault at 0 ip 0000000000000000 =
sp
00007f17b9febcc8 error 14 likely on CPU 19 (core 9, socket 0)
[55170.047645] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55170.147537] matroskademux0:[1738982]: segfault at 0 ip 0000000000000000 =
sp
00007fccd13eacc8 error 14 likely on CPU 21 (core 12, socket 0)
[55170.147551] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55170.281633] matroskademux0:[1739009]: segfault at 0 ip 0000000000000000 =
sp
00007fafd4feccc8 error 14 likely on CPU 4 (core 5, socket 0)
[55170.281642] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55170.633444] matroskademux0:[1739106]: segfault at 0 ip 0000000000000000 =
sp
00007f09f3fa2cc8 error 14 likely on CPU 14 (core 2, socket 0)
[55170.633456] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55170.760525] matroskademux0:[1739140]: segfault at 0 ip 0000000000000000 =
sp
00007fe5895ebcc8 error 14 in totem-video-thumbnailer[561320d3f000+3000] lik=
ely
on CPU 11 (core 14, socket 0)
[55170.760546] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55170.760581] matroskademux0:[1739142]: segfault at 0 ip 0000000000000000 =
sp
00007fe57fffecc8 error 14 likely on CPU 5 (core 6, socket 0)
[55170.760590] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55174.644947] show_signal_msg: 21 callbacks suppressed
[55174.644951] matroskademux0:[1739923]: segfault at 0 ip 0000000000000000 =
sp
00007f8a33feecc8 error 14 likely on CPU 19 (core 9, socket 0)
[55174.644966] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55174.885102] matroskademux0:[1739975]: segfault at 0 ip 0000000000000000 =
sp
00007faa2bfa6cc8 error 14 likely on CPU 7 (core 9, socket 0)
[55174.885116] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55175.093384] matroskademux0:[1740021]: segfault at 0 ip 0000000000000000 =
sp
00007fe9277f0cc8 error 14 likely on CPU 0 (core 0, socket 0)
[55175.093398] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55175.093426] matroskademux0:[1740022]: segfault at 0 ip 0000000000000000 =
sp
00007fe924fefcc8 error 14 in totem-video-thumbnailer[55c11089d000+3000] lik=
ely
on CPU 6 (core 8, socket 0)
[55175.093446] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55175.314864] matroskademux0:[1740074]: segfault at 0 ip 0000000000000000 =
sp
00007f6c6d7edcc8 error 14 likely on CPU 2 (core 2, socket 0)
[55175.314877] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55175.445568] matroskademux0:[1740101]: segfault at 0 ip 0000000000000000 =
sp
00007f915bffecc8 error 14 likely on CPU 12 (core 0, socket 0)
[55175.445579] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55175.445605] matroskademux0:[1740100]: segfault at 0 ip 0000000000000000 =
sp
00007f9162fefcc8 error 14
[55175.445606] matroskademux0:[1740099]: segfault at 0 ip 0000000000000000 =
sp
00007f91657f0cc8 error 14
[55175.445617]  in totem-video-thumbnailer[555fd7493000+3000]
[55175.445618]  in totem-video-thumbnailer[555fd7493000+3000] likely on CPU=
 9
(core 12, socket 0)
[55175.445625]  likely on CPU 16 (core 5, socket 0)
[55175.445627] Code: Unable to access opcode bytes at 0xffffffffffffffd6.

[55175.445633] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55175.576858] matroskademux0:[1740126]: segfault at 0 ip 0000000000000000 =
sp
00007f41465edcc8 error 14 likely on CPU 17 (core 6, socket 0)
[55175.576870] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[55604.030347] TCP: request_sock_TCP: Possible SYN flooding on port
0.0.0.0:7070. Sending cookies.
[114192.908940] audit: type=3D1326 audit(1688154587.565:14): auid=3D1000 ui=
d=3D1000
gid=3D1000 ses=3D3 pid=3D27503 comm=3D"snap-store"
exe=3D"/snap/snap-store/558/usr/bin/snap-store" sig=3D0 arch=3Dc000003e sys=
call=3D93
compat=3D0 ip=3D0x7fa7293d74fb code=3D0x50000
[117828.295596] audit: type=3D1326 audit(1688158222.975:15): auid=3D1000 ui=
d=3D1000
gid=3D1000 ses=3D3 pid=3D27503 comm=3D"pool-org.gnome."
exe=3D"/snap/snap-store/558/usr/bin/snap-store" sig=3D0 arch=3Dc000003e sys=
call=3D93
compat=3D0 ip=3D0x7fa7293d74fb code=3D0x50000
[136191.148168] multiqueue0:src[88374]: segfault at 0 ip 0000000000000000 sp
00007fc220df4cc8 error 14 likely on CPU 22 (core 13, socket 0)
[136191.148181] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[144912.478945] [drm] Unknown EDID CEA parser results
[145002.197824] [drm] Unknown EDID CEA parser results
[145114.311963] [drm] Unknown EDID CEA parser results
[145213.143845] [drm] Unknown EDID CEA parser results
[146352.196288] [drm] failed to load ucode VCN0_RAM(0x3A)=20
[146352.196295] [drm] psp gfx command LOAD_IP_FW(0x6) failed and response
status is (0x0)
[146352.552878] [drm] failed to load ucode VCN1_RAM(0x3B)=20
[146352.552889] [drm] psp gfx command LOAD_IP_FW(0x6) failed and response
status is (0x0)
[146361.871307] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring vcn_dec_0
timeout, signaled seq=3D751233, emitted seq=3D751237
[146361.871702] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informat=
ion:
process kodi.bin pid 328998 thread kodi.bin:cs0 pid 329037
[146361.872063] amdgpu 0000:0e:00.0: amdgpu: GPU reset begin!
[146362.256266] [drm] Register(0) [mmUVD_POWER_STATUS] failed to reach value
0x00000001 !=3D 0x00000002
[146362.492618] [drm] Register(0) [mmUVD_RBC_RB_RPTR] failed to reach value
0x000000e0 !=3D 0x00000000
[146362.729209] [drm] Register(0) [mmUVD_POWER_STATUS] failed to reach value
0x00000001 !=3D 0x00000002
[146362.840344] amdgpu 0000:0e:00.0: amdgpu: MODE1 reset
[146362.840350] amdgpu 0000:0e:00.0: amdgpu: GPU mode1 reset
[146362.840433] amdgpu 0000:0e:00.0: amdgpu: GPU smu mode1 reset
[146363.371425] amdgpu 0000:0e:00.0: amdgpu: GPU reset succeeded, trying to
resume
[146363.371653] [drm] PCIE GART of 512M enabled (table at 0x000000800080000=
0).
[146363.371745] [drm] VRAM is lost due to GPU reset!
[146363.371747] [drm] PSP is resuming...
[146363.452785] [drm] reserve 0xa00000 from 0x83fd000000 for PSP TMR
[146363.577408] amdgpu 0000:0e:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[146363.577417] amdgpu 0000:0e:00.0: amdgpu: SMU is resuming...
[146363.577453] amdgpu 0000:0e:00.0: amdgpu: use vbios provided pptable
[146363.652147] amdgpu 0000:0e:00.0: amdgpu: SMU is resumed successfully!
[146363.653631] [drm] DMUB hardware initialized: version=3D0x0202000C
[146363.965593] [drm] kiq ring mec 2 pipe 1 q 0
[146363.971081] [drm] VCN decode and encode initialized successfully(under =
DPG
Mode).
[146363.971318] [drm] JPEG decode initialized successfully.
[146363.971336] amdgpu 0000:0e:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng=
 0
on hub 0
[146363.971338] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.0.0 uses VM inv en=
g 1
on hub 0
[146363.971339] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.1.0 uses VM inv en=
g 4
on hub 0
[146363.971340] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.2.0 uses VM inv en=
g 5
on hub 0
[146363.971341] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.3.0 uses VM inv en=
g 6
on hub 0
[146363.971342] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.0.1 uses VM inv en=
g 7
on hub 0
[146363.971343] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.1.1 uses VM inv en=
g 8
on hub 0
[146363.971344] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.2.1 uses VM inv en=
g 9
on hub 0
[146363.971345] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.3.1 uses VM inv en=
g 10
on hub 0
[146363.971346] amdgpu 0000:0e:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng=
 11
on hub 0
[146363.971347] amdgpu 0000:0e:00.0: amdgpu: ring sdma0 uses VM inv eng 12 =
on
hub 0
[146363.971348] amdgpu 0000:0e:00.0: amdgpu: ring sdma1 uses VM inv eng 13 =
on
hub 0
[146363.971349] amdgpu 0000:0e:00.0: amdgpu: ring sdma2 uses VM inv eng 14 =
on
hub 0
[146363.971350] amdgpu 0000:0e:00.0: amdgpu: ring sdma3 uses VM inv eng 15 =
on
hub 0
[146363.971351] amdgpu 0000:0e:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng=
 0
on hub 1
[146363.971351] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv e=
ng 1
on hub 1
[146363.971352] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv e=
ng 4
on hub 1
[146363.971353] amdgpu 0000:0e:00.0: amdgpu: ring vcn_dec_1 uses VM inv eng=
 5
on hub 1
[146363.971354] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc_1.0 uses VM inv e=
ng 6
on hub 1
[146363.971355] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc_1.1 uses VM inv e=
ng 7
on hub 1
[146363.971356] amdgpu 0000:0e:00.0: amdgpu: ring jpeg_dec uses VM inv eng =
8 on
hub 1
[146363.980193] amdgpu 0000:0e:00.0: amdgpu: recover vram bo from shadow st=
art
[146364.017226] amdgpu 0000:0e:00.0: amdgpu: recover vram bo from shadow do=
ne
[146364.017247] [drm] Skip scheduling IBs!
[146364.017251] [drm] Skip scheduling IBs!
[146364.017253] amdgpu 0000:0e:00.0: amdgpu: GPU reset(1) succeeded!
[146364.017257] [drm] Skip scheduling IBs!
[146364.017261] [drm] Skip scheduling IBs!

[146364.017392] [drm] Skip scheduling IBs!
[146364.017395] [drm] Skip scheduling IBs!
[146364.017896] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[146364.019052] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
