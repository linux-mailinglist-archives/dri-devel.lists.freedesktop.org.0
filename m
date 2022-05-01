Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8945168E6
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 01:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C76F10E199;
	Sun,  1 May 2022 23:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F80F10E15D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 23:41:42 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id 17so16662867lji.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 16:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5G8UdbgTD1WhbneLtbh0lbi+G+3Bg15+rMWZ4aDfeKw=;
 b=tpt4l2rjf2EePSi002hsmwDNryJQZKEmjQyaiM2iF/K+ZN+8xzZiIGyP6IGGYzlHey
 3GhywknXA7hUku263WwuPQ2bEE8X2f9rdARBZL+jl76usYu5BJ1YrP11Rv8LSetrvzTX
 cazn6eu0ky12eKX1QpSME+sD6xMVEsQSBr67r1lsMZ11PnLrv1TSaDzqpw0/uxl8Q+z9
 QqXvbXLQJMbZUqE51hV40wZ/tlyDZ0Gzj4jC2yysJZI9QCU81cCQih0lkWlxaGSbMA17
 qP/oTkrUHvoXYAzW4P+aYjJU0rZyy446Vnq0/QRXEael1NPz+o8he4bUzSHdKaDw4v8I
 QpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5G8UdbgTD1WhbneLtbh0lbi+G+3Bg15+rMWZ4aDfeKw=;
 b=Qm2Ef7CTVgKgyq78knNbJSDxDnFrVRPk4eSlrJ5SZfF5mLj1pdYMN79yHCeKZIa/Ja
 IBM/LSTOgn1zUaQZEhhAtVJk6RBcg+0cCorowI592HOQdCExy+F7rvoHpPDzHChJjtV0
 GLbVK4zKog+PEjuBrjfdSunhgRbcLi3yPPJ5tw1ZVHeQoC52IRzw5jzcgEVwoS9R1STG
 dIa3Nlz3jM1sFBR+oFCk4AnKDU7Wal4phEAo6X3CMtzdYx+Y/+jucubLhAr18he8gvyG
 38R1Ybb0bO2glnfdVgNNPC3jBB8FJlCmYuSZapPv1vELmAR3blStQVI7At6tnSTdGAfZ
 09jA==
X-Gm-Message-State: AOAM530PiJ6hNaIDKw71c1ZxlwUFzjmikYchOlr4XSAOrFsU29ZeWEp7
 nPAnm548XaYaVGJJMgn015aTEA==
X-Google-Smtp-Source: ABdhPJw8OzdedlkrgxzWZAUGvDnchfVT0TXtAGRZCG0c30AF3kpDssqwFPZa8NTf/9MCV0NooRdjPw==
X-Received: by 2002:a2e:4949:0:b0:24f:2784:877a with SMTP id
 b9-20020a2e4949000000b0024f2784877amr6340030ljd.529.1651448500809; 
 Sun, 01 May 2022 16:41:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 w5-20020ac254a5000000b0047255d210f0sm554209lfk.31.2022.05.01.16.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 16:41:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PULL v3] drm/msm: display pull request for 5.19
Date: Mon,  2 May 2022 02:41:39 +0300
Message-Id: <20220501234139.13513-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

This is a pull request over the patches accumulated, reviewed and tested for
the 5.19 merge window. This pull request contains following changes:

 - DPU: DSC (Display Stream Compression) support
 - DPU: inline rotation support on SC7280
 - DPU: update DP timings to follow vendor recommendations
 - DP, DPU: add support for wide bus (on newer chipsets)
 - DP: eDP support
 - Merge DPU1 and MDP5 MDSS driver, make dpu/mdp device the master
   component
 - MDSS: optionally reset the IP block at the bootup to drop
   bootloader state
 - Properly register and unregister internal bridges in the DRM framework
 - Complete DPU IRQ cleanup
 - DP: conversion to use drm_bridge and drm_bridge_connector
 - eDP: drop old eDP parts again
 - Misc small fixes

This pull request incorporates both patches from first and second pull
requests. It was flattened to ease fixing the Fixes tags issues reported by
Stephen Rothwell.

