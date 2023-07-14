Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F028F75309F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 06:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E581310E00E;
	Fri, 14 Jul 2023 04:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3548810E00E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 04:39:52 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-98dfb3f9af6so193042366b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 21:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689309589; x=1691901589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CcH/aystrJ6CXZA8qG6BNZCfnNcu6DPOcQ2YDR7bZSY=;
 b=k7n5n485J1PiibEInR+NucF0IFX6VaNJKOxdlB+4JT14IV9tLE85n2oBtfv27e315U
 l4f+Lw0gE3ozgZWAq+6pggNNRfAa/JpxUMlKLAAV28wT4NzfY1U6+nPr1dVw7Hn36DJL
 teW3DKfnO+06lZCijccCFZdGcMZ71Vv5MmQ1Sx8RCX69nIRVIveknuYnjaVx6YlRdwgo
 Vb4YbieQFQs7zqfSB16rX231WnbzWM9+GZ6Mb1pluy4jOoVcQ5m6n4ge1nwU8yKrrSNk
 0OnVDNHnFlRGCCDYk1zbqTxAlDuQ8OL2+9cJRhgjbcAAJXeSwtMZ1SCHgiMG1ebkf69W
 Mp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689309589; x=1691901589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CcH/aystrJ6CXZA8qG6BNZCfnNcu6DPOcQ2YDR7bZSY=;
 b=b/DIzqJo+oH76+pvTuCirKaqcIJyCfro98x7t0gcTh4pt4tBung3JhEp9XFKmercU0
 10y9GvfSyS8uNvSj1SiHtJERfPocU83rVgfY37cbQIn/5f3AvOKRVWv4DpdsO7GtitvY
 9lQ/l4R5P1f2RnQlN8+L9ARi06YH4sEux/aCM16J9i2JxUgaAZL2N9FSC3fpB4FB/VMx
 WZEo1m+1XAGB8grYHk2rsARFLK5PUWtYFag5xZrqB/a6HMdGPI7iL0rEaScEbnQSCjcf
 yxuYsBgbTOC7uGyZQr5XTUeDZlAU8X1NFjTwJax9Ui+wXWgvWV1HVMLl2uegCtzccOQG
 SppQ==
X-Gm-Message-State: ABy/qLYv6GkPIqr3c2xlW9s/04elEwUc/Urp9zbG7DbhjL3uSgfqNlvZ
 1zz7IsouoBNp5bGycDzEU4C2/E0wujWyaustcF0=
X-Google-Smtp-Source: APBJJlEuq+iUhWyYpsiUm7tLfKO5iMwpDe3tQbjuHaLQsslI+h6Nmr2eiYZ0ugup+KCTh47JYItZ7XNRevGp7Hl0lw0=
X-Received: by 2002:a17:907:bc7:b0:993:f4cd:34b5 with SMTP id
 ez7-20020a1709070bc700b00993f4cd34b5mr2630462ejc.29.1689309589187; Thu, 13
 Jul 2023 21:39:49 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 14 Jul 2023 14:39:37 +1000
Message-ID: <CAPM=9txdhgYF63eL7VMpc3gmnvCz=gnxLW=HwTRNHNU8geU5Ww@mail.gmail.com>
Subject: [git pull] drm fixes for 6.5-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Linus,

There were a bunch of fixes lined up for 2 weeks, so we have quite a
few scattered fixes, mostly amdgpu and i915, but ttm has a bunch and
nouveau makes an appearance.

So a bit busier than usual for rc2, but nothing seems out of the ordinary.

Dave.

drm-fixes-2023-07-14-1:
drm fixes for 6.5-rc2

fbdev:
- dma: Fix documented default preferred_bpp value

ttm:
- fix warning that we shouldn't mix && and ||
- never consider pinned BOs for eviction&swap
- Don't leak a resource on eviction error
- Don't leak a resource on swapout move error
- fix bulk_move corruption when adding a entry

client:
- Send hotplug event after registering a client

dma-buf:
- keep the signaling time of merged fences v3
- fix an error pointer vs NULL bug

