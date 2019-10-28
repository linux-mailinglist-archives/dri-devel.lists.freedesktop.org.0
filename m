Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF21E7B66
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 22:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCFB6EA9C;
	Mon, 28 Oct 2019 21:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B7BD16EA9B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 21:33:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B4925720E2; Mon, 28 Oct 2019 21:33:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111240] ASUS TUF Gaming laptops gets throttled down when the
 RX560X GPU is being used
Date: Mon, 28 Oct 2019 21:33:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: jajcus@jajcus.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111240-502-SMhqvKr1nh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111240-502@http.bugs.freedesktop.org/>
References: <bug-111240-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0748527647=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0748527647==
Content-Type: multipart/alternative; boundary="15722984382.9FAA9f.15078"
Content-Transfer-Encoding: 7bit


--15722984382.9FAA9f.15078
Date: Mon, 28 Oct 2019 21:33:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111240

--- Comment #7 from Jacek Konieczny <jajcus@jajcus.net> ---
I have tried kernel 5.4-rc5 =E2=80=93 that did not help.

Disabling cpufreq boost (echo 0 > /sys/devices/system/cpu/cpufreq/boost) st=
ops
the drastic slowdown from happening, but this also makes the system
significantly slower than normal (still much better than after the bug
appears), so there is no gain from using the discrete GPU (DRI_PRIME=3D1).

I wonder if this might be the problem:

> $ cat /sys/class/hwmon/hwmon3/{name,temp1_crit,temp1_crit_hyst}
> amdgpu
> 94000
> -273150
> $ cat /sys/class/hwmon/hwmon4/{name,temp1_crit,temp1_crit_hyst}
> amdgpu
> 80000
> 0

Are these hysteresis values being used? If so, then those values won't work=
 for
recovering from thermal throttle. Though, I have never seen temperature rea=
ding
reaching 80 degrees there.

The first one seems to be the discrete GPU (RX560X), the other one integrat=
ed
(Vega 8).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15722984382.9FAA9f.15078
Date: Mon, 28 Oct 2019 21:33:58 +0000
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
   title=3D"NEW - ASUS TUF Gaming laptops gets throttled down when the RX56=
0X GPU is being used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ASUS TUF Gaming laptops gets throttled down when the RX56=
0X GPU is being used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240">bug 11124=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jajcus&#64;jajcus.net" title=3D"Jacek Konieczny &lt;jajcus&#64;jajcus.net&g=
t;"> <span class=3D"fn">Jacek Konieczny</span></a>
</span></b>
        <pre>I have tried kernel 5.4-rc5 =E2=80=93 that did not help.

Disabling cpufreq boost (echo 0 &gt; /sys/devices/system/cpu/cpufreq/boost)=
 stops
the drastic slowdown from happening, but this also makes the system
significantly slower than normal (still much better than after the bug
appears), so there is no gain from using the discrete GPU (DRI_PRIME=3D1).

I wonder if this might be the problem:

<span class=3D"quote">&gt; $ cat /sys/class/hwmon/hwmon3/{name,temp1_crit,t=
emp1_crit_hyst}
&gt; amdgpu
&gt; 94000
&gt; -273150
&gt; $ cat /sys/class/hwmon/hwmon4/{name,temp1_crit,temp1_crit_hyst}
&gt; amdgpu
&gt; 80000
&gt; 0</span >

Are these hysteresis values being used? If so, then those values won't work=
 for
recovering from thermal throttle. Though, I have never seen temperature rea=
ding
reaching 80 degrees there.

The first one seems to be the discrete GPU (RX560X), the other one integrat=
ed
(Vega 8).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15722984382.9FAA9f.15078--

--===============0748527647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0748527647==--
