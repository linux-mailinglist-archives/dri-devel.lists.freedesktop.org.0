Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31042981BD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 19:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D729C89FA5;
	Wed, 21 Aug 2019 17:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F414E89F19
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 17:49:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EB05F72161; Wed, 21 Aug 2019 17:49:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Wed, 21 Aug 2019 17:49:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-2pOLv5k0zx@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1160015187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1160015187==
Content-Type: multipart/alternative; boundary="15664097970.cc3bA4B0.5764"
Content-Transfer-Encoding: 7bit


--15664097970.cc3bA4B0.5764
Date: Wed, 21 Aug 2019 17:49:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #30 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
(In reply to tempel.julian from comment #29)
> The patches by Nicholas are now merged in drm-next-5.4 branch (tested with
> recent commit that bases the branch on 5.3-rc3), but the mouse input issue
> in certain games is still unaffected.
>=20
> I was also able to reproduce it with a different system (also with RX 580)
> which features a 60Hz FreeSync display, it definitely makes FreeSync
> impossible to use in the aforementioned titles.

I still can't reproduce on any setup I've tried.

Here is the current setup I have:

RX580 1920x1080 @ 144Hz
amd-staging-drm-next (6c7a8d5c0772)
xf86-video-amdgpu 19.0.1-1
mesa 19.1.4-1
plasma-desktop 5.16.4-1

There are no spikes in the DXVK overlay in Hitman 2 when moving the mouse a=
nd
no noticeable jitter in input.

I am using plasma with the compositor enabled, tearing prevention auto and
fullscreen redirection allowed. PageFlip is enabled in xf86-video-amdgpu.

I do see stutters in the graph when moving the cursor over the mission tile=
s on
the menu, but this is GFX stuttering - not display. Moving the cursor at the
top of the screen in the menu produces no stuttering.

FreeSync isn't active since this is DXVK.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15664097970.cc3bA4B0.5764
Date: Wed, 21 Aug 2019 17:49:57 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c30">Comme=
nt # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicholas.kazlauskas&#64;amd.com" title=3D"Nicholas Kazlauskas &lt;nicholas.=
kazlauskas&#64;amd.com&gt;"> <span class=3D"fn">Nicholas Kazlauskas</span><=
/a>
</span></b>
        <pre>(In reply to tempel.julian from <a href=3D"show_bug.cgi?id=3D1=
10659#c29">comment #29</a>)
<span class=3D"quote">&gt; The patches by Nicholas are now merged in drm-ne=
xt-5.4 branch (tested with
&gt; recent commit that bases the branch on 5.3-rc3), but the mouse input i=
ssue
&gt; in certain games is still unaffected.
&gt;=20
&gt; I was also able to reproduce it with a different system (also with RX =
580)
&gt; which features a 60Hz FreeSync display, it definitely makes FreeSync
&gt; impossible to use in the aforementioned titles.</span >

I still can't reproduce on any setup I've tried.

Here is the current setup I have:

RX580 1920x1080 &#64; 144Hz
amd-staging-drm-next (6c7a8d5c0772)
xf86-video-amdgpu 19.0.1-1
mesa 19.1.4-1
plasma-desktop 5.16.4-1

There are no spikes in the DXVK overlay in Hitman 2 when moving the mouse a=
nd
no noticeable jitter in input.

I am using plasma with the compositor enabled, tearing prevention auto and
fullscreen redirection allowed. PageFlip is enabled in xf86-video-amdgpu.

I do see stutters in the graph when moving the cursor over the mission tile=
s on
the menu, but this is GFX stuttering - not display. Moving the cursor at the
top of the screen in the menu produces no stuttering.

FreeSync isn't active since this is DXVK.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15664097970.cc3bA4B0.5764--

--===============1160015187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1160015187==--
