Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7397A20
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 14:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EBE89BC0;
	Wed, 21 Aug 2019 12:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D5C589BC0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 12:59:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5429D72161; Wed, 21 Aug 2019 12:59:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111455] DMAR: [INTR-REMAP] Blocked an interrupt request due to
 source-id verification failure
Date: Wed, 21 Aug 2019 12:59:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: nikolay@oldum.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111455-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1441890396=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1441890396==
Content-Type: multipart/alternative; boundary="15663923850.eD82d.30640"
Content-Transfer-Encoding: 7bit


--15663923850.eD82d.30640
Date: Wed, 21 Aug 2019 12:59:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111455

            Bug ID: 111455
           Summary: DMAR: [INTR-REMAP] Blocked an interrupt request due to
                    source-id verification failure
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: nikolay@oldum.net

Hello team,
the below error is printed in the log and causes the graphics driver to fre=
eze:

[Tue Aug 20 12:04:38 2019] DMAR: DRHD: handling fault status reg 2
[Tue Aug 20 12:04:38 2019] DMAR: [INTR-REMAP] Request device [00:00.0] fault
index 26 [fault reason 38] Blocked an interrupt request due to source-id
verification failure
[Tue Aug 20 12:04:38 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:38 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:39 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:39 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:40 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:40 2019] [drm] Fence fallback timer expired on ring sdma0
[Tue Aug 20 12:04:41 2019] [drm] Fence fallback timer expired on ring sdma0
...

Hardware is: Dell Precision Tower 5810 with Advanced Micro Devices, Inc.
[AMD/ATI] Oland GL [FirePro W2100] video card.

Kernel: 5.2.8 x86_64 (GNU/Gentoo Linux)
Kernel Command line: BOOT_IMAGE=3D/kernel-genkernel-x86_64-5.2.8-gentoo
root=3D/dev/mapper/root ro crypt_root=3DUUID=3De11887f5-4104-4a9e-9c53-7e1d=
904a0b28
root_trim=3Dno elevator=3Dbfq scsi_mod.use_blk_mq=3D1 libata.allow_tpm=3D1 =
domdadm
dolvm intel_iommu=3Don

IOMMU is on, because the system acts mainly as a KVM/Libvirt host.

amdgpu driver information:
# dmesg | grep amd
[   14.614307] [drm] amdgpu kernel modesetting enabled.
[   14.615206] amdgpu 0000:03:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -> 0xefffffff
[   14.615208] amdgpu 0000:03:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xf7e00000 -> 0xf7e3ffff
[   14.615209] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
[   14.617260] amdgpu 0000:03:00.0: kfd not supported on this ASIC
[   14.622071] amdgpu 0000:03:00.0: No more image in the PCI ROM
[   14.624585] amdgpu 0000:03:00.0: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[   14.624586] amdgpu 0000:03:00.0: GART: 1024M 0x000000FF00000000 -
0x000000FF3FFFFFFF
[   14.626166] [drm] amdgpu: 2048M of VRAM memory ready
[   14.626169] [drm] amdgpu: 3072M of GTT memory ready.
[   14.626832] amdgpu 0000:03:00.0: PCIE GART of 1024M enabled (table at
0x000000F400900000).
[   14.643922] [drm] amdgpu: dpm initialized
[   14.862039] fbcon: amdgpudrmfb (fb0) is primary device
[   14.990216] amdgpu 0000:03:00.0: fb0: amdgpudrmfb frame buffer device
[   15.260648] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:03:00.0 on
minor 0

and module dependencies:
# lsmod | grep amdgpu
amdgpu               3772416  7
gpu_sched              36864  1 amdgpu
ttm                   114688  1 amdgpu
drm_kms_helper        212992  1 amdgpu
drm                   462848  7 gpu_sched,drm_kms_helper,amdgpu,ttm
i2c_algo_bit           16384  2 igb,amdgpu

