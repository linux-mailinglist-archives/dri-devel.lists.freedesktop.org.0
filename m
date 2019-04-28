Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1179CB5C4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2019 11:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09F78915B;
	Sun, 28 Apr 2019 09:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E019B8915B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2019 09:14:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D2C687215F; Sun, 28 Apr 2019 09:14:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110538] [drm:r600_ring_test [radeon]] *ERROR* radeon: ring 0
 test failed (scratch(0x850C)=0xCAFEDEAD)
Date: Sun, 28 Apr 2019 09:14:22 +0000
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
 attachments.created
Message-ID: <bug-110538-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0695841025=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0695841025==
Content-Type: multipart/alternative; boundary="15564428620.B9674C2B.27396"
Content-Transfer-Encoding: 7bit


--15564428620.B9674C2B.27396
Date: Sun, 28 Apr 2019 09:14:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110538

            Bug ID: 110538
           Summary: [drm:r600_ring_test [radeon]] *ERROR* radeon: ring 0
                    test failed (scratch(0x850C)=3D0xCAFEDEAD)
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

Created attachment 144102
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144102&action=3Dedit
gpu-reset-dmesg

We want to reset the radeon gpu. When we have reset, the following print wi=
ll
appear. And the screen is screened, how can I fix this problem. Thank you=
=E3=80=82

[  415.343591] radeon 0000:01:00.0: WB enabled
[  415.347801] radeon 0000:01:00.0: fence driver on ring 0 use gpu addr
0x0000000080000c00 and cpu addr 0xffff8021dcba0c00
[  415.358637] radeon 0000:01:00.0: fence driver on ring 1 use gpu addr
0x0000000080000c04 and cpu addr 0xffff8021dcba0c04
[  415.369471] radeon 0000:01:00.0: fence driver on ring 2 use gpu addr
0x0000000080000c08 and cpu addr 0xffff8021dcba0c08
[  415.380304] radeon 0000:01:00.0: fence driver on ring 3 use gpu addr
0x0000000080000c0c and cpu addr 0xffff8021dcba0c0c
[  415.391138] radeon 0000:01:00.0: fence driver on ring 4 use gpu addr
0x0000000080000c10 and cpu addr 0xffff8021dcba0c10
[  415.403381] radeon 0000:01:00.0: fence driver on ring 5 use gpu addr
0x0000000000075a18 and cpu addr 0xffff000014e35a18
[  415.515380] radeon 0000:01:00.0: failed VCE resume (-110).
[  415.860855] [drm:r600_ring_test [radeon]] *ERROR* radeon: ring 0 test fa=
iled
(scratch(0x850C)=3D0xCAFEDEAD)
[  415.870585] [drm:si_resume [radeon]] *ERROR* si startup failed on resume

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15564428620.B9674C2B.27396
Date: Sun, 28 Apr 2019 09:14:22 +0000
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
   title=3D"NEW - [drm:r600_ring_test [radeon]] *ERROR* radeon: ring 0 test=
 failed (scratch(0x850C)=3D0xCAFEDEAD)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110538">110538</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[drm:r600_ring_test [radeon]] *ERROR* radeon: ring 0 test fai=
led (scratch(0x850C)=3D0xCAFEDEAD)
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144102=
" name=3D"attach_144102" title=3D"gpu-reset-dmesg">attachment 144102</a> <a=
 href=3D"attachment.cgi?id=3D144102&amp;action=3Dedit" title=3D"gpu-reset-d=
mesg">[details]</a></span>
gpu-reset-dmesg

We want to reset the radeon gpu. When we have reset, the following print wi=
ll
appear. And the screen is screened, how can I fix this problem. Thank you=
=E3=80=82

[  415.343591] radeon 0000:01:00.0: WB enabled
[  415.347801] radeon 0000:01:00.0: fence driver on ring 0 use gpu addr
0x0000000080000c00 and cpu addr 0xffff8021dcba0c00
[  415.358637] radeon 0000:01:00.0: fence driver on ring 1 use gpu addr
0x0000000080000c04 and cpu addr 0xffff8021dcba0c04
[  415.369471] radeon 0000:01:00.0: fence driver on ring 2 use gpu addr
0x0000000080000c08 and cpu addr 0xffff8021dcba0c08
[  415.380304] radeon 0000:01:00.0: fence driver on ring 3 use gpu addr
0x0000000080000c0c and cpu addr 0xffff8021dcba0c0c
[  415.391138] radeon 0000:01:00.0: fence driver on ring 4 use gpu addr
0x0000000080000c10 and cpu addr 0xffff8021dcba0c10
[  415.403381] radeon 0000:01:00.0: fence driver on ring 5 use gpu addr
0x0000000000075a18 and cpu addr 0xffff000014e35a18
[  415.515380] radeon 0000:01:00.0: failed VCE resume (-110).
[  415.860855] [drm:r600_ring_test [radeon]] *ERROR* radeon: ring 0 test fa=
iled
(scratch(0x850C)=3D0xCAFEDEAD)
[  415.870585] [drm:si_resume [radeon]] *ERROR* si startup failed on resume=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15564428620.B9674C2B.27396--

--===============0695841025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0695841025==--
