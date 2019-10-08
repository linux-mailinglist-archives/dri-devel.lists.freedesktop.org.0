Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD30CF45F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A36E6E225;
	Tue,  8 Oct 2019 07:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D17C56E225
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:57:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C878E72162; Tue,  8 Oct 2019 07:57:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111921] GPU crash on VegaM (amdgpu: The CS has been rejected)
Date: Tue, 08 Oct 2019 07:57:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rverschelde@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111921-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0190008262=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0190008262==
Content-Type: multipart/alternative; boundary="15705214730.dEf20.30984"
Content-Transfer-Encoding: 7bit


--15705214730.dEf20.30984
Date: Tue, 8 Oct 2019 07:57:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111921

            Bug ID: 111921
           Summary: GPU crash on VegaM (amdgpu: The CS has been rejected)
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: rverschelde@gmail.com

Created attachment 145680
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145680&action=3Dedit
dmesg output after GPU crash with "amdgpu: The CS has been rejected"

Might be related to bug 111860.

In my case, the GPU crashes or fails to resume when I use the Godot Engine =
FOSS
application: https://github.com/godotengine/godot

The application works fine for a time, but eventually it will freeze and th=
is
gets printed to the terminal:

amdgpu: The CS has been rejected, see dmesg for more information (-2).
amdgpu: The CS has been rejected, see dmesg for more information (-19).

(attaching dmesg)

At this point, I have to kill the application, and reboot if I want to use =
the
GPU again.

This seems to happen mainly when alt-tabbing between Godot and the desktop =
or
terminal (both of which run on the Intel HD 630 IGP), so it might be an iss=
ue
with context switching?

I don't have precise steps to reproduce yet apart from using Godot (debug b=
uild
from git master branch) and other applications in parallel, to eventually s=
ee
it crash within 5-10 min.

I *think* the bug started to happen when I upgraded to kernel 5.2.x (now
running 5.3.2, still having the bug). That's what bug 111860 claims too, so
I'll attempt running 5.1.20 for a while to see if the bug still happens.

System info:

$ inxi
CPU: Quad Core Intel Core i7-8705G (-MT MCP-) speed/min/max: 1347/800/4100 =
MHz
Kernel: 5.3.2-desktop-1.mga7 x86_64 Up: 2h 44m=20
Mem: 3451.1/15767.7 MiB (21.9%) Storage: 953.87 GiB (58.3% used) Procs: 241
Shell: bash 4.4.23 inxi: 3.0.33=20
$ inxi -G
Graphics:  Device-1: Intel HD Graphics 630 driver: i915 v: kernel=20
           Device-2: Advanced Micro Devices [AMD/ATI] Polaris 22 XL [Radeon=
 RX
Vega M GL] driver: amdgpu v: kernel=20
           Display: x11 server: Mageia X.org 1.20.4 driver: amdgpu,intel
FAILED: ati unloaded: fbdev,modesetting,vesa tty: N/A=20
           OpenGL: renderer: Mesa DRI Intel HD Graphics 630 (Kaby Lake GT2)=
 v:
4.5 Mesa 19.1.7

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15705214730.dEf20.30984
Date: Tue, 8 Oct 2019 07:57:53 +0000
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
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921">111921</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GPU crash on VegaM (amdgpu: The CS has been rejected)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>rverschelde&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145680=
" name=3D"attach_145680" title=3D"dmesg output after GPU crash with &quot;a=
mdgpu: The CS has been rejected&quot;">attachment 145680</a> <a href=3D"att=
achment.cgi?id=3D145680&amp;action=3Dedit" title=3D"dmesg output after GPU =
crash with &quot;amdgpu: The CS has been rejected&quot;">[details]</a></spa=
n>
dmesg output after GPU crash with &quot;amdgpu: The CS has been rejected&qu=
ot;

Might be related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in AMDGPU after resume on VegaM"
   href=3D"show_bug.cgi?id=3D111860">bug 111860</a>.

In my case, the GPU crashes or fails to resume when I use the Godot Engine =
FOSS
application: <a href=3D"https://github.com/godotengine/godot">https://githu=
b.com/godotengine/godot</a>

The application works fine for a time, but eventually it will freeze and th=
is
gets printed to the terminal:

amdgpu: The CS has been rejected, see dmesg for more information (-2).
amdgpu: The CS has been rejected, see dmesg for more information (-19).

(attaching dmesg)

At this point, I have to kill the application, and reboot if I want to use =
the
GPU again.

This seems to happen mainly when alt-tabbing between Godot and the desktop =
or
terminal (both of which run on the Intel HD 630 IGP), so it might be an iss=
ue
with context switching?

I don't have precise steps to reproduce yet apart from using Godot (debug b=
uild
from git master branch) and other applications in parallel, to eventually s=
ee
it crash within 5-10 min.

I *think* the bug started to happen when I upgraded to kernel 5.2.x (now
running 5.3.2, still having the bug). That's what <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in AMDGPU after resume on VegaM"
   href=3D"show_bug.cgi?id=3D111860">bug 111860</a> claims too, so
I'll attempt running 5.1.20 for a while to see if the bug still happens.

System info:

$ inxi
CPU: Quad Core Intel Core i7-8705G (-MT MCP-) speed/min/max: 1347/800/4100 =
MHz
Kernel: 5.3.2-desktop-1.mga7 x86_64 Up: 2h 44m=20
Mem: 3451.1/15767.7 MiB (21.9%) Storage: 953.87 GiB (58.3% used) Procs: 241
Shell: bash 4.4.23 inxi: 3.0.33=20
$ inxi -G
Graphics:  Device-1: Intel HD Graphics 630 driver: i915 v: kernel=20
           Device-2: Advanced Micro Devices [AMD/ATI] Polaris 22 XL [Radeon=
 RX
Vega M GL] driver: amdgpu v: kernel=20
           Display: x11 server: Mageia X.org 1.20.4 driver: amdgpu,intel
FAILED: ati unloaded: fbdev,modesetting,vesa tty: N/A=20
           OpenGL: renderer: Mesa DRI Intel HD Graphics 630 (Kaby Lake GT2)=
 v:
4.5 Mesa 19.1.7</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15705214730.dEf20.30984--

--===============0190008262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0190008262==--
