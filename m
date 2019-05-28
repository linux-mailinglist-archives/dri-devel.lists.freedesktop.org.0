Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580692D16E
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 00:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD0A89DA6;
	Tue, 28 May 2019 22:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E31489DA6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 22:24:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 04BF772167; Tue, 28 May 2019 22:24:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110787] Glitches in console of the Julia language plugin for
 Atom (Juno)
Date: Tue, 28 May 2019 22:24:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: develop@manuel-voegele.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110787-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0496490925=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0496490925==
Content-Type: multipart/alternative; boundary="15590822680.80788d.18776"
Content-Transfer-Encoding: 7bit


--15590822680.80788d.18776
Date: Tue, 28 May 2019 22:24:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110787

            Bug ID: 110787
           Summary: Glitches in console of the Julia language plugin for
                    Atom (Juno)
           Product: Mesa
           Version: 19.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: develop@manuel-voegele.de
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144366
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144366&action=3Dedit
A screenshot showing the graphical artifacts in the console

Since Mesa 19.0.5 the REPL-Console in the Julia language plugin is unusable=
 and
often shows artifacts. Mesa 19.0.4 seems not to be affectd by this.

Steps to reproduce:
1. Install the Atom and the Julia language plugin (Juno) according to this
gude: http://docs.junolab.org/latest/man/installation/
During the installation agree to open julia specific views by default.
2. Open up atom. A console windows should appear on the bottom.
3. Click around (switching between clicks in the console, in the editor and=
 in
windows that don't belong to atom). This usually causes graphical glitches =
to
appear in the Julia console (REPL). If this doesn't happen try using the
console - I am usually unable to use it since even if it doesn't get filled
with artifacts it still won't render properly which makes it unusable.

I've attached a screenshot of the broken console.

I'm using Arch Linux with KDE Plasma as desktop environment.

Unfortunately I'm unable to provide an apitrace since runnign atom with
apitrace caused the bug to disappear.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590822680.80788d.18776
Date: Tue, 28 May 2019 22:24:28 +0000
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
   title=3D"NEW - Glitches in console of the Julia language plugin for Atom=
 (Juno)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110787">110787</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Glitches in console of the Julia language plugin for Atom (Ju=
no)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.0
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
          <td>develop&#64;manuel-voegele.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144366=
" name=3D"attach_144366" title=3D"A screenshot showing the graphical artifa=
cts in the console">attachment 144366</a> <a href=3D"attachment.cgi?id=3D14=
4366&amp;action=3Dedit" title=3D"A screenshot showing the graphical artifac=
ts in the console">[details]</a></span>
A screenshot showing the graphical artifacts in the console

Since Mesa 19.0.5 the REPL-Console in the Julia language plugin is unusable=
 and
often shows artifacts. Mesa 19.0.4 seems not to be affectd by this.

Steps to reproduce:
1. Install the Atom and the Julia language plugin (Juno) according to this
gude: <a href=3D"http://docs.junolab.org/latest/man/installation/">http://d=
ocs.junolab.org/latest/man/installation/</a>
During the installation agree to open julia specific views by default.
2. Open up atom. A console windows should appear on the bottom.
3. Click around (switching between clicks in the console, in the editor and=
 in
windows that don't belong to atom). This usually causes graphical glitches =
to
appear in the Julia console (REPL). If this doesn't happen try using the
console - I am usually unable to use it since even if it doesn't get filled
with artifacts it still won't render properly which makes it unusable.

I've attached a screenshot of the broken console.

I'm using Arch Linux with KDE Plasma as desktop environment.

Unfortunately I'm unable to provide an apitrace since runnign atom with
apitrace caused the bug to disappear.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590822680.80788d.18776--

--===============0496490925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0496490925==--
