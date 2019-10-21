Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6987DE1CD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 03:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA7289913;
	Mon, 21 Oct 2019 01:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20D1889916
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 01:42:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1918E720E2; Mon, 21 Oct 2019 01:42:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111762] RX 5700 XT Navi - amdgpu.ppfeaturemask=0xffffffff
 causes stuttering and does not unlock clock/voltage/power controls
Date: Mon, 21 Oct 2019 01:42:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111762-502-E3yJknnXRI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111762-502@http.bugs.freedesktop.org/>
References: <bug-111762-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0274699341=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0274699341==
Content-Type: multipart/alternative; boundary="15716221361.60BeAdD.30762"
Content-Transfer-Encoding: 7bit


--15716221361.60BeAdD.30762
Date: Mon, 21 Oct 2019 01:42:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111762

--- Comment #2 from Andrew Sheldon <asheldon55@gmail.com> ---
As a workaround, use upp instead as a workaround (write to the powerplay bi=
nary
directly). See: https://github.com/sibradzic/upp

I suggest using 5.4-rcX as AMD's wip kernels (amd-staging-drm-next and
drm-next) may still have a bug with pptable writing. Or you can try reverti=
ng
3abf8d896f8ac72341677a6cd82662b80943f9c8

drm/amd/powerplay: do proper cleanups on hw_fini

Be aware that this method can cause issues with fan control, so you might a=
lso
need to manually set the fans after that. You can use fanctl to handle this:
https://gitlab.com/mcoffin/fanctl

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15716221361.60BeAdD.30762
Date: Mon, 21 Oct 2019 01:42:16 +0000
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
   title=3D"NEW - RX 5700 XT Navi - amdgpu.ppfeaturemask=3D0xffffffff cause=
s stuttering and does not unlock clock/voltage/power controls"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111762#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 5700 XT Navi - amdgpu.ppfeaturemask=3D0xffffffff cause=
s stuttering and does not unlock clock/voltage/power controls"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111762">bug 11176=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>As a workaround, use upp instead as a workaround (write to the=
 powerplay binary
directly). See: <a href=3D"https://github.com/sibradzic/upp">https://github=
.com/sibradzic/upp</a>

I suggest using 5.4-rcX as AMD's wip kernels (amd-staging-drm-next and
drm-next) may still have a bug with pptable writing. Or you can try reverti=
ng
3abf8d896f8ac72341677a6cd82662b80943f9c8

drm/amd/powerplay: do proper cleanups on hw_fini

Be aware that this method can cause issues with fan control, so you might a=
lso
need to manually set the fans after that. You can use fanctl to handle this:
<a href=3D"https://gitlab.com/mcoffin/fanctl">https://gitlab.com/mcoffin/fa=
nctl</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15716221361.60BeAdD.30762--

--===============0274699341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0274699341==--
