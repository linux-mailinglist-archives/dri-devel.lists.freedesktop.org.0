Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104CEAF390
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 02:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DC06E9DF;
	Wed, 11 Sep 2019 00:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 08E866E9DF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 00:10:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0526772167; Wed, 11 Sep 2019 00:10:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Wed, 11 Sep 2019 00:10:15 +0000
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
Message-ID: <bug-111077-502-NChFHYkfBu@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0509767835=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0509767835==
Content-Type: multipart/alternative; boundary="15681606141.2ACFA0.5296"
Content-Transfer-Encoding: 7bit


--15681606141.2ACFA0.5296
Date: Wed, 11 Sep 2019 00:10:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #35 from Matt Turner <mattst88@gmail.com> ---
(In reply to roland@rptd.ch from comment #34)
> I do not see anything mentioned there. I've wget the file into
> /etc/portage/patches/media-libs/mesa/ directory, which did not exist.
> Anything else I need to do to get Gentoo to pick up the patch?

p50-ethernet ~ # mkdir -p /etc/portage/patches/media-libs/mesa/
p50-ethernet ~ # cd /etc/portage/patches/media-libs/mesa/
p50-ethernet /etc/portage/patches/media-libs/mesa # wget
'https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch'
--2019-09-10 17:09:04--=20
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch
Resolving gitlab.freedesktop.org... 35.185.111.185
Connecting to gitlab.freedesktop.org|35.185.111.185|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/plain]
Saving to: =E2=80=981852.patch=E2=80=99

1852.patch                                               [ <=3D>=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                ]  13.33K  --.-KB/s    in 0.08s=20=20=20

2019-09-10 17:09:04 (163 KB/s) - =E2=80=981852.patch=E2=80=99 saved [13646]

p50-ethernet /etc/portage/patches/media-libs/mesa # ebuild
/var/db/repos/gentoo/media-libs/mesa/mesa-19.2.0_rc2.ebuild prepare
 * mesa-19.2.0-rc2.tar.xz BLAKE2B SHA512 size ;-) ...=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                            [ ok ]
>>> Unpacking source...
>>> Unpacking mesa-19.2.0-rc2.tar.xz to /var/tmp/portage/media-libs/mesa-19=
.2.0_rc2/work
>>> Source unpacked in /var/tmp/portage/media-libs/mesa-19.2.0_rc2/work
>>> Preparing source in /var/tmp/portage/media-libs/mesa-19.2.0_rc2/work/me=
sa-19.2.0-rc2 ...
 * Applying 1852.patch ...=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                            [ ok ]
 * User patches applied.
>>> Source prepared.


"Applying 1852.patch" is what you should see.

There's nothing else you need to do other than putting the patch into that
directory.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681606141.2ACFA0.5296
Date: Wed, 11 Sep 2019 00:10:14 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c35">Comme=
nt # 35</a>
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
rptd.ch</a> from <a href=3D"show_bug.cgi?id=3D111077#c34">comment #34</a>)
<span class=3D"quote">&gt; I do not see anything mentioned there. I've wget=
 the file into
&gt; /etc/portage/patches/media-libs/mesa/ directory, which did not exist.
&gt; Anything else I need to do to get Gentoo to pick up the patch?</span >

p50-ethernet ~ # mkdir -p /etc/portage/patches/media-libs/mesa/
p50-ethernet ~ # cd /etc/portage/patches/media-libs/mesa/
p50-ethernet /etc/portage/patches/media-libs/mesa # wget
'<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.pa=
tch">https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch</a>'
--2019-09-10 17:09:04--=20
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.pat=
ch">https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch</a>
Resolving gitlab.freedesktop.org... 35.185.111.185
Connecting to gitlab.freedesktop.org|35.185.111.185|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/plain]
Saving to: =E2=80=981852.patch=E2=80=99

1852.patch                                               [ &lt;=3D&gt;=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                ]  13.33K  --.-KB/s    in 0.08s=20=20=20

2019-09-10 17:09:04 (163 KB/s) - =E2=80=981852.patch=E2=80=99 saved [13646]

p50-ethernet /etc/portage/patches/media-libs/mesa # ebuild
/var/db/repos/gentoo/media-libs/mesa/mesa-19.2.0_rc2.ebuild prepare
 * mesa-19.2.0-rc2.tar.xz BLAKE2B SHA512 size ;-) ...=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                            [ ok ]
<span class=3D"quote">&gt;&gt;&gt; Unpacking source...
&gt;&gt;&gt; Unpacking mesa-19.2.0-rc2.tar.xz to /var/tmp/portage/media-lib=
s/mesa-19.2.0_rc2/work
&gt;&gt;&gt; Source unpacked in /var/tmp/portage/media-libs/mesa-19.2.0_rc2=
/work
&gt;&gt;&gt; Preparing source in /var/tmp/portage/media-libs/mesa-19.2.0_rc=
2/work/mesa-19.2.0-rc2 ...</span >
 * Applying 1852.patch ...=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                            [ ok ]
 * User patches applied.
<span class=3D"quote">&gt;&gt;&gt; Source prepared.</span >


&quot;Applying 1852.patch&quot; is what you should see.

There's nothing else you need to do other than putting the patch into that
directory.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681606141.2ACFA0.5296--

--===============0509767835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0509767835==--
