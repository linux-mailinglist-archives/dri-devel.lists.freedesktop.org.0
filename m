Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9664C22964
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 01:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F67891C2;
	Sun, 19 May 2019 23:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55BF9891C5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 23:19:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5245872167; Sun, 19 May 2019 23:19:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110701] GPU faults in in Unigine Valley 1.0
Date: Sun, 19 May 2019 23:19:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lonewolf@xs4all.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110701-502-7O5iXiEiql@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110701-502@http.bugs.freedesktop.org/>
References: <bug-110701-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0239671557=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0239671557==
Content-Type: multipart/alternative; boundary="15583079892.cdA09.27020"
Content-Transfer-Encoding: 7bit


--15583079892.cdA09.27020
Date: Sun, 19 May 2019 23:19:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110701

--- Comment #12 from LoneVVolf <lonewolf@xs4all.nl> ---
I get a similar bug when running knetwalk[1] . As soon as the application g=
ets
focus, there's visual corruption in its window. If I move the mouse away the
corruption (and messafes) are gone.
Running mesa-git built an hour ago on a RX 580 .
Will try to verify which of the the commits mentioned matter tomorrow.


[1] https://kde.org/applications/games/knetwalk/


dmesg snippet
[ 1642.706004] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0e08040c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706010] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100BC1
[ 1642.706012] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E00400C
[ 1642.706016] amdgpu 0000:42:00.0: VM fault (0x0c, vmid 7, pasid 32772) at
page 1051585, read from 'TC1' (0x54433100) (4)
[ 1642.706074] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0c38440c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706078] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100B87
[ 1642.706080] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E04400C
[ 1642.706082] amdgpu 0000:42:00.0: VM fault (0x0c, vmid 7, pasid 32772) at
page 1051527, read from 'TC5' (0x54433500) (68)
[ 1642.706087] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0c38480c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706089] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100B9D
[ 1642.706090] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E04400C
[ 1642.706093] amdgpu 0000:42:00.0: VM fault (0x0c, vmid 7, pasid 32772) at
page 1051549, read from 'TC5' (0x54433500) (68)
[ 1642.706098] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0c38c80c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706102] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100BE2
[ 1642.706104] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E04400C
[ 1642.706106] amdgpu 0000:42:00.0: VM fault (0x0c, vmid 7, pasid 32772) at
page 1051618, read from 'TC5' (0x54433500) (68)
[ 1642.706111] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0c38c40c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706113] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100BD0
[ 1642.706115] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E0C800C

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15583079892.cdA09.27020
Date: Sun, 19 May 2019 23:19:49 +0000
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
   title=3D"NEW - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701">bug 11070=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lonewolf&#64;xs4all.nl" title=3D"LoneVVolf &lt;lonewolf&#64;xs4all.nl&gt;">=
 <span class=3D"fn">LoneVVolf</span></a>
</span></b>
        <pre>I get a similar bug when running knetwalk[1] . As soon as the =
application gets
focus, there's visual corruption in its window. If I move the mouse away the
corruption (and messafes) are gone.
Running mesa-git built an hour ago on a RX 580 .
Will try to verify which of the the commits mentioned matter tomorrow.


[1] <a href=3D"https://kde.org/applications/games/knetwalk/">https://kde.or=
g/applications/games/knetwalk/</a>


dmesg snippet
[ 1642.706004] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0e08040c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706010] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100BC1
[ 1642.706012] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E00400C
[ 1642.706016] amdgpu 0000:42:00.0: VM fault (0x0c, vmid 7, pasid 32772) at
page 1051585, read from 'TC1' (0x54433100) (4)
[ 1642.706074] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0c38440c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706078] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100B87
[ 1642.706080] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E04400C
[ 1642.706082] amdgpu 0000:42:00.0: VM fault (0x0c, vmid 7, pasid 32772) at
page 1051527, read from 'TC5' (0x54433500) (68)
[ 1642.706087] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0c38480c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706089] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100B9D
[ 1642.706090] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E04400C
[ 1642.706093] amdgpu 0000:42:00.0: VM fault (0x0c, vmid 7, pasid 32772) at
page 1051549, read from 'TC5' (0x54433500) (68)
[ 1642.706098] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0c38c80c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706102] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100BE2
[ 1642.706104] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E04400C
[ 1642.706106] amdgpu 0000:42:00.0: VM fault (0x0c, vmid 7, pasid 32772) at
page 1051618, read from 'TC5' (0x54433500) (68)
[ 1642.706111] amdgpu 0000:42:00.0: GPU fault detected: 146 0x0c38c40c for
process knetwalk pid 2647 thread knetwalk:cs0 pid 2656
[ 1642.706113] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=
=20
0x00100BD0
[ 1642.706115] amdgpu 0000:42:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E0C800C</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15583079892.cdA09.27020--

--===============0239671557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0239671557==--
