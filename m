Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8A46C9B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 01:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0022C8949C;
	Fri, 14 Jun 2019 23:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 323CF89467
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 23:05:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2BE4F72168; Fri, 14 Jun 2019 23:05:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Fri, 14 Jun 2019 23:05:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-110897-502-1qrNm5Oxlp@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1567597880=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1567597880==
Content-Type: multipart/alternative; boundary="15605535541.91cE6.2611"
Content-Transfer-Encoding: 7bit


--15605535541.91cE6.2611
Date: Fri, 14 Jun 2019 23:05:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |maraeo@gmail.com,
                   |                            |michel@daenzer.net

--- Comment #38 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(In reply to Richard Thier from comment #37)
> (In reply to Dieter N=C3=BCtzel from comment #35)
> > Hello Richard,
> >=20
> > very NICE progress!
> >=20
> > Maybe you can run 'glmark2' with/without HyperZ.
>=20
> Good idea.
>=20
> Can you test if HyperZ works for you without any changes?

Sorry,

I'haven't any system for r300 (PCI/AGP) handy.
Latest here HD 4650, RV730 AGP (1 GB !), r600 (see older bug reports...;-)
But not booted for nearly 2 years...
Maybe I have an older r300 one (yep, 9550), but I have to dig in the baseme=
nt
for it, if you need.

> The progress I
> made basically only works on my machine but above cosiekvfj seems to have=
 no
> issues despite having the same card.

You made GREAT progress!

We have to ping Michel D=C3=A4nzer and Marek Ol=C5=A1=C3=A1k for your open =
questions.
(see CC list)

> Actually if the gb_pipes number is wrong then the error is not even in the
> HyperZ code, but in the code that returns the wrong value from drm - that
> HyperZ code is just using.
>=20
> Oh and keep in mind that I have no HiZ RAM! So if I measure speed gains
> others might measure a higher gain if they have HiZ RAM too as I think th=
is
> way I have no hierarchical Z-buffer at all - when bigger tiles store min =
or
> max z values of theirs and first they are compared not pixels - but I have
> this compressed Z-buffer or zmask_ram - latter which is a lossless
> compression of the zbuffer. I read that they use tricks like storing the
> one-two triangles directions basically for whole tiles to save some bandw=
ith
> and/or indicate if a tile is compressed or not at all.
>=20
> This latter seems to help memory bandwith in case the triangles are bigger
> than the tiles (typically: walls in a game maybe?).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605535541.91cE6.2611
Date: Fri, 14 Jun 2019 23:05:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:Dieter&#6=
4;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetzel-hh.de&g=
t;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>maraeo&#64;gmail.com, michel&#64;daenzer.net
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c38">Comme=
nt # 38</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>(In reply to Richard Thier from <a href=3D"show_bug.cgi?id=3D1=
10897#c37">comment #37</a>)
<span class=3D"quote">&gt; (In reply to Dieter N=C3=BCtzel from <a href=3D"=
show_bug.cgi?id=3D110897#c35">comment #35</a>)
&gt; &gt; Hello Richard,
&gt; &gt;=20
&gt; &gt; very NICE progress!
&gt; &gt;=20
&gt; &gt; Maybe you can run 'glmark2' with/without HyperZ.
&gt;=20
&gt; Good idea.
&gt;=20
&gt; Can you test if HyperZ works for you without any changes?</span >

Sorry,

I'haven't any system for r300 (PCI/AGP) handy.
Latest here HD 4650, RV730 AGP (1 GB !), r600 (see older bug reports...;-)
But not booted for nearly 2 years...
Maybe I have an older r300 one (yep, 9550), but I have to dig in the baseme=
nt
for it, if you need.

<span class=3D"quote">&gt; The progress I
&gt; made basically only works on my machine but above cosiekvfj seems to h=
ave no
&gt; issues despite having the same card.</span >

You made GREAT progress!

We have to ping Michel D=C3=A4nzer and Marek Ol=C5=A1=C3=A1k for your open =
questions.
(see CC list)

<span class=3D"quote">&gt; Actually if the gb_pipes number is wrong then th=
e error is not even in the
&gt; HyperZ code, but in the code that returns the wrong value from drm - t=
hat
&gt; HyperZ code is just using.
&gt;=20
&gt; Oh and keep in mind that I have no HiZ RAM! So if I measure speed gains
&gt; others might measure a higher gain if they have HiZ RAM too as I think=
 this
&gt; way I have no hierarchical Z-buffer at all - when bigger tiles store m=
in or
&gt; max z values of theirs and first they are compared not pixels - but I =
have
&gt; this compressed Z-buffer or zmask_ram - latter which is a lossless
&gt; compression of the zbuffer. I read that they use tricks like storing t=
he
&gt; one-two triangles directions basically for whole tiles to save some ba=
ndwith
&gt; and/or indicate if a tile is compressed or not at all.
&gt;=20
&gt; This latter seems to help memory bandwith in case the triangles are bi=
gger
&gt; than the tiles (typically: walls in a game maybe?).</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605535541.91cE6.2611--

--===============1567597880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1567597880==--
