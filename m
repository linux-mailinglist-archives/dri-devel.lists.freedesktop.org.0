Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4CD1419F
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2019 19:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D12892CB;
	Sun,  5 May 2019 17:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6850789202
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 17:48:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5F6157215A; Sun,  5 May 2019 17:48:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110371] HP Dreamcolor display *Error* No EDID read
Date: Sun, 05 May 2019 17:48:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Babblebones@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110371-502-mmCA1aEC0S@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110371-502@http.bugs.freedesktop.org/>
References: <bug-110371-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0183485329=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0183485329==
Content-Type: multipart/alternative; boundary="15570785390.46acBf.13870"
Content-Transfer-Encoding: 7bit


--15570785390.46acBf.13870
Date: Sun, 5 May 2019 17:48:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110371

--- Comment #8 from Babblebones@gmail.com ---
I've been going down the rabbithole looking for the commit that soured my
display.

https://cgit.freedesktop.org/~airlied/linux/commit/?id=3D5c0e0b45c4936295d6=
333dd7961d0b89b15b070d

Or

This branch

https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Ddrm-fixes-4.17

Is the closest I can get so far, if I go one back, the kernel version works
with my display.

The commit directly before that

https://cgit.freedesktop.org/~airlied/linux/commit/?id=3D44ef02c241e7c99af7=
7b408d52af708aa159e968

Works just fine.

Is there anything inside this merge that would cause this?
I don't know much of what I'm looking at or looking for in these commits but
I'll continue dissecting.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15570785390.46acBf.13870
Date: Sun, 5 May 2019 17:48:59 +0000
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
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371">bug 11037=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Babblebones&#64;gmail.com" title=3D"Babblebones&#64;gmail.com">Babblebones&=
#64;gmail.com</a>
</span></b>
        <pre>I've been going down the rabbithole looking for the commit tha=
t soured my
display.

<a href=3D"https://cgit.freedesktop.org/~airlied/linux/commit/?id=3D5c0e0b4=
5c4936295d6333dd7961d0b89b15b070d">https://cgit.freedesktop.org/~airlied/li=
nux/commit/?id=3D5c0e0b45c4936295d6333dd7961d0b89b15b070d</a>

Or

This branch

<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Ddrm-fixes-4.1=
7">https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Ddrm-fixes-4.17</a>

Is the closest I can get so far, if I go one back, the kernel version works
with my display.

The commit directly before that

<a href=3D"https://cgit.freedesktop.org/~airlied/linux/commit/?id=3D44ef02c=
241e7c99af77b408d52af708aa159e968">https://cgit.freedesktop.org/~airlied/li=
nux/commit/?id=3D44ef02c241e7c99af77b408d52af708aa159e968</a>

Works just fine.

Is there anything inside this merge that would cause this?
I don't know much of what I'm looking at or looking for in these commits but
I'll continue dissecting.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15570785390.46acBf.13870--

--===============0183485329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0183485329==--
