Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34733228A9
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 22:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D5D891D2;
	Sun, 19 May 2019 20:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8FEFC891D2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 20:06:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8C76A72167; Sun, 19 May 2019 20:06:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110713] A Hat in Time: GPU hang with gallium nine
Date: Sun, 19 May 2019 20:06:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lolisamurai@tfwno.gf
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110713-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0521382168=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0521382168==
Content-Type: multipart/alternative; boundary="15582964091.dFf0cD097.22459"
Content-Transfer-Encoding: 7bit


--15582964091.dFf0cD097.22459
Date: Sun, 19 May 2019 20:06:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110713

            Bug ID: 110713
           Summary: A Hat in Time: GPU hang with gallium nine
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: lolisamurai@tfwno.gf
        QA Contact: dri-devel@lists.freedesktop.org

when using gallium nine, A Hat in Time locks up the entire system (requires=
 a
hard reboot) on certain scenes.

I'm running a r9 270x with the amdgpu driver and mesa-git 110950.fc455797c1=
b-1
+ llvm-svn 360675-1

this issue was discussed with the gallium nine guys here:
https://github.com/iXit/wine-nine-standalone/issues/35 and they narrowed it
down to radeonsi

using AMD_DEBUG=3Dmono fixes the issue

this is the apitrace for gallium nine
https://mega.nz/#!ZJhRhYaR!cVsMkRYkl6kPl0f43sMKu8NI4pvA4eE85cbLJyoQ-jE

the hang happens on the very last part of the trace, when the green goo in =
the
middle of the room is on screen. the area is chapter3, act6 and all other
challenges that take place there

playing back the trace also causes the same hang.

playing back the trace with AMD_DEBUG=3Dmono works correctly without any ha=
ngs

other users report that turning off dynamic lights also fixes the issue

another user reported a similar hang in chapter 1, act 4 with this apitrace
https://kiwii.casa/downloads/d3d9.trace.xz

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15582964091.dFf0cD097.22459
Date: Sun, 19 May 2019 20:06:49 +0000
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
   title=3D"NEW - A Hat in Time: GPU hang with gallium nine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110713">110713</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>A Hat in Time: GPU hang with gallium nine
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
          <td>lolisamurai&#64;tfwno.gf
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>when using gallium nine, A Hat in Time locks up the entire sys=
tem (requires a
hard reboot) on certain scenes.

I'm running a r9 270x with the amdgpu driver and mesa-git 110950.fc455797c1=
b-1
+ llvm-svn 360675-1

this issue was discussed with the gallium nine guys here:
<a href=3D"https://github.com/iXit/wine-nine-standalone/issues/35">https://=
github.com/iXit/wine-nine-standalone/issues/35</a> and they narrowed it
down to radeonsi

using AMD_DEBUG=3Dmono fixes the issue

this is the apitrace for gallium nine
<a href=3D"https://mega.nz/#!ZJhRhYaR!cVsMkRYkl6kPl0f43sMKu8NI4pvA4eE85cbLJ=
yoQ-jE">https://mega.nz/#!ZJhRhYaR!cVsMkRYkl6kPl0f43sMKu8NI4pvA4eE85cbLJyoQ=
-jE</a>

the hang happens on the very last part of the trace, when the green goo in =
the
middle of the room is on screen. the area is chapter3, act6 and all other
challenges that take place there

playing back the trace also causes the same hang.

playing back the trace with AMD_DEBUG=3Dmono works correctly without any ha=
ngs

other users report that turning off dynamic lights also fixes the issue

another user reported a similar hang in chapter 1, act 4 with this apitrace
<a href=3D"https://kiwii.casa/downloads/d3d9.trace.xz">https://kiwii.casa/d=
ownloads/d3d9.trace.xz</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15582964091.dFf0cD097.22459--

--===============0521382168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0521382168==--
