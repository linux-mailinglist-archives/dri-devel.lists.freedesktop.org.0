Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BF25E6A6C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 20:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2DC10E153;
	Thu, 22 Sep 2022 18:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9689110E045;
 Thu, 22 Sep 2022 18:09:27 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-12c8312131fso15039471fac.4; 
 Thu, 22 Sep 2022 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=O5nJHg+VQnGV2W4egYTndSwkmO5/IvT/ILfbHE1H9ms=;
 b=iykt5EE5yprRyhR4T47LS5GElzrW7L0mmUnBKGtJTNOt3jjCE0OtQpsCnjhg1j6rU/
 cILT9a1911tC/hL+bJ3oxwJBVhBueorNX+R6VJBwmPv4dx9Za+Yz+LxpIjxctiETVtCE
 FolkViKtdORJoJp5j36iZakL7KmKtyRv/teWOJ9ZT+NfWs60sSkaWAdPlSqI6Zp7aWJK
 uZZQPiElIzR9OEQ1TOn4rlljAVu2ow+JG1DBWi5GiquZ61UYyr59QDPxv8X7ooCjmK4z
 kqJKlXLDPJzDrbZy+Y3No4SHPgP3+PcvBHc48zKz+5AhWkusduTG2V0rWfGyGy7pG2r1
 WuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=O5nJHg+VQnGV2W4egYTndSwkmO5/IvT/ILfbHE1H9ms=;
 b=pd0+BAv7tNFdVr11n/iQ76hvraERamkVgdxbgR/RckTFupS7f0rBxIZO+01DiJI5Ww
 pI0AiDmiUCCDV1bzZhnUpCtEVNSiedy2v7gVt9dLCliPzGltdV3csCJWff0Y+lItFQ5j
 krEf+pIaLvDU8TnWHrCuMEt1glJWJvF+UJ966GkD/iMBTgNmpYeAQIwVzdAcq310VxVD
 xlojBTeNkxWflyLNQDAqjAO9eUeJe8ZDeKmE7DM33TT0xRaJ5X8K+I+K4S5YL76R4wmI
 1755lSAYuwCpY78Gwyl0W4dMSrbXmLQdMaQ+XnP0Oqq5KcG3u1wUbtvirQ2uKB/yITtk
 QcAg==
X-Gm-Message-State: ACrzQf3nw+aurn5XzI7qTcKV7T1S0wfyayHPJZZvE4IhhXDlpJ8GfT9+
 49OJec5eOPxJ5MmaKPrBMasfrDKB1kCxHf7g2N4=
X-Google-Smtp-Source: AMsMyM7KAyhfBRTkZtFo/50Lw38oL4YPv080I++w00yoLpOV9SCxd/5xGufu9uG8RVayv8A/9BVitJ/rkqPBT3edr+w=
X-Received: by 2002:a05:6871:14e:b0:127:3f08:4599 with SMTP id
 z14-20020a056871014e00b001273f084599mr2800000oab.183.1663870166791; Thu, 22
 Sep 2022 11:09:26 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 Sep 2022 11:09:20 -0700
Message-ID: <CAF6AEGsrfrr9v1oR9S4oYfOs9jm=jbKQiwPBTrCRHrjYerJJFA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2022-09-22 for v6.1
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

Hi Dave & Daniel,

Here is the main drm/msm pull for v6.1, description below and in tag.

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2022-09-22

for you to fetch changes up to e8b595f7b058c7909e410f3e0736d95e8f909d01:

  drm/msm/hdmi: make hdmi_phy_8996 OF clk provider (2022-09-18 09:38:07 -0700)

----------------------------------------------------------------
msm-next for v6.1

DPU:
- simplified VBIF configuration
- cleaned up CTL interfaces to accept indices rather than flush masks

DSI:
- removed unused msm_display_dsc_config struct
- switch regulator calls to new bulk API
- switched to use PANEL_BRIDGE for directly attached panels

DSI PHY:
- converted drivers to use parent_hws instead of parent_names

DP:
- cleaned up pixel_rate handling

HDMI PHY:
- turned hdmi-phy-8996 into OF clk provider

core:
- misc dt-bindings fixes
- choose eDP as primary display if it's available
- support getting interconnects from either the mdss or the mdp5/dpu
  device nodes