sched:
- wait for all deps in kill jobs
- call set fence parent from scheduled

i915:
- Don't preserve dpll_hw_state for slave crtc in Bigjoiner
- Consider OA buffer boundary when zeroing out reports
- Remove dead code from gen8_pte_encode
- Fix one wrong caching mode enum usage

amdgpu:
- SMU i2c locking fix
- Fix a possible deadlock in process restoration for ROCm apps
- Disable PCIe lane/speed switching on Intel platforms (the platforms
don't support it)

nouveau:
- disp: fix HDMI on gt215+
- disp/g94: enable HDMI
- acr: Abort loading ACR if no firmware was found
- bring back blit subchannel for pre nv50 GPUs
- Fix drm_dp_remove_payload() invocation

ivpu:
- Fix VPU register access in irq disable
- Clear specific interrupt status bits on C0

bridge:
- dw_hdmi: fix connector access for scdc
- ti-sn65dsi86: Fix auxiliary bus lifetime

panel:
- simple: Add connector_type for innolux_at043tn24
- simple: Add Powertip PH800480T013 drm_display_mode flags
The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5=
:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-07-14-1

for you to fetch changes up to 38d88d5e97c9032ebeca092b9372209f2ca92cdf:

  Merge tag 'amd-drm-fixes-6.5-2023-07-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-07-14
13:19:54 +1000)

----------------------------------------------------------------
drm fixes for 6.5-rc2

fbdev:
- dma: Fix documented default preferred_bpp value

ttm:
- fix warning that we shouldn't mix && and ||
- never consider pinned BOs for eviction&swap
- Don't leak a resource on eviction error
- Don't leak a resource on swapout move error
- fix bulk_move corruption when adding a entry

client:
- Send hotplug event after registering a client

dma-buf:
- keep the signaling time of merged fences v3
- fix an error pointer vs NULL bug

sched:
- wait for all deps in kill jobs
- call set fence parent from scheduled

i915:
- Don't preserve dpll_hw_state for slave crtc in Bigjoiner
- Consider OA buffer boundary when zeroing out reports
- Remove dead code from gen8_pte_encode
- Fix one wrong caching mode enum usage

