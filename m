Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54870EC67A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 17:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D946F850;
	Fri,  1 Nov 2019 16:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D9DAF6F844
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 16:16:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D0697720E2; Fri,  1 Nov 2019 16:16:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107296] WARNING: CPU: 0 PID: 370 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355
 dcn_bw_update_from_pplib+0x16b/0x280 [amdgpu]
Date: Fri, 01 Nov 2019 16:16:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: janpieter.sollie@dommel.be
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WORKSFORME
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-107296-502-7mWVuEFxYY@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0932348293=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0932348293==
Content-Type: multipart/alternative; boundary="15726249942.bF8652.14188"
Content-Transfer-Encoding: 7bit


--15726249942.bF8652.14188
Date: Fri, 1 Nov 2019 16:16:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107296

Janpieter Sollie <janpieter.sollie@dommel.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #22 from Janpieter Sollie <janpieter.sollie@dommel.be> ---
using kernel 5.3.8 + firmware 22/10 instead of 5.3.6 with GCC 8.3.0 instead=
 of
9.2.0:
[    3.421856] [drm] use_doorbell being set to: [true]
[    3.421888] amdgpu: [powerplay] hwmgr_sw_init smu backed is smu10_smu
[    3.423662] [drm] Found VCN firmware Version: 1.73 Family ID: 18
[    3.423667] [drm] PSP loading VCN firmware
[    3.444352] [drm] reserve 0x400000 from 0xf400c00000 for PSP TMR
[    3.458608] usb 1-5: reset high-speed USB device number 2 using xhci_hcd
[    3.620099] [drm] DM_PPLIB: values for F clock
[    3.620101] [drm] DM_PPLIB:   400000 in kHz, 3649 in mV
[    3.620102] [drm] DM_PPLIB:   933000 in kHz, 3974 in mV
[    3.620102] [drm] DM_PPLIB:   1067000 in kHz, 4174 in mV
[    3.620103] [drm] DM_PPLIB:   1200000 in kHz, 4325 in mV
[    3.620104] [drm] DM_PPLIB: values for DCF clock
[    3.620105] [drm] DM_PPLIB:   300000 in kHz, 3649 in mV
[    3.620106] [drm] DM_PPLIB:   600000 in kHz, 3974 in mV
[    3.620107] [drm] DM_PPLIB:   626000 in kHz, 4174 in mV
[    3.620107] [drm] DM_PPLIB:   654000 in kHz, 4325 in mV
[    3.708441] [drm] Display Core initialized with v3.2.35!
[    3.733737] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.733738] [drm] Driver supports precise vblank timestamp query.
[    3.735809] usb 2-1: reset SuperSpeed Gen 1 USB device number 2 using
xhci_hcd
[    3.745448] [drm] VCN decode and encode initialized successfully(under S=
PG
Mode).
[    3.746451] kfd kfd: Allocated 3969056 bytes on gart
[    3.747092] Topology: Add APU node [0x15dd:0x1002]
[    3.747094] kfd kfd: added device 1002:15dd
[    3.748312] [drm] fb mappable at 0xA1000000
[    3.748313] [drm] vram apper at 0xA0000000
[    3.748314] [drm] size 8294400
[    3.748314] [drm] fb depth is 24
[    3.748315] [drm]    pitch is 7680
[    3.748384] fbcon: amdgpudrmfb (fb0) is primary device
[    3.794386] Console: switching to colour frame buffer device 240x67
[    3.816030] amdgpu 0000:29:00.0: fb0: amdgpudrmfb frame buffer device
[    3.830110] amdgpu 0000:29:00.0: ring gfx uses VM inv eng 0 on hub 0
[    3.830113] amdgpu 0000:29:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    3.830115] amdgpu 0000:29:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    3.830117] amdgpu 0000:29:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    3.830120] amdgpu 0000:29:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    3.830121] amdgpu 0000:29:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    3.830123] amdgpu 0000:29:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    3.830125] amdgpu 0000:29:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    3.830127] amdgpu 0000:29:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    3.830129] amdgpu 0000:29:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    3.830131] amdgpu 0000:29:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    3.830132] amdgpu 0000:29:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[    3.830134] amdgpu 0000:29:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[    3.830136] amdgpu 0000:29:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[    3.830138] amdgpu 0000:29:00.0: ring vcn_jpeg uses VM inv eng 6 on hub 1
[    3.843923] [drm] Initialized amdgpu 3.33.0 20150101 for 0000:29:00.0 on
minor 0

