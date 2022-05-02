Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B8516901
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 02:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FBB10E51A;
	Mon,  2 May 2022 00:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E0710E598;
 Mon,  2 May 2022 00:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651450358; x=1682986358;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g8ro99j8+NGARaV74xy1UPwO2Xz3yt6DuDf5Ey72Vc4=;
 b=REeYHxk1q4SsoifgE2s/klf491TvLeEf3owtq8s2UHdTdCSoBCKq/Qqy
 8jz4ijcwpGtER0Gu5K7wmgb/Fk8g65OzEElXY11VsKsm4HBZjLW6kwD48
 UESaSycUEZ3ddI4bHUrMht8am52hESBDNPTBKyLMUXnnhg7+d9JHUMmJp w=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 May 2022 17:12:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 17:12:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 1 May 2022 17:12:35 -0700
Received: from [10.38.245.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 1 May 2022
 17:12:33 -0700
Message-ID: <b3e13051-029e-a03d-8b8b-911c13f532c2@quicinc.com>
Date: Sun, 1 May 2022 17:12:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PULL v3] drm/msm: display pull request for 5.19
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220501234139.13513-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220501234139.13513-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding one more item:

On 5/1/2022 4:41 PM, Dmitry Baryshkov wrote:
> Hi Rob,
> 
> This is a pull request over the patches accumulated, reviewed and tested for
> the 5.19 merge window. This pull request contains following changes:
> 
>   - DPU: DSC (Display Stream Compression) support
     - DPU: Writeback support on SM8250
