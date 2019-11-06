Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3504CF1C85
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F006EE18;
	Wed,  6 Nov 2019 17:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1976A6EE20
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:32:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1662A720E2; Wed,  6 Nov 2019 17:32:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 06 Nov 2019 17:32:50 +0000
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
Message-ID: <bug-109955-502-HhODiWFvCr@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1087314700=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1087314700==
Content-Type: multipart/alternative; boundary="15730615711.008425.29393"
Content-Transfer-Encoding: 7bit


--15730615711.008425.29393
Date: Wed, 6 Nov 2019 17:32:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #129 from Wilko Bartels <me@jasondaigo.de> ---
(In reply to haro41 from comment #122)
> In my experience, this issue is related to mclk switching and it affects =
the
> lowest mclk level only.
>=20
> So you guy's can save a lot of power, if you, insteed of switching to
> highest gfxlevel or to disable vsync, just disable the lowest mclk level =
by:
>=20
> echo "manual" > /sys/class/drm/card0/device/power_dpm_force_performance_l=
evel
> echo "1 2 3" > /sys/class/drm/card0/device/pp_dpm_mclk
>=20
> If you are building your kernel locally, look in this thread for a driver
> code modification that works, without disabling the lowest mclk level (sa=
ves
> a few watt on idle).

do you have any suggestion to automate this? so far i can strictly run these
commands after su. not even sudo works with scripts running these commands.=
 or
systemd files.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15730615711.008425.29393
Date: Wed, 6 Nov 2019 17:32:51 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c129">Comm=
ent # 129</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;jasondaigo.de" title=3D"Wilko Bartels &lt;me&#64;jasondaigo.de&gt;">=
 <span class=3D"fn">Wilko Bartels</span></a>
</span></b>
        <pre>(In reply to haro41 from <a href=3D"show_bug.cgi?id=3D109955#c=
122">comment #122</a>)
<span class=3D"quote">&gt; In my experience, this issue is related to mclk =
switching and it affects the
&gt; lowest mclk level only.
&gt;=20
&gt; So you guy's can save a lot of power, if you, insteed of switching to
&gt; highest gfxlevel or to disable vsync, just disable the lowest mclk lev=
el by:
&gt;=20
&gt; echo &quot;manual&quot; &gt; /sys/class/drm/card0/device/power_dpm_for=
ce_performance_level
&gt; echo &quot;1 2 3&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mclk
&gt;=20
&gt; If you are building your kernel locally, look in this thread for a dri=
ver
&gt; code modification that works, without disabling the lowest mclk level =
(saves
&gt; a few watt on idle).</span >

do you have any suggestion to automate this? so far i can strictly run these
commands after su. not even sudo works with scripts running these commands.=
 or
systemd files.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15730615711.008425.29393--

--===============1087314700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1087314700==--
