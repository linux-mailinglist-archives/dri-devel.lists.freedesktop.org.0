Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78623EA8C4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 18:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918C16E433;
	Thu, 12 Aug 2021 16:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11AD6E42E;
 Thu, 12 Aug 2021 16:50:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso7622079wms.1; 
 Thu, 12 Aug 2021 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Mtf92uCCkY3qDXzwMX87aprXsRmEk+w3LYAfa+4fypY=;
 b=mjCpo2tf0JRWWq+z6mBAStUhBvss/yuQ2WbRzjAs00ueyA94ez3uTU+Def5lRPhif3
 mPhI+21an5hyACcJpEUPMsLeyTX3AJD30RVA5tCMQPBd/GhsE6w8lAqSzi8EQGPshYzM
 KTF/WHuVsSP3T7T/MesVJXQNDWlfZxxDeB1+up9AXajhx231B5lrlJ4FkO5GEyvJxn7A
 fqH+dVJz+20wI27+0Q2uNaYX0dXhkUw+ViV4QpHlltA7QBLt7bRcUJSk7tvVaAwtmIrk
 DS7anZUwtvbgDW1oOQ7NrgQyrFG377rkCnGaVFoFErHWbP2K+ymDPxbGvETBeP471yK0
 sjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Mtf92uCCkY3qDXzwMX87aprXsRmEk+w3LYAfa+4fypY=;
 b=mF6JX6UMbriqR6v2aLL6oJNRNXBI64s4qWIecHZCzGz5diGpJkEEGTYd1RtldSfQOM
 dEogEtIACFCVYTnEou4OgfoBVAJORapnZSm7zwef4CGZZzE/ayPWDSIunIuElq320ha4
 NLMp8nE5bRk/dlReI5w51q+Wx37b+UiV1QmKbNxyg+EeIztPSDCuq0SCn65u2v5BxRsL
 Jf/eZ+s2jkkq6TQ8z1X/cKeBAPL5Ws92sl+J2CN1eKyirY8AUnm70vzI3MKPnO766L3u
 NBC9F3r2I1Qe32OntOKpDyHBG1pMowSe9yY/KgRf71wywSGg0F1jgXvKkelb0uJBGs6V
 YHlg==
X-Gm-Message-State: AOAM530kWD9dc7XsOP3v7yHSxQP5dBkORdw1l5pEikCvWBLJd2Ir8OpZ
 CqDxIUdEwUEDGlmzzJT9oEJWUzyrsQJuP3a7TJ4=
X-Google-Smtp-Source: ABdhPJyYCfRBsf8FxlFvbmjLo3b9VP2WFwaTLVuBQ+hYEhl0Jxjb97VzED8iGEBY8SZNApinhbnjVzN5opIKTyb0wi4=
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr5042522wmq.175.1628787002318; 
 Thu, 12 Aug 2021 09:50:02 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 12 Aug 2021 09:54:18 -0700
Message-ID: <CAF6AEGs_tyanTeDGMH1X+Uf4wdyy7jYj-CinGXXVETiYOESahw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2021-08-12 for v5.15
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Abhinav Kumar <abhinavk@codeaurora.org>, 
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

Hi Dave & Daniel,

This is the main pull for v5.15, after the early pull request with
drm/scheduler conversion:

* New a6xx GPU support: a680 and 7c3
* dsi: 7nm phi, sc7280 support, test pattern generator support
* mdp4 fixes for older hw like the nexus7
* displayport fixes

There will be minor conflict, not with merging into drm-next (in it's
current state) but when that gets merged with fixes from the v5.14
cycle.  The resolution that Stephen Rothwell made in linux-next is
correct:

