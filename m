Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEF6F693A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 15:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA646E629;
	Sun, 10 Nov 2019 14:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CACB6E673
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 14:00:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 39BA5720E2; Sun, 10 Nov 2019 14:00:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Sun, 10 Nov 2019 14:00:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-kZ61YIwk2m@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0225349788=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0225349788==
Content-Type: multipart/alternative; boundary="15733944283.ADab6B7D.18205"
Content-Transfer-Encoding: 7bit


--15733944283.ADab6B7D.18205
Date: Sun, 10 Nov 2019 14:00:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #34 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Daniel Suarez from comment #33)
> (In reply to Marko Popovic from comment #32)
> > (In reply to Daniel Suarez from comment #31)
> > > (In reply to Marko Popovic from comment #30)
> > > > (In reply to Daniel Suarez from comment #29)
> > > > > (In reply to Marko Popovic from comment #28)
> > > > > > I think this bug report can be closed now, Mesa 20 git basicall=
y fixes radv
> > > > > > related ring_gfx hangs, there is still hang that happens in Cit=
ra emulator
> > > > > > (ngg related) but AMD developers are aware of it so will probab=
ly get fixed
> > > > > > too.
> > > > >=20
> > > > > Yeah.. "soon". Still waiting for them to fix bug 111481
> > > >=20
> > > > SDMA hangs have nothing to do with ring_gfx hangs which were mostly=
 radv
> > > > related and are fixed now
> > >=20
> > > Still, I can't even play Vulkan titles reliably because the system
> > > constantly hangs even with the workarounds in the bug report. AMD rea=
lly
> > > needs to fix them.
> >=20
> > Mesa 20.0 should fix Vulkan hangs for you, and with nodma SDMA is disab=
led
> > fully so you can't get any hangs that are SDMA related.
>=20
> That workaround delays the hangs af best, and I have gotten hangs from
> OpenGl Games and also by using amdvlk.=20
>=20
> Don't get me wrong I'm not saying this bug report shouldn't be closed, I'm
> just saying that you saying "soon" is very misleading. AMD hasn't still
> properly fixed bugs that lead to hangs by just watching Firefox, and it's
> been MONTHS. "soon" for them is months apperantly

And where exactly did I say soon?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733944283.ADab6B7D.18205
Date: Sun, 10 Nov 2019 14:00:28 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c34">Comme=
nt # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to Daniel Suarez from <a href=3D"show_bug.cgi?id=3D1=
11763#c33">comment #33</a>)
<span class=3D"quote">&gt; (In reply to Marko Popovic from <a href=3D"show_=
bug.cgi?id=3D111763#c32">comment #32</a>)
&gt; &gt; (In reply to Daniel Suarez from <a href=3D"show_bug.cgi?id=3D1117=
63#c31">comment #31</a>)
&gt; &gt; &gt; (In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=
=3D111763#c30">comment #30</a>)
&gt; &gt; &gt; &gt; (In reply to Daniel Suarez from <a href=3D"show_bug.cgi=
?id=3D111763#c29">comment #29</a>)
&gt; &gt; &gt; &gt; &gt; (In reply to Marko Popovic from <a href=3D"show_bu=
g.cgi?id=3D111763#c28">comment #28</a>)
&gt; &gt; &gt; &gt; &gt; &gt; I think this bug report can be closed now, Me=
sa 20 git basically fixes radv
&gt; &gt; &gt; &gt; &gt; &gt; related ring_gfx hangs, there is still hang t=
hat happens in Citra emulator
&gt; &gt; &gt; &gt; &gt; &gt; (ngg related) but AMD developers are aware of=
 it so will probably get fixed
&gt; &gt; &gt; &gt; &gt; &gt; too.
&gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; Yeah.. &quot;soon&quot;. Still waiting for them to=
 fix <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481">bug 111481</a>
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; SDMA hangs have nothing to do with ring_gfx hangs which=
 were mostly radv
&gt; &gt; &gt; &gt; related and are fixed now
&gt; &gt; &gt;=20
&gt; &gt; &gt; Still, I can't even play Vulkan titles reliably because the =
system
&gt; &gt; &gt; constantly hangs even with the workarounds in the bug report=
. AMD really
&gt; &gt; &gt; needs to fix them.
&gt; &gt;=20
&gt; &gt; Mesa 20.0 should fix Vulkan hangs for you, and with nodma SDMA is=
 disabled
&gt; &gt; fully so you can't get any hangs that are SDMA related.
&gt;=20
&gt; That workaround delays the hangs af best, and I have gotten hangs from
&gt; OpenGl Games and also by using amdvlk.=20
&gt;=20
&gt; Don't get me wrong I'm not saying this bug report shouldn't be closed,=
 I'm
&gt; just saying that you saying &quot;soon&quot; is very misleading. AMD h=
asn't still
&gt; properly fixed bugs that lead to hangs by just watching Firefox, and i=
t's
&gt; been MONTHS. &quot;soon&quot; for them is months apperantly</span >

And where exactly did I say soon?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733944283.ADab6B7D.18205--

--===============0225349788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0225349788==--
