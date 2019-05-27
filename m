Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403802B29F
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 13:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1A1898C2;
	Mon, 27 May 2019 11:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 30ACB898C4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:00:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2DAD072167; Mon, 27 May 2019 11:00:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107209] DM_PPLIB causes a warning on Raven
Date: Mon, 27 May 2019 11:00:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vono22@yahoo.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107209-502-ZgU26XQ8yu@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107209-502@http.bugs.freedesktop.org/>
References: <bug-107209-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0140167759=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0140167759==
Content-Type: multipart/alternative; boundary="15589548181.117Df64aD.27714"
Content-Transfer-Encoding: 7bit


--15589548181.117Df64aD.27714
Date: Mon, 27 May 2019 11:00:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107209

--- Comment #3 from vono <vono22@yahoo.fr> ---
Same here on Fedora 30 with kernel 5.0.17-300.fc30.x86_64

[drm] DM_PPLIB: values for Invalid clock
[drm] DM_PPLIB:         0 in kHz
[drm] DM_PPLIB:         0 in kHz
[drm] DM_PPLIB:         0 in kHz
[drm] DM_PPLIB:         1600000 in kHz
WARNING: CPU: 2 PID: 407 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1380
dcn_bw_update_from_pplib+0xa2/0x2d0 [amdgpu]
Modules linked in: amdgpu(+) chash amd_iommu_v2 gpu_sched i2c_algo_bit ttm
drm_kms_helper crc32c_intel drm r8169 wmi pinctrl_amd video
CPU: 2 PID: 407 Comm: systemd-udevd Not tainted 5.0.17-300.fc30.x86_64 #1
Hardware name: Micro-Star International Co., Ltd MS-7B07/A320M PRO-VH PLUS
(MS-7B07), BIOS 3.G1 05/15/2019
RIP: 0010:dcn_bw_update_from_pplib+0xa2/0x2d0 [amdgpu]
Code: 24 10 85 c9 74 24 8d 71 ff 48 8d 44 24 14 48 8d 54 f4 1c eb 0d 48 83 =
c0
08 48 39 c2 0f 84 2a 01 00 00 44 8b 00 45 85 c0 75 eb <0f> 0b e8 37 99 be c=
c 4c
89 >
RSP: 0018:ffffb8f481267760 EFLAGS: 00010246
RAX: ffffb8f481267774 RBX: ffff981f4b477000 RCX: 0000000000000004
RDX: ffffb8f481267794 RSI: 0000000000000003 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000364
R10: 00000000000117bc R11: 0000000000000003 R12: ffffb8f4812677c0
R13: ffff981f4d0f3800 R14: 0000000000000000 R15: ffff981f4b477000
FS:  00007f4900a2d940(0000) GS:ffff981f58480000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005588121a40b0 CR3: 000000018ef1e000 CR4: 00000000003406e0
Call Trace:
 dcn10_create_resource_pool+0x834/0xb30 [amdgpu]
 ? dal_aux_engine_dce110_create+0x3a/0x80 [amdgpu]
 dc_create_resource_pool+0x113/0x1b0 [amdgpu]
 ? _cond_resched+0x15/0x30
 ? __kmalloc+0x16f/0x220
 dc_create+0x233/0x640 [amdgpu]
 ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
 dm_hw_init+0xe6/0x160 [amdgpu]
 amdgpu_device_init.cold+0x1134/0x1428 [amdgpu]
 amdgpu_driver_load_kms+0x88/0x330 [amdgpu]
 drm_dev_register+0x116/0x160 [drm]
 amdgpu_pci_probe+0xb5/0x120 [amdgpu]


From /proc/cpuinfo:
vendor_id       : AuthenticAMD
cpu family      : 23
model           : 17
model name      : AMD Ryzen 3 2200G with Radeon Vega Graphics
stepping        : 0
microcode       : 0x8101013
cpu MHz         : 1589.201

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589548181.117Df64aD.27714
Date: Mon, 27 May 2019 11:00:18 +0000
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
   title=3D"NEW - DM_PPLIB causes a warning on Raven"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107209#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DM_PPLIB causes a warning on Raven"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107209">bug 10720=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vono22&#64;yahoo.fr" title=3D"vono &lt;vono22&#64;yahoo.fr&gt;"> <span clas=
s=3D"fn">vono</span></a>
</span></b>
        <pre>Same here on Fedora 30 with kernel 5.0.17-300.fc30.x86_64

[drm] DM_PPLIB: values for Invalid clock
[drm] DM_PPLIB:         0 in kHz
[drm] DM_PPLIB:         0 in kHz
[drm] DM_PPLIB:         0 in kHz
[drm] DM_PPLIB:         1600000 in kHz
WARNING: CPU: 2 PID: 407 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1380
dcn_bw_update_from_pplib+0xa2/0x2d0 [amdgpu]
Modules linked in: amdgpu(+) chash amd_iommu_v2 gpu_sched i2c_algo_bit ttm
drm_kms_helper crc32c_intel drm r8169 wmi pinctrl_amd video
CPU: 2 PID: 407 Comm: systemd-udevd Not tainted 5.0.17-300.fc30.x86_64 #1
Hardware name: Micro-Star International Co., Ltd MS-7B07/A320M PRO-VH PLUS
(MS-7B07), BIOS 3.G1 05/15/2019
RIP: 0010:dcn_bw_update_from_pplib+0xa2/0x2d0 [amdgpu]
Code: 24 10 85 c9 74 24 8d 71 ff 48 8d 44 24 14 48 8d 54 f4 1c eb 0d 48 83 =
c0
08 48 39 c2 0f 84 2a 01 00 00 44 8b 00 45 85 c0 75 eb &lt;0f&gt; 0b e8 37 9=
9 be cc 4c
89 &gt;
RSP: 0018:ffffb8f481267760 EFLAGS: 00010246
RAX: ffffb8f481267774 RBX: ffff981f4b477000 RCX: 0000000000000004
RDX: ffffb8f481267794 RSI: 0000000000000003 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000364
R10: 00000000000117bc R11: 0000000000000003 R12: ffffb8f4812677c0
R13: ffff981f4d0f3800 R14: 0000000000000000 R15: ffff981f4b477000
FS:  00007f4900a2d940(0000) GS:ffff981f58480000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005588121a40b0 CR3: 000000018ef1e000 CR4: 00000000003406e0
Call Trace:
 dcn10_create_resource_pool+0x834/0xb30 [amdgpu]
 ? dal_aux_engine_dce110_create+0x3a/0x80 [amdgpu]
 dc_create_resource_pool+0x113/0x1b0 [amdgpu]
 ? _cond_resched+0x15/0x30
 ? __kmalloc+0x16f/0x220
 dc_create+0x233/0x640 [amdgpu]
 ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
 dm_hw_init+0xe6/0x160 [amdgpu]
 amdgpu_device_init.cold+0x1134/0x1428 [amdgpu]
 amdgpu_driver_load_kms+0x88/0x330 [amdgpu]
 drm_dev_register+0x116/0x160 [drm]
 amdgpu_pci_probe+0xb5/0x120 [amdgpu]


From /proc/cpuinfo:
vendor_id       : AuthenticAMD
cpu family      : 23
model           : 17
model name      : AMD Ryzen 3 2200G with Radeon Vega Graphics
stepping        : 0
microcode       : 0x8101013
cpu MHz         : 1589.201</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15589548181.117Df64aD.27714--

--===============0140167759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0140167759==--
