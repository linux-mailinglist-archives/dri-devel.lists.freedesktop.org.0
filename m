Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5208DB0785
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27F76EB87;
	Thu, 12 Sep 2019 04:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 607856E31D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 16:39:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 592EC72167; Wed, 11 Sep 2019 16:39:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Wed, 11 Sep 2019 16:39:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: bisected
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: roland@rptd.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111077-502-w4xw3KLE6x@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0283056999=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0283056999==
Content-Type: multipart/alternative; boundary="15682199980.Fd99BCa.19836"
Content-Transfer-Encoding: 7bit


--15682199980.Fd99BCa.19836
Date: Wed, 11 Sep 2019 16:39:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #36 from roland@rptd.ch <roland@rptd.ch> ---
# mkdir -p /etc/portage/patches/media-libs/mesa/
# cd /etc/portage/patches/media-libs/mesa/
wget 'https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch'
--2019-09-11 18:35:51--=20
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch
Resolving gitlab.freedesktop.org... 35.185.111.185
Connecting to gitlab.freedesktop.org|35.185.111.185|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/plain]
Saving to: =E2=80=981852.patch=E2=80=99

1852.patch                                 [ <=3D>=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                         ]  13.33K  --.-KB/s    in 0.1s=20=
=20=20=20

2019-09-11 18:35:52 (113 KB/s) - =E2=80=981852.patch=E2=80=99 saved [13646]
# ebuild /usr/portage/media-libs/mesa/mesa-19.0.8.ebuild prepare
 * mesa-19.0.8.tar.xz BLAKE2B SHA512 size ;-) ...=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                                     [ ok ]
 * checking ebuild checksums ;-) ...=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
                                                                     [ ok ]
 * checking miscfile checksums ;-) ...=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                                                     [ ok ]
>>> Unpacking source...
>>> Unpacking mesa-19.0.8.tar.xz to /var/tmp/portage/media-libs/mesa-19.0.8=
/work
>>> Source unpacked in /var/tmp/portage/media-libs/mesa-19.0.8/work
>>> Preparing source in /var/tmp/portage/media-libs/mesa-19.0.8/work/mesa-1=
9.0.8 ...
>>> Source prepared.

I'm sorry but this procedure does not pick up the patch. Any ideas why this
could be the case? The directory /var/db/repos/gentoo/media-libs/mesa/ in y=
our
version does not exist on my system.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682199980.Fd99BCa.19836
Date: Wed, 11 Sep 2019 16:39:58 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c36">Comme=
nt # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
roland&#64;rptd.ch" title=3D"roland&#64;rptd.ch &lt;roland&#64;rptd.ch&gt;"=
> <span class=3D"fn">roland&#64;rptd.ch</span></a>
</span></b>
        <pre># mkdir -p /etc/portage/patches/media-libs/mesa/
# cd /etc/portage/patches/media-libs/mesa/
wget '<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/18=
52.patch">https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patc=
h</a>'
--2019-09-11 18:35:51--=20
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.pat=
ch">https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852.patch</a>
Resolving gitlab.freedesktop.org... 35.185.111.185
Connecting to gitlab.freedesktop.org|35.185.111.185|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/plain]
Saving to: =E2=80=981852.patch=E2=80=99

1852.patch                                 [ &lt;=3D&gt;=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                         ]  13.33K  --.-KB/s    in 0.1s=20=
=20=20=20

2019-09-11 18:35:52 (113 KB/s) - =E2=80=981852.patch=E2=80=99 saved [13646]
# ebuild /usr/portage/media-libs/mesa/mesa-19.0.8.ebuild prepare
 * mesa-19.0.8.tar.xz BLAKE2B SHA512 size ;-) ...=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                                                                     [ ok ]
 * checking ebuild checksums ;-) ...=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
                                                                     [ ok ]
 * checking miscfile checksums ;-) ...=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
                                                                     [ ok ]
<span class=3D"quote">&gt;&gt;&gt; Unpacking source...
&gt;&gt;&gt; Unpacking mesa-19.0.8.tar.xz to /var/tmp/portage/media-libs/me=
sa-19.0.8/work
&gt;&gt;&gt; Source unpacked in /var/tmp/portage/media-libs/mesa-19.0.8/work
&gt;&gt;&gt; Preparing source in /var/tmp/portage/media-libs/mesa-19.0.8/wo=
rk/mesa-19.0.8 ...
&gt;&gt;&gt; Source prepared.</span >

I'm sorry but this procedure does not pick up the patch. Any ideas why this
could be the case? The directory /var/db/repos/gentoo/media-libs/mesa/ in y=
our
version does not exist on my system.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682199980.Fd99BCa.19836--

--===============0283056999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0283056999==--
