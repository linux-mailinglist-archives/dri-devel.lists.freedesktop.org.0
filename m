Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF989781F5E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 21:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A569B10E149;
	Sun, 20 Aug 2023 19:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD2510E0F2;
 Sun, 20 Aug 2023 19:07:09 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b962535808so42846121fa.0; 
 Sun, 20 Aug 2023 12:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692558427; x=1693163227;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=25MlcWqTkEd9t6H9JrMaTCP1fU6Tp/JCqVpM+Op0iRk=;
 b=aIsamYojiZnW5K8g8OD3gn1a+p0H0Mwd72bSCtHaJzehca1lRdEoGcy0AayRuFlSFP
 DNQHx2lyoleruUxLxPU/Z3ciyUcQNgBZbRl8H65fJ2YS85k/bHYDlsfoSBOWJ1HgPpQI
 oaYkbEA70VUl48NZkktNffDw7jNmyGf3gN5lvSVc/Zn4J1ZmW5smvX1Mduy2F8QZOcTe
 YOT7IGs9BT1uIPubHlr/X4Jfgm8VIY45vQ58LVrCRBzN7oNBfcXK2LMDQEVrp6AcxcNE
 gy/5iD5XrYDPdAxE0IzRE8vsYQ4RdnHivh9pSGkZyFLBvm3UeDeqalUOqr8iCO/7n4wM
 EKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692558427; x=1693163227;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=25MlcWqTkEd9t6H9JrMaTCP1fU6Tp/JCqVpM+Op0iRk=;
 b=bmKYYvgPbc3BdSfxGnqXPzp1lpddnBaSkk9O6z/kKXJj2J0C7CTypZb17ZZYPR4SwK
 dCBPdHyLEUoRxrj4YgjGlQ6QJCJhE2+a44Ko7f6Jxyc0bubaqQ/Ot6//xwM1jC4Adc3f
 8lqmOPO6HZtrmJ/62SmaNMilb3Obfn0PfSgXxQCoWkCYKKpz3P24mk/v/BTBc0VJquk/
 8qgPcvE8z6BiWpm7+L9B62VCLvAZ2wjWo/39mtdvDmVZkZSrjdQwTLSHO7D9cbvBQ/A6
 HPPGYS9doHY7wTyE2B/TJInOWwz872/KHEWBCSGHiZZzZa/K80gCT1qFbF+fmQtaqCCn
 +qTA==
X-Gm-Message-State: AOJu0Yw6fbWoNtvHAcCWmPmX0DPYU2rgB9S3/iwjEXvcxw8sKqjTh0D8
 Q2qOZy06EJUJVtWX5AuhlWKhcBUZ+Yw1WhsII2g=
X-Google-Smtp-Source: AGHT+IH2UXyCXytNnyt0akTrnqB7FQHBjE0wSs0u3bZdOb8NT1mjrr4dE1CTSHIadqT7t0mnaBQfrKMk5wMCHxr+JmE=
X-Received: by 2002:ac2:4e03:0:b0:4fe:19ef:8791 with SMTP id
 e3-20020ac24e03000000b004fe19ef8791mr3361080lfr.38.1692558427020; Sun, 20 Aug
 2023 12:07:07 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 20 Aug 2023 12:06:55 -0700
Message-ID: <CAF6AEGv_01g-edjdfKLWWcb-rO5aSyLsv5FpbKrTkXVL9+ngTQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2023-08-20 for v6.6
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

This is the pull for v6.6, see below for description.  It includes a
backmerge of msm-fixes to resolve conflicts.