gpu+gem:
- Shrinker + LRU re-work:
  - adds a shared GEM LRU+shrinker helper and moves msm over to that
  - reduces lock contention between retire and submit by avoiding the
    need to acquire obj lock in retire path (and instead using resv
    seeing obj's busyness in the shrinker
  - fix reclaim vs submit issues
- GEM fault injection for triggering userspace error paths
- Map/unmap optimization
- Improved robustness for a6xx GPU recovery

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: populate wb or intf before reset_intf_cfg

Akhil P Oommen (7):
      drm/msm: Remove unnecessary pm_runtime_get/put
      drm/msm: Take single rpm refcount on behalf of all submits
      drm/msm: Correct pm_runtime votes in recover worker
      drm/msm: Fix cx collapse issue during recovery
      drm/msm/a6xx: Ensure CX collapse during gpu recovery
      drm/msm/a6xx: Improve gpu recovery sequence
      drm/msm/a6xx: Handle GMU prepare-slumber hfi failure

Bjorn Andersson (1):
      drm/msm/gpu: Drop qos request if devm_devfreq_add_device() fails

Dmitry Baryshkov (25):
      drm/msm/dpu: use drm_dsc_config instead of msm_display_dsc_config
      drm/msm/dsi: use drm_dsc_config instead of msm_display_dsc_config
      dt-bindings: display/msm/gpu: allow specifying several IOMMU nodes
      dt-bindings: display/msm/gmu: account for different GMU variants
      dt-bindings: display/msm/mdp4: require 4 IOMMUs
      drm/msm: lookup the ICC paths in both mdp5/dpu and mdss devices
      drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
      drm/msm/dpu: fix error handling around dpu_hw_vbif_init
      drm/msm/dpu: drop VBIF indices
      drm/msm/dpu: drop unused memory allocation
      drm/msm/dpu: drop unused variable from dpu_kms_mdp_snapshot()
      drm/msm/dpu: rip out master planes support
      drm/msm/dpu: do not limit the zpos property
      drm/msm/dpu: inline dpu_plane_get_ctl_flush
      drm/msm/dpu: get rid of cached flush_mask
      dt-bindings: msm/dp: mark vdda supplies as deprecated
      dt-bindings: msm/dp: add missing properties
      dt-bindings: msm/dp: handle DP vs eDP difference
      drm/msm/dsi: drop the hpd worker
      drm/mipi-dsi: pass DSC data through the struct mipi_dsi_device
      drm/msm/dsi: fetch DSC pps payload from struct mipi_dsi_device
      drm/panel: drop DSC pps pointer
      drm/msm/dsi: switch to DRM_PANEL_BRIDGE
      dt-bindings: phy: qcom, hdmi-phy-qmp: add clock-cells and XO clock
      drm/msm/hdmi: make hdmi_phy_8996 OF clk provider

Douglas Anderson (6):
      drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
      drm/msm/dsi: Fix number of regulators for SDM660
      drm/msm/dsi: Don't set a load before disabling a regulator
      drm/msm/dsi: Use the new regulator bulk feature to specify the load
      drm/msm/dsi: Take advantage of devm_regulator_bulk_get_const()
      drm/msm/dsi: Improve dsi_phy_driver_probe() probe error handling

Jason Wang (1):
      drm/msm/dpu: Fix comment typo

Javier Martinez Canillas (1):
      drm/msm: Make .remove and .shutdown HW shutdown consistent

Krzysztof Kozlowski (5):
      dt-bindings: display/msm: dpu-msm8998: add missing DPU opp-table
      dt-bindings: display/msm: dpu-qcm2290: add missing DPU opp-table
      dt-bindings: display/msm: dpu-sc7180: add missing DPU opp-table
      dt-bindings: display/msm: dpu-sc7280: add missing DPU opp-table
      dt-bindings: display/msm: dpu-sdm845: add missing DPU opp-table

Kuogee Hsieh (3):
      drm/msm/dp: make eDP panel as the first connected connector
      drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4
      drm/msm/dp: correct 1.62G link rate at dp_catalog_ctrl_config_msa()

Marijn Suijten (8):
      drm/msm/dsi/phy: Reindent and reflow multiline function calls
      drm/msm/dsi_phy_28nm_8960: Use stack memory for temporary clock names
      drm/msm/dsi/phy: Replace hardcoded char-array length with sizeof()
      drm/msm/dsi_phy_28nm_8960: Replace parent names with clk_hw pointers
      drm/msm/dsi_phy_28nm: Replace parent names with clk_hw pointers
      drm/msm/dsi_phy_14nm: Replace parent names with clk_hw pointers
      drm/msm/dsi_phy_10nm: Replace parent names with clk_hw pointers
      drm/msm/dsi_phy_7nm: Replace parent names with clk_hw pointers

Nathan Chancellor (1):
      drm/msm/dsi: Remove use of device_node in dsi_host_parse_dt()

Rob Clark (19):
      drm/msm: Reorder lock vs submit alloc
      drm/msm: Small submit cleanup
      drm/msm: Split out idr_lock
      drm/msm/gem: Check for active in shrinker path
      drm/msm/gem: Rename update_inactive
      drm/msm/gem: Rename to pin/unpin_pages
      drm/msm/gem: Consolidate pin/unpin paths
      drm/msm/gem: Remove active refcnt
      drm/gem: Add LRU/shrinker helper
      drm/msm/gem: Convert to using drm_gem_lru
      drm/msm/gem: Unpin buffers earlier
      drm/msm/gem: Consolidate shrinker trace
      drm/msm/gem: Evict active GEM objects when necessary
      drm/msm/gem: Add msm_gem_assert_locked()
      drm/msm/gem: Convert to lockdep assert
      drm/msm: Add fault-injection support
      drm/msm/iommu: optimize map/unmap
      drm/msm: De-open-code some CP_EVENT_WRITE
      drm/msm/rd: Fix FIFO-full deadlock

Stephen Boyd (4):
      drm/msm/dp: Reorganize code to avoid forward declaration
      drm/msm/dp: Remove pixel_rate from struct dp_ctrl
      drm/msm/dp: Get rid of dp_ctrl_on_stream_phy_test_report()
      drm/msm/dp: Silence inconsistent indent warning

sunliming (1):
      drm/msm/dsi: fix the inconsistent indenting

ye xingchen (1):
      drm/msm/dsi: Remove the unneeded result variable

 .../bindings/display/msm/dp-controller.yaml        |  47 +++-
 .../bindings/display/msm/dpu-msm8998.yaml          |   4 +
 .../bindings/display/msm/dpu-qcm2290.yaml          |   3 +
 .../bindings/display/msm/dpu-sc7180.yaml           |   3 +
 .../bindings/display/msm/dpu-sc7280.yaml           |   3 +
 .../bindings/display/msm/dpu-sdm845.yaml           |   4 +
 .../devicetree/bindings/display/msm/gmu.yaml       | 166 ++++++++++--
 .../devicetree/bindings/display/msm/gpu.yaml       |   3 +-
 .../devicetree/bindings/display/msm/mdp4.yaml      |   2 +-
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |  15 +-
 drivers/gpu/drm/drm_gem.c                          | 170 ++++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  83 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  45 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  50 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  37 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  78 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  35 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  74 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  94 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |  65 +++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   9 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |   2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 150 +++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   1 -
 drivers/gpu/drm/msm/dp/dp_link.c                   |   5 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |  37 +--
 drivers/gpu/drm/msm/dsi/dsi.h                      |  31 +--
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 172 ++++++------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 299 ++++++---------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c              | 288 +++-----------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              | 162 +++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         | 185 ++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  87 +++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c         |  14 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         | 145 +++++-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    | 102 ++++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 188 +++++++------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |  25 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |   8 +
 drivers/gpu/drm/msm/msm_drv.c                      |  48 +++-
 drivers/gpu/drm/msm/msm_drv.h                      |  88 ++++--
 drivers/gpu/drm/msm/msm_gem.c                      | 179 +++++-------
 drivers/gpu/drm/msm/msm_gem.h                      | 123 +--------
 drivers/gpu/drm/msm/msm_gem_prime.c                |   4 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             | 164 ++++++-----
 drivers/gpu/drm/msm/msm_gem_submit.c               |  78 ++----
 drivers/gpu/drm/msm/msm_gpu.c                      |  24 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  14 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |   2 +
 drivers/gpu/drm/msm/msm_gpu_trace.h                |  36 ++-
 drivers/gpu/drm/msm/msm_io_utils.c                 |  22 ++
 drivers/gpu/drm/msm/msm_iommu.c                    | 101 +++++--
 drivers/gpu/drm/msm/msm_rd.c                       |   3 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   4 -
 drivers/gpu/drm/msm/msm_submitqueue.c              |   1 +
 include/drm/drm_gem.h                              |  55 ++++
 include/drm/drm_mipi_dsi.h                         |   2 +
 include/drm/drm_panel.h                            |   7 -
 73 files changed, 1860 insertions(+), 2082 deletions(-)
