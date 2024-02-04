Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644EB8489D6
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 01:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA48910F404;
	Sun,  4 Feb 2024 00:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TXu2unuo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED64C10F49B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 00:05:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E51A7CE095A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 00:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DCAFC43142
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 00:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707005095;
 bh=QC103bQQMZDfwGatEcZtHNnynQR5JJ3BQqfs8EcXzrs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TXu2unuojqfJkKXRwExY0mqZdaUleExQmlVnGy4TVyaLUpzT4RjpfTcvm/tsh4S9M
 ZEJs+Fg6AeKoiKU9vZZL3QajzTf+cEvKaKWytv8bk7gOEjZERbYA9UQxe+xPOeSdCO
 92/tOVux0oTNulOd/WEPK18Qur/el2xJgPBaMCGp7GIUC6No+536zY9WIp9F+6beRB
 8/zT4DGzUPSQMF0GgHu3PVrr5i3gCX6aeFydkYIp0iPeoVwfv/oNYIG9g5AewaI9Kc
 uuHinMuTKqGObZYqyabyw0vHXF/TCyTkQCMOsMS5lNRrd5KsMA1u8+t37cJqU+BkjQ
 aQpQwQXT7767Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4FE08C53BD3; Sun,  4 Feb 2024 00:04:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sun, 04 Feb 2024 00:04:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: fichterfrancis@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-aGZCOv6GOb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

fichterfrancis@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fichterfrancis@gmail.com

--- Comment #34 from fichterfrancis@gmail.com ---
Hello,

With my mini pc ryzen 5 6600H (six core)

processor       : 11
vendor_id       : AuthenticAMD
cpu family      : 25
model           : 68
model name      : AMD Ryzen 5 6600H with Radeon Graphics
stepping        : 1
microcode       : 0xa404102
cpu MHz         : 400.000
cache size      : 512 KB
physical id     : 0
siblings        : 12
core id         : 5
cpu cores       : 6
apicid          : 11
initial apicid  : 11
fpu             : yes
fpu_exception   : yes
cpuid level     : 16
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb
rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmpe=
rf
rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 x2apic movbe popcnt=
 aes
xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a
misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core
perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 hw_pstate ssbd mba ib=
rs
ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a rdse=
ed
adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves cqm_llc
cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr rdpru
wbnoinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushby=
asid
decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif v_spec_ctrl
umip pku ospke vaes vpclmulqdq rdpid overflow_recov succor smca fsrm
bugs            : sysret_ss_attrs spectre_v1 spectre_v2 spec_store_bypass s=
rso
bogomips        : 6587.56
TLB size        : 2560 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm hwpstate cpb eff_freq_ro [13] [14]


cat /etc/debian_version=20
trixie/sid

cat /etc/debian_version=20
trixie/sid

Feb  3 21:38:50 debser kernel: [drm] PCIE GART of 1024M enabled (table at
0x000000F4FFC00000).
Feb  3 21:38:50 debser kernel: [drm] PSP is resuming...
Feb  3 21:38:50 debser kernel: [drm] reserve 0xa00000 from 0xf4fe000000 for=
 PSP
TMR
Feb  3 21:38:51 debser kernel: [drm] DMUB hardware initialized:
version=3D0x0400003C
Feb  3 21:38:51 debser kernel: [drm] kiq ring mec 2 pipe 1 q 0
Feb  3 21:38:51 debser kernel: [drm] VCN decode and encode initialized
successfully(under DPG Mode).
Feb  3 21:38:51 debser kernel: [drm] JPEG decode initialized successfully.
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip Feb  3 21:38:50 debser kernel: [d=
rm]
PCIE GART of 1024M enabled (table at 0x000000F4FFC00000).
Feb  3 21:38:50 debser kernel: [drm] PSP is resuming...
Feb  3 21:38:50 debser kernel: [drm] reserve 0xa00000 from 0xf4fe000000 for=
 PSP
TMR
Feb  3 21:38:51 debser kernel: [drm] DMUB hardware initialized:
version=3D0x0400003C
Feb  3 21:38:51 debser kernel: [drm] kiq ring mec 2 pipe 1 q 0
Feb  3 21:38:51 debser kernel: [drm] VCN decode and encode initialized
successfully(under DPG Mode).
Feb  3 21:38:51 debser kernel: [drm] JPEG decode initialized successfully.
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:46:14 debser kernel: ACPI: bus type drm_connector registered
Feb  3 21:46:14 debser kernel: [drm] amdgpu kernel modesetting enabled.
scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:38:51 debser kernel: [drm] Skip scheduling IBs!
Feb  3 21:46:14 debser kernel: ACPI: bus type drm_connector registered
Feb  3 21:46:14 debser kernel: [drm] amdgpu kernel modesetting enabled.

Freeze screen and system at 21:38:51, in this time i am with firefox esr.

for info

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
