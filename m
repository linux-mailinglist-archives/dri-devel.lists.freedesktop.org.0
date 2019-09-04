Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062CA93C7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 22:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504B588F07;
	Wed,  4 Sep 2019 20:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36835884B0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 20:34:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 304EE72161; Wed,  4 Sep 2019 20:34:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Wed, 04 Sep 2019 20:34:36 +0000
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
Message-ID: <bug-110659-502-Ii4G2MslTl@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1949020060=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1949020060==
Content-Type: multipart/alternative; boundary="15676292761.ABAB2b66.4610"
Content-Transfer-Encoding: 7bit


--15676292761.ABAB2b66.4610
Date: Wed, 4 Sep 2019 20:34:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #67 from tempel.julian@gmail.com ---
(In reply to Michel D=C3=A4nzer from comment #66)
> They still use page flipping though, similar to TearFree. Which Wayland
> compositor(s) have you tried?

I have tried a Wayland Gnome and Plasma session, in both cases the render
stutter of Oblivion and the "mouse blocking" of Hitman 2 are gone.

But: As I have stated earlier, this can also be achieved on Xorg with Xfce's
xfwm  and kwin-lowlatency (a KWin fork with different vsync implementation)
compositing. They also trigger pageflipping and thus achieve a tearig free
result.
I would guess that having that extra vsync + extra backbuffer queue of a
compositor can avoid that "collision" of pageflipping + mouse input, in whi=
ch
case we can't be sure if Wayland really isn't affected.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676292761.ABAB2b66.4610
Date: Wed, 4 Sep 2019 20:34:36 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c67">Comme=
nt # 67</a>
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
        <pre>(In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?i=
d=3D110659#c66">comment #66</a>)
<span class=3D"quote">&gt; They still use page flipping though, similar to =
TearFree. Which Wayland
&gt; compositor(s) have you tried?</span >

I have tried a Wayland Gnome and Plasma session, in both cases the render
stutter of Oblivion and the &quot;mouse blocking&quot; of Hitman 2 are gone.

But: As I have stated earlier, this can also be achieved on Xorg with Xfce's
xfwm  and kwin-lowlatency (a KWin fork with different vsync implementation)
compositing. They also trigger pageflipping and thus achieve a tearig free
result.
I would guess that having that extra vsync + extra backbuffer queue of a
compositor can avoid that &quot;collision&quot; of pageflipping + mouse inp=
ut, in which
case we can't be sure if Wayland really isn't affected.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676292761.ABAB2b66.4610--

--===============1949020060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1949020060==--
