Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D0520295
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 18:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A130310F3A0;
	Mon,  9 May 2022 16:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7EC10F39A;
 Mon,  9 May 2022 16:37:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t6so20274764wra.4;
 Mon, 09 May 2022 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+bnZiEUaGnck9vY3ppSXkTJhyeltgdmZx84yl6FU4A=;
 b=MEQ2cA1nKtgCI3vgw2N2nA2Zs91gGWtSFPl+gTPuCDTSL32nDNQ13i3T1hw/IWhXjE
 0O2q9Uwuxv7wHxettgNBOVlwZvbs17pj9kgO5ABh3ftEmRJHBBSW44FaXq/pY70GxMZB
 TFptHhVVSMbogEyIRt4rd3KE+ju/YG7JKorlhGwnkbxhN2R88PChk0uItPgOltFR06BG
 IRyXekqAHICRKJ/b7OssqjO2/G3bJ+WRXFgHZZMq+u994oSXkAbrBH0e7xS2o6rAJlmi
 FYoii1/jBEUeGLiPQd0ZENUnn8Ksiz2jfisUFioKb5w16ya7mSmRso361PxSZC1XJn8j
 tlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+bnZiEUaGnck9vY3ppSXkTJhyeltgdmZx84yl6FU4A=;
 b=vDwpI1hKNJAF6qrQ0nZKI/8nO/zkdXx3XrtnFkK5sA8VOunTRHMo4vEwFUI63aD1rz
 L85hpbu+QKR8kvG1PDqIYtS1dCVDK0lnWUxfXqX50SIGKsJbgukof5B3AbrAvR9CG4PB
 vGtO4MSXtGC1OCgdOjH3bsOTy26Fah0WQ+RFDF/0rNSJ0HdHER+8agZylJE+9LUnxLe0
 z14Ij5YXTFuk2dAuCKtv8TG34PAFj6oYJ+G/tNtqs8X1NaKAEV0EPDpy5JIXi1+shw/+
 8UuvD5J4/SD0RznJyaPCWum94UkrU/9JfgZrVWSr176wVS8FUSsW6nabPeH1SbkvauaF
 qPGQ==
X-Gm-Message-State: AOAM532pFLUQrr8WUiqF3tPalLJBURvlO8CNFvS1bSl+Wmq5naTgZFGg
 vXKu+jnLOu/UZ6pIHs/R1CfRLUvpiGSpXSRHeiZTiP2oSd0=
X-Google-Smtp-Source: ABdhPJxmkB6VFwNMa/eEHAZ7U7VBtVgFLABfC+SaVxshTG8xF9re9LCzkQILkg9i+UuoESUEiwpMI+NNxrO2Cbucre8=
X-Received: by 2002:a05:6000:719:b0:20c:7894:22e1 with SMTP id
 bs25-20020a056000071900b0020c789422e1mr14779317wrb.93.1652114226771; Mon, 09
 May 2022 09:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGvJCr_1D8d0dgmyQC5HD4gmXeZw=bFV_CNCfceZbpMxRw@mail.gmail.com>
In-Reply-To: <CAF6AEGvJCr_1D8d0dgmyQC5HD4gmXeZw=bFV_CNCfceZbpMxRw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 May 2022 09:36:56 -0700
Message-ID: <CAF6AEGu=yQpwyaPmhAvNB7X1hju2aj-QrVSW8FM0H5GOxu9tSQ@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-next-2022-05-09 for v5.19
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 9, 2022 at 9:02 AM Rob Clark <robdclark@gmail.com> wrote:
>
> Hi Dave & Daniel,
>
> Here is the main drm/msm pull request for v5.19, containing:
>
>  - Fourcc modifier for tiled but not compressed layouts
>  - Support for userspace allocated IOVA (GPU virtual address)
>  - Devfreq clamp_to_idle fix
>  - DPU: DSC (Display Stream Compression) support
>  - DPU: inline rotation support on SC7280
>  - DPU: update DP timings to follow vendor recommendations
>  - DP, DPU: add support for wide bus (on newer chipsets)
>  - DP: eDP support
>  - Merge DPU1 and MDP5 MDSS driver, make dpu/mdp device the master
>    component
>  - MDSS: optionally reset the IP block at the bootup to drop
>    bootloader state
>  - Properly register and unregister internal bridges in the DRM framework
>  - Complete DPU IRQ cleanup
>  - DP: conversion to use drm_bridge and drm_bridge_connector
>  - eDP: drop old eDP parts again

missed:

- DPU: writeback support

Also, there will be a silent merge conflict between

  c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")

and

  da68386d9edb ("drm: Rename dp/ to display/")

which can be resolved by:

