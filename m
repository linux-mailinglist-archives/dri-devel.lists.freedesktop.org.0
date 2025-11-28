Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA885C90629
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 01:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D0110E7ED;
	Fri, 28 Nov 2025 00:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iNMh298K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F85910E7ED
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 00:04:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 419CB404E3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 00:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 217D9C113D0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 00:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764288274;
 bh=evAU5nv4UkblQ0km2bN+rnabsdHsldd42ez6PcC9Hxg=;
 h=From:To:Subject:Date:From;
 b=iNMh298K2jHmlbTprhtasn59/UfoFptLcqDQW5npnOcfiWPydwzeloGRKcEOh6rbI
 t0Mbm7iHREHtSUdFnUprD7EoqssMtd0Gvcd492gbu4d+ioD27qXkpE16NQNGc6kvNp
 xeEEBmL8p7b8dpV2zW1Vij6+DKKMF/HynapVeql882E+xMPdxYuv3i2W2UIpabUbVa
 UrNk7LJeLiexyqRtlno3fBqwXa0YsYreywWnoDeOcqklW7Ig/zfqigEtZbUxzzSy7U
 pm6ftX2OVs1N80u9Iu983l4zhxqwkJv74otvOwrMa6dT2Glt/6bU6G63l8iU/ad7e+
 ipBE9CoW2r5bQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0F1F2C41613; Fri, 28 Nov 2025 00:04:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220813] New: 3x Radeon RX 7900 XTX Cards Exhibiting Identical
 PCIe Bus Dropouts, SMU/GFXOFF Failures, and Full GPU Loss Under Gaming and
 Compute Loads
Date: Fri, 28 Nov 2025 00:04:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: amdgamingresolved@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220813-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220813

            Bug ID: 220813
           Summary: 3x Radeon RX 7900 XTX Cards Exhibiting Identical PCIe
                    Bus Dropouts, SMU/GFXOFF Failures, and Full GPU Loss
                    Under Gaming and Compute Loads
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: amdgamingresolved@gmail.com
        Regression: No

Created attachment 308979
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308979&action=3Dedit
Logs captured on Ubuntu in both Gaming and AI workloads demonstrating the
failure pattern

I am reporting a reproducible and severe failure mode affecting three separ=
ate
AMD Radeon RX 7900 XTX GPUs across two years, two operating systems, multip=
le
workloads, and multiple driver stacks. All three cards eventually degrade i=
nto
the same failure condition: full GPU disappearance from the PCIe bus, SMU
lock-ups, GFX ring timeouts, SDMA failures, fans ramping to 100%, and perma=
nent
instability until AC power is removed.

This appears to be a systemic hardware or firmware-level issue, not isolate=
d to
one card or one environment.

Hardware and System Information

GPU 1: XFX Radeon RX 7900 XTX Merc 310 Black Edition
Serial Number: A6V070402

GPU 2: XFX Radeon RX 7900 XTX Merc 310 Black Edition
Serial Number: ACB000640

