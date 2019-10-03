Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CA5C9834
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 08:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58BD6E207;
	Thu,  3 Oct 2019 06:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D52F6E207
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 06:25:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8A5C672162; Thu,  3 Oct 2019 06:25:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111889] Severe glitches in cinnamon/gnome3 affecting small
 rectangular areas (menus, dialogs)
Date: Thu, 03 Oct 2019 06:25:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: sdiconov@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111889-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0649375048=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0649375048==
Content-Type: multipart/alternative; boundary="15700839321.c4a4AF9C.16114"
Content-Transfer-Encoding: 7bit


--15700839321.c4a4AF9C.16114
Date: Thu, 3 Oct 2019 06:25:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111889

            Bug ID: 111889
           Summary: Severe glitches in cinnamon/gnome3 affecting small
                    rectangular areas (menus, dialogs)
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/Radeon
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: sdiconov@mail.ru

Created attachment 145618
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145618&action=3Dedit
Unreadable file copy dialog (cinnamon filemanager)

I witness a gradually developing regression that results in increasingly na=
sty
graphical glitches in the cinnamon and gnome3 desktop environments. It has
reached the point when it becomes impossible to see, what GUI button or menu
item you are clicking, which makes the whole desktop unusable.

The bug affects relatively small rectangular areas containing individual GUI
elements. See attached screenshots.=20
* Dialogs that are close to a square in shape are less likely to be garbled,
Wider dialogs look worse.
* The bug disappears immediately if I run a different desktop compositor us=
ing
commands like "compiz --replace".

Affected DE-s:=20
- Cinnamon  (strong)
- Gnome3 (less)

Not affected DEs|WMs:
- mate
- muffin (cinnamon wm run independently of its DE)
- compiz

KDE not tested by me.

My hardware and kernel:
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] T=
urks
XT [Radeon HD 6670/7670]
Linux kernel 4.19.72, radeon.ko driver=20

The regression started with small systray icons, than it spread to hint and
notification boxes. Since about a week ago (my latest update) it affects me=
nus
and dialog boxes as well. The same dialogs that become ureadable in cinnamon
may look normal in gnome3 (without normal wm titlebar).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700839321.c4a4AF9C.16114
Date: Thu, 3 Oct 2019 06:25:32 +0000
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
   title=3D"NEW - Severe glitches in cinnamon/gnome3 affecting small rectan=
gular areas (menus, dialogs)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111889">111889</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Severe glitches in cinnamon/gnome3 affecting small rectangula=
r areas (menus, dialogs)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>sdiconov&#64;mail.ru
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145618=
" name=3D"attach_145618" title=3D"Unreadable file copy dialog (cinnamon fil=
emanager)">attachment 145618</a> <a href=3D"attachment.cgi?id=3D145618&amp;=
action=3Dedit" title=3D"Unreadable file copy dialog (cinnamon filemanager)"=
>[details]</a></span>
Unreadable file copy dialog (cinnamon filemanager)

I witness a gradually developing regression that results in increasingly na=
sty
graphical glitches in the cinnamon and gnome3 desktop environments. It has
reached the point when it becomes impossible to see, what GUI button or menu
item you are clicking, which makes the whole desktop unusable.

The bug affects relatively small rectangular areas containing individual GUI
elements. See attached screenshots.=20
* Dialogs that are close to a square in shape are less likely to be garbled,
Wider dialogs look worse.
* The bug disappears immediately if I run a different desktop compositor us=
ing
commands like &quot;compiz --replace&quot;.

Affected DE-s:=20
- Cinnamon  (strong)
- Gnome3 (less)

Not affected DEs|WMs:
- mate
- muffin (cinnamon wm run independently of its DE)
- compiz

KDE not tested by me.

My hardware and kernel:
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] T=
urks
XT [Radeon HD 6670/7670]
Linux kernel 4.19.72, radeon.ko driver=20

The regression started with small systray icons, than it spread to hint and
notification boxes. Since about a week ago (my latest update) it affects me=
nus
and dialog boxes as well. The same dialogs that become ureadable in cinnamon
may look normal in gnome3 (without normal wm titlebar).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700839321.c4a4AF9C.16114--

--===============0649375048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0649375048==--
