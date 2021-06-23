Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDA43B2236
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 23:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BF26E990;
	Wed, 23 Jun 2021 21:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715F96E98C;
 Wed, 23 Jun 2021 21:06:52 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4829582wmh.4; 
 Wed, 23 Jun 2021 14:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=W1XPg8Uwq4l8UaUUZ7CyGBQp8mo76VKWlbchI4Ag/NA=;
 b=Z7X76dGYzk7Z8QLFefY/8lCmAAcIK1aOHZNZB0ZGFJ4eVaIkp3i1k2F3BVU30eOAmz
 f56FHUbp/y+OoR2QI0qgAd5XpY7DHNsSuZF6RXJk6+Z6iq6bPqq+WfKKDFs7W/Zhqi65
 mVMWtBuFd/YKCz67EyOP35eNQWnVJnYNCc+KtllFO0NowKF5IvNhkb9OnU5lirSPW38u
 K4VzKYgQ+vNsJAkREHuMp46g6vxQV2QMv71rpQk8Cjs+SgpVXOrP1YQE1oTd5PnwD5k0
 54CuqMZ9oU+hda8wUBP3HkPVLHLeA34sOzOe19HaD/ASYuMKc/PovaUa3smyZSK2QGYU
 W7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=W1XPg8Uwq4l8UaUUZ7CyGBQp8mo76VKWlbchI4Ag/NA=;
 b=l4NQ1GoeY+p98PKU6u2GHKE8mbTg0L6t6hKuDJSCraZqaz92jyFcdtqnBch3D99oK4
 yfqE6dZPndTdL0ctY/fzYvUgUwe2u5EbvTPCZTMv5wXqIzgYU0Mlq5eGdKzFKeI+yGuo
 GOIa2Zzh/Sv5CWYb5m/qcq50SFrGOFgP63Bl/B3MXx3zNubF2FwbbNCBWlkUSa/n4YYW
 pDW76vfJwXpGSazsbUZCLyOD63O8z9LXQoi/tc3YrzVjT1eT0nSq4ymHKI2/pbpWAocx
 1+bORPo99IuLAF9tQvYJfsBJSmNRpE8ClsS/18w4p4/kzfiQLVV1Y65oa/IBDgc2YJ6k
 138A==
X-Gm-Message-State: AOAM532jQHQL9LVsIH3i4soLv2XN2LwJ/MoTSBXNSP0kYjyWdXV3PMqx
 1mjyK+iFKb+Im0nkht8JKMw0E302EW/0uj6V6Io=
X-Google-Smtp-Source: ABdhPJwNVB8DGP2NzD4Mn1pcKFUHionpoZIXcIKgxCMSK7+1FULXvLxSg2y/yeguEe0cl2Hne3hefOdEu1DSg3IT6ms=
X-Received: by 2002:a05:600c:d8:: with SMTP id u24mr87676wmm.94.1624482411025; 
 Wed, 23 Jun 2021 14:06:51 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 23 Jun 2021 14:10:51 -0700
Message-ID: <CAF6AEGs4=qsGBBbyn-4JWqW4-YUSTKh67X3DsPQ=T2D9aXKqNA@mail.gmail.com>
Subject: [pull v3] drm/msm: drm-msm-next-2021-06-23b for v5.14
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Updated to revert last commit which was breaking armv7 build (and
updated description below)

Here is msm-next for v5.14

Notable additions this time around:

* devcoredump support for display errors
* dpu: irq cleanup/refactor
* dpu: dt bindings conversion to yaml
* dsi: dt bindings conversion to yaml
* mdp5: alpha/blend_mode/zpos support
* a6xx: cached coherent buffer support
* a660 support
* gpu iova fault improvements:
   - info about which block triggered the fault, etc
   - generation of gpu devcoredump on fault
* assortment of other cleanups and fixes

The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-06-23b

for you to fetch changes up to e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management"
(2021-06-23 14:06:20 -0700)

----------------------------------------------------------------
Abhinav Kumar (7):
      drm: allow drm_atomic_print_state() to accept any drm_printer
      drm/msm: add support to take dpu snapshot
      drm/msm/dsi: add API to take DSI register snapshot
      drm/msm/dp: add API to take DP register snapshot
      drm/msm/disp/dpu1: add API to take DPU register snapshot
      drm/msm: add support to take dsi, dp and dpu snapshot
      drm/msm: add disp snapshot points across dpu driver

Alexey Minnekhanov (1):
      drm/msm: Init mm_list before accessing it for use_vram path

