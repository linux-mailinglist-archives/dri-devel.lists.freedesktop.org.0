Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259BC2515A
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6E08932B;
	Tue, 21 May 2019 14:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0EE6389361
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:01:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0C26172167; Tue, 21 May 2019 14:01:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105251] [Vega10]  GPU lockup on boot: VMC page fault
Date: Tue, 21 May 2019 14:01:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: udovdh@xs4all.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105251-502-GnAE7JLual@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105251-502@http.bugs.freedesktop.org/>
References: <bug-105251-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1501449478=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1501449478==
Content-Type: multipart/alternative; boundary="15584473020.0153.11038"
Content-Transfer-Encoding: 7bit


--15584473020.0153.11038
Date: Tue, 21 May 2019 14:01:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105251

--- Comment #67 from udo <udovdh@xs4all.nl> ---
I get multiple of these:

392.377183] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0 ring:24
vmid:5 pasid:32772, for process firefox pid 4467 thread firefox:cs0 pid 4565
               )
[  392.377194] amdgpu 0000:09:00.0:   at address 0x00000001013d4000 from 27
[  392.377200] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00501031

(...)

[  402.621544] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D28019, emitted seq=3D28022
[  402.621551] [drm] GPU recovery disabled.

Fedora 30 on Gigabyte X470 AORUS ULTRA GAMING w/ AMD Ryzen 5 2400G with Rad=
eon
Vega Graphics running git mesa and git xf86-video-amdgpu.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15584473020.0153.11038
Date: Tue, 21 May 2019 14:01:42 +0000
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
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251#c67">Comme=
nt # 67</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251">bug 10525=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
udovdh&#64;xs4all.nl" title=3D"udo &lt;udovdh&#64;xs4all.nl&gt;"> <span cla=
ss=3D"fn">udo</span></a>
</span></b>
        <pre>I get multiple of these:

392.377183] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0 ring:24
vmid:5 pasid:32772, for process firefox pid 4467 thread firefox:cs0 pid 4565
               )
[  392.377194] amdgpu 0000:09:00.0:   at address 0x00000001013d4000 from 27
[  392.377200] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00501031

(...)

[  402.621544] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D28019, emitted seq=3D28022
[  402.621551] [drm] GPU recovery disabled.

Fedora 30 on Gigabyte X470 AORUS ULTRA GAMING w/ AMD Ryzen 5 2400G with Rad=
eon
Vega Graphics running git mesa and git xf86-video-amdgpu.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15584473020.0153.11038--

--===============1501449478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1501449478==--
