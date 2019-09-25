Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B26BD8B2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 09:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051956E143;
	Wed, 25 Sep 2019 07:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 829486E143
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 07:03:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7F4E872162; Wed, 25 Sep 2019 07:03:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111811] Ryzen7 3700U display hang on resume from suspend
Date: Wed, 25 Sep 2019 07:03:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: dan@reactivated.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111811-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0169341318=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0169341318==
Content-Type: multipart/alternative; boundary="15693950260.4Facc97.3217"
Content-Transfer-Encoding: 7bit


--15693950260.4Facc97.3217
Date: Wed, 25 Sep 2019 07:03:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111811

            Bug ID: 111811
           Summary: Ryzen7 3700U display hang on resume from suspend
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: dan@reactivated.net

Created attachment 145510
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145510&action=3Dedit
full dmesg

We are working with a new consumer laptop based on Ryzen 7 3700U.

amdgpu device:

03:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Picasso [1002:15d8] (rev c1) (prog-if 00 [VGA controller])

Upon suspend/resume (this platform uses s2idle), the pre-suspend image can =
be
seen on screen, but the display is totally hung. These kernel messages can =
be
seen in the resume process:

[  281.293412] [drm] PCIE GART of 1024M enabled (table at 0x000000F40090000=
0).
[  281.293465] [drm] PSP is resuming...
[  281.313495] [drm] reserve 0x400000 from 0xf47fc00000 for PSP TMR
[  281.316389] [drm] psp command failed and response status is (0x7)
[  281.603206] ata1: SATA link down (SStatus 0 SControl 300)
[  282.538559] amdgpu: [powerplay] dpm has been enabled
[  282.748112] [drm] VCN decode and encode initialized successfully(under D=
PG
Mode).
[  282.748141] amdgpu 0000:03:00.0: ring gfx uses VM inv eng 0 on hub 0
[  282.748143] amdgpu 0000:03:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[  282.748144] amdgpu 0000:03:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[  282.748146] amdgpu 0000:03:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[  282.748147] amdgpu 0000:03:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[  282.748148] amdgpu 0000:03:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[  282.748150] amdgpu 0000:03:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[  282.748151] amdgpu 0000:03:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[  282.748152] amdgpu 0000:03:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[  282.748154] amdgpu 0000:03:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[  282.748155] amdgpu 0000:03:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[  282.748157] amdgpu 0000:03:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[  282.748157] amdgpu 0000:03:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[  282.748158] amdgpu 0000:03:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[  282.748160] amdgpu 0000:03:00.0: ring vcn_jpeg uses VM inv eng 6 on hub 1
[  283.133649] [drm] Fence fallback timer expired on ring sdma0
[  283.261764] [drm] Fence fallback timer expired on ring gfx
[  283.261809] amdgpu 0000:03:00.0: [drm:amdgpu_ib_ring_tests] *ERROR* IB t=
est
failed on gfx (-22).
[  283.261814] [drm:process_one_work] *ERROR* ib ring test failed (-22).

This has been reproduced on Linux 5.2 and linus master as of today. As this=
 is
a brand new platform there is no previous known working version. It does
suspend/resume fine under Windows 10.

Please let me know how I can help further. We'd be happy to ship a product
sample to AMD developers for diagnosis.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693950260.4Facc97.3217
Date: Wed, 25 Sep 2019 07:03:46 +0000
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
   title=3D"NEW - Ryzen7 3700U display hang on resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111811">111811</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Ryzen7 3700U display hang on resume from suspend
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>dan&#64;reactivated.net
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145510=
" name=3D"attach_145510" title=3D"full dmesg">attachment 145510</a> <a href=
=3D"attachment.cgi?id=3D145510&amp;action=3Dedit" title=3D"full dmesg">[det=
ails]</a></span>
full dmesg

We are working with a new consumer laptop based on Ryzen 7 3700U.

amdgpu device:

03:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Picasso [1002:15d8] (rev c1) (prog-if 00 [VGA controller])

Upon suspend/resume (this platform uses s2idle), the pre-suspend image can =
be
seen on screen, but the display is totally hung. These kernel messages can =
be
seen in the resume process:

[  281.293412] [drm] PCIE GART of 1024M enabled (table at 0x000000F40090000=
0).
[  281.293465] [drm] PSP is resuming...
[  281.313495] [drm] reserve 0x400000 from 0xf47fc00000 for PSP TMR
[  281.316389] [drm] psp command failed and response status is (0x7)
[  281.603206] ata1: SATA link down (SStatus 0 SControl 300)
[  282.538559] amdgpu: [powerplay] dpm has been enabled
[  282.748112] [drm] VCN decode and encode initialized successfully(under D=
PG
Mode).
[  282.748141] amdgpu 0000:03:00.0: ring gfx uses VM inv eng 0 on hub 0
[  282.748143] amdgpu 0000:03:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[  282.748144] amdgpu 0000:03:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[  282.748146] amdgpu 0000:03:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[  282.748147] amdgpu 0000:03:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[  282.748148] amdgpu 0000:03:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[  282.748150] amdgpu 0000:03:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[  282.748151] amdgpu 0000:03:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[  282.748152] amdgpu 0000:03:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[  282.748154] amdgpu 0000:03:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[  282.748155] amdgpu 0000:03:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[  282.748157] amdgpu 0000:03:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[  282.748157] amdgpu 0000:03:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[  282.748158] amdgpu 0000:03:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[  282.748160] amdgpu 0000:03:00.0: ring vcn_jpeg uses VM inv eng 6 on hub 1
[  283.133649] [drm] Fence fallback timer expired on ring sdma0
[  283.261764] [drm] Fence fallback timer expired on ring gfx
[  283.261809] amdgpu 0000:03:00.0: [drm:amdgpu_ib_ring_tests] *ERROR* IB t=
est
failed on gfx (-22).
[  283.261814] [drm:process_one_work] *ERROR* ib ring test failed (-22).

This has been reproduced on Linux 5.2 and linus master as of today. As this=
 is
a brand new platform there is no previous known working version. It does
suspend/resume fine under Windows 10.

Please let me know how I can help further. We'd be happy to ship a product
sample to AMD developers for diagnosis.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693950260.4Facc97.3217--

--===============0169341318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0169341318==--
