Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEAB5477D1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 00:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A455C10E1A5;
	Sat, 11 Jun 2022 22:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2713710E1ED
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 22:06:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45F8B612D8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 22:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6938C3411C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654985206;
 bh=66jtYllSPLzI5bENbIzrD0a8fg656Do7DmSLORfjW14=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LkTV3kzCA1Llru84CvlJ0fuxTfRP05RkFnlQznZDt1UPPyFWlXhR6KmJ3lF/X3uUR
 MZ7RyL23ZkbJ6RR3HrjgR64r857JsK3hB7dRdODnYg+XEKdRnTYetgVY4F3nZYhxdc
 D2+I0Ku43s7Sc5s2RIIdf0qP21P7YnNMrMd79AoC0RUZX+5H6B0sgN6DOwOFQ8+ZJD
 NPgMpFrCglHIN80cp9O7KVF7fy7kNsvCfYGDhdETpl7dgYfIykrmDUGP4DBhv59rYq
 3rCIGuFNMkRHCZghukWU4z8Ej9ZLNKVH84I56X+8Jq3e5MpeQ3rWA2WgPYj1eFHlEC
 1xauDm8sm4Eow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 983ECC05FD2; Sat, 11 Jun 2022 22:06:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 11 Jun 2022 22:06:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.von.wittich@iserv.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-Dmz2ksgTJS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

Martin von Wittich (martin.von.wittich@iserv.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |martin.von.wittich@iserv.eu

--- Comment #70 from Martin von Wittich (martin.von.wittich@iserv.eu) ---
My Ubuntu 20.04 desktop is crashing several times per day due to this bug s=
ince
I've upgraded my computer from an old Intel Xeon to an AMD Ryzen 9 5900X on=
 a
B550 mainboard. I've had the same AMD RX Vega 56 graphics card in both
computers, so I assume this is probably more related to the mainboard/CPU t=
han
to the graphics card.

The crashes from today:

```
martin@martin ~ % grep amdgpu /var/log/syslog | grep ERROR | grep -v 'Faile=
d to
initialize parser'
Jun 11 03:15:33 martin kernel: [21494.642889] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D1750601, emitted seq=3D1=
750603
Jun 11 03:15:33 martin kernel: [21494.643055] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process firefox pid 5037 thread
firefox:cs0 pid 5123
Jun 11 03:15:50 martin kernel: [21511.795007] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D1750605, emitted seq=3D1=
750608
Jun 11 03:15:50 martin kernel: [21511.795174] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process firefox pid 5037 thread
firefox:cs0 pid 5123
Jun 11 15:56:07 martin kernel: [ 1477.069969] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D216293, emitted seq=3D21=
6295
Jun 11 15:56:07 martin kernel: [ 1477.070140] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process firefox pid 5237 thread
firefox:cs0 pid 5302
Jun 11 15:56:22 martin kernel: [ 1492.174077] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D216297, emitted seq=3D21=
6300
Jun 11 15:56:22 martin kernel: [ 1492.174248] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process  pid 0 thread  pid 0
Jun 11 16:03:28 martin kernel: [ 1918.161101] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D264406, emitted seq=3D26=
4408
Jun 11 16:03:28 martin kernel: [ 1918.161271] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process firefox pid 10569 thread
firefox:cs0 pid 10633
Jun 11 16:03:49 martin kernel: [ 1938.385307] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D264410, emitted seq=3D26=
4413
Jun 11 16:03:49 martin kernel: [ 1938.385479] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process firefox pid 10569 thread
firefox:cs0 pid 10633
Jun 11 23:28:12 martin kernel: [25491.854294] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D2390985, emitted seq=3D2=
390987
Jun 11 23:28:12 martin kernel: [25491.854460] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process firefox pid 4922 thread
firefox:cs0 pid 4989
Jun 11 23:28:28 martin kernel: [25507.982446] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D2390989, emitted seq=3D2=
390992
Jun 11 23:28:28 martin kernel: [25507.982613] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process  pid 0 thread  pid 0
Jun 11 23:29:51 martin kernel: [25591.333483] amdgpu 0000:2d:00.0: amdgpu:=
=20=20=20=20=20
 WALKER_ERROR: 0x0
Jun 11 23:29:51 martin kernel: [25591.333485] amdgpu 0000:2d:00.0: amdgpu:=
=20=20=20=20=20
 MAPPING_ERROR: 0x0
Jun 11 23:30:01 martin kernel: [25601.412838] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring uvd_0 timeout, signaled seq=3D308, emitted seq=3D310
Jun 11 23:30:01 martin kernel: [25601.413009] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process mpv pid 44110 thread mpv:cs0=
 pid
44122
Jun 11 23:30:16 martin kernel: [25616.014983] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D2409182, emitted seq=3D2=
409185
Jun 11 23:30:16 martin kernel: [25616.015151] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process firefox pid 42941 thread
firefox:cs0 pid 43005
```

When I upgraded my computer at the end of 2021, I had to switch from the
default Ubuntu 20.04 kernel `linux-image-generic` (5.4.0) to
`linux-image-generic-hwe-20.04` (5.11.0) because of some hardware issues wi=
th
the new computer (I don't remember what exactly didn't work, IIRC the netwo=
rk).

I'm not exactly sure when the crashes started, but I changed from
`linux-image-generic-hwe-20.04` (5.14) to `linux-image-oem-20.04d` (5.14) on
2022-04-30 in the hopes that that might resolve the issue, but unfortunatel=
y it
didn't help.

I tried the `amdgpu.runpm=3D0` workaround today which also didn't help.

I can also confirm that the attached video "5 second video clip that trigge=
rs a
crash" successfully triggers the crash on my system.

The main other thing that seems to trigger the crash is to open new tabs in
Firefox (in that not every new tab I open causes the crash, but when it
crashes, it's usually when I was trying to open a new tab).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