The following changes since commit 78f815c1cf8fc5f05dc5cec29eb1895cb53470e9:

  drm/msm: return the average load over the polling period (2022-04-21 15:05:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to f1fc2b87de4719cfa8e193e0746cc524dd9f7472:

  drm/msm: drop old eDP block support (again) (2022-05-02 02:39:35 +0300)

----------------------------------------------------------------
Abhinav Kumar (21):
      drm/msm: remove unused hotplug and edid macros from msm_drv.h
      drm: allow passing possible_crtcs to drm_writeback_connector_init()
      drm: introduce drm_writeback_connector_init_with_encoder() API
      drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog
      drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl
      drm/msm/dpu: rename dpu_hw_pipe_cdp_cfg to dpu_hw_cdp_cfg
      drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks
      drm/msm/dpu: add writeback blocks to DPU RM
      drm/msm/dpu: add changes to support writeback in hw_ctl
      drm/msm/dpu: add an API to reset the encoder related hw blocks
      drm/msm/dpu: make changes to dpu_encoder to support virtual encoder
      drm/msm/dpu: add encoder operations to prepare/cleanup wb job
      drm/msm/dpu: move _dpu_plane_get_qos_lut to dpu_hw_util file
      drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback
      drm/msm/dpu: add the writeback connector layer
      drm/msm/dpu: initialize dpu encoder and connector for writeback
      drm/msm/dpu: gracefully handle null fb commits for writeback
      drm/msm/dpu: add writeback blocks to the display snapshot
      drm/msm/dpu: add wb_idx to existing DRM prints in dpu_encoder
      drm/msm/dpu: add wb_idx to DRM traces in dpu_encoder
      drm/msm/dpu: remove unused refcount for encoder_phys_wb

Bjorn Andersson (2):
      dt-bindings: display: msm: Add optional resets
      drm/msm/dpu: Issue MDSS reset during initialization

Dmitry Baryshkov (32):
      drm/msm: unify MDSS drivers
      drm/msm: remove extra indirection for msm_mdss
      drm/msm: split the main platform driver
      drm/msm: stop using device's match data pointer
      drm/msm: allow compile time selection of driver components
      drm/msm: make mdp5/dpu devices master components
      drm/msm: properly add and remove internal bridges
      drm/msm/dpu: remove manual destruction of DRM objects
      drm/msm: loop over encoders using drm_for_each_encoder()
      drm/msm: don't store created planes, connectors and encoders
      drm/msm: remove unused plane_property field from msm_drm_private
      drm/msm/dpu: don't use merge_3d if DSC merge topology is used
      drm/msm/dpu: remove extra wrappers around dpu_core_irq
      drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
      drm/msm/dpu: allow just single IRQ callback
      drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
      drm/msm/dpu: remove struct dpu_encoder_irq
      drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()
      drm/msm/dpu: document INTF_EDP/INTF_DP difference
      drm/msm/dpu: drop INTF_TYPE_MAX symbol
      drm/msm/dpu: drop obsolete INTF_EDP comment
      drm/msm/dpu: drop INTF_EDP from interface type conditions
      drm/msm/dp: replace dp_connector with drm_bridge_connector
      drm/msm/dp: remove extra wrappers and public functions
      drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
      drm/msm/dp: simplify dp_connector_get_modes()
      drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
      drm/msm: select DRM_DP_AUX_BUS for the AUX bus support
      drm/msm/dsi: fix error checks and return values for DSI xmit functions
      drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
      drm/msm: add missing include to msm_drv.c
      drm/msm: drop old eDP block support (again)

Guo Zhengkui (1):
      drm/msm: fix returnvar.cocci warning

Haowen Bai (1):
      drm/msm/mdp5: Eliminate useless code

Jessica Zhang (1):
      drm/msm/dpu: Clean up CRC debug logs

Kuogee Hsieh (9):
      drm/msm/dpu: adjust display_v_end for eDP and DP
      drm/msm/dpu: replace BIT(x) with correspond marco define string
      drm/msm/dpu: revise timing engine programming to support widebus feature
      drm/msm/dp: enable widebus feature for display port
      drm/msm/dp: replace DRM_DEBUG_DP marco with drm_dbg_dp
      drm/msm/dp: stop event kernel thread when DP unbind
      drm/msm/dp: tear down main link at unplug handle immediately
      drm/msm/dp: reset DP controller before transmit phy test pattern
      drm/msm/dp: do not stop transmitting phy test pattern during DP phy compliance test

Lv Ruyi (4):
      drm/msm/dpu: fix error check return value of irq_of_parse_and_map()
      drm/msm/dp: fix error check return value of irq_of_parse_and_map()
      drm/msm/hdmi: fix error check return value of irq_of_parse_and_map()
      drm: msm: fix error check return value of irq_of_parse_and_map()

Marijn Suijten (2):
      drm/msm/dpu: Bind pingpong block to intf on active ctls in cmd encoder
      drm/msm/dpu: Use indexed array initializer to prevent mismatches

Sankeerth Billakanti (4):
      drm/msm/dp: Add eDP support via aux_bus
      drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
      drm/msm/dp: wait for hpd high before aux transaction
      drm/msm/dp: Support the eDP modes given by panel

Tom Rix (1):
      drm/msm: change msm_sched_ops from global to static

Vinod Koul (13):
      drm/msm/dsi: add support for dsc data
      drm/msm/dsi: Pass DSC params to drm_panel
      drm/msm/disp/dpu1: Add support for DSC
      drm/msm/disp/dpu1: Add support for DSC in pingpong block
      drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
      drm/msm/disp/dpu1: Add DSC support in hw_ctl
      drm/msm/disp/dpu1: Add support for DSC in encoder
      drm/msm: Add missing num_dspp field documentation
      drm/msm/disp/dpu1: Add support for DSC in topology
      drm/msm/disp/dpu1: Add DSC support in RM
      drm/msm/dsi: add mode valid callback for dsi_mgr
      drm/msm: Update generated headers
      drm/msm/dsi: Add support for DSC configuration

Vinod Polimera (4):
      drm/msm/disp/dpu1: add inline function to validate format support
      drm/msm/disp/dpu1: add inline rotation support for sc7280
      drm/msm/disp/dpu1: set vbif hw config to NULL to avoid use after memory free during pm runtime resume
      drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp table during probe

Yang Yingliang (1):
      drm/msm/hdmi: check return value after calling platform_get_resource_byname()

 .../bindings/display/msm/dpu-qcm2290.yaml          |    4 +
 .../bindings/display/msm/dpu-sc7180.yaml           |    4 +
 .../bindings/display/msm/dpu-sc7280.yaml           |    4 +
 .../bindings/display/msm/dpu-sdm845.yaml           |    4 +
 .../drm/arm/display/komeda/komeda_wb_connector.c   |    4 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |    4 +-
 drivers/gpu/drm/drm_writeback.c                    |   73 +-
 drivers/gpu/drm/msm/Kconfig                        |   51 +-
 drivers/gpu/drm/msm/Makefile                       |   29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |   32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  592 +++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   32 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   97 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  112 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   79 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  754 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |   22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  135 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   95 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   93 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   23 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  215 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   80 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  191 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   62 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   32 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |   25 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   19 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  279 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  115 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  240 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |  260 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  170 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   78 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   93 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   76 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |   31 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |    3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   64 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |    3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   80 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          |  252 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |    2 -
 drivers/gpu/drm/msm/dp/dp_audio.c                  |   50 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |   21 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |    3 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |   98 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |    3 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  166 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |    2 +
 drivers/gpu/drm/msm/dp/dp_debug.c                  |    2 -
 drivers/gpu/drm/msm/dp/dp_display.c                |  429 +++---
 drivers/gpu/drm/msm/dp/dp_display.h                |    7 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  215 +--
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   22 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  103 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   49 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 |   25 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |   14 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  |   25 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    6 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |    3 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   80 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  300 ++++-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   15 +
 drivers/gpu/drm/msm/edp/edp.h                      |   77 --
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1373 --------------------
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |   11 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    3 +
 drivers/gpu/drm/msm/msm_drv.c                      |  265 +---
 drivers/gpu/drm/msm/msm_drv.h                      |  139 +-
 drivers/gpu/drm/msm/msm_kms.h                      |   21 -
 drivers/gpu/drm/msm/msm_mdss.c                     |  416 ++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c               |    2 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |    4 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |    3 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    4 +-
 include/drm/drm_panel.h                            |    7 +
 include/drm/drm_writeback.h                        |   11 +-
 91 files changed, 5122 insertions(+), 3580 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c
