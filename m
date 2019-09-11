Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02AEB0764
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4BA6E0CB;
	Thu, 12 Sep 2019 04:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A3B76E2FF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 16:50:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9753F72167; Wed, 11 Sep 2019 16:50:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Wed, 11 Sep 2019 16:50:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: bisected
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: mattst88@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111077-502-hPQtAlHgHi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111077-502@http.bugs.freedesktop.org/>
References: <bug-111077-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1220448181=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1220448181==
Content-Type: multipart/alternative; boundary="15682206260.f0E7aD.21911"
Content-Transfer-Encoding: 7bit


--15682206260.f0E7aD.21911
Date: Wed, 11 Sep 2019 16:50:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #37 from Matt Turner <mattst88@gmail.com> ---
(In reply to roland@rptd.ch from comment #36)
> # mkdir -p /etc/portage/patches/media-libs/mesa/
> # cd /etc/portage/patches/media-libs/mesa/
> wget 'https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch'
> --2019-09-11 18:35:51--=20
> https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch
> Resolving gitlab.freedesktop.org... 35.185.111.185
> Connecting to gitlab.freedesktop.org|35.185.111.185|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: unspecified [text/plain]
> Saving to: =E2=80=981852.patch=E2=80=99
>=20
> 1852.patch                                 [ <=3D>=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> ]  13.33K  --.-KB/s    in 0.1s=20=20=20=20
>=20
> 2019-09-11 18:35:52 (113 KB/s) - =E2=80=981852.patch=E2=80=99 saved [1364=
6]
> # ebuild /usr/portage/media-libs/mesa/mesa-19.0.8.ebuild prepare
>  * mesa-19.0.8.tar.xz BLAKE2B SHA512 size ;-) ...=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ ok ]
>  * checking ebuild checksums ;-) ...=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
> [ ok ]
>  * checking miscfile checksums ;-) ...=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
> [ ok ]
> >>> Unpacking source...
> >>> Unpacking mesa-19.0.8.tar.xz to /var/tmp/portage/media-libs/mesa-19.0=
.8/work
> >>> Source unpacked in /var/tmp/portage/media-libs/mesa-19.0.8/work
> >>> Preparing source in /var/tmp/portage/media-libs/mesa-19.0.8/work/mesa=
-19.0.8 ...
> >>> Source prepared.
>=20
> I'm sorry but this procedure does not pick up the patch. Any ideas why th=
is
> could be the case? The directory /var/db/repos/gentoo/media-libs/mesa/ in
> your version does not exist on my system.

Huh. Very strange. :|

(The /var/db/repos/gentoo path is the new path for ebuild repositories. It's
exactly the same as /usr/portage on your system. It's a pretty recent chang=
e.
See https://wiki.gentoo.org/wiki//var/db/repos/gentoo)

Maybe just build and test from a git checkout, like you were doing in the g=
it
bisect. I'm not sure why portage isn't applying the patch :(

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682206260.f0E7aD.21911
Date: Wed, 11 Sep 2019 16:50:26 +0000
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
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c37">Comme=
nt # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mattst88&#64;gmail.com" title=3D"Matt Turner &lt;mattst88&#64;gmail.com&gt;=
"> <span class=3D"fn">Matt Turner</span></a>
</span></b>
        <pre>(In reply to <a href=3D"mailto:roland&#64;rptd.ch">roland&#64;=
rptd.ch</a> from <a href=3D"show_bug.cgi?id=3D111077#c36">comment #36</a>)
<span class=3D"quote">&gt; # mkdir -p /etc/portage/patches/media-libs/mesa/
&gt; # cd /etc/portage/patches/media-libs/mesa/
&gt; wget '<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_reques=
ts/1852.patch">https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852=
.patch</a>'
&gt; --2019-09-11 18:35:51--=20
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/185=
2.patch">https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch=
</a>
&gt; Resolving gitlab.freedesktop.org... 35.185.111.185
&gt; Connecting to gitlab.freedesktop.org|35.185.111.185|:443... connected.
&gt; HTTP request sent, awaiting response... 200 OK
&gt; Length: unspecified [text/plain]
&gt; Saving to: =E2=80=981852.patch=E2=80=99
&gt;=20
&gt; 1852.patch                                 [ &lt;=3D&gt;=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; ]  13.33K  --.-KB/s    in 0.1s=20=20=20=20
&gt;=20
&gt; 2019-09-11 18:35:52 (113 KB/s) - =E2=80=981852.patch=E2=80=99 saved [1=
3646]
&gt; # ebuild /usr/portage/media-libs/mesa/mesa-19.0.8.ebuild prepare
&gt;  * mesa-19.0.8.tar.xz BLAKE2B SHA512 size ;-) ...=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; [ ok ]
&gt;  * checking ebuild checksums ;-) ...=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
&gt; [ ok ]
&gt;  * checking miscfile checksums ;-) ...=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
&gt; [ ok ]
&gt; &gt;&gt;&gt; Unpacking source...
&gt; &gt;&gt;&gt; Unpacking mesa-19.0.8.tar.xz to /var/tmp/portage/media-li=
bs/mesa-19.0.8/work
&gt; &gt;&gt;&gt; Source unpacked in /var/tmp/portage/media-libs/mesa-19.0.=
8/work
&gt; &gt;&gt;&gt; Preparing source in /var/tmp/portage/media-libs/mesa-19.0=
.8/work/mesa-19.0.8 ...
&gt; &gt;&gt;&gt; Source prepared.
&gt;=20
&gt; I'm sorry but this procedure does not pick up the patch. Any ideas why=
 this
&gt; could be the case? The directory /var/db/repos/gentoo/media-libs/mesa/=
 in
&gt; your version does not exist on my system.</span >

Huh. Very strange. :|

(The /var/db/repos/gentoo path is the new path for ebuild repositories. It's
exactly the same as /usr/portage on your system. It's a pretty recent chang=
e.
See <a href=3D"https://wiki.gentoo.org/wiki//var/db/repos/gentoo">https://w=
iki.gentoo.org/wiki//var/db/repos/gentoo</a>)

Maybe just build and test from a git checkout, like you were doing in the g=
it
bisect. I'm not sure why portage isn't applying the patch :(</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682206260.f0E7aD.21911--

--===============1220448181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1220448181==--
