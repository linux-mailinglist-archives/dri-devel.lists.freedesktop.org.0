Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4ACD8089
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 21:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1346D6E3B7;
	Tue, 15 Oct 2019 19:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 491096E3B7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 19:48:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 45E2C7296E; Tue, 15 Oct 2019 19:48:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 15 Oct 2019 19:48:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: mail@bastimeyer.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-aSoJ2dsehR@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0960691849=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0960691849==
Content-Type: multipart/alternative; boundary="15711689153.68Abe09B.10862"
Content-Transfer-Encoding: 7bit


--15711689153.68Abe09B.10862
Date: Tue, 15 Oct 2019 19:48:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #96 from Sebastian Meyer <mail@bastimeyer.de> ---
The desktop freezes related to sdma0 timeout errors are definitely not fixed
with the addition of this third patch. I just had another one while working=
 in
WebStorm and PyCharm for a couple of hours.

Kernel in use was/is `drm.fixes.5.4.2019.10.09.r0.g083164dbdb17-3` with
- drm-amdgpu-do-not-execute-0-sized-IBs.patch
- drm-amdgpu-sdma5-fix-mask-value-of-POLL_REGMEM-packet-for-pipe-sync.patch
- sdma-read-delay.patch

[103602.655947] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeo=
ut,
signaled seq=3D11405753, emitted seq=3D11405755
[103602.656061] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informat=
ion:
process Xorg pid 710 thread Xorg:cs0 pid 711
[103602.656062] [drm] GPU recovery disabled.

Unfortunately, I forgot to run `sudo umr -R sdma0` after ssh-ing into my sy=
stem
and reading the dmesg output, so no further debug output from me. :(

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15711689153.68Abe09B.10862
Date: Tue, 15 Oct 2019 19:48:35 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c96">Comme=
nt # 96</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mail&#64;bastimeyer.de" title=3D"Sebastian Meyer &lt;mail&#64;bastimeyer.de=
&gt;"> <span class=3D"fn">Sebastian Meyer</span></a>
</span></b>
        <pre>The desktop freezes related to sdma0 timeout errors are defini=
tely not fixed
with the addition of this third patch. I just had another one while working=
 in
WebStorm and PyCharm for a couple of hours.

Kernel in use was/is `drm.fixes.5.4.2019.10.09.r0.g083164dbdb17-3` with
- drm-amdgpu-do-not-execute-0-sized-IBs.patch
- drm-amdgpu-sdma5-fix-mask-value-of-POLL_REGMEM-packet-for-pipe-sync.patch
- sdma-read-delay.patch

[103602.655947] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeo=
ut,
signaled seq=3D11405753, emitted seq=3D11405755
[103602.656061] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informat=
ion:
process Xorg pid 710 thread Xorg:cs0 pid 711
[103602.656062] [drm] GPU recovery disabled.

Unfortunately, I forgot to run `sudo umr -R sdma0` after ssh-ing into my sy=
stem
and reading the dmesg output, so no further debug output from me. :(</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15711689153.68Abe09B.10862--

--===============0960691849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0960691849==--
