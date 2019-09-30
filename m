Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CA8C2941
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 00:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3616E4B3;
	Mon, 30 Sep 2019 22:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCF3E89DB7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 22:02:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C57B572162; Mon, 30 Sep 2019 22:02:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Mon, 30 Sep 2019 22:02:23 +0000
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
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-56ArTrxQSf@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2110600511=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2110600511==
Content-Type: multipart/alternative; boundary="15698809420.Fe4Bd4D7.28164"
Content-Transfer-Encoding: 7bit


--15698809420.Fe4Bd4D7.28164
Date: Mon, 30 Sep 2019 22:02:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #8 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Doug Ty from comment #7)
> (In reply to Marko Popovic from comment #6)
> > (In reply to Doug Ty from comment #5)
> > > I've been getting this too with Minecraft:=20=20
> > > https://bugs.freedesktop.org/show_bug.cgi?id=3D111669
> > >=20
> > > For my particular case at least, AMD_DEBUG=3Dnodma seems to fix it
> >=20
> > You are refering to sdma0 / sdma1 type hang which is tracked
> > here:https://bugs.freedesktop.org/show_bug.cgi?id=3D111481
> >=20
> > For ring_gfx hangs they're quite more reproducible and are not affected=
 by
> > AMD_DEBUG=3Dnodma or AMD_DEBUG=3Dnongg which I already mentioned above =
in the
> > bug description.
>=20
> Sorry, but this is incorrect. My Minecraft hang is most definitely a ring
> gfx hang, *not* sdma. I've posted logs and apitraces in the linked thread=
 if
> you'd like to check for yourself.
>=20
> I can't explain why nodma isn't working for you, perhaps it doesn't work =
for
> game? Have you tried putting it in /etc/environment so it's system-wide? I
> don't know what to tell you regarding nodma, but my hang is definitely ri=
ng
> gfx as well.

I guess we just have many different types of hangs then... ring_gfx hangs a=
re
more mysterious than sdma0/1 hangs it seems, since there is no "universal"
workaround for them. nodma works for stopping global sdma-type hangs for me,
nongg works for stopping the citra-related hang of ring_gfx type, but none =
of
those 2 variables work for stopping Starcraft II and RoTR ring_gfx-type han=
gs
for me, so it's really really confusing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698809420.Fe4Bd4D7.28164
Date: Mon, 30 Sep 2019 22:02:22 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to Doug Ty from <a href=3D"show_bug.cgi?id=3D111763#=
c7">comment #7</a>)
<span class=3D"quote">&gt; (In reply to Marko Popovic from <a href=3D"show_=
bug.cgi?id=3D111763#c6">comment #6</a>)
&gt; &gt; (In reply to Doug Ty from <a href=3D"show_bug.cgi?id=3D111763#c5"=
>comment #5</a>)
&gt; &gt; &gt; I've been getting this too with Minecraft:=20=20
&gt; &gt; &gt; <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - Navi GPU hang in Minecraft"
   href=3D"show_bug.cgi?id=3D111669">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111669</a>
&gt; &gt; &gt;=20
&gt; &gt; &gt; For my particular case at least, AMD_DEBUG=3Dnodma seems to =
fix it
&gt; &gt;=20
&gt; &gt; You are refering to sdma0 / sdma1 type hang which is tracked
&gt; &gt; here:<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111481</a>
&gt; &gt;=20
&gt; &gt; For ring_gfx hangs they're quite more reproducible and are not af=
fected by
&gt; &gt; AMD_DEBUG=3Dnodma or AMD_DEBUG=3Dnongg which I already mentioned =
above in the
&gt; &gt; bug description.
&gt;=20
&gt; Sorry, but this is incorrect. My Minecraft hang is most definitely a r=
ing
&gt; gfx hang, *not* sdma. I've posted logs and apitraces in the linked thr=
ead if
&gt; you'd like to check for yourself.
&gt;=20
&gt; I can't explain why nodma isn't working for you, perhaps it doesn't wo=
rk for
&gt; game? Have you tried putting it in /etc/environment so it's system-wid=
e? I
&gt; don't know what to tell you regarding nodma, but my hang is definitely=
 ring
&gt; gfx as well.</span >

I guess we just have many different types of hangs then... ring_gfx hangs a=
re
more mysterious than sdma0/1 hangs it seems, since there is no &quot;univer=
sal&quot;
workaround for them. nodma works for stopping global sdma-type hangs for me,
nongg works for stopping the citra-related hang of ring_gfx type, but none =
of
those 2 variables work for stopping Starcraft II and RoTR ring_gfx-type han=
gs
for me, so it's really really confusing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698809420.Fe4Bd4D7.28164--

--===============2110600511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2110600511==--
