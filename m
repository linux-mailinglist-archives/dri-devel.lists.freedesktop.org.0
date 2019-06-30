Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D49F5AEC4
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 08:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B0989E39;
	Sun, 30 Jun 2019 06:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B193A6E9BD
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 06:00:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AE66F72167; Sun, 30 Jun 2019 06:00:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110994] [vega10] *ERROR* Failed to initialize parser -125! ,
 running libreoffice
Date: Sun, 30 Jun 2019 06:00:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jason@jasonplayne.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110994-502-QMPVLPakij@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110994-502@http.bugs.freedesktop.org/>
References: <bug-110994-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1028493825=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1028493825==
Content-Type: multipart/alternative; boundary="15618744402.Db1646C3B.10642"
Content-Transfer-Encoding: 7bit


--15618744402.Db1646C3B.10642
Date: Sun, 30 Jun 2019 06:00:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110994

--- Comment #7 from Jason Playne <jason@jasonplayne.com> ---
here is the dmesg log for all things amdgpu

[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-5.1.15-050115-gener=
ic
root=3DUUID=3D2ba5c512-4d8f-11e7-b210-b3322d3f791f ro quiet splash idle=3Dn=
omwait
amdgpu.ppfeaturemask=3D0xffffffff vt.handoff=3D1
[    0.147115] Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-5.1.15-050115-generic
root=3DUUID=3D2ba5c512-4d8f-11e7-b210-b3322d3f791f ro quiet splash idle=3Dn=
omwait
amdgpu.ppfeaturemask=3D0xffffffff vt.handoff=3D1
[    1.482810] [drm] amdgpu kernel modesetting enabled.
[    1.483007] fb0: switching to amdgpudrmfb from VESA VGA
[    1.483097] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
[    1.483360] amdgpu 0000:0c:00.0: No more image in the PCI ROM
[    1.483400] amdgpu 0000:0c:00.0: VRAM: 8176M 0x000000F400000000 -
0x000000F5FEFFFFFF (8176M used)
[    1.483401] amdgpu 0000:0c:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    1.483402] amdgpu 0000:0c:00.0: AGP: 267419648M 0x000000F800000000 -
0x0000FFFFFFFFFFFF
[    1.483477] [drm] amdgpu: 8176M of VRAM memory ready
[    1.483478] [drm] amdgpu: 8176M of GTT memory ready.
[    1.993612] fbcon: amdgpudrmfb (fb0) is primary device
[    2.014145] amdgpu 0000:0c:00.0: fb0: amdgpudrmfb frame buffer device
[    2.028499] amdgpu 0000:0c:00.0: ring gfx uses VM inv eng 0 on hub 0
[    2.028500] amdgpu 0000:0c:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    2.028501] amdgpu 0000:0c:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    2.028502] amdgpu 0000:0c:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    2.028503] amdgpu 0000:0c:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    2.028504] amdgpu 0000:0c:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    2.028505] amdgpu 0000:0c:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    2.028506] amdgpu 0000:0c:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    2.028507] amdgpu 0000:0c:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    2.028508] amdgpu 0000:0c:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    2.028509] amdgpu 0000:0c:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    2.028509] amdgpu 0000:0c:00.0: ring sdma1 uses VM inv eng 1 on hub 1
[    2.028510] amdgpu 0000:0c:00.0: ring uvd_0 uses VM inv eng 4 on hub 1
[    2.028511] amdgpu 0000:0c:00.0: ring uvd_enc_0.0 uses VM inv eng 5 on h=
ub 1
[    2.028512] amdgpu 0000:0c:00.0: ring uvd_enc_0.1 uses VM inv eng 6 on h=
ub 1
[    2.028513] amdgpu 0000:0c:00.0: ring vce0 uses VM inv eng 7 on hub 1
[    2.028514] amdgpu 0000:0c:00.0: ring vce1 uses VM inv eng 8 on hub 1
[    2.028515] amdgpu 0000:0c:00.0: ring vce2 uses VM inv eng 9 on hub 1
[    2.029090] [drm] Initialized amdgpu 3.30.0 20150101 for 0000:0c:00.0 on
minor 0
[  441.574435] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574443] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f701000 from 27
[  441.574447] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00301031
[  441.574454] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574457] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f701000 from 27
[  441.574459] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574465] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574469] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f700000 from 27
[  441.574472] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574479] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574481] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f701000 from 27
[  441.574483] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574491] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574494] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f707000 from 27
[  441.574497] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574504] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574507] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f708000 from 27
[  441.574510] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574516] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574520] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f709000 from 27
[  441.574523] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574530] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574534] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f700000 from 27
[  441.574536] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574545] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574548] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f709000 from 27
[  441.574550] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574557] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574560] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f701000 from 27
[  441.574563] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  451.593803] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D74980, emitted seq=3D74982
[  451.593842] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process HellbladeGame-W pid 13494 thread HellbladeGame-W pid 13494
[  451.593846] amdgpu 0000:0c:00.0: GPU reset begin!
[  451.935808] amdgpu 0000:0c:00.0: GPU BACO reset
[  452.446323] amdgpu 0000:0c:00.0: GPU reset succeeded, trying to resume
[  452.446595] [drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* VRAM is los=
t!
[  452.499322] amdgpu: [powerplay] Failed to send message: 0x46, ret value:
0xffffffff
[  452.956495] amdgpu 0000:0c:00.0: GPU reset(2) succeeded!
[  452.957220] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  452.957383] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  452.964084] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  452.964232] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15618744402.Db1646C3B.10642
Date: Sun, 30 Jun 2019 06:00:40 +0000
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
   title=3D"NEW - [vega10] *ERROR* Failed to initialize parser -125! , runn=
