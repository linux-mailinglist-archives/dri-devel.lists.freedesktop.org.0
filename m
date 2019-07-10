Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB6F64C52
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 20:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DD16E121;
	Wed, 10 Jul 2019 18:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 722116E123
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 18:42:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6F49B72167; Wed, 10 Jul 2019 18:42:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 10 Jul 2019 18:42:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jasondaigo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-fZF1iBU9vy@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1467293421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1467293421==
Content-Type: multipart/alternative; boundary="15627841734.f387c9.2918"
Content-Transfer-Encoding: 7bit


--15627841734.f387c9.2918
Date: Wed, 10 Jul 2019 18:42:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #49 from Wilko Bartels <me@jasondaigo.de> ---
(In reply to Sam from comment #47)
> The relevant issue and bug report here (the system freezing completely or=
 if
> lucky just killing the X session, NOT games crashing) seems to be related
> exclusively to AMDGPU, and not to mesa. Whereas I got the same issues over
> and over after trying out several versions of mesa, switching to older
> versions of the kernel "fixes" it for me (the latest version I tried out
> which didn't have these issues is Kernel 4.20.13, in my case from
> https://download.opensuse.org/repositories/home:/tiwai:/kernel:/4.20/
> standard/x86_64/)
>=20
> There is also a report from another user which temporarily fixed it by
> forcing the gpu to run at the maximum power setting
> (https://bugzilla.opensuse.org/show_bug.cgi?id=3D1136293):
>=20
> # echo manual > /sys/class/drm/card0/device/power_dpm_force_performance_l=
evel
> # echo 7 > /sys/class/drm/card0/device/pp_dpm_sclk
>=20
> and then to reset back to normal:
>=20
> # echo auto > /sys/class/drm/card0/device/power_dpm_force_performance_lev=
el

I am currently on my 4th game of dota in a row when setting performance lev=
el
manual to 7. working so far. Everyone should test this now so we have more
reliable data. As we all now the issue can be gone for several hours so my
experience means nothing yet.=20
Would be amazing if we can pin down the issue to the  performance level of =
the
cards.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15627841734.f387c9.2918
Date: Wed, 10 Jul 2019 18:42:53 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c49">Comme=
nt # 49</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;jasondaigo.de" title=3D"Wilko Bartels &lt;me&#64;jasondaigo.de&gt;">=
 <span class=3D"fn">Wilko Bartels</span></a>
</span></b>
        <pre>(In reply to Sam from <a href=3D"show_bug.cgi?id=3D109955#c47"=
>comment #47</a>)
<span class=3D"quote">&gt; The relevant issue and bug report here (the syst=
em freezing completely or if
&gt; lucky just killing the X session, NOT games crashing) seems to be rela=
ted
&gt; exclusively to AMDGPU, and not to mesa. Whereas I got the same issues =
over
&gt; and over after trying out several versions of mesa, switching to older
&gt; versions of the kernel &quot;fixes&quot; it for me (the latest version=
 I tried out
&gt; which didn't have these issues is Kernel 4.20.13, in my case from
&gt; <a href=3D"https://download.opensuse.org/repositories/home:/tiwai:/ker=
nel:/4.20/">https://download.opensuse.org/repositories/home:/tiwai:/kernel:=
/4.20/</a>
&gt; standard/x86_64/)
&gt;=20
&gt; There is also a report from another user which temporarily fixed it by
&gt; forcing the gpu to run at the maximum power setting
&gt; (<a href=3D"https://bugzilla.opensuse.org/show_bug.cgi?id=3D1136293">h=
ttps://bugzilla.opensuse.org/show_bug.cgi?id=3D1136293</a>):
&gt;=20
&gt; # echo manual &gt; /sys/class/drm/card0/device/power_dpm_force_perform=
ance_level
&gt; # echo 7 &gt; /sys/class/drm/card0/device/pp_dpm_sclk
&gt;=20
&gt; and then to reset back to normal:
&gt;=20
&gt; # echo auto &gt; /sys/class/drm/card0/device/power_dpm_force_performan=
ce_level</span >

I am currently on my 4th game of dota in a row when setting performance lev=
el
manual to 7. working so far. Everyone should test this now so we have more
reliable data. As we all now the issue can be gone for several hours so my
experience means nothing yet.=20
Would be amazing if we can pin down the issue to the  performance level of =
the
cards.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15627841734.f387c9.2918--

--===============1467293421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1467293421==--
