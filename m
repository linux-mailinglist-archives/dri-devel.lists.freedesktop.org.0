Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62F167D76
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2019 07:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463A689C8D;
	Sun, 14 Jul 2019 05:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 846F389C8D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2019 05:16:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5ABE2721A2; Sun, 14 Jul 2019 04:59:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Sun, 14 Jul 2019 04:59:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: briancschott@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111122-502-C1zOupDgih@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111122-502@http.bugs.freedesktop.org/>
References: <bug-111122-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1551269621=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1551269621==
Content-Type: multipart/alternative; boundary="15630803462.bEA9Ba.22326"
Content-Transfer-Encoding: 7bit


--15630803462.bEA9Ba.22326
Date: Sun, 14 Jul 2019 04:59:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #3 from Brian Schott <briancschott@gmail.com> ---
I think that I'm seeing something related with my 2700u Inspiron 7375.

If I have compositing enabled in XFWM4, the system will immediately stop
responding after logging in with LightDM. If the window manager compositing=
 is
disabled, I'm able to log in, but then there is graphical corruption.

With git bisect I traced the problem back to
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Ddf8368be1382&id=3Ddf8368be1382b442384507a5147c89978cd60702

I can edit the source file, and by only changing the KMS_DRIVER_MINOR
definition from 32 to 30, get the system working correctly with 5.2.0.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15630803462.bEA9Ba.22326
Date: Sun, 14 Jul 2019 04:59:06 +0000
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
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
briancschott&#64;gmail.com" title=3D"Brian Schott &lt;briancschott&#64;gmai=
l.com&gt;"> <span class=3D"fn">Brian Schott</span></a>
</span></b>
        <pre>I think that I'm seeing something related with my 2700u Inspir=
on 7375.

If I have compositing enabled in XFWM4, the system will immediately stop
responding after logging in with LightDM. If the window manager compositing=
 is
disabled, I'm able to log in, but then there is graphical corruption.

With git bisect I traced the problem back to
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?h=3Ddf8368be1382&amp;id=3Ddf8368be1382b442384507a5147c89978cd607=
02">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?h=3Ddf8368be1382&amp;id=3Ddf8368be1382b442384507a5147c89978cd60702</a>

I can edit the source file, and by only changing the KMS_DRIVER_MINOR
definition from 32 to 30, get the system working correctly with 5.2.0.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15630803462.bEA9Ba.22326--

--===============1551269621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1551269621==--
