Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B992999DC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 19:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21DE6E9DF;
	Thu, 22 Aug 2019 17:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A2A2A6E9DF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 17:09:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9F45972161; Thu, 22 Aug 2019 17:09:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Thu, 22 Aug 2019 17:09:55 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110659-502-xpRSeA4YcQ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1714646131=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1714646131==
Content-Type: multipart/alternative; boundary="15664937951.b8480e.19941"
Content-Transfer-Encoding: 7bit


--15664937951.b8480e.19941
Date: Thu, 22 Aug 2019 17:09:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #43 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
Created attachment 145139
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145139&action=3Dedit
0001-drm-amd-display-Test-patch-for-disabling-color-adjus.patch

From your video it looks like something is issuing a lot of full updates. T=
hose
are slow enough that they can miss the current vblank window and be forced =
to
wait until the next one with vsync on.

I've attached a debug patch you can try that should disable color adjustmen=
ts
from triggering full updates.

I've also added some debug information to know when full updates are being
issued in case it was something other than color management.

You can view that output with log level 4, ie.

echo 0x4 > /sys/module/drm/parameters/debug

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15664937951.b8480e.19941
Date: Thu, 22 Aug 2019 17:09:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c43">Comme=
nt # 43</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145139=
" name=3D"attach_145139" title=3D"0001-drm-amd-display-Test-patch-for-disab=
ling-color-adjus.patch">attachment 145139</a> <a href=3D"attachment.cgi?id=
=3D145139&amp;action=3Dedit" title=3D"0001-drm-amd-display-Test-patch-for-d=
isabling-color-adjus.patch">[details]</a></span> <a href=3D'page.cgi?id=3Ds=
plinter.html&amp;bug=3D110659&amp;attachment=3D145139'>[review]</a>
0001-drm-amd-display-Test-patch-for-disabling-color-adjus.patch

From your video it looks like something is issuing a lot of full updates. T=
hose
are slow enough that they can miss the current vblank window and be forced =
to
wait until the next one with vsync on.

I've attached a debug patch you can try that should disable color adjustmen=
ts
from triggering full updates.

I've also added some debug information to know when full updates are being
issued in case it was something other than color management.

You can view that output with log level 4, ie.

echo 0x4 &gt; /sys/module/drm/parameters/debug</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15664937951.b8480e.19941--

--===============1714646131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1714646131==--