Happy to collect output from 'drm.debug=3D0x1e log_buf_len=3D4M' booted ker=
nel if
that makes sense.

Thanks,
-Nikolay

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15663923850.eD82d.30640
Date: Wed, 21 Aug 2019 12:59:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DMAR: [INTR-REMAP] Blocked an interrupt request due to so=
urce-id verification failure"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111455">111455</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>DMAR: [INTR-REMAP] Blocked an interrupt request due to source=
-id verification failure
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>nikolay&#64;oldum.net
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello team,
the below error is printed in the log and causes the graphics driver to fre=
eze:

[Tue Aug 20 12:04:38 2019] DMAR: DRHD: handling fault status reg 2
[Tue Aug 20 12:04:38 2019] DMAR: [INTR-REMAP] Request device [00:00.0] fault
index 26 [fault reason 38] Blocked an interrupt request due to source-id
verification failure
[Tue Aug 20 12:04:38 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:38 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:39 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:39 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:40 2019] [drm] Fence fallback timer expired on ring gfx
[Tue Aug 20 12:04:40 2019] [drm] Fence fallback timer expired on ring sdma0
[Tue Aug 20 12:04:41 2019] [drm] Fence fallback timer expired on ring sdma0
...

Hardware is: Dell Precision Tower 5810 with Advanced Micro Devices, Inc.
[AMD/ATI] Oland GL [FirePro W2100] video card.

Kernel: 5.2.8 x86_64 (GNU/Gentoo Linux)
Kernel Command line: BOOT_IMAGE=3D/kernel-genkernel-x86_64-5.2.8-gentoo
root=3D/dev/mapper/root ro crypt_root=3DUUID=3De11887f5-4104-4a9e-9c53-7e1d=
904a0b28
root_trim=3Dno elevator=3Dbfq scsi_mod.use_blk_mq=3D1 libata.allow_tpm=3D1 =
domdadm
dolvm intel_iommu=3Don

IOMMU is on, because the system acts mainly as a KVM/Libvirt host.

amdgpu driver information:
# dmesg | grep amd
[   14.614307] [drm] amdgpu kernel modesetting enabled.
[   14.615206] amdgpu 0000:03:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -&gt; 0xefffffff
[   14.615208] amdgpu 0000:03:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xf7e00000 -&gt; 0xf7e3ffff
[   14.615209] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
[   14.617260] amdgpu 0000:03:00.0: kfd not supported on this ASIC
[   14.622071] amdgpu 0000:03:00.0: No more image in the PCI ROM
[   14.624585] amdgpu 0000:03:00.0: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[   14.624586] amdgpu 0000:03:00.0: GART: 1024M 0x000000FF00000000 -
0x000000FF3FFFFFFF
[   14.626166] [drm] amdgpu: 2048M of VRAM memory ready
[   14.626169] [drm] amdgpu: 3072M of GTT memory ready.
[   14.626832] amdgpu 0000:03:00.0: PCIE GART of 1024M enabled (table at
0x000000F400900000).
[   14.643922] [drm] amdgpu: dpm initialized
[   14.862039] fbcon: amdgpudrmfb (fb0) is primary device
[   14.990216] amdgpu 0000:03:00.0: fb0: amdgpudrmfb frame buffer device
[   15.260648] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:03:00.0 on
minor 0

and module dependencies:
# lsmod | grep amdgpu
amdgpu               3772416  7
gpu_sched              36864  1 amdgpu
ttm                   114688  1 amdgpu
drm_kms_helper        212992  1 amdgpu
drm                   462848  7 gpu_sched,drm_kms_helper,amdgpu,ttm
i2c_algo_bit           16384  2 igb,amdgpu

Happy to collect output from 'drm.debug=3D0x1e log_buf_len=3D4M' booted ker=
nel if
that makes sense.

Thanks,
-Nikolay</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15663923850.eD82d.30640--

--===============1441890396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1441890396==--
