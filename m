Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A36A2C157
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BDE89CB2;
	Tue, 28 May 2019 08:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A0FE89C94
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:30:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 96D3D72167; Tue, 28 May 2019 08:30:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110780] RX 580 and 5K displays, bandwidth validation failed
 with multiple monitors
Date: Tue, 28 May 2019 08:30:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: linuzel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110780-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1538940038=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1538940038==
Content-Type: multipart/alternative; boundary="15590322231.aFDF3.22557"
Content-Transfer-Encoding: 7bit


--15590322231.aFDF3.22557
Date: Tue, 28 May 2019 08:30:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110780

            Bug ID: 110780
           Summary: RX 580 and 5K displays, bandwidth validation failed
                    with multiple monitors
           Product: DRI
           Version: unspecified
          Hardware: All
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: linuzel@gmail.com

I have been facing an issue with my 5K display (iiyama ProLite XB2779QQS-S1=
).

It works fine as long as it is the only active monitor, as soon as I activa=
te
another monitor the main one (5k) can't display more than 4k.

Debug using "echo 0x4 > /sys/module/drm/parameters/debug" show this :
mai 23 09:01:22 bureau-gael /usr/lib/gdm3/gdm-x-session[3465]: (EE) AMDGPU(=
0):
failed to set mode: Invalid argument
mai 23 09:01:22 bureau-gael kernel: [drm:dce112_validate_bandwidth [amdgpu]]
dce112_validate_bandwidth: Bandwidth validation failed!

I disabled the check by forcing is_display_configuration_supported to return
true in dce_calcs.c and it works fine.

I tried a lot of kernel (includig drm-tip and 5.2-rc1) and they all have the
same issue.
My custom kernel with no validation is based on Ubuntu's 5.0.0-15-generic.

If I can help by providing more logs or test something ask and I will do my
best.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590322231.aFDF3.22557
Date: Tue, 28 May 2019 08:30:23 +0000
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
   title=3D"NEW - RX 580 and 5K displays, bandwidth validation failed with =
multiple monitors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110780">110780</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>RX 580 and 5K displays, bandwidth validation failed with mult=
iple monitors
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
          <td>All
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
          <td>linuzel&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have been facing an issue with my 5K display (iiyama ProLite=
 XB2779QQS-S1).

It works fine as long as it is the only active monitor, as soon as I activa=
te
another monitor the main one (5k) can't display more than 4k.

Debug using &quot;echo 0x4 &gt; /sys/module/drm/parameters/debug&quot; show=
 this :
mai 23 09:01:22 bureau-gael /usr/lib/gdm3/gdm-x-session[3465]: (EE) AMDGPU(=
0):
failed to set mode: Invalid argument
mai 23 09:01:22 bureau-gael kernel: [drm:dce112_validate_bandwidth [amdgpu]]
dce112_validate_bandwidth: Bandwidth validation failed!

I disabled the check by forcing is_display_configuration_supported to return
true in dce_calcs.c and it works fine.

I tried a lot of kernel (includig drm-tip and 5.2-rc1) and they all have the
same issue.
My custom kernel with no validation is based on Ubuntu's 5.0.0-15-generic.

If I can help by providing more logs or test something ask and I will do my
best.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590322231.aFDF3.22557--

--===============1538940038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1538940038==--