Looks good, doesn't it? I don't know what actually changed the behaviour, b=
ut
it seems to work

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726249942.bF8652.14188
Date: Fri, 1 Nov 2019 16:16:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:janpieter=
.sollie&#64;dommel.be" title=3D"Janpieter Sollie &lt;janpieter.sollie&#64;d=
ommel.be&gt;"> <span class=3D"fn">Janpieter Sollie</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - WARNING: CPU: 0 PID: 370 at drivers/gpu/d=
rm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib=
+0x16b/0x280 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>WORKSFORME
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - WARNING: CPU: 0 PID: 370 at drivers/gpu/d=
rm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib=
+0x16b/0x280 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - WARNING: CPU: 0 PID: 370 at drivers/gpu/d=
rm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib=
+0x16b/0x280 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
janpieter.sollie&#64;dommel.be" title=3D"Janpieter Sollie &lt;janpieter.sol=
lie&#64;dommel.be&gt;"> <span class=3D"fn">Janpieter Sollie</span></a>
</span></b>
        <pre>using kernel 5.3.8 + firmware 22/10 instead of 5.3.6 with GCC =
8.3.0 instead of
9.2.0:
[    3.421856] [drm] use_doorbell being set to: [true]
[    3.421888] amdgpu: [powerplay] hwmgr_sw_init smu backed is smu10_smu
[    3.423662] [drm] Found VCN firmware Version: 1.73 Family ID: 18
[    3.423667] [drm] PSP loading VCN firmware
[    3.444352] [drm] reserve 0x400000 from 0xf400c00000 for PSP TMR
[    3.458608] usb 1-5: reset high-speed USB device number 2 using xhci_hcd
[    3.620099] [drm] DM_PPLIB: values for F clock
[    3.620101] [drm] DM_PPLIB:   400000 in kHz, 3649 in mV
[    3.620102] [drm] DM_PPLIB:   933000 in kHz, 3974 in mV
[    3.620102] [drm] DM_PPLIB:   1067000 in kHz, 4174 in mV
[    3.620103] [drm] DM_PPLIB:   1200000 in kHz, 4325 in mV
[    3.620104] [drm] DM_PPLIB: values for DCF clock
[    3.620105] [drm] DM_PPLIB:   300000 in kHz, 3649 in mV
[    3.620106] [drm] DM_PPLIB:   600000 in kHz, 3974 in mV
[    3.620107] [drm] DM_PPLIB:   626000 in kHz, 4174 in mV
[    3.620107] [drm] DM_PPLIB:   654000 in kHz, 4325 in mV
[    3.708441] [drm] Display Core initialized with v3.2.35!
[    3.733737] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.733738] [drm] Driver supports precise vblank timestamp query.
[    3.735809] usb 2-1: reset SuperSpeed Gen 1 USB device number 2 using
xhci_hcd
[    3.745448] [drm] VCN decode and encode initialized successfully(under S=
PG
Mode).
[    3.746451] kfd kfd: Allocated 3969056 bytes on gart
[    3.747092] Topology: Add APU node [0x15dd:0x1002]
[    3.747094] kfd kfd: added device 1002:15dd
[    3.748312] [drm] fb mappable at 0xA1000000
[    3.748313] [drm] vram apper at 0xA0000000
[    3.748314] [drm] size 8294400
[    3.748314] [drm] fb depth is 24
[    3.748315] [drm]    pitch is 7680
[    3.748384] fbcon: amdgpudrmfb (fb0) is primary device
[    3.794386] Console: switching to colour frame buffer device 240x67
[    3.816030] amdgpu 0000:29:00.0: fb0: amdgpudrmfb frame buffer device
[    3.830110] amdgpu 0000:29:00.0: ring gfx uses VM inv eng 0 on hub 0
[    3.830113] amdgpu 0000:29:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    3.830115] amdgpu 0000:29:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    3.830117] amdgpu 0000:29:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    3.830120] amdgpu 0000:29:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    3.830121] amdgpu 0000:29:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    3.830123] amdgpu 0000:29:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    3.830125] amdgpu 0000:29:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    3.830127] amdgpu 0000:29:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    3.830129] amdgpu 0000:29:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    3.830131] amdgpu 0000:29:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    3.830132] amdgpu 0000:29:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[    3.830134] amdgpu 0000:29:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[    3.830136] amdgpu 0000:29:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[    3.830138] amdgpu 0000:29:00.0: ring vcn_jpeg uses VM inv eng 6 on hub 1
[    3.843923] [drm] Initialized amdgpu 3.33.0 20150101 for 0000:29:00.0 on
minor 0

Looks good, doesn't it? I don't know what actually changed the behaviour, b=
ut
it seems to work</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726249942.bF8652.14188--

--===============0932348293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0932348293==--
