Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5016CD5
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 23:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DDA6E845;
	Tue,  7 May 2019 21:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F5E86E847
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 21:08:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4AFEA7215A; Tue,  7 May 2019 21:08:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Tue, 07 May 2019 21:08:24 +0000
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
Message-ID: <bug-109345-502-ydJk7ABsyA@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0098371805=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0098371805==
Content-Type: multipart/alternative; boundary="15572633042.dA811fE78.11251"
Content-Transfer-Encoding: 7bit


--15572633042.dA811fE78.11251
Date: Tue, 7 May 2019 21:08:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #34 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
Hi All,

Allan successfully tested the eighth test kernel on his X5000 today.

He wrote:

Christian
DRM8 boots to Firepro. Can you ascertain anything as yet as to where the is=
sue
lies?

Cheers

ace

------

This step has been marked as good because the eighth test kernel boots to
FirePro.

Next step:

git bisect good

Output:

Bisecting: 2 revisions left to test after this (roughly 2 steps)
[43cf1fc0e27e2f7eeb5d6c15fd023813a5b49987] drm: fix deadlock of syncobj v6

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: http://www.xenosoft.de/uImage-drm9

@Allan (acefnq/ace)
Please test it.

Thanks,
Christian

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15572633042.dA811fE78.11251
Date: Tue, 7 May 2019 21:08:24 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c34">Comme=
nt # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>Hi All,

Allan successfully tested the eighth test kernel on his X5000 today.

He wrote:

Christian
DRM8 boots to Firepro. Can you ascertain anything as yet as to where the is=
sue
lies?

Cheers

ace

------

This step has been marked as good because the eighth test kernel boots to
FirePro.

Next step:

git bisect good

Output:

Bisecting: 2 revisions left to test after this (roughly 2 steps)
[43cf1fc0e27e2f7eeb5d6c15fd023813a5b49987] drm: fix deadlock of syncobj v6

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: <a href=3D"http://www.xenosoft.de/uImage-drm9">http://www.xenosof=
t.de/uImage-drm9</a>

&#64;Allan (acefnq/ace)
Please test it.

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

--15572633042.dA811fE78.11251--

--===============0098371805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0098371805==--
