Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52B7B50FE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 17:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C1A6ECD6;
	Tue, 17 Sep 2019 15:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D54CA6ECD6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 15:06:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D287372167; Tue, 17 Sep 2019 15:06:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Tue, 17 Sep 2019 15:06:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aeikum@codeweavers.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTOURBUG
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-rFfw3oYXhq@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0606674505=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0606674505==
Content-Type: multipart/alternative; boundary="15687328071.4fbc0c55e.17574"
Content-Transfer-Encoding: 7bit


--15687328071.4fbc0c55e.17574
Date: Tue, 17 Sep 2019 15:06:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #81 from Andrew Eikum <aeikum@codeweavers.com> ---
(In reply to Nicholas Kazlauskas from comment #74)
> (In reply to Michel D=C3=A4nzer from comment #73)
> > Looks like some client repeatedly calls XForceScreenSaver (probably to
> > prevent the monitors from blanking), which results in the DPMS property
> > getting re-set over and over. Nicholas, maybe the kernel could ignore s=
uch
> > no-op property "updates"?
>=20
> Even if it's no-op update it's still going to be locking the connector and
> potentially blocking other commits from occurring so ideally the client
> userspace wouldn't be dong this.
>=20

I've submitted a patch to Wine to throttle our calls to XResetScreenSaver to
once every five seconds: https://source.winehq.org/patches/data/169958

However, I'd argue our previous behavior isn't obviously wrong. What we were
doing was calling XResetScreenSaver each time we received user input on a
joystick in order to delay the screensaver coming up despite no keyboard/mo=
use
input. It's not obvious that this behavior was incorrect. Are you sure you
shouldn't be able to handle this behavior from a client?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687328071.4fbc0c55e.17574
Date: Tue, 17 Sep 2019 15:06:47 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - pageflipping seems to cause jittering on m=
ouse input when running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c81">Comme=
nt # 81</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - pageflipping seems to cause jittering on m=
ouse input when running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
aeikum&#64;codeweavers.com" title=3D"Andrew Eikum &lt;aeikum&#64;codeweaver=
s.com&gt;"> <span class=3D"fn">Andrew Eikum</span></a>
</span></b>
        <pre>(In reply to Nicholas Kazlauskas from <a href=3D"show_bug.cgi?=
id=3D110659#c74">comment #74</a>)
<span class=3D"quote">&gt; (In reply to Michel D=C3=A4nzer from <a href=3D"=
show_bug.cgi?id=3D110659#c73">comment #73</a>)
&gt; &gt; Looks like some client repeatedly calls XForceScreenSaver (probab=
ly to
&gt; &gt; prevent the monitors from blanking), which results in the DPMS pr=
operty
&gt; &gt; getting re-set over and over. Nicholas, maybe the kernel could ig=
nore such
&gt; &gt; no-op property &quot;updates&quot;?
&gt;=20
&gt; Even if it's no-op update it's still going to be locking the connector=
 and
&gt; potentially blocking other commits from occurring so ideally the client
&gt; userspace wouldn't be dong this.
&gt; </span >

I've submitted a patch to Wine to throttle our calls to XResetScreenSaver to
once every five seconds: <a href=3D"https://source.winehq.org/patches/data/=
169958">https://source.winehq.org/patches/data/169958</a>

However, I'd argue our previous behavior isn't obviously wrong. What we were
doing was calling XResetScreenSaver each time we received user input on a
joystick in order to delay the screensaver coming up despite no keyboard/mo=
use
input. It's not obvious that this behavior was incorrect. Are you sure you
shouldn't be able to handle this behavior from a client?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687328071.4fbc0c55e.17574--

--===============0606674505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0606674505==--
