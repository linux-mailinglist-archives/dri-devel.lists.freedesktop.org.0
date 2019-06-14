Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B90346C3B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 00:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B128976D;
	Fri, 14 Jun 2019 22:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 632B68976D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 22:11:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5932872167; Fri, 14 Jun 2019 22:11:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Fri, 14 Jun 2019 22:11:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-SqSkaw1pBZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1201789239=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1201789239==
Content-Type: multipart/alternative; boundary="15605502670.0C7659E.19941"
Content-Transfer-Encoding: 7bit


--15605502670.0C7659E.19941
Date: Fri, 14 Jun 2019 22:11:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #37 from Richard Thier <u9vata@gmail.com> ---
(In reply to Dieter N=C3=BCtzel from comment #35)
> Hello Richard,
>=20
> very NICE progress!
>=20
> Maybe you can run 'glmark2' with/without HyperZ.

Good idea.

Can you test if HyperZ works for you without any changes? The progress I ma=
de
basically only works on my machine but above cosiekvfj seems to have no iss=
ues
despite having the same card.

Actually if the gb_pipes number is wrong then the error is not even in the
HyperZ code, but in the code that returns the wrong value from drm - that
HyperZ code is just using.

Oh and keep in mind that I have no HiZ RAM! So if I measure speed gains oth=
ers
might measure a higher gain if they have HiZ RAM too as I think this way I =
have
no hierarchical Z-buffer at all - when bigger tiles store min or max z valu=
es
of theirs and first they are compared not pixels - but I have this compress=
ed
Z-buffer or zmask_ram - latter which is a lossless compression of the zbuff=
er.
I read that they use tricks like storing the one-two triangles directions
basically for whole tiles to save some bandwith and/or indicate if a tile is
compressed or not at all.

This latter seems to help memory bandwith in case the triangles are bigger =
than
the tiles (typically: walls in a game maybe?).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605502670.0C7659E.19941
Date: Fri, 14 Jun 2019 22:11:07 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c37">Comme=
nt # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>(In reply to Dieter N=C3=BCtzel from <a href=3D"show_bug.cgi?i=
d=3D110897#c35">comment #35</a>)
<span class=3D"quote">&gt; Hello Richard,
&gt;=20
&gt; very NICE progress!
&gt;=20
&gt; Maybe you can run 'glmark2' with/without HyperZ.</span >

Good idea.

Can you test if HyperZ works for you without any changes? The progress I ma=
de
basically only works on my machine but above cosiekvfj seems to have no iss=
ues
despite having the same card.

Actually if the gb_pipes number is wrong then the error is not even in the
HyperZ code, but in the code that returns the wrong value from drm - that
HyperZ code is just using.

Oh and keep in mind that I have no HiZ RAM! So if I measure speed gains oth=
ers
might measure a higher gain if they have HiZ RAM too as I think this way I =
have
no hierarchical Z-buffer at all - when bigger tiles store min or max z valu=
es
of theirs and first they are compared not pixels - but I have this compress=
ed
Z-buffer or zmask_ram - latter which is a lossless compression of the zbuff=
er.
I read that they use tricks like storing the one-two triangles directions
basically for whole tiles to save some bandwith and/or indicate if a tile is
compressed or not at all.

This latter seems to help memory bandwith in case the triangles are bigger =
than
the tiles (typically: walls in a game maybe?).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605502670.0C7659E.19941--

--===============1201789239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1201789239==--
