Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A1F80BA2
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 18:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171DE89DA2;
	Sun,  4 Aug 2019 16:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8090489D67
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 16:17:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7726772167; Sun,  4 Aug 2019 16:17:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 04 Aug 2019 16:17:41 +0000
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
Message-ID: <bug-109955-502-HfuqG7SZwM@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0896237778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0896237778==
Content-Type: multipart/alternative; boundary="15649354610.cA2Dfe.24365"
Content-Transfer-Encoding: 7bit


--15649354610.cA2Dfe.24365
Date: Sun, 4 Aug 2019 16:17:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #78 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Sylvain BERTRAND from comment #77)
> On Sun, Aug 04, 2019 at 05:05:52AM +0000, bugzilla-daemon@freedesktop.org
> wrote:
> > By the way, Interesting to see that even my ubuntu budgie LTS with valve
> > mesa-aco and different kernel, has the same warning.
> > [    5.739656] amdgpu 0000:0a:00.0: Direct firmware load for
> > amdgpu/vega20_ta.bin failed with error -2
> > [    5.739659] amdgpu 0000:0a:00.0: psp v11.0: Failed to load firmware
> > "amdgpu/vega20_ta.bin"
>=20
> I don't know of an AMD GPU part able to run without properly loaded firmw=
are.
>=20
> That would have to be confirmed by official AMD devs which are the sole p=
pl
> with that knowledge.
>=20
> In the very probable case that the firmware _must_ be loaded for proper g=
pu
> operations, you have to tell the maintainers of the distros you use to up=
date
> their linux/amdgpu firmware package.

I believe so, and yes it makes total sense that you need the correct firmwa=
re
for a piece of hardware to work properly.=20
I will open bugs for openSUSE and ubuntu, and ask the questions, point to t=
his
bug tracker. Let's see what comes out. I will report back as I hear from
distribution maintainers.=20

I am using a RadeonVII at the moment. Is there anyone with a Vega64 or Vega=
56
that can do the same tests and let me know if they see same issue? I am hap=
py
to include those cards in my same bug reports if someone can confirm.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15649354610.cA2Dfe.24365
Date: Sun, 4 Aug 2019 16:17:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c78">Comme=
nt # 78</a>
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
=3D109955#c77">comment #77</a>)
<span class=3D"quote">&gt; On Sun, Aug 04, 2019 at 05:05:52AM +0000, <a hre=
f=3D"mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freede=
sktop.org</a>
&gt; wrote:
&gt; &gt; By the way, Interesting to see that even my ubuntu budgie LTS wit=
h valve
&gt; &gt; mesa-aco and different kernel, has the same warning.
&gt; &gt; [    5.739656] amdgpu 0000:0a:00.0: Direct firmware load for
&gt; &gt; amdgpu/vega20_ta.bin failed with error -2
&gt; &gt; [    5.739659] amdgpu 0000:0a:00.0: psp v11.0: Failed to load fir=
mware
&gt; &gt; &quot;amdgpu/vega20_ta.bin&quot;
&gt;=20
&gt; I don't know of an AMD GPU part able to run without properly loaded fi=
rmware.
&gt;=20
&gt; That would have to be confirmed by official AMD devs which are the sol=
e ppl
&gt; with that knowledge.
&gt;=20
&gt; In the very probable case that the firmware _must_ be loaded for prope=
r gpu
&gt; operations, you have to tell the maintainers of the distros you use to=
 update
&gt; their linux/amdgpu firmware package.</span >

I believe so, and yes it makes total sense that you need the correct firmwa=
re
for a piece of hardware to work properly.=20
I will open bugs for openSUSE and ubuntu, and ask the questions, point to t=
his
bug tracker. Let's see what comes out. I will report back as I hear from
distribution maintainers.=20

I am using a RadeonVII at the moment. Is there anyone with a Vega64 or Vega=
56
that can do the same tests and let me know if they see same issue? I am hap=
py
to include those cards in my same bug reports if someone can confirm.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15649354610.cA2Dfe.24365--

--===============0896237778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0896237778==--
