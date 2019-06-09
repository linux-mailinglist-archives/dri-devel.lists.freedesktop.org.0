Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C93A5E5
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 15:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9060894C1;
	Sun,  9 Jun 2019 13:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18E31894C1
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2019 13:22:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0DD9C72167; Sun,  9 Jun 2019 13:22:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110865] Rx480 consumes 20w more power in idle than under Windows
Date: Sun, 09 Jun 2019 13:22:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mwolf@adiumentum.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110865-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1465363916=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1465363916==
Content-Type: multipart/alternative; boundary="15600865210.8cDA91c2.11823"
Content-Transfer-Encoding: 7bit


--15600865210.8cDA91c2.11823
Date: Sun, 9 Jun 2019 13:22:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110865

            Bug ID: 110865
           Summary: Rx480 consumes 20w more power in idle than under
                    Windows
           Product: Mesa
           Version: 19.1
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mwolf@adiumentum.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144485
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144485&action=3Dedit
logfiles as requested in the amd bugreport guide

First I am not sure where to file that bug, so please be gentle with me, if=
 I
selected the wrong component.

I noticed for a while higher temperatures of my Videocard when my pc was ju=
st
idling with gnome. Then I dug deeper and found out that my "zero fan" video=
card
does not stop the fan when I run Linux.

So I ran this line here:
watch -n 0.5 cat /sys/kernel/debug/dri/0/amdgpu_pm_info
and it showed me that the MCLK does not clock down to 300MHz as it does with
Windows 10.=20
GFX Clocks and Power:
        2000 MHz (MCLK)
        300 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        300 MHz (PSTATE_MCLK)
        1000 mV (VDDGFX)
        24.75 W (average GPU)

GPU Temperature: 45 C
GPU Load: 0 %

I have a multimonitor setup with two 1920x1200 pixel screens. When I use
Windows 10, the MCLK does not go beyond 300MHz when the desktop is idling.
(measured with hwmonitor)=20
When I power-off one screen under linux the (average GPU) goes down to 8-10W
and the MCLK drops to 300MHz, so the card can clock down, but is somehow
prohibited by the driver or configuration?

I followed this bug report guide from amd:
https://www.amd.com/en/support/kb/faq/amdgpu-installation#faq-Reporting-Bugs
and attached several logfiles.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15600865210.8cDA91c2.11823
Date: Sun, 9 Jun 2019 13:22:01 +0000
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
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865">110865</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Rx480 consumes 20w more power in idle than under Windows
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
          <td>mwolf&#64;adiumentum.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144485=
" name=3D"attach_144485" title=3D"logfiles as requested in the amd bugrepor=
t guide">attachment 144485</a> <a href=3D"attachment.cgi?id=3D144485&amp;ac=
tion=3Dedit" title=3D"logfiles as requested in the amd bugreport guide">[de=
tails]</a></span>
logfiles as requested in the amd bugreport guide

First I am not sure where to file that bug, so please be gentle with me, if=
 I
selected the wrong component.

I noticed for a while higher temperatures of my Videocard when my pc was ju=
st
idling with gnome. Then I dug deeper and found out that my &quot;zero fan&q=
uot; videocard
does not stop the fan when I run Linux.

So I ran this line here:
watch -n 0.5 cat /sys/kernel/debug/dri/0/amdgpu_pm_info
and it showed me that the MCLK does not clock down to 300MHz as it does with
Windows 10.=20
GFX Clocks and Power:
        2000 MHz (MCLK)
        300 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        300 MHz (PSTATE_MCLK)
        1000 mV (VDDGFX)
        24.75 W (average GPU)

GPU Temperature: 45 C
GPU Load: 0 %

I have a multimonitor setup with two 1920x1200 pixel screens. When I use
Windows 10, the MCLK does not go beyond 300MHz when the desktop is idling.
(measured with hwmonitor)=20
When I power-off one screen under linux the (average GPU) goes down to 8-10W
and the MCLK drops to 300MHz, so the card can clock down, but is somehow
prohibited by the driver or configuration?

I followed this bug report guide from amd:
<a href=3D"https://www.amd.com/en/support/kb/faq/amdgpu-installation#faq-Re=
porting-Bugs">https://www.amd.com/en/support/kb/faq/amdgpu-installation#faq=
-Reporting-Bugs</a>
and attached several logfiles.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15600865210.8cDA91c2.11823--

--===============1465363916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1465363916==--
