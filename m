Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D41C105B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 11:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779D26E0DA;
	Sat, 28 Sep 2019 09:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3F036E0DA
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 09:21:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F168472162; Sat, 28 Sep 2019 09:05:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Sat, 28 Sep 2019 09:05:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@postfach.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-ABw3RXFIDE@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1842725464=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1842725464==
Content-Type: multipart/alternative; boundary="15696615300.b3cCad7.26749"
Content-Transfer-Encoding: 7bit


--15696615300.b3cCad7.26749
Date: Sat, 28 Sep 2019 09:05:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #21 from Robert <freedesktop@postfach.xyz> ---
(In reply to Leon from comment #18)
> I have the same problem. Sapphire 5700 XT Nitro, x470 motherboard (asrock
> taichi), running arch with kernel 5.3.1. My resolution is 2560x1440 144Hz,
> with 30Watts idle and 70 Celsius at the memory :( ... Unlike you changing
> the refresh rate doesn't seem to improve anything though, and I don't have
> the same problem using windows 10.

You definitely need to either wait for kernel 5.4rc1 for the idle power
consumption thingy to be fixed or if you use Archlinux you can use this
solution for now: https://bbs.archlinux.org/viewtopic.php?pid=3D1865600#p18=
65600
Or you compile this kernel source on your own:
https://cgit.freedesktop.org/~agd5f/linux/tag/?h=3Ddrm-next-5.4-2019-08-30

Kernel 5.3 has a fixed setting for idle power consumption. I haven't found =
any
way to reduce idle power consumption with this kernel version.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696615300.b3cCad7.26749
Date: Sat, 28 Sep 2019 09:05:30 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c21">Comme=
nt # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;postfach.xyz" title=3D"Robert &lt;freedesktop&#64;postfach.=
xyz&gt;"> <span class=3D"fn">Robert</span></a>
</span></b>
        <pre>(In reply to Leon from <a href=3D"show_bug.cgi?id=3D111482#c18=
">comment #18</a>)
<span class=3D"quote">&gt; I have the same problem. Sapphire 5700 XT Nitro,=
 x470 motherboard (asrock
&gt; taichi), running arch with kernel 5.3.1. My resolution is 2560x1440 14=
4Hz,
&gt; with 30Watts idle and 70 Celsius at the memory :( ... Unlike you chang=
ing
&gt; the refresh rate doesn't seem to improve anything though, and I don't =
have
&gt; the same problem using windows 10.</span >

You definitely need to either wait for kernel 5.4rc1 for the idle power
consumption thingy to be fixed or if you use Archlinux you can use this
solution for now: <a href=3D"https://bbs.archlinux.org/viewtopic.php?pid=3D=
1865600#p1865600">https://bbs.archlinux.org/viewtopic.php?pid=3D1865600#p18=
65600</a>
Or you compile this kernel source on your own:
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/tag/?h=3Ddrm-next-5.4-=
2019-08-30">https://cgit.freedesktop.org/~agd5f/linux/tag/?h=3Ddrm-next-5.4=
-2019-08-30</a>

Kernel 5.3 has a fixed setting for idle power consumption. I haven't found =
any
way to reduce idle power consumption with this kernel version.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696615300.b3cCad7.26749--

--===============1842725464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1842725464==--
