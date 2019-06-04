Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE134A48
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2AA88894;
	Tue,  4 Jun 2019 14:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8B0688894
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 14:24:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BED7A72167; Tue,  4 Jun 2019 14:24:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110837] Mesa 19.0.5 breaks support for a WebGL 2 in a Firefox
 67.0
Date: Tue, 04 Jun 2019 14:24:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r600
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaykaykay123@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110837-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1968716830=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1968716830==
Content-Type: multipart/alternative; boundary="15596582610.d597D4.21122"
Content-Transfer-Encoding: 7bit


--15596582610.d597D4.21122
Date: Tue, 4 Jun 2019 14:24:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110837

            Bug ID: 110837
           Summary: Mesa 19.0.5 breaks support for a WebGL 2 in a Firefox
                    67.0
           Product: Mesa
           Version: 19.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/r600
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: kaykaykay123@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Steps to reproduce:

1. Start Firefox.
2. Open about:support in a Firefox.
3. Look at "WebGL 2" info strings (search for a "webgl 2" substring).

Info strings contains "WebGL creation failed: * " or no info at all.

Expected Results: info strings contains descriptions, as it is with a "WebGL
1".


System: openSUSE 15.0 + Mesa 19.0.5 + Firefox 67.0.
ATI (AMD) Radeon Evergreen Cedar, TeraScale 2.
AFAIR Mesa 19.0.4 and before works well.

Firefox works, but supposedly has some issues.

:~>glxinfo | grep OpenGL
OpenGL vendor string: X.Org
OpenGL renderer string: AMD CEDAR (DRM 2.50.0 / 4.12.14-lp150.12.61-default,
LLVM 7.0.1)
OpenGL core profile version string: 3.3 (Core Profile) Mesa 19.0.5
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.1 Mesa 19.0.5
OpenGL shading language version string: 1.40
OpenGL context flags: (none)
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.1 Mesa 19.0.5
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.10
OpenGL ES profile extensions:

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596582610.d597D4.21122
Date: Tue, 4 Jun 2019 14:24:21 +0000
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
   title=3D"NEW - Mesa 19.0.5 breaks support for a WebGL 2 in a Firefox 67.=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110837">110837</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mesa 19.0.5 breaks support for a WebGL 2 in a Firefox 67.0
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.0
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
          <td>Drivers/Gallium/r600
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>kaykaykay123&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Steps to reproduce:

1. Start Firefox.
2. Open about:support in a Firefox.
3. Look at &quot;WebGL 2&quot; info strings (search for a &quot;webgl 2&quo=
t; substring).

Info strings contains &quot;WebGL creation failed: * &quot; or no info at a=
ll.

Expected Results: info strings contains descriptions, as it is with a &quot=
;WebGL
1&quot;.


System: openSUSE 15.0 + Mesa 19.0.5 + Firefox 67.0.
ATI (AMD) Radeon Evergreen Cedar, TeraScale 2.
AFAIR Mesa 19.0.4 and before works well.

Firefox works, but supposedly has some issues.

:~&gt;glxinfo | grep OpenGL
OpenGL vendor string: X.Org
OpenGL renderer string: AMD CEDAR (DRM 2.50.0 / 4.12.14-lp150.12.61-default,
LLVM 7.0.1)
OpenGL core profile version string: 3.3 (Core Profile) Mesa 19.0.5
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.1 Mesa 19.0.5
OpenGL shading language version string: 1.40
OpenGL context flags: (none)
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.1 Mesa 19.0.5
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.10
OpenGL ES profile extensions:</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596582610.d597D4.21122--

--===============1968716830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1968716830==--
