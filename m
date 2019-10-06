Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E433CCE67
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 06:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979956E14F;
	Sun,  6 Oct 2019 04:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73B356E14F
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 04:45:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 680CF72162; Sun,  6 Oct 2019 04:45:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Sun, 06 Oct 2019 04:45:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edufrazao@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-HaqImJvAMd@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0586968890=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0586968890==
Content-Type: multipart/alternative; boundary="15703371580.ed556FA.3222"
Content-Transfer-Encoding: 7bit


--15703371580.ed556FA.3222
Date: Sun, 6 Oct 2019 04:45:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #25 from Eduardo <edufrazao@gmail.com> ---
I have a PowerColor RedDevil 5700XT and for me, Kernel 5.4-rc1 just works.
Memory clocks always at 100Mhz when idle, even using KDE (Plasma 5.16).

amdgpu-pci-0a00
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:           0 RPM  (min =3D    0 RPM, max =3D 3500 RPM)
edge:         +43.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:     +43.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:          +44.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:       11.00 W  (cap =3D 220.00 W)

I'm using Display Port, with FreeSync ON, on a 75HZ monitor, with 2560x1080
resolution.

beast ~ # cat /sys/class/drm/card0/device/pp_dpm_mclk=20
0: 100Mhz *
1: 500Mhz=20
2: 625Mhz=20
3: 875Mhz

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15703371580.ed556FA.3222
Date: Sun, 6 Oct 2019 04:45:58 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
edufrazao&#64;gmail.com" title=3D"Eduardo &lt;edufrazao&#64;gmail.com&gt;">=
 <span class=3D"fn">Eduardo</span></a>
</span></b>
        <pre>I have a PowerColor RedDevil 5700XT and for me, Kernel 5.4-rc1=
 just works.
Memory clocks always at 100Mhz when idle, even using KDE (Plasma 5.16).

amdgpu-pci-0a00
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:           0 RPM  (min =3D    0 RPM, max =3D 3500 RPM)
edge:         +43.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:     +43.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:          +44.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:       11.00 W  (cap =3D 220.00 W)

I'm using Display Port, with FreeSync ON, on a 75HZ monitor, with 2560x1080
resolution.

beast ~ # cat /sys/class/drm/card0/device/pp_dpm_mclk=20
0: 100Mhz *
1: 500Mhz=20
2: 625Mhz=20
3: 875Mhz</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15703371580.ed556FA.3222--

--===============0586968890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0586968890==--
