Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A71C359E6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 11:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF9D8941E;
	Wed,  5 Jun 2019 09:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9F5D8941E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 09:52:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B6C0972167; Wed,  5 Jun 2019 09:52:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Wed, 05 Jun 2019 09:52:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rsalvaterra@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-mcVJ3sn3kJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0027416880=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0027416880==
Content-Type: multipart/alternative; boundary="15597283580.EF3Ffb725.19145"
Content-Transfer-Encoding: 7bit


--15597283580.EF3Ffb725.19145
Date: Wed, 5 Jun 2019 09:52:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #35 from Rui Salvaterra <rsalvaterra@gmail.com> ---
(In reply to Marek Ol=C5=A1=C3=A1k from comment #34)
> Created attachment 144454 [details] [review]
> possible fix v2
>=20
> Please test this one.

Hi, Marek,

Unfortunately I couldn't do it yesterday, but I'll try to do so today. I'm =
also
entertaining the idea of implementing support for shader disk caching, but =
I'd
like your opinion before moving forward. I read the implementation on nouve=
au
and r600 and it seemed simple enough (or, most likely, I'm missing something
fundamental ;)). I don't know how beneficial it could be, though, since
R300-R500 shaders are much simpler, so measurements would have to be done.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597283580.EF3Ffb725.19145
Date: Wed, 5 Jun 2019 09:52:38 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c35">Comme=
nt # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rsalvaterra&#64;gmail.com" title=3D"Rui Salvaterra &lt;rsalvaterra&#64;gmai=
l.com&gt;"> <span class=3D"fn">Rui Salvaterra</span></a>
</span></b>
        <pre>(In reply to Marek Ol=C5=A1=C3=A1k from <a href=3D"show_bug.cg=
i?id=3D110781#c34">comment #34</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D144454" name=3D"attach_144454" title=3D"possible fix v2">attachment=
 144454</a> <a href=3D"attachment.cgi?id=3D144454&amp;action=3Dedit" title=
=3D"possible fix v2">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter=
.html&amp;bug=3D110781&amp;attachment=3D144454'>[review]</a> [review]
&gt; possible fix v2
&gt;=20
&gt; Please test this one.</span >

Hi, Marek,

Unfortunately I couldn't do it yesterday, but I'll try to do so today. I'm =
also
entertaining the idea of implementing support for shader disk caching, but =
I'd
like your opinion before moving forward. I read the implementation on nouve=
au
and r600 and it seemed simple enough (or, most likely, I'm missing something
fundamental ;)). I don't know how beneficial it could be, though, since
R300-R500 shaders are much simpler, so measurements would have to be done.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597283580.EF3Ffb725.19145--

--===============0027416880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0027416880==--
