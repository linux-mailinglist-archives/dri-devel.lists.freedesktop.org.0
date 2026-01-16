Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E12BD3165C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F0D10E889;
	Fri, 16 Jan 2026 12:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LOnRfZz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBEB10E889
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768568268; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=m6cOo2TORji1gsZo/dX7/7XSRASdOPrSld6B5y7IXsnuGfuvjhefrt5wg4Y6r3qwMnDLSD5W5DAaFuL+8CiCt7e5Z6PUgDNOEUi683pNX8jRZMvosPGvRsqmdgzf+fNZ+hjnGpD03akjwLGSctlrOBj3++pCK6Urerq6KfpCGYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768568268;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HQT3bNsoF3xoEMPqwuznmAEVwTUjIXwwrc/aKLVG67c=; 
 b=J/IOBzaIxkvf9VObjsJ0e/ZjX9DxsZKqExjtWvHQstgwUb1JhzUVjdKtAFJarJeXQBib3awFfCWeszWwUYov9HRVplvl+q08khK6VHjXweWiIXSyNogxpeVHOUoonG3t739FzA1tWJd96a/qDO89QYKbB2psoNKuzuJXbW2DDGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768568268; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=HQT3bNsoF3xoEMPqwuznmAEVwTUjIXwwrc/aKLVG67c=;
 b=LOnRfZz30+Y7TFJ0ceShHDKEkxzjJLUl+mnCpW8EYdfU4xqSVPlzv492p7yTMcuR
 JdwE4KhubeUGB2ImkjwQptOpsmnMDD2sth9vVtzpEDgtE57V15dpmNtSNm7IJLyQ7uR
 4SCU3DCSpS0Xr6wcoGy1yzyKeI/wI+baUIJnBD8g=
Received: by mx.zohomail.com with SMTPS id 1768568265722188.42361689404083;
 Fri, 16 Jan 2026 04:57:45 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v10 0/4] Add a few tracepoints to panthor
Date: Fri, 16 Jan 2026 13:57:29 +0100
Message-Id: <20260116-panthor-tracepoints-v10-0-d925986e3d1b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QwW7DIAwG4FepOI8NAwHT095j2oGAsyK1SUaya
 FPVdx9pNynS6E7Ilvzx22c2UU40sf3uzDItaUpDXwoQDzsWDr5/I55iaTApZANSKD76fj4Mmc/
 ZBxqH1M8T14i+Ey5qQ5aVyTFTlz6v7Mvrrc70/lH0+dZkrZ+Ih+F0SvN+F/OJz2l8+nnZOnJI0
 zzkr2uwBa4z/0ZYgAuOFgI6sCRQP4fhePTtkP1j+edqLnLjgKg7sjillCRd66Poao7aOlB3VHG
 c1MFF1RjfhJqjt46tO3p1wACa0GIUquY0G0feydOs90FHnUUwTcSaY7bOnTub4kQVnEOiolX3s
 r+OESCw7tj1zh15AoTOal9zcOOArDtYHKNKkFZLiFLWHLd1mrrjikOgSHc2Coh/9rpcLt+by1C
 DLgMAAA==
X-Change-ID: 20251203-panthor-tracepoints-488af09d46e7
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

This series adds two tracepoints to panthor.

The first tracepoint allows for inspecting the power status of the
hardware subdivisions, e.g. how many shader cores are powered on. This
is done by reading three hardware registers when a certain IRQ fires.

The second tracepoint instruments panthor's job IRQ handler. This is
more useful than the generic interrupt tracing functionality, as the
tracepoint has the events bit mask included, which indicates which
command stream group interfaces triggered the interrupt.

To test the tracepoints, the following can be used:

  :~# echo 1 > /sys/kernel/tracing/events/panthor/gpu_power_status/enable
  :~# echo 1 > /sys/kernel/tracing/events/panthor/gpu_job_irq/enable
  :~# echo 1 > /sys/kernel/tracing/tracing_on
  :~# cat /sys/kernel/tracing/trace_pipe

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v10:
- Start processing phase in raw_irq_handler (Boris)
- enable/disable_events: Only write mask contents in ACTIVE state
  (Boris)
- Elaborate on what mask_lock protects in comment (Boris)
- nb: checkpatch reports unnecessary line continuations in the macros
  at the end of the comment blocks. These warnings are false-positives,
  the line continuations are necessary.
- Link to v9: https://lore.kernel.org/r/20260115-panthor-tracepoints-v9-0-e13e4f7d01dc@collabora.com

Changes in v9:
- Rebase onto drm-tip 2026y-01m-14d-17h-09m-04s
- Move the mask to pirq->mask change in the suspended refactor patch to
  the follow-up patch
- Move the INT_MASK restoration changes in the suspended refactor patch
  to the follow-up patch
- Move panthor_irq::mask_lock member right below the mask member
- panthor/mmu: Remove the enable_events calls before resume, as they're
  redundant
- panthor/mmu: Rework the AS fault clearing logic. Drop the spurious
  disable_events in panthor_vm_active, but use
  disable_events/enable_events in as_disable/as_enable respectively. This
  requires doing a forward declaration of the panthor_mmu_irq_handler to
  get a definition of the helpers before it itself is defined. This
  works out great, because it means I also no longer have to move the
  entire panthor_vm_active function down some.
- Drop an accidentally added redundant empty line
- Link to v8: https://lore.kernel.org/r/20260112-panthor-tracepoints-v8-0-63efcb421d22@collabora.com