>   - DPU: inline rotation support on SC7280
>   - DPU: update DP timings to follow vendor recommendations
>   - DP, DPU: add support for wide bus (on newer chipsets)
>   - DP: eDP support
>   - Merge DPU1 and MDP5 MDSS driver, make dpu/mdp device the master
>     component
>   - MDSS: optionally reset the IP block at the bootup to drop
>     bootloader state
>   - Properly register and unregister internal bridges in the DRM framework
>   - Complete DPU IRQ cleanup
>   - DP: conversion to use drm_bridge and drm_bridge_connector
>   - eDP: drop old eDP parts again
>   - Misc small fixes
> 
> This pull request incorporates both patches from first and second pull
> requests. It was flattened to ease fixing the Fixes tags issues reported by
> Stephen Rothwell.
> 
> The following changes since commit 78f815c1cf8fc5f05dc5cec29eb1895cb53470e9:
> 
>    drm/msm: return the average load over the polling period (2022-04-21 15:05:23 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag
> 
> for you to fetch changes up to f1fc2b87de4719cfa8e193e0746cc524dd9f7472:
> 
>    drm/msm: drop old eDP block support (again) (2022-05-02 02:39:35 +0300)
> 
> ----------------------------------------------------------------
> Abhinav Kumar (21):
>        drm/msm: remove unused hotplug and edid macros from msm_drv.h
>        drm: allow passing possible_crtcs to drm_writeback_connector_init()
>        drm: introduce drm_writeback_connector_init_with_encoder() API
>        drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog
>        drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl
>        drm/msm/dpu: rename dpu_hw_pipe_cdp_cfg to dpu_hw_cdp_cfg
>        drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks
>        drm/msm/dpu: add writeback blocks to DPU RM
>        drm/msm/dpu: add changes to support writeback in hw_ctl
>        drm/msm/dpu: add an API to reset the encoder related hw blocks
>        drm/msm/dpu: make changes to dpu_encoder to support virtual encoder
>        drm/msm/dpu: add encoder operations to prepare/cleanup wb job
>        drm/msm/dpu: move _dpu_plane_get_qos_lut to dpu_hw_util file
>        drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback
>        drm/msm/dpu: add the writeback connector layer
>        drm/msm/dpu: initialize dpu encoder and connector for writeback
>        drm/msm/dpu: gracefully handle null fb commits for writeback
>        drm/msm/dpu: add writeback blocks to the display snapshot
>        drm/msm/dpu: add wb_idx to existing DRM prints in dpu_encoder
>        drm/msm/dpu: add wb_idx to DRM traces in dpu_encoder
>        drm/msm/dpu: remove unused refcount for encoder_phys_wb
> 
> Bjorn Andersson (2):
>        dt-bindings: display: msm: Add optional resets
>        drm/msm/dpu: Issue MDSS reset during initialization
> 
> Dmitry Baryshkov (32):
>        drm/msm: unify MDSS drivers
>        drm/msm: remove extra indirection for msm_mdss
>        drm/msm: split the main platform driver
>        drm/msm: stop using device's match data pointer
>        drm/msm: allow compile time selection of driver components
>        drm/msm: make mdp5/dpu devices master components
>        drm/msm: properly add and remove internal bridges
>        drm/msm/dpu: remove manual destruction of DRM objects
>        drm/msm: loop over encoders using drm_for_each_encoder()
>        drm/msm: don't store created planes, connectors and encoders
>        drm/msm: remove unused plane_property field from msm_drm_private
>        drm/msm/dpu: don't use merge_3d if DSC merge topology is used
>        drm/msm/dpu: remove extra wrappers around dpu_core_irq
>        drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
>        drm/msm/dpu: allow just single IRQ callback
>        drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
>        drm/msm/dpu: remove struct dpu_encoder_irq
>        drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()
>        drm/msm/dpu: document INTF_EDP/INTF_DP difference
>        drm/msm/dpu: drop INTF_TYPE_MAX symbol
>        drm/msm/dpu: drop obsolete INTF_EDP comment
>        drm/msm/dpu: drop INTF_EDP from interface type conditions
>        drm/msm/dp: replace dp_connector with drm_bridge_connector
>        drm/msm/dp: remove extra wrappers and public functions
>        drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
>        drm/msm/dp: simplify dp_connector_get_modes()
>        drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
>        drm/msm: select DRM_DP_AUX_BUS for the AUX bus support
>        drm/msm/dsi: fix error checks and return values for DSI xmit functions
>        drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
>        drm/msm: add missing include to msm_drv.c
>        drm/msm: drop old eDP block support (again)
> 
> Guo Zhengkui (1):
>        drm/msm: fix returnvar.cocci warning
> 
> Haowen Bai (1):
>        drm/msm/mdp5: Eliminate useless code
> 
> Jessica Zhang (1):
>        drm/msm/dpu: Clean up CRC debug logs
> 
> Kuogee Hsieh (9):
>        drm/msm/dpu: adjust display_v_end for eDP and DP
>        drm/msm/dpu: replace BIT(x) with correspond marco define string
>        drm/msm/dpu: revise timing engine programming to support widebus feature
>        drm/msm/dp: enable widebus feature for display port
>        drm/msm/dp: replace DRM_DEBUG_DP marco with drm_dbg_dp
>        drm/msm/dp: stop event kernel thread when DP unbind
>        drm/msm/dp: tear down main link at unplug handle immediately
>        drm/msm/dp: reset DP controller before transmit phy test pattern
>        drm/msm/dp: do not stop transmitting phy test pattern during DP phy compliance test
> 
> Lv Ruyi (4):
>        drm/msm/dpu: fix error check return value of irq_of_parse_and_map()
>        drm/msm/dp: fix error check return value of irq_of_parse_and_map()
>        drm/msm/hdmi: fix error check return value of irq_of_parse_and_map()
>        drm: msm: fix error check return value of irq_of_parse_and_map()
> 
> Marijn Suijten (2):
>        drm/msm/dpu: Bind pingpong block to intf on active ctls in cmd encoder
>        drm/msm/dpu: Use indexed array initializer to prevent mismatches
> 
> Sankeerth Billakanti (4):
>        drm/msm/dp: Add eDP support via aux_bus
>        drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
>        drm/msm/dp: wait for hpd high before aux transaction
>        drm/msm/dp: Support the eDP modes given by panel
> 
> Tom Rix (1):
>        drm/msm: change msm_sched_ops from global to static
> 
> Vinod Koul (13):
>        drm/msm/dsi: add support for dsc data
>        drm/msm/dsi: Pass DSC params to drm_panel
>        drm/msm/disp/dpu1: Add support for DSC
>        drm/msm/disp/dpu1: Add support for DSC in pingpong block
>        drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
>        drm/msm/disp/dpu1: Add DSC support in hw_ctl
>        drm/msm/disp/dpu1: Add support for DSC in encoder
>        drm/msm: Add missing num_dspp field documentation
>        drm/msm/disp/dpu1: Add support for DSC in topology
>        drm/msm/disp/dpu1: Add DSC support in RM
>        drm/msm/dsi: add mode valid callback for dsi_mgr
>        drm/msm: Update generated headers
>        drm/msm/dsi: Add support for DSC configuration
> 
> Vinod Polimera (4):
>        drm/msm/disp/dpu1: add inline function to validate format support
>        drm/msm/disp/dpu1: add inline rotation support for sc7280
>        drm/msm/disp/dpu1: set vbif hw config to NULL to avoid use after memory free during pm runtime resume
>        drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp table during probe
> 
> Yang Yingliang (1):
>        drm/msm/hdmi: check return value after calling platform_get_resource_byname()
> 
>   .../bindings/display/msm/dpu-qcm2290.yaml          |    4 +
>   .../bindings/display/msm/dpu-sc7180.yaml           |    4 +
>   .../bindings/display/msm/dpu-sc7280.yaml           |    4 +
>   .../bindings/display/msm/dpu-sdm845.yaml           |    4 +
>   .../drm/arm/display/komeda/komeda_wb_connector.c   |    4 +-
>   drivers/gpu/drm/arm/malidp_mw.c                    |    4 +-
>   drivers/gpu/drm/drm_writeback.c                    |   73 +-
>   drivers/gpu/drm/msm/Kconfig                        |   51 +-
>   drivers/gpu/drm/msm/Makefile                       |   29 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |   32 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   12 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  592 +++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   32 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   97 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  112 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   79 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  754 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |   22 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  135 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   95 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   93 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   23 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  215 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   80 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  191 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   12 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   62 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   22 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   32 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   14 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   18 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |   25 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   19 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  279 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  115 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  240 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   13 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |  260 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  170 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |    2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   78 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   13 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   93 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   76 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |   31 +
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |    3 +
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   64 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |    3 +
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   80 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          |  252 ----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |    2 -
>   drivers/gpu/drm/msm/dp/dp_audio.c                  |   50 +-
>   drivers/gpu/drm/msm/dp/dp_aux.c                    |   21 +-
>   drivers/gpu/drm/msm/dp/dp_aux.h                    |    3 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.c                |   98 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.h                |    3 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  166 ++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.h                   |    2 +
>   drivers/gpu/drm/msm/dp/dp_debug.c                  |    2 -
>   drivers/gpu/drm/msm/dp/dp_display.c                |  429 +++---
>   drivers/gpu/drm/msm/dp/dp_display.h                |    7 +-
>   drivers/gpu/drm/msm/dp/dp_drm.c                    |  215 +--
>   drivers/gpu/drm/msm/dp/dp_drm.h                    |   22 +-
>   drivers/gpu/drm/msm/dp/dp_link.c                   |  103 +-
>   drivers/gpu/drm/msm/dp/dp_panel.c                  |   49 +-
>   drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 +-
>   drivers/gpu/drm/msm/dp/dp_parser.c                 |   25 +-
>   drivers/gpu/drm/msm/dp/dp_parser.h                 |   14 +-
>   drivers/gpu/drm/msm/dp/dp_power.c                  |   25 +-
>   drivers/gpu/drm/msm/dsi/dsi.c                      |    6 +-
>   drivers/gpu/drm/msm/dsi/dsi.h                      |    3 +
>   drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   80 ++
>   drivers/gpu/drm/msm/dsi/dsi_host.c                 |  300 ++++-
>   drivers/gpu/drm/msm/dsi/dsi_manager.c              |   15 +
>   drivers/gpu/drm/msm/edp/edp.h                      |   77 --
>   drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1373 --------------------
>   drivers/gpu/drm/msm/hdmi/hdmi.c                    |   11 +-
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    3 +
>   drivers/gpu/drm/msm/msm_drv.c                      |  265 +---
>   drivers/gpu/drm/msm/msm_drv.h                      |  139 +-
>   drivers/gpu/drm/msm/msm_kms.h                      |   21 -
>   drivers/gpu/drm/msm/msm_mdss.c                     |  416 ++++++
>   drivers/gpu/drm/msm/msm_ringbuffer.c               |    2 +-
>   drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |    4 +-
>   drivers/gpu/drm/vc4/vc4_txp.c                      |    3 +-
>   drivers/gpu/drm/vkms/vkms_writeback.c              |    4 +-
>   include/drm/drm_panel.h                            |    7 +
>   include/drm/drm_writeback.h                        |   11 +-
>   91 files changed, 5122 insertions(+), 3580 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>   delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
>   delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
>   delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
>   create mode 100644 drivers/gpu/drm/msm/msm_mdss.c
