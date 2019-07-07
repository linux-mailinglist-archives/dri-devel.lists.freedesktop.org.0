Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D3615B9
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 19:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37B589A0E;
	Sun,  7 Jul 2019 17:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA2DA89A0E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 17:42:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D757472168; Sun,  7 Jul 2019 17:42:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 07 Jul 2019 17:42:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-ykKjT0tIBQ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1295137242=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1295137242==
Content-Type: multipart/alternative; boundary="15625213342.9C9bD2.31447"
Content-Transfer-Encoding: 7bit


--15625213342.9C9bD2.31447
Date: Sun, 7 Jul 2019 17:42:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #38 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
On Sun, Jul 07, 2019 at 05:31:34AM +0000, bugzilla-daemon@freedesktop.org
wrote:
> 2. Valve sponsored an interesting project that removes dependency of AMD =
Mesa
> from LLVM. And instead uses ACO. Valve made this available for Arch based
> systems via AUR, and Ubuntu based system via PPA. If you want to test it,=
 you
> can check the posts below. I am going to test this myself on both Arch and
> Ubuntu.=20
> https://steamcommunity.com/games/221410/announcements/detail/160263460963=
6894200
> https://steamcommunity.com/app/221410/discussions/0/1640915206474070669/

Huho!

Cons:
    - it's c++
    - only GFX8 and GFX9 (I have GFX6 :( )
    - some nasty python scripts (there are tons in mesa)

Pros:
    - it's several orders of magnitude less brain f*cked than llvm.
    - it is actual working code which does disjoint mesa from llvm.

conclusion:
    - for GFX8 and GFX9, it's less worse than llvm.
    - I was asking for a clean GCN ABI definition document from shaders
      perspective, maybe this code will help to write one (or it is an AMD
      confidential document??).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15625213342.9C9bD2.31447
Date: Sun, 7 Jul 2019 17:42:14 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c38">Comme=
nt # 38</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre>On Sun, Jul 07, 2019 at 05:31:34AM +0000, <a href=3D"mailto:bu=
gzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>
wrote:
<span class=3D"quote">&gt; 2. Valve sponsored an interesting project that r=
emoves dependency of AMD Mesa
&gt; from LLVM. And instead uses ACO. Valve made this available for Arch ba=
sed
&gt; systems via AUR, and Ubuntu based system via PPA. If you want to test =
it, you
&gt; can check the posts below. I am going to test this myself on both Arch=
 and
&gt; Ubuntu.=20
&gt; <a href=3D"https://steamcommunity.com/games/221410/announcements/detai=
l/1602634609636894200">https://steamcommunity.com/games/221410/announcement=
s/detail/1602634609636894200</a>
&gt; <a href=3D"https://steamcommunity.com/app/221410/discussions/0/1640915=
206474070669/">https://steamcommunity.com/app/221410/discussions/0/16409152=
06474070669/</a></span >

Huho!

Cons:
    - it's c++
    - only GFX8 and GFX9 (I have GFX6 :( )
    - some nasty python scripts (there are tons in mesa)

Pros:
    - it's several orders of magnitude less brain f*cked than llvm.
    - it is actual working code which does disjoint mesa from llvm.

conclusion:
    - for GFX8 and GFX9, it's less worse than llvm.
    - I was asking for a clean GCN ABI definition document from shaders
      perspective, maybe this code will help to write one (or it is an AMD
      confidential document??).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15625213342.9C9bD2.31447--

--===============1295137242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1295137242==--
