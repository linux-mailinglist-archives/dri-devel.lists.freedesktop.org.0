Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688BA43235
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 04:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DCA89295;
	Thu, 13 Jun 2019 02:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1032989295
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 02:22:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0CE7372167; Thu, 13 Jun 2019 02:22:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110783] Mesa 19.1 rc crashing MPV with VAAPI
Date: Thu, 13 Jun 2019 02:22:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r600
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110783-502-Smr5I7KGxW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110783-502@http.bugs.freedesktop.org/>
References: <bug-110783-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0392712840=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0392712840==
Content-Type: multipart/alternative; boundary="15603925720.ed28fEAA8.19023"
Content-Transfer-Encoding: 7bit


--15603925720.ed28fEAA8.19023
Date: Thu, 13 Jun 2019 02:22:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110783

--- Comment #11 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to Christian K=C3=B6nig from comment #10)
> (In reply to Gert Wollny from comment #9)
> > Indeed, currently the code only tests whether compute shaders are suppo=
rted,
> > and DIV and TEX_LZ don't have any caps yet. I guess I'll take in on me =
to
> > add these caps.
>=20
> Well the key point is probably rather that we should not use compute shad=
ers
> on that hw generation in the first place.
>=20
> How did that got enabled?

It just checks for PIPE_CAP_COMPUTE (which *is* supported by r600). The cha=
nge
was targeted at radeonsi. I had to disable PIPE_CAP_COMPUTE on nv50 to work
around this as well, but there it wasn't _really_ supported very well so it=
 was
OK.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603925720.ed28fEAA8.19023
Date: Thu, 13 Jun 2019 02:22:52 +0000
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
   title=3D"NEW - Mesa 19.1 rc crashing MPV with VAAPI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110783#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 19.1 rc crashing MPV with VAAPI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110783">bug 11078=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Christian K=C3=B6nig from <a href=3D"show_bug.cgi=
?id=3D110783#c10">comment #10</a>)
<span class=3D"quote">&gt; (In reply to Gert Wollny from <a href=3D"show_bu=
g.cgi?id=3D110783#c9">comment #9</a>)
&gt; &gt; Indeed, currently the code only tests whether compute shaders are=
 supported,
&gt; &gt; and DIV and TEX_LZ don't have any caps yet. I guess I'll take in =
on me to
&gt; &gt; add these caps.
&gt;=20
&gt; Well the key point is probably rather that we should not use compute s=
haders
&gt; on that hw generation in the first place.
&gt;=20
&gt; How did that got enabled?</span >

It just checks for PIPE_CAP_COMPUTE (which *is* supported by r600). The cha=
nge
was targeted at radeonsi. I had to disable PIPE_CAP_COMPUTE on nv50 to work
around this as well, but there it wasn't _really_ supported very well so it=
 was
OK.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603925720.ed28fEAA8.19023--

--===============0392712840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0392712840==--
