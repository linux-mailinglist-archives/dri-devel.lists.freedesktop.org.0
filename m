Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35886D2C9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BEF10E025;
	Thu, 29 Feb 2024 19:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D1Jc87dc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D2A10E2E4;
 Thu, 29 Feb 2024 19:04:26 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so2217042a12.0; 
 Thu, 29 Feb 2024 11:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709233464; x=1709838264; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KWwAZvpnT5+ns/RMvzJ7c2qNwHLP/sFjRfM8JEPwsYs=;
 b=D1Jc87dc+bzHw+nat7AUfsBVuOp7TvxlViyzdTxzj1K+FptWBwsGQEFYtp5BtmiKX7
 CdWBu5OADp771HWkMaOU+qAuNMZtjOsxigcEHf36EeUFGTNQSZp5etr0cbP7UgsFNj56
 sJ2gAqzxtKowy66LImR2g+aoKkOPAZhr4fAKXt5PRVeyWp+CWmXqKwGgOhIcaAq0n5jb
 5qIIMaEfPK+f07+YzCsxuUElGT2uOjWBzybFS+Ugq9MTXV9KOIDcYksEn1NpWVulR4J0
 sb/JMDNomjpZMk4p2wrc2oMMxhgEk7j3ANSYMLh8xVdTx+a7l58/JJbyKximGbgbrVMI
 ATTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709233464; x=1709838264;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KWwAZvpnT5+ns/RMvzJ7c2qNwHLP/sFjRfM8JEPwsYs=;
 b=tyHONHhOdNYVCEYwmO6lsDDApht5/VV6v5lUSLiQrE0+TWtZIzW8YSoU7OP2n6zzEw
 CPUM45d7BLn/3wsWgcryOqWDmWWrZH587DeIeK0JB1jTCBBdwbXmnArmwI7ClANDCu1F
 RWJsetqVCvXIVUSA59WKLQ7vP8RedMwPXJERj9ehHYHkBa6KdZ22iuC/qlwzRrpWgU0t
 /gs0W25Xc0sGHH8u/co5DLCwR5S82inyiHb5gPsE0wIO6lDrwM+MRK+WJY6CySb21+pQ
 zw8VdeDD11/IHubGb+grRuSC9yXOGAnaUDVIVXeaxA7v5p9+GvYl1s0LKsr9zO0lG62p
 tAXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjStiiNHUHbwoIm4CjFmCXr8uor4bnyNU0WhfYDB8StPoV0uL8rz8oHFSg1pO1qhRFQAGktkzGIAZxowOgboOaMuB9+m1CeVFh0EmXExIPm2kAZoRtF6RFrWZcbStxT5HH1lIQhkffDj8C/lEMqQb5
X-Gm-Message-State: AOJu0YxZhszr9CxxeuKV8/1telQnYWJ86sZTXa/pAS5W6ksZIbrXh+YD
 nSSAHIvjLPtlCM9RNF802f/SwWfHpJKfcwQ2OjmJvMdMRL10jBS744pv8WnGolW/V9/p1qliZXO
 Ja1Svum2G74opGquhLz7+nWc8QM8=
X-Google-Smtp-Source: AGHT+IG/pWDf8rBO9F3YSp7OJq3o7H8n4FGqsUPHesR0Dcu7f41p+BdQ9BScVSPlgwihUon0LZow/lEzA+Cd0DmtWAI=
X-Received: by 2002:a05:6402:2226:b0:566:4624:b11b with SMTP id
 cr6-20020a056402222600b005664624b11bmr2045347edb.19.1709233463984; Thu, 29
 Feb 2024 11:04:23 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Feb 2024 11:04:10 -0800
Message-ID: <CAF6AEGtCq=CObbqKNOswWZdPw5dL8jq8BxD_hxP7kOCePUwNrg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-02-29 for v6.9
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Hi Dave,

This is the main pull for v6.9, description below.

We may have a second smaller pull next week for CDM support, which
depends on a patch in drm-misc-next which was just recently tagged.

