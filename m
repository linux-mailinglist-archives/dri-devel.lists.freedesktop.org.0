Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4E33C72
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 02:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3358935B;
	Tue,  4 Jun 2019 00:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4DD238935B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 00:31:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4AAB972167; Tue,  4 Jun 2019 00:31:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110422] AMD_DEBUG=forcedma will crash OpenGL aps with SIGFAULT
 on VegaM 8706G
Date: Tue, 04 Jun 2019 00:31:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
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
Message-ID: <bug-110422-502-1v4qYxq7Mo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110422-502@http.bugs.freedesktop.org/>
References: <bug-110422-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2061694482=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2061694482==
Content-Type: multipart/alternative; boundary="15596082842.bed2Ac.8219"
Content-Transfer-Encoding: 7bit


--15596082842.bed2Ac.8219
Date: Tue, 4 Jun 2019 00:31:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110422

--- Comment #2 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #1)
> Should be fixed on master by
> https://gitlab.freedesktop.org/mesa/mesa/commit/
> 4583f09caa5aef719a1eec282f24a86c789cbba6.
>=20
> Can you test and confirm?

Hello Pierre-Eric,

I can confirm with Polaris 20 (RX580) running Unigine_Heaven-4.0 with

SOURCE/Unigine_Heaven-4.0> echo $AMD_DEBUG=20
sisched,nir,forcedma
SOURCE/Unigine_Heaven-4.0> echo $R600_DEBUG=20
sisched,nir,forcedma

sigfaulted for me before, too.
Could be closed after Dimitar confirmed, too.

BTW Are you one of the 'new' AMD OSS guys?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596082842.bed2Ac.8219
Date: Tue, 4 Jun 2019 00:31:24 +0000
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
   title=3D"NEW - AMD_DEBUG=3Dforcedma will crash OpenGL aps with SIGFAULT =
on VegaM 8706G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110422#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD_DEBUG=3Dforcedma will crash OpenGL aps with SIGFAULT =
on VegaM 8706G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110422">bug 11042=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D110422#c1">comment #1</a>)
<span class=3D"quote">&gt; Should be fixed on master by
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/commit/">https://g=
itlab.freedesktop.org/mesa/mesa/commit/</a>
&gt; 4583f09caa5aef719a1eec282f24a86c789cbba6.
&gt;=20
&gt; Can you test and confirm?</span >

Hello Pierre-Eric,

I can confirm with Polaris 20 (RX580) running Unigine_Heaven-4.0 with

SOURCE/Unigine_Heaven-4.0&gt; echo $AMD_DEBUG=20
sisched,nir,forcedma
SOURCE/Unigine_Heaven-4.0&gt; echo $R600_DEBUG=20
sisched,nir,forcedma

sigfaulted for me before, too.
Could be closed after Dimitar confirmed, too.

BTW Are you one of the 'new' AMD OSS guys?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596082842.bed2Ac.8219--

--===============2061694482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2061694482==--
