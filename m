Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787A18993ED
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 05:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DCB113829;
	Fri,  5 Apr 2024 03:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CM/IvgEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA37113829
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 03:41:20 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-415523d9824so17660625e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 20:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712288478; x=1712893278; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0x+wIM6WDg13r1MwUaNUerQB3emuGuUK8yHL3j0RpYc=;
 b=CM/IvgEiip+ICKT9ZrpwMiCQwPnVQjI2MuihvPFne0FzJy5Onp77GAJbIQKRI6xFTz
 1kfn0ZGysomJyy2HC2KPEo2zA8tIG/ATLY0HSRDOmlb6Y1/NXhp3RJREdPsg6dXDmsjw
 qQHumcL1JlkiUUJigt/4K948+G2VyOGkhkiiV/kt1V0ESeiaPsoUXlNvqBIPYyk4p4p9
 IXxVLPMDSyMHWB6skpl7+yrmITIaOud2PvNnNliC1HHyK4XmFvdev81kk4UZYfcDpTdI
 i1udcsPo5CbrI/Z7h+XA/6+/NZTgPWUz+Bhd1VXMDiz9u2SXgb1mKHadelBzEDkvPPb8
 2ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712288478; x=1712893278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0x+wIM6WDg13r1MwUaNUerQB3emuGuUK8yHL3j0RpYc=;
 b=qvgaD43ZONde1XnfP71g/fxDsckgBepNFcHoM5/YSsSgMADeBqCbfzbLvxULD7Ql3E
 BV2j2qIhrngbhkto+dGVt1322AOcDatujG4y7RWQFzVBmXeu42+jvrNEhKJoXiZ0IVaR
 I6Hnc1Oz8pio8YkQf7G97pOjmmiNaRSktavDOY2ZvPdKwYZgXtidGe/7UPhWr3U/BJ+B
 LiNtyWg8earsWPxhYicG190kksYpL1KNBUMdXgaLtcopqM22t1cYMXtQz7aEcxn2TinC
 s8OJ/kxlnNqZZKQ2ceXyFekGDM+wsX/evFTavfAXqzru3EKqDOHuB96MLCMwfC7ngDCP
 vkDw==
X-Gm-Message-State: AOJu0YxNkrIJOfE5CGDqe+ftCz3bSM8Jbf1t9NTlU0vZU08MffNhb8sR
 zhkHx6oEuH+qreBoEo7PVSayI6FNzqYbrD+W3jGFP4UR4eELKtgQUt8mo7JDYs8+IMvuHlqSvSk
 ghzLOm3bFo6KJ45t6KX/3BW9hSno=
X-Google-Smtp-Source: AGHT+IGDZkF+6rdqyHx69tLMPPRTw7ItFLr+QlYf2fWNXPJz9sv3gOnsqghIZ38JcYav3r5jtVD7BUqJjBRSvz99KEw=
X-Received: by 2002:adf:f7c2:0:b0:33d:3566:b5c8 with SMTP id
 a2-20020adff7c2000000b0033d3566b5c8mr235163wrq.13.1712288477938; Thu, 04 Apr
 2024 20:41:17 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Apr 2024 13:41:06 +1000
Message-ID: <CAPM=9tzjcdJovUtZWWGG8=Qbv_T6csXfehWrrLr=Lxd0OCsCVA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.9-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Weekly fixes, mostly xe and i915, amdgpu on a week off, otherwise a
nouveau fix for a crash with new vulkan cts tests, and a couple of
cleanups and misc fixes.

Dave.

drm-fixes-2024-04-05:
drm fixes for v6.9-rc3

display:
- fix typos in kerneldoc

prime:
- unbreak dma-buf export for virt-gpu

nouveau:
- uvmm: fix remap address calculation
- minor cleanups

panfrost:
- fix power-transition timeouts

xe:
- Stop using system_unbound_wq for preempt fences,
- Fix saving unordered rebinding fences by attaching
  them as kernel feces to the vm's resv
- Fix TLB invalidation fences completing out of order
- Move rebind TLB invalidation to the ring ops to reduce
  the latency

i915:
- A few DisplayPort related fixes
- eDP PSR fixes
- Remove some VM space restrictions on older platforms
- Disable automatic load CCS load balancing
The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f=
:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-04-05