ing libreoffice"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110994#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [vega10] *ERROR* Failed to initialize parser -125! , runn=
ing libreoffice"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110994">bug 11099=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jason&#64;jasonplayne.com" title=3D"Jason Playne &lt;jason&#64;jasonplayne.=
com&gt;"> <span class=3D"fn">Jason Playne</span></a>
</span></b>
        <pre>here is the dmesg log for all things amdgpu

[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-5.1.15-050115-gener=
ic
root=3DUUID=3D2ba5c512-4d8f-11e7-b210-b3322d3f791f ro quiet splash idle=3Dn=
omwait
amdgpu.ppfeaturemask=3D0xffffffff vt.handoff=3D1
[    0.147115] Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-5.1.15-050115-generic
root=3DUUID=3D2ba5c512-4d8f-11e7-b210-b3322d3f791f ro quiet splash idle=3Dn=
omwait
amdgpu.ppfeaturemask=3D0xffffffff vt.handoff=3D1
[    1.482810] [drm] amdgpu kernel modesetting enabled.
[    1.483007] fb0: switching to amdgpudrmfb from VESA VGA
[    1.483097] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
[    1.483360] amdgpu 0000:0c:00.0: No more image in the PCI ROM
[    1.483400] amdgpu 0000:0c:00.0: VRAM: 8176M 0x000000F400000000 -
0x000000F5FEFFFFFF (8176M used)
[    1.483401] amdgpu 0000:0c:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    1.483402] amdgpu 0000:0c:00.0: AGP: 267419648M 0x000000F800000000 -
0x0000FFFFFFFFFFFF
[    1.483477] [drm] amdgpu: 8176M of VRAM memory ready
[    1.483478] [drm] amdgpu: 8176M of GTT memory ready.
[    1.993612] fbcon: amdgpudrmfb (fb0) is primary device
[    2.014145] amdgpu 0000:0c:00.0: fb0: amdgpudrmfb frame buffer device
[    2.028499] amdgpu 0000:0c:00.0: ring gfx uses VM inv eng 0 on hub 0
[    2.028500] amdgpu 0000:0c:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    2.028501] amdgpu 0000:0c:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    2.028502] amdgpu 0000:0c:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    2.028503] amdgpu 0000:0c:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    2.028504] amdgpu 0000:0c:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    2.028505] amdgpu 0000:0c:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    2.028506] amdgpu 0000:0c:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    2.028507] amdgpu 0000:0c:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    2.028508] amdgpu 0000:0c:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    2.028509] amdgpu 0000:0c:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    2.028509] amdgpu 0000:0c:00.0: ring sdma1 uses VM inv eng 1 on hub 1
[    2.028510] amdgpu 0000:0c:00.0: ring uvd_0 uses VM inv eng 4 on hub 1
[    2.028511] amdgpu 0000:0c:00.0: ring uvd_enc_0.0 uses VM inv eng 5 on h=
ub 1
[    2.028512] amdgpu 0000:0c:00.0: ring uvd_enc_0.1 uses VM inv eng 6 on h=
ub 1
[    2.028513] amdgpu 0000:0c:00.0: ring vce0 uses VM inv eng 7 on hub 1
[    2.028514] amdgpu 0000:0c:00.0: ring vce1 uses VM inv eng 8 on hub 1
[    2.028515] amdgpu 0000:0c:00.0: ring vce2 uses VM inv eng 9 on hub 1
[    2.029090] [drm] Initialized amdgpu 3.30.0 20150101 for 0000:0c:00.0 on
minor 0
[  441.574435] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574443] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f701000 from 27
[  441.574447] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00301031
[  441.574454] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574457] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f701000 from 27
[  441.574459] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574465] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574469] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f700000 from 27
[  441.574472] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574479] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574481] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f701000 from 27
[  441.574483] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574491] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574494] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f707000 from 27
[  441.574497] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574504] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574507] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f708000 from 27
[  441.574510] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574516] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574520] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f709000 from 27
[  441.574523] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574530] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574534] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f700000 from 27
[  441.574536] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574545] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574548] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f709000 from 27
[  441.574550] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  441.574557] amdgpu 0000:0c:00.0: [gfxhub] no-retry page fault (src_id:0
ring:24 vmid:3 pasid:32769, for process HellbladeGame-W pid 13494 thread
HellbladeGame-W pid 13494)
[  441.574560] amdgpu 0000:0c:00.0:   in page starting at address
0x000080012f701000 from 27
[  441.574563] amdgpu 0000:0c:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[  451.593803] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D74980, emitted seq=3D74982
[  451.593842] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process HellbladeGame-W pid 13494 thread HellbladeGame-W pid 13494
[  451.593846] amdgpu 0000:0c:00.0: GPU reset begin!
[  451.935808] amdgpu 0000:0c:00.0: GPU BACO reset
[  452.446323] amdgpu 0000:0c:00.0: GPU reset succeeded, trying to resume
[  452.446595] [drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* VRAM is los=
t!
[  452.499322] amdgpu: [powerplay] Failed to send message: 0x46, ret value:
0xffffffff
[  452.956495] amdgpu 0000:0c:00.0: GPU reset(2) succeeded!
[  452.957220] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  452.957383] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  452.964084] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[  452.964232] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15618744402.Db1646C3B.10642--

--===============1028493825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1028493825==--
