Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164967B7E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 19:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DB689D43;
	Sat, 13 Jul 2019 17:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E3D189D30
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 17:22:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1A79A72167; Sat, 13 Jul 2019 17:22:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 13 Jul 2019 17:22:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shadow.archemage@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-UP55tYysgW@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0946661762=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0946661762==
Content-Type: multipart/alternative; boundary="15630385611.aBeE6BBC7.16922"
Content-Transfer-Encoding: 7bit


--15630385611.aBeE6BBC7.16922
Date: Sat, 13 Jul 2019 17:22:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #51 from shadow.archemage@gmail.com ---
(In reply to Wilko Bartels from comment #49)
> (In reply to Sam from comment #47)
> > The relevant issue and bug report here (the system freezing completely =
or if
> > lucky just killing the X session, NOT games crashing) seems to be relat=
ed
> > exclusively to AMDGPU, and not to mesa. Whereas I got the same issues o=
ver
> > and over after trying out several versions of mesa, switching to older
> > versions of the kernel "fixes" it for me (the latest version I tried out
> > which didn't have these issues is Kernel 4.20.13, in my case from
> > https://download.opensuse.org/repositories/home:/tiwai:/kernel:/4.20/
> > standard/x86_64/)
> >=20
> > There is also a report from another user which temporarily fixed it by
> > forcing the gpu to run at the maximum power setting
> > (https://bugzilla.opensuse.org/show_bug.cgi?id=3D1136293):
> >=20
> > # echo manual > /sys/class/drm/card0/device/power_dpm_force_performance=
_level
> > # echo 7 > /sys/class/drm/card0/device/pp_dpm_sclk
> >=20
> > and then to reset back to normal:
> >=20
> > # echo auto > /sys/class/drm/card0/device/power_dpm_force_performance_l=
evel
>=20
> I am currently on my 4th game of dota in a row when setting performance
> level manual to 7. working so far. Everyone should test this now so we ha=
ve
> more reliable data. As we all now the issue can be gone for several hours=
 so
> my experience means nothing yet.=20
> Would be amazing if we can pin down the issue to the  performance level of
> the cards.

Played Monster Hunter and Dota 2 for quite a long time, and I didn't experi=
ence
any system freezes with the max performance settings. Will test again tomor=
row
to see if the workaround is consistent enough.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15630385611.aBeE6BBC7.16922
Date: Sat, 13 Jul 2019 17:22:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c51">Comme=
nt # 51</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shadow.archemage&#64;gmail.com" title=3D"shadow.archemage&#64;gmail.com">sh=
adow.archemage&#64;gmail.com</a>
</span></b>
        <pre>(In reply to Wilko Bartels from <a href=3D"show_bug.cgi?id=3D1=
09955#c49">comment #49</a>)
<span class=3D"quote">&gt; (In reply to Sam from <a href=3D"show_bug.cgi?id=
=3D109955#c47">comment #47</a>)
&gt; &gt; The relevant issue and bug report here (the system freezing compl=
etely or if
&gt; &gt; lucky just killing the X session, NOT games crashing) seems to be=
 related
&gt; &gt; exclusively to AMDGPU, and not to mesa. Whereas I got the same is=
sues over
&gt; &gt; and over after trying out several versions of mesa, switching to =
older
&gt; &gt; versions of the kernel &quot;fixes&quot; it for me (the latest ve=
rsion I tried out
&gt; &gt; which didn't have these issues is Kernel 4.20.13, in my case from
&gt; &gt; <a href=3D"https://download.opensuse.org/repositories/home:/tiwai=
:/kernel:/4.20/">https://download.opensuse.org/repositories/home:/tiwai:/ke=
rnel:/4.20/</a>
&gt; &gt; standard/x86_64/)
&gt; &gt;=20
&gt; &gt; There is also a report from another user which temporarily fixed =
it by
&gt; &gt; forcing the gpu to run at the maximum power setting
&gt; &gt; (<a href=3D"https://bugzilla.opensuse.org/show_bug.cgi?id=3D11362=
93">https://bugzilla.opensuse.org/show_bug.cgi?id=3D1136293</a>):
&gt; &gt;=20
&gt; &gt; # echo manual &gt; /sys/class/drm/card0/device/power_dpm_force_pe=
rformance_level
&gt; &gt; # echo 7 &gt; /sys/class/drm/card0/device/pp_dpm_sclk
&gt; &gt;=20
&gt; &gt; and then to reset back to normal:
&gt; &gt;=20
&gt; &gt; # echo auto &gt; /sys/class/drm/card0/device/power_dpm_force_perf=
ormance_level
&gt;=20
&gt; I am currently on my 4th game of dota in a row when setting performance
&gt; level manual to 7. working so far. Everyone should test this now so we=
 have
&gt; more reliable data. As we all now the issue can be gone for several ho=
urs so
&gt; my experience means nothing yet.=20
&gt; Would be amazing if we can pin down the issue to the  performance leve=
l of
&gt; the cards.</span >

Played Monster Hunter and Dota 2 for quite a long time, and I didn't experi=
ence
any system freezes with the max performance settings. Will test again tomor=
row
to see if the workaround is consistent enough.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15630385611.aBeE6BBC7.16922--

--===============0946661762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0946661762==--
