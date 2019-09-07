Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DFFAC752
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 17:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFD989C97;
	Sat,  7 Sep 2019 15:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D9CD389C97
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2019 15:43:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D61ED72161; Sat,  7 Sep 2019 15:43:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111584] "pp_od_clk_voltage" unavailable on Hawaii GPU (R9 390)
Date: Sat, 07 Sep 2019 15:43:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: jonasdcdm@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111584-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0735218743=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0735218743==
Content-Type: multipart/alternative; boundary="15678709951.55bBEc.32292"
Content-Transfer-Encoding: 7bit


--15678709951.55bBEc.32292
Date: Sat, 7 Sep 2019 15:43:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111584

            Bug ID: 111584
           Summary: "pp_od_clk_voltage" unavailable on Hawaii GPU (R9 390)
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: enhancement
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: jonasdcdm@mailbox.org

I have recently tried to overclock/undervolt my GPU (R9 390) within Linux
thanks to the "amdgpu.ppfeaturemask=3D0xffffffff" boot parameter, but
unfortunately the file "pp_od_clk_voltage" is not available after a reboot.

Files "pp_dpm_mclk" and "pp_dpm_sclk" however show correct states and MHz,
except that they don't show voltage information. Changing
"power_dpm_force_performance_level" to manual allows me to make changes to
these files, I can force a state to be used and overclock it, but voltages
aren't showed and can't be modified.

I have read that Southern Island GPUs were not expected to get this feature
working, and I know Vega is compatible, but I can't find anywhere if Hawaii
(CIK) hardware should be able to expose this feature. I might be missing
something.

Is there any way to undervolt my GPU under Linux at the moment?

Specs:
OS: Arch Linux
Kernel: 5.2.11.arch1-1
Mesa: 19.1.6-1
Xorg: 1.20.5-2
Boot parameters: radeon.cik_support=3D0 amdgpu.cik_support=3D1 amdgpu.dpm=
=3D1
amdgpu.dc=3D1 amdgpu.ppfeaturemask=3D0xffffffff
GPU: [AMD/ATI] Hawaii PRO [Radeon R9 290/390] (rev 80)

Feel free to ask for more details and output if needed.

Thank you for your time.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15678709951.55bBEc.32292
Date: Sat, 7 Sep 2019 15:43:15 +0000
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
   title=3D"NEW - &quot;pp_od_clk_voltage&quot; unavailable on Hawaii GPU (=
R9 390)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111584">111584</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>&quot;pp_od_clk_voltage&quot; unavailable on Hawaii GPU (R9 3=
90)
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
          <td>enhancement
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
          <td>jonasdcdm&#64;mailbox.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have recently tried to overclock/undervolt my GPU (R9 390) w=
ithin Linux
thanks to the &quot;amdgpu.ppfeaturemask=3D0xffffffff&quot; boot parameter,=
 but
unfortunately the file &quot;pp_od_clk_voltage&quot; is not available after=
 a reboot.

Files &quot;pp_dpm_mclk&quot; and &quot;pp_dpm_sclk&quot; however show corr=
ect states and MHz,
except that they don't show voltage information. Changing
&quot;power_dpm_force_performance_level&quot; to manual allows me to make c=
hanges to
these files, I can force a state to be used and overclock it, but voltages
aren't showed and can't be modified.

I have read that Southern Island GPUs were not expected to get this feature
working, and I know Vega is compatible, but I can't find anywhere if Hawaii
(CIK) hardware should be able to expose this feature. I might be missing
something.

Is there any way to undervolt my GPU under Linux at the moment?

Specs:
OS: Arch Linux
Kernel: 5.2.11.arch1-1
Mesa: 19.1.6-1
Xorg: 1.20.5-2
Boot parameters: radeon.cik_support=3D0 amdgpu.cik_support=3D1 amdgpu.dpm=
=3D1
amdgpu.dc=3D1 amdgpu.ppfeaturemask=3D0xffffffff
GPU: [AMD/ATI] Hawaii PRO [Radeon R9 290/390] (rev 80)

Feel free to ask for more details and output if needed.

Thank you for your time.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15678709951.55bBEc.32292--

--===============0735218743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0735218743==--