--------
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
b/drivers/gpu/drm/msm/dp/dp_display.c
index ed4e26ed20e4..c68d6007c2c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -10,7 +10,7 @@
 #include <linux/component.h>
 #include <linux/of_irq.h>
 #include <linux/delay.h>
-#include <drm/dp/drm_dp_aux_bus.h>
+#include <drm/display/drm_dp_aux_bus.h>

 #include "msm_drv.h"
 #include "msm_kms.h"

--------

See https://lore.kernel.org/all/20220505114311.18e7786f@canb.auug.org.au/

BR,
-R

>  - Misc small fixes
>
> The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:
>
>   Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2022-05-09
>
> for you to fetch changes up to 24df12013853ac59c52cc726e9cbe51e38d09eda:
>
>   MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer (2022-05-07
> 12:02:29 -0700)
>
> ----------------------------------------------------------------
> Abhinav Kumar (22):
>       drm/msm: remove unused hotplug and edid macros from msm_drv.h
>       drm: allow passing possible_crtcs to drm_writeback_connector_init()
>       drm: introduce drm_writeback_connector_init_with_encoder() API
>       drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog
>       drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl
>       drm/msm/dpu: rename dpu_hw_pipe_cdp_cfg to dpu_hw_cdp_cfg
>       drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks
>       drm/msm/dpu: add writeback blocks to DPU RM
>       drm/msm/dpu: add changes to support writeback in hw_ctl
>       drm/msm/dpu: add an API to reset the encoder related hw blocks
>       drm/msm/dpu: make changes to dpu_encoder to support virtual encoder
>       drm/msm/dpu: add encoder operations to prepare/cleanup wb job
>       drm/msm/dpu: move _dpu_plane_get_qos_lut to dpu_hw_util file
>       drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback
>       drm/msm/dpu: add the writeback connector layer
>       drm/msm/dpu: initialize dpu encoder and connector for writeback
>       drm/msm/dpu: gracefully handle null fb commits for writeback
>       drm/msm/dpu: add writeback blocks to the display snapshot
>       drm/msm/dpu: add wb_idx to existing DRM prints in dpu_encoder
>       drm/msm/dpu: add wb_idx to DRM traces in dpu_encoder
>       drm/msm/dpu: remove unused refcount for encoder_phys_wb
>       drm/msm/dpu: add missing break statement for update_pending_flush_wb()
>
> Bjorn Andersson (2):
>       dt-bindings: display: msm: Add optional resets
>       drm/msm/dpu: Issue MDSS reset during initialization
>
> Chia-I Wu (3):
>       drm/msm: remove explicit devfreq status reset
>       drm/msm: simplify gpu_busy callback
>       drm/msm: return the average load over the polling period
>
> Dan Carpenter (1):
>       drm/msm: return an error pointer in msm_gem_prime_get_sg_table()
>
> Dmitry Baryshkov (37):
>       drm/msm: unify MDSS drivers
>       drm/msm: remove extra indirection for msm_mdss
>       drm/msm: split the main platform driver
>       drm/msm: stop using device's match data pointer
>       drm/msm: allow compile time selection of driver components
>       drm/msm: make mdp5/dpu devices master components
>       drm/msm: properly add and remove internal bridges
>       drm/msm/dpu: remove manual destruction of DRM objects
>       drm/msm: loop over encoders using drm_for_each_encoder()
>       drm/msm: don't store created planes, connectors and encoders
>       drm/msm: remove unused plane_property field from msm_drm_private
>       drm/msm/dpu: don't use merge_3d if DSC merge topology is used
>       drm/msm/dpu: remove extra wrappers around dpu_core_irq
>       drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
>       drm/msm/dpu: allow just single IRQ callback
>       drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
>       drm/msm/dpu: remove struct dpu_encoder_irq
>       drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()
>       drm/msm/dpu: document INTF_EDP/INTF_DP difference
>       drm/msm/dpu: drop INTF_TYPE_MAX symbol
>       drm/msm/dpu: drop obsolete INTF_EDP comment
>       drm/msm/dpu: drop INTF_EDP from interface type conditions
>       drm/msm/dp: replace dp_connector with drm_bridge_connector
>       drm/msm/dp: remove extra wrappers and public functions
>       drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
>       drm/msm/dp: simplify dp_connector_get_modes()
>       drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
>       drm/msm: select DRM_DP_AUX_BUS for the AUX bus support
>       drm/msm/dsi: fix error checks and return values for DSI xmit functions
>       drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
>       drm/msm: add missing include to msm_drv.c
>       drm/msm: drop old eDP block support (again)
>       drm/msm/dpu: don't access mode pointer before it is set
>       drm/msm/dsi: fix address for second DSI PHY on SDM660
>       drm/msm/dsi: pll_7nm: remove unsupported dividers for DSI pixel clock
>       drm/msm/dpu: remove NULL-ness check in dpu_hw_intr_destroy
>       MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer
>
> Douglas Anderson (1):
>       drm/msm: Fix shutdown
>
> Guo Zhengkui (1):
>       drm/msm: fix returnvar.cocci warning
>
> Haowen Bai (1):
>       drm/msm/mdp5: Eliminate useless code
>
> Jessica Zhang (3):
>       drm/msm/dpu: Clean up CRC debug logs
>       drm/msm/mdp5: Return error code in mdp5_pipe_release when
> deadlock is detected
>       drm/msm/mdp5: Return error code in mdp5_mixer_release when
> deadlock is detected
>
> Konrad Dybcio (1):
>       drm/msm/disp: dpu1: Properly sort qcm2290_dpu_caps
>
> Kuogee Hsieh (10):
>       drm/msm/dpu: adjust display_v_end for eDP and DP
>       drm/msm/dpu: replace BIT(x) with correspond marco define string
>       drm/msm/dpu: revise timing engine programming to support widebus feature
>       drm/msm/dp: enable widebus feature for display port
>       drm/msm/dp: replace DRM_DEBUG_DP marco with drm_dbg_dp
>       drm/msm/dp: stop event kernel thread when DP unbind
>       drm/msm/dp: tear down main link at unplug handle immediately
>       drm/msm/dp: reset DP controller before transmit phy test pattern
>       drm/msm/dp: do not stop transmitting phy test pattern during DP
> phy compliance test
>       drm/msm/dp: fix event thread stuck in wait_event after kthread_stop()
>
> Luca Weiss (1):
>       drm/msm: Fix null pointer dereferences without iommu
>
> Lv Ruyi (4):
>       drm/msm/dpu: fix error check return value of irq_of_parse_and_map()
>       drm/msm/dp: fix error check return value of irq_of_parse_and_map()
>       drm/msm/hdmi: fix error check return value of irq_of_parse_and_map()
>       drm: msm: fix error check return value of irq_of_parse_and_map()
>
> Marijn Suijten (2):
>       drm/msm/dpu: Bind pingpong block to intf on active ctls in cmd encoder
>       drm/msm/dpu: Use indexed array initializer to prevent mismatches
>
> Rob Clark (16):
>       drm/fourcc: Add QCOM tiled modifiers
>       drm/msm: Remove unused field in submit
>       drm/msm: Add support for pointer params
>       drm/msm: Split out helper to get comm/cmdline
>       drm/msm: Add a way to override processes comm/cmdline
>       drm/msm/gem: Move prototypes
>       drm/msm/gpu: Drop duplicate fence counter
>       drm/msm/gem: Convert some missed GEM_WARN_ON()s
>       drm/msm/gem: Split out inuse helper
>       drm/msm/gem: Drop PAGE_SHIFT for address space mm
>       drm/msm: Drop msm_gem_iova()
>       drm/msm/gem: Rework vma lookup and pin
>       drm/msm/gem: Split vma lookup and pin
>       drm/msm/gem: Add fenced vma unpin
>       drm/msm: Add a way for userspace to allocate GPU iova
>       drm/msm: Limit command submission when no IOMMU
>
> Sankeerth Billakanti (4):
>       drm/msm/dp: Add eDP support via aux_bus
>       drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
>       drm/msm/dp: wait for hpd high before aux transaction
>       drm/msm/dp: Support the eDP modes given by panel
>
> Tom Rix (1):
>       drm/msm: change msm_sched_ops from global to static
>
> Vinod Koul (13):
>       drm/msm/dsi: add support for dsc data
>       drm/msm/dsi: Pass DSC params to drm_panel
>       drm/msm/disp/dpu1: Add support for DSC
>       drm/msm/disp/dpu1: Add support for DSC in pingpong block
>       drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
>       drm/msm/disp/dpu1: Add DSC support in hw_ctl
>       drm/msm/disp/dpu1: Add support for DSC in encoder
>       drm/msm: Add missing num_dspp field documentation
>       drm/msm/disp/dpu1: Add support for DSC in topology
>       drm/msm/disp/dpu1: Add DSC support in RM
>       drm/msm/dsi: add mode valid callback for dsi_mgr
>       drm/msm: Update generated headers
>       drm/msm/dsi: Add support for DSC configuration
>
> Vinod Polimera (5):
>       drm/msm/disp/dpu1: add inline function to validate format support
>       drm/msm/disp/dpu1: add inline rotation support for sc7280
>       drm/msm/disp/dpu1: set vbif hw config to NULL to avoid use after
> memory free during pm runtime resume
>       drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp
> table during probe
>       drm/msm/disp/dpu1: avoid clearing hw interrupts if hw_intr is
> null during drm uninit
>
> Yang Yingliang (1):
>       drm/msm/hdmi: check return value after calling
> platform_get_resource_byname()
>
>  .../bindings/display/msm/dpu-qcm2290.yaml          |    4 +
>  .../bindings/display/msm/dpu-sc7180.yaml           |    4 +
>  .../bindings/display/msm/dpu-sc7280.yaml           |    4 +
>  .../bindings/display/msm/dpu-sdm845.yaml           |    4 +
>  MAINTAINERS                                        |    5 +-
>  .../drm/arm/display/komeda/komeda_wb_connector.c   |    4 +-
>  drivers/gpu/drm/arm/malidp_mw.c                    |    4 +-
>  drivers/gpu/drm/drm_writeback.c                    |   73 +-
>  drivers/gpu/drm/msm/Kconfig                        |   51 +-
>  drivers/gpu/drm/msm/Makefile                       |   29 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   21 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   17 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   68 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |   32 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  592 +++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   32 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   97 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  112 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   79 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  753 +++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |   22 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  157 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   95 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   94 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   23 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  215 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   80 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  195 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   62 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   22 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   32 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   18 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |   25 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   19 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  279 ++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  115 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  241 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   13 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |  260 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  170 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   78 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   13 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   93 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   76 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |   31 +
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |    3 +
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   64 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |    3 +
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   10 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   81 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          |  252 ----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c         |   15 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h         |    4 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c          |   15 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h          |    2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   22 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c                  |   50 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |   21 +-
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |    3 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |   98 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |    3 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  166 ++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |    2 +
>  drivers/gpu/drm/msm/dp/dp_debug.c                  |    2 -
>  drivers/gpu/drm/msm/dp/dp_display.c                |  438 ++++---
>  drivers/gpu/drm/msm/dp/dp_display.h                |    7 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  215 +--
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   22 +-
>  drivers/gpu/drm/msm/dp/dp_link.c                   |  103 +-
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |   49 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 +-
>  drivers/gpu/drm/msm/dp/dp_parser.c                 |   25 +-
>  drivers/gpu/drm/msm/dp/dp_parser.h                 |   14 +-
>  drivers/gpu/drm/msm/dp/dp_power.c                  |   25 +-
>  drivers/gpu/drm/msm/dsi/dsi.c                      |    6 +-
>  drivers/gpu/drm/msm/dsi/dsi.h                      |    3 +
>  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   80 ++
>  drivers/gpu/drm/msm/dsi/dsi_host.c                 |  300 ++++-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   15 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |    2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   10 +-
>  drivers/gpu/drm/msm/edp/edp.h                      |   77 --
>  drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1373 --------------------
>  drivers/gpu/drm/msm/hdmi/hdmi.c                    |   11 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    3 +
>  drivers/gpu/drm/msm/msm_drv.c                      |  294 ++---
>  drivers/gpu/drm/msm/msm_drv.h                      |  162 ++-
>  drivers/gpu/drm/msm/msm_fb.c                       |   20 +-
>  drivers/gpu/drm/msm/msm_fence.c                    |    6 +-
>  drivers/gpu/drm/msm/msm_fence.h                    |    3 +
>  drivers/gpu/drm/msm/msm_gem.c                      |  151 ++-
>  drivers/gpu/drm/msm/msm_gem.h                      |   53 +-
>  drivers/gpu/drm/msm/msm_gem_prime.c                |    2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c               |   37 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c                  |   61 +-
>  drivers/gpu/drm/msm/msm_gpu.c                      |   51 +-
>  drivers/gpu/drm/msm/msm_gpu.h                      |   25 +-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c              |   97 +-
>  drivers/gpu/drm/msm/msm_kms.h                      |   21 -
>  drivers/gpu/drm/msm/msm_mdss.c                     |  415 ++++++
>  drivers/gpu/drm/msm/msm_rd.c                       |    5 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c               |   15 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.h               |    1 -
>  drivers/gpu/drm/msm/msm_submitqueue.c              |    2 +
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |    4 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                      |    3 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c              |    4 +-
>  include/drm/drm_panel.h                            |    7 +
>  include/drm/drm_writeback.h                        |   11 +-
>  include/uapi/drm/drm_fourcc.h                      |   22 +
>  include/uapi/drm/msm_drm.h                         |    7 +
>  120 files changed, 5709 insertions(+), 3832 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>  delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
>  delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/msm_mdss.c
