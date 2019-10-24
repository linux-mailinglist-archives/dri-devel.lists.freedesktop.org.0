Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E590E29B0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 06:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9351D6E0CE;
	Thu, 24 Oct 2019 04:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 97CE96E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 04:58:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 94A9A720E2; Thu, 24 Oct 2019 04:58:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Thu, 24 Oct 2019 04:58:21 +0000
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
Message-ID: <bug-109955-502-t5IdAa6seE@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1050342244=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1050342244==
Content-Type: multipart/alternative; boundary="15718931019.dDC18.2092"
Content-Transfer-Encoding: 7bit


--15718931019.dDC18.2092
Date: Thu, 24 Oct 2019 04:58:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #121 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to blppt from comment #120)
> I dont have anything to attach here, but same issue here, ubuntu 19.04,
> kernel 5.4-rc3, vega64 W/C, Mesa 19.3.0 -- it only seems to occur with DX=
VK
> and not D9VK for some reason.
>=20
> Example: GW2 (DX9 game) will work perfectly under heavy load in WvW with
> massive zergs for hours with no crash, but FFXIV (DX11) will always lock =
the
> entire system up after a time.
>=20
> That being said, when you force the top clock using
>=20
> echo manual > /sys/class/drm/card0/device/power_dpm_force_performance_lev=
el
>=20
> and
>=20
> echo 7 > /sys/class/drm/card0/device/pp_dpm_sclk
>=20
> FFXIV no longer locks the system at all. It does eat up a good deal more
> watts according to my UPS meter though, so resetting to auto is necessary
> IMHO.
>=20
> So, it sounds like you guys are on the right track with the whole "power
> management" thing being the culprit. Just wanted to add my experience to
> this.
>=20
> (and yes, echoing the guy above, the exact same system is stable in windo=
ws
> 10, so its not a hardware issue).

I agree with this. I am having much better experience myself even without
commands to force the power performance level by doing:
- change game to windowed or full-screen borderless (fixed window)
- disable vsync
- disable frame limiter

by doing the above 3, it seems that GPU is forced into max power state all =
the
time while playing. I have been using this method for a few days with DXVK
games and I had no freeze so far.

But again this is just a temporary workaround. So is the command to manually
force high power performance level. Hopefully a permanent fix comes with
AMDGPU/Kernel updates.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15718931019.dDC18.2092
Date: Thu, 24 Oct 2019 04:58:21 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c121">Comm=
ent # 121</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to blppt from <a href=3D"show_bug.cgi?id=3D109955#c1=
20">comment #120</a>)
<span class=3D"quote">&gt; I dont have anything to attach here, but same is=
sue here, ubuntu 19.04,
&gt; kernel 5.4-rc3, vega64 W/C, Mesa 19.3.0 -- it only seems to occur with=
 DXVK
&gt; and not D9VK for some reason.
&gt;=20
&gt; Example: GW2 (DX9 game) will work perfectly under heavy load in WvW wi=
th
&gt; massive zergs for hours with no crash, but FFXIV (DX11) will always lo=
ck the
&gt; entire system up after a time.
&gt;=20
&gt; That being said, when you force the top clock using
&gt;=20
&gt; echo manual &gt; /sys/class/drm/card0/device/power_dpm_force_performan=
ce_level
&gt;=20
&gt; and
&gt;=20
&gt; echo 7 &gt; /sys/class/drm/card0/device/pp_dpm_sclk
&gt;=20
&gt; FFXIV no longer locks the system at all. It does eat up a good deal mo=
re
&gt; watts according to my UPS meter though, so resetting to auto is necess=
ary
&gt; IMHO.
&gt;=20
&gt; So, it sounds like you guys are on the right track with the whole &quo=
t;power
&gt; management&quot; thing being the culprit. Just wanted to add my experi=
ence to
&gt; this.
&gt;=20
&gt; (and yes, echoing the guy above, the exact same system is stable in wi=
ndows
&gt; 10, so its not a hardware issue).</span >

I agree with this. I am having much better experience myself even without
commands to force the power performance level by doing:
- change game to windowed or full-screen borderless (fixed window)
- disable vsync
- disable frame limiter

by doing the above 3, it seems that GPU is forced into max power state all =
the
time while playing. I have been using this method for a few days with DXVK
games and I had no freeze so far.

But again this is just a temporary workaround. So is the command to manually
force high power performance level. Hopefully a permanent fix comes with
AMDGPU/Kernel updates.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15718931019.dDC18.2092--

--===============1050342244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1050342244==--
