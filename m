Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C94CC9C9
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 14:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376416E25B;
	Sat,  5 Oct 2019 12:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8D1D6E239
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 12:02:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C1CFF72162; Sat,  5 Oct 2019 12:02:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 05 Oct 2019 12:02:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jason@jasonplayne.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-mKsjv6M5TJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1683479049=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1683479049==
Content-Type: multipart/alternative; boundary="15702769320.2AF887F1.11540"
Content-Transfer-Encoding: 7bit


--15702769320.2AF887F1.11540
Date: Sat, 5 Oct 2019 12:02:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #113 from Jason Playne <jason@jasonplayne.com> ---
As others have noted, with powerplay doing its thing we get system freezes.

Just had a successful 6+ hour gaming session on a kernel 5.3.2-050302-gener=
ic
with the following being done:
 * Forcing high perf state
 * Undervolt/Overclock
 * Higher fan curve (https://github.com/grmat/amdgpu-fancontrol)

I know that I have been messing with all sorts here, but I think it suggests
that PowerPlay may be at fault here when my system *does* crash (which is a=
ll
the time without the force high perf state)

All details below:

# Forcing High Perf
echo high | sudo tee
/sys/class/drm/card0/device/power_dpm_force_performance_level

# Undervolt / Overclock
I also have done some messing around with voltages/clocks

$ cat /sys/class/drm/card0/device/pp_od_clk_voltage
OD_SCLK:
0:        852Mhz        800mV
1:        991Mhz        900mV
2:       1084Mhz        940mV
3:       1138Mhz        990mV
4:       1200Mhz       1040mV
5:       1401Mhz       1090mV
6:       1536Mhz       1140mV
7:       1630Mhz       1190mV
OD_MCLK:
0:        167Mhz        800mV
1:        500Mhz        800mV
2:        850Mhz        940mV
3:       1000Mhz       1100mV
OD_RANGE:
SCLK:     852MHz       2400MHz
MCLK:     167MHz       1500MHz
VDDC:     800mV        1200mV


# Settings for AMDGPU Fancontrol
TEMPS=3D( 35000 70000 80000 )
PWMS=3D(     70   180   255 )

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15702769320.2AF887F1.11540
Date: Sat, 5 Oct 2019 12:02:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c113">Comm=
ent # 113</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jason&#64;jasonplayne.com" title=3D"Jason Playne &lt;jason&#64;jasonplayne.=
com&gt;"> <span class=3D"fn">Jason Playne</span></a>
</span></b>
        <pre>As others have noted, with powerplay doing its thing we get sy=
stem freezes.

Just had a successful 6+ hour gaming session on a kernel 5.3.2-050302-gener=
ic
with the following being done:
 * Forcing high perf state
 * Undervolt/Overclock
 * Higher fan curve (<a href=3D"https://github.com/grmat/amdgpu-fancontrol"=
>https://github.com/grmat/amdgpu-fancontrol</a>)

I know that I have been messing with all sorts here, but I think it suggests
that PowerPlay may be at fault here when my system *does* crash (which is a=
ll
the time without the force high perf state)

All details below:

# Forcing High Perf
echo high | sudo tee
/sys/class/drm/card0/device/power_dpm_force_performance_level

# Undervolt / Overclock
I also have done some messing around with voltages/clocks

$ cat /sys/class/drm/card0/device/pp_od_clk_voltage
OD_SCLK:
0:        852Mhz        800mV
1:        991Mhz        900mV
2:       1084Mhz        940mV
3:       1138Mhz        990mV
4:       1200Mhz       1040mV
5:       1401Mhz       1090mV
6:       1536Mhz       1140mV
7:       1630Mhz       1190mV
OD_MCLK:
0:        167Mhz        800mV
1:        500Mhz        800mV
2:        850Mhz        940mV
3:       1000Mhz       1100mV
OD_RANGE:
SCLK:     852MHz       2400MHz
MCLK:     167MHz       1500MHz
VDDC:     800mV        1200mV


# Settings for AMDGPU Fancontrol
TEMPS=3D( 35000 70000 80000 )
PWMS=3D(     70   180   255 )</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15702769320.2AF887F1.11540--

--===============1683479049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1683479049==--
