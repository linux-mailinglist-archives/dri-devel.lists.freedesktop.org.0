Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A5B71CDB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 18:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEF26E30E;
	Tue, 23 Jul 2019 16:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DFBD16E30E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 16:25:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DC98F72167; Tue, 23 Jul 2019 16:25:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Tue, 23 Jul 2019 16:25:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wedens13@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-SNvegyOGAQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1321679196=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1321679196==
Content-Type: multipart/alternative; boundary="15638991047.dE9c.17712"
Content-Transfer-Encoding: 7bit


--15638991047.dE9c.17712
Date: Tue, 23 Jul 2019 16:25:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #59 from wedens13@yandex.ru ---
I have similar issues with Sapphire Pulse Vega 56.
Arch Linux
Kernel versions: 4.19.60-1-lts, 5.2.1-1
mesa: 19.1.3-1, mesa with ACO (f9b38efdda166f2b79562525e72fe135c6b23d54)
llvm: 8.0.0

I've also tried booting with integrated video and using DRI_PRIME=3D1 to of=
fload
to vega. It crashes similarly (after 5min of playing witcher 3 with dxvk
1.3.1):

Jul 23 22:44:01 wedens-pc kernel: amdgpu 0000:03:00.0: [mmhub] VMC page fau=
lt
(src_id:0 ring:154 vmid:1 pasid:32771, for process  pid 0 thread  pid 0
                                  )
Jul 23 22:44:01 wedens-pc kernel: amdgpu 0000:03:00.0:   at address
0x0000800100a00000 from 18
Jul 23 22:44:01 wedens-pc kernel: amdgpu 0000:03:00.0:
VM_L2_PROTECTION_FAULT_STATUS:0x00100134
Jul 23 22:44:11 wedens-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma1 timeout, signaled seq=3D230, emitted seq=3D233
Jul 23 22:44:11 wedens-pc kernel: [drm] GPU recovery disabled.


I'm going to try mesa master and manual power level workaround (when should=
 I
use "reset to normal" command?).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15638991047.dE9c.17712
Date: Tue, 23 Jul 2019 16:25:04 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c59">Comme=
nt # 59</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wedens13&#64;yandex.ru" title=3D"wedens13&#64;yandex.ru">wedens13&#64;yande=
x.ru</a>
</span></b>
        <pre>I have similar issues with Sapphire Pulse Vega 56.
Arch Linux
Kernel versions: 4.19.60-1-lts, 5.2.1-1
mesa: 19.1.3-1, mesa with ACO (f9b38efdda166f2b79562525e72fe135c6b23d54)
llvm: 8.0.0

I've also tried booting with integrated video and using DRI_PRIME=3D1 to of=
fload
to vega. It crashes similarly (after 5min of playing witcher 3 with dxvk
1.3.1):

Jul 23 22:44:01 wedens-pc kernel: amdgpu 0000:03:00.0: [mmhub] VMC page fau=
lt
(src_id:0 ring:154 vmid:1 pasid:32771, for process  pid 0 thread  pid 0
                                  )
Jul 23 22:44:01 wedens-pc kernel: amdgpu 0000:03:00.0:   at address
0x0000800100a00000 from 18
Jul 23 22:44:01 wedens-pc kernel: amdgpu 0000:03:00.0:
VM_L2_PROTECTION_FAULT_STATUS:0x00100134
Jul 23 22:44:11 wedens-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma1 timeout, signaled seq=3D230, emitted seq=3D233
Jul 23 22:44:11 wedens-pc kernel: [drm] GPU recovery disabled.


I'm going to try mesa master and manual power level workaround (when should=
 I
use &quot;reset to normal&quot; command?).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15638991047.dE9c.17712--

--===============1321679196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1321679196==--
