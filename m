Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A01728D
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 09:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F9B891B5;
	Wed,  8 May 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A1211891B5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 07:28:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9D6117215A; Wed,  8 May 2019 07:28:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110641] lm_sensors reports "ERROR: Can't get value of
 subfeature in0_input: Can't read"
Date: Wed, 08 May 2019 07:28:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bong.cosca@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110641-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0772945343=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0772945343==
Content-Type: multipart/alternative; boundary="15573004841.B23Ca04.5777"
Content-Transfer-Encoding: 7bit


--15573004841.B23Ca04.5777
Date: Wed, 8 May 2019 07:28:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110641

            Bug ID: 110641
           Summary: lm_sensors reports "ERROR: Can't get value of
                    subfeature in0_input: Can't read"
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: bong.cosca@gmail.com

Alex Deucher <alexander.deucher@amd.com> 2017-03-08 18:25:15 -0500
drm/amdgpu: expose GPU sensor related information
commit 5ebbac4b5c9159130046bf7c56b7f4c71ca7d1b7

This particular commit introduced this error.

$ sensors -j

{
   "amdgpu-pci-0008":{
      "Adapter": "PCI adapter",
      "vddgfx":{
ERROR: Can't get value of subfeature in0_input: Can't read

      },
      "vddnb":{
ERROR: Can't get value of subfeature in1_input: Can't read

      },
      "temp1":{
         "temp1_input": 12.000,
         "temp1_crit": 120.000,
         "temp1_crit_hyst": 90.000
      }
   },
   "it8603-isa-0290":{
      "Adapter": "ISA adapter",
      "CPU Fan":{
         "fan1_input": 2509.000,
         "fan1_min": 200.000,
         "fan1_alarm": 0.000
      },
      "Mobo Fan":{
         "fan2_input": 0.000,
         "fan2_min": 600.000,
         "fan2_alarm": 1.000
      },
      "AMD A6-7400K Radeon R5":{
         "temp1_input": 44.000,
         "temp1_max": 127.000,
         "temp1_min": -45.000,
         "temp1_alarm": 0.000,
         "temp1_type": 4.000,
         "temp1_offset": 0.000
      },
      "Asus A68HM-K Mobo":{
         "temp2_input": 45.000,
         "temp2_max": -33.000,
         "temp2_min": 53.000,
         "temp2_alarm": 1.000,
         "temp2_type": 4.000,
         "temp2_offset": 0.000
      }
   }
}

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15573004841.B23Ca04.5777
Date: Wed, 8 May 2019 07:28:04 +0000
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
   title=3D"NEW - lm_sensors reports &quot;ERROR: Can't get value of subfea=
ture in0_input: Can't read&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110641">110641</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>lm_sensors reports &quot;ERROR: Can't get value of subfeature=
 in0_input: Can't read&quot;
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
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
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
          <td>bong.cosca&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64;amd.c=
om">alexander.deucher&#64;amd.com</a>&gt; 2017-03-08 18:25:15 -0500
drm/amdgpu: expose GPU sensor related information
commit 5ebbac4b5c9159130046bf7c56b7f4c71ca7d1b7

This particular commit introduced this error.

$ sensors -j

{
   &quot;amdgpu-pci-0008&quot;:{
      &quot;Adapter&quot;: &quot;PCI adapter&quot;,
      &quot;vddgfx&quot;:{
ERROR: Can't get value of subfeature in0_input: Can't read

      },
      &quot;vddnb&quot;:{
ERROR: Can't get value of subfeature in1_input: Can't read

      },
      &quot;temp1&quot;:{
         &quot;temp1_input&quot;: 12.000,
         &quot;temp1_crit&quot;: 120.000,
         &quot;temp1_crit_hyst&quot;: 90.000
      }
   },
   &quot;it8603-isa-0290&quot;:{
      &quot;Adapter&quot;: &quot;ISA adapter&quot;,
      &quot;CPU Fan&quot;:{
         &quot;fan1_input&quot;: 2509.000,
         &quot;fan1_min&quot;: 200.000,
         &quot;fan1_alarm&quot;: 0.000
      },
      &quot;Mobo Fan&quot;:{
         &quot;fan2_input&quot;: 0.000,
         &quot;fan2_min&quot;: 600.000,
         &quot;fan2_alarm&quot;: 1.000
      },
      &quot;AMD A6-7400K Radeon R5&quot;:{
         &quot;temp1_input&quot;: 44.000,
         &quot;temp1_max&quot;: 127.000,
         &quot;temp1_min&quot;: -45.000,
         &quot;temp1_alarm&quot;: 0.000,
         &quot;temp1_type&quot;: 4.000,
         &quot;temp1_offset&quot;: 0.000
      },
      &quot;Asus A68HM-K Mobo&quot;:{
         &quot;temp2_input&quot;: 45.000,
         &quot;temp2_max&quot;: -33.000,
         &quot;temp2_min&quot;: 53.000,
         &quot;temp2_alarm&quot;: 1.000,
         &quot;temp2_type&quot;: 4.000,
         &quot;temp2_offset&quot;: 0.000
      }
   }
}</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15573004841.B23Ca04.5777--

--===============0772945343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0772945343==--
