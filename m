Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BCB43BD48
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 00:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9016E4A7;
	Tue, 26 Oct 2021 22:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883426E4A7;
 Tue, 26 Oct 2021 22:33:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 y205-20020a1c7dd6000000b0032cc8c2800fso3628299wmc.4; 
 Tue, 26 Oct 2021 15:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=dF4klzHMmNf4aUB9C8acpTt9YIuuodRgS8Xxoip8C0Y=;
 b=lEUcH5C/bwPom8F+Ur3e1R3cwE8ZD2l6zmtldF44n3b/c5Rz1YWmn+OqhG3VE57/wE
 mYaLkbIbt0tPq8XjJQfB3vSiTgX0hshtLby9w3eQaLuHiUpbzzxDw01L7WRBCKSJKFLG
 SUannGIhQUWZWAukNmv0uGF9E81Duqj+ZaiyjwYYwGMX1rYxHaJIkUPIMwtxXyH49g6m
 tW/t46RRy9ocGqDUtcJVZ/U0u13ddydDagiRguD+gKG3oD7AzC1xcXkrfCy8LSFwHWyB
 dfjXkwvKBBmF6B4LTXM99a3z+n6aIIiI5dPCBh7p8gT7eQZsl49HXBV992fTiqUBpS8w
 c9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=dF4klzHMmNf4aUB9C8acpTt9YIuuodRgS8Xxoip8C0Y=;
 b=fI5boG+vZkp0dtXPr1VpuYF5QzFM1yyEgO/jgFj6aFYzq4ImRAoGU+w7OA/nLYuyrU
 t8EfgdwjnOvEdk2nr1XstDIF2X9iX83zFFZlx6iis63iaon/ux1HAv4NG34DedfbhnHX
 v3GAmA5kdIVmuZzDWLZKvpl8FuZ28LRob5BIvQqNL6yq4pR+3WOf0lm9zmT899RW59c/
 92feaWcTbNw8XGdq7ZT2fM7HFWXG8ZXZ3WiIYI6DJRT2MmFDRjZkNPno188pXkrXthH6
 XPq5X20rNNWesMZORtNCuGDLDPQzuVMnlVjupN5LcXlDgrTK17gMtYH1lnHl93JdCizw
 oBpQ==
X-Gm-Message-State: AOAM5332vCTnqOYk+tRdevf060T8OJDyh8OJLqd/HHfpFUSmdF47bODw
 hUSPOLQaQ+lohJ6UIrQC8VGQwOfd6jrybGqG1Z0=
X-Google-Smtp-Source: ABdhPJzFjqD+17wZISlGc8arXHudN7nxTRnq6lNWrZjornAyfoqSlDSBSGpFMwrN3SulH0ULgr+2ErMW10yPUiBjQHs=
X-Received: by 2002:a05:600c:4f96:: with SMTP id
 n22mr1677540wmq.168.1635287617928; 
 Tue, 26 Oct 2021 15:33:37 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 26 Oct 2021 15:38:29 -0700
Message-ID: <CAF6AEGsH9EwcpqGNNRJeL99NvFFjHX3SUg+nTYu0dHG5U9+QuA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2021-10-26
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>
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

This is the main pull for v5.16:

* eDP support in DP sub-driver (for newer SoCs with native eDP output)
* dpu irq handling cleanup
* CRC support for making igt happy
* Support for NO_CONNECTOR bridges
* dsi: 14nm phy support for msm8953
* mdp5: support for msm8x53, sdm450, sdm632
* various smaller fixes and cleanups

The following changes since commit c8f01ffc83923a91e8087aaa077de13354a7aa59:

  drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