Arnd Bergmann (1):
      drm/msm/dsi: fix 32-bit clang warning

Bernard Zhao (1):
      drm/msm: remove unneeded variable ret

Bhaskar Chowdhury (3):
      drm/msm/dpu: Fix a typo
      drm/msm/dpu: Fix a typo
      drm/msm/dp: Fixed couple of typos

Bjorn Andersson (1):
      drm/msm/dpu: Avoid ABBA deadlock between IRQ modules

Dmitry Baryshkov (23):
      drm/msm: pass dump state as a function argument
      drm/msm: make msm_disp_state transient data struct
      drm/msm: get rid of msm_iomap_size
      drm/msm/dsi: add DSI PHY registers to snapshot data
      drm/msm: fix display snapshotting if DP or DSI is disabled
      drm/msm/dpu: merge dpu_hw_intr_get_interrupt_statuses into
dpu_hw_intr_dispatch_irqs
      drm/msm/dpu: hw_intr: always call dpu_hw_intr_clear_intr_status_nolock
      drm/msm/dpu: define interrupt register names
      drm/msm/dpu: replace IRQ lookup with the data in hw catalog
      drm/msm/dpu: drop remains of old irq lookup subsystem
      drm/msm/dpu: simplify IRQ enabling/disabling
      drm/msm/dsi: print error code when MIPI DSI host registration fails
      drm/msm/dpu: remove unused dpu_hw_blk features
      drm/msm/dpu: drop dpu_hw_blk_destroy function
      drm/msm/dpu: use struct dpu_hw_merge_3d in dpu_hw_pingpong
      drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque structure
      drm/msm/dsi: do not enable PHYs when called for the slave DSI interface
      drm/msm/mdp5: use drm atomic helpers to handle base drm plane state
      drm/msm/mdp5: use drm_plane_state for storing alpha value
      drm/msm/mdp5: use drm_plane_state for pixel blend mode
      drm/msm/mdp5: add support for alpha/blend_mode properties
      drm/msm/mdp5: switch to standard zpos property
      drm/msm/mdp5: provide dynamic bandwidth management

Guenter Roeck (2):
      drm/msm/dp: Drop unnecessary NULL checks after container_of
      drm/msm/dpu: Drop unnecessary NULL checks after container_of in
dpu_encoder

James Willcox (1):
      drm/msm/mdp5: add perf blocks for holding fudge factors

Jonathan Marek (13):
      drm/msm/a6xx: update/fix CP_PROTECT initialization
      drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
      drm/msm/a6xx: avoid shadow NULL reference in failure path
      drm/msm: remove unnecessary mmap logic for cached BOs
      drm/msm: replace MSM_BO_UNCACHED with MSM_BO_WC for internal objects
      drm/msm: use the right pgprot when mapping BOs in the kernel
      drm/msm: add MSM_BO_CACHED_COHERENT
      drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)
      drm/msm: remove unused icc_path/ocmem_icc_path
      drm/msm/a6xx: use AOP-initialized PDC for a650
      drm/msm/a6xx: add GMU_CX_GMU_CX_FALNEXT_INTF write for a650
      drm/msm/a6xx: add missing PC_DBG_ECO_CNTL bit for a640/a650
      drm/msm/a6xx: add support for Adreno 660 GPU

Jordan Crouse (3):
      iommu/arm-smmu: Add support for driver IOMMU fault handlers
      iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get
pagefault info
      drm/msm: Improve the a6xx page fault handler

Krishna Manikandan (5):
      dt-bindings: msm: disp: add yaml schemas for DPU bindings
      dt-bindings: msm: dsi: add yaml schemas for DSI bindings
      dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
      dt-bindings: msm/dp: Add bindings of MSM DisplayPort controller
      drm/msm/disp/dpu1: avoid perf update in frame done event

Kuogee Hsieh (2):
      drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
      drm/msm/dp: power off DP phy at suspend

Lee Jones (5):
      drm/msm/dp/dp_display: Remove unused variable 'hpd'
      drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming issues
      drm/msm/msm_gem: Demote kernel-doc abuses
      drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
      drm/msm/dp/dp_link: Fix some potential doc-rot

Rob Clark (6):
      Merge branch 'msm-fixes-v5.13-rc6' into msm-next-redo
      drm/msm: Generated register update
      iommu/arm-smmu-qcom: Add stall support
      drm/msm: devcoredump iommu fault support
      drm/msm: Add debugfs to trigger shrinker
      Revert "drm/msm/mdp5: provide dynamic bandwidth management"

