Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472595D54A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 20:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831A210E05A;
	Fri, 23 Aug 2024 18:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jkj2LV08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A6C10E0AE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 18:27:48 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5334b0e1a8eso2912561e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724437667; x=1725042467; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=arxEqM4iPY0nUgAVDsfW5DaV8kH/NilIDpYqT7ZQlQ8=;
 b=Jkj2LV08xHbPSsSxR4SlyzPbjHR2l1XzR0sjLuWbucJ8q0+Kop+1mVNIYs0dIY4VRs
 doUxGaqKq+/7UgDFUETQmKbBpN3HXfdlp28muaxC0+esKi6E76yyxjafRNzL1cNU/cil
 WkK9hMuQA+K3EyaUurHFEhOP009kgNemMPNWQh/XT/dyeWpUwUgZzw9p6nzY/4Hz7Jzl
 FaDzS/OS1TqTvdWNMBaPHBhvKG0yAUxS2/SGgFRwkATAaZH0cUZhF8N2wRsX0w7FhHiq
 FqzUXDs2eryrJTRPbKXO2Giz4uduh9Wf55qur0tbNKcGA0GBrcExDTiIudifcbH5POd4
 SWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724437667; x=1725042467;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=arxEqM4iPY0nUgAVDsfW5DaV8kH/NilIDpYqT7ZQlQ8=;
 b=UDMmD9F/SRBuTOMtRMIhap9cDgp17xDsSwTI3LlWPMJmtu6S8UEzoXube4c+AZysGK
 N6Gsc2Yed8cPMlYIb1FbU55iXlFiMOkDTCuvyDiMUs7Ov5svrVpKdkLKaKc+xnMY++Qw
 beoqdkAolJir+3maEOtVdX4C7U/TY5j13H7SWIVt8XBSDTcjTH0p2BS+FPgS0TbUEbwB
 mPxaj/qY9Q0rmN9HkLx0pBgJvbAbcsmqw8lblEseO7nhOl+Je3y1EaIm748dCEA8p/s3
 ECjC+hBXm0pcoo29F/IVBHdWncPjW+HX+WmLj6CyEfHw4KhHifKKpCI0oFRfnSeRLcyg
 5MjA==
X-Gm-Message-State: AOJu0YwcMfLWHV+KBXCC80Vw6s6YIgfUApby3WJarIil8+r6RqQVHnAO
 Z9Z+EBxE9bMAi175z4epP0aMUj2zpPGUAc2duKGQsMEguND0spqhSHhjO3KLw7UzJmxWSzHLOXW
 U5fsYHpIr0siEddGyqRYZjISAzq8=
X-Google-Smtp-Source: AGHT+IEJb+8tF7tY/g8yHvdoply7Da2ztQdeHYo2OEl1kEfnlapB254+UWR94w8xoPNOngUvXYvA6RQAXznRl4L7ysI=
X-Received: by 2002:a05:6512:33ce:b0:52c:d6d7:9dd0 with SMTP id
 2adb3069b0e04-5343877997cmr2208217e87.20.1724437666671; Fri, 23 Aug 2024
 11:27:46 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 24 Aug 2024 04:27:35 +1000
Message-ID: <CAPM=9tw7_X_1Bhji+DNJXK+940VH2MwgLPsvjX72doJkKt2SHQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.11-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Linus,

Weekly fixes. xe and msm are the major groups, with
amdgpu/i915/nouveau having smaller bits. xe has a bunch of hw
workaround fixes that were found to be missing, so that is why there
are a bunch of scattered fixes, and one larger one. But overall size
doesn't look too out of the ordinary.

Thanks,
Dave.

drm-fixes-2024-08-24:
drm fixes for 6.11-rc5

msm:
- virtual plane fixes
-    drop yuv on hw where not supported
-    csc vs yuv format fix
-    rotation fix
- fix fb cleanup on close
- reset phy before link training
- fix visual corruption at 4K
- fix NULL ptr crash on hotplug
- simplify debug macros
- sc7180 fix
- adreno firmware name error path fix

