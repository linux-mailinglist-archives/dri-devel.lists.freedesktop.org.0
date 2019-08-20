Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EB095627
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 06:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68346E5C6;
	Tue, 20 Aug 2019 04:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8B636E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 04:37:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CEC3072161; Tue, 20 Aug 2019 04:37:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111414] [REGRESSION] [BISECTED] Segmentation fault in
 si_bind_blend_state after removal of the blend state NULL check
Date: Tue, 20 Aug 2019 04:37:42 +0000
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
Message-ID: <bug-111414-502-NYlQJrvmxf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111414-502@http.bugs.freedesktop.org/>
References: <bug-111414-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2031630543=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2031630543==
Content-Type: multipart/alternative; boundary="15662758610.460E8F1A7.8316"
Content-Transfer-Encoding: 7bit


--15662758610.460E8F1A7.8316
Date: Tue, 20 Aug 2019 04:37:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111414

--- Comment #3 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(In reply to Marek Ol=C5=A1=C3=A1k from comment #1)
> Created attachment 145103 [details] [review]
> possible fix
>=20
> Does the attached patch fix it?

Yes, it fixed vdpau with Mplayer for me.

mplayer -vo vdpau /data/Filme/test.mkv > & /dev/null

Soo...

Tested-by: Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de>

But

mpv -hwdec vdpau /data/Filme/test.mkv > & /dev/null
Abbruch (core dumped)

Have to bisect.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662758610.460E8F1A7.8316
Date: Tue, 20 Aug 2019 04:37:41 +0000
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
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] [BISECTED] Segmentation fault in si_bind_ble=
nd_state after removal of the blend state NULL check"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111414">bug 11141=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>(In reply to Marek Ol=C5=A1=C3=A1k from <a href=3D"show_bug.cg=
i?id=3D111414#c1">comment #1</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145103" name=3D"attach_145103" title=3D"possible fix">attachment 14=
5103</a> <a href=3D"attachment.cgi?id=3D145103&amp;action=3Dedit" title=3D"=
possible fix">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&a=
mp;bug=3D111414&amp;attachment=3D145103'>[review]</a> [review]
&gt; possible fix
&gt;=20
&gt; Does the attached patch fix it?</span >

Yes, it fixed vdpau with Mplayer for me.

mplayer -vo vdpau /data/Filme/test.mkv &gt; &amp; /dev/null

Soo...

Tested-by: Dieter N=C3=BCtzel &lt;<a href=3D"mailto:Dieter&#64;nuetzel-hh.d=
e">Dieter&#64;nuetzel-hh.de</a>&gt;

But

mpv -hwdec vdpau /data/Filme/test.mkv &gt; &amp; /dev/null
Abbruch (core dumped)

Have to bisect.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662758610.460E8F1A7.8316--

--===============2031630543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2031630543==--
