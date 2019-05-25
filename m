Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566A2A731
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 00:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A296E190;
	Sat, 25 May 2019 22:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E50B6E17D
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 22:02:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0AD1972167; Sat, 25 May 2019 22:02:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107296] WARNING: CPU: 0 PID: 370 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355
 dcn_bw_update_from_pplib+0x16b/0x280 [amdgpu]
Date: Sat, 25 May 2019 22:02:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pathyj@kwic.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107296-502-gBLeU7G1Al@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107296-502@http.bugs.freedesktop.org/>
References: <bug-107296-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1966532570=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1966532570==
Content-Type: multipart/alternative; boundary="15588217570.aE1aAf.11318"
Content-Transfer-Encoding: 7bit


--15588217570.aE1aAf.11318
Date: Sat, 25 May 2019 22:02:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107296

--- Comment #13 from John Pathy <pathyj@kwic.com> ---
I have the same problem with my 2400G.

My kernel is as follows

[    0.000000] Linux version 4.19.0-5-amd64 (debian-kernel@lists.debian.org)
(gcc version 8.3.0 (Debian 8.3.0-7)) #1 SMP Debian 4.19.37-3 (2019-05-15)

When my system boots I get a RIP with a trace as above

[    1.532390] amdgpu: [powerplay] dpm has been enabled
[    1.532453] [drm] DM_PPLIB: values for Invalid clock
[    1.532454] [drm] DM_PPLIB:   0 in kHz
[    1.532456] [drm] DM_PPLIB:   400000 in kHz
[    1.532457] [drm] DM_PPLIB:   933000 in kHz
[    1.532459] [drm] DM_PPLIB:   1067000 in kHz
[    1.532537] WARNING: CPU: 6 PID: 134 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1372
dcn_bw_update_from_pplib+0x171/0x290 [amdgpu]
[    1.532540] Modules linked in: amdkfd amdgpu(+) crc32c_intel mxm_wmi cha=
sh
gpu_sched ttm aesni_intel ahci drm_kms_helper aes_x86_64 crypto_simd libahci
cryptd glue_helper xhci_pci libata drm xhci_hcd igb i2c_piix4 scsi_mod usbc=
ore
dca i2c_algo_bit usb_common video wmi gpio_amdpt gpio_generic button
[    1.532558] CPU: 6 PID: 134 Comm: systemd-udevd Not tainted 4.19.0-5-amd=
64
#1 Debian 4.19.37-3
[    1.532561] Hardware name: Gigabyte Technology Co., Ltd. X470 AORUS ULTRA
GAMING/X470 AORUS ULTRA GAMING-CF, BIOS F30 04/16/2019
[    1.532620] RIP: 0010:dcn_bw_update_from_pplib+0x171/0x290 [amdgpu]

So I looked into this and the problem I see is that the fclks are not
initializing properly is routine

res =3D dm_pp_get_clock_levels_by_type_with_voltage(
                        ctx, DM_PP_CLOCK_TYPE_FCLK, &fclks);

When the sanity check in=20

res =3D verify_clock_values(&fclks);

is completed, it detects the 0 in index [0] and initiated the RIP. This is =
the
data that initiated the RIP.

[    1.532454] [drm] DM_PPLIB:   0 in kHz

The fclks in my log appear to be shifted down. I seems it should look like
this, which is what a 2200G reports on boot. This was from somebody else's
system.

[    3.774892] [drm] DM_PPLIB: values for F clock
[    3.774894] [drm] DM_PPLIB:   400000 in kHz
[    3.774894] [drm] DM_PPLIB:   933000 in kHz
[    3.774895] [drm] DM_PPLIB:   1067000 in kHz
[    3.774895] [drm] DM_PPLIB:   1200000 in kHz
[    3.774896] [drm] DM_PPLIB: values for DCF clock
[    3.774896] [drm] DM_PPLIB:   300000 in kHz
[    3.774897] [drm] DM_PPLIB:   600000 in kHz
[    3.774897] [drm] DM_PPLIB:   626000 in kHz
[    3.774897] [drm] DM_PPLIB:   654000 in kHz

