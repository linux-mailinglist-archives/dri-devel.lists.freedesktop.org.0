Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BBFBD614
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 03:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5AA89A56;
	Wed, 25 Sep 2019 01:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFAF189A56
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 01:20:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AB7A972162; Wed, 25 Sep 2019 01:20:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111806] VDPAU broken in radeonsi by commit
 0692ae34e939845e5185d3bdd33ddfe4afcdb995
Date: Wed, 25 Sep 2019 01:20:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: makosoft@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111806-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0118553561=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0118553561==
Content-Type: multipart/alternative; boundary="15693744491.10A44F.9240"
Content-Transfer-Encoding: 7bit


--15693744491.10A44F.9240
Date: Wed, 25 Sep 2019 01:20:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111806

            Bug ID: 111806
           Summary: VDPAU broken in radeonsi by commit
                    0692ae34e939845e5185d3bdd33ddfe4afcdb995
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: makosoft@googlemail.com
        QA Contact: dri-devel@lists.freedesktop.org

VDPAU support appears to be broken on radeonsi as of git commit
0692ae34e939845e5185d3bdd33ddfe4afcdb995 "ac: move ac_get_num_physical_sgprs
into radeon_info". Trying to play back videos using MPV 0.29.1 with it enab=
led
fails with the following error within libvdpau_radeon: "LLVM failed to comp=
ile
a shader correctly: SGPR:VGPR usage is 56:20, but the hw limit is 0:0" (or
0:256 without the subsequent commit that does the same thing with
ac_get_num_physical_vgprs). I assume that information about the limits isn't
getting set properly for some reason.

Tested with a Radeon HD 7770 on Linux 5.2 with mpv 0.29.1, ffmpeg 4.2.1, the
radeon kernel driver, and xf86-video-ati 19.0.1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693744491.10A44F.9240
Date: Wed, 25 Sep 2019 01:20:49 +0000
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
   title=3D"NEW - VDPAU broken in radeonsi by commit 0692ae34e939845e5185d3=
bdd33ddfe4afcdb995"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111806">111806</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>VDPAU broken in radeonsi by commit 0692ae34e939845e5185d3bdd3=
3ddfe4afcdb995
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
          <td>not set
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
          <td>makosoft&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>VDPAU support appears to be broken on radeonsi as of git commit
0692ae34e939845e5185d3bdd33ddfe4afcdb995 &quot;ac: move ac_get_num_physical=
_sgprs
into radeon_info&quot;. Trying to play back videos using MPV 0.29.1 with it=
 enabled
fails with the following error within libvdpau_radeon: &quot;LLVM failed to=
 compile
a shader correctly: SGPR:VGPR usage is 56:20, but the hw limit is 0:0&quot;=
 (or
0:256 without the subsequent commit that does the same thing with
ac_get_num_physical_vgprs). I assume that information about the limits isn't
getting set properly for some reason.

Tested with a Radeon HD 7770 on Linux 5.2 with mpv 0.29.1, ffmpeg 4.2.1, the
radeon kernel driver, and xf86-video-ati 19.0.1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693744491.10A44F.9240--

--===============0118553561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0118553561==--
