Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BEF64485
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 11:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0458089E43;
	Wed, 10 Jul 2019 09:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3FA689E43
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 09:42:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E14A572167; Wed, 10 Jul 2019 09:42:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Wed, 10 Jul 2019 09:42:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-qIeu2UkmkB@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1477642656=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1477642656==
Content-Type: multipart/alternative; boundary="15627517521.0836DD.22009"
Content-Transfer-Encoding: 7bit


--15627517521.0836DD.22009
Date: Wed, 10 Jul 2019 09:42:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #25 from tempel.julian@gmail.com ---
Applying this MR and disabling HW cursor "fixes" the mouse skipping in the =
menu
of Hitman 2 (as there is a cursor visible and thus pageflipping is turned o=
ff):
https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/merge_requests=
/38

But in the actual game, there is no cursor visible and so there is severe
stutter again.

I also reported the bug to the wine devs (still I think this is rather a bu=
g of
xf86-video-amdgpu):
https://bugs.winehq.org/show_bug.cgi?id=3D47428
There I mentioned that setting "MouseWarpOverride =3D disable" (a wine feat=
ures
to work around/solve mouse issues) fixes the problem for wined3d/gallium ni=
ne.
However, it does not fix the issue in Hitman 2.

The issue in Hitman 2 also is a bit different, as it doesn't seem to have
slowdowns regarding the rendering performance, but instead the mouse input
rather seems to be partially blocked or discarded. But again: This does not
occur without xf86-video-amdgpu or amdgpu.dc=3D1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15627517521.0836DD.22009
Date: Wed, 10 Jul 2019 09:42:32 +0000
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
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>Applying this MR and disabling HW cursor &quot;fixes&quot; the=
 mouse skipping in the menu
of Hitman 2 (as there is a cursor visible and thus pageflipping is turned o=
ff):
<a href=3D"https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/mer=
ge_requests/38">https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgp=
u/merge_requests/38</a>

But in the actual game, there is no cursor visible and so there is severe
stutter again.

I also reported the bug to the wine devs (still I think this is rather a bu=
g of
xf86-video-amdgpu):
<a href=3D"https://bugs.winehq.org/show_bug.cgi?id=3D47428">https://bugs.wi=
nehq.org/show_bug.cgi?id=3D47428</a>
There I mentioned that setting &quot;MouseWarpOverride =3D disable&quot; (a=
 wine features
to work around/solve mouse issues) fixes the problem for wined3d/gallium ni=
ne.
However, it does not fix the issue in Hitman 2.

The issue in Hitman 2 also is a bit different, as it doesn't seem to have
slowdowns regarding the rendering performance, but instead the mouse input
rather seems to be partially blocked or discarded. But again: This does not
occur without xf86-video-amdgpu or amdgpu.dc=3D1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15627517521.0836DD.22009--

--===============1477642656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1477642656==--