Changes in v8:
- Reorder panthor_irq::state patch to be before the new mask
  modification helpers. The full set of states was kept (rather than
  just active/suspended) as they don't hurt and make the follow-up patch
  more concise in scope.
- Also bail out on STATE_SUSPENDING in irq_raw_handler
- Job irq: initialize start to 0 and don't emit a tracepoint if it is 0,
  to fix passing an uninitialised stack variable to userspace if the
  tracepoint was enabled while the handler was running
- Link to v7: https://lore.kernel.org/r/20260108-panthor-tracepoints-v7-0-afeae181f74a@collabora.com

Changes in v7:
- Get rid of old resume IRQ helper by reworking code throughout panthor,
  and make what used to be resume_restore in v6 the new resume.
- Rename mask_enable/mask_disable to enable_events/disable_events.
- Turn panthor_irq::suspended into a multi-state value, and utilise it
  in the IRQ helpers as appropriate.
- Link to v6: https://lore.kernel.org/r/20251223-panthor-tracepoints-v6-0-d3c998ee9efc@collabora.com

Changes in v6:
- Read the mask member into a local while holding the lock in
  irq_threaded_handler.
- Drop the lock before entering the while loop, letting the threaded
  handler function run without holding a spinlock
- Re-acquire the spinlock at the end of irq_threaded_handler, OR'ing the
  mask register's contents with the mask local ANDed by the member. This
  avoids stomping over any other modified bits, or restoring ones that
  have been disabled in the meantime.
- Link to v5: https://lore.kernel.org/r/20251221-panthor-tracepoints-v5-0-889ef78165d8@collabora.com

Changes in v5:
- Change the panthor IRQ helpers to guard the mask member and register
  with a spinlock. The rationale behind using a spinlock, rather than
  some constellation of atomics, is that we have to guarantee mutual
  exclusion for state beyond just a single value, namely both the register
  write, and writes to/reads from the mask member, including
  reads-from-member-writes-to-register. Making the mask atomic does not do
  anything to avoid concurrency issues in such a case.
- Change the IRQ mask member to not get zeroed when suspended. It's
  possible something outside of the IRQ helpers depends on this
  behaviour, but I'd argue the code should not access the mask outside
  of the IRQ helpers, as it'll do so with no lock taken.
- Drop the mask_set function, but add mask_enable/mask_disable helpers
  to enable/disable individual parts of the IRQ mask.
- Add a resume_restore IRQ helper that does the same thing as resume,
  but does not overwrite the mask member. This avoids me having to
  refactor whatever panthor_mmu.c is doing with that poor mask member.
- Link to v4: https://lore.kernel.org/r/20251217-panthor-tracepoints-v4-0-916186cb8d03@collabora.com

Changes in v4:
- Include "panthor_hw.h" in panthor_trace.h instead of duplicating the
  reg/unreg function prototypes.
- Link to v3: https://lore.kernel.org/r/20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com

Changes in v3:
- Drop PWRFEATURES patch, as this register is no longer needed by this
  series.
- Eliminate the rt_on field from the gpu_power_status register, as per
  Steven Price's feedback.
- Make gpu_power_status tracepoint reg/unreg functions generic across
  hardware generations by wrapping a hw op in panthor_hw.c.
- Reimplement the <= v13 IRQ mask modification functions as the new hw
  ops functions. v14 can add its own ops in due time.
- Link to v2: https://lore.kernel.org/r/20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com

Changes in v2:
- Only enable the GPU_IRQ_POWER_CHANGED_* IRQ mask bits when the
  tracepoint is enabled. Necessitates the new irq helper patch.
- Only enable the GPU_IRQ_POWER_CHANGED_* IRQ mask bits if the hardware
  architecture is <= v13, as v14 changes things.
- Use _READY instead of _PWRACTIVE registers, and rename the tracepoint
  accordingly.
- Also read the status of the ray tracing unit's power. This is a global
  flag for all shader cores, it seems. Necessitates the new register
  definition patch.
- Move the POWER_CHANGED_* check to earlier in the interrupt handler.
- Also listen to POWER_CHANGED, not just POWER_CHANGED_ALL, as this
  provides useful information with the _READY registers.
- Print the device name in both tracepoints, to disambiguate things on
  systems with multiple Mali GPUs.
- Document the gpu_power_status tracepoint, so the meaning of the fields
  is made clear.
- Link to v1: https://lore.kernel.org/r/20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com

---
Nicolas Frattaroli (4):
      drm/panthor: Rework panthor_irq::suspended into panthor_irq::state
      drm/panthor: Extend IRQ helpers for mask modification/restoration
      drm/panthor: Add tracepoint for hardware utilisation changes
      drm/panthor: Add gpu_job_irq tracepoint

 drivers/gpu/drm/panthor/panthor_device.h | 107 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/panthor/panthor_fw.c     |  16 ++++-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  30 ++++++++-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   2 +
 drivers/gpu/drm/panthor/panthor_hw.c     |  62 ++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |   8 +++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  47 +++++++-------
 drivers/gpu/drm/panthor/panthor_pwr.c    |   2 +-
 drivers/gpu/drm/panthor/panthor_trace.h  |  86 +++++++++++++++++++++++++
 9 files changed, 318 insertions(+), 42 deletions(-)
---
base-commit: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d
change-id: 20251203-panthor-tracepoints-488af09d46e7

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

