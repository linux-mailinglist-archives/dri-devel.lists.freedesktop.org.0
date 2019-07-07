Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC561428
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 07:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46ADC89C48;
	Sun,  7 Jul 2019 05:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 82D3A89C48
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 05:31:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7FC7972167; Sun,  7 Jul 2019 05:31:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 07 Jul 2019 05:31:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-l5hhO8mdfb@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1082189564=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1082189564==
Content-Type: multipart/alternative; boundary="15624774941.ffebD2.25711"
Content-Transfer-Encoding: 7bit


--15624774941.ffebD2.25711
Date: Sun, 7 Jul 2019 05:31:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #36 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to shadow.archemage from comment #35)
> (In reply to Mauro Gaspari from comment #22)
>=20
> > The only issue I have not being able to reproduce the issue quickly, is=
 to
> > clearly understand when the issue is resolved by Mesa. It takes hours f=
or me
> > to get the freeze sometimes.=20
> > If someone has a quick way to trigger system freeze, I am happy to run =
more
> > tests.
>=20
> Hi Mauro,
>=20
> The issue happened to me much more frequently when I opted into Steam beta
> and ran Monster Hunter: World. Before opting in, the crashes happen around
> 1-2 hours after the game starts. With Steam beta though, it happens around
> <5 minutes in.
>=20
> The only change that I noted when I opted into Steam beta was that the ga=
mes
> suddenly downloaded some shader pre-caching stuff. Unfortunately, I'm not
> too familiar with it, and I'm not too sure if it is related to the proble=
m.
>=20
> I am running Manjaro, Gnome 3.32.2, Kernel version 5.1.15-1, Mesa 19.1.1.
> Let me know if I missed something.
>=20
> Thanks,
> Eph

I am not an expert, but I am quite sure shaders have a big part in this. If=
 you
can, disable shader caching.
There are a few tests you can do:
1. Did you try with the kernel parameters I posted above? I always ran all =
the
parameters together. GPU+CPU and at the time, I did not have crashes for we=
eks
on my Vega64. I am using a RadeonVII now and it seems those parameters are =
not
needed.
2. Valve sponsored an interesting project that removes dependency of AMD Me=
sa
from LLVM. And instead uses ACO. Valve made this available for Arch based
systems via AUR, and Ubuntu based system via PPA. If you want to test it, y=
ou
can check the posts below. I am going to test this myself on both Arch and
Ubuntu.=20
https://steamcommunity.com/games/221410/announcements/detail/16026346096368=
94200
https://steamcommunity.com/app/221410/discussions/0/1640915206474070669/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15624774941.ffebD2.25711
Date: Sun, 7 Jul 2019 05:31:34 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c36">Comme=
nt # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to shadow.archemage from <a href=3D"show_bug.cgi?id=
=3D109955#c35">comment #35</a>)
<span class=3D"quote">&gt; (In reply to Mauro Gaspari from <a href=3D"show_=
bug.cgi?id=3D109955#c22">comment #22</a>)
&gt;=20
&gt; &gt; The only issue I have not being able to reproduce the issue quick=
ly, is to
&gt; &gt; clearly understand when the issue is resolved by Mesa. It takes h=
ours for me
&gt; &gt; to get the freeze sometimes.=20
&gt; &gt; If someone has a quick way to trigger system freeze, I am happy t=
o run more
&gt; &gt; tests.
&gt;=20
&gt; Hi Mauro,
&gt;=20
&gt; The issue happened to me much more frequently when I opted into Steam =
beta
&gt; and ran Monster Hunter: World. Before opting in, the crashes happen ar=
ound
&gt; 1-2 hours after the game starts. With Steam beta though, it happens ar=
ound
&gt; &lt;5 minutes in.
&gt;=20
&gt; The only change that I noted when I opted into Steam beta was that the=
 games
&gt; suddenly downloaded some shader pre-caching stuff. Unfortunately, I'm =
not
&gt; too familiar with it, and I'm not too sure if it is related to the pro=
blem.
&gt;=20
&gt; I am running Manjaro, Gnome 3.32.2, Kernel version 5.1.15-1, Mesa 19.1=
.1.
&gt; Let me know if I missed something.
&gt;=20
&gt; Thanks,
&gt; Eph</span >

I am not an expert, but I am quite sure shaders have a big part in this. If=
 you
can, disable shader caching.
There are a few tests you can do:
1. Did you try with the kernel parameters I posted above? I always ran all =
the
parameters together. GPU+CPU and at the time, I did not have crashes for we=
eks
on my Vega64. I am using a RadeonVII now and it seems those parameters are =
not
needed.
2. Valve sponsored an interesting project that removes dependency of AMD Me=
sa
from LLVM. And instead uses ACO. Valve made this available for Arch based
systems via AUR, and Ubuntu based system via PPA. If you want to test it, y=
ou
can check the posts below. I am going to test this myself on both Arch and
Ubuntu.=20
<a href=3D"https://steamcommunity.com/games/221410/announcements/detail/160=
2634609636894200">https://steamcommunity.com/games/221410/announcements/det=
ail/1602634609636894200</a>
<a href=3D"https://steamcommunity.com/app/221410/discussions/0/164091520647=
4070669/">https://steamcommunity.com/app/221410/discussions/0/1640915206474=
070669/</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15624774941.ffebD2.25711--

--===============1082189564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1082189564==--
