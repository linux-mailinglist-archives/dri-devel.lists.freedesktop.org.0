Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267B44C9880
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 23:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F15C10E71C;
	Tue,  1 Mar 2022 22:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB33E10E6F5;
 Tue,  1 Mar 2022 22:47:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i8so5785962wrr.8;
 Tue, 01 Mar 2022 14:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=tRAbnEjHfwEzLKYKSV6pvAZEjoIgtoPgV+BEr7lIeJE=;
 b=PumHR3UbSakrobWQwovlmSWCUOPrtIEuSVo81K6722h6dnTpQF46odbGDDg6OMnmWz
 q6FoV8xqK2KIBRA1czFX3Z4I9vfNiY+oj3o94zqBU+5828z7hMkIWcG5qPbZufoLQZBA
 FxzyNDZs4h5yqbicDYu/v39zW/nnOLt0m8buldkSEcVzuI7zreliszrEJ8g7xZAO1+d/
 UjoqcNymX/NV9fNB22G9o+svJOf5OtW0mV1xSw/BPb1TpQcocIszheUDTTKkO95BiukJ
 1BIUiFGFgtLSEbKHsowOB9xWt/2DHb8OgXeLJLAo5Sf2RJUTWZv7WgMLModF7WbWLwF1
 UKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=tRAbnEjHfwEzLKYKSV6pvAZEjoIgtoPgV+BEr7lIeJE=;
 b=5IKm398kKzIK7pmbfx8X1U8OUw6pf664D7o9VDCJYTYq/e12Ua+KKpeI13qNHczfCN
 eyGIVHHBINf7rlg/c6cvfN35K4mZs9RdfjOHFp2RM2OUaXqHf5L0XLHjo0Azef/15LGt
 Q/B22wZn69gfqyCK4gEztNjoZuMx6UEMJ/Pi1Kpe2ktDu0m8cc1oLyzqMGulLwUUbYZs
 l65aIxsxxIrIod2Oju64CAD0sPjD+GtuG7WTN+WR4LS5CBMuYGcLY4dQUk6QckmMXja0
 BH70xIyE3Oj83gb5+fSbAIkCXZFPUsjkmhch0KkxqR147jxhZb8r1+yntXwRwa6kOIQ+
 Hkqg==
X-Gm-Message-State: AOAM530yhwqVBhRs32z2dmoAV3AXFyEa9sDsj/aKUGPJqYAkFgyKaRGP
 /sPcuZI26S5X9dDUrecY+sa1GQGNbIgg5AAewYk=
X-Google-Smtp-Source: ABdhPJygfYh7mjQwKgsnUTRLhIqde0QEc1RiN0mALoCMzkIP5U3+7a7Dk8fb7LmEFAI594FP3pqN+su7GHned3MO0/k=
X-Received: by 2002:a5d:5382:0:b0:1f0:2f64:5a5a with SMTP id
 d2-20020a5d5382000000b001f02f645a5amr173725wrv.418.1646174875237; Tue, 01 Mar
 2022 14:47:55 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Mar 2022 14:48:25 -0800
Message-ID: <CAF6AEGu=Jdrw6DqYOYPTMks7=zatrsvdR=o6DpjqZ=TQQhFZuw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2022-03-01 for 5.18
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

Hi Dave & Daniel,

This is the main pull for v5.18.

We're experimenting a bit with the process this time, with Dmitry
collecting display patches and merging them into msm-next with me
handling the gpu/etc side of things.  Summary of interesting new bits
and pieces

* dpu + dp support for sc8180x
* dp support for sm8350
* dpu + dsi support for qcm2290
* 10nm dsi phy tuning support
* bridge support for dp encoder
* gpu support for additional 7c3 SKUs
* assorted cleanups and fixes

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2022-03-01

for you to fetch changes up to afab9d91d872819f98a792c32c302d9e3261f1a1:

  drm/msm/adreno: Expose speedbin to userspace (2022-02-25 13:29:57 -0800)

----------------------------------------------------------------
Akhil P Oommen (4):
      drm/msm: Use generic name for gpu resources
      drm/msm/adreno: Generate name from chipid for 7c3
      drm/msm/a6xx: Add support for 7c3 SKUs
      drm/msm/adreno: Expose speedbin to userspace

AngeloGioacchino Del Regno (5):
      drm/msm/dpu1: Add DMA2, DMA3 clock control to enum
      drm/msm/dpu1: Add MSM8998 to hw catalog
      dt-bindings: display: msm: Add binding for msm8998 dpu
      drm/msm/dpu: Add a function to retrieve the current CTL status
      drm/msm/dpu: Fix timeout issues on command mode panels

Bjorn Andersson (5):
      drm/msm/dp: Move debugfs files into subdirectory
      drm/msm/dp: Add sc8180x DP controllers
      drm/msm/dp: Add DisplayPort controller for SM8350
      drm/msm/dpu: Add INTF_5 interrupts
      drm/msm/dpu: Only create debugfs for PRIMARY minor

Changcheng Deng (1):
      drm/msm: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE

Christophe JAILLET (1):
      drm/msm/dp: Simplify dp_debug_init() and dp_debug_get()

Daniel Thompson (2):
      drm/msm/dsi: Remove spurious IRQF_ONESHOT flag
      drm/msm/hdmi: Remove spurious IRQF_ONESHOT flag

