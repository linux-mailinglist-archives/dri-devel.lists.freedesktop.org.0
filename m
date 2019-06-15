Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2746FC3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 13:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDBE8933E;
	Sat, 15 Jun 2019 11:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42B7C8933E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 11:18:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0E7FC72167; Sat, 15 Jun 2019 11:18:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110924] Alien: Isolation - Flashing squares in upper half of
 screen when HDAO enabled
Date: Sat, 15 Jun 2019 11:18:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chewi@gentoo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110924-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1777609047=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1777609047==
Content-Type: multipart/alternative; boundary="15605975010.B7eef8.6943"
Content-Transfer-Encoding: 7bit


--15605975010.B7eef8.6943
Date: Sat, 15 Jun 2019 11:18:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110924

            Bug ID: 110924
           Summary: Alien: Isolation - Flashing squares in upper half of
                    screen when HDAO enabled
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: chewi@gentoo.org
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144551
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144551&action=3Dedit
Screenshot showing artifacts

This game worked perfectly for me around a year ago. Now it shows strange
flashing/moving mostly black squares in the upper half of the screen when H=
DAO
is enabled. Please see the attached screenshot. It looks worse when you mov=
e.
Choosing "standard" SSAO instead makes the problem go away.

I'm not alone, here is another Steam user reporting the same thing:
https://steamcommunity.com/app/214490/discussions/0/1735468061769831062/

Here are my system details:
OpenGL vendor string: X.Org
OpenGL renderer string: AMD Radeon (TM) RX 480 Graphics (POLARIS10, DRM 3.3=
0.0,
5.1.10-00004-g8b7bb440229b, LLVM 8.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-749c544b84)
OpenGL core profile shading language version string: 4.50

It still happens with Mesa as far back as 18.2.0. Anything earlier just cra=
shes
on my system but the other user reported he was using 18.1.9. I have tried
against LLVM 6, 7, and 8 with no change. I have also booted into a Fedora 28
Live USB system, chrooted into my Gentoo system, and it still happens. It's
possibly down a change in the game itself although I can't verify that and I
don't think it's seeing many changes these days.

Sorry if I've assigned this to the wrong component but it's hard to say whe=
re
the problem lies.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605975010.B7eef8.6943
Date: Sat, 15 Jun 2019 11:18:21 +0000
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
   title=3D"NEW - Alien: Isolation - Flashing squares in upper half of scre=
en when HDAO enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110924">110924</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Alien: Isolation - Flashing squares in upper half of screen w=
hen HDAO enabled
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
          <td>chewi&#64;gentoo.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144551=
" name=3D"attach_144551" title=3D"Screenshot showing artifacts">attachment =
144551</a> <a href=3D"attachment.cgi?id=3D144551&amp;action=3Dedit" title=
=3D"Screenshot showing artifacts">[details]</a></span>
Screenshot showing artifacts

This game worked perfectly for me around a year ago. Now it shows strange
flashing/moving mostly black squares in the upper half of the screen when H=
DAO
is enabled. Please see the attached screenshot. It looks worse when you mov=
e.
Choosing &quot;standard&quot; SSAO instead makes the problem go away.

I'm not alone, here is another Steam user reporting the same thing:
<a href=3D"https://steamcommunity.com/app/214490/discussions/0/173546806176=
9831062/">https://steamcommunity.com/app/214490/discussions/0/1735468061769=
831062/</a>

Here are my system details:
OpenGL vendor string: X.Org
OpenGL renderer string: AMD Radeon (TM) RX 480 Graphics (POLARIS10, DRM 3.3=
0.0,
5.1.10-00004-g8b7bb440229b, LLVM 8.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-749c544b84)
OpenGL core profile shading language version string: 4.50

It still happens with Mesa as far back as 18.2.0. Anything earlier just cra=
shes
on my system but the other user reported he was using 18.1.9. I have tried
against LLVM 6, 7, and 8 with no change. I have also booted into a Fedora 28
Live USB system, chrooted into my Gentoo system, and it still happens. It's
possibly down a change in the game itself although I can't verify that and I
don't think it's seeing many changes these days.

Sorry if I've assigned this to the wrong component but it's hard to say whe=
re
the problem lies.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605975010.B7eef8.6943--

--===============1777609047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1777609047==--
