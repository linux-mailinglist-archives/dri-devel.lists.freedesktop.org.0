Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0571489116
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 11:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DCD6E31C;
	Sun, 11 Aug 2019 09:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67D2E6E31C
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 09:31:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5E25972167; Sun, 11 Aug 2019 09:31:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 11 Aug 2019 09:31:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-ELXTxQFHBJ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0361975128=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0361975128==
Content-Type: multipart/alternative; boundary="15655159010.507eBC5.3171"
Content-Transfer-Encoding: 7bit


--15655159010.507eBC5.3171
Date: Sun, 11 Aug 2019 09:31:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #82 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #81)
> Can anyone provide a apitrace/renderdoc capture that can reliably reprodu=
ce
> the crash/freeze?

Hello, Sadly my freezes are hard to reproduce. Sometimes I can play for a d=
ay
with no freeze, sometimes it freezes in 10 minutes, one hour, and so on.

I had another freeze today:

OS: openSUSE Tumbleweed x86_64=20
Kernel: 5.2.5-1-default
Resolution: 3440x1440
DE: Xfce
WM: Xfwm4
CPU: AMD Ryzen 7 2700X (16) @ 3.700GHz
GPU: AMD ATI Radeon VII
Memory: 3791MiB / 64387MiB=20
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.3

Game: EVE Online: Wine+DXVK. (Crossover 18.5.0) vsync off frame limiter off
Problem description: Afer rougly 1 hour of gameplay, desktop Frozen for a f=
ew
seconds but managed to recover. Game did not recover and I killed the proce=
ss.=20

DMESG:

[20612.721860] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D12880412, emitted seq=3D12880414
[20612.721921] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process exefile.exe pid 1980 thread exefile.ex:cs0 pid 2057
[20612.721925] amdgpu 0000:0a:00.0: GPU reset begin!
[20613.526448] amdgpu 0000:0a:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[20613.526502] [drm:gfx_v9_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
[20613.547524] amdgpu 0000:0a:00.0: GPU mode1 reset
[20614.055810] [drm] psp mode1 reset succeed=20
[20614.128815] amdgpu 0000:0a:00.0: GPU reset succeeded, trying to resume
[20614.128943] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000=
).
[20614.129304] [drm] PSP is resuming...
[20614.192202] [drm] reserve 0x400000 from 0x8000c00000 for PSP TMR SIZE
[20614.649220] [drm] UVD and UVD ENC initialized successfully.
[20614.748872] [drm] VCE initialized successfully.
[20615.271942] [drm] Fence fallback timer expired on ring gfx
[20615.783826] [drm] Fence fallback timer expired on ring comp_1.0.0
[20616.616023] [drm] Fence fallback timer expired on ring uvd_1
[20617.127844] [drm] Fence fallback timer expired on ring uvd_enc_1.0
[20617.639836] [drm] Fence fallback timer expired on ring uvd_enc_1.1
[20617.739606] [drm] recover vram bo from shadow start
[20617.742231] [drm] recover vram bo from shadow done
[20617.742233] [drm] Skip scheduling IBs!
[20617.742234] [drm] Skip scheduling IBs!
[20617.742259] amdgpu 0000:0a:00.0: GPU reset(2) succeeded!
[20617.742289] [drm] Skip scheduling IBs!
[20617.742309] [drm] Skip scheduling IBs!
[20617.742314] [drm] Skip scheduling IBs!
[20617.742316] [drm] Skip scheduling IBs!
[20617.742318] [drm] Skip scheduling IBs!
[20617.742320] [drm] Skip scheduling IBs!
[20617.743840] [drm] Skip scheduling IBs!
[20617.744006] [drm] Skip scheduling IBs!
[20617.744180] [drm] Skip scheduling IBs!
[20617.744450] [drm] Skip scheduling IBs!

System Logs:

