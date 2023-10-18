Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECDE7CE01D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 16:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D1A10E056;
	Wed, 18 Oct 2023 14:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B5010E056;
 Wed, 18 Oct 2023 14:37:02 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53f6ccea1eeso940110a12.3; 
 Wed, 18 Oct 2023 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697639821; x=1698244621; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NS60nIOiN9GfZpNsk0n5yzuUa2VDvpH7EI+4nT3Nsv0=;
 b=bURc0tU6HJWt43t5o3ZWrDSUBP1spRwy8xLyQGzQ/kjcQzogjpYvl+QEEC/C4jEbLJ
 jQ+t8NaH8wL22REx2Ee8qIy1bNFQAPqG5RTzZumaGZ0WVInRsQyVZ/y6taeIL1GtEomH
 6bCmAZgl6slEB2k4SukDwo91GwW91o3hZqYZ9r5y1tJazHwCN3xZiel1k7ZoHbHdBSez
 ou1RISbWycBvl6/CPSVm0ukhBX4vReM/l0mvxcUmgC8Ft80LkO1/2O/RrGZ+a/dtT+fO
 Tyi7dHX5WFCf10N3IAYH9drLZN5U/9Sue/aOew9KhQT2fmVZyIjY3YoVKKrC0mJmZV/D
 +fMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697639821; x=1698244621;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NS60nIOiN9GfZpNsk0n5yzuUa2VDvpH7EI+4nT3Nsv0=;
 b=ftETMvXml/pex3QEkRXzClaw3paiplfgDknMvX+IwMhFMBbaEv7/W8v9QCuyI8viSo
 BsoFzbjzUL3cFy2eYqJ8i9GjjBe4IooZrI9OC4jO8nwN4bnnplEtXIhzsTlcqc6lXTdf
 BD5KSDzOaal4Kf32cVVh02t3ImTv7cJrlEtIPMWL8l9GYEubiKgqi1i3Iia6fwSX5tg5
 i9QCxTRP0rs9Cvli7zcZYvU423/OdBUvHyhCdFk60p8XVyKxd2kCpqV24PEegVh8jeDA
 T0AlVacaIWQ6X0rLDkcCREc4gsqZcO9OXL0bwD6eEGvqlTPk30OnjszA9YHrhzZ7HXob
 H2wg==
X-Gm-Message-State: AOJu0YxA+wMCAjzwQSGdGTq9eiHyCnNEUltdPJKbAyDzVAclYDN8VP9k
 wj6ea4dFzDp9KHzsHBsxSWn9cH6NEe5a3hbd14c=
X-Google-Smtp-Source: AGHT+IFg4QmQsZg827J15yE6As8kfndn0jMBjCZ91aVuZCu6BfOr0J0ixIjAO5PdYQF6endT+4qNC5nwcp4+IipjGXI=
X-Received: by 2002:a05:6402:350b:b0:53d:b839:203f with SMTP id
 b11-20020a056402350b00b0053db839203fmr4296043edd.29.1697639820396; Wed, 18
 Oct 2023 07:37:00 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 18 Oct 2023 07:36:48 -0700
Message-ID: <CAF6AEGvzkBL2_OgyOeP_b6rVEjrNdfm8jcKzaB04HqHyT5jYwA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2023-10-17 for v6.7 (resend)
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
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

(resend as I missed dri-devel@ the first time)

This is the pull for v6.7, see below for description.  There are some
conflicts with drm-next and mm trees.  The resolution in linux-next
looks correct.  Also, just in case, I've pushed the drm-next merge
resolution to msm-next-merge-resolution branch in the same tree.  (And
can do the same for mm if needed.)  Ping me if any questions.


The following changes since commit 10f20628c9b8e924b8046e63b36b2cea4d2c85e4:

  drm/msm/dpu: fail dpu_plane_atomic_check() based on mdp clk limits