amdgpu:
- GFX10 firmware loading fix
- SDMA 5.2 fix
- Debugfs parameter validation fix
- eGPU hotplug fix

i915:
- fix HDCP timeouts

nouveau:
- fix SG_DEBUG crash

xe:
- Fix OA format masks which were breaking build with gcc-5
- Fix opregion leak (Lucas)
- Fix OA sysfs entry (Ashutosh)
- Fix VM dma-resv lock (Brost)
- Fix tile fini sequence (Brost)
- Prevent UAF around preempt fence (Auld)
- Fix DGFX display suspend/resume (Maarten)
- Many Xe/Xe2 critical workarounds (Auld, Ngai-Mint, Bommu, Tejas, Daniele)
- Fix devm/drmm issues (Daniele)
- Fix missing workqueue destroy in xe_gt_pagefault (Stuart)
- Drop HW fence pointer to HW fence ctx (Brost)
- Free job before xe_exec_queue_put (Brost)
The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208399:

  Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-24

for you to fetch changes up to 76f461867800fa9421d26a70a1640eed55dff0cd:

  Merge tag 'drm-xe-fixes-2024-08-22' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-08-23 09:12:16 +1000)

----------------------------------------------------------------
drm fixes for 6.11-rc5

msm:
- virtual plane fixes
-    drop yuv on hw where not supported
-    csc vs yuv format fix
-    rotation fix
- fix fb cleanup on close
- reset phy before link training
- fix visual corruption at 4K
- fix NULL ptr crash on hotplug
- simplify debug macros
- sc7180 fix
- adreno firmware name error path fix

amdgpu:
- GFX10 firmware loading fix
- SDMA 5.2 fix
- Debugfs parameter validation fix
- eGPU hotplug fix

i915:
- fix HDCP timeouts

nouveau:
- fix SG_DEBUG crash

xe:
- Fix OA format masks which were breaking build with gcc-5
- Fix opregion leak (Lucas)
- Fix OA sysfs entry (Ashutosh)
- Fix VM dma-resv lock (Brost)
- Fix tile fini sequence (Brost)
- Prevent UAF around preempt fence (Auld)
- Fix DGFX display suspend/resume (Maarten)
- Many Xe/Xe2 critical workarounds (Auld, Ngai-Mint, Bommu, Tejas, Daniele)
- Fix devm/drmm issues (Daniele)
- Fix missing workqueue destroy in xe_gt_pagefault (Stuart)
- Drop HW fence pointer to HW fence ctx (Brost)
- Free job before xe_exec_queue_put (Brost)

----------------------------------------------------------------
Abhinav Kumar (4):
      drm/msm/dp: fix the max supported bpp logic
      drm/msm/dpu: move dpu_encoder's connector assignment to atomic_enable()
      drm/msm/dp: reset the link phy params before link training
      drm/msm: fix the highest_bank_bit for sc7180

Alex Deucher (2):
      drm/amdgpu/sdma5.2: limit wptr workaround to sdma 5.2.1
      drm/amdgpu: fix eGPU hotplug regression

Ashutosh Dixit (1):
      drm/xe/observation: Drop empty sysctl table entry

Bommu Krishnaiah (1):
      drm/xe/xe2lpg: Extend workaround 14021402888

Candice Li (1):
      drm/amdgpu: Validate TA binary size

Daniele Ceraolo Spurio (3):
      drm/xe: fix WA 14018094691
      drm/xe: use devm instead of drmm for managed bo
      drm/xe/uc: Use devm to register cleanup that includes exec_queues

Dave Airlie (6):
      nouveau/firmware: use dma non-coherent allocator
      Merge tag 'drm-msm-fixes-2024-08-19' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'amd-drm-fixes-6.11-2024-08-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2024-08-22' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-08-22' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-08-22' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Dmitry Baryshkov (5):
      drm/msm/dpu: don't play tricks with debug macros
      drm/msm/dpu: cleanup FB if dpu_format_populate_layout fails
      drm/msm/dpu: limit QCM2290 to RGB formats only
      drm/msm/dpu: relax YUV requirements
      drm/msm/dpu: take plane rotation into account for wide planes

