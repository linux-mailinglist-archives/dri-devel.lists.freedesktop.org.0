Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD49CC4EA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 23:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100A6E340;
	Fri,  4 Oct 2019 21:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E30F6E340
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 21:40:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 578E972167; Fri,  4 Oct 2019 21:40:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 04 Oct 2019 21:40:02 +0000
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
Message-ID: <bug-111481-502-RsA2GmKN7R@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1666459699=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1666459699==
Content-Type: multipart/alternative; boundary="15702252021.ecDAbE8a.21050"
Content-Transfer-Encoding: 7bit


--15702252021.ecDAbE8a.21050
Date: Fri, 4 Oct 2019 21:40:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #72 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Shmerl from comment #71)
> (In reply to Marko Popovic from comment #70)
> >=20
> > Yes, I can confirm that with 5.4 RC1 and MESA-git from 04.10. (with radv
> > patches included) I can reproduce all 4 types of hangs, random desktop =
hang,
> > Rise of the Tomb Raider Hang, Starcraft II hang and even Citra hang
> > (eventhough those patches supposedly fix the ngg) so that's a huge bumm=
er.
>=20
> Just to clarify, those fixes were added post rc1 tag, so you'd need to bu=
ild
> the master branch of Linus's repo (it would produce 5.4-rc1+).

Sorry I wrote poorly, I'm using 5.4 daily build.

These hangs on Navi seem to be quite a hard nut to crack for AMD it seems, =
they
are trying with different types of patches from amdgpu, firmware, kernel and
even mesa, and yet nothing ever changes :(

Maybe this issue should get a high priority at least considering that hangs
basically render desktop unusable for many things, quite a few dxvk games
produce hangs even with nodma and nongg applied, so no idea what could be g=
oing
on there. Why do those flags work for some things and not for the others...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15702252021.ecDAbE8a.21050
Date: Fri, 4 Oct 2019 21:40:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c72">Comme=
nt # 72</a>
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
        <pre>(In reply to Shmerl from <a href=3D"show_bug.cgi?id=3D111481#c=
71">comment #71</a>)
<span class=3D"quote">&gt; (In reply to Marko Popovic from <a href=3D"show_=
bug.cgi?id=3D111481#c70">comment #70</a>)
&gt; &gt;=20
&gt; &gt; Yes, I can confirm that with 5.4 RC1 and MESA-git from 04.10. (wi=
th radv
&gt; &gt; patches included) I can reproduce all 4 types of hangs, random de=
sktop hang,
&gt; &gt; Rise of the Tomb Raider Hang, Starcraft II hang and even Citra ha=
ng
&gt; &gt; (eventhough those patches supposedly fix the ngg) so that's a hug=
e bummer.
&gt;=20
&gt; Just to clarify, those fixes were added post rc1 tag, so you'd need to=
 build
&gt; the master branch of Linus's repo (it would produce 5.4-rc1+).</span >

Sorry I wrote poorly, I'm using 5.4 daily build.

These hangs on Navi seem to be quite a hard nut to crack for AMD it seems, =
they
are trying with different types of patches from amdgpu, firmware, kernel and
even mesa, and yet nothing ever changes :(

Maybe this issue should get a high priority at least considering that hangs
basically render desktop unusable for many things, quite a few dxvk games
produce hangs even with nodma and nongg applied, so no idea what could be g=
oing
on there. Why do those flags work for some things and not for the others...=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15702252021.ecDAbE8a.21050--

--===============1666459699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1666459699==--
