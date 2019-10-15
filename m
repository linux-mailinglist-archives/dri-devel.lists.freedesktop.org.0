Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9617D7F15
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 20:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566A96E3A0;
	Tue, 15 Oct 2019 18:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A9E66E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 18:33:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 178D87296E; Tue, 15 Oct 2019 18:33:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109389] memory leak in `amdgpu_bo_create()`
Date: Tue, 15 Oct 2019 18:33:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: czbd@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109389-502-EUFDGE4JZE@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109389-502@http.bugs.freedesktop.org/>
References: <bug-109389-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1156341813=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1156341813==
Content-Type: multipart/alternative; boundary="15711643980.d9C3cbf4C.28270"
Content-Transfer-Encoding: 7bit


--15711643980.d9C3cbf4C.28270
Date: Tue, 15 Oct 2019 18:33:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109389

--- Comment #9 from Czcibor Bohusz-Dobosz <czbd@o2.pl> ---
As far as I'm able to test after bcc memleak decided to randomly stop worki=
ng
on my machine, the leak is gone with Linux 5.3.6-arch1-1-ARCH and Mesa 19.2=
.1.

Great thanks to whoever managed to resolve this crippling issue!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15711643980.d9C3cbf4C.28270
Date: Tue, 15 Oct 2019 18:33:18 +0000
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
   title=3D"NEW - memory leak in `amdgpu_bo_create()`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109389#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak in `amdgpu_bo_create()`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109389">bug 10938=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
czbd&#64;o2.pl" title=3D"Czcibor Bohusz-Dobosz &lt;czbd&#64;o2.pl&gt;"> <sp=
an class=3D"fn">Czcibor Bohusz-Dobosz</span></a>
</span></b>
        <pre>As far as I'm able to test after bcc memleak decided to random=
ly stop working
on my machine, the leak is gone with Linux 5.3.6-arch1-1-ARCH and Mesa 19.2=
.1.

Great thanks to whoever managed to resolve this crippling issue!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15711643980.d9C3cbf4C.28270--

--===============1156341813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1156341813==--
