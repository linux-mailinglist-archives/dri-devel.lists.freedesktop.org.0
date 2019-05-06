Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4A814452
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 07:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478FA8920F;
	Mon,  6 May 2019 05:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8DF538920F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 05:53:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8352D7215A; Mon,  6 May 2019 05:53:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110616] vce module in h264 encode
Date: Mon, 06 May 2019 05:53:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: baopeng88_com@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110616-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1001860626=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1001860626==
Content-Type: multipart/alternative; boundary="15571219800.aE88.26404"
Content-Transfer-Encoding: 7bit


--15571219800.aE88.26404
Date: Mon, 6 May 2019 05:53:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110616

            Bug ID: 110616
           Summary: vce module in h264 encode
           Product: DRI
           Version: DRI git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/Radeon
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: baopeng88_com@163.com

We have a playback problem in the vce module of the amd graphics card, when
using libva for h264 encoding, the field of pic_order_cnt_type in sps suppo=
rts
other options besides 0? Includes 1 or 2 and so on.
      Pic_order_cnt_type specifies the encoding method for poc (picture ord=
er
count), and poc identifies the playback order of the images. The poc can be
calculated from the frame-num through the mapping relationship, or it can be
explicitly transmitted by the encoder.
      When pic_order_cnt_type =3D 2, the POC calculation method relies on t=
he
least extra parameters (can save the number of bits in the slice header), a=
nd
it can only get the serial number of the top and bottom fields according to
frame_num. We need to play it quickly in this way.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571219800.aE88.26404
Date: Mon, 6 May 2019 05:53:00 +0000
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
   title=3D"NEW - vce module in h264 encode"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110616">110616</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>vce module in h264 encode
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
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
          <td>DRM/Radeon
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>baopeng88_com&#64;163.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>We have a playback problem in the vce module of the amd graphi=
cs card, when
using libva for h264 encoding, the field of pic_order_cnt_type in sps suppo=
rts
other options besides 0? Includes 1 or 2 and so on.
      Pic_order_cnt_type specifies the encoding method for poc (picture ord=
er
count), and poc identifies the playback order of the images. The poc can be
calculated from the frame-num through the mapping relationship, or it can be
explicitly transmitted by the encoder.
      When pic_order_cnt_type =3D 2, the POC calculation method relies on t=
he
least extra parameters (can save the number of bits in the slice header), a=
nd
it can only get the serial number of the top and bottom fields according to
frame_num. We need to play it quickly in this way.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571219800.aE88.26404--

--===============1001860626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1001860626==--
