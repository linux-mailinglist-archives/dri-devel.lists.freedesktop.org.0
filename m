Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7568469940
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 18:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D0D89A9B;
	Mon, 15 Jul 2019 16:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE18489A9B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 16:42:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DFC0672167; Mon, 15 Jul 2019 16:42:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Mon, 15 Jul 2019 16:42:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chithanh@gentoo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111122-502-tYvRPxXouS@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1962012543=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1962012543==
Content-Type: multipart/alternative; boundary="15632089640.6909A.10594"
Content-Transfer-Encoding: 7bit


--15632089640.6909A.10594
Date: Mon, 15 Jul 2019 16:42:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #4 from Ch=C3=AD-Thanh Christopher Nguy=E1=BB=85n <chithanh@gen=
too.org> ---
Same symptoms here after upgrading from Linux 5.1 to 5.2 on Dell Latitude 5=
495,
Ryzen Pro 2700U. Graphical corruption, and/or the GUI will stop responding.
Magic SysRq is needed to reboot the computer.

kernel log contains the following bits when this happens:

[   44.921571] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, signaled
seq=3D1112, emitted seq=3D1115
[   44.921574] [drm:amdgpu_job_timedout] *ERROR* Process information: proce=
ss X
pid 4477 thread X:cs0 pid 4587
[   44.921575] [drm] GPU recovery disabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15632089640.6909A.10594
Date: Mon, 15 Jul 2019 16:42:44 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chithanh&#64;gentoo.org" title=3D"Ch=C3=AD-Thanh Christopher Nguy=E1=BB=85n=
 &lt;chithanh&#64;gentoo.org&gt;"> <span class=3D"fn">Ch=C3=AD-Thanh Christ=
opher Nguy=E1=BB=85n</span></a>
</span></b>
        <pre>Same symptoms here after upgrading from Linux 5.1 to 5.2 on De=
ll Latitude 5495,
Ryzen Pro 2700U. Graphical corruption, and/or the GUI will stop responding.
Magic SysRq is needed to reboot the computer.

kernel log contains the following bits when this happens:

[   44.921571] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, signaled
seq=3D1112, emitted seq=3D1115
[   44.921574] [drm:amdgpu_job_timedout] *ERROR* Process information: proce=
ss X
pid 4477 thread X:cs0 pid 4587
[   44.921575] [drm] GPU recovery disabled.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15632089640.6909A.10594--

--===============1962012543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1962012543==--
