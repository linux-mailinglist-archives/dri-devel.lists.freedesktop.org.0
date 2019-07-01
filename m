Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548EB4F357
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 05:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE266E950;
	Sat, 22 Jun 2019 03:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 810176E950
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 03:19:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 77A4C72167; Sat, 22 Jun 2019 03:19:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110962] Wrong dependencies cause force dependency on amdgpu-dkms
Date: Sat, 22 Jun 2019 03:19:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ashark@linuxcomp.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110962-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0419632477=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0419632477==
Content-Type: multipart/alternative; boundary="15611735960.9Ec3.1179"
Content-Transfer-Encoding: 7bit


--15611735960.9Ec3.1179
Date: Sat, 22 Jun 2019 03:19:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110962

            Bug ID: 110962
           Summary: Wrong dependencies cause force dependency on
                    amdgpu-dkms
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ashark@linuxcomp.ru

19.20-812932 release for Ubuntu

amdgpu-pro(-hwe) and amdgpu-pro-lib32 depend on amdgpu(-hwe), but actually =
they
should depend on amdgpu-lib(-hwe) (just like open variant packages). Becaus=
e of
that even when running installer with --no-dkms, it still is in packages li=
st
(because amdgpu(-hwe) depends on it).
Is it intentional or just a mistake?
I think this is a mistake, because if you want force dependency on amdgpu-d=
kms
with pro stack, you would make all other checks in amdgpu installer script.=
 But
because user giver "--no-dkms", such checks are skipped there.

Also, I was repacking amdgpu-pro packages (ubuntu archive) to Arch Linux. A=
m I
correct, that amdgpu-dkms package was made with Ubuntu LTS slowness in mind,
and is absolutely unneeded for Arch Linux? Am I right that I do not loose a=
ny
functionality abilities (maybe that allows you to watch gpu's load, like
wattman) even for pro stack if I omit amdgpu-dkms?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15611735960.9Ec3.1179
Date: Sat, 22 Jun 2019 03:19:56 +0000
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
   title=3D"NEW - Wrong dependencies cause force dependency on amdgpu-dkms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110962">110962</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Wrong dependencies cause force dependency on amdgpu-dkms
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
          <td>major
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

amdgpu-pro(-hwe) and amdgpu-pro-lib32 depend on amdgpu(-hwe), but actually =
they
should depend on amdgpu-lib(-hwe) (just like open variant packages). Becaus=
e of
that even when running installer with --no-dkms, it still is in packages li=
st
(because amdgpu(-hwe) depends on it).
Is it intentional or just a mistake?
I think this is a mistake, because if you want force dependency on amdgpu-d=
kms
with pro stack, you would make all other checks in amdgpu installer script.=
 But
because user giver &quot;--no-dkms&quot;, such checks are skipped there.

Also, I was repacking amdgpu-pro packages (ubuntu archive) to Arch Linux. A=
m I
correct, that amdgpu-dkms package was made with Ubuntu LTS slowness in mind,
and is absolutely unneeded for Arch Linux? Am I right that I do not loose a=
ny
functionality abilities (maybe that allows you to watch gpu's load, like
wattman) even for pro stack if I omit amdgpu-dkms?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15611735960.9Ec3.1179--

--===============0419632477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0419632477==--
