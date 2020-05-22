Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1561DDD0D
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 04:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDF16E2BC;
	Fri, 22 May 2020 02:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C726E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 02:16:54 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id g79so3862962ybf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 19:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Q3HL20z/j0aBZhlvqvTrruI95/oqWUTL76//Jbu5y9w=;
 b=AaB/OMuLkcLyqwam3g2vnqtYO5go42OwQevE3kb6pEtQQSbUHTzPx8kSZpAuki3Fnk
 Y5x8jX81muL4+yHj0eWpBHSqawynr5p6vCgxLMT3eS0ENQ2wvbzrhkcuDIVbopKkHOXU
 SWkPMCc3zuNOcginVvqKPHMtFec9gWydfTjhlJTRkHdyYYzuHHvO9eOB23TC3/JpUN7y
 EBSeoFOy5KCMBXWjk/1wmSrGypfTB2XG9cbFK8mbJqniw5KZEWjlzQbXVVk8dParbf/6
 c7g2ABKh0qRmEHxW/r8tzeimJ9GkmoKEMXNT75X21BEed3EpIfgZV4c60eiGRhkd3DBD
 x21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Q3HL20z/j0aBZhlvqvTrruI95/oqWUTL76//Jbu5y9w=;
 b=QpOrn/osMaRUpZmjh0Muk+Q0bg5MkLtvY8/csiP94CxDkPQfjHrvRXShbXXltDSflu
 hh3mcXPnTpWs6akaMR7hOtvuXF/8xeLjNd2XMRu3y4mtMgM3f2Q5J/Vx411LPkYW5jzO
 JmgffR5rcBP8stdQk91iqjtVM+ASLqqkfXS+haj9171J2Ryu6Qv1qvsYv54WWAB5k2zq
 9t1D85HYpBTLlUExhR5a+oCFZ8s28p9Ji7bFm7KfPu80NBzax9HrxLFWdajfjK7DGqyP
 rN1LlDtlnmm3TxEuxzkxZiiX1mBU2Y4q3XkQ6GK2hqzh19ayy4rVekMDT4H3fEUb5wX7
 ZKdw==
X-Gm-Message-State: AOAM531lTjlWjRzUrp1Uz/XBKvPNg7ZpL/XyMmWL5ayIiXeR73MYKf1P
 kwJlpJQnGxZyenFn5GxMAnyYkzLGaQVu3UVnBik=
X-Google-Smtp-Source: ABdhPJxfp01eoiq+XLr6kDp5lYRY/1VwlEJdegJf/sf3xmQQitaVzgyVXNfvHy1z4uQLjohn5CwaEZJsFUcz8mNZGiQ=
X-Received: by 2002:a25:9d82:: with SMTP id v2mr19913136ybp.268.1590113813830; 
 Thu, 21 May 2020 19:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACAvsv754VyWhNeKR8dDwfYLQGCorZ9fUJBhvxzhmWLui0HO0g@mail.gmail.com>
In-Reply-To: <CACAvsv754VyWhNeKR8dDwfYLQGCorZ9fUJBhvxzhmWLui0HO0g@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 22 May 2020 12:16:42 +1000
Message-ID: <CACAvsv6DcRFMDVEftdL7LxNtxuSQQ=qnfqdHXO0K=BmJ8Q2-+g@mail.gmail.com>
Subject: [PULL] nouveau-next 5.8
To: Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

Hey Dave, Daniel,

