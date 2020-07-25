Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0E722D5D3
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 09:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AC76EA64;
	Sat, 25 Jul 2020 07:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096FC6EA64
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 07:35:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sat, 25 Jul 2020 07:35:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vandalhj@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-IvH01GCzRc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=205089

Lech (vandalhj@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vandalhj@gmail.com

--- Comment #13 from Lech (vandalhj@gmail.com) ---
Jul 25 09:19:54 lech-ryzen-vega kernel: [37627.065966]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fences
timed out!
Jul 25 09:19:54 lech-ryzen-vega kernel: [37631.935858] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=1228554, emitted seq=1228556
Jul 25 09:19:54 lech-ryzen-vega kernel: [37631.935939] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process HeroesOfTheStor pid 28617 thread
HeroesOfTheStor pid 28691
Jul 25 09:19:54 lech-ryzen-vega kernel: [37631.935948] amdgpu 0000:0b:00.0: GPU
reset begin!
Jul 25 09:19:54 lech-ryzen-vega kernel: [37632.181860]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fences
timed out!
Jul 25 09:19:54 lech-ryzen-vega kernel: [37632.312215] amdgpu 0000:0b:00.0: GPU
BACO reset
Jul 25 09:19:55 lech-ryzen-vega kernel: [37632.888325] amdgpu 0000:0b:00.0: GPU
reset succeeded, trying to resume
Jul 25 09:19:55 lech-ryzen-vega kernel: [37632.888485] [drm] PCIE GART of 512M
enabled (table at 0x000000F400900000).
Jul 25 09:19:55 lech-ryzen-vega kernel: [37632.888509] [drm] VRAM is lost due
to GPU reset!
Jul 25 09:19:55 lech-ryzen-vega kernel: [37632.888833] [drm] PSP is resuming...
Jul 25 09:19:55 lech-ryzen-vega kernel: [37633.076488] [drm] reserve 0x400000
from 0xf5fe800000 for PSP TMR
Jul 25 09:19:55 lech-ryzen-vega kernel: [37633.255659] [drm] kiq ring mec 2
pipe 1 q 0
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373718] snd_hda_intel
0000:0b:00.1: azx_get_response timeout, switching to polling mode: last
cmd=0x00af2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373723] snd_hda_intel
0000:0b:00.1: spurious response 0x0:0x0, last cmd=0xaf2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373726] snd_hda_intel
0000:0b:00.1: spurious response 0x0:0x0, last cmd=0xaf2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373728] snd_hda_intel
0000:0b:00.1: spurious response 0x233:0x0, last cmd=0xaf2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373730] snd_hda_intel
0000:0b:00.1: spurious response 0x0:0x0, last cmd=0xaf2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373731] snd_hda_intel
0000:0b:00.1: spurious response 0x1:0x0, last cmd=0xaf2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373733] snd_hda_intel
0000:0b:00.1: spurious response 0x0:0x0, last cmd=0xaf2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373735] snd_hda_intel
0000:0b:00.1: spurious response 0x0:0x0, last cmd=0xaf2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373736] snd_hda_intel
0000:0b:00.1: spurious response 0x0:0x0, last cmd=0xaf2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373738] snd_hda_intel
0000:0b:00.1: spurious response 0x0:0x0, last cmd=0xaf2d00
Jul 25 09:19:56 lech-ryzen-vega kernel: [37634.373739] snd_hda_intel
0000:0b:00.1: spurious response 0x0:0x0, last cmd=0xaf2d00
Jul 25 09:19:57 lech-ryzen-vega kernel: [37635.377702] snd_hda_intel
0000:0b:00.1: No response from codec, disabling MSI: last cmd=0x00a72d01
Jul 25 09:19:58 lech-ryzen-vega kernel: [37636.393677] snd_hda_intel
0000:0b:00.1: No response from codec, resetting bus: last cmd=0x00a72d01
Jul 25 09:19:59 lech-ryzen-vega kernel: [37637.397658] snd_hda_intel
0000:0b:00.1: azx_get_response timeout, switching to single_cmd mode: last
cmd=0x00b77701
Jul 25 09:19:59 lech-ryzen-vega kernel: [37637.419432] [drm] UVD and UVD ENC
initialized successfully.
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519135] [drm] VCE initialized
successfully.
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519149] amdgpu 0000:0b:00.0:
ring gfx uses VM inv eng 0 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519151] amdgpu 0000:0b:00.0:
ring comp_1.0.0 uses VM inv eng 1 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519153] amdgpu 0000:0b:00.0:
ring comp_1.1.0 uses VM inv eng 4 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519155] amdgpu 0000:0b:00.0:
ring comp_1.2.0 uses VM inv eng 5 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519156] amdgpu 0000:0b:00.0:
ring comp_1.3.0 uses VM inv eng 6 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519158] amdgpu 0000:0b:00.0:
ring comp_1.0.1 uses VM inv eng 7 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519159] amdgpu 0000:0b:00.0:
ring comp_1.1.1 uses VM inv eng 8 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519161] amdgpu 0000:0b:00.0:
ring comp_1.2.1 uses VM inv eng 9 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519162] amdgpu 0000:0b:00.0:
ring comp_1.3.1 uses VM inv eng 10 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519164] amdgpu 0000:0b:00.0:
ring kiq_2.1.0 uses VM inv eng 11 on hub 0
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519166] amdgpu 0000:0b:00.0:
ring sdma0 uses VM inv eng 0 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519167] amdgpu 0000:0b:00.0:
ring page0 uses VM inv eng 1 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519169] amdgpu 0000:0b:00.0:
ring sdma1 uses VM inv eng 4 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519170] amdgpu 0000:0b:00.0:
ring page1 uses VM inv eng 5 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519171] amdgpu 0000:0b:00.0:
ring uvd_0 uses VM inv eng 6 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519173] amdgpu 0000:0b:00.0:
ring uvd_enc_0.0 uses VM inv eng 7 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519174] amdgpu 0000:0b:00.0:
ring uvd_enc_0.1 uses VM inv eng 8 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519176] amdgpu 0000:0b:00.0:
ring vce0 uses VM inv eng 9 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519177] amdgpu 0000:0b:00.0:
ring vce1 uses VM inv eng 10 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519179] amdgpu 0000:0b:00.0:
ring vce2 uses VM inv eng 11 on hub 1
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519180] [drm] ECC is not
present.
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.519182] [drm] SRAM ECC is not
present.
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.520993] [drm] recover vram bo
from shadow start
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522435] [drm] recover vram bo
from shadow done
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522437] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522438] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522466] amdgpu 0000:0b:00.0: GPU
reset(2) succeeded!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522477] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522479] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522481] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522482] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522484] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522485] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522487] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522488] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522489] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522491] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522492] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522493] [drm] Skip scheduling
IBs!
Jul 25 09:20:00 lech-ryzen-vega kernel: [37637.522770] [drm:amdgpu_cs_ioctl
[amdgpu]] *ERROR* Failed to initialize parser -125!
Jul 25 09:20:10 lech-ryzen-vega kernel: [37648.127879] [drm:amdgpu_cs_ioctl
[amdgpu]] *ERROR* Failed to initialize parser -125!
Jul 25 09:20:10 lech-ryzen-vega kernel: [37648.129190] [drm:amdgpu_cs_ioctl
[amdgpu]] *ERROR* Failed to initialize parser -125!
Jul 25 09:20:10 lech-ryzen-vega kernel: [37648.162337] [drm:amdgpu_cs_ioctl
[amdgpu]] *ERROR* Failed to initialize parser -125!
Jul 25 09:20:10 lech-ryzen-vega kernel: [37648.164145] [drm:amdgpu_cs_ioctl
[amdgpu]] *ERROR* Failed to initialize parser -125!
Jul 25 09:20:10 lech-ryzen-vega kernel: [37648.164261] [drm:amdgpu_cs_ioctl
[amdgpu]] *ERROR* Failed to initialize parser -125!
Jul 25 09:20:10 lech-ryzen-vega kernel: [37648.167924] [drm:amdgpu_cs_ioctl
[amdgpu]] *ERROR* Failed to initialize parser -125!
Jul 25 09:20:10 lech-ryzen-vega kernel: [37648.168801] [drm:amdgpu_cs_ioctl
[amdgpu]] *ERROR* Failed to initialize parser -125!

HW: 
Vega 56 
Ryzen 3600X

SW:
5.7.1-050701-generic x86_64
Mesa 20.2.0-devel (git-14a12b7 2020-07-24 focal-oibaf-ppa)

You can safely reopen it.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
