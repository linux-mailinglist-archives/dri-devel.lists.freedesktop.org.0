Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 417E947256
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 00:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5459489031;
	Sat, 15 Jun 2019 22:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8E33890E8
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 22:10:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B5B9272167; Sat, 15 Jun 2019 22:10:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Sat, 15 Jun 2019 22:10:53 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-jhgK0bE4Oi@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1305591073=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1305591073==
Content-Type: multipart/alternative; boundary="15606366535.ECED4dcEB.22459"
Content-Transfer-Encoding: 7bit


--15606366535.ECED4dcEB.22459
Date: Sat, 15 Jun 2019 22:10:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #53 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(In reply to Richard Thier from comment #52)
> (In reply to Marek Ol=C5=A1=C3=A1k from comment #45)
> > The problem might be in the kernel. See function rs400_gpu_init. I thin=
k it
> > should call r300_gpu_init instead of r420_pipes_init.
>=20
> Aaaahhhhh.... Am I this blind? Now I see exactly this.
>=20
> Also in dmesg log I see RS400 being written out so yes I end up here and
> according to my own links this seem to be the problem that the
> rs400_gpu_init should not do the r420_pipes_init, because it is not r420
> yet....
> Now after investigating I think I should indeed end up here with the
> rs400_asic, but yes the 420 pipe setup is wrong - at least for my card.
>=20
> I will run with this patched and see what happens. The machine can compile
> the kernel through the night for testing this...

If you do NOT 'make mrproper' and change only radeon/amdgpu stuff it should
only take some minutes (seconds) on your system/CPU.

> This seems to be the real core of the issue.

We hear from you. ;-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606366535.ECED4dcEB.22459
Date: Sat, 15 Jun 2019 22:10:53 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c53">Comme=
nt # 53</a>
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
10897#c52">comment #52</a>)
<span class=3D"quote">&gt; (In reply to Marek Ol=C5=A1=C3=A1k from <a href=
=3D"show_bug.cgi?id=3D110897#c45">comment #45</a>)
&gt; &gt; The problem might be in the kernel. See function rs400_gpu_init. =
I think it
&gt; &gt; should call r300_gpu_init instead of r420_pipes_init.
&gt;=20
&gt; Aaaahhhhh.... Am I this blind? Now I see exactly this.
&gt;=20
&gt; Also in dmesg log I see RS400 being written out so yes I end up here a=
nd
&gt; according to my own links this seem to be the problem that the
&gt; rs400_gpu_init should not do the r420_pipes_init, because it is not r4=
20
&gt; yet....
&gt; Now after investigating I think I should indeed end up here with the
&gt; rs400_asic, but yes the 420 pipe setup is wrong - at least for my card.
&gt;=20
&gt; I will run with this patched and see what happens. The machine can com=
pile
&gt; the kernel through the night for testing this...</span >

If you do NOT 'make mrproper' and change only radeon/amdgpu stuff it should
only take some minutes (seconds) on your system/CPU.

<span class=3D"quote">&gt; This seems to be the real core of the issue.</sp=
an >

We hear from you. ;-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606366535.ECED4dcEB.22459--

--===============1305591073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1305591073==--
