Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4FBDA4C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 03:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A02688FFA;
	Mon, 29 Apr 2019 01:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EFA4F8901E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 01:15:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EC67C72155; Mon, 29 Apr 2019 01:15:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Mon, 29 Apr 2019 01:15:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-sZOILRoeze@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1083713017=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1083713017==
Content-Type: multipart/alternative; boundary="15565005483.Be17.7909"
Content-Transfer-Encoding: 7bit


--15565005483.Be17.7909
Date: Mon, 29 Apr 2019 01:15:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #17 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to Jaap Buurman from comment #16)
> Just got a crash in World of Warcraft as well, running via vkd3d. It happ=
ens
> instantly after trying to log into the game world, so the issue is nicely
> reproducible for me. If you want me to get any traces, please let me know
> what you would like me to run to get them. dmesg logs for now:
>=20
> [   78.450637] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450641] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000984ec2d4b000 from 27
> [   78.450642] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.450648] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450650] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000850e92553000 from 27
> [   78.450652] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.450656] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450658] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000984ec2d4e000 from 27
> [   78.450660] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.450665] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450666] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000850e92542000 from 27
> [   78.450668] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.450673] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450674] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000984ec2d42000 from 27
> [   78.450676] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.450680] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450682] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000850e92552000 from 27
> [   78.450683] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.450688] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450690] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000984ec2d40000 from 27
> [   78.450691] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.450696] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450697] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000850e92552000 from 27
> [   78.450699] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.450703] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450705] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000984ec2d49000 from 27
> [   78.450706] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.450711] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
> ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.exe:=
cs0
> pid 2370)
> [   78.450713] amdgpu 0000:09:00.0:   in page starting at address
> 0x0000850ea1eb2000 from 27
> [   78.450714] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101=
13D
> [   78.454307] amdgpu 0000:09:00.0: IH ring buffer overflow (0x000BEDC0,
> 0x0003EEC0, 0x0003EDE0)
> [   88.570062] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeou=
t,
> signaled seq=3D25317, emitted seq=3D25319
> [   88.570099] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
> information: process WoW.exe pid 2349 thread WoW.exe:cs0 pid 2370
> [   88.570102] amdgpu 0000:09:00.0: GPU reset begin!
> [   88.831392] amdgpu 0000:09:00.0: GPU reset
> [   89.356679] [drm] psp mode1 reset succeed=20
> [   89.475356] amdgpu 0000:09:00.0: GPU reset succeeded, trying to resume
> [   89.475465] [drm] PCIE GART of 512M enabled (table at 0x000000F4009000=
00).
> [   89.475508] [drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* VRAM is l=
ost!
> [   89.475642] [drm] PSP is resuming...
> [   89.623052] [drm] reserve 0x400000 from 0xf400d00000 for PSP TMR SIZE
> [   89.806625] [drm] SADs count is: -2, don't need to read it
> [   89.856619] [drm] SADs count is: -2, don't need to read it
> [   89.938255] [drm] UVD and UVD ENC initialized successfully.
> [   90.038674] [drm] VCE initialized successfully.
> [   90.039672] [drm] recover vram bo from shadow start
> [   90.047496] [drm] recover vram bo from shadow done
> [   90.047497] [drm] Skip scheduling IBs!
> [   90.047499] [drm] Skip scheduling IBs!
> [   90.047511] [drm] Skip scheduling IBs!
> [   90.047518] [drm] Skip scheduling IBs!
> [   90.047523] [drm] Skip scheduling IBs!
> [   90.047524] [drm] Skip scheduling IBs!
> [   90.047530] [drm] Skip scheduling IBs!
> [   90.047531] [drm] Skip scheduling IBs!
> [   90.047533] [drm] Skip scheduling IBs!
> [   90.047535] [drm] Skip scheduling IBs!
> [   90.047536] [drm] Skip scheduling IBs!
> [   90.047538] [drm] Skip scheduling IBs!
> [   90.047539] [drm] Skip scheduling IBs!
> [   90.047555] amdgpu 0000:09:00.0: GPU reset(2) succeeded!

The GPU reset succeeded.  You'll need to restart your desktop manager to
recover because currently no desktop managers handle GPU reset errors and
re-initialize their contexts.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565005483.Be17.7909
Date: Mon, 29 Apr 2019 01:15:48 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to Jaap Buurman from <a href=3D"show_bug.cgi?id=3D10=
9955#c16">comment #16</a>)
<span class=3D"quote">&gt; Just got a crash in World of Warcraft as well, r=
unning via vkd3d. It happens
&gt; instantly after trying to log into the game world, so the issue is nic=
ely
&gt; reproducible for me. If you want me to get any traces, please let me k=
now
&gt; what you would like me to run to get them. dmesg logs for now:
&gt;=20
&gt; [   78.450637] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450641] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000984ec2d4b000 from 27
&gt; [   78.450642] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.450648] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450650] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000850e92553000 from 27
&gt; [   78.450652] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.450656] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450658] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000984ec2d4e000 from 27
&gt; [   78.450660] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.450665] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450666] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000850e92542000 from 27
&gt; [   78.450668] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.450673] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450674] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000984ec2d42000 from 27
&gt; [   78.450676] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.450680] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450682] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000850e92552000 from 27
&gt; [   78.450683] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.450688] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450690] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000984ec2d40000 from 27
&gt; [   78.450691] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.450696] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450697] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000850e92552000 from 27
&gt; [   78.450699] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.450703] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450705] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000984ec2d49000 from 27
&gt; [   78.450706] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.450711] amdgpu 0000:09:00.0: [gfxhub] VMC page fault (src_id:0
&gt; ring:158 vmid:1 pasid:32769, for process WoW.exe pid 2349 thread WoW.e=
xe:cs0
&gt; pid 2370)
&gt; [   78.450713] amdgpu 0000:09:00.0:   in page starting at address
&gt; 0x0000850ea1eb2000 from 27
&gt; [   78.450714] amdgpu 0000:09:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00=
10113D
&gt; [   78.454307] amdgpu 0000:09:00.0: IH ring buffer overflow (0x000BEDC=
0,
&gt; 0x0003EEC0, 0x0003EDE0)
&gt; [   88.570062] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx tim=
eout,
&gt; signaled seq=3D25317, emitted seq=3D25319
&gt; [   88.570099] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
&gt; information: process WoW.exe pid 2349 thread WoW.exe:cs0 pid 2370
&gt; [   88.570102] amdgpu 0000:09:00.0: GPU reset begin!
&gt; [   88.831392] amdgpu 0000:09:00.0: GPU reset
&gt; [   89.356679] [drm] psp mode1 reset succeed=20
&gt; [   89.475356] amdgpu 0000:09:00.0: GPU reset succeeded, trying to res=
ume
&gt; [   89.475465] [drm] PCIE GART of 512M enabled (table at 0x000000F4009=
00000).
&gt; [   89.475508] [drm:amdgpu_device_gpu_recover [amdgpu]] *ERROR* VRAM i=
s lost!
&gt; [   89.475642] [drm] PSP is resuming...
&gt; [   89.623052] [drm] reserve 0x400000 from 0xf400d00000 for PSP TMR SI=
ZE
&gt; [   89.806625] [drm] SADs count is: -2, don't need to read it
&gt; [   89.856619] [drm] SADs count is: -2, don't need to read it
&gt; [   89.938255] [drm] UVD and UVD ENC initialized successfully.
&gt; [   90.038674] [drm] VCE initialized successfully.
&gt; [   90.039672] [drm] recover vram bo from shadow start
&gt; [   90.047496] [drm] recover vram bo from shadow done
&gt; [   90.047497] [drm] Skip scheduling IBs!
&gt; [   90.047499] [drm] Skip scheduling IBs!
&gt; [   90.047511] [drm] Skip scheduling IBs!
&gt; [   90.047518] [drm] Skip scheduling IBs!
&gt; [   90.047523] [drm] Skip scheduling IBs!
&gt; [   90.047524] [drm] Skip scheduling IBs!
&gt; [   90.047530] [drm] Skip scheduling IBs!
&gt; [   90.047531] [drm] Skip scheduling IBs!
&gt; [   90.047533] [drm] Skip scheduling IBs!
&gt; [   90.047535] [drm] Skip scheduling IBs!
&gt; [   90.047536] [drm] Skip scheduling IBs!
&gt; [   90.047538] [drm] Skip scheduling IBs!
&gt; [   90.047539] [drm] Skip scheduling IBs!
&gt; [   90.047555] amdgpu 0000:09:00.0: GPU reset(2) succeeded!</span >

The GPU reset succeeded.  You'll need to restart your desktop manager to
recover because currently no desktop managers handle GPU reset errors and
re-initialize their contexts.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565005483.Be17.7909--

--===============1083713017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1083713017==--
