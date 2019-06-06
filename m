Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B8C36A4D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 05:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3EB8972D;
	Thu,  6 Jun 2019 03:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 290FE89755
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 03:02:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 23DF872167; Thu,  6 Jun 2019 03:02:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Thu, 06 Jun 2019 03:02:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: randrik@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-uvEh5NbCUK@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0893369746=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0893369746==
Content-Type: multipart/alternative; boundary="15597901651.0475.8368"
Content-Transfer-Encoding: 7bit


--15597901651.0475.8368
Date: Thu, 6 Jun 2019 03:02:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #42 from Andrew Randrianasulu <randrik@mail.ru> ---
(In reply to Rui Salvaterra from comment #41)
> Hi, guys
>=20
> I haven't tried Marek's solution yet. It's the first time I build Mesa fr=
om
> scratch and I've never used Meson before, so I'm studying along the way. I
> applied the patch, configured with no DRI drivers and only the r300g driv=
er,
> compiled and installed to the default location
> (/usr/local/lib/x86_64-linux-gnu, it seems). Unfortunately, glxinfo can't
> find the libraries when I point the environment variables to them, so I m=
ust
> have done something stupid. Will dig deeper.
> (I know this isn't a developer support thread, I just wanted you to know I
> haven't given up or stopped!)

meson actually accepts prefix , so I use it like this (from BUILD dir inside
mesa tree):

meson ../ --prefix=3D/usr/X11R7 rest_of_options (obviously, for x86-64 pref=
ix
will be diffeent, I just wanted to say I have non-standard X prefix and ins=
tall
mesa into it just fine)

full line in my case looks like:
meson ../ --prefix=3D/usr/X11R7 --strip --buildtype debugoptimized -Degl=3D=
true
-Ddri-drivers=3Dr100,r200,i965,nouveau -Dplatforms=3Ddrm,x11
-Dgallium-drivers=3Di915,r600,radeonsi,swrast,virgl,nouveau,r300
-Dvulkan-drivers=3Damd,intel  -Dgallium-nine=3Dtrue -Dgallium-opencl=3Dicd
-Dgallium-va=3Dtrue -Dgallium-xvmc=3Dtrue -Dgallium-xa=3Dfalse

You probably want to add --reconfigure if you re-run meson after some git p=
ull
from same BUILD directory.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597901651.0475.8368
Date: Thu, 6 Jun 2019 03:02:45 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c42">Comme=
nt # 42</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>(In reply to Rui Salvaterra from <a href=3D"show_bug.cgi?id=3D=
110781#c41">comment #41</a>)
<span class=3D"quote">&gt; Hi, guys
&gt;=20
&gt; I haven't tried Marek's solution yet. It's the first time I build Mesa=
 from
&gt; scratch and I've never used Meson before, so I'm studying along the wa=
y. I
&gt; applied the patch, configured with no DRI drivers and only the r300g d=
river,
&gt; compiled and installed to the default location
&gt; (/usr/local/lib/x86_64-linux-gnu, it seems). Unfortunately, glxinfo ca=
n't
&gt; find the libraries when I point the environment variables to them, so =
I must
&gt; have done something stupid. Will dig deeper.
&gt; (I know this isn't a developer support thread, I just wanted you to kn=
ow I
&gt; haven't given up or stopped!)</span >

meson actually accepts prefix , so I use it like this (from BUILD dir inside
mesa tree):

meson ../ --prefix=3D/usr/X11R7 rest_of_options (obviously, for x86-64 pref=
ix
will be diffeent, I just wanted to say I have non-standard X prefix and ins=
tall
mesa into it just fine)

full line in my case looks like:
meson ../ --prefix=3D/usr/X11R7 --strip --buildtype debugoptimized -Degl=3D=
true
-Ddri-drivers=3Dr100,r200,i965,nouveau -Dplatforms=3Ddrm,x11
-Dgallium-drivers=3Di915,r600,radeonsi,swrast,virgl,nouveau,r300
-Dvulkan-drivers=3Damd,intel  -Dgallium-nine=3Dtrue -Dgallium-opencl=3Dicd
-Dgallium-va=3Dtrue -Dgallium-xvmc=3Dtrue -Dgallium-xa=3Dfalse

You probably want to add --reconfigure if you re-run meson after some git p=
ull
from same BUILD directory.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597901651.0475.8368--

--===============0893369746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0893369746==--
