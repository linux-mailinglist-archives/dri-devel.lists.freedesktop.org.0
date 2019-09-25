Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366CABDA94
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 11:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934806EB4F;
	Wed, 25 Sep 2019 09:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3533F6EB51
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 09:09:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 31B7B72162; Wed, 25 Sep 2019 09:09:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111813] Ubuntu 18.04.3 + Mesa 19.3 = Login Loop
Date: Wed, 25 Sep 2019 09:09:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DirkToewe@GoogleMail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111813-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0914714996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0914714996==
Content-Type: multipart/alternative; boundary="15694025741.F62F26.26431"
Content-Transfer-Encoding: 7bit


--15694025741.F62F26.26431
Date: Wed, 25 Sep 2019 09:09:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111813

            Bug ID: 111813
           Summary: Ubuntu 18.04.3 + Mesa 19.3 =3D Login Loop
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: DirkToewe@GoogleMail.com
        QA Contact: dri-devel@lists.freedesktop.org

Description
-----------
As of today with Oibaf's latest PPA update (19.3~git1909250730.88f909~oibaf=
~b),
Ubuntu 18.04.3 is stuck in a login loop, i.e. after entering the password t=
he
desktop background is displayed for a second and then Gnome goes back to the
login screen. According to /var/log/syslog, there are segementation faults
happening when Gnome tries to access GLX.

Sep 25 09:07:58 kernel: [   10.405287] gnome-shell[1073]: segfault at 50 ip
00007f1d58939291 sp 00007ffe73daced0 error 4 in
libGLX_mesa.so.0.0.0[7f1d588f0000+73000]
Sep 25 09:07:59 kernel: [   12.097378] gnome-shell[1323]: segfault at 50 ip
00007f3c427b1291 sp 00007ffef7af4e50 error 4 in
libGLX_mesa.so.0.0.0[7f3c42768000+73000]

After reverting to the official Ubuntu repositories using PPA-Purge, the lo=
gin
works just fine. My experience with (debugging) native binaries let alone
drivers is quite limited. Please let me know what else I can do to provide =
more
info if needed.

Hardware
--------
AMD A10-7850K APU (Kaveri)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694025741.F62F26.26431
Date: Wed, 25 Sep 2019 09:09:34 +0000
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
   title=3D"NEW - Ubuntu 18.04.3 + Mesa 19.3 =3D Login Loop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111813">111813</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Ubuntu 18.04.3 + Mesa 19.3 =3D Login Loop
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>DirkToewe&#64;GoogleMail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Description
-----------
As of today with Oibaf's latest PPA update (19.3~git1909250730.88f909~oibaf=
~b),
Ubuntu 18.04.3 is stuck in a login loop, i.e. after entering the password t=
he
desktop background is displayed for a second and then Gnome goes back to the
login screen. According to /var/log/syslog, there are segementation faults
happening when Gnome tries to access GLX.

Sep 25 09:07:58 kernel: [   10.405287] gnome-shell[1073]: segfault at 50 ip
00007f1d58939291 sp 00007ffe73daced0 error 4 in
libGLX_mesa.so.0.0.0[7f1d588f0000+73000]
Sep 25 09:07:59 kernel: [   12.097378] gnome-shell[1323]: segfault at 50 ip
00007f3c427b1291 sp 00007ffef7af4e50 error 4 in
libGLX_mesa.so.0.0.0[7f3c42768000+73000]

After reverting to the official Ubuntu repositories using PPA-Purge, the lo=
gin
works just fine. My experience with (debugging) native binaries let alone
drivers is quite limited. Please let me know what else I can do to provide =
more
info if needed.

Hardware
--------
AMD A10-7850K APU (Kaveri)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694025741.F62F26.26431--

--===============0914714996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0914714996==--
