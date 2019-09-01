Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE4FA48B9
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 12:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F04489994;
	Sun,  1 Sep 2019 10:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA82889268
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 10:24:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A001172161; Sun,  1 Sep 2019 10:24:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 01 Sep 2019 10:24:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-kgZF6eCgr3@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1534705067=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1534705067==
Content-Type: multipart/alternative; boundary="15673334440.9fcbD.28747"
Content-Transfer-Encoding: 7bit


--15673334440.9fcbD.28747
Date: Sun, 1 Sep 2019 10:24:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #11 from Marko Popovic <popovic.marko@protonmail.com> ---
Same bug is also reproducable when launching native version of Rocket Leagu=
e.

Here are the logs:
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0: [gfxhub] page fault
(src_id:0 ring:158 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:   in page starting at
address 0x0000000000fff000 from client 27
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00001B3C
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:          MORE_FAULTS:=
 0x0
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:          WALKER_ERROR:
0x6
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x3
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:          MAPPING_ERRO=
R:
0x1
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:          RW: 0x0
sep 01 12:21:12 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma0 timeout, signaled seq=3D7198, emitted seq=3D7200
sep 01 12:21:12 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process RocketLeague pid 3035 thread RocketLeag:cs0 pid
3042

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15673334440.9fcbD.28747
Date: Sun, 1 Sep 2019 10:24:04 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>Same bug is also reproducable when launching native version of=
 Rocket League.

Here are the logs:
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0: [gfxhub] page fault
(src_id:0 ring:158 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:   in page starting at
address 0x0000000000fff000 from client 27
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00001B3C
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:          MORE_FAULTS:=
 0x0
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:          WALKER_ERROR:
0x6
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x3
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:          MAPPING_ERRO=
R:
0x1
sep 01 12:20:56 Marko-PC kernel: amdgpu 0000:03:00.0:          RW: 0x0
sep 01 12:21:12 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma0 timeout, signaled seq=3D7198, emitted seq=3D7200
sep 01 12:21:12 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process RocketLeague pid 3035 thread RocketLeag:cs0 pid
3042</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15673334440.9fcbD.28747--

--===============1534705067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1534705067==--
