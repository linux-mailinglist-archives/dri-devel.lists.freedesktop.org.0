Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C9A1393D
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 12:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E587892F1;
	Sat,  4 May 2019 10:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87151892AA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 10:39:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 830B37215A; Sat,  4 May 2019 10:39:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110605] "*ERROR* Waiting for fences timed out." happens every
 time when I select "Story" in the main game menu RE2.
Date: Sat, 04 May 2019 10:39:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110605-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1554973801=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1554973801==
Content-Type: multipart/alternative; boundary="15569663571.89C4525.8852"
Content-Transfer-Encoding: 7bit


--15569663571.89C4525.8852
Date: Sat, 4 May 2019 10:39:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110605

            Bug ID: 110605
           Summary: "*ERROR* Waiting for fences timed out." happens every
                    time when I select "Story" in the main game menu RE2.
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mikhail.v.gavrilov@gmail.com

Created attachment 144155
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144155&action=3Dedit
dmesg

$ inxi -bM
System:    Host: localhost.localdomain Kernel: 5.1.0-0.rc7.git3.1.fc31.x86_=
64
x86_64 bits: 64 Desktop: Gnome 3.32.1=20
           Distro: Fedora release 31 (Rawhide)=20
Machine:   Type: Desktop Mobo: ASUSTeK model: ROG STRIX X470-I GAMING v: Rev
1.xx serial: <root required>=20
           UEFI: American Megatrends v: 2202 date: 04/11/2019=20
CPU:       8-Core: AMD Ryzen 7 2700X type: MT MCP speed: 2106 MHz min/max:
2200/3700 MHz=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Vega 20 [Radeon VII]
driver: amdgpu v: kernel=20
           Display: wayland server: Fedora Project X.org 1.20.4 driver: amd=
gpu
resolution: 3840x2160~60Hz=20
           OpenGL: renderer: AMD Radeon VII (VEGA20 DRM 3.30.0
5.1.0-0.rc7.git3.1.fc31.x86_64 LLVM 8.0.0) v: 4.5 Mesa 19.0.3=20
Network:   Device-1: Intel I211 Gigabit Network driver: igb=20
           Device-2: Realtek RTL8822BE 802.11a/b/g/n/ac WiFi adapter driver:
r8822be=20
Drives:    Local Storage: total: 11.57 TiB used: 7.59 TiB (65.6%)=20
Info:      Processes: 469 Uptime: 33m Memory: 31.31 GiB used: 16.16 GiB (51=
.6%)
Shell: bash inxi: 3.0.32

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569663571.89C4525.8852
Date: Sat, 4 May 2019 10:39:17 +0000
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
   title=3D"NEW - &quot;*ERROR* Waiting for fences timed out.&quot; happens=
 every time when I select &quot;Story&quot; in the main game menu RE2."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110605">110605</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>&quot;*ERROR* Waiting for fences timed out.&quot; happens eve=
ry time when I select &quot;Story&quot; in the main game menu RE2.
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
          <td>mikhail.v.gavrilov&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144155=
" name=3D"attach_144155" title=3D"dmesg">attachment 144155</a> <a href=3D"a=
ttachment.cgi?id=3D144155&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

$ inxi -bM
System:    Host: localhost.localdomain Kernel: 5.1.0-0.rc7.git3.1.fc31.x86_=
64
x86_64 bits: 64 Desktop: Gnome 3.32.1=20
           Distro: Fedora release 31 (Rawhide)=20
Machine:   Type: Desktop Mobo: ASUSTeK model: ROG STRIX X470-I GAMING v: Rev
1.xx serial: &lt;root required&gt;=20
           UEFI: American Megatrends v: 2202 date: 04/11/2019=20
CPU:       8-Core: AMD Ryzen 7 2700X type: MT MCP speed: 2106 MHz min/max:
2200/3700 MHz=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Vega 20 [Radeon VII]
driver: amdgpu v: kernel=20
           Display: wayland server: Fedora Project X.org 1.20.4 driver: amd=
gpu
resolution: 3840x2160~60Hz=20
           OpenGL: renderer: AMD Radeon VII (VEGA20 DRM 3.30.0
5.1.0-0.rc7.git3.1.fc31.x86_64 LLVM 8.0.0) v: 4.5 Mesa 19.0.3=20
Network:   Device-1: Intel I211 Gigabit Network driver: igb=20
           Device-2: Realtek RTL8822BE 802.11a/b/g/n/ac WiFi adapter driver:
r8822be=20
Drives:    Local Storage: total: 11.57 TiB used: 7.59 TiB (65.6%)=20
Info:      Processes: 469 Uptime: 33m Memory: 31.31 GiB used: 16.16 GiB (51=
.6%)
Shell: bash inxi: 3.0.32</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569663571.89C4525.8852--

--===============1554973801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1554973801==--
