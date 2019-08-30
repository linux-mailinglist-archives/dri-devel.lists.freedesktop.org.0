Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB91A412C
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 01:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D676E132;
	Fri, 30 Aug 2019 23:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41A806E132
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 23:57:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 391FC72161; Fri, 30 Aug 2019 23:57:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111241] Shadertoy shader causing hang
Date: Fri, 30 Aug 2019 23:57:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111241-502-1Q40PVnB81@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111241-502@http.bugs.freedesktop.org/>
References: <bug-111241-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0053131477=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0053131477==
Content-Type: multipart/alternative; boundary="15672094560.045E7.22501"
Content-Transfer-Encoding: 7bit


--15672094560.045E7.22501
Date: Fri, 30 Aug 2019 23:57:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111241

--- Comment #12 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #11)
> (In reply to Dieter N=C3=BCtzel from comment #8)
> > BTW
> >=20
> > Pierre-Eric can you look into this
> >=20
> > Shadertoy shader corruption, too?
> > https://www.shadertoy.com/view/Xt3cWS
> >
>=20
> The "Buffer A" shader doesn't write fragColor when uv.y is < 0.1 or > 0.9.
>=20
> So the content is undefined and may be black on some platform or random.
>=20
> radeonsi is correct here, but we might want to replace undef values with =
0x0
> to get a default value instead of random.

Cool to have you around for bug hunting...;-)

Any hints where I shoud change 'undef values with 0x0' for testing?

And sorry that I 'hijacked' this thread - should I open a new ticket?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15672094560.045E7.22501
Date: Fri, 30 Aug 2019 23:57:36 +0000
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
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241">bug 11124=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D111241#c11">comment #11</a>)
<span class=3D"quote">&gt; (In reply to Dieter N=C3=BCtzel from <a href=3D"=
show_bug.cgi?id=3D111241#c8">comment #8</a>)
&gt; &gt; BTW
&gt; &gt;=20
&gt; &gt; Pierre-Eric can you look into this
&gt; &gt;=20
&gt; &gt; Shadertoy shader corruption, too?
&gt; &gt; <a href=3D"https://www.shadertoy.com/view/Xt3cWS">https://www.sha=
dertoy.com/view/Xt3cWS</a>
&gt; &gt;
&gt;=20
&gt; The &quot;Buffer A&quot; shader doesn't write fragColor when uv.y is &=
lt; 0.1 or &gt; 0.9.
&gt;=20
&gt; So the content is undefined and may be black on some platform or rando=
m.
&gt;=20
&gt; radeonsi is correct here, but we might want to replace undef values wi=
th 0x0
&gt; to get a default value instead of random.</span >

Cool to have you around for bug hunting...;-)

Any hints where I shoud change 'undef values with 0x0' for testing?

And sorry that I 'hijacked' this thread - should I open a new ticket?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15672094560.045E7.22501--

--===============0053131477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0053131477==--
