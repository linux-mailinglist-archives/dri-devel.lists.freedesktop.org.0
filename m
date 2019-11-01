Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1013EBC26
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 04:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF666F50E;
	Fri,  1 Nov 2019 03:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D3156EF0A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 03:01:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1A0B9720E2; Fri,  1 Nov 2019 03:01:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Fri, 01 Nov 2019 03:01:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-boXg2Lg9Kh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0491725788=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0491725788==
Content-Type: multipart/alternative; boundary="15725772741.d7a29.12537"
Content-Transfer-Encoding: 7bit


--15725772741.d7a29.12537
Date: Fri, 1 Nov 2019 03:01:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #29 from Shmerl <shtetldik@gmail.com> ---
(In reply to Andrew Sheldon from comment #27)
> A bit of a hacky workaround to 144hz (and multi-monitor issues) on Navi:
>=20
> - Bootup to X
> - Suspend to ram
> - Notice that clocks have dropped (even in multi-monitor configuration)
> - I get flickering in the auto profile after doing this (maybe similar to
> the Polaris issues)
> - To remove the flickering, set power_dpm_force_performance_level to "low"
>=20

Which one exactly did you set it at?

I have 2560x1440 / 144 Hz monitor (LG 27GL850) and Sapphire Pulse RX 5700 XT
(hardware switch set to higher performance BIOS) and in general I noticed a
similar thing. During normal idle KDE operation, power stays at around 32 W=
 or
so.

If I suspend and resume, power drops to 11 W and the monitor starts flicker=
ing
wildly. I tried to do:

echo "low" > /sys/class/drm/card0/device/power_dpm_force_performance_level

But that didn't really help with flickering.

Can anyone from AMD please comment, whether 32 W is expected power consumpt=
ion
for light desktop usage at 2560x1440 / 144 Hz for Sapphire Pulse RX 5700 XT?

And clearly, after resume things are now broken regardless of what's the no=
rmal
level is supposed to be.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15725772741.d7a29.12537
Date: Fri, 1 Nov 2019 03:01:14 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c29">Comme=
nt # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>(In reply to Andrew Sheldon from <a href=3D"show_bug.cgi?id=3D=
111482#c27">comment #27</a>)
<span class=3D"quote">&gt; A bit of a hacky workaround to 144hz (and multi-=
monitor issues) on Navi:
&gt;=20
&gt; - Bootup to X
&gt; - Suspend to ram
&gt; - Notice that clocks have dropped (even in multi-monitor configuration)
&gt; - I get flickering in the auto profile after doing this (maybe similar=
 to
&gt; the Polaris issues)
&gt; - To remove the flickering, set power_dpm_force_performance_level to &=
quot;low&quot;
&gt; </span >

Which one exactly did you set it at?

I have 2560x1440 / 144 Hz monitor (LG 27GL850) and Sapphire Pulse RX 5700 XT
(hardware switch set to higher performance BIOS) and in general I noticed a
similar thing. During normal idle KDE operation, power stays at around 32 W=
 or
so.

If I suspend and resume, power drops to 11 W and the monitor starts flicker=
ing
wildly. I tried to do:

echo &quot;low&quot; &gt; /sys/class/drm/card0/device/power_dpm_force_perfo=
rmance_level

But that didn't really help with flickering.

Can anyone from AMD please comment, whether 32 W is expected power consumpt=
ion
for light desktop usage at 2560x1440 / 144 Hz for Sapphire Pulse RX 5700 XT?

And clearly, after resume things are now broken regardless of what's the no=
rmal
level is supposed to be.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15725772741.d7a29.12537--

--===============0491725788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0491725788==--
