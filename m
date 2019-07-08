Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BF1621ED
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 17:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCD589D7F;
	Mon,  8 Jul 2019 15:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71EEA89D7F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 15:22:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6932A72167; Mon,  8 Jul 2019 15:22:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111087] SteamOS boots to black screen
Date: Mon, 08 Jul 2019 15:22:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ludovico.denittis@collabora.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111087-502-MZc6N2itU6@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111087-502@http.bugs.freedesktop.org/>
References: <bug-111087-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0877952136=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0877952136==
Content-Type: multipart/alternative; boundary="15625993380.b04548.20904"
Content-Transfer-Encoding: 7bit


--15625993380.b04548.20904
Date: Mon, 8 Jul 2019 15:22:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111087

--- Comment #9 from Ludovico de Nittis <ludovico.denittis@collabora.com> ---
(In reply to Michel D=C3=A4nzer from comment #8)
> The Xorg log file indicates that Xorg starts up in 2560x1440, then an X
> client switches to 1920x1080 about 0.25s later (~23s after the kernel sta=
rts
> booting). Do you notice anything on the monitor around that time, e.g. so=
me
> kind of flicker? What does the monitor say about the input signal when the
> black screen is shown?

After trying one more time I realized that the timing reported by the Xorg =
log
was really too high.
So I tried to leave the PC in this black screen for a couple of minutes and=
 I
saw that the Xorg log entries were all starting at 140s+

Apparently it is not a static black screen but instead an endless loop? And=
 the
Xorg log is only about the last boot attempt.

With a video it will be easier to show exactly what happens:=20
https://youtu.be/YipyPIcP0lA

Moreover as you can see if I move the mouse I'm able to see the SteamOS cur=
sor
for a fraction of a second before the monitor turns completely black again.

> Does amdgpu.dc=3D0 on the kernel command line make any difference?

No difference. I'll upload the Xorg log and the dmesg of it anyway, just in
case it could be of any help.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15625993380.b04548.20904
Date: Mon, 8 Jul 2019 15:22:18 +0000
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
   title=3D"NEW - SteamOS boots to black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111087#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - SteamOS boots to black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111087">bug 11108=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ludovico.denittis&#64;collabora.com" title=3D"Ludovico de Nittis &lt;ludovi=
co.denittis&#64;collabora.com&gt;"> <span class=3D"fn">Ludovico de Nittis</=
span></a>
</span></b>
        <pre>(In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?i=
d=3D111087#c8">comment #8</a>)
<span class=3D"quote">&gt; The Xorg log file indicates that Xorg starts up =
in 2560x1440, then an X
&gt; client switches to 1920x1080 about 0.25s later (~23s after the kernel =
starts
&gt; booting). Do you notice anything on the monitor around that time, e.g.=
 some
&gt; kind of flicker? What does the monitor say about the input signal when=
 the
&gt; black screen is shown?</span >

After trying one more time I realized that the timing reported by the Xorg =
log
was really too high.
So I tried to leave the PC in this black screen for a couple of minutes and=
 I
saw that the Xorg log entries were all starting at 140s+

Apparently it is not a static black screen but instead an endless loop? And=
 the
Xorg log is only about the last boot attempt.

With a video it will be easier to show exactly what happens:=20
<a href=3D"https://youtu.be/YipyPIcP0lA">https://youtu.be/YipyPIcP0lA</a>

Moreover as you can see if I move the mouse I'm able to see the SteamOS cur=
sor
for a fraction of a second before the monitor turns completely black again.

<span class=3D"quote">&gt; Does amdgpu.dc=3D0 on the kernel command line ma=
ke any difference?</span >

No difference. I'll upload the Xorg log and the dmesg of it anyway, just in
case it could be of any help.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15625993380.b04548.20904--

--===============0877952136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0877952136==--
