Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD9CCD0B
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 00:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E582D6E3EF;
	Sat,  5 Oct 2019 22:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 234F26E402
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 22:17:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2073F72162; Sat,  5 Oct 2019 22:17:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sat, 05 Oct 2019 22:17:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-lBPIPaJoCZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0312599415=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0312599415==
Content-Type: multipart/alternative; boundary="15703138582.ebBf.30808"
Content-Transfer-Encoding: 7bit


--15703138582.ebBf.30808
Date: Sat, 5 Oct 2019 22:17:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #75 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to ans.belfodil from comment #73)
> According to this
> https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DAMDGPU-Bulk-Moves=
-Lands
> and my tests (Linux 5.3.1 and packages from
> https://pkgbuild.com/~lcarlier/mesa-git/x86_64/), the hangs are gone on
> Rocket League.

I was able to reproduce the RL hang by running Rocket League 2 times, so it=
's
definitely not gone, also I don't see how those patches would affect the la=
unch
of Rocket League anyways, it uses OpenGL and induces SDMA type hang, and th=
ose
patches are for RADV vulkan driver and ngg (which are different type of han=
gs
that show themselves as ring_gfx hangs)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15703138582.ebBf.30808
Date: Sat, 5 Oct 2019 22:17:38 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c75">Comme=
nt # 75</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to ans.belfodil from <a href=3D"show_bug.cgi?id=3D11=
1481#c73">comment #73</a>)
<span class=3D"quote">&gt; According to this
&gt; <a href=3D"https://www.phoronix.com/scan.php?page=3Dnews_item&amp;px=
=3DAMDGPU-Bulk-Moves-Lands">https://www.phoronix.com/scan.php?page=3Dnews_i=
tem&amp;px=3DAMDGPU-Bulk-Moves-Lands</a>
&gt; and my tests (Linux 5.3.1 and packages from
&gt; <a href=3D"https://pkgbuild.com/~lcarlier/mesa-git/x86_64/">https://pk=
gbuild.com/~lcarlier/mesa-git/x86_64/</a>), the hangs are gone on
&gt; Rocket League.</span >

I was able to reproduce the RL hang by running Rocket League 2 times, so it=
's
definitely not gone, also I don't see how those patches would affect the la=
unch
of Rocket League anyways, it uses OpenGL and induces SDMA type hang, and th=
ose
patches are for RADV vulkan driver and ngg (which are different type of han=
gs
that show themselves as ring_gfx hangs)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15703138582.ebBf.30808--

--===============0312599415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0312599415==--
