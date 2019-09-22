Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE70BA28A
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B17D6E0DB;
	Sun, 22 Sep 2019 12:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC3A26E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2019 09:54:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C8FB372162; Sun, 22 Sep 2019 09:54:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111762] RX 5700 XT Navi - amdgpu.ppfeaturemask=0xffffffff
 causes stuttering and does not unlock clock/voltage/power controls
Date: Sun, 22 Sep 2019 09:54:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111762-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0288731828=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0288731828==
Content-Type: multipart/alternative; boundary="15691460561.bE4B.24378"
Content-Transfer-Encoding: 7bit


--15691460561.bE4B.24378
Date: Sun, 22 Sep 2019 09:54:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111762

            Bug ID: 111762
           Summary: RX 5700 XT Navi - amdgpu.ppfeaturemask=3D0xffffffff
                    causes stuttering and does not unlock
                    clock/voltage/power controls
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: tempel.julian@gmail.com

Hello,
with Polaris and Vega, setting amdgpu.ppfeaturemask=3D0xffffffff worked wit=
hout
issues here: It unlocked pp_od_clk_voltage and didn't cause any issues for =
me.

But with Navi, it doesn't work. I'm still not allowed to open
/sys/class/drm/card0/device/pp_od_clk_voltage
as root with specifying that flag.

Also, I can't increase the GPU's power consumption, as
/sys/class/drm/card0/device/hwmon/hwmon0/power1_cap_max
only allows the default 100% Powertune limit, meaning I can't set any higher
value in
/sys/class/drm/card0/device/hwmon/hwmon0/power1_cap

Apart from not being able to change the aforementioned parameters, setting
amdgpu.ppfeaturemask=3D0xffffffff causes stuttering, even on the desktop an=
d also
affects the mouse cursor.

This is with kernel drm-next-5.5-wip 73cdff347343504287feae8b36fa7317f04dcc=
61
and an MSI 5700 XT Gaming X.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15691460561.bE4B.24378
Date: Sun, 22 Sep 2019 09:54:16 +0000
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
   title=3D"NEW - RX 5700 XT Navi - amdgpu.ppfeaturemask=3D0xffffffff cause=
s stuttering and does not unlock clock/voltage/power controls"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111762">111762</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>RX 5700 XT Navi - amdgpu.ppfeaturemask=3D0xffffffff causes st=
uttering and does not unlock clock/voltage/power controls
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
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
          <td>tempel.julian&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,
with Polaris and Vega, setting amdgpu.ppfeaturemask=3D0xffffffff worked wit=
hout
issues here: It unlocked pp_od_clk_voltage and didn't cause any issues for =
me.

But with Navi, it doesn't work. I'm still not allowed to open
/sys/class/drm/card0/device/pp_od_clk_voltage
as root with specifying that flag.

Also, I can't increase the GPU's power consumption, as
/sys/class/drm/card0/device/hwmon/hwmon0/power1_cap_max
only allows the default 100% Powertune limit, meaning I can't set any higher
value in
/sys/class/drm/card0/device/hwmon/hwmon0/power1_cap

Apart from not being able to change the aforementioned parameters, setting
amdgpu.ppfeaturemask=3D0xffffffff causes stuttering, even on the desktop an=
d also
affects the mouse cursor.

This is with kernel drm-next-5.5-wip 73cdff347343504287feae8b36fa7317f04dcc=
61
and an MSI 5700 XT Gaming X.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15691460561.bE4B.24378--

--===============0288731828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0288731828==--
