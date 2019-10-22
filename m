Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC0E0B28
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 20:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F4A6E8C2;
	Tue, 22 Oct 2019 18:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58C136E8D0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 18:00:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 554BF720E2; Tue, 22 Oct 2019 18:00:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 22 Oct 2019 18:00:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: yamagi@yamagi.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-PzALXKCMZI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0514069146=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0514069146==
Content-Type: multipart/alternative; boundary="15717672075.dc9D5dc8.30509"
Content-Transfer-Encoding: 7bit


--15717672075.dc9D5dc8.30509
Date: Tue, 22 Oct 2019 18:00:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #124 from yamagi@yamagi.org ---
Interestingly I've got the problem the other way round. My 5700XT was runni=
ng
fine since I got it about two weeks ago. This is Arch Linux, I've run Mesa
19.2.1 and llvm-libs 9.0.0 since day one. The card was stable with 5.4-RC2 =
and
5.4-RC3, not a single hang in about 10 hours The Witcher 3 under wine + dxvk
and Yamagi Quake II with OpenGL 3.2 renderer. After I upgraded to 5.4-RC4 I=
've
seen several GPU hangs. The last one, and the only one that's still in the =
logs
was:

[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D85270, emitted seq=3D85272

That one was in Yamagi Quake II, but I had hangs on the desktop and in The
Witcher 3. I have no umr reports so far. I've just compiled the tool and wi=
ll
see if I can get some.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15717672075.dc9D5dc8.30509
Date: Tue, 22 Oct 2019 18:00:07 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c124">Comm=
ent # 124</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yamagi&#64;yamagi.org" title=3D"yamagi&#64;yamagi.org">yamagi&#64;yamagi.or=
g</a>
</span></b>
        <pre>Interestingly I've got the problem the other way round. My 570=
0XT was running
fine since I got it about two weeks ago. This is Arch Linux, I've run Mesa
19.2.1 and llvm-libs 9.0.0 since day one. The card was stable with 5.4-RC2 =
and
5.4-RC3, not a single hang in about 10 hours The Witcher 3 under wine + dxvk
and Yamagi Quake II with OpenGL 3.2 renderer. After I upgraded to 5.4-RC4 I=
've
seen several GPU hangs. The last one, and the only one that's still in the =
logs
was:

[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
seq=3D85270, emitted seq=3D85272

That one was in Yamagi Quake II, but I had hangs on the desktop and in The
Witcher 3. I have no umr reports so far. I've just compiled the tool and wi=
ll
see if I can get some.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15717672075.dc9D5dc8.30509--

--===============0514069146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0514069146==--
