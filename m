Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5512450
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 23:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F09089872;
	Thu,  2 May 2019 21:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E80F889885
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 21:47:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E46257215A; Thu,  2 May 2019 21:47:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Thu, 02 May 2019 21:47:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-XVfZki722P@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109345-502@http.bugs.freedesktop.org/>
References: <bug-109345-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1596844481=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1596844481==
Content-Type: multipart/alternative; boundary="15568336662.2eEeA9.31173"
Content-Transfer-Encoding: 7bit


--15568336662.2eEeA9.31173
Date: Thu, 2 May 2019 21:47:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #26 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
(In reply to Michel D=C3=A4nzer from comment #25)
> (In reply to Christian Zigotzky from comment #24)
> > With which good and bad commit should I start bisecting?
>=20
> Good: c76cd634eb5bfd497617ea224a54a03b545c8c4d
> Bad: 4971f090aa7f6ce5daa094ce4334f6618f93a7eb

Hi Michel,

Thanks a lot for your help! :-)

I started bisecting today.

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
drm_test

cd drm_test

git bisect start

git bisect good c76cd634eb5bfd497617ea224a54a03b545c8c4d

git bisect bad 4971f090aa7f6ce5daa094ce4334f6618f93a7eb

Output:

Bisecting: 653 revisions left to test after this (roughly 10 steps)
[2ac5e38ea4203852d6e99edd3cf11f044b0a409f] Merge drm/drm-next into
drm-intel-next-queued

---

cp
../linux-image-5.1-rc7-X1000_X5000/X5000_and_QEMU_e5500/src/cyrus-5.1-rc7.c=
onfig
.config

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: http://www.xenosoft.de/uImage-drm1

@Allan (acefnq/ace)
Please test this kernel with the two installed graphics cards.

Thanks,
Christian

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15568336662.2eEeA9.31173
Date: Thu, 2 May 2019 21:47:46 +0000
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
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>(In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?i=
d=3D109345#c25">comment #25</a>)
<span class=3D"quote">&gt; (In reply to Christian Zigotzky from <a href=3D"=
show_bug.cgi?id=3D109345#c24">comment #24</a>)
&gt; &gt; With which good and bad commit should I start bisecting?
&gt;=20
&gt; Good: c76cd634eb5bfd497617ea224a54a03b545c8c4d
&gt; Bad: 4971f090aa7f6ce5daa094ce4334f6618f93a7eb</span >

Hi Michel,

Thanks a lot for your help! :-)

I started bisecting today.

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
drm_test

cd drm_test

git bisect start

git bisect good c76cd634eb5bfd497617ea224a54a03b545c8c4d

git bisect bad 4971f090aa7f6ce5daa094ce4334f6618f93a7eb

Output:

Bisecting: 653 revisions left to test after this (roughly 10 steps)
[2ac5e38ea4203852d6e99edd3cf11f044b0a409f] Merge drm/drm-next into
drm-intel-next-queued

---

cp
../linux-image-5.1-rc7-X1000_X5000/X5000_and_QEMU_e5500/src/cyrus-5.1-rc7.c=
onfig
.config

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: <a href=3D"http://www.xenosoft.de/uImage-drm1">http://www.xenosof=
t.de/uImage-drm1</a>

&#64;Allan (acefnq/ace)
Please test this kernel with the two installed graphics cards.

Thanks,
Christian</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15568336662.2eEeA9.31173--

--===============1596844481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1596844481==--
