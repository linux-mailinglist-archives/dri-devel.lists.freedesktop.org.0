Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F2699A1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 19:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC1D89269;
	Mon, 15 Jul 2019 17:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02A4889269
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 17:19:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ED56172167; Mon, 15 Jul 2019 17:19:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111139] linux 5.2: rare NULL pointer dereference when SteamVR
 idles
Date: Mon, 15 Jul 2019 17:19:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haagch@frickel.club
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111139-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0905185921=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0905185921==
Content-Type: multipart/alternative; boundary="15632111750.E97b1be.19759"
Content-Transfer-Encoding: 7bit


--15632111750.E97b1be.19759
Date: Mon, 15 Jul 2019 17:19:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111139

            Bug ID: 111139
           Summary: linux 5.2: rare NULL pointer dereference when SteamVR
                    idles
           Product: DRI
           Version: DRI git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: haagch@frickel.club

Created attachment 144791
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144791&action=3Dedit
dmesg with null pointer dereference

Vega 64, mesa git b68778e6de2, Linux 5.2.

I am relatively sure this started happening with linux 5.2 and that this did
not happen on 5.1.

When SteamVR is idle for a while (i.e. the VR headset is not moved), it sto=
ps
rendering to not waste resources.

When it does this, there is a chance that a kernel bug happens, see attached
dmesg.

It does not happen very often, but often enough that I'm relatively sure it
started happening with 5.2.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15632111750.E97b1be.19759
Date: Mon, 15 Jul 2019 17:19:35 +0000
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
   title=3D"NEW - linux 5.2: rare NULL pointer dereference when SteamVR idl=
es"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111139">111139</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>linux 5.2: rare NULL pointer dereference when SteamVR idles
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
          <td>haagch&#64;frickel.club
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144791=
" name=3D"attach_144791" title=3D"dmesg with null pointer dereference">atta=
chment 144791</a> <a href=3D"attachment.cgi?id=3D144791&amp;action=3Dedit" =
title=3D"dmesg with null pointer dereference">[details]</a></span>
dmesg with null pointer dereference

Vega 64, mesa git b68778e6de2, Linux 5.2.

I am relatively sure this started happening with linux 5.2 and that this did
not happen on 5.1.

When SteamVR is idle for a while (i.e. the VR headset is not moved), it sto=
ps
rendering to not waste resources.

When it does this, there is a chance that a kernel bug happens, see attached
dmesg.

It does not happen very often, but often enough that I'm relatively sure it
started happening with 5.2.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15632111750.E97b1be.19759--

--===============0905185921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0905185921==--
