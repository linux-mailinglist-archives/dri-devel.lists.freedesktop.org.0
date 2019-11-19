Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD35910109F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 02:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB7D6E875;
	Tue, 19 Nov 2019 01:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AA8C6E86C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 01:21:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4759E720E2; Tue, 19 Nov 2019 01:21:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 19 Nov 2019 01:21:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: thejackimonster@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-BHtbL4vKYb@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0156361496=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0156361496==
Content-Type: multipart/alternative; boundary="15741264863.158F5AC5.26800"
Content-Transfer-Encoding: 7bit


--15741264863.158F5AC5.26800
Date: Tue, 19 Nov 2019 01:21:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #237 from Tobias Frisch <thejackimonster@gmail.com> ---
Hardware:
- Asus ROG Crosshair VI Extreme
- AMD Ryzen 7 2700X
- Sapphire Radeon RX 5700

Software:
- linux 5.3.11-arch1-1
- mesa 19.2.4-1

I just tried to encounter some hangs again which occur relative randomly us=
ing
Arch. So I started Steam and tried some benchmarks in Shadow of the Tombrai=
der.
It fully completed it on highest settings with a high FPS score but it lagg=
ed
quite hard (even stuttered one time for 1~3 seconds) during displaying.

I just hope/guess the wrong/lying fps-counter in SoTR is not related to the
amdgpu drivers, isn't it?

Anyhow starting Rise of the Tombraider after it then froze my system again.

[14494.683266] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[14494.683354] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[14499.803441] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D2989148, emitted seq=3D2989150
[14499.803522] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process RiseOfTheTombRa pid 414233 thread RiseOfTheT:cs0 pid 414239
[14499.803525] [drm] GPU recovery disabled.

I still have one question.. how is the communication with AMD in these issu=
es?
Because somehow (I would like to know) their drivers work on my Ubuntu 18.04
LTS without any freezes so far (except from starting Blender). I use it at =
the
moment to get something done without worrying about random freezes (I had o=
ne
this day using Arch with linux 5.4.0-rc7-mainline). I hope these issues are
fixed soon.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15741264863.158F5AC5.26800
Date: Tue, 19 Nov 2019 01:21:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c237">Comm=
ent # 237</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
thejackimonster&#64;gmail.com" title=3D"Tobias Frisch &lt;thejackimonster&#=
64;gmail.com&gt;"> <span class=3D"fn">Tobias Frisch</span></a>
</span></b>
        <pre>Hardware:
- Asus ROG Crosshair VI Extreme
- AMD Ryzen 7 2700X
- Sapphire Radeon RX 5700

Software:
- linux 5.3.11-arch1-1
- mesa 19.2.4-1

I just tried to encounter some hangs again which occur relative randomly us=
ing
Arch. So I started Steam and tried some benchmarks in Shadow of the Tombrai=
der.
It fully completed it on highest settings with a high FPS score but it lagg=
ed
quite hard (even stuttered one time for 1~3 seconds) during displaying.

I just hope/guess the wrong/lying fps-counter in SoTR is not related to the
amdgpu drivers, isn't it?

Anyhow starting Rise of the Tombraider after it then froze my system again.

[14494.683266] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[14494.683354] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[14499.803441] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D2989148, emitted seq=3D2989150
[14499.803522] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process RiseOfTheTombRa pid 414233 thread RiseOfTheT:cs0 pid 414239
[14499.803525] [drm] GPU recovery disabled.

I still have one question.. how is the communication with AMD in these issu=
es?
Because somehow (I would like to know) their drivers work on my Ubuntu 18.04
LTS without any freezes so far (except from starting Blender). I use it at =
the
moment to get something done without worrying about random freezes (I had o=
ne
this day using Arch with linux 5.4.0-rc7-mainline). I hope these issues are
fixed soon.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15741264863.158F5AC5.26800--

--===============0156361496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0156361496==--
