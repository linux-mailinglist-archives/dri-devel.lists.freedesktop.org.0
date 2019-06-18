Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F043D4A439
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 16:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8728E6E1E2;
	Tue, 18 Jun 2019 14:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCD776E1E2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:42:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DA0F172167; Tue, 18 Jun 2019 14:42:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110944] [Bisected] Blender 2.8 crashes when closing certain
 windows
Date: Tue, 18 Jun 2019 14:42:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: darkdefende@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110944-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1486981731=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1486981731==
Content-Type: multipart/alternative; boundary="15608689561.8A2400.26728"
Content-Transfer-Encoding: 7bit


--15608689561.8A2400.26728
Date: Tue, 18 Jun 2019 14:42:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110944

            Bug ID: 110944
           Summary: [Bisected] Blender 2.8 crashes when closing certain
                    windows
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: darkdefende@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144589
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144589&action=3Dedit
Git bisect log

I'm running wayland/swaywm with two Vega 64s.
After I upgraded to mesa 19.1 I noticed that Blender 2.8 would crash when
closing certain windows (and only when it would trigger a resize of the
remaining Blender windows).

Blender bug here: https://developer.blender.org/T65903

I noticed that this wasn't the case with mesa 19.0.6 so I bisected and it s=
eems
like this commit is the cause of the crashing:

593e36f9561d3665cc12ed1fc8a07dd8612c004e

I also tested the latest mesa git master, and the crash still happens.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15608689561.8A2400.26728
Date: Tue, 18 Jun 2019 14:42:36 +0000
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
   title=3D"NEW - [Bisected] Blender 2.8 crashes when closing certain windo=
ws"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110944">110944</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Bisected] Blender 2.8 crashes when closing certain windows
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
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
          <td>darkdefende&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144589=
" name=3D"attach_144589" title=3D"Git bisect log">attachment 144589</a> <a =
href=3D"attachment.cgi?id=3D144589&amp;action=3Dedit" title=3D"Git bisect l=
og">[details]</a></span>
Git bisect log

I'm running wayland/swaywm with two Vega 64s.
After I upgraded to mesa 19.1 I noticed that Blender 2.8 would crash when
closing certain windows (and only when it would trigger a resize of the
remaining Blender windows).

Blender bug here: <a href=3D"https://developer.blender.org/T65903">https://=
developer.blender.org/T65903</a>

I noticed that this wasn't the case with mesa 19.0.6 so I bisected and it s=
eems
like this commit is the cause of the crashing:

593e36f9561d3665cc12ed1fc8a07dd8612c004e

I also tested the latest mesa git master, and the crash still happens.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15608689561.8A2400.26728--

--===============1486981731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1486981731==--
