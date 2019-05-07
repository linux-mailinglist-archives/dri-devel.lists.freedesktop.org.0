Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C94616D01
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 23:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0291A89F8B;
	Tue,  7 May 2019 21:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8080089F8B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 21:18:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7B0057215A; Tue,  7 May 2019 21:18:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Tue, 07 May 2019 21:18:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-XAFSQJanCF@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0499204111=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0499204111==
Content-Type: multipart/alternative; boundary="15572638830.0eBaA.14401"
Content-Transfer-Encoding: 7bit


--15572638830.0eBaA.14401
Date: Tue, 7 May 2019 21:18:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #35 from Ilia Mirkin <imirkin@alum.mit.edu> ---
If I had to put money on one of the left-over commits, I'd go with

commit 3d42f1ddc47a69c0ce155f9f30d764c4d689a5fa
Author: Aaron Ma <aaron.ma@canonical.com>
Date:   Sat Sep 1 02:20:00 2018 +0800

    vgaarb: Keep adding VGA device in queue

    If failed to find the deivice owning the boot framebuffer,
    try to use the first VGA device instead of the last one.

    Usually the 1st device is integrated GPU who owns the boot framebuffer.

    Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
    Acked-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Link:
https://patchwork.freedesktop.org/patch/msgid/1535739600-8842-2-git-send-em=
ail-aaron.ma@canonical.com

Which seems to change the vgaarb logic wrt which device is the primary.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15572638830.0eBaA.14401
Date: Tue, 7 May 2019 21:18:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c35">Comme=
nt # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>If I had to put money on one of the left-over commits, I'd go =
with

commit 3d42f1ddc47a69c0ce155f9f30d764c4d689a5fa
Author: Aaron Ma &lt;<a href=3D"mailto:aaron.ma&#64;canonical.com">aaron.ma=
&#64;canonical.com</a>&gt;
Date:   Sat Sep 1 02:20:00 2018 +0800

    vgaarb: Keep adding VGA device in queue

    If failed to find the deivice owning the boot framebuffer,
    try to use the first VGA device instead of the last one.

    Usually the 1st device is integrated GPU who owns the boot framebuffer.

    Signed-off-by: Aaron Ma &lt;<a href=3D"mailto:aaron.ma&#64;canonical.co=
m">aaron.ma&#64;canonical.com</a>&gt;
    Acked-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64;amd.=
com">alexander.deucher&#64;amd.com</a>&gt;
    Signed-off-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter&#64;ff=
wll.ch">daniel.vetter&#64;ffwll.ch</a>&gt;
    Link:
<a href=3D"https://patchwork.freedesktop.org/patch/msgid/1535739600-8842-2-=
git-send-email-aaron.ma&#64;canonical.com">https://patchwork.freedesktop.or=
g/patch/msgid/1535739600-8842-2-git-send-email-aaron.ma&#64;canonical.com</=
a>

Which seems to change the vgaarb logic wrt which device is the primary.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15572638830.0eBaA.14401--

--===============0499204111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0499204111==--