- HD audio fixes on recent systems
- vGPU detection (fail probe if we're on one, for now)
- Interlaced mode fixes (mostly avoidance on Turing, which doesn't support it)
- SVM improvements/fixes
- NVIDIA format modifier support
- Misc other fixes.

Thanks,
Ben.

The following changes since commit c41219fda6e04255c44d37fd2c0d898c1c46abf1:

  Merge tag 'drm-intel-next-fixes-2020-05-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-05-21
10:44:33 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/nouveau linux-5.8

for you to fetch changes up to dc455f4c888365595c0a13da445e092422d55b8d:

  drm/nouveau/dispnv50: fix runtime pm imbalance on error (2020-05-22
11:13:53 +1000)

----------------------------------------------------------------
Ben Skeggs (14):
      drm/nouveau: fix out-of-tree module build
      drm/nouveau/acr: ensure falcon providing acr functions is
bootstrapped first
      drm/nouveau/core: add nvkm_subdev_new_() for bare subdevs
      drm/nouveau/ibus: use nvkm_subdev_new_()
      drm/nouveau/gr/gk20a: move MODULE_FIRMWARE firmware definitions
      drm/nouveau: remove open-coded version of
remove_conflicting_pci_framebuffers()
      drm/nouveau/bios: move ACPI _ROM handling
      drm/nouveau/disp/gv100-: expose capabilities class
      drm/nouveau/device: use regular PRI accessors in chipset detection
      drm/nouveau/disp/nv50-: increase timeout on pio channel free() polling
      drm/nouveau/disp/hda/gt215-: pass head to nvkm_ior.hda.eld()
      drm/nouveau/disp/hda/gf119-: add HAL for programming device entry in SF
      drm/nouveau/disp/hda/gf119-: select HDA device entry based on bound head
      drm/nouveau/disp/hda/gv100-: NV_PDISP_SF_AUDIO_CNTRL0 register moved

Colin Ian King (1):
      drm/nouveau/core/memory: remove redundant assignments to variable ret

Dinghao Liu (4):
      drm/nouveau/debugfs: fix runtime pm imbalance on error
      drm/nouveau: fix runtime pm imbalance on error
      drm/nouveau: fix runtime pm imbalance on error
      drm/nouveau/dispnv50: fix runtime pm imbalance on error

James Jones (4):
      drm: Generalized NV Block Linear DRM format mod
      drm/nouveau/kms: Add format mod prop to base/ovly/nvdisp
      drm/nouveau/kms: Check framebuffer size against bo
      drm/nouveau/kms: Support NVIDIA format modifiers

Kai-Heng Feng (1):
      drm/nouveau: Use generic helper to check _PR3 presence

Karol Herbst (3):
      drm/nouveau/device: rework mmio mapping code to get rid of second map
      drm/nouveau/device: detect if changing endianness failed
      drm/nouveau/device: detect vGPUs

Lyude Paul (5):
      drm/nouveau/kms/nv50-: Initialize core channel in nouveau_display_create()
      drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support
      drm/nouveau/kms/gv100-: Add support for interlaced modes
      drm/nouveau/kms/nv50-: Move 8BPC limit for MST into nv50_mstc_get_modes()
      drm/nouveau/kms/nv50-: Share DP SST mode_valid() handling with MST

Ralph Campbell (3):
      drm/nouveau/svm: map pages after migration
      drm/nouveau/nouveau/hmm: fix nouveau_dmem_chunk allocations
      drm/nouveau/nouveau/hmm: fix migrate zero page to GPU

Takashi Iwai (1):
      drm/nouveau/kms: Fix regression by audio component transition

Thomas Zimmermann (4):
      drm/nouveau/kms: Remove unused fields from struct nouveau_framebuffer
      drm/nouveau/kms: Move struct nouveau_framebuffer.vma to struct
nouveau_fbdev
      drm/nouveau/kms: Remove field nvbo from struct nouveau_framebuffer
      drm/nouveau/kms: Remove struct nouveau_framebuffer

Zheng Bin (1):
      drm/nouveau/mmu: Remove unneeded semicolon

Zou Wei (1):
      drm/nouveau/acr: Use kmemdup instead of kmalloc and memcpy

 drivers/gpu/drm/nouveau/Kbuild                        |  10 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c               |  19 ++--
 drivers/gpu/drm/nouveau/dispnv04/disp.c               |  21 ++--
 drivers/gpu/drm/nouveau/dispnv04/overlay.c            |  21 ++--
 drivers/gpu/drm/nouveau/dispnv50/base507c.c           |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/core.h               |   7 ++
 drivers/gpu/drm/nouveau/dispnv50/core507d.c           |  15 +++
 drivers/gpu/drm/nouveau/dispnv50/core827d.c           |   1 +
 drivers/gpu/drm/nouveau/dispnv50/core907d.c           |   1 +
 drivers/gpu/drm/nouveau/dispnv50/core917d.c           |   1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c           |  26 +++++
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c           |   1 +
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c           |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c               | 137
++++++++++++++++++++----
 drivers/gpu/drm/nouveau/dispnv50/disp.h               |   5 +
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c           |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c           |   5 +-
 drivers/gpu/drm/nouveau/dispnv50/pior507d.c           |   8 ++
 drivers/gpu/drm/nouveau/dispnv50/sor507d.c            |   7 ++
 drivers/gpu/drm/nouveau/dispnv50/sor907d.c            |  11 ++
 drivers/gpu/drm/nouveau/dispnv50/sorc37d.c            |   9 ++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c               |  81 ++++++++++----
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c           |  17 +++
 drivers/gpu/drm/nouveau/include/nvif/class.h          |   2 +
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h    |   2 +
 drivers/gpu/drm/nouveau/nouveau_acpi.c                |  98 ++---------------
 drivers/gpu/drm/nouveau/nouveau_acpi.h                |   4 -
 drivers/gpu/drm/nouveau/nouveau_connector.c           |  48 ++++++---
 drivers/gpu/drm/nouveau/nouveau_connector.h           |   5 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c             |   5 +-
 drivers/gpu/drm/nouveau/nouveau_display.c             | 212
++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_display.h             |  31 ++----
 drivers/gpu/drm/nouveau/nouveau_dmem.c                | 423
++++++++++++++++++++++++++++++++++++-------------------------------------
 drivers/gpu/drm/nouveau/nouveau_dmem.h                |   2 +
 drivers/gpu/drm/nouveau/nouveau_dp.c                  |  31 ++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c                 |  31 +-----
 drivers/gpu/drm/nouveau/nouveau_encoder.h             |   8 ++
 drivers/gpu/drm/nouveau/nouveau_fbcon.c               |  42 ++++----
 drivers/gpu/drm/nouveau/nouveau_fbcon.h               |   3 +
 drivers/gpu/drm/nouveau/nouveau_gem.c                 |   6 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c            |  11 --
 drivers/gpu/drm/nouveau/nouveau_svm.c                 |  59 ++++++++++-
 drivers/gpu/drm/nouveau/nouveau_svm.h                 |   5 +
 drivers/gpu/drm/nouveau/nv50_fbcon.c                  |   9 +-
 drivers/gpu/drm/nouveau/nvc0_fbcon.c                  |   9 +-
 drivers/gpu/drm/nouveau/nvkm/core/memory.c            |   2 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c            |  11 ++
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c     |  75 ++++++++-----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild       |   3 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/capsgv100.c  |  60 +++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagf119.c   |  18 +++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagt215.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagv100.c   |  30 ++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h        |  10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgv100.c  |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.h   |   3 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/roottu102.c  |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgf119.c   |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgk104.c   |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm107.c   |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c   |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgv100.c   |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sortu102.c   |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c        |  11 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c        |   5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c        |  12 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowacpi.c |  65 ++++++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gf100.c      |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gf117.c      |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gk104.c      |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gk20a.c      |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gm200.c      |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ibus/gp10b.c      |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c         |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h         |   2 +-
 include/uapi/drm/drm_fourcc.h                         | 122
+++++++++++++++++++--
 77 files changed, 1312 insertions(+), 630 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/capsgv100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagv100.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