Dmitry Baryshkov (27):
      drm/msm: drop register logging support
      drm/msm: drop dbgname argument from msm_ioremap*()
      drm/msm: move msm_readl/_writel to msm_drv.h
      drm/msm: reduce usage of round_pixclk callback
      drm/msm: move utility functions from msm_drv.c
      drm/msm/dsi: move DSI host powerup to modeset time
      drm/msm/dsi/phy: fix 7nm v4.0 settings for C-PHY mode
      drm/msm/dpu: drop unused lm_max_width from RM
      drm/msm/dpu: add DSPP blocks teardown
      drm/msm/dpu: get INTF blocks directly rather than through RM
      drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
      drm/msm/dpu: fix error handling in dpu_rm_init
      drm/msm/dpu: drop unused access macros
      drm/msm/dpu: fix dp audio condition
      drm/msm: move struct msm_display_info to dpu driver
      drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
      drm/msm/dpu: drop bus_scaling_client field
      drm/msm/dpu: encoder: drop unused mode_fixup callback
      drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
      drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt
      drm/msm/dpu: simplify clocks handling
      drm/msm/dp: fix panel bridge attachment
      drm/msm/dp: support attaching bridges to the DP encoder
      drm/msm/dp: support finding next bridge even for DP interfaces
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi' and
'msm-next-lumag-mdp5' into msm-next-lumag
      drm/msm/dpu: wire up MSM8998's DSPP blocks
      Merge branches 'msm-next-lumag-dpu' and 'msm-next-lumag-dsi'
into msm-next-lumag

Kuogee Hsieh (8):
      drm/msm/dp: do not initialize phy until plugin interrupt received
      drm/msm/dp: populate connector of struct dp_panel
      drm/msm/dp: add support of tps4 (training pattern 4) for HBR3
      drm/msm/dp: stop link training after link training 2 failed
      drm/msm/dp: always add fail-safe mode into connector mode list
      drm/msm/dp: add connector type to enhance debug messages
      drm/msm/dp: enhance debug info related to dp phy
      drm/msm: populate intf_audio_select() base on hardware capability

Loic Poulain (5):
      drm/msm/dsi: Allow to specify dsi config as pdata
      drm/msm/dsi: Add support for qcm2290 dsi controller
      dt-bindings: msm/dsi: Add qcm2290 dsi controller binding
      drm/msm: add support for QCM2290 MDSS
      dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings

Marijn Suijten (1):
      drm/msm/dsi: Use "ref" fw clock instead of global name for VCO parent

Rajeev Nandan (3):
      dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
      drm/msm/dsi: Add dsi phy tuning configuration support
      drm/msm/dsi: Add 10nm dsi phy tuning configuration support

Rob Clark (5):
      drm/msm/rd: Add chip-id
      drm/msm/dpu: Add SC8180x to hw catalog
      drm/msm/gpu: Add ctx to get_param()
      drm/msm/gpu: Track global faults per address-space
      drm/msm: Avoid dirtyfb stalls on video mode displays (v2)

Vinod Koul (3):
      drm/msm/dpu: Remove set but unused variables
      drm/msm/dpu: Update the comment style
      drm/msm/dpu: Update function parameter documentation

Yang Li (1):
      drm/msm/dpu: clean up some inconsistent indenting

Yury Norov (1):
      drm: replace bitmap_weight with bitmap_empty where appropriate

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dpu-msm8998.yaml          | 219 ++++++++
 .../bindings/display/msm/dpu-qcm2290.yaml          | 214 ++++++++
 .../bindings/display/msm/dsi-controller-main.yaml  |   5 +-
 .../bindings/display/msm/dsi-phy-10nm.yaml         |  36 ++
 drivers/gpu/drm/msm/Kconfig                        |   9 -
 drivers/gpu/drm/msm/Makefile                       |   3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  20 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   1 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  41 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 100 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  28 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  19 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  39 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  36 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 610 ++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  11 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  68 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |  28 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 107 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  19 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |  19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   8 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   9 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |   5 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  21 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  12 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   2 +-
 .../{disp/dpu1/dpu_io_util.c => dp/dp_clk_util.c}  |  69 +--
 .../{disp/dpu1/dpu_io_util.h => dp/dp_clk_util.h}  |   8 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 102 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   8 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |  28 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 196 ++++---
 drivers/gpu/drm/msm/dp/dp_display.h                |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  21 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   5 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  38 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |   4 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |   4 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  23 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   3 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   8 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  65 ++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  14 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         | 122 ++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |   4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |   4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  26 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |   7 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  11 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |   7 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c           |   2 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |  15 -
 drivers/gpu/drm/msm/msm_debugfs.c                  |   6 +-
 drivers/gpu/drm/msm/msm_drv.c                      | 160 +-----
 drivers/gpu/drm/msm/msm_drv.h                      |  46 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  41 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   3 +
 drivers/gpu/drm/msm/msm_gpu.c                      |  14 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   8 +-
 drivers/gpu/drm/msm/msm_io_utils.c                 | 126 +++++
 drivers/gpu/drm/msm/msm_rd.c                       |   8 +-
 82 files changed, 2045 insertions(+), 990 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
 rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.c => dp/dp_clk_util.c} (61%)
 rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.h => dp/dp_clk_util.h} (85%)
 create mode 100644 drivers/gpu/drm/msm/msm_io_utils.c