The following changes since commit 41c177cf354126a22443b5c80cec9fdd313e67e1:

  Merge tag 'drm-misc-next-2024-02-08' into msm-next (2024-02-11 12:34:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-02-29

for you to fetch changes up to 18397519cb62248865ca33266a483dbcf7d08b5f:

  drm/msm/adreno: Add A702 support (2024-02-26 07:29:55 -0800)

----------------------------------------------------------------
Updates for v6.9:

Core:
- Correct bindings for MSM8976 and SM8650 platforms
- Start migration of MDP5 platforms to DPU driver
- X1E80100 MDSS support

DPU:
- Improve DSC allocation, fixing several important corner cases
- Add support for SDM630/SDM660 platforms
- Simplify dpu_encoder_phys_ops
- Apply fixes targeting DSC support with a single DSC encoder
- Apply fixes for HCTL_EN timing configuration
- X1E80100 support

DP:
- Refactor parser and power submodules

DSI:
- Clean up obsolete set_split_display support
- Update DSC documentation

MDP5:
- Clean up obsolete set_split_display support

GPU:
- fix sc7180 UBWC config
- fix a7xx LLC config
- new gpu support: a305B, a750, a702
- machine support: SM7150 (different power levels than other a618)
- a7xx devcoredump support

----------------------------------------------------------------
Abel Vesa (4):
      dt-bindings: display/msm: Document the DPU for X1E80100
      dt-bindings: display/msm: Document MDSS on X1E80100
      drm/msm: mdss: Add X1E80100 support
      drm/msm/dpu: Add X1E80100 support

Abhinav Kumar (1):
      drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN

Adam Skladowski (2):
      dt-bindings: dsi-controller-main: Document missing msm8976 compatible
      dt-bindings: msm: qcom, mdss: Include ommited fam-b compatible

Colin Ian King (1):
      drm/msm/dp: Fix spelling mistake "enale" -> "enable"

Connor Abbott (4):
      drm/msm: Import a7xx crashdump register lists from kgsl
      drm/msm: Fix snapshotting a7xx indexed regs
      drm/msm: More fully implement devcoredump for a7xx
      drm/msm: Fix page fault client detection on a660 family and a7xx

Danila Tikhonov (1):
      drm/msm/adreno: Add support for SM7150 SoC machine

Dmitry Baryshkov (35):
      drm/msm/dsi: do not store internal bridge pointer
      drm/msm/dsi: drop msm_dsi_device_connected() function
      drm/msm/dsi: stop calling set_split_display
      drm/msm/dsi: remove msm_dsi::encoder
      drm/msm/mdp5: drop split display support
      drm/msm/dp: drop unused parser definitions
      drm/msm/dp: drop unused fields from dp_power_private
      drm/msm/dp: parse DT from dp_parser_get
      drm/msm/dp: inline dp_power_(de)init
      drm/msm/dp: fold dp_power into dp_ctrl module
      drm/msm/dp: simplify stream clocks handling
      drm/msm/dp: stop parsing clock names from DT
      drm/msm/dp: split dp_ctrl_clk_enable into four functuions
      drm/msm/dp: move phy_configure_opts to dp_ctrl
      drm/msm/dp: remove PHY handling from dp_catalog.c
      drm/msm/dp: handle PHY directly in dp_ctrl
      drm/msm/dp: move all IO handling to dp_catalog
      drm/msm/dp: move link property handling to dp_panel
      drm/msm/dp: move next_bridge handling to dp_display
      drm/msm/dp: drop dp_parser
      drm/msm/dpu: split irq_control into irq_enable and _disable
      drm/msm/dpu: split _dpu_encoder_resource_control_helper()
      drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
      drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
      drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()
      drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations
      drm/msm/mdss: generate MDSS data for MDP5 platforms
      drm/msm/dpu: support binding to the mdp5 devices
      drm/msm: add a kernel param to select between MDP5 and DPU drivers
      drm/msm/dpu: add support for SDM660 and SDM630 platforms
      drm/msm/dpu: finalise global state object
      drm/msm/dpu: drop global_state_lock
      drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
      drm/msm/mdp5: drop global_state_lock
      drm/msm/a6xx: specify UBWC config for sc7180

Konrad Dybcio (1):
      drm/msm/adreno: Add A702 support

Kuogee Hsieh (2):
      drm/msm/dpu: improve DSC allocation
      drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()

Luca Weiss (2):
      dt-bindings: display/msm: gpu: Allow multiple digits for patchid
      drm/msm/adreno: Add A305B support

Marijn Suijten (2):
      drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header function
      drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge is enabled

Neil Armstrong (4):
      dt-bindings: display/msm/gmu: Document Adreno 750 GMU
      dt-bindings: arm-smmu: fix SM8[45]50 GPU SMMU if condition
      dt-bindings: arm-smmu: Document SM8650 GPU SMMU
      drm/msm: add support for A750 GPU

Rob Clark (2):
      drm/msm/adreno: Update generated headers
      drm/msm/a7xx: Fix LLC typo

Rob Herring (1):
      dt-bindings: display: msm: sm8650-mdss: Add missing explicit
"additionalProperties"

 .../bindings/display/msm/dsi-controller-main.yaml  |    2 +
 .../devicetree/bindings/display/msm/gmu.yaml       |    1 +
 .../devicetree/bindings/display/msm/gpu.yaml       |    6 +-
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |    1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |    4 +-
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     |    4 +
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  251 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   17 +-
 drivers/gpu/drm/msm/Makefile                       |    2 -
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |   73 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  131 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   13 +-
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  182 +-
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  666 +--
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 5275 ++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |  179 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  220 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  727 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  311 +-
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |  260 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   69 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  928 ++++
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  753 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   31 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  573 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  291 ++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  225 +
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  449 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  105 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   15 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   95 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   60 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   88 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  127 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  154 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   74 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   61 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |    3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |   42 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |   42 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c           |    2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   71 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |   10 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h           |    4 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |    9 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |    2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  156 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |    6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  358 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   17 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |    3 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  102 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |    3 +-
 drivers/gpu/drm/msm/dp/dp_link.h                   |   23 -
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   66 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  327 --
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  155 -
 drivers/gpu/drm/msm/dp/dp_power.c                  |  183 -
 drivers/gpu/drm/msm/dp/dp_power.h                  |   95 -
 drivers/gpu/drm/msm/dsi/dsi.c                      |   10 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   22 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   51 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   65 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   33 +
 drivers/gpu/drm/msm/msm_drv.h                      |    4 +
 drivers/gpu/drm/msm/msm_io_utils.c                 |   13 +
 drivers/gpu/drm/msm/msm_kms.h                      |    4 -
 drivers/gpu/drm/msm/msm_mdss.c                     |   64 +
 76 files changed, 10947 insertions(+), 3472 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
