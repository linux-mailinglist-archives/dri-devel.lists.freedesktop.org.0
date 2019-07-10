Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57F6432C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3936E062;
	Wed, 10 Jul 2019 07:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E5B06E062
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:58:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3B3D672167; Wed, 10 Jul 2019 07:58:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111099] Green video when playing a hevc video with vdpau
Date: Wed, 10 Jul 2019 07:58:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111099-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0950250077=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0950250077==
Content-Type: multipart/alternative; boundary="15627454881.1f6c.7149"
Content-Transfer-Encoding: 7bit


--15627454881.1f6c.7149
Date: Wed, 10 Jul 2019 07:58:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111099

            Bug ID: 111099
           Summary: Green video when playing a hevc video with vdpau
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: pierre-eric.pelloux-prayer@amd.com
        QA Contact: dri-devel@lists.freedesktop.org

On AMD hardware (at least Polaris and Raven), playing some videos with vdpau
can result in a green screen.

Steps to reproduce:
- download https://www.libde265.org/hevc-bitstreams/bbb-1920x1080-cfg02.mkv
- use x11 (ie not wayland)
- mpv --vo=3Dopengl --hwdec=3Dvdpau bbb-1920x1080-cfg02.mkv

This is a regression that started with commit:
cb446dc0fa5c68f681108f4613560543aa4cf553 (from MR
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1226)

Reverting the commits from this MR on master fixes the issue.

AFAIU the problem is this line:

   /* do we have different screen objects ? */
   if (res->screen !=3D st->pipe->screen) {
      _mesa_error(ctx, GL_INVALID_OPERATION, "VDPAUMapSurfacesNV")

Before this MR the screen objects were identical but now there are differen=
t.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15627454881.1f6c.7149
Date: Wed, 10 Jul 2019 07:58:08 +0000
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
   title=3D"NEW - Green video when playing a hevc video with vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111099">111099</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Green video when playing a hevc video with vdpau
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
          <td>pierre-eric.pelloux-prayer&#64;amd.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>On AMD hardware (at least Polaris and Raven), playing some vid=
eos with vdpau
can result in a green screen.

Steps to reproduce:
- download <a href=3D"https://www.libde265.org/hevc-bitstreams/bbb-1920x108=
0-cfg02.mkv">https://www.libde265.org/hevc-bitstreams/bbb-1920x1080-cfg02.m=
kv</a>
- use x11 (ie not wayland)
- mpv --vo=3Dopengl --hwdec=3Dvdpau bbb-1920x1080-cfg02.mkv

This is a regression that started with commit:
cb446dc0fa5c68f681108f4613560543aa4cf553 (from MR
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1226">ht=
tps://gitlab.freedesktop.org/mesa/mesa/merge_requests/1226</a>)

Reverting the commits from this MR on master fixes the issue.

AFAIU the problem is this line:

   /* do we have different screen objects ? */
   if (res-&gt;screen !=3D st-&gt;pipe-&gt;screen) {
      _mesa_error(ctx, GL_INVALID_OPERATION, &quot;VDPAUMapSurfacesNV&quot;)

Before this MR the screen objects were identical but now there are differen=
t.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15627454881.1f6c.7149--

--===============0950250077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0950250077==--
