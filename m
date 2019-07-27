Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 090507786D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 13:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFAD6EEA5;
	Sat, 27 Jul 2019 11:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C9826EEA1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 11:28:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 68B1D72167; Sat, 27 Jul 2019 11:28:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 27 Jul 2019 11:28:28 +0000
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
Message-ID: <bug-109955-502-JxFJJfwbxk@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2044222279=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2044222279==
Content-Type: multipart/alternative; boundary="15642269082.b1daE7c77.14166"
Content-Transfer-Encoding: 7bit


--15642269082.b1daE7c77.14166
Date: Sat, 27 Jul 2019 11:28:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #68 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Sylvain BERTRAND from comment #67)
> > ...
> > Vulkan/DXVK
>=20
> The bugs may be in wine/DXVK then. You should report to a bug to them and
> link
> this bug to theirs.

If any of you opened bugs on other bug trackers, please post a link here so=
 we
can all contribute to both.

I did some test on my end and I can report the following:

System info:
OS: Ubuntu 18.04.2 LTS x86_64=20
Kernel: 5.0.0-21-generic
Resolution: 3440x1440
CPU: AMD Ryzen 7 2700X (16) @ 3.700G=20
GPU: AMD Vega 20=20
Memory: 2650MiB / 64398MiB
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.2

1. Power profile set to manual did not help
2. Mesa-ACO from valve seem to have helped quite a bit. So far, no system
freezes

I installed Arch on another SSD and will try to reproduce the same tests:
1. Plain Arch - crash or not ?
2. Arch with forced power profile - crash or not ?
3- Arch with mesa-ACO - crash or not ?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642269082.b1daE7c77.14166
Date: Sat, 27 Jul 2019 11:28:28 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c68">Comme=
nt # 68</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Sylvain BERTRAND from <a href=3D"show_bug.cgi?id=
=3D109955#c67">comment #67</a>)
<span class=3D"quote">&gt; &gt; ...
&gt; &gt; Vulkan/DXVK
&gt;=20
&gt; The bugs may be in wine/DXVK then. You should report to a bug to them =
and
&gt; link
&gt; this bug to theirs.</span >

If any of you opened bugs on other bug trackers, please post a link here so=
 we
can all contribute to both.

I did some test on my end and I can report the following:

System info:
OS: Ubuntu 18.04.2 LTS x86_64=20
Kernel: 5.0.0-21-generic
Resolution: 3440x1440
CPU: AMD Ryzen 7 2700X (16) &#64; 3.700G=20
GPU: AMD Vega 20=20
Memory: 2650MiB / 64398MiB
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.2

1. Power profile set to manual did not help
2. Mesa-ACO from valve seem to have helped quite a bit. So far, no system
freezes

I installed Arch on another SSD and will try to reproduce the same tests:
1. Plain Arch - crash or not ?
2. Arch with forced power profile - crash or not ?
3- Arch with mesa-ACO - crash or not ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642269082.b1daE7c77.14166--

--===============2044222279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2044222279==--
