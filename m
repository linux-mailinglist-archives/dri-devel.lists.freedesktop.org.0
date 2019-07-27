Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83FA77B67
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 21:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DF56EEC4;
	Sat, 27 Jul 2019 19:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 448EF6EEC4
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 19:08:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0B51C72167; Sat, 27 Jul 2019 19:08:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111235] radeonsi_drv_video.so should report support for packed
 headers
Date: Sat, 27 Jul 2019 19:08:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oreaus@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111235-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0695916004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0695916004==
Content-Type: multipart/alternative; boundary="15642544910.2363Aa.31232"
Content-Transfer-Encoding: 7bit


--15642544910.2363Aa.31232
Date: Sat, 27 Jul 2019 19:08:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111235

            Bug ID: 111235
           Summary: radeonsi_drv_video.so should report support for packed
                    headers
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: oreaus@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144894
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144894&action=3Dedit
Proposed fix for mkv with vaapi

Trying to encode using vaapi fails if the container is mkv. Changing the ou=
tput
format to .mp4 in the command works.

How to reproduce:

`ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i input.mp4 -vf
'hwupload' -vcodec h264_vaapi -bf 0 output.mkv`

Output:

`Could not write header for output file #0 (incorrect codec parameters ?):
Invalid data found when processing input
Error initializing output stream 0:0 --=20
Conversion failed!`

Expected:

Works without error.

Proposed:

Patch attached.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642544910.2363Aa.31232
Date: Sat, 27 Jul 2019 19:08:11 +0000
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
   title=3D"NEW - radeonsi_drv_video.so should report support for packed he=
aders"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111235">111235</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>radeonsi_drv_video.so should report support for packed headers
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
          <td>oreaus&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144894=
" name=3D"attach_144894" title=3D"Proposed fix for mkv with vaapi">attachme=
nt 144894</a> <a href=3D"attachment.cgi?id=3D144894&amp;action=3Dedit" titl=
e=3D"Proposed fix for mkv with vaapi">[details]</a></span> <a href=3D'page.=
cgi?id=3Dsplinter.html&amp;bug=3D111235&amp;attachment=3D144894'>[review]</=
a>
Proposed fix for mkv with vaapi

Trying to encode using vaapi fails if the container is mkv. Changing the ou=
tput
format to .mp4 in the command works.

How to reproduce:

`ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i input.mp4 -vf
'hwupload' -vcodec h264_vaapi -bf 0 output.mkv`

Output:

`Could not write header for output file #0 (incorrect codec parameters ?):
Invalid data found when processing input
Error initializing output stream 0:0 --=20
Conversion failed!`

Expected:

Works without error.

Proposed:

Patch attached.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642544910.2363Aa.31232--

--===============0695916004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0695916004==--
