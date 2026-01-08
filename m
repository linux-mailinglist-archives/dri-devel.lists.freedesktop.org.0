Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97134D03479
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0A110E745;
	Thu,  8 Jan 2026 14:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="KMKLKP8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8922E10E745
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:19:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1767881961; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=h2+JFGhmLcQz/w3uIPnFSpwo4wDWqOW5lJX4zHSi5/iPR0KBs4nWKT2sUS8cwIXDpr0NiPiRX44+uKYh+oQW8vgxF5pCGeYG1wiNJrJnw5Kb2UOJqNPclFRw5qbCSMGn82iH0PUPT77dxtNLPqxj5zpYUXSQLtOWz1BvKKiYn3E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1767881961;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=u2HHhSCTGq8FUTPvQ7yoPtPrDHshpGQ3NEcCL9UO7CY=; 
 b=QB6Kz5T8ewTJNKYP0E2egRkHmYQ831j/Cs0a0lrftw6tIdkEHXe0gwtuj/Srp9B6Lpdi0pJ8mRWJIUeFJvxscrVN8lluwVlI9fMmV104RoFoFgJ8XMOindt9+N4aQRzz4o5XX0oPAO6Z8N1NJhCYObyOWh1RGlzIKDYEn6FFGOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767881961; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=u2HHhSCTGq8FUTPvQ7yoPtPrDHshpGQ3NEcCL9UO7CY=;
 b=KMKLKP8O1kOjkXnGpnvfK4RZ2UN7oAwVrsFyTX6MYjdv8RxQQ4vAeJFZFBQ2SaMR
 xy1hqmRXrsqMD/ibCFWP4umhYN1DHT7sx8g3MNf1+fhxWwIjkvEQ++zKSVZAYrcea7I
 QoK/0656PRwhLeJOp8jgB3YQQe6+f/mBFfqYptPM=
Received: by mx.zohomail.com with SMTPS id 1767881959355328.55227071358524;
 Thu, 8 Jan 2026 06:19:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v7 0/4] Add a few tracepoints to panthor
Date: Thu, 08 Jan 2026 15:19:05 +0100
Message-Id: <20260108-panthor-tracepoints-v7-0-afeae181f74a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANm8X2kC/33Qy07EIBQG4FdpWItyK5dZ+R7GBYVTSzJTOhQbz
 aTvLu24aCLjivwk/8fh3NAMKcCMTs0NJVjCHOJYgnpqkBvs+AE4+JIRI6yljHA82TEPMeGcrIM
 phjHPWGhte2K8kKBQaU4J+vC1q2/v95zg+lnwfL9EnZ0Bu3i5hHxqfLrgHKaX3xNtlSHMOabvf
 a6F7p1/R1goJlgr6rShCogWry6ez7aLyT6Xd3ZzYQeHkrrDilMiA2Y660lfc/jRoXWHF8cw4Yz
 nrbStqzni6Ki6IzaHSqql67QnvOa0B4c9mKfd9qMN9EpT2Xpdc+TRebBnWRzPnTEaoGh//rWu6
 w+LCfGVVQIAAA==
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
      drm/panthor: Extend IRQ helpers for mask modification/restoration
      drm/panthor: Rework panthor_irq::suspended into panthor_irq::state
      drm/panthor: Add tracepoint for hardware utilisation changes
      drm/panthor: Add gpu_job_irq tracepoint

 drivers/gpu/drm/panthor/panthor_device.h |  94 ++++++++++--
 drivers/gpu/drm/panthor/panthor_fw.c     |  16 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  30 +++-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   2 +
 drivers/gpu/drm/panthor/panthor_hw.c     |  62 ++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |   8 +
 drivers/gpu/drm/panthor/panthor_mmu.c    | 247 ++++++++++++++++---------------
 drivers/gpu/drm/panthor/panthor_pwr.c    |   2 +-
 drivers/gpu/drm/panthor/panthor_trace.h  |  86 +++++++++++
 9 files changed, 407 insertions(+), 140 deletions(-)
---
base-commit: d7d19ebd62e1a312e67f4484df9a4e2b407d93d0
change-id: 20251203-panthor-tracepoints-488af09d46e7

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

