Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E106915F9
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 11:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DDB6E054;
	Sun, 18 Aug 2019 09:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE3876E054
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 09:50:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7688672161; Sun, 18 Aug 2019 09:50:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111416] 4k 60hz on RX 560 over HDMI = no sound
Date: Sun, 18 Aug 2019 09:50:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@azelphur.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111416-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0260660850=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0260660850==
Content-Type: multipart/alternative; boundary="15661218220.B7Af50.5826"
Content-Transfer-Encoding: 7bit


--15661218220.B7Af50.5826
Date: Sun, 18 Aug 2019 09:50:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111416

            Bug ID: 111416
           Summary: 4k 60hz on RX 560 over HDMI =3D no sound
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: freedesktop@azelphur.com

Hi,

If I switch to 4k 60hz on my RX 560, sound instantly drops out.

I can enable/disable sound by running
`xrandr --output HDMI-A-0 --mode 3840x2160 -r 30`
`xrandr --output HDMI-A-0 --mode 3840x2160 -r 60`

No messages appear in dmesg or Xorg log when switching between 30/60hz. So =
I'm
not sure what information to provide with aiding debugging. Please let me k=
now!

I'm using a custom modeline since 4k 60hz option is unavailable by default =
(see
bug #111412) this is the modeline I am using:

Modeline     "3840x2160" 594  3840 4016 4104 4400  2160 2168 2178 2250 +hsy=
nc
+vsync

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15661218220.B7Af50.5826
Date: Sun, 18 Aug 2019 09:50:22 +0000
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
   title=3D"NEW - 4k 60hz on RX 560 over HDMI =3D no sound"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111416">111416</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>4k 60hz on RX 560 over HDMI =3D no sound
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
          <td>freedesktop&#64;azelphur.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

If I switch to 4k 60hz on my RX 560, sound instantly drops out.

I can enable/disable sound by running
`xrandr --output HDMI-A-0 --mode 3840x2160 -r 30`
`xrandr --output HDMI-A-0 --mode 3840x2160 -r 60`

No messages appear in dmesg or Xorg log when switching between 30/60hz. So =
I'm
not sure what information to provide with aiding debugging. Please let me k=
now!

I'm using a custom modeline since 4k 60hz option is unavailable by default =
(see
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 4k 60hz unavailable RX 560 over HDMI"
   href=3D"show_bug.cgi?id=3D111412">bug #111412</a>) this is the modeline =
I am using:

Modeline     &quot;3840x2160&quot; 594  3840 4016 4104 4400  2160 2168 2178=
 2250 +hsync
+vsync</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15661218220.B7Af50.5826--

--===============0260660850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0260660850==--
