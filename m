Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A9E61216
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2019 18:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7836389D4F;
	Sat,  6 Jul 2019 16:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3CA989D4F
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 16:03:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8178672167; Sat,  6 Jul 2019 16:03:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111076] Building error after commit b52bf8f12a
 ("amd/common/gfx10: support new tbuffer encoding")
Date: Sat, 06 Jul 2019 16:03:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: issor.oruam@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111076-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1836328823=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1836328823==
Content-Type: multipart/alternative; boundary="15624290370.5b7D.24983"
Content-Transfer-Encoding: 7bit


--15624290370.5b7D.24983
Date: Sat, 6 Jul 2019 16:03:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111076

            Bug ID: 111076
           Summary: Building error after commit b52bf8f12a
                    ("amd/common/gfx10: support new tbuffer encoding")
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: other
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: issor.oruam@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Hi,

I'm getting the following building error, even if I'm using prescribed LLVM8
and libdrm 2.4.99:

external/mesa/src/amd/common/ac_llvm_build.c:1496:45: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_8_UINT'
                case V_008F0C_BUF_DATA_FORMAT_8: format =3D
V_008F0C_IMG_FORMAT_8_UINT; break;
                                                          ^
external/mesa/src/amd/common/ac_llvm_build.c:1497:47: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_8_8_UINT'
                case V_008F0C_BUF_DATA_FORMAT_8_8: format =3D
V_008F0C_IMG_FORMAT_8_8_UINT; break;
                                                            ^
external/mesa/src/amd/common/ac_llvm_build.c:1498:51: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_8_8_8_8_UINT'
                case V_008F0C_BUF_DATA_FORMAT_8_8_8_8: format =3D
V_008F0C_IMG_FORMAT_8_8_8_8_UINT; break;
                                                                ^
external/mesa/src/amd/common/ac_llvm_build.c:1499:46: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_16_UINT'
                case V_008F0C_BUF_DATA_FORMAT_16: format =3D
V_008F0C_IMG_FORMAT_16_UINT; break;
                                                           ^
external/mesa/src/amd/common/ac_llvm_build.c:1500:49: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_16_16_UINT'
                case V_008F0C_BUF_DATA_FORMAT_16_16: format =3D
V_008F0C_IMG_FORMAT_16_16_UINT; break;
                                                              ^
external/mesa/src/amd/common/ac_llvm_build.c:1501:55: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_16_16_16_16_UINT'
                case V_008F0C_BUF_DATA_FORMAT_16_16_16_16: format =3D
V_008F0C_IMG_FORMAT_16_16_16_16_UINT; break;
                                                                    ^
external/mesa/src/amd/common/ac_llvm_build.c:1502:46: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_32_UINT'
                case V_008F0C_BUF_DATA_FORMAT_32: format =3D
V_008F0C_IMG_FORMAT_32_UINT; break;
                                                           ^
external/mesa/src/amd/common/ac_llvm_build.c:1503:49: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_32_32_UINT'
                case V_008F0C_BUF_DATA_FORMAT_32_32: format =3D
V_008F0C_IMG_FORMAT_32_32_UINT; break;
                                                              ^
external/mesa/src/amd/common/ac_llvm_build.c:1504:55: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_32_32_32_32_UINT'
                case V_008F0C_BUF_DATA_FORMAT_32_32_32_32: format =3D
V_008F0C_IMG_FORMAT_32_32_32_32_UINT; break;
                                                                    ^
9 errors generated.

Could you please check if some include is missing or what library is suppos=
ed
to provide those definitions?

Mauro

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15624290370.5b7D.24983
Date: Sat, 6 Jul 2019 16:03:57 +0000
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
   title=3D"NEW - Building error after commit b52bf8f12a (&quot;amd/common/=
gfx10: support new tbuffer encoding&quot;)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111076">111076</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Building error after commit b52bf8f12a (&quot;amd/common/gfx1=
0: support new tbuffer encoding&quot;)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>issor.oruam&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

I'm getting the following building error, even if I'm using prescribed LLVM8
and libdrm 2.4.99:

external/mesa/src/amd/common/ac_llvm_build.c:1496:45: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_8_UINT'
                case V_008F0C_BUF_DATA_FORMAT_8: format =3D
V_008F0C_IMG_FORMAT_8_UINT; break;
                                                          ^
external/mesa/src/amd/common/ac_llvm_build.c:1497:47: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_8_8_UINT'
                case V_008F0C_BUF_DATA_FORMAT_8_8: format =3D
V_008F0C_IMG_FORMAT_8_8_UINT; break;
                                                            ^
external/mesa/src/amd/common/ac_llvm_build.c:1498:51: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_8_8_8_8_UINT'
                case V_008F0C_BUF_DATA_FORMAT_8_8_8_8: format =3D
V_008F0C_IMG_FORMAT_8_8_8_8_UINT; break;
                                                                ^
external/mesa/src/amd/common/ac_llvm_build.c:1499:46: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_16_UINT'
                case V_008F0C_BUF_DATA_FORMAT_16: format =3D
V_008F0C_IMG_FORMAT_16_UINT; break;
                                                           ^
external/mesa/src/amd/common/ac_llvm_build.c:1500:49: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_16_16_UINT'
                case V_008F0C_BUF_DATA_FORMAT_16_16: format =3D
V_008F0C_IMG_FORMAT_16_16_UINT; break;
                                                              ^
external/mesa/src/amd/common/ac_llvm_build.c:1501:55: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_16_16_16_16_UINT'
                case V_008F0C_BUF_DATA_FORMAT_16_16_16_16: format =3D
V_008F0C_IMG_FORMAT_16_16_16_16_UINT; break;
                                                                    ^
external/mesa/src/amd/common/ac_llvm_build.c:1502:46: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_32_UINT'
                case V_008F0C_BUF_DATA_FORMAT_32: format =3D
V_008F0C_IMG_FORMAT_32_UINT; break;
                                                           ^
external/mesa/src/amd/common/ac_llvm_build.c:1503:49: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_32_32_UINT'
                case V_008F0C_BUF_DATA_FORMAT_32_32: format =3D
V_008F0C_IMG_FORMAT_32_32_UINT; break;
                                                              ^
external/mesa/src/amd/common/ac_llvm_build.c:1504:55: error: use of undecla=
red
identifier 'V_008F0C_IMG_FORMAT_32_32_32_32_UINT'
                case V_008F0C_BUF_DATA_FORMAT_32_32_32_32: format =3D
V_008F0C_IMG_FORMAT_32_32_32_32_UINT; break;
                                                                    ^
9 errors generated.

Could you please check if some include is missing or what library is suppos=
ed
to provide those definitions?

Mauro</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15624290370.5b7D.24983--

--===============1836328823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1836328823==--