amdgpu:
- SMU i2c locking fix
- Fix a possible deadlock in process restoration for ROCm apps
- Disable PCIe lane/speed switching on Intel platforms (the platforms
don't support it)

nouveau:
- disp: fix HDMI on gt215+
- disp/g94: enable HDMI
- acr: Abort loading ACR if no firmware was found
- bring back blit subchannel for pre nv50 GPUs
- Fix drm_dp_remove_payload() invocation

ivpu:
- Fix VPU register access in irq disable
- Clear specific interrupt status bits on C0

bridge:
- dw_hdmi: fix connector access for scdc
- ti-sn65dsi86: Fix auxiliary bus lifetime

panel:
- simple: Add connector_type for innolux_at043tn24
- simple: Add Powertip PH800480T013 drm_display_mode flags

----------------------------------------------------------------
Adri=C3=A1n Larumbe (1):
      drm: bridge: dw_hdmi: fix connector access for scdc

Boris Brezillon (2):
      drm/sched: Make sure we wait for all dependencies in kill_jobs_cb()
      drm/sched: Call drm_sched_fence_set_parent() from
drm_sched_fence_scheduled()

Christian K=C3=B6nig (3):
      drm/ttm: fix warning that we shouldn't mix && and ||
      dma-buf: keep the signaling time of merged fences v3
      drm/ttm: never consider pinned BOs for eviction&swap

Dan Carpenter (1):
      dma-buf: fix an error pointer vs NULL bug

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2023-07-13' of
ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-07-13' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.5-2023-07-12' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Douglas Anderson (1):
      drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime

Evan Quan (1):
      drm/amd/pm: share the code around SMU13 pcie parameters update

Fabio Estevam (1):
      drm/panel: simple: Add connector_type for innolux_at043tn24

Geert Uytterhoeven (1):
      drm/fbdev-dma: Fix documented default preferred_bpp value

Karol Herbst (4):
      drm/nouveau/disp: fix HDMI on gt215+
      drm/nouveau/disp/g94: enable HDMI
      drm/nouveau/acr: Abort loading ACR if no firmware was found
      drm/nouveau: bring back blit subchannel for pre nv50 GPUs

Karol Wachowski (2):
      accel/ivpu: Fix VPU register access in irq disable
      accel/ivpu: Clear specific interrupt status bits on C0

Lyude Paul (1):
      drm/nouveau/kms/nv50-: Fix drm_dp_remove_payload() invocation

Marek Vasut (1):
      drm/panel: simple: Add Powertip PH800480T013 drm_display_mode flags

Mario Limonciello (3):
      drm/amd/pm: conditionally disable pcie lane/speed switching for SMU13
      drm/amd: Move helper for dynamic speed switch check out of smu13
      drm/amd: Align SMU11 SMU_MSG_OverridePcieParameters
implementation with SMU13

Maxime Ripard (1):
      Merge v6.5-rc1 into drm-misc-fixes

Stanislav Lisovskiy (1):
      drm/i915: Don't preserve dpll_hw_state for slave crtc in Bigjoiner

Thomas Hellstr=C3=B6m (2):
      drm/ttm: Don't leak a resource on eviction error
      drm/ttm: Don't leak a resource on swapout move error

Thomas Zimmermann (1):
      drm/client: Send hotplug event after registering a client

Tvrtko Ursulin (2):
      drm/i915: Remove dead code from gen8_pte_encode
      drm/i915: Fix one wrong caching mode enum usage

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Consider OA buffer boundary when zeroing out reports

Yang Wang (1):
      drm/amd/pm: fix smu i2c data read risk

Yunxiang Li (1):
      drm/ttm: fix bulk_move corruption when adding a entry

gaba (1):
      drm/amdgpu: avoid restore process run into dead loop.

 drivers/accel/ivpu/ivpu_drv.h                      |  1 +
 drivers/accel/ivpu/ivpu_hw_mtl.c                   | 20 +++--
 drivers/dma-buf/dma-fence-unwrap.c                 | 26 ++++++-
 drivers/dma-buf/dma-fence.c                        |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 19 +++++
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  4 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 91 +++++-------------=
----
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 48 ++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 35 +--------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 33 +-------
 drivers/gpu/drm/armada/armada_fbdev.c              |  4 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  9 ++-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 35 +++++----
 drivers/gpu/drm/drm_client.c                       | 21 +++++
 drivers/gpu/drm/drm_fbdev_dma.c                    |  6 +-
 drivers/gpu/drm/drm_fbdev_generic.c                |  4 -
 drivers/gpu/drm/drm_syncobj.c                      |  6 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |  4 -
 drivers/gpu/drm/gma500/fbdev.c                     |  4 -
 drivers/gpu/drm/i915/display/intel_display.c       |  1 -
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  3 -
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  2 +-
 drivers/gpu/drm/i915/i915_perf.c                   | 11 ++-
 drivers/gpu/drm/msm/msm_fbdev.c                    |  4 -
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  8 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |  1 +
 drivers/gpu/drm/nouveau/nouveau_chan.h             |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              | 20 ++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c     |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c     |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |  4 -
 drivers/gpu/drm/panel/panel-simple.c               |  2 +
 drivers/gpu/drm/radeon/radeon_fbdev.c              |  4 -
 drivers/gpu/drm/scheduler/sched_entity.c           | 41 ++++++++--
 drivers/gpu/drm/scheduler/sched_fence.c            | 40 ++++++----
 drivers/gpu/drm/scheduler/sched_main.c             |  3 +-
 drivers/gpu/drm/tegra/fbdev.c                      |  4 -
 drivers/gpu/drm/ttm/ttm_bo.c                       | 29 ++++---
 drivers/gpu/drm/ttm/ttm_resource.c                 |  5 +-
 include/drm/gpu_scheduler.h                        |  5 +-
 include/linux/dma-fence.h                          |  2 +-
 48 files changed, 318 insertions(+), 266 deletions(-)