(2023-10-05 10:18:10 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-10-17

for you to fetch changes up to b08d26dac1a1075c874f40ee02ec8ddc39e20146:

  drm/msm/a7xx: actually use a7xx state registers (2023-10-16 09:38:56 -0700)

----------------------------------------------------------------
Updates for v6.7

DP:
- use existing helpers for DPCD handling instead of open-coded functions
- set the subconnector type according to the plugged cable / dongle
  skip validity check for DP CTS EDID checksum

DPU:
- continued migration of feature flags to use core revision checks
- reworked interrupts code to use '0' as NO_IRQ, removed raw IRQ indices
  from log / trace output

gpu:
- a7xx support (a730, a740)
- fixes and additional speedbins for a635, a643

core:
- decouple msm_drv from kms to more cleanly support headless devices (like
  imx5+a2xx)

----------------------------------------------------------------
Dmitry Baryshkov (40):
      drm/msm/dpu: remove irq_idx argument from IRQ callbacks
      drm/msm/dpu: extract dpu_core_irq_is_valid() helper
      drm/msm/dpu: add helper to get IRQ-related data
      drm/msm/dpu: make the irq table size static
      drm/msm/dpu: stop using raw IRQ indices in the kernel output
      drm/msm/dpu: stop using raw IRQ indices in the kernel traces
      drm/msm/dpu: shift IRQ indices by 1
      drm/msm/dpu: inline _setup_pingpong_ops()
      drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
      drm/msm/dpu: drop the DPU_PINGPONG_TE flag
      drm/msm/dpu: inline _setup_intf_ops()
      drm/msm/dpu: enable INTF TE operations only when supported by HW
      drm/msm/dpu: drop DPU_INTF_TE feature flag
      drm/msm/dpu: drop useless check from dpu_encoder_phys_cmd_te_rd_ptr_irq()
      drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
      drm/msm/dp: support setting the DP subconnector type
      drm/msm: allow passing struct msm_kms to msm_drv_probe()
      drm/msm/dpu: move resource allocation to the _probe function
      drm/msm/mdp4: move resource allocation to the _probe function
      drm/msm/mdp5: move resource allocation to the _probe function
      drm/msm/dsi: switch to devm_drm_bridge_add()
      drm/msm/hdmi: switch to devm_drm_bridge_add()
      drm/msm/dp: move pdev from struct dp_display_private to struct msm_dp
      drm/msm/dp: switch to devm_drm_bridge_add()
      drm/msm: remove msm_drm_private::bridges field
      drm/msm: drop pm ops from the headless msm driver
      drm/msm: rename msm_pm_prepare/complete to note the KMS nature
      drm/msm: remove shutdown callback from msm_platform_driver
      drm/msm: rename msm_drv_shutdown() to msm_kms_shutdown()
      drm/msm: switch to drmm_mode_config_init()
      drm/msm: only register 'kms' debug file if KMS is used
      drm/msm: make fb debugfs file available only in KMS case
      drm/msm: carve out KMS code from msm_drv.c
      drm/msm: fix fault injection support
      drm/msm/dsi: use correct lifetime device for devm_drm_bridge_add
      drm/msm/hdmi: use correct lifetime device for devm_drm_bridge_add
      drm/msm/dp: use correct lifetime device for devm_drm_bridge_add
      drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
      drm/msm/dsi: free TX buffer in unbind
      drm/msm/a7xx: actually use a7xx state registers

Jani Nikula (1):
      drm/msm/dp: skip validity check for DP CTS EDID checksum

Jessica Zhang (4):
      drm/msm/dpu: Move setting of dpu_enc::wide_bus_en to atomic enable()
      drm/msm/dpu: Enable widebus for DSI INTF
      drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit
      drm/msm/dsi: Enable widebus for DSI

Konrad Dybcio (15):
      dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
      dt-bindings: display/msm/gmu: Allow passing QMP handle
      dt-bindings: display/msm/gpu: Allow A7xx SKUs
      drm/msm/a6xx: Add missing regs for A7XX
      drm/msm/a6xx: Add skeleton A7xx support
      drm/msm/a6xx: Send ACD state to QMP at GMU resume
      drm/msm/a6xx: Mostly implement A7xx gpu_state
      drm/msm/a6xx: Add A730 support
      drm/msm/a6xx: Add A740 support
      drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
      drm/msm/adreno: Fix SM6375 GPU ID
      drm/msm/a6xx: Fix unknown speedbin case
      drm/msm/adreno: Add ZAP firmware name to A635
      drm/msm/adreno: Add A635 speedbin 0xac (A643)
      drm/msm/a6xx: Fix up QMP handling

Neil Armstrong (5):
      drm/msm/dpu: create a dpu_hw_clk_force_ctrl() helper
      drm/msm/dpu: add setup_clk_force_ctrl() op to sspp & wb
      drm/msm/dpu: move setup_force_clk_ctrl handling into plane and wb
      drm/msm/dpu: sm8550: remove unused VIG and DMA clock controls entries
      drm/msm/dpu: enable writeback on SM8550

Rob Herring (2):
      dt-bindings: display: msm: Add missing unevaluatedProperties on
child node schemas
      dt-bindings: display: msm: Make "additionalProperties: true" explicit

Ruan Jinjie (1):
      drm/msm: Remove unnecessary NULL values

Stephen Boyd (9):
      drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
      drm/msm/dp: Use drm_dp_read_sink_count() helper
      drm/msm/dp: Remove dead code related to downstream cap info
      drm/msm/dp: Remove aux_cfg_update_done and related code
      drm/msm/dp: Simplify with drm_dp_{max_link_rate, max_lane_count}()
      drm/msm/dp: Inline dp_link_parse_sink_count()
      drm/msm/dp: Remove dp_display_is_ds_bridge()
      drm/msm/dp: Inline dp_display_is_sink_count_zero()
      drm/msm/dp: Remove error message when downstream port not connected

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../devicetree/bindings/display/msm/gmu.yaml       |  47 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   4 +-
 .../bindings/display/msm/qcom,msm8998-mdss.yaml    |   6 +
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |   6 +
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |   8 +
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  10 +
 .../bindings/display/msm/qcom,sc8280xp-mdss.yaml   |   4 +
 .../bindings/display/msm/qcom,sdm845-mdss.yaml     |   8 +
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm8150-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |   8 +
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |   8 +
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     |   8 +
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   9 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 209 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 655 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  69 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  65 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  88 +++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  34 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   7 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  32 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   8 -
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  10 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   8 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   3 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   8 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   6 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  13 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  12 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  48 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  55 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  62 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  53 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 160 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  58 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  41 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  21 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 139 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  72 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |   4 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           | 112 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           | 106 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  60 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  21 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   2 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  38 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  | 130 +---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  11 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |  34 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   5 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  47 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  30 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  22 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |   5 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  30 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |   3 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |  12 +-
 drivers/gpu/drm/msm/msm_drv.c                      | 365 +-----------
 drivers/gpu/drm/msm/msm_drv.h                      |  17 +-
 drivers/gpu/drm/msm/msm_kms.c                      | 345 +++++++++++
 drivers/gpu/drm/msm/msm_kms.h                      |   3 +
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   2 +
 99 files changed, 2365 insertions(+), 1403 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_kms.c
