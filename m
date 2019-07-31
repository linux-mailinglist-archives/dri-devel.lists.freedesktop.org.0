Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B77CBE5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 20:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A507889D87;
	Wed, 31 Jul 2019 18:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E512E89D63
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 18:25:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D85DC72167; Wed, 31 Jul 2019 18:25:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111272] [DRI_PRIME] Error on multi GPU with only one enabled
Date: Wed, 31 Jul 2019 18:25:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: parker.l.reed@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111272-502-INSy9uZ3bj@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111272-502@http.bugs.freedesktop.org/>
References: <bug-111272-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0002425609=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0002425609==
Content-Type: multipart/alternative; boundary="15645975260.32f56C.15897"
Content-Transfer-Encoding: 7bit


--15645975260.32f56C.15897
Date: Wed, 31 Jul 2019 18:25:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111272

--- Comment #4 from Parker Reed <parker.l.reed@gmail.com> ---
I'm not using the laptop panel or connector. This is a Thunderbolt eGPU.

HDMI is direct into the external RX 560.

While testing I just realized this behavior has nothing to do with multi GP=
U.
Ran the same glxgears test on desktop that only has RX 480 and iGPU disable=
d in
BIOS. Same behavior.

$ DRI_PRIME=3D1 glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
28663 frames in 5.0 seconds =3D 5732.486 FPS
26437 frames in 5.0 seconds =3D 5286.734 FPS
26203 frames in 5.0 seconds =3D 5239.404 FPS
26759 frames in 5.0 seconds =3D 5346.603 FPS

Will attach the current Xorg log.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645975260.32f56C.15897
Date: Wed, 31 Jul 2019 18:25:26 +0000
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
   title=3D"NEW - [DRI_PRIME] Error on multi GPU with only one enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111272#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [DRI_PRIME] Error on multi GPU with only one enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111272">bug 11127=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
parker.l.reed&#64;gmail.com" title=3D"Parker Reed &lt;parker.l.reed&#64;gma=
il.com&gt;"> <span class=3D"fn">Parker Reed</span></a>
</span></b>
        <pre>I'm not using the laptop panel or connector. This is a Thunder=
bolt eGPU.

HDMI is direct into the external RX 560.

While testing I just realized this behavior has nothing to do with multi GP=
U.
Ran the same glxgears test on desktop that only has RX 480 and iGPU disable=
d in
BIOS. Same behavior.

$ DRI_PRIME=3D1 glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
28663 frames in 5.0 seconds =3D 5732.486 FPS
26437 frames in 5.0 seconds =3D 5286.734 FPS
26203 frames in 5.0 seconds =3D 5239.404 FPS
26759 frames in 5.0 seconds =3D 5346.603 FPS

Will attach the current Xorg log.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645975260.32f56C.15897--

--===============0002425609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0002425609==--
