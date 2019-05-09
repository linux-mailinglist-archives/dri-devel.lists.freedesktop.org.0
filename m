Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E10C18822
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 12:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F9B8989C;
	Thu,  9 May 2019 10:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 63CD38989C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 10:04:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 601817215A; Thu,  9 May 2019 10:04:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Thu, 09 May 2019 10:04:24 +0000
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
Message-ID: <bug-109345-502-h3ZZRSCbzJ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0636740264=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0636740264==
Content-Type: multipart/alternative; boundary="15573962640.a6CA.19382"
Content-Transfer-Encoding: 7bit


--15573962640.a6CA.19382
Date: Thu, 9 May 2019 10:04:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #38 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
Hi All,

Allan tested the tenth test kernel today.

He wrote:

Christian
DRM10 also boots to SI card.

ace

------

Link to the test thread:
http://forum.hyperion-entertainment.com/viewtopic.php?f=3D58&t=3D4256&start=
=3D50#p47877

This step has been marked as bad because the tenth test kernel doesn't boot=
 to
the FirePro.

Next step:

git bisect bad

Output:

Bisecting: 0 revisions left to test after this (roughly 0 steps)
[a81c9ab678802075b7942c41cf640d9d9866d2db] vgaarb: Add support for 64-bit f=
rame
buffer address

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: http://www.xenosoft.de/uImage-drm11

Additionally I undid the changes in the file 'drivers/gpu/vga/vgaarb.c' [1]=
 and
created a test kernel today.

Download: http://www.xenosoft.de/linux-image-5.2-alpha2-X1000_X5000.tar.gz

@Allan (acefnq/ace)
Please test both kernels.

Thanks,
Christian

[1] https://patchwork.freedesktop.org/patch/246810/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15573962640.a6CA.19382
Date: Thu, 9 May 2019 10:04:24 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c38">Comme=
nt # 38</a>
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

Allan tested the tenth test kernel today.

He wrote:

Christian
DRM10 also boots to SI card.

ace

------

Link to the test thread:
<a href=3D"http://forum.hyperion-entertainment.com/viewtopic.php?f=3D58&amp=
;t=3D4256&amp;start=3D50#p47877">http://forum.hyperion-entertainment.com/vi=
ewtopic.php?f=3D58&amp;t=3D4256&amp;start=3D50#p47877</a>

This step has been marked as bad because the tenth test kernel doesn't boot=
 to
the FirePro.

Next step:

git bisect bad

Output:

Bisecting: 0 revisions left to test after this (roughly 0 steps)
[a81c9ab678802075b7942c41cf640d9d9866d2db] vgaarb: Add support for 64-bit f=
rame
buffer address

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: <a href=3D"http://www.xenosoft.de/uImage-drm11">http://www.xenoso=
ft.de/uImage-drm11</a>

Additionally I undid the changes in the file 'drivers/gpu/vga/vgaarb.c' [1]=
 and
created a test kernel today.

Download: <a href=3D"http://www.xenosoft.de/linux-image-5.2-alpha2-X1000_X5=
000.tar.gz">http://www.xenosoft.de/linux-image-5.2-alpha2-X1000_X5000.tar.g=
z</a>

&#64;Allan (acefnq/ace)
Please test both kernels.

Thanks,
Christian

[1] <a href=3D"https://patchwork.freedesktop.org/patch/246810/">https://pat=
chwork.freedesktop.org/patch/246810/</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15573962640.a6CA.19382--

--===============0636740264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0636740264==--
