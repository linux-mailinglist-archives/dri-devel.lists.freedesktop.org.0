Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3D9DDE25
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 12:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7946789A92;
	Sun, 20 Oct 2019 10:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCFA589A92
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2019 10:46:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BA46C720E4; Sun, 20 Oct 2019 10:46:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112071] 5700 XT: ppfeaturemask doesn't work with iGPU
 multi-monitor
Date: Sun, 20 Oct 2019 10:46:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: zamundaaalp@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112071-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0860049143=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0860049143==
Content-Type: multipart/alternative; boundary="15715683601.5Ef13BeE.30635"
Content-Transfer-Encoding: 7bit


--15715683601.5Ef13BeE.30635
Date: Sun, 20 Oct 2019 10:46:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112071

            Bug ID: 112071
           Summary: 5700 XT: ppfeaturemask doesn't work with iGPU
                    multi-monitor
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: zamundaaalp@gmail.com

If the BIOS option "iGPU multi-monitor" is enabled (so I can use the intern=
al
GPU ports, namely DVI) amdgpu.ppfeaturemask doesn't do anything anymore.
"cat /sys/module/amdgpu/parameters/ppfeaturemask" gives the mask I set (eit=
her
fffd7fff or simply 0xffffffff) but the files like
/sys/class/drm/card0/device/pp_od_clk_voltage don't actually get created. T=
hey
do if I disable iGPU multi-monitor.

Wether I'm on kernel 5.3.6 or 5.4rc2 doesn't matter, wether I'm on Mesa 19.=
2 or
19.3 (git) doesn't matter as well.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715683601.5Ef13BeE.30635
Date: Sun, 20 Oct 2019 10:46:00 +0000
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
   title=3D"NEW - 5700 XT: ppfeaturemask doesn't work with iGPU multi-monit=
or"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112071">112071</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>5700 XT: ppfeaturemask doesn't work with iGPU multi-monitor
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
          <td>minor
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
          <td>zamundaaalp&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>If the BIOS option &quot;iGPU multi-monitor&quot; is enabled (=
so I can use the internal
GPU ports, namely DVI) amdgpu.ppfeaturemask doesn't do anything anymore.
&quot;cat /sys/module/amdgpu/parameters/ppfeaturemask&quot; gives the mask =
I set (either
fffd7fff or simply 0xffffffff) but the files like
/sys/class/drm/card0/device/pp_od_clk_voltage don't actually get created. T=
hey
do if I disable iGPU multi-monitor.

Wether I'm on kernel 5.3.6 or 5.4rc2 doesn't matter, wether I'm on Mesa 19.=
2 or
19.3 (git) doesn't matter as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715683601.5Ef13BeE.30635--

--===============0860049143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0860049143==--
