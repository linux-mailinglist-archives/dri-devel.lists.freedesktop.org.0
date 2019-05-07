Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1901648E
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 15:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162016E7D9;
	Tue,  7 May 2019 13:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 79AEB6E7D8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 13:29:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 65B44721AA; Tue,  7 May 2019 13:29:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110635] briefly flashing corruption when playing various OGL
 games
Date: Tue, 07 May 2019 13:29:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110635-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0775546478=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0775546478==
Content-Type: multipart/alternative; boundary="15572357731.52e0efFd.5010"
Content-Transfer-Encoding: 7bit


--15572357731.52e0efFd.5010
Date: Tue, 7 May 2019 13:29:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110635

            Bug ID: 110635
           Summary: briefly flashing corruption when playing various OGL
                    games
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: tempel.julian@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

I'm seeing briefly flashing corruption in various OGL games, mostly Dying L=
ight
and Counter-Strike Global Offensive Danger Zone. But I once also saw it in
X-Plane 11.
Happens with Mesa 18 and git and llvm 8 and git, but likely also even older
versions in both cases.

I was able to capture it by recording a video and then extracting an affect=
ed
frame:
https://abload.de/img/mpv-shot0001hkjyr.png

Across the aforementioned games, the artifacts look akin or the same. Can a=
lso
be brighter squares though.

Hardware issue is unlikely, as radv / amdvlk never show this issue (and Win=
dows
driver neither).

I fail to see a pattern when this corruption occurs, it seems like total ch=
ance
to me while gaming.

This is with an RX 580 on Arch.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15572357731.52e0efFd.5010
Date: Tue, 7 May 2019 13:29:33 +0000
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
   title=3D"NEW - briefly flashing corruption when playing various OGL game=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110635">110635</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>briefly flashing corruption when playing various OGL games
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
          <td>tempel.julian&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm seeing briefly flashing corruption in various OGL games, m=
ostly Dying Light
and Counter-Strike Global Offensive Danger Zone. But I once also saw it in
X-Plane 11.
Happens with Mesa 18 and git and llvm 8 and git, but likely also even older
versions in both cases.

I was able to capture it by recording a video and then extracting an affect=
ed
frame:
<a href=3D"https://abload.de/img/mpv-shot0001hkjyr.png">https://abload.de/i=
mg/mpv-shot0001hkjyr.png</a>

Across the aforementioned games, the artifacts look akin or the same. Can a=
lso
be brighter squares though.

Hardware issue is unlikely, as radv / amdvlk never show this issue (and Win=
dows
driver neither).

I fail to see a pattern when this corruption occurs, it seems like total ch=
ance
to me while gaming.

This is with an RX 580 on Arch.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15572357731.52e0efFd.5010--

--===============0775546478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0775546478==--