The following changes since commit cd036d542afb82adfbbd43c5dbeb7010e8e91ee7:

  drm/msm/a6xx: Add A610 speedbin support (2023-06-18 11:35:27 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-08-20

for you to fetch changes up to 34b149ecae852d13ae3275e707fce93081ef5e4a:

  drm/msm/a6xx: Bail out early if setting GPU OOB fails (2023-08-17
10:09:54 -0700)

----------------------------------------------------------------
Updates for v6.6, which includes a backmerge of msm-fixes to avoid conficts.

Core:
- SM6125 MDSS support

DPU:
- SM6125 DPU support
- Added subblocks to display snapshot
- Use UBWC data from MDSS driver rather than duplicating it
- dpu_core_perf cleanup

DSI:
- Enabled burst mode to fix CMD mode panels
- Runtime PM support
- refgen regulator support

DSI PHY:
- SM6125 support in 14nm DSI PHY driver

GPU:
- Rework GPU identification to prepare for a7xx, and other a7xx prep
- Cleanups and fixes
- Disallow legacy relocs on a6xx and newer
- a690: switch to using a660_gmu.bin fw as this is what we have in
  linux-firmware and we see no evidence that it should be different
  from other a660 family (a6xx subgen 4) devices
- Submit overhead opts, 1.6x faster for NO_IMPLICIT_SYNC commits with
  100 BOs to 2.5x faster for 1000 BOs

----------------------------------------------------------------
Abhinav Kumar (5):
      drm/msm/dpu: re-introduce dpu core revision to the catalog
      drm/msm/dpu: use dpu core's major version to enable data compress
      drm/msm/dpu: rename all hw_intf structs to have dpu_hw prefix
      drm/msm/dpu: rename enable_compression() to program_intf_cmd_cfg()
      drm/msm/dpu: drop DPU_INTF_DATA_COMPRESS from dpu catalog

Amit Pundir (1):
      dt-bindings: display/msm: mdss-common: add memory-region property

Daniel Vetter (1):
      drm/msm/mdp5: Don't leak some plane state

Dmitry Baryshkov (49):
      drm/msm: stop storing the array of CRTCs in struct msm_drm_private
      drm/msm: enumerate DSI interfaces
      drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
      drm/msm/dpu: simplify peer LM handling
      drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
      drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
      drm/msm/dpu: expand .clk_ctrls definitions
      drm/msm/dpu: drop zero features from dpu_mdp_cfg data
      drm/msm/dpu: drop zero features from dpu_ctl_cfg data
      drm/msm/dpu: correct indentation for CTL definitions
      drm/msm/dpu: inline SSPP_BLK macros
      drm/msm/dpu: inline DSPP_BLK macros
      drm/msm/dpu: inline LM_BLK macros
      drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
      drm/msm/dpu: inline MERGE_3D_BLK macros
      drm/msm/dpu: inline various PP_BLK_* macros
      drm/msm/dpu: inline WB_BLK macros
      drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
      drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
      drm/msm/dpu: drop empty features mask INTF_SDM845_MASK
      drm/msm/mdss: correct UBWC programming for SM8550
      drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
      dt-bindings: display: msm: dp-controller: document SM8250 compatible
      drm/msm/dpu: inline __intr_offset
      drm/msm/dpu: split interrupt address arrays
      drm/msm/dpu: autodetect supported interrupts
      drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
      drm/msm/dpu: drop compatibility INTR defines
      drm/msm/mdss: correct UBWC programming for SM8550
      drm/msm/mdss: rename ubwc_version to ubwc_enc_version
      drm/msm/mdss: export UBWC data
      drm/msm/mdss: populate missing data
      drm/msm/dpu: use MDSS data for programming SSPP
      drm/msm/dpu: drop UBWC configuration
      drm/msm/dpu: drop BWC features from DPU_MDP_foo namespace
      drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
      drm/msm/dpu: bail from _dpu_core_perf_crtc_update_bus if there
are no ICC paths
      drm/msm/dpu: drop separate dpu_core_perf_tune overrides
      drm/msm/dpu: rework indentation in dpu_core_perf
      drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
      drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
      drm/msm/dpu: remove unused fields from struct dpu_core_perf
      drm/msm/dpu: remove extra clk_round_rate() call
      drm/msm/dpu: move max clock decision to dpu_kms.
      drm/msm/dpu: drop dpu_core_perf_destroy()
      drm/msm/dpu: fix DSC 1.2 block lengths
      drm/msm/dpu: fix DSC 1.2 enc subblock length
      drm/msm/dpu: initialise clk_rate to 0 in _dpu_core_perf_get_core_clk_rate
      drm/msm/dpu: fix the irq index in dpu_encoder_phys_wb_wait_for_commit_done

Fabio Estevam (1):
      drm/msm/a2xx: Call adreno_gpu_init() earlier

Gaosheng Cui (1):
      drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()

Jessica Zhang (2):
      drm/msm/dsi: Enable BURST_MODE for command mode for DSI 6G v1.3+
      drm/msm/dpu: Drop encoder vsync_event

Jiapeng Chong (1):
      drm/msm/dpu: clean up some inconsistent indenting

Jonathan Marek (2):
      drm/msm/dpu: add missing flush and fetch bits for DMA4/DMA5 planes
      drm/msm/dpu: increase memtype count to 16 for sm8550

Juerg Haefliger (1):
      drm/msm/adreno: Add missing MODULE_FIRMWARE macros

Konrad Dybcio (12):
      drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
      dt-bindings: display/msm: dsi-controller-main: Allow refgen-supply
      drm/msm/dsi: Hook up refgen regulator
      drm/msm/a6xx: Add some missing header definitions
      drm/msm/a6xx: Use descriptive bitfield names for CP_PROTECT_CNTL
      drm/msm/a6xx: Skip empty protection ranges entries
      drm/msm/a6xx: Ensure clean GMU state in a6xx_gmu_fw_start
      drm/msm/a6xx: Improve GMU force shutdown sequence
      drm/msm/a6xx: Fix up GMU region reservations
      drm/msm/a6xx: Introduce a6xx_llc_read
      drm/msm/a6xx: Move LLC accessors to the common header
      drm/msm/a6xx: Bail out early if setting GPU OOB fails

Kuogee Hsieh (2):
      drm/msm/dpu: retrieve DSI DSC struct through priv->dsi[0]
      drm/msm/dpu: remove struct drm_dsc_config from struct msm_display_info

Marijn Suijten (12):
      drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
      drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
      dt-bindings: display/msm: Remove DSI1 ports from SM6350/SM6375 example
      dt-bindings: clock: qcom, dispcc-sm6125: Require GCC PLL0 DIV clock
      dt-bindings: clock: qcom, dispcc-sm6125: Allow power-domains property
      dt-bindings: display/msm: dsi-controller-main: Document SM6125
      dt-bindings: display/msm: sc7180-dpu: Describe SM6125
      dt-bindings: display/msm: Add SM6125 MDSS
      drm/msm/dpu: Add SM6125 support
      drm/msm/mdss: Add SM6125 support
      dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
      drm/msm/dsi: Reuse QCM2290 14nm DSI PHY configuration for SM6125

Neil Armstrong (3):
      dt-bindings: display: msm: sm8350-mdss: document displayport
controller subnode
      dt-bindings: display: msm: sm8450-mdss: document displayport
controller subnode
      dt-bindings: display: msm: sm8550-mdss: document displayport
controller subnode

Rob Clark (28):
      drm/msm/adreno: Fix warn splat for devices without revn
      drm/msm/a690: Remove revn and name
      drm/msm/adreno: Fix snapshot BINDLESS_DATA size
      drm/msm: Fix hw_fence error path cleanup
      drm/msm: Disallow submit with fence id 0
      Merge branch 'msm-fixes' into msm-next
      drm/msm/adreno: Remove GPU name
      drm/msm/adreno: Remove redundant gmem size param
      drm/msm/adreno: Remove redundant revn param
      drm/msm/adreno: Use quirk identify hw_apriv
      drm/msm/adreno: Use quirk to identify cached-coherent support
      drm/msm/adreno: Allow SoC specific gpu device table entries
      drm/msm/adreno: Move speedbin mapping to device table
      drm/msm/adreno: Bring the a630 family together
      drm/msm/adreno: Add adreno family
      drm/msm/adreno: Add helper for formating chip-id
      drm/msm/adreno: Move adreno info to config
      dt-bindings: drm/msm/gpu: Extend bindings for chip-id
      drm/msm/adreno: Switch to chip-id for identifying GPU
      drm/msm/a6xx: Fix misleading comment
      drm/msm/a6xx: Fix GMU lockdep splat
      drm/msm: Disallow relocs on a6xx+
      drm/msm: Take lru lock once per job_run
      drm/msm: Use drm_gem_object in submit bos table
      drm/msm: Take lru lock once per submit_pin_objects()
      drm/msm: Remove vma use tracking
      drm/msm/a690: Switch to a660_gmu.bin
      drm/msm/gpu: Push gpu lock down past runpm

Ruan Jinjie (2):
      drm/msm: Remove redundant DRM_DEV_ERROR()
      drm/msm/adreno: adreno_gpu: Switch to memdup_user_nul() helper

Ryan McCann (6):
      drm/msm: Update dev core dump to not print backwards
      drm/msm/dpu: Drop unused num argument from relevant macros
      drm/msm/dpu: Define names for unnamed sblks
      drm/msm/dpu: Remove redundant prefix/suffix in name of sub-blocks
      drm/msm/dpu: Refactor printing of main blocks in device core dump
      drm/msm/dpu: Update dev core dump to dump registers of sub-blocks

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |  24 +-
 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   6 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |  11 +
 .../devicetree/bindings/display/msm/gpu.yaml       |   6 +
 .../bindings/display/msm/mdss-common.yaml          |   6 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |   5 +-
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     | 213 +++++++++
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |   7 -
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |   7 -
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |   8 +
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     |   8 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  10 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  12 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  48 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 219 ++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  19 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 310 ++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  69 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            | 152 ++++--
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 347 +++++++++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 369 ++++++++++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 434 +++++++++++------
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 473 +++++++++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 223 +++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 453 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 202 +++++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h | 106 +++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 207 ++++++---
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    | 104 +++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 113 +++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 439 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 264 +++++++----
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 511 +++++++++++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 467 +++++++++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 492 ++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 161 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |  48 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 109 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   2 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 251 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  60 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 106 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 112 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  39 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  23 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   3 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   7 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   2 -
 drivers/gpu/drm/msm/msm_drv.c                      |  42 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  10 +-
 drivers/gpu/drm/msm/msm_fence.c                    |   6 +
 drivers/gpu/drm/msm/msm_gem.c                      |  57 +--
 drivers/gpu/drm/msm/msm_gem.h                      |  15 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  95 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c                  |  67 +--
 drivers/gpu/drm/msm/msm_gpu.c                      |  32 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   9 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  99 ++--
 drivers/gpu/drm/msm/msm_mdss.h                     |  27 ++
 drivers/gpu/drm/msm/msm_rd.c                       |   8 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |  15 +-
 88 files changed, 5068 insertions(+), 2890 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.h
