Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E304E86E9B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 01:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6216ECE4;
	Thu,  8 Aug 2019 23:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB0E36ECE4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 23:56:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C812372167; Thu,  8 Aug 2019 23:56:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110865] Rx480 consumes 20w more power in idle than under Windows
Date: Thu, 08 Aug 2019 23:56:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110865-502-GJqCEa6OUj@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110865-502@http.bugs.freedesktop.org/>
References: <bug-110865-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1560951350=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1560951350==
Content-Type: multipart/alternative; boundary="15653085663.Eed3b3F4a.31836"
Content-Transfer-Encoding: 7bit


--15653085663.Eed3b3F4a.31836
Date: Thu, 8 Aug 2019 23:56:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110865

--- Comment #13 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(In reply to Dieter N=C3=BCtzel from comment #12)
> (In reply to Alex Deucher from comment #9)
> > Created attachment 144983 [details] [review] [review]
> > fix DC code
> >=20
> > Can you try applying both of these patches?  Assuming both of your moni=
tors
> > have the same timing this might work.
>=20
> Didn't apply on amd-staging-drm-next, too.

BTW

Alex, is this the same problem?
My card never was below ~32 W (even with single monitor
but I have two identical HDMI 1920x1080)
PSTATE_xxxx is much higher than Martin's
didn't saw "zero fan" / zero core (no spinning fans)

Polaris 20 / 8GB Sapphire Radeon RX 580 Nitro+
single monitor

GFX Clocks and Power:
        300 MHz (MCLK)
        300 MHz (SCLK)
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        32.17 W (average GPU)

GPU Temperature: 31 C
GPU Load: 0 %

amdgpu-pci-0100
Adapter: PCI adapter
vddgfx:       +0.75 V=20=20
fan1:         909 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
temp1:        +30.0=C2=B0C  (crit =3D +94.0=C2=B0C, hyst =3D -273.1=C2=B0C)
power1:       32.09 W  (cap =3D 175.00 W)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15653085663.Eed3b3F4a.31836
Date: Thu, 8 Aug 2019 23:56:06 +0000
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
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865">bug 11086=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>(In reply to Dieter N=C3=BCtzel from <a href=3D"show_bug.cgi?i=
d=3D110865#c12">comment #12</a>)
<span class=3D"quote">&gt; (In reply to Alex Deucher from <a href=3D"show_b=
ug.cgi?id=3D110865#c9">comment #9</a>)
&gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D144983" n=
ame=3D"attach_144983" title=3D"fix DC code">attachment 144983</a> <a href=
=3D"attachment.cgi?id=3D144983&amp;action=3Dedit" title=3D"fix DC code">[de=
tails]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D110865&a=
mp;attachment=3D144983'>[review]</a> [review] [review]
&gt; &gt; fix DC code
&gt; &gt;=20
&gt; &gt; Can you try applying both of these patches?  Assuming both of you=
r monitors
&gt; &gt; have the same timing this might work.
&gt;=20
&gt; Didn't apply on amd-staging-drm-next, too.</span >

BTW

Alex, is this the same problem?
My card never was below ~32 W (even with single monitor
but I have two identical HDMI 1920x1080)
PSTATE_xxxx is much higher than Martin's
didn't saw &quot;zero fan&quot; / zero core (no spinning fans)

Polaris 20 / 8GB Sapphire Radeon RX 580 Nitro+
single monitor

GFX Clocks and Power:
        300 MHz (MCLK)
        300 MHz (SCLK)
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        32.17 W (average GPU)

GPU Temperature: 31 C
GPU Load: 0 %

amdgpu-pci-0100
Adapter: PCI adapter
vddgfx:       +0.75 V=20=20
fan1:         909 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
temp1:        +30.0=C2=B0C  (crit =3D +94.0=C2=B0C, hyst =3D -273.1=C2=B0C)
power1:       32.09 W  (cap =3D 175.00 W)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15653085663.Eed3b3F4a.31836--

--===============1560951350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1560951350==--
