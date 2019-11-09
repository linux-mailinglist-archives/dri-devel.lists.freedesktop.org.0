Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BA9F5F29
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 13:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECA86E2F9;
	Sat,  9 Nov 2019 12:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C1CB6E30F
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 12:42:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 78824720E2; Sat,  9 Nov 2019 12:42:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Sat, 09 Nov 2019 12:42:56 +0000
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
Message-ID: <bug-111763-502-YLopidjHt5@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1059597594=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1059597594==
Content-Type: multipart/alternative; boundary="15733033762.De17B97.10367"
Content-Transfer-Encoding: 7bit


--15733033762.De17B97.10367
Date: Sat, 9 Nov 2019 12:42:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #26 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Ben Klein from comment #25)
> Created attachment 145918 [details]
> Journal excerpt vega56 ring gfx timeout, then gpu reset
>=20
> I think I'm having this problem on a Vega 56, I didn't see anyone else
> mention that card here.
>=20
> I attached the relevant log, I think it's this same issue, but someone
> correct me if I'm wrong.
>=20
> OpenGL renderer string: Radeon RX Vega (VEGA10, DRM 3.33.0,
> 5.3.0-20-generic, LLVM 9.0.0)
> OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.1
>=20
> Running Pop!_OS:
> Linux robo-triangulum 5.3.0-20-generic
> #21+system76~1572304854~19.10~8caa3e6-Ubuntu SMP Tue Oct 29 00:4 x86_64
> x86_64 x86_64 GNU/Linux

Could be, there are a few patches in latest RADV, so try out MESA 20.0 git =
to
see if it fixes anything for you... apparently radv hangs for navi gpus sto=
pped
with that fix.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733033762.De17B97.10367
Date: Sat, 9 Nov 2019 12:42:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to Ben Klein from <a href=3D"show_bug.cgi?id=3D11176=
3#c25">comment #25</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145918" name=3D"attach_145918" title=3D"Journal excerpt vega56 ring=
 gfx timeout, then gpu reset">attachment 145918</a> <a href=3D"attachment.c=
gi?id=3D145918&amp;action=3Dedit" title=3D"Journal excerpt vega56 ring gfx =
timeout, then gpu reset">[details]</a></span>
&gt; Journal excerpt vega56 ring gfx timeout, then gpu reset
&gt;=20
&gt; I think I'm having this problem on a Vega 56, I didn't see anyone else
&gt; mention that card here.
&gt;=20
&gt; I attached the relevant log, I think it's this same issue, but someone
&gt; correct me if I'm wrong.
&gt;=20
&gt; OpenGL renderer string: Radeon RX Vega (VEGA10, DRM 3.33.0,
&gt; 5.3.0-20-generic, LLVM 9.0.0)
&gt; OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.1
&gt;=20
&gt; Running Pop!_OS:
&gt; Linux robo-triangulum 5.3.0-20-generic
&gt; #21+system76~1572304854~19.10~8caa3e6-Ubuntu SMP Tue Oct 29 00:4 x86_64
&gt; x86_64 x86_64 GNU/Linux</span >

Could be, there are a few patches in latest RADV, so try out MESA 20.0 git =
to
see if it fixes anything for you... apparently radv hangs for navi gpus sto=
pped
with that fix.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733033762.De17B97.10367--

--===============1059597594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1059597594==--