Also to note is that for my kernel (4.19.0-5-amd64) the F and DCF are repor=
ted
as invalid, but for subsequent kernels 5.1.3 and 5.2-rc1, this appears to be
corrected.

My whole kern.log is located in the attachment for comment 12.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15588217570.aE1aAf.11318
Date: Sat, 25 May 2019 22:02:37 +0000
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
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pathyj&#64;kwic.com" title=3D"John Pathy &lt;pathyj&#64;kwic.com&gt;"> <spa=
n class=3D"fn">John Pathy</span></a>
</span></b>
        <pre>I have the same problem with my 2400G.

My kernel is as follows

[    0.000000] Linux version 4.19.0-5-amd64 (<a href=3D"mailto:debian-kerne=
l&#64;lists.debian.org">debian-kernel&#64;lists.debian.org</a>)
(gcc version 8.3.0 (Debian 8.3.0-7)) #1 SMP Debian 4.19.37-3 (2019-05-15)

When my system boots I get a RIP with a trace as above

[    1.532390] amdgpu: [powerplay] dpm has been enabled
[    1.532453] [drm] DM_PPLIB: values for Invalid clock
[    1.532454] [drm] DM_PPLIB:   0 in kHz
[    1.532456] [drm] DM_PPLIB:   400000 in kHz
[    1.532457] [drm] DM_PPLIB:   933000 in kHz
[    1.532459] [drm] DM_PPLIB:   1067000 in kHz
[    1.532537] WARNING: CPU: 6 PID: 134 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1372
dcn_bw_update_from_pplib+0x171/0x290 [amdgpu]
[    1.532540] Modules linked in: amdkfd amdgpu(+) crc32c_intel mxm_wmi cha=
sh
gpu_sched ttm aesni_intel ahci drm_kms_helper aes_x86_64 crypto_simd libahci
cryptd glue_helper xhci_pci libata drm xhci_hcd igb i2c_piix4 scsi_mod usbc=
ore
dca i2c_algo_bit usb_common video wmi gpio_amdpt gpio_generic button
[    1.532558] CPU: 6 PID: 134 Comm: systemd-udevd Not tainted 4.19.0-5-amd=
64
#1 Debian 4.19.37-3
[    1.532561] Hardware name: Gigabyte Technology Co., Ltd. X470 AORUS ULTRA
GAMING/X470 AORUS ULTRA GAMING-CF, BIOS F30 04/16/2019
[    1.532620] RIP: 0010:dcn_bw_update_from_pplib+0x171/0x290 [amdgpu]

So I looked into this and the problem I see is that the fclks are not
initializing properly is routine

res =3D dm_pp_get_clock_levels_by_type_with_voltage(
                        ctx, DM_PP_CLOCK_TYPE_FCLK, &amp;fclks);

When the sanity check in=20

res =3D verify_clock_values(&amp;fclks);

is completed, it detects the 0 in index [0] and initiated the RIP. This is =
the
data that initiated the RIP.

[    1.532454] [drm] DM_PPLIB:   0 in kHz

The fclks in my log appear to be shifted down. I seems it should look like
this, which is what a 2200G reports on boot. This was from somebody else's
system.

[    3.774892] [drm] DM_PPLIB: values for F clock
[    3.774894] [drm] DM_PPLIB:   400000 in kHz
[    3.774894] [drm] DM_PPLIB:   933000 in kHz
[    3.774895] [drm] DM_PPLIB:   1067000 in kHz
[    3.774895] [drm] DM_PPLIB:   1200000 in kHz
[    3.774896] [drm] DM_PPLIB: values for DCF clock
[    3.774896] [drm] DM_PPLIB:   300000 in kHz
[    3.774897] [drm] DM_PPLIB:   600000 in kHz
[    3.774897] [drm] DM_PPLIB:   626000 in kHz
[    3.774897] [drm] DM_PPLIB:   654000 in kHz

Also to note is that for my kernel (4.19.0-5-amd64) the F and DCF are repor=
ted
as invalid, but for subsequent kernels 5.1.3 and 5.2-rc1, this appears to be
corrected.

My whole kern.log is located in the attachment for <a href=3D"show_bug.cgi?=
id=3D107296#c12">comment 12</a>.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15588217570.aE1aAf.11318--

--===============1966532570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1966532570==--
