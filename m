Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7216E6052
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2019 03:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8336E183;
	Sun, 27 Oct 2019 02:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C36AC6E192
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2019 02:44:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BDE2C720E2; Sun, 27 Oct 2019 02:44:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 27 Oct 2019 02:44:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: ragnaros39216@yandex.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-K3OZX8vVAw@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1702494044=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1702494044==
Content-Type: multipart/alternative; boundary="157214425211.4591dD.31140"
Content-Transfer-Encoding: 7bit


--157214425211.4591dD.31140
Date: Sun, 27 Oct 2019 02:44:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #177 from L.S.S. <ragnaros39216@yandex.com> ---
I'm still getting freezes when using Nemo with the same sdma0 timeout, on
latest Manjaro 5.4 rc4 kernel built from latest PKGBUILD (which included the
sdma0 fix commits) and after applying the sdma_read_delay patch.

Additionally, I discovered that changing system icon themes on Cinnamon can
also trigger the freeze. Error codes are the same (ring sdma0 timeout).

Additionally, before this, last night I was able to generate a sdma1 error =
when
browsing with Chromium. This time it states chromium instead of Xorg as pro=
cess
caused the ring timeout:

kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fen=
ces
timed out!
kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeout, sign=
aled
seq=3D2140606, emitted seq=3D2140608
kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: pro=
cess
chromium pid 39450 thread chromium:cs0 pid 39509

It seems in all occurrences, the differences between emitted and signaled
values are always 2.

Is there any process regarding this issue? Or is there any more information
needed (and how to enable verbose logs in the system regarding amdgpu and
related parts)?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157214425211.4591dD.31140
Date: Sun, 27 Oct 2019 02:44:12 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c177">Comm=
ent # 177</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ragnaros39216&#64;yandex.com" title=3D"L.S.S. &lt;ragnaros39216&#64;yandex.=
com&gt;"> <span class=3D"fn">L.S.S.</span></a>
</span></b>
        <pre>I'm still getting freezes when using Nemo with the same sdma0 =
timeout, on
latest Manjaro 5.4 rc4 kernel built from latest PKGBUILD (which included the
sdma0 fix commits) and after applying the sdma_read_delay patch.

Additionally, I discovered that changing system icon themes on Cinnamon can
also trigger the freeze. Error codes are the same (ring sdma0 timeout).

Additionally, before this, last night I was able to generate a sdma1 error =
when
browsing with Chromium. This time it states chromium instead of Xorg as pro=
cess
caused the ring timeout:

kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fen=
ces
timed out!
kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeout, sign=
aled
seq=3D2140606, emitted seq=3D2140608
kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: pro=
cess
chromium pid 39450 thread chromium:cs0 pid 39509

It seems in all occurrences, the differences between emitted and signaled
values are always 2.

Is there any process regarding this issue? Or is there any more information
needed (and how to enable verbose logs in the system regarding amdgpu and
related parts)?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157214425211.4591dD.31140--

--===============1702494044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1702494044==--