---------
diff --cc drivers/gpu/drm/msm/dp/dp_display.c
index 867388a399ad,419fd4a14cbf..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@@ -1312,10 -1314,10 +1315,14 @@@ static int dp_pm_resume(struct device *
        else
                dp->dp_display.is_connected = false;

 +      dp_display_handle_plugged_change(g_dp_display,
 +                              dp->dp_display.is_connected);
 +
 +
+       DRM_DEBUG_DP("After, sink_count=%d is_connected=%d
core_inited=%d power_on=%d\n",
+                       dp->link->sink_count, dp->dp_display.is_connected,
+                       dp->core_initialized, dp_display->power_on);
+
        mutex_unlock(&dp->event_mutex);

        return 0;
---------

The following changes since commit 4541e4f2225c30b0e9442be9eb2fb8b7086cdd1f:

  drm/msm/gem: Mark active before pinning (2021-07-28 09:19:00 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-08-12

for you to fetch changes up to cb0927ab80d224c9074f53d1a55b087d12ec5a85:

  drm/msi/mdp4: populate priv->kms in mdp4_kms_init (2021-08-11 10:57:28 -0700)

----------------------------------------------------------------
Abhinav Kumar (2):
      drm/msm/dsi: update dsi register header file for tpg
      drm/msm/dsi: add support for dsi test pattern generator

Akhil P Oommen (3):
      drm/msm/a6xx: Fix llcc configuration for a660 gpu
      drm/msm/a6xx: Use rev to identify SKU
      drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu

Baokun Li (1):
      drm/msm: Use list_move_tail instead of list_del/list_add_tail in msm_gem.c

Bjorn Andersson (1):
      drm: msm: Add 680 gpu to the adreno gpu list

Christophe JAILLET (1):
      drm/msm/dsi: Fix some reference counted resource leaks

David Heidelberg (4):
      drm/msm/mdp4: refactor HW revision detection into read_mdp_hw_revision
      drm/msm/mdp4: move HW revision detection to earlier phase
      drm/msm: mdp4: drop vblank get/put from prepare/complete_commit
      drm/msi/mdp4: populate priv->kms in mdp4_kms_init

Dmitry Baryshkov (14):
      drm/msm/dsi: drop gdsc regulator handling
      drm/msm/dsi: phy: use of_device_get_match_data
      drm/msm/dsi: drop msm_dsi_phy_get_shared_timings
      drm/msm/dsi: rename dual DSI to bonded DSI
      drm/msm/dsi: add three helper functions
      drm/msm/dpu: support setting up two independent DSI connectors
      drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
      drm/msm/dp: stop calling set_encoder_mode callback
      drm/msm/dsi: stop calling set_encoder_mode callback
      drm/msm/kms: drop set_encoder_mode callback
      drm/msm/dpu: add support for alpha blending properties
      drm/msm/dpu: make dpu_hw_ctl_clear_all_blendstages clear necessary LMs
      dt-bindings: display: msm: dsi-controller-main: restore assigned-clocks
      drm/msm/dsi: add continuous clock support for 7nm PHY

Douglas Anderson (1):
      drm/msm: Use nvmem_cell_read_variable_le_u32() to read speed bin

Guo Zhengkui (1):
      drm/msm: remove a repeated including of <linux/debugfs.h>

Jonathan Marek (3):
      dt-bindings: msm: dsi: add missing 7nm bindings
      dt-bindings: msm: dsi: document phy-type property for 7nm dsi phy
      drm/msm/dsi: support CPHY mode for 7nm pll/phy

Kalyan Thota (1):
      drm/msm/disp/dpu1: add safe lut config in dpu driver

Konrad Dybcio (1):
      drm/msm/dsi: Fix DSI and DSI PHY regulator config from SDM660

Kuogee Hsieh (8):
      drm/msm/dp: update is_connected status base on sink count at
dp_pm_resume()
      drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
      drm/msm/dp: reduce link rate if failed at link training 1
      drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
      drm/msm/dp: replug event is converted into an unplug followed by
an plug events
      drm/msm/dp: return correct edid checksum after corrupted edid
checksum read
      drm/msm/dp: do not end dp link training until video is ready
      drm/msm/dp: add drm debug logs to dp_pm_resume/suspend

Maitreyee Rao (1):
      drm/msm/dp: add logs across DP driver for ease of debugging

Rajeev Nandan (3):
      dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
      drm/msm/dsi: Add PHY configuration for SC7280
      drm/msm/dsi: Add DSI support for SC7280

Rob Clark (3):
      drm/msm: Periodically update RPTR shadow
      drm/msm: Add adreno_is_a640_family()
      drm/msm: Rework SQE version check

Souptick Joarder (1):
      drm/msm/dp: Remove unused variable

Stephen Boyd (1):
      drm/msm/dpu: Add newlines to printks

Thomas Zimmermann (1):
      drm/msm: Implement mmap as GEM object function

Wei Li (1):
      drm/msm: Fix error return code in msm_drm_init()

 .../bindings/display/msm/dsi-controller-main.yaml  |  17 ++
 .../bindings/display/msm/dsi-phy-7nm.yaml          |  72 ++++++++
 drivers/gpu/drm/msm/Kconfig                        |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  29 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 131 ++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  34 +++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  40 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  22 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  43 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 102 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  10 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  85 +++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c           |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  11 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       |   1 -
 drivers/gpu/drm/msm/dp/dp_aux.c                    |   3 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |   8 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 141 +++++++++------
 drivers/gpu/drm/msm/dp/dp_display.c                |  77 +++++----
 drivers/gpu/drm/msm/dp/dp_link.c                   |  50 ++----
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   9 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  |   3 +
 drivers/gpu/drm/msm/dsi/dsi.c                      |  15 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |  18 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  74 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  33 +++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 161 ++++++++++++-----
 drivers/gpu/drm/msm/dsi/dsi_manager.c              | 146 ++++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  83 +++++++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   5 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |   2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   8 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 190 ++++++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.c                      |  15 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  18 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |  12 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  40 ++---
 drivers/gpu/drm/msm/msm_gem.h                      |   3 -
 drivers/gpu/drm/msm/msm_gem_prime.c                |  11 --
 drivers/gpu/drm/msm/msm_kms.h                      |   3 -
 include/dt-bindings/phy/phy.h                      |   2 +
 47 files changed, 1193 insertions(+), 585 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