Samuel Iglesias Gonsalvez (1):
      drm/msm: export hangcheck_period in debugfs

Shaokun Zhang (1):
      drm/msm/dp: remove the repeated declaration

Stephen Boyd (10):
      drm/msm/dsi: Stash away calculated vco frequency on recalc
      drm/msm/dp: Simplify aux irq handling code
      drm/msm/dp: Shrink locking area of dp_aux_transfer()
      drm/msm/dp: Handle aux timeouts, nacks, defers
      drm/msm: Move vblank debug prints to drm_dbg_vbl()
      drm/msm/dp: Drop malformed debug print
      drm/msm: Move FB debug prints to drm_dbg_state()
      drm/msm/disp: Use plane debug print helper
      drm/msm/disp: Move various debug logs to atomic bucket
      drm/msm: Use VERB() for extra verbose logging

Yangtao Li (1):
      drm/msm: Convert to use resource-managed OPP API

Zhen Lei (3):
      drm/msm: Fix error return code in msm_drm_init()
      drm/msm/dpu: Fix error return code in dpu_mdss_init()
      drm/msm/dpu: remove unused local variable 'cmd_enc'

zuoqilin (1):
      drm/msm: Remove unneeded variable: "rc"

 .../bindings/display/msm/dp-controller.yaml        |  146 ++
 .../bindings/display/msm/dpu-sc7180.yaml           |  228 ++
 .../bindings/display/msm/dpu-sdm845.yaml           |  212 ++
 .../devicetree/bindings/display/msm/dpu.txt        |  141 --
 .../bindings/display/msm/dsi-controller-main.yaml  |  185 ++
 .../bindings/display/msm/dsi-phy-10nm.yaml         |   68 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   66 +
 .../bindings/display/msm/dsi-phy-20nm.yaml         |   71 +
 .../bindings/display/msm/dsi-phy-28nm.yaml         |   68 +
 .../bindings/display/msm/dsi-phy-common.yaml       |   40 +
 .../devicetree/bindings/display/msm/dsi.txt        |  249 ---
 drivers/gpu/drm/drm_atomic.c                       |   28 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +-
 drivers/gpu/drm/drm_crtc_internal.h                |    4 +-
 drivers/gpu/drm/msm/Makefile                       |    3 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |   60 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |   40 +-
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |   38 +-
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |   95 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   29 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 2201 ++++++++++----------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   55 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   34 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  460 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   44 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   33 +
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   30 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   14 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   26 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   13 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  119 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       |  230 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |   43 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  110 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    4 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   58 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   54 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c         |  139 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h         |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  202 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |    7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 1508 +-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  132 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   70 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   63 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   14 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |   34 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |   38 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   35 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    7 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |    5 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  135 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   34 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       |  125 ++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       |  136 ++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |  187 ++
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  181 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |    8 -
 drivers/gpu/drm/msm/dp/dp_catalog.c                |   18 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |    7 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   87 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |    3 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  121 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |    1 +
 drivers/gpu/drm/msm/dp/dp_link.c                   |   21 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |    4 +-
 drivers/gpu/drm/msm/dp/dp_power.h                  |    4 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    6 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |    4 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  | 1722 +--------------
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   30 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   12 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |  228 ++
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |  310 +++
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |  238 +++
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |  385 ++++
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |  287 +++
 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h          |  480 +++++
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |  482 +++++
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   34 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   31 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c         |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |    8 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |   34 +-
 drivers/gpu/drm/msm/edp/edp.xml.h                  |   34 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |   34 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |   34 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |   31 +
 drivers/gpu/drm/msm/msm_drv.c                      |   33 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   24 +-
 drivers/gpu/drm/msm/msm_fb.c                       |    8 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   45 +-
 drivers/gpu/drm/msm/msm_gem.h                      |    1 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |   18 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |    1 +
 drivers/gpu/drm/msm/msm_gpu.c                      |   51 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   29 +-
 drivers/gpu/drm/msm/msm_gpummu.c                   |    5 +
 drivers/gpu/drm/msm/msm_iommu.c                    |   22 +-
 drivers/gpu/drm/msm/msm_kms.h                      |    9 +
 drivers/gpu/drm/msm/msm_mmu.h                      |    5 +-
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |    1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   50 +
 drivers/iommu/arm/arm-smmu/arm-smmu.c              |    9 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |    2 +
 include/linux/adreno-smmu-priv.h                   |   38 +-
 include/uapi/drm/msm_drm.h                         |    7 +-
 133 files changed, 7327 insertions(+), 6316 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/dp-controller.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h
