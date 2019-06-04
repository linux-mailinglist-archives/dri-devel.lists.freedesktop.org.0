Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B8343A5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 12:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B5589598;
	Tue,  4 Jun 2019 10:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67BBE89598
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 10:02:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5EE5E72167; Tue,  4 Jun 2019 10:02:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Tue, 04 Jun 2019 10:02:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-eQiZTj1vvq@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0529348238=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0529348238==
Content-Type: multipart/alternative; boundary="15596425220.4EcCa56.20292"
Content-Transfer-Encoding: 7bit


--15596425220.4EcCa56.20292
Date: Tue, 4 Jun 2019 10:02:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #28 from Richard Thier <u9vata@gmail.com> ---
Hi Rui!

We should also thank Marek for him proposing a possible fix. I am currently
creating a "less hacky" solution based on that attachment and a better idea=
 to
not always force VRAM domain, but only if the r300 caller codes ask "VRAM or
something" and forcing GTT if it asks "GTT or something - but not VRAM". Th=
is
basically lead to the driver favoring the domain choice to be in VRAM, but
still supporting other things if the caller asks other domains directly.

Also incorporating the parts that Marek proposes is much better and cleaner
than my hack that just sets the flag right before it is read.

After I am completed with these changes and their testing I will publish it
here and only maybe then have any time to compile an x86_64 version for oth=
er
people. I highly suggest however for you and others to just grab the latest
revision from git and apply the changesets until the solution arrives in me=
sa
releases. I am on a single core, 32bit laptop with 1512-128MB of memory I g=
ot
in 2007 and I think most of the hardware is like from 2005 technology in it=
 so
I might be some among the slowest cross-compiling person so please give a s=
hot
to put together a build environment yourself.

It is not that hard to build mesa, this was my first time doing so too! Just
believe in yourself and read the nice docs on the mesa page about building =
with
meson. If you have any questions of the build process look around phoronix =
or
mesa docs and forums or if you give up just you can ask any people. Even I =
can
help now and you will be able too after you build yourself once ;-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596425220.4EcCa56.20292
Date: Tue, 4 Jun 2019 10:02:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c28">Comme=
nt # 28</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>Hi Rui!

We should also thank Marek for him proposing a possible fix. I am currently
creating a &quot;less hacky&quot; solution based on that attachment and a b=
etter idea to
not always force VRAM domain, but only if the r300 caller codes ask &quot;V=
RAM or
something&quot; and forcing GTT if it asks &quot;GTT or something - but not=
 VRAM&quot;. This
basically lead to the driver favoring the domain choice to be in VRAM, but
still supporting other things if the caller asks other domains directly.

Also incorporating the parts that Marek proposes is much better and cleaner
than my hack that just sets the flag right before it is read.

After I am completed with these changes and their testing I will publish it
here and only maybe then have any time to compile an x86_64 version for oth=
er
people. I highly suggest however for you and others to just grab the latest
revision from git and apply the changesets until the solution arrives in me=
sa
releases. I am on a single core, 32bit laptop with 1512-128MB of memory I g=
ot
in 2007 and I think most of the hardware is like from 2005 technology in it=
 so
I might be some among the slowest cross-compiling person so please give a s=
hot
to put together a build environment yourself.

It is not that hard to build mesa, this was my first time doing so too! Just
believe in yourself and read the nice docs on the mesa page about building =
with
meson. If you have any questions of the build process look around phoronix =
or
mesa docs and forums or if you give up just you can ask any people. Even I =
can
help now and you will be able too after you build yourself once ;-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596425220.4EcCa56.20292--

--===============0529348238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0529348238==--
