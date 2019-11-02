Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D76ECD18
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 05:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72F289CC9;
	Sat,  2 Nov 2019 04:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BBA26E365
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 04:22:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7E4F0720E8; Sat,  2 Nov 2019 04:22:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Sat, 02 Nov 2019 04:22:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-nwIDoZtiZc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0310993814=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0310993814==
Content-Type: multipart/alternative; boundary="15726685382.8e8877FE.14423"
Content-Transfer-Encoding: 7bit


--15726685382.8e8877FE.14423
Date: Sat, 2 Nov 2019 04:22:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #30 from Andrew Sheldon <asheldon55@gmail.com> ---
(In reply to Shmerl from comment #29)

> Which one exactly did you set it at?
>=20
> I have 2560x1440 / 144 Hz monitor (LG 27GL850) and Sapphire Pulse RX 5700=
 XT
> (hardware switch set to higher performance BIOS) and in general I noticed=
 a
> similar thing. During normal idle KDE operation, power stays at around 32=
 W
> or so.
>=20
> If I suspend and resume, power drops to 11 W and the monitor starts
> flickering wildly. I tried to do:
>=20
> echo "low" > /sys/class/drm/card0/device/power_dpm_force_performance_level
>=20
> But that didn't really help with flickering.

You may have to first set it to "high", then back to "low".

It will also stop working once a fix that adds "smu->disable_uclk_switch =
=3D 0;"
in amdgpu_smu.c filters down to the mainline kernels.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726685382.8e8877FE.14423
Date: Sat, 2 Nov 2019 04:22:18 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c30">Comme=
nt # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>(In reply to Shmerl from <a href=3D"show_bug.cgi?id=3D111482#c=
29">comment #29</a>)

<span class=3D"quote">&gt; Which one exactly did you set it at?
&gt;=20
&gt; I have 2560x1440 / 144 Hz monitor (LG 27GL850) and Sapphire Pulse RX 5=
700 XT
&gt; (hardware switch set to higher performance BIOS) and in general I noti=
ced a
&gt; similar thing. During normal idle KDE operation, power stays at around=
 32 W
&gt; or so.
&gt;=20
&gt; If I suspend and resume, power drops to 11 W and the monitor starts
&gt; flickering wildly. I tried to do:
&gt;=20
&gt; echo &quot;low&quot; &gt; /sys/class/drm/card0/device/power_dpm_force_=
performance_level
&gt;=20
&gt; But that didn't really help with flickering.</span >

You may have to first set it to &quot;high&quot;, then back to &quot;low&qu=
ot;.

It will also stop working once a fix that adds &quot;smu-&gt;disable_uclk_s=
witch =3D 0;&quot;
in amdgpu_smu.c filters down to the mainline kernels.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726685382.8e8877FE.14423--

--===============0310993814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0310993814==--
