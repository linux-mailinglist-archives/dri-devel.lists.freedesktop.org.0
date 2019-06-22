Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4204F3BC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 06:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C106E95A;
	Sat, 22 Jun 2019 04:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B24246E95A
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 04:50:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AE85872167; Sat, 22 Jun 2019 04:50:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110968] Allow ubuntu users to install on other ubuntu versions
Date: Sat, 22 Jun 2019 04:50:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: ashark@linuxcomp.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110968-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0085991162=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0085991162==
Content-Type: multipart/alternative; boundary="15611790451.b2333a09.14712"
Content-Transfer-Encoding: 7bit


--15611790451.b2333a09.14712
Date: Sat, 22 Jun 2019 04:50:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110968

            Bug ID: 110968
           Summary: Allow ubuntu users to install on other ubuntu versions
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ashark@linuxcomp.ru

19.20-812932 release for Ubuntu

In amdgpu-core package there is a preinst script which checks a distribution
version. If it is not Ubuntu, it allows installation with warning. But if it
detects it is another version of Ubuntu, it declines installation.

Why not just let users to install and just warn them that they are using
unsupported version? Anyway, users may modify a package with my script, tha=
t I
attached to this bug report:
https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

Also installation denial of this single package causes a big trouble for th=
ose
who tried to use installer script. You can see in that bug report that anot=
her
user was in situation with a lot of broken packages. I also was in such
situation and did not know how to recover from that state. Later I have
prepared a script to remove everything from amdgpu-pro (also attached there=
).

But really, if you still want to stop ubuntu users, then why do not edit
installer, so it goes to install only amdgpu-core first (without its
dependencies), and only after that it goes to install all other packages th=
at
are returned by build_package_list? Or just make distribution check in
installer script rather than in package scriptlet.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15611790451.b2333a09.14712
Date: Sat, 22 Jun 2019 04:50:45 +0000
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
   title=3D"NEW - Allow ubuntu users to install on other ubuntu versions"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110968">110968</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Allow ubuntu users to install on other ubuntu versions
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
          <td>blocker
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu-pro
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ashark&#64;linuxcomp.ru
          </td>
        </tr></table>
      <p>
        <div>
        <pre>19.20-812932 release for Ubuntu

In amdgpu-core package there is a preinst script which checks a distribution
version. If it is not Ubuntu, it allows installation with warning. But if it
detects it is another version of Ubuntu, it declines installation.

Why not just let users to install and just warn them that they are using
unsupported version? Anyway, users may modify a package with my script, tha=
t I
attached to this bug report:
<a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - Unable to install on latest Ubuntu (19.04)"
   href=3D"show_bug.cgi?id=3D110795">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110795</a>

Also installation denial of this single package causes a big trouble for th=
ose
who tried to use installer script. You can see in that bug report that anot=
her
user was in situation with a lot of broken packages. I also was in such
situation and did not know how to recover from that state. Later I have
prepared a script to remove everything from amdgpu-pro (also attached there=
).

But really, if you still want to stop ubuntu users, then why do not edit
installer, so it goes to install only amdgpu-core first (without its
dependencies), and only after that it goes to install all other packages th=
at
are returned by build_package_list? Or just make distribution check in
installer script rather than in package scriptlet.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15611790451.b2333a09.14712--

--===============0085991162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0085991162==--