for you to fetch changes up to 4c8595741b5dd3268d6710545461ee9a7bbde891:

  Merge tag 'drm-intel-fixes-2024-04-04' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes
(2024-04-05 12:32:14 +1000)

----------------------------------------------------------------
drm fixes for v6.9-rc3

display:
- fix typos in kerneldoc

prime:
- unbreak dma-buf export for virt-gpu

nouveau:
- uvmm: fix remap address calculation
- minor cleanups

panfrost:
- fix power-transition timeouts

xe:
- Stop using system_unbound_wq for preempt fences,
- Fix saving unordered rebinding fences by attaching
  them as kernel feces to the vm's resv
- Fix TLB invalidation fences completing out of order
- Move rebind TLB invalidation to the ring ops to reduce
  the latency

i915:
- A few DisplayPort related fixes
- eDP PSR fixes
- Remove some VM space restrictions on older platforms
- Disable automatic load CCS load balancing

----------------------------------------------------------------
Andi Shyti (4):
      drm/i915/gt: Limit the reserved VM space to only the platforms
that need it
      drm/i915/gt: Disable HW load balancing for CCS
      drm/i915/gt: Do not generate the command streamer for all the CCS
      drm/i915/gt: Enable only one CCS for compute workload

Ankit Nautiyal (1):
      drm/i915/dp: Fix the computation for compressed_bpp for DISPLAY < 13

Arun R Murthy (1):
      drm/i915/dp: Remove support for UHBR13.5

Christian Hewitt (1):
      drm/panfrost: fix power transition timeout warnings

Colin Ian King (1):
      drm/nouveau/gr/gf100: Remove second semicolon

Dave Airlie (4):
      nouveau/uvmm: fix addr/range calcs for remap operations
      Merge tag 'drm-misc-fixes-2024-04-04' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-04-04' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2024-04-04' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes

Imre Deak (1):
      drm/i915/dp: Fix DSC state HW readout for SST connectors

Jouni H=C3=B6gander (3):
      drm/i915/psr: Calculate PIPE_SRCSZ_ERLY_TPT value
      drm/i915/psr: Move writing early transport pipe src
      drm/i915/psr: Fix intel_psr2_sel_fetch_et_alignment usage

Matthew Brost (1):
      drm/xe: Use ordered wq for preempt fence waiting

Oleksandr Natalenko (1):
      drm/display: fix typo

Rob Clark (1):
      drm/prime: Unbreak virtgpu dma-buf export

Thomas Hellstr=C3=B6m (4):
      drm/xe: Use ring ops TLB invalidation for rebinds
      drm/xe: Rework rebinding
      drm/xe: Make TLB invalidation fences unordered
      drm/xe: Move vma rebinding to the drm_exec locking loop

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915/mst: Limit MST+DSC to TGL+
      drm/i915/mst: Reject FEC+MST on ICL

 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c  |   4 +-
 drivers/gpu/drm/drm_prime.c                        |   7 +-
 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_display.c       |   9 --
 .../gpu/drm/i915/display/intel_display_device.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  11 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  78 ++++++++++-----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   3 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  17 ++++
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   6 ++
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   9 +-
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c        |  39 ++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h        |  13 +++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   6 ++
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  30 +++++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |   2 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   6 +-
 drivers/gpu/drm/xe/xe_device.c                     |  11 ++-
 drivers/gpu/drm/xe/xe_device_types.h               |   3 +
 drivers/gpu/drm/xe/xe_exec.c                       |  79 ++-------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   5 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |   3 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |   1 -
 drivers/gpu/drm/xe/xe_gt_types.h                   |   7 --
 drivers/gpu/drm/xe/xe_preempt_fence.c              |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                         |  25 ++++-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |  11 +--
 drivers/gpu/drm/xe/xe_sched_job.c                  |  10 ++
 drivers/gpu/drm/xe/xe_sched_job_types.h            |   2 +
 drivers/gpu/drm/xe/xe_vm.c                         | 110 +++++++++++++----=
----
 drivers/gpu/drm/xe/xe_vm.h                         |   8 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |   8 +-
 35 files changed, 340 insertions(+), 197 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
