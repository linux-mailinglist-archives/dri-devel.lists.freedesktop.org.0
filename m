Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA4FEBDA
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 12:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFB66E0B9;
	Sat, 16 Nov 2019 11:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A07A66E0B9
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 11:39:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 97C21720E2; Sat, 16 Nov 2019 11:39:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112266] [Navi] Pathfinder: Kingmaker is causing a GPU hang:
 flip_done timed out error
Date: Sat, 16 Nov 2019 11:39:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 5lac7wa43@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112266-502-cbn9zzahQQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112266-502@http.bugs.freedesktop.org/>
References: <bug-112266-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0652073735=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0652073735==
Content-Type: multipart/alternative; boundary="15739043830.Fbcf7a.28061"
Content-Transfer-Encoding: 7bit


--15739043830.Fbcf7a.28061
Date: Sat, 16 Nov 2019 11:39:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112266

--- Comment #9 from Jan Kowalski <5lac7wa43@protonmail.com> ---
I had this bug on tested kernels: 5.3.8, 5.3.9, 5.4.0-rc6, 5.4.0-rc7. I can
confirm hangs occurred, when the cursor was moved after some time of inacti=
vity
(10-60 sec, depending on kernel version. 5.4.0-rc6 was the worst) in Firefox
when watching fullscreen video (excluding 5.4.0-rc7), or in games. This bug=
 was
accompanied by another one - sluggish cursor, in 5.3 line with screen
flickering at the cursor position, in 5.4 line barely visible, occurring ev=
ery
few seconds but without screen flickering, and feels inaccurate.

I added this patch https://bugs.freedesktop.org/attachment.cgi?id=3D145971 =
on top
of 5.4.0-rc7 and hangs are gone (thanks), but laggy cursor is still there.

Sapphire Pulse RX 5700 XT
Dell U2311Hb, 1920x1080 60.00Hz
Kernel: 5.4.0-rc7
Mesa: 19.3.0-rc2
llvm: 9.0.0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739043830.Fbcf7a.28061
Date: Sat, 16 Nov 2019 11:39:43 +0000
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
   title=3D"NEW - [Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_=
done timed out error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112266#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_=
done timed out error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112266">bug 11226=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
5lac7wa43&#64;protonmail.com" title=3D"Jan Kowalski &lt;5lac7wa43&#64;proto=
nmail.com&gt;"> <span class=3D"fn">Jan Kowalski</span></a>
</span></b>
        <pre>I had this bug on tested kernels: 5.3.8, 5.3.9, 5.4.0-rc6, 5.4=
.0-rc7. I can
confirm hangs occurred, when the cursor was moved after some time of inacti=
vity
(10-60 sec, depending on kernel version. 5.4.0-rc6 was the worst) in Firefox
when watching fullscreen video (excluding 5.4.0-rc7), or in games. This bug=
 was
accompanied by another one - sluggish cursor, in 5.3 line with screen
flickering at the cursor position, in 5.4 line barely visible, occurring ev=
ery
few seconds but without screen flickering, and feels inaccurate.

I added this patch <a href=3D"https://bugs.freedesktop.org/attachment.cgi?i=
d=3D145971">https://bugs.freedesktop.org/attachment.cgi?id=3D145971</a> on =
top
of 5.4.0-rc7 and hangs are gone (thanks), but laggy cursor is still there.

Sapphire Pulse RX 5700 XT
Dell U2311Hb, 1920x1080 60.00Hz
Kernel: 5.4.0-rc7
Mesa: 19.3.0-rc2
llvm: 9.0.0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739043830.Fbcf7a.28061--

--===============0652073735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0652073735==--
