Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57043471
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 10:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB0A895B6;
	Thu, 13 Jun 2019 08:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E0DB895B6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:56:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 96B4D72167; Thu, 13 Jun 2019 08:56:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Thu, 13 Jun 2019 08:56:02 +0000
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
Message-ID: <bug-110897-502-QUCNjOQPvD@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1249460206=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1249460206==
Content-Type: multipart/alternative; boundary="15604161620.aaBf60.22398"
Content-Transfer-Encoding: 7bit


--15604161620.aaBf60.22398
Date: Thu, 13 Jun 2019 08:56:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #15 from Richard Thier <u9vata@gmail.com> ---
(In reply to cosiekvfj from comment #14)
> Created attachment 144524 [details]
> bigger glxgears window
>=20
> >Is HyperZ just good without any changes to stock mesa?
> yes, mesa is from manjaro repo, and I think that it's the same build as in
> arch repo.
>=20
> >Your card seems to be also reported as RC410 like mine, but you have muc=
h-much more FPS for some reason.
> It's because window size of glxgears ;) We could test that if you want. B=
ut
> we need to agree on window size ;)
>=20
> >Is this also a laptop?
> Yes.

Can you share lspci and lshw output?

> I also tried to resize window to try to get some artifacts. Apart from so=
me
> flickering during resizing, image was good. Flickering was also present
> without HyperZ.

Resize only helped against the problem in my case so I would not expect thi=
ngs
go flicker when resizing anyways, just that in my case it was "at least"
flickering instead of not being visible at all properly.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604161620.aaBf60.22398
Date: Thu, 13 Jun 2019 08:56:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c15">Comme=
nt # 15</a>
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
        <pre>(In reply to cosiekvfj from <a href=3D"show_bug.cgi?id=3D11089=
7#c14">comment #14</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D144524" name=3D"attach_144524" title=3D"bigger glxgears window">att=
achment 144524</a> <a href=3D"attachment.cgi?id=3D144524&amp;action=3Dedit"=
 title=3D"bigger glxgears window">[details]</a></span>
&gt; bigger glxgears window
&gt;=20
&gt; &gt;Is HyperZ just good without any changes to stock mesa?
&gt; yes, mesa is from manjaro repo, and I think that it's the same build a=
s in
&gt; arch repo.
&gt;=20
&gt; &gt;Your card seems to be also reported as RC410 like mine, but you ha=
ve much-much more FPS for some reason.
&gt; It's because window size of glxgears ;) We could test that if you want=
. But
&gt; we need to agree on window size ;)
&gt;=20
&gt; &gt;Is this also a laptop?
&gt; Yes.</span >

Can you share lspci and lshw output?

<span class=3D"quote">&gt; I also tried to resize window to try to get some=
 artifacts. Apart from some
&gt; flickering during resizing, image was good. Flickering was also present
&gt; without HyperZ.</span >

Resize only helped against the problem in my case so I would not expect thi=
ngs
go flicker when resizing anyways, just that in my case it was &quot;at leas=
t&quot;
flickering instead of not being visible at all properly.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604161620.aaBf60.22398--

--===============1249460206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1249460206==--
