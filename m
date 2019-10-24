Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58EE28AA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 05:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DDD6E03A;
	Thu, 24 Oct 2019 03:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80D326E08C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 03:12:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7D8DC720E2; Thu, 24 Oct 2019 03:12:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Thu, 24 Oct 2019 03:12:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blppt@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-IlsN1KFZj3@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1058609190=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1058609190==
Content-Type: multipart/alternative; boundary="15718867487.2AC07E45a.13918"
Content-Transfer-Encoding: 7bit


--15718867487.2AC07E45a.13918
Date: Thu, 24 Oct 2019 03:12:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #120 from blppt@yahoo.com ---
I dont have anything to attach here, but same issue here, ubuntu 19.04, ker=
nel
5.4-rc3, vega64 W/C, Mesa 19.3.0 -- it only seems to occur with DXVK and not
D9VK for some reason.

Example: GW2 (DX9 game) will work perfectly under heavy load in WvW with
massive zergs for hours with no crash, but FFXIV (DX11) will always lock the
entire system up after a time.

That being said, when you force the top clock using

echo manual > /sys/class/drm/card0/device/power_dpm_force_performance_level

and

echo 7 > /sys/class/drm/card0/device/pp_dpm_sclk

FFXIV no longer locks the system at all. It does eat up a good deal more wa=
tts
according to my UPS meter though, so resetting to auto is necessary IMHO.

So, it sounds like you guys are on the right track with the whole "power
management" thing being the culprit. Just wanted to add my experience to th=
is.

(and yes, echoing the guy above, the exact same system is stable in windows=
 10,
so its not a hardware issue).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15718867487.2AC07E45a.13918
Date: Thu, 24 Oct 2019 03:12:28 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c120">Comm=
ent # 120</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
blppt&#64;yahoo.com" title=3D"blppt&#64;yahoo.com">blppt&#64;yahoo.com</a>
</span></b>
        <pre>I dont have anything to attach here, but same issue here, ubun=
tu 19.04, kernel
5.4-rc3, vega64 W/C, Mesa 19.3.0 -- it only seems to occur with DXVK and not
D9VK for some reason.

Example: GW2 (DX9 game) will work perfectly under heavy load in WvW with
massive zergs for hours with no crash, but FFXIV (DX11) will always lock the
entire system up after a time.

That being said, when you force the top clock using

echo manual &gt; /sys/class/drm/card0/device/power_dpm_force_performance_le=
vel

and

echo 7 &gt; /sys/class/drm/card0/device/pp_dpm_sclk

FFXIV no longer locks the system at all. It does eat up a good deal more wa=
tts
according to my UPS meter though, so resetting to auto is necessary IMHO.

So, it sounds like you guys are on the right track with the whole &quot;pow=
er
management&quot; thing being the culprit. Just wanted to add my experience =
to this.

(and yes, echoing the guy above, the exact same system is stable in windows=
 10,
so its not a hardware issue).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15718867487.2AC07E45a.13918--

--===============1058609190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1058609190==--
