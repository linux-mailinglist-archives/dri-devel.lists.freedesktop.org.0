Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE6BD3C3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 22:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5EF8924F;
	Tue, 24 Sep 2019 20:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F4AA892C5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 20:48:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2F2F872162; Tue, 24 Sep 2019 20:48:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111804] Annoying GPU stucks are continued on Vega 20 with
 Kernel 5.4 + mesa 9.2.0 RC4 + llvm 9.0.0
 [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
 [CRTC:47:crtc-0] flip_done timed out
Date: Tue, 24 Sep 2019 20:48:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: adonai@xaker.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111804-502-6Ddp8Uwewt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111804-502@http.bugs.freedesktop.org/>
References: <bug-111804-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0714020361=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0714020361==
Content-Type: multipart/alternative; boundary="15693581001.b2EEF.27827"
Content-Transfer-Encoding: 7bit


--15693581001.b2EEF.27827
Date: Tue, 24 Sep 2019 20:48:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111804

--- Comment #7 from Chernovsky Oleg <adonai@xaker.ru> ---
Can confirm, have same issue with Vega 64 and gaming (both native and Wine +
DXVK). Surprisingly, the dmesg stack mentions Slack electron app, which ind=
eed
was running in background.

dmesg stack:
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D589680, emitted seq=3D589681
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeout, signaled
seq=3D5916, emitted seq=3D5917
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process sla=
ck
pid 2028 thread slack:cs0 pid 2032
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process sla=
ck
pid 2028 thread slack:cs0 pid 2032
amdgpu 0000:0d:00.0: GPU reset begin!
amdgpu 0000:0d:00.0: GPU reset begin!
[drm] Bailing on TDR for s_job:8f401, as another already in progress
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but soft recov=
ered
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but soft recov=
ered
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[PLANE:45:plane-5] flip_done timed out
------------[ cut here ]------------
WARNING: CPU: 9 PID: 937 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5813
amdgpu_dm_atomic_commit_tail.cold+0x82/0xed [amdgpu]
Modules linked in: cmac rfcomm fuse bridge stp llc uvcvideo videobuf2_vmall=
oc
videobuf2_memops videobuf2_v4l2 videobuf2_common snd_usb_audio videodev ...
 aesni_intel libahci libata aes_x86_64 glue_helper crypto_simd cryptd xhci_=
pci
scsi_mod xhci_hcd
CPU: 9 PID: 937 Comm: Xorg Not tainted 5.3.0-arch1-1-ARCH #1
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./X370 Gaming K4,
BIOS P5.50 08/04/2019
RIP: 0010:amdgpu_dm_atomic_commit_tail.cold+0x82/0xed [amdgpu]
Code: c7 c7 58 4d 0a c1 e8 57 22 f1 db 0f 0b 41 83 7c 24 08 00 0f 85 a0 ff =
f1
ff e9 bb ff f1 ff 48 c7 c7 58 4d 0a c1 e8 38 22 f1 db <0f> 0b e9 3a f5 f ...
RSP: 0018:ffffa20100cc78a0 EFLAGS: 00010046
RAX: 0000000000000024 RBX: ffff92f34e662000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000086 RDI: 00000000ffffffff
RBP: ffffa20100cc7bc0 R08: 00000000000004dc R09: 0000000000000004
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000286
R13: ffff92f24c449800 R14: ffff92f3769a0000 R15: ffff92f22460af00
FS:  00007f45b11eedc0(0000) GS:ffff92f37e840000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5b665c8000 CR3: 00000007c99e6000 CR4: 00000000003406e0
Call Trace:
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
 drm_atomic_helper_legacy_gamma_set+0x11b/0x170 [drm_kms_helper]
 drm_mode_gamma_set_ioctl+0x1a9/0x210 [drm]
 ? drm_color_lut_check+0xb0/0xb0 [drm]
 drm_ioctl_kernel+0xb8/0x100 [drm]
 drm_ioctl+0x23d/0x3d0 [drm]
 ? drm_color_lut_check+0xb0/0xb0 [drm]
 amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
 do_vfs_ioctl+0x43d/0x6c0
 ? syscall_trace_enter+0x1f2/0x2e0
 ksys_ioctl+0x5e/0x90
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x5f/0x1c0
 ? prepare_exit_to_usermode+0x85/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f45b242721b

System info:

System:    Host: house-of-maker Kernel: 5.3.0-arch1-1-ARCH x86_64 bits: 64
compiler: gcc v: 9.1.0 Desktop: KDE Plasma 5.16.5=20
Machine:   Type: Desktop Mobo: ASRock model: X370 Gaming K4 serial: <root
required> UEFI: American Megatrends v: P5.50=20
           date: 08/04/2019=20
CPU:       Topology: 8-Core model: AMD Ryzen 7 1700X bits: 64 type: MT MCP
arch: Zen rev: 1 L2 cache: 4096 KiB=20
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3
svm bogomips: 108622=20
           Speed: 2513 MHz min/max: 2200/3400 MHz Core speeds (MHz): 1: 244=
0 2:
2570 3: 1725 4: 2371 5: 1712 6: 1740 7: 1711=20
           8: 2396 9: 1711 10: 2367 11: 1862 12: 1711 13: 1754 14: 2398 15:
2682 16: 2368=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Vega 10 XL/XT [Radeon=
 RX
Vega 56/64] vendor: Sapphire Limited=20
           driver: amdgpu v: kernel bus ID: 0d:00.0=20
           Display: x11 server: X.Org 1.20.5 driver: modesetting unloaded:
fbdev,vesa resolution: 2560x1440~60Hz=20
           OpenGL: renderer: Radeon RX Vega (VEGA10 DRM 3.33.0
5.3.0-arch1-1-ARCH LLVM 8.0.1) v: 4.5 Mesa 19.1.7=20
           direct render: Yes

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693581001.b2EEF.27827
Date: Tue, 24 Sep 2019 20:48:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.2.0 RC4 + llvm 9.0.0 [drm:drm_atomic_helper_wait_for_flip_done=
 [drm_kms_helper]] *ERROR* [CRTC:47:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111804#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.2.0 RC4 + llvm 9.0.0 [drm:drm_atomic_helper_wait_for_flip_done=
 [drm_kms_helper]] *ERROR* [CRTC:47:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111804">bug 11180=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
adonai&#64;xaker.ru" title=3D"Chernovsky Oleg &lt;adonai&#64;xaker.ru&gt;">=
 <span class=3D"fn">Chernovsky Oleg</span></a>
</span></b>
        <pre>Can confirm, have same issue with Vega 64 and gaming (both nat=
ive and Wine +
DXVK). Surprisingly, the dmesg stack mentions Slack electron app, which ind=
eed
was running in background.

dmesg stack:
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D589680, emitted seq=3D589681
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeout, signaled
seq=3D5916, emitted seq=3D5917
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process sla=
ck
pid 2028 thread slack:cs0 pid 2032
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process sla=
ck
pid 2028 thread slack:cs0 pid 2032
amdgpu 0000:0d:00.0: GPU reset begin!
amdgpu 0000:0d:00.0: GPU reset begin!
[drm] Bailing on TDR for s_job:8f401, as another already in progress
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but soft recov=
ered
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but soft recov=
ered
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[PLANE:45:plane-5] flip_done timed out
------------[ cut here ]------------
WARNING: CPU: 9 PID: 937 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5813
amdgpu_dm_atomic_commit_tail.cold+0x82/0xed [amdgpu]
Modules linked in: cmac rfcomm fuse bridge stp llc uvcvideo videobuf2_vmall=
oc
videobuf2_memops videobuf2_v4l2 videobuf2_common snd_usb_audio videodev ...
 aesni_intel libahci libata aes_x86_64 glue_helper crypto_simd cryptd xhci_=
pci
scsi_mod xhci_hcd
CPU: 9 PID: 937 Comm: Xorg Not tainted 5.3.0-arch1-1-ARCH #1
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./X370 Gaming K4,
BIOS P5.50 08/04/2019
RIP: 0010:amdgpu_dm_atomic_commit_tail.cold+0x82/0xed [amdgpu]
Code: c7 c7 58 4d 0a c1 e8 57 22 f1 db 0f 0b 41 83 7c 24 08 00 0f 85 a0 ff =
f1
ff e9 bb ff f1 ff 48 c7 c7 58 4d 0a c1 e8 38 22 f1 db &lt;0f&gt; 0b e9 3a f=
5 f ...
RSP: 0018:ffffa20100cc78a0 EFLAGS: 00010046
RAX: 0000000000000024 RBX: ffff92f34e662000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000086 RDI: 00000000ffffffff
RBP: ffffa20100cc7bc0 R08: 00000000000004dc R09: 0000000000000004
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000286
R13: ffff92f24c449800 R14: ffff92f3769a0000 R15: ffff92f22460af00
FS:  00007f45b11eedc0(0000) GS:ffff92f37e840000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5b665c8000 CR3: 00000007c99e6000 CR4: 00000000003406e0
Call Trace:
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
 drm_atomic_helper_legacy_gamma_set+0x11b/0x170 [drm_kms_helper]
 drm_mode_gamma_set_ioctl+0x1a9/0x210 [drm]
 ? drm_color_lut_check+0xb0/0xb0 [drm]
 drm_ioctl_kernel+0xb8/0x100 [drm]
 drm_ioctl+0x23d/0x3d0 [drm]
 ? drm_color_lut_check+0xb0/0xb0 [drm]
 amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
 do_vfs_ioctl+0x43d/0x6c0
 ? syscall_trace_enter+0x1f2/0x2e0
 ksys_ioctl+0x5e/0x90
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x5f/0x1c0
 ? prepare_exit_to_usermode+0x85/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f45b242721b

System info:

System:    Host: house-of-maker Kernel: 5.3.0-arch1-1-ARCH x86_64 bits: 64
compiler: gcc v: 9.1.0 Desktop: KDE Plasma 5.16.5=20
Machine:   Type: Desktop Mobo: ASRock model: X370 Gaming K4 serial: &lt;root
required&gt; UEFI: American Megatrends v: P5.50=20
           date: 08/04/2019=20
CPU:       Topology: 8-Core model: AMD Ryzen 7 1700X bits: 64 type: MT MCP
arch: Zen rev: 1 L2 cache: 4096 KiB=20
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3
svm bogomips: 108622=20
           Speed: 2513 MHz min/max: 2200/3400 MHz Core speeds (MHz): 1: 244=
0 2:
2570 3: 1725 4: 2371 5: 1712 6: 1740 7: 1711=20
           8: 2396 9: 1711 10: 2367 11: 1862 12: 1711 13: 1754 14: 2398 15:
2682 16: 2368=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Vega 10 XL/XT [Radeon=
 RX
Vega 56/64] vendor: Sapphire Limited=20
           driver: amdgpu v: kernel bus ID: 0d:00.0=20
           Display: x11 server: X.Org 1.20.5 driver: modesetting unloaded:
fbdev,vesa resolution: 2560x1440~60Hz=20
           OpenGL: renderer: Radeon RX Vega (VEGA10 DRM 3.33.0
5.3.0-arch1-1-ARCH LLVM 8.0.1) v: 4.5 Mesa 19.1.7=20
           direct render: Yes</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693581001.b2EEF.27827--

--===============0714020361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0714020361==--
