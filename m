Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B18A7A77
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 06:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665C289718;
	Wed,  4 Sep 2019 04:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 813FD89718
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 04:56:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 77A0C72161; Wed,  4 Sep 2019 04:56:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111555] [amdgpu/Navi] [powerplay] Failed to send message errors
Date: Wed, 04 Sep 2019 04:56:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111555-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1052519277=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1052519277==
Content-Type: multipart/alternative; boundary="15675730040.Af74d.23195"
Content-Transfer-Encoding: 7bit


--15675730040.Af74d.23195
Date: Wed, 4 Sep 2019 04:56:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111555

            Bug ID: 111555
           Summary: [amdgpu/Navi] [powerplay] Failed to send message
                    errors
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: shtetldik@gmail.com

I get periodic errors like this in dmesg, which coincides with intermittent
system stalls:

    [Wed Sep  4 00:43:43 2019] amdgpu: [powerplay] Failed to send message 0=
x12,
response 0xfffffffb param 0x6
    [Wed Sep  4 00:43:43 2019] amdgpu: [powerplay] Failed to export SMU met=
rics
table!
    [Wed Sep  4 00:44:53 2019] amdgpu: [powerplay] Failed to send message 0=
xe,
response 0xfffffffb, param 0x80
    [Wed Sep  4 00:44:53 2019] amdgpu: [powerplay] Failed to send message 0=
xf,
response 0xfffffffb, param 0xa90000
    [Wed Sep  4 00:45:30 2019] amdgpu: [powerplay] Failed to send message 0=
x12,
response 0xfffffffb, param 0x6
    [Wed Sep  4 00:45:35 2019] amdgpu: [powerplay] Failed to send message 0=
x12,
response 0xfffffffb param 0x6
    [Wed Sep  4 00:45:35 2019] amdgpu: [powerplay] Failed to export SMU met=
rics
table!

I'm running kernel 5.3-rc7
GPU: Sapphire Pulse RX 5700XT (Navi 10) with firmware from=20
https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/
Distro: Debian testing / KDE.

I noticed, that it starts happening often when I'm using ksysguard, which
queries lm-sensors for amdgpu temperature and fan speed.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15675730040.Af74d.23195
Date: Wed, 4 Sep 2019 04:56:44 +0000
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
   title=3D"NEW - [amdgpu/Navi] [powerplay] Failed to send message errors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111555">111555</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[amdgpu/Navi] [powerplay] Failed to send message errors
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
          <td>shtetldik&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I get periodic errors like this in dmesg, which coincides with=
 intermittent
system stalls:

    [Wed Sep  4 00:43:43 2019] amdgpu: [powerplay] Failed to send message 0=
x12,
response 0xfffffffb param 0x6
    [Wed Sep  4 00:43:43 2019] amdgpu: [powerplay] Failed to export SMU met=
rics
table!
    [Wed Sep  4 00:44:53 2019] amdgpu: [powerplay] Failed to send message 0=
xe,
response 0xfffffffb, param 0x80
    [Wed Sep  4 00:44:53 2019] amdgpu: [powerplay] Failed to send message 0=
xf,
response 0xfffffffb, param 0xa90000
    [Wed Sep  4 00:45:30 2019] amdgpu: [powerplay] Failed to send message 0=
x12,
response 0xfffffffb, param 0x6
    [Wed Sep  4 00:45:35 2019] amdgpu: [powerplay] Failed to send message 0=
x12,
response 0xfffffffb param 0x6
    [Wed Sep  4 00:45:35 2019] amdgpu: [powerplay] Failed to export SMU met=
rics
table!

I'm running kernel 5.3-rc7
GPU: Sapphire Pulse RX 5700XT (Navi 10) with firmware from=20
<a href=3D"https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/">http=
s://people.freedesktop.org/~agd5f/radeon_ucode/navi10/</a>
Distro: Debian testing / KDE.

I noticed, that it starts happening often when I'm using ksysguard, which
queries lm-sensors for amdgpu temperature and fan speed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15675730040.Af74d.23195--

--===============1052519277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1052519277==--