Geert Uytterhoeven (1):
      drm/xe/oa/uapi: Make bit masks unsigned

Lucas De Marchi (1):
      drm/xe: Fix opregion leak

Maarten Lankhorst (1):
      drm/xe/display: Make display suspend/resume work on discrete

Matthew Auld (2):
      drm/xe: prevent UAF around preempt fence
      drm/xe/bmg: implement Wa_16023588340

Matthew Brost (4):
      drm/xe: Move VM dma-resv lock from xe_exec_queue_create to
__xe_exec_queue_init
      drm/xe: Fix tile fini sequence
      drm/xe: Drop HW fence pointer to HW fence ctx
      drm/xe: Free job before xe_exec_queue_put

Ngai-Mint Kwan (1):
      drm/xe/xe2lpm: Extend Wa_16021639441

Rob Clark (1):
      drm/msm/adreno: Fix error return if missing firmware-name

Stuart Summers (1):
      drm/xe: Fix missing workqueue destroy in xe_gt_pagefault

Suraj Kandpal (1):
      drm/i915/hdcp: Use correct cp_irq_count

Tejas Upadhyay (3):
      drm/xe/xe2: Make subsequent L2 flush sequential
      drm/xe/xe2: Add Wa_15015404425
      drm/xe/xe2hpg: Add Wa_14021821874

Yang Wang (1):
      drm/amdgpu: fixing rlc firmware loading failure issue

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c     |  3 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c         |  5 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c         | 18 +++++----
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c   |  4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        | 14 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 20 ++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c               |  2 +
 drivers/gpu/drm/msm/dp/dp_panel.c              | 19 ++++-----
 drivers/gpu/drm/msm/msm_mdss.c                 |  2 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c   |  9 +++--
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c       |  6 +++
 drivers/gpu/drm/xe/Makefile                    |  2 +
 drivers/gpu/drm/xe/display/xe_display.c        | 28 ++++++++++++-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c     |  8 ++++
 drivers/gpu/drm/xe/display/xe_fb_pin.c         |  3 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h           |  9 +++++
 drivers/gpu/drm/xe/xe_bo.c                     |  6 +--
 drivers/gpu/drm/xe/xe_device.c                 | 32 +++++++++++++++
 drivers/gpu/drm/xe/xe_device.h                 |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c             | 24 ++++++-----
 drivers/gpu/drm/xe/xe_exec_queue_types.h       |  2 -
 drivers/gpu/drm/xe/xe_gsc.c                    |  8 ++--
 drivers/gpu/drm/xe/xe_gt.c                     | 55 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_pagefault.c           | 18 ++++++++-
 drivers/gpu/drm/xe/xe_gt_types.h               |  6 +++
 drivers/gpu/drm/xe/xe_guc_submit.c             |  4 +-
 drivers/gpu/drm/xe/xe_hw_fence.c               |  9 +++--
 drivers/gpu/drm/xe/xe_hw_fence_types.h         |  7 +++-
 drivers/gpu/drm/xe/xe_mmio.c                   | 28 ++++++++++++-
 drivers/gpu/drm/xe/xe_observation.c            |  1 -
 drivers/gpu/drm/xe/xe_pat.c                    | 11 +++++-
 drivers/gpu/drm/xe/xe_pm.c                     | 11 +++---
 drivers/gpu/drm/xe/xe_preempt_fence.c          |  3 +-
 drivers/gpu/drm/xe/xe_preempt_fence_types.h    |  2 +
 drivers/gpu/drm/xe/xe_sched_job.c              |  3 +-
 drivers/gpu/drm/xe/xe_trace.h                  |  2 +-
 drivers/gpu/drm/xe/xe_wa.c                     | 18 +++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules             |  1 +
 include/uapi/drm/xe_drm.h                      |  8 ++--
 43 files changed, 334 insertions(+), 90 deletions(-)
