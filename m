Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48E8CE5264
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 16:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E587511AE46;
	Sun, 28 Dec 2025 15:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lhjonline.com header.i=@lhjonline.com header.b="cr6HQzHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Sun, 28 Dec 2025 14:53:31 UTC
Received: from zmailpro.com (zmailpro.com [174.129.240.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDFE10E111
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 14:53:31 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zmailpro.com (Postfix) with ESMTP id 310AF8A5832;
 Sun, 28 Dec 2025 09:46:57 -0500 (EST)
Received: from zmailpro.com ([127.0.0.1])
 by localhost (zmailpro.com [127.0.0.1]) (amavis, port 10032) with ESMTP
 id X-5gcTZ1Re1c; Sun, 28 Dec 2025 09:46:56 -0500 (EST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zmailpro.com (Postfix) with ESMTP id 0A0DD8A582F;
 Sun, 28 Dec 2025 09:46:56 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmailpro.com 0A0DD8A582F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lhjonline.com;
 s=22187CEA-9A4A-11E6-98C3-D49722DE3479; t=1766933216;
 bh=cq8Ma3pDucG8tfbvKhgnyacaFk2lkPHg5gWE1oWTbzQ=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=cr6HQzHSDJwBjc6nZpTb61T/AS1be6i7iu1TpkyFRsCyhkC4v23PjzBHVfjf2vpoM
 GL6lqrBA493YVR5l86JN2AjVn5qWopNl92h2fXdADNlsnkkdI6ZMT82UfnEKZMey3J
 wO4OcJN+jEqEgh2fwb6rJDjfQ/ZJSsY3AFFYXWQjcJbybPFYWVj7anlwf2KDEqCWdS
 V+veevYcd3De/vH/29zQDLIINJIZANU6vFTcO1lL/B6L+OV9G6+rFdndZ/qhlVgDt2
 G1FyudyH2A6+OZWzz+yKv2bwU4Q36YUtZvdgI9JyTDI8qThoGnqdrE0PsawswNFH6m
 UOn7wL/CqI0Cw==
X-Virus-Scanned: amavis at zmailpro.com
Received: from zmailpro.com ([127.0.0.1])
 by localhost (zmailpro.com [127.0.0.1]) (amavis, port 10026) with ESMTP
 id RXPJNwWJfuef; Sun, 28 Dec 2025 09:46:55 -0500 (EST)
Received: from zmailpro.com (zmailpro.com [174.129.240.60])
 by zmailpro.com (Postfix) with ESMTP id D617E8A582D;
 Sun, 28 Dec 2025 09:46:55 -0500 (EST)
Date: Sun, 28 Dec 2025 09:46:55 -0500 (EST)
From: Harris Landgarten <harris1@lhjonline.com>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <1387191893.132722.1766933215320.JavaMail.zimbra@lhjonline.com>
Subject: [BUG] amdgpu gfx1150: gfxhub page fault (CPC) triggers
 unrecoverable reset on 6.19-rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [174.129.240.60]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC144
 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Index: y8Y2m+CmkGzSKnI5Dwh93N83atv+/A==
Thread-Topic: amdgpu gfx1150: gfxhub page fault (CPC) triggers unrecoverable
 reset on 6.19-rc2
X-Mailman-Approved-At: Sun, 28 Dec 2025 15:56:47 +0000
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

Hello amd-gfx,

I am reporting a reproducible amdgpu failure on gfx1150 (Strix / Radeon 880M/890M) observed on Linux 6.19-rc2. The issue appears to be a real GPU VM / illegal access fault that reliably escalates into an unrecoverable reset.

This is not related to ROCm or user compute workloads.

---

Hardware:

* APU: AMD Strix (gfx1150)
* GPU: Radeon 880M / 890M (integrated)
* SMU: smu_v14_0_0
* Platform: x86_64 desktop
* Firmware: standard linux-firmware (no custom blobs)

Kernel:

* Linux 6.19.0-rc2
* amdgpu built as module
* DRM AMD DC enabled
* Default kernel configuration for modern AMD APU (no unusual options)

---

Observed failure (6.19-rc2):

During a long-running but otherwise normal graphics/compute workload, the kernel logs the following:

```
amdgpu 0000:c5:00.0: amdgpu: [gfxhub] page fault (src_id:0 ring:153 vmid:0 pasid:0)
amdgpu 0000:c5:00.0: amdgpu:   in page starting at address 0x0000000000000000 from client 10
amdgpu 0000:c5:00.0: amdgpu: GCVM_L2_PROTECTION_FAULT_STATUS:0x00000B32
amdgpu 0000:c5:00.0: amdgpu:          Faulty UTCL2 client ID: CPC (0x5)
amdgpu 0000:c5:00.0: amdgpu:          WALKER_ERROR: 0x1
amdgpu 0000:c5:00.0: amdgpu:          PERMISSION_FAULTS: 0x3
amdgpu 0000:c5:00.0: amdgpu:          MAPPING_ERROR: 0x1
```

Shortly after, MES stops responding:

```
amdgpu: MES failed to respond to msg=MISC (WAIT_REG_MEM)
amdgpu: failed to reg_write_reg_wait
```

The driver then attempts recovery/reset.


Reset / recovery behavior:

On gfx1150, recovery is not survivable:

* VPE queue reset fails
* Driver falls back to MODE2 reset
* SMU resumes successfully
* MES fails to respond when re-adding queues
* gfx_v11_0 resume fails with -110 (ETIMEDOUT)

Example reset log excerpt (also reproducible on 6.17.x):

```
amdgpu: GPU reset begin!
amdgpu: VPE queue reset failed
amdgpu: MODE2 reset
amdgpu: SMU is resumed successfully
amdgpu: MES failed to respond to msg=ADD_QUEUE
amdgpu: resume of IP block <gfx_v11_0> failed -110
amdgpu: GPU reset end with ret = -110
```

In practice this leaves the system unusable and often requires a power cycle.

---

Additional notes:

* This is reproducible on an otherwise idle system using `amd-smi reset --gpureset`.
* The same reset failure occurs on 6.17.10, so reset/recovery for gfx1150 appears incomplete independent of the 6.19 regression.
* 6.19-rc2 increases the frequency of hitting recovery due to the CPC/gfxhub illegal access fault.
* This report focuses on the *trigger* (illegal access / page fault), not the reset issue itself.

---

Summary:

* The gfxhub CPC page fault at VA 0x0 appears to be a real bug in 6.19-rc2.
* Any recovery attempt on gfx1150 currently escalates into an unrecoverable state.
* Avoiding recovery (e.g. by disabling CWSR) avoids crashes but masks the underlying fault.

Please let me know if additional traces, bisect testing, or instrumentation would be helpful.

Thank you for your time.

Best regards,
Harris Landgarten


Harris Landgarten
516 643-1286
