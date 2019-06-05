Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3CD3608B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 17:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C642E89CF3;
	Wed,  5 Jun 2019 15:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6358B89CF3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 15:49:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5B5E772167; Wed,  5 Jun 2019 15:49:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110845] [DC-only][regression] cannot select full refresh rate
 on 5.2rc - 144Hz 2560x1440
Date: Wed, 05 Jun 2019 15:49:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mcoffin13@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110845-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0851667252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0851667252==
Content-Type: multipart/alternative; boundary="15597497810.dE98D8dbE.10576"
Content-Transfer-Encoding: 7bit


--15597497810.dE98D8dbE.10576
Date: Wed, 5 Jun 2019 15:49:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110845

            Bug ID: 110845
           Summary: [DC-only][regression] cannot select full refresh rate
                    on 5.2rc - 144Hz 2560x1440
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mcoffin13@gmail.com

Somewhere between 5.1 and amd-staging-drm-next for 5.2-rc1, I stopped being
able to set my Acer XV272U 144Hz 1440p display in its 144Hz setting at
2560x1440 resolution.

1920x1080@144Hz still works.

This only happens under the display core driver. Setting amdgpu.dc=3D0 fixe=
s it,
but that is not needed on the 5.1 kernel.

I will bisect tonight when I get home and have access to my AMD card.

Card: XFX RX 590
Kernel: current AMD-staging-drm-next HEAD.

The issue occurs both in Xfce4, and in sway (wayland), so I=E2=80=99m assum=
ing that the
desktop environment has little to do with the issue.

Sorry for bad formatting on mobile, I wanted to get this in and filed with =
the
5.2 release coming up.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597497810.dE98D8dbE.10576
Date: Wed, 5 Jun 2019 15:49:41 +0000
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
   title=3D"NEW - [DC-only][regression] cannot select full refresh rate on =
5.2rc - 144Hz 2560x1440"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110845">110845</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[DC-only][regression] cannot select full refresh rate on 5.2r=
c - 144Hz 2560x1440
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
          <td>mcoffin13&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Somewhere between 5.1 and amd-staging-drm-next for 5.2-rc1, I =
stopped being
able to set my Acer XV272U 144Hz 1440p display in its 144Hz setting at
2560x1440 resolution.

1920x1080&#64;144Hz still works.

This only happens under the display core driver. Setting amdgpu.dc=3D0 fixe=
s it,
but that is not needed on the 5.1 kernel.

I will bisect tonight when I get home and have access to my AMD card.

Card: XFX RX 590
Kernel: current AMD-staging-drm-next HEAD.

The issue occurs both in Xfce4, and in sway (wayland), so I=E2=80=99m assum=
ing that the
desktop environment has little to do with the issue.

Sorry for bad formatting on mobile, I wanted to get this in and filed with =
the
5.2 release coming up.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597497810.dE98D8dbE.10576--

--===============0851667252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0851667252==--