GPU 3 XFX Radeon RX 7900 XTX Merc 310 Black Edition=20
Serial Number: Y6V013609 (Original first owned card, eventually died, no
display signal, has been RMA'd)

Motherboard: ASUS Prime Pro X570
BIOS: 5031
PSU: Cooler Master MWE Gold 1050 V2 (3 independent PCIe power runs)
OS: Ubuntu 24.04.3 (Noble Numbat)
Kernel: 6.14.0-36-generic
Drivers: Upstream amdgpu (KMS enabled)

Control GPU Testing (Stable GPU's in Same System)

To exclude PSU, motherboard, RAM, OS, kernel, driver, BIOS, and workload
factors, I tested two separate control GPUs in the same hardware:

Control GPU A: PowerColor Radeon RX 7800 XT
Control GPU B: Sapphire Nitro+ Radeon RX 7800 XT

Both 7800 XT cards were tested under:

The same llama.cpp torture workloads

The same gaming workloads (Superposition, Battlefield 2042, Helldivers 2,
Battlefield 6)

The same system, same PSU cables, same PCIe slot, same BIOS config

The same Ubuntu installation and same Windows installation

Result:
Both 7800 XT cards are completely stable.
No crashes, no artefacts, no PCIe dropouts, no SMU/GFXOFF failures.

This confirms the issue is specific to the 7900 XTX GPU family in this
configuration, not the system or software.

This behaviour also occurs under Windows 11, fully updated with latest
Adrenalin drivers.

Crash Behaviour Description

All affected GPUs exhibit the same failure mode:

Display output instantly cuts to black

GPU fans ramp to 100%

The operating system continues running in background

amdgpu reports:

GFX ring timeouts

SDMA ring timeouts

SMU failure to respond

GFXOFF cannot be disabled

The GPU vanishes from the PCIe bus

Driver reset attempts fail with the error:
"GPU reset begin =E2=86=92 device lost from bus =E2=86=92 GPU Recovery Fail=
ed: -19"

A full AC power removal is required to restore partial functionality

After the crash, the GPU often displays visual artefacts and instability ev=
en
after reboot

This post-crash corruption persists until PSU is switched off and the
motherboard fully discharges

In some cases, the system will not power on unless the PSU is in the O
position.

These symptoms are identical on all three cards.

Linux Crash Reproduction (Compute Workload)

The failure is highly reproducible with llama.cpp under full GPU load.
Configuration:

ngl =3D 999

Context =3D 4096

Threads =3D 8

Model: Qwen2.5-7B q4_k_m

Continuous infinite loop prompting generation

Approximate crash times:

First crash: 4 hours

Second crash: 1=E2=80=932 hours

Crashes are guaranteed within a few hours

Glmark2 completes without crashing, suggesting the issue is related to
sustained high-load VRAM/SDMA/GFX conditions, not basic rendering.

Windows Crash Reproduction (Gaming Workloads)

The failure also occurs in normal gaming scenarios on both Linux and Window=
s.

Games and benchmarks that trigger identical failure:

Unigine Superposition (4K Optimized or higher)

Battlefield 2042

Battlefield 6

Dying Light 2

Helldivers 2

The Windows symptoms are identical:

Black screen

Fans to 100%

GPU disappears until full PSU power cycle

Event Viewer shows GPU timeout attempts and reset failures

Post-crash artefacting on secondary display

This eliminates OS-level or application-specific causes.

Key Kernel Log Excerpts

SMU/GFXOFF failures repeatedly logged:
amdgpu: SMU: response:0xFFFFFFFF for index:41
amdgpu: Failed to disable gfxoff

Ring timeouts:
amdgpu: ring gfx timeout
amdgpu: ring sdma1 timeout

Reset failures:
amdgpu: MES failed to respond to msg=3DRESET
amdgpu: GPU reset begin!
amdgpu: device lost from bus!
amdgpu: GPU reset end with ret =3D -19
amdgpu: GPU Recovery Failed: -19

These cascades happen repeatedly until the GPU fully disappears.

Post-Crash Artefacts and PCIe Behaviour

Persistent visual corruption after reboot

Corruption persists until full AC removal

Removing secondary displays does not eliminate artefacts

PCIe bus occasionally behaves unpredictably

System attempts power-on with PSU switch OFF (reported on two GPUs)

Conclusion

Across three separate 7900 XTX GPUs, from different batches and time period=
s,
the same catastrophic failure mode occurs. This failure manifests identical=
ly
across Linux and Windows, gaming and compute workloads, and even after mult=
iple
fresh OS installations.

The issue involves:

GFX/SDMA ring instability

SMU nonresponsiveness

GFXOFF control failure

Complete PCIe device disappearance

Failure of the amdgpu driver to reset the card

Post-crash persistent artefacts

Power state anomalies after crash

This appears to be a firmware-level or architectural issue involving power
management (SMU), GFXOFF, and PCIe bus state transitions under sustained he=
avy
load.

Any assistance or engineering escalation is appreciated.
I can provide full logs, more crash traces, or additional hardware data upon
request.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
