Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2234479
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 12:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3E989395;
	Tue,  4 Jun 2019 10:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB20689395
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 10:37:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A7B8372167; Tue,  4 Jun 2019 10:37:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Tue, 04 Jun 2019 10:37:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rsalvaterra@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-ofUXheHQH2@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1524106499=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1524106499==
Content-Type: multipart/alternative; boundary="15596446551.d5B2.29574"
Content-Transfer-Encoding: 7bit


--15596446551.d5B2.29574
Date: Tue, 4 Jun 2019 10:37:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #32 from Rui Salvaterra <rsalvaterra@gmail.com> ---
(In reply to Richard Thier from comment #28)
> Hi Rui!

Hi, Richard!

> We should also thank Marek for him proposing a possible fix.

Yeah, Marek kicks ass, he's one of the original developers of r300g. :)

> I am on a single core, 32bit laptop with 1512-128MB of
> memory I got in 2007 and I think most of the hardware is like from 2005
> technology in it so I might be some among the slowest cross-compiling per=
son
> so please give a shot to put together a build environment yourself.

My Xpress 200M laptop has a Turion X2 TL-60 with 4 GiB of RAM, so I'll just
shut up. :P

> It is not that hard to build mesa, this was my first time doing so too! J=
ust
> believe in yourself and read the nice docs on the mesa page about building
> with meson.

I build my own kernels straight from Linus' git, but that's trivial.
I've never built Mesa, but I might as well just bite the bullet. ;) Somethi=
ng
tells my I'll be needing it soon, when I try to get a X1950 XT running on my
Power Mac G5. I have no idea about the current state of r300g on big-endian,
it's most likely bitrotted (I'd love to be wrong, though).

Speaking of which (and totally off-topic), how hard and/or beneficial would=
 it
be to also implement shader caching on r300g?

> If you have any questions of the build process look around
> phoronix or mesa docs and forums or if you give up just you can ask any
> people. Even I can help now and you will be able too after you build
> yourself once ;-)

Great! I often lurk around Phoronix too. I don't think I'll need extra help
after RTFM, but I appreciate it. Thanks a lot, Richard! :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596446551.d5B2.29574
Date: Tue, 4 Jun 2019 10:37:35 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c32">Comme=
nt # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rsalvaterra&#64;gmail.com" title=3D"Rui Salvaterra &lt;rsalvaterra&#64;gmai=
l.com&gt;"> <span class=3D"fn">Rui Salvaterra</span></a>
</span></b>
        <pre>(In reply to Richard Thier from <a href=3D"show_bug.cgi?id=3D1=
10781#c28">comment #28</a>)
<span class=3D"quote">&gt; Hi Rui!</span >

Hi, Richard!

<span class=3D"quote">&gt; We should also thank Marek for him proposing a p=
ossible fix.</span >

Yeah, Marek kicks ass, he's one of the original developers of r300g. :)

<span class=3D"quote">&gt; I am on a single core, 32bit laptop with 1512-12=
8MB of
&gt; memory I got in 2007 and I think most of the hardware is like from 2005
&gt; technology in it so I might be some among the slowest cross-compiling =
person
&gt; so please give a shot to put together a build environment yourself.</s=
pan >

My Xpress 200M laptop has a Turion X2 TL-60 with 4 GiB of RAM, so I'll just
shut up. :P

<span class=3D"quote">&gt; It is not that hard to build mesa, this was my f=
irst time doing so too! Just
&gt; believe in yourself and read the nice docs on the mesa page about buil=
ding
&gt; with meson.</span >

I build my own kernels straight from Linus' git, but that's trivial.
I've never built Mesa, but I might as well just bite the bullet. ;) Somethi=
ng
tells my I'll be needing it soon, when I try to get a X1950 XT running on my
Power Mac G5. I have no idea about the current state of r300g on big-endian,
it's most likely bitrotted (I'd love to be wrong, though).

Speaking of which (and totally off-topic), how hard and/or beneficial would=
 it
be to also implement shader caching on r300g?

<span class=3D"quote">&gt; If you have any questions of the build process l=
ook around
&gt; phoronix or mesa docs and forums or if you give up just you can ask any
&gt; people. Even I can help now and you will be able too after you build
&gt; yourself once ;-)</span >

Great! I often lurk around Phoronix too. I don't think I'll need extra help
after RTFM, but I appreciate it. Thanks a lot, Richard! :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596446551.d5B2.29574--

--===============1524106499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1524106499==--