(2021-10-11 17:30:54 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-10-26

for you to fetch changes up to 02d44fde976a8e9330f855fc535180727c779b9b:

  drm/msm/dp: fix missing #include (2021-10-26 09:31:24 -0700)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/msm/dp: fix missing #include

Bernard (1):
      drm/msm: delete conversion from bool value to bool return

Bernard Zhao (1):
      drm/msm: fix warning "using plain integer as NULL pointer"

Bjorn Andersson (13):
      dt-bindings: msm/dp: Change reg definition
      drm/msm/dp: Use devres for ioremap()
      drm/msm/dp: Refactor ioremap wrapper
      drm/msm/dp: Store each subblock in the io region
      drm/msm/dp: Allow sub-regions to be specified in DT
      drm/msm/dp: Use the connector passed to dp_debug_get()
      drm/msm/dp: Simplify the dp_debug debugfs show function
      drm/msm/dp: Remove global g_dp_display variable
      drm/msm/dp: Modify prototype of encoder based API
      drm/msm/dp: Allow specifying connector_type per controller
      drm/msm/dp: Allow attaching a drm_panel
      drm/msm/dp: Support up to 3 DP controllers
      dt-bindings: msm/dp: Add SC8180x compatibles

Chi Minghao (1):
      drm/msm: remove unneeded variable

Christophe JAILLET (1):
      drm: Remove redundant 'flush_workqueue()' calls

Colin Ian King (1):
      drm/msm/dp: Remove redundant initialization of variable bpp

Dan Carpenter (5):
      drm/msm: Fix potential Oops in a6xx_gmu_rpmh_init()
      drm/msm: potential error pointer dereference in init()
      drm/msm: unlock on error in get_sched_entity()
      drm/msm: fix potential NULL dereference in cleanup
      drm/msm: uninitialized variable in msm_gem_import()

David Heidelberg (1):
      dt-bindings: drm/msm/gpu: convert to YAML

Deepak R Varma (1):
      drm: msm: adreno: use DEFINE_DEBUGFS_ATTRIBUTE with
debugfs_create_file_unsafe()

Dmitry Baryshkov (7):
      drm/msm/dpu: squash dpu_core_irq into dpu_hw_interrupts
      drm/msm/dpu: don't clear IRQ register twice
      drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr
      drm/msm/dsi: do not enable irq handler before powering up the host
      drm/msm/dsi: use bulk clk API
      drm/msm/a6xx: correct cx_debugbus_read arguments
      drm/msm/hdmi: use bulk regulator API

Jessica Zhang (3):
      drm/msm/dpu: Add CRC support for DPU
      drm/msm: Fix potential NULL dereference in DPU SSPP
      drm/msm/dsi: fix wrong type in msm_dsi_host

Krishna Manikandan (1):
      dt-bindings: msm: add DT bindings for sc7280

Marijn Suijten (1):
      drm/msm/dsi: Use division result from div_u64_rem in 7nm and 14nm PLL

Mark Yacoub (1):
      drm/msm: Change dpu_crtc_get_vblank_counter to use vsync count.

Nathan Chancellor (1):
      drm/msm/dpu: Remove commit and its uses in dpu_crtc_set_crc_source()

Rikard Falkeborn (1):
      drm: msm: hdmi: Constify static structs

Rob Clark (6):
      drm/msm/dsi: Support NO_CONNECTOR bridges
      drm/msm/dpu: Remove some nonsense
      drm/msm: Add hrtimer + kthread_work helper
      drm/msm/devfreq: Add 1ms delay before clamping freq
      drm/msm/dpu: Remove impossible NULL check
      drm/msm/dpu: Remove dynamic allocation from atomic context

Sireesh Kodali (1):
      dt-bindings: msm: dsi: Add MSM8953 dsi phy

Tim Gardner (1):
      drm/msm: prevent NULL dereference in msm_gpu_crashstate_capture()

Vladimir Lypak (2):
      drm/msm/dsi: Add phy configuration for MSM8953
      drm/msm/mdp5: Add configuration for MDP v1.16

Wang Qing (1):
      drm: Use IS_ERR() instead of IS_ERR_OR_NULL()

Xu Wang (3):
      drm/msm/mdp4: Remove redundant null check before
clk_prepare_enable/clk_disable_unprepare
      drm/msm: dsi: Remove redundant null check before
clk_prepare_enable/clk_disable_unprepare
      drm/msm/mdp5: Remove redundant null check before
clk_prepare_enable/clk_disable_unprepare

Yanteng Si (2):
      drm/msm: Fix missing include files in msm_gem.c
      drm/msm: Fix missing include files in msm_gem_shrinker.c

zhaoxiao (1):
      drm/msm: Remove initialization of static variables

 .../bindings/display/msm/dp-controller.yaml        |  15 +-
 .../bindings/display/msm/dpu-sc7280.yaml           | 232 ++++++++++++++++
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
 .../devicetree/bindings/display/msm/gpu.txt        | 157 -----------
 .../devicetree/bindings/display/msm/gpu.yaml       | 288 ++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |   1 -
 drivers/gpu/drm/msm/Kconfig                        |   2 +
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       | 256 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 147 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  39 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 267 ++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  92 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  56 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  70 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  89 +++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          |  12 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |   8 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  64 ++---
 drivers/gpu/drm/msm/dp/dp_debug.c                  | 294 +++++----------------
 drivers/gpu/drm/msm/dp/dp_debug.h                  |   4 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 143 +++++-----
 drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  13 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   2 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 | 138 ++++++----
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  14 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 147 +++++------
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  66 ++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  25 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   4 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |   5 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  38 +--
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |   6 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  20 +-
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c          |  24 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |  33 +--
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |   4 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |  21 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  33 ++-
 drivers/gpu/drm/msm/msm_drv.h                      |  31 ++-
 drivers/gpu/drm/msm/msm_gem.c                      |   6 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |   2 +
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   7 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |  38 ++-
 drivers/gpu/drm/msm/msm_kms.h                      |   3 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |   1 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   4 +-
 drivers/gpu/drm/vmwgfx/ttm_memory.c                |   1 -
 68 files changed, 1748 insertions(+), 1321 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gpu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gpu.yaml
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
