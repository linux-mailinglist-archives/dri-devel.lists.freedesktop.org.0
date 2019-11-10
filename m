Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E9AF6202
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 02:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038566E47E;
	Sun, 10 Nov 2019 01:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D93D96E47E
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 01:11:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D3B73720E2; Sun, 10 Nov 2019 01:11:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112240] Resume from suspend hangs gfx10 card
Date: Sun, 10 Nov 2019 01:11:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 42.pablo.ms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-112240-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0855550737=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0855550737==
Content-Type: multipart/alternative; boundary="15733482641.bDde4.28353"
Content-Transfer-Encoding: 7bit


--15733482641.bDde4.28353
Date: Sun, 10 Nov 2019 01:11:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112240

            Bug ID: 112240
           Summary: Resume from suspend hangs gfx10 card
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: 42.pablo.ms@gmail.com

Created attachment 145929
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145929&action=3Dedit
Dmesg snippet

Title is self explanatory. I've looked into similar reports but my dmesg is
different from all of them.

System:
Ryzen 2600=20
Asus PRIME x470 PRO
16GB of RAM at JEDEC speeds
Reference navi 5700

4K freesync enabled LG display

Arch Linux with lcarlier's mesa-git+llvm-git+xf86-video-amdgpu-git and amd's
staging kernel.

Upon resume I captured this via SSH. System still "works", without screen.
Touching GPU stuff like the debug reset just makes it worse and/or complete=
ly
freezes the thing.

Link:
https://pastebin.com/raw/RwnHbvgS

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733482641.bDde4.28353
Date: Sun, 10 Nov 2019 01:11:04 +0000
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
   title=3D"NEW - Resume from suspend hangs gfx10 card"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112240">112240</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Resume from suspend hangs gfx10 card
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
          <td>not set
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
          <td>42.pablo.ms&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145929=
" name=3D"attach_145929" title=3D"Dmesg snippet">attachment 145929</a> <a h=
ref=3D"attachment.cgi?id=3D145929&amp;action=3Dedit" title=3D"Dmesg snippet=
">[details]</a></span>
Dmesg snippet

Title is self explanatory. I've looked into similar reports but my dmesg is
different from all of them.

System:
Ryzen 2600=20
Asus PRIME x470 PRO
16GB of RAM at JEDEC speeds
Reference navi 5700

4K freesync enabled LG display

Arch Linux with lcarlier's mesa-git+llvm-git+xf86-video-amdgpu-git and amd's
staging kernel.

Upon resume I captured this via SSH. System still &quot;works&quot;, withou=
t screen.
Touching GPU stuff like the debug reset just makes it worse and/or complete=
ly
freezes the thing.

Link:
<a href=3D"https://pastebin.com/raw/RwnHbvgS">https://pastebin.com/raw/RwnH=
bvgS</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733482641.bDde4.28353--

--===============0855550737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0855550737==--