2019-08-11T17:13:10.377029+08:00 MGDT-ROG kernel: [20612.721860]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled
seq=3D12880412, emitted seq=3D12880414
2019-08-11T17:13:10.377046+08:00 MGDT-ROG kernel: [20612.721921]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
exefile.exe pid 1980 thread exefile.ex:cs0 pid 2057
2019-08-11T17:13:10.377047+08:00 MGDT-ROG kernel: [20612.721925] amdgpu
0000:0a:00.0: GPU reset begin!
2019-08-11T17:13:11.182763+08:00 MGDT-ROG kernel: [20613.526448] amdgpu
0000:0a:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0
test failed (-110)
2019-08-11T17:13:11.182776+08:00 MGDT-ROG kernel: [20613.526502]
[drm:gfx_v9_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
2019-08-11T17:13:11.202766+08:00 MGDT-ROG kernel: [20613.547524] amdgpu
0000:0a:00.0: GPU mode1 reset
2019-08-11T17:13:11.714757+08:00 MGDT-ROG kernel: [20614.055810] [drm] psp
mode1 reset succeed=20
2019-08-11T17:13:11.786740+08:00 MGDT-ROG kernel: [20614.128815] amdgpu
0000:0a:00.0: GPU reset succeeded, trying to resume
2019-08-11T17:13:11.786749+08:00 MGDT-ROG kernel: [20614.128943] [drm] PCIE
GART of 512M enabled (table at 0x0000008000300000).
2019-08-11T17:13:11.786751+08:00 MGDT-ROG kernel: [20614.129304] [drm] PSP =
is
resuming...
2019-08-11T17:13:11.850739+08:00 MGDT-ROG kernel: [20614.192202] [drm] rese=
rve
0x400000 from 0x8000c00000 for PSP TMR SIZE
2019-08-11T17:13:12.306756+08:00 MGDT-ROG kernel: [20614.649220] [drm] UVD =
and
UVD ENC initialized successfully.
2019-08-11T17:13:12.406756+08:00 MGDT-ROG kernel: [20614.748872] [drm] VCE
initialized successfully.
2019-08-11T17:13:12.926899+08:00 MGDT-ROG kernel: [20615.271942] [drm] Fence
fallback timer expired on ring gfx
2019-08-11T17:13:13.438783+08:00 MGDT-ROG kernel: [20615.783826] [drm] Fence
fallback timer expired on ring comp_1.0.0
2019-08-11T17:13:14.274773+08:00 MGDT-ROG kernel: [20616.616023] [drm] Fence
fallback timer expired on ring uvd_1
2019-08-11T17:13:14.671435+08:00 MGDT-ROG tracker-store[4801]: OK
2019-08-11T17:13:14.672970+08:00 MGDT-ROG systemd[2481]: tracker-store.serv=
ice:
Succeeded.
2019-08-11T17:13:14.782896+08:00 MGDT-ROG kernel: [20617.127844] [drm] Fence
fallback timer expired on ring uvd_enc_1.0
2019-08-11T17:13:15.294768+08:00 MGDT-ROG kernel: [20617.639836] [drm] Fence
fallback timer expired on ring uvd_enc_1.1
2019-08-11T17:13:15.394759+08:00 MGDT-ROG kernel: [20617.739606] [drm] reco=
ver
vram bo from shadow start
2019-08-11T17:13:15.397215+08:00 MGDT-ROG kernel: [20617.742231] [drm] reco=
ver
vram bo from shadow done
2019-08-11T17:13:15.397227+08:00 MGDT-ROG kernel: [20617.742233] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397228+08:00 MGDT-ROG kernel: [20617.742234] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397231+08:00 MGDT-ROG kernel: [20617.742259] amdgpu
0000:0a:00.0: GPU reset(2) succeeded!
2019-08-11T17:13:15.397233+08:00 MGDT-ROG kernel: [20617.742289] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397235+08:00 MGDT-ROG kernel: [20617.742309] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397242+08:00 MGDT-ROG kernel: [20617.742314] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397262+08:00 MGDT-ROG kernel: [20617.742316] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397265+08:00 MGDT-ROG kernel: [20617.742318] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397268+08:00 MGDT-ROG kernel: [20617.742320] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.402744+08:00 MGDT-ROG kernel: [20617.743840] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.402753+08:00 MGDT-ROG kernel: [20617.744006] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.402755+08:00 MGDT-ROG kernel: [20617.744180] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.402757+08:00 MGDT-ROG kernel: [20617.744450] [drm] Skip
scheduling IBs!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655159010.507eBC5.3171
Date: Sun, 11 Aug 2019 09:31:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c82">Comme=
nt # 82</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D109955#c81">comment #81</a>)
<span class=3D"quote">&gt; Can anyone provide a apitrace/renderdoc capture =
that can reliably reproduce
&gt; the crash/freeze?</span >

Hello, Sadly my freezes are hard to reproduce. Sometimes I can play for a d=
ay
with no freeze, sometimes it freezes in 10 minutes, one hour, and so on.

I had another freeze today:

OS: openSUSE Tumbleweed x86_64=20
Kernel: 5.2.5-1-default
Resolution: 3440x1440
DE: Xfce
WM: Xfwm4
CPU: AMD Ryzen 7 2700X (16) &#64; 3.700GHz
GPU: AMD ATI Radeon VII
Memory: 3791MiB / 64387MiB=20
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.3

Game: EVE Online: Wine+DXVK. (Crossover 18.5.0) vsync off frame limiter off
Problem description: Afer rougly 1 hour of gameplay, desktop Frozen for a f=
ew
seconds but managed to recover. Game did not recover and I killed the proce=
ss.=20

DMESG:

[20612.721860] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D12880412, emitted seq=3D12880414
[20612.721921] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process exefile.exe pid 1980 thread exefile.ex:cs0 pid 2057
[20612.721925] amdgpu 0000:0a:00.0: GPU reset begin!
[20613.526448] amdgpu 0000:0a:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[20613.526502] [drm:gfx_v9_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
[20613.547524] amdgpu 0000:0a:00.0: GPU mode1 reset
[20614.055810] [drm] psp mode1 reset succeed=20
[20614.128815] amdgpu 0000:0a:00.0: GPU reset succeeded, trying to resume
[20614.128943] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000=
).
[20614.129304] [drm] PSP is resuming...
[20614.192202] [drm] reserve 0x400000 from 0x8000c00000 for PSP TMR SIZE
[20614.649220] [drm] UVD and UVD ENC initialized successfully.
[20614.748872] [drm] VCE initialized successfully.
[20615.271942] [drm] Fence fallback timer expired on ring gfx
[20615.783826] [drm] Fence fallback timer expired on ring comp_1.0.0
[20616.616023] [drm] Fence fallback timer expired on ring uvd_1
[20617.127844] [drm] Fence fallback timer expired on ring uvd_enc_1.0
[20617.639836] [drm] Fence fallback timer expired on ring uvd_enc_1.1
[20617.739606] [drm] recover vram bo from shadow start
[20617.742231] [drm] recover vram bo from shadow done
[20617.742233] [drm] Skip scheduling IBs!
[20617.742234] [drm] Skip scheduling IBs!
[20617.742259] amdgpu 0000:0a:00.0: GPU reset(2) succeeded!
[20617.742289] [drm] Skip scheduling IBs!
[20617.742309] [drm] Skip scheduling IBs!
[20617.742314] [drm] Skip scheduling IBs!
[20617.742316] [drm] Skip scheduling IBs!
[20617.742318] [drm] Skip scheduling IBs!
[20617.742320] [drm] Skip scheduling IBs!
[20617.743840] [drm] Skip scheduling IBs!
[20617.744006] [drm] Skip scheduling IBs!
[20617.744180] [drm] Skip scheduling IBs!
[20617.744450] [drm] Skip scheduling IBs!

System Logs:

2019-08-11T17:13:10.377029+08:00 MGDT-ROG kernel: [20612.721860]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled
seq=3D12880412, emitted seq=3D12880414
2019-08-11T17:13:10.377046+08:00 MGDT-ROG kernel: [20612.721921]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
exefile.exe pid 1980 thread exefile.ex:cs0 pid 2057
2019-08-11T17:13:10.377047+08:00 MGDT-ROG kernel: [20612.721925] amdgpu
0000:0a:00.0: GPU reset begin!
2019-08-11T17:13:11.182763+08:00 MGDT-ROG kernel: [20613.526448] amdgpu
0000:0a:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0
test failed (-110)
2019-08-11T17:13:11.182776+08:00 MGDT-ROG kernel: [20613.526502]
[drm:gfx_v9_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
2019-08-11T17:13:11.202766+08:00 MGDT-ROG kernel: [20613.547524] amdgpu
0000:0a:00.0: GPU mode1 reset
2019-08-11T17:13:11.714757+08:00 MGDT-ROG kernel: [20614.055810] [drm] psp
mode1 reset succeed=20
2019-08-11T17:13:11.786740+08:00 MGDT-ROG kernel: [20614.128815] amdgpu
0000:0a:00.0: GPU reset succeeded, trying to resume
2019-08-11T17:13:11.786749+08:00 MGDT-ROG kernel: [20614.128943] [drm] PCIE
GART of 512M enabled (table at 0x0000008000300000).
2019-08-11T17:13:11.786751+08:00 MGDT-ROG kernel: [20614.129304] [drm] PSP =
is
resuming...
2019-08-11T17:13:11.850739+08:00 MGDT-ROG kernel: [20614.192202] [drm] rese=
rve
0x400000 from 0x8000c00000 for PSP TMR SIZE
2019-08-11T17:13:12.306756+08:00 MGDT-ROG kernel: [20614.649220] [drm] UVD =
and
UVD ENC initialized successfully.
2019-08-11T17:13:12.406756+08:00 MGDT-ROG kernel: [20614.748872] [drm] VCE
initialized successfully.
2019-08-11T17:13:12.926899+08:00 MGDT-ROG kernel: [20615.271942] [drm] Fence
fallback timer expired on ring gfx
2019-08-11T17:13:13.438783+08:00 MGDT-ROG kernel: [20615.783826] [drm] Fence
fallback timer expired on ring comp_1.0.0
2019-08-11T17:13:14.274773+08:00 MGDT-ROG kernel: [20616.616023] [drm] Fence
fallback timer expired on ring uvd_1
2019-08-11T17:13:14.671435+08:00 MGDT-ROG tracker-store[4801]: OK
2019-08-11T17:13:14.672970+08:00 MGDT-ROG systemd[2481]: tracker-store.serv=
ice:
Succeeded.
2019-08-11T17:13:14.782896+08:00 MGDT-ROG kernel: [20617.127844] [drm] Fence
fallback timer expired on ring uvd_enc_1.0
2019-08-11T17:13:15.294768+08:00 MGDT-ROG kernel: [20617.639836] [drm] Fence
fallback timer expired on ring uvd_enc_1.1
2019-08-11T17:13:15.394759+08:00 MGDT-ROG kernel: [20617.739606] [drm] reco=
ver
vram bo from shadow start
2019-08-11T17:13:15.397215+08:00 MGDT-ROG kernel: [20617.742231] [drm] reco=
ver
vram bo from shadow done
2019-08-11T17:13:15.397227+08:00 MGDT-ROG kernel: [20617.742233] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397228+08:00 MGDT-ROG kernel: [20617.742234] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397231+08:00 MGDT-ROG kernel: [20617.742259] amdgpu
0000:0a:00.0: GPU reset(2) succeeded!
2019-08-11T17:13:15.397233+08:00 MGDT-ROG kernel: [20617.742289] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397235+08:00 MGDT-ROG kernel: [20617.742309] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397242+08:00 MGDT-ROG kernel: [20617.742314] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397262+08:00 MGDT-ROG kernel: [20617.742316] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397265+08:00 MGDT-ROG kernel: [20617.742318] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.397268+08:00 MGDT-ROG kernel: [20617.742320] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.402744+08:00 MGDT-ROG kernel: [20617.743840] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.402753+08:00 MGDT-ROG kernel: [20617.744006] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.402755+08:00 MGDT-ROG kernel: [20617.744180] [drm] Skip
scheduling IBs!
2019-08-11T17:13:15.402757+08:00 MGDT-ROG kernel: [20617.744450] [drm] Skip
scheduling IBs!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655159010.507eBC5.3171--

--===============0361975128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0361975128==--
