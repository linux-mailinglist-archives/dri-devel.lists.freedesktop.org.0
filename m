Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1611734961
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 01:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9167C10E103;
	Sun, 18 Jun 2023 23:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F06C10E0FF;
 Sun, 18 Jun 2023 23:49:02 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-55b8f1c930eso1745624eaf.3; 
 Sun, 18 Jun 2023 16:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687132141; x=1689724141;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=39i6vwrlSSO8NvG1bfs0mcr6xet+mhaeM9w4D9nVrDg=;
 b=JfbuMgFWHKOaHeNnLPIbS+onQgF551aOkyDiB6jf//8DETUYpeujObCJhHhWZ3sIvc
 ZvMHoWOeQ/tH6zWnSaEkM4kXZB7QcPAFEhFNh2tX55Ssyqq3OUBaTiuLeG9Wy447wCio
 Loa+3kOh72HMj/ufxBJfKT4ELXkuXNqCghnZ1ARaLzxwK+0sswKdfjuTuGVe0xBfa0z+
 K9MZO0oFWZ17I4Bj3IbqaNnsLIc6Tyyxge0dEZiiUsfm+/ax+RByXgWdmtly2VvTD1pR
 479CzBETirfptXuJBVtzKtRkFUoO8hJTBwa9WH41xTfhdoL4TFy3r9nVscG9A2ZWt48e
 sZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687132141; x=1689724141;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=39i6vwrlSSO8NvG1bfs0mcr6xet+mhaeM9w4D9nVrDg=;
 b=F6eYOH4GnZ0LBffhMeG5T33Xg3CbMCnL26H81krMJlcIKgvxQzxhDON854yQWKGb0C
 fb2NpD9sueUCxQ+EUCARfiD6SgnQOf7XgJ9Jinr+xlnNH+KsAfOTM2q1a82AmTh/GB75
 Y6Ff05ROZG27cGYUQN9iuBoBf9DSYSwDspBMJPtYygyHPqRJLdlf+byo6fJrHQoyojUr
 AowDVzbiLwZBw4T9woZZY3WlkWnSEYsDcAgnFCdjkRLveP+Z7wRICflmFzjvgV7j1eIF
 kmCQW9aFdY3smWsQM8O+NfdrPpBkf1aOdBRhMVvzopaGFHqnyptkpqs2uNYGVXqDXSpe
 NQBg==
X-Gm-Message-State: AC+VfDxohHn3zXmTgyeGXAEnf+9NKyUvmIjrPDZ+7h59Qq5GEgvwBuB1
 85TK8dzdp1UUzkQvU/KRg+infb/MkOnMzaJRK2Q=
X-Google-Smtp-Source: ACHHUZ4D9O9pKSzunDnFw2FmmCTnu1IwpXKoQF6+uN7oYTgYdAFNOixJHsKWJf9zwmdoZJLBGS13zmwUEvRyXVT0Jlo=
X-Received: by 2002:a4a:be18:0:b0:55e:429c:f021 with SMTP id
 l24-20020a4abe18000000b0055e429cf021mr1217732oop.9.1687132140879; Sun, 18 Jun
 2023 16:49:00 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 18 Jun 2023 16:48:49 -0700
Message-ID: <CAF6AEGsUB=tRB4nR6ZCJMuLhro5zN3BQWUSywVYbaipqqDZ_cQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2023-06-18 for v6.5
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

This is the pull for v6.5, see below for description.  It includes a
back-merge of drm-next for DSC helpers.  Sorry it is somewhat late,
I was out of town last week.

(resend without all the back-merge commits in the msg)

The following changes since commit ba57b9b11f78530146f02b776854b2b6b6d344a4:

  Merge tag 'drm-intel-gt-next-2023-06-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-06-09
16:43:36 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-06-18

for you to fetch changes up to cd036d542afb82adfbbd43c5dbeb7010e8e91ee7:

  drm/msm/a6xx: Add A610 speedbin support (2023-06-18 11:35:27 -0700)

----------------------------------------------------------------
Updates for v6.5.. this includes a backmerg of drm-next tree to be able
to use new DRM DSC helpers.

Core:
+ Add Marijn Suijten as drm/msm reviewer
+ Adreno A660 bindings
+ SM8350 MDSS bindings fix
+ Fix adreno_is_a690() warnings
+ More generic (DRM) and MSM-specific DSC helpers

DP:
+ Removed obsolete USB-PD remains
+ Documented DP compatible string for sm8550 platform

DPU:
+ Enable missing features (DSPP, DSC, split display) on sc8180x,
  sc8280xp, sm8450
+ Enabled writeback on sc7280
+ Implemented tearcheck support to support vsync on SM150 and
  newer platforms
+ Native HDMI output support
+ Dropped unused features: regdma, GC, IGC
+ Fixed the DSC flush operations
+ Simplified QoS handling, removing obsolete and unused features
  and merging SSPP and WB code paths
+ Reworked dpu_encoder initialisation path
+ Enabled DSPP support on sdm845
+ Disabled color-management if DSPP blocks are not available
+ Added support for DSC 1.2 blocks found on sm8350 and later
+ Added .fb_dirty to fix CMD panels

DSI:
+ Drop powerup quirks in favour of using pre_enable_prev_first for
  downstream bridges
+ Fixed 14nm DSI PHY programming
+ Added support for DSI and 28nm DSI PHY on MSM8226 platform
+ Make use of DRM and MSM DSC helpers

MDP5:
+ Added support for display controller on MSM8226 platform

GPU:
+ A690 support
+ Don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA on devices with coherent SMMU
  (like A690)
+ Move cmdstream dumping out of fence signaling path
+ Cleanups
+ Support for a6xx devices without GMU (aka "GMU wrapper"
+ a610 support
+ a619_holi support (a619 variant without GMU)

----------------------------------------------------------------
Abhinav Kumar (8):
      drm/msm/dpu: remove DPU_DSPP_GC handling in dspp flush
      drm/msm/dpu: remove DPU_DSPP_IGC handling in dspp flush
      drm/msm/dpu: remove GC and IGC related code from dpu catalog
      drm/msm/dpu: drop DSPP_MSM8998_MASK from hw catalog
      drm/msm/dpu: add writeback support for sc7280
      drm/msm/dp: add module parameter for PSR
      drm/msm/dpu: add DSC blocks to the catalog of MSM8998
      drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets

Arnaud Vrac (5):
      drm/msm/dpu: tweak msm8998 hw catalog values
      drm/msm/dpu: tweak lm pairings in msm8998 hw catalog
      drm/msm/dpu: use hsync/vsync polarity set by the encoder
      drm/msm/dpu: fix cursor block register bit offset in msm8998 hw catalog
      drm/msm/dpu: set max cursor width to 512x512

Bjorn Andersson (5):
      drm/msm/dp: Clean up logs dp_power module
      drm/msm/dp: Clean up pdev/dev duplication in dp_power
      drm/msm/adreno: Add Adreno A690 support
      drm/msm/dp: Drop aux devices together with DP controller
      drm/msm/dp: Free resources after unregistering them

Dan Carpenter (2):
      drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
      drm/msm/dpu: tidy up some error checking

Dmitry Baryshkov (61):
      dt-bindings: display/msm/gmu: add Adreno 660 support
      drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
      drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
      drm/msm/dpu: enable DSPP and DSC on sc8180x
      drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0
      drm/msm/dpu: simplify intf allocation code
      drm/msm/dsi: don't allow enabling 14nm VCO with unprogrammed rate
      drm/msm/dpu: add HDMI output support
      drm/msm/dpu: drop the regdma configuration
      drm/msm/dpu: stop mapping the regdma region
      drm/msm/dpu: drop unused SSPP sub-block information
      drm/msm/dpu: drop SSPP's SRC subblock
      drm/msm/dpu: access QSEED registers directly
      drm/msm/dpu: access CSC/CSC10 registers directly
      drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during DSC init
      drm/msm/dpu: remove futile checks from dpu_rm_init()
      drm/msm/dpu: use PINGPONG_NONE for LMs with no PP attached
      drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()
      drm/msm/dpu: fix SSPP register definitions
      drm/msm/dpu: simplify CDP programming
      drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
      drm/msm/dpu: rearrange QoS setting code
      drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
      drm/msm/dpu: simplify qos_ctrl handling
      drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
      drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
      drm/msm/dpu: use common helper for WB and SSPP QoS setup
      drm/msm/dsi: remove extra call to dsi_get_pclk_rate()
      drm/msm/dsi: use mult_frac for pclk_bpp calculation
      drm/msm/dpu: drop dpu_encoder_phys_ops::late_register()
      drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
      drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
      drm/msm/dpu: separate common function to init physical encoder
      drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
      drm/msm/dpu: inline dpu_encoder_get_wb()
      drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
      drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
      drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
      drm/msm/dp: remove most of usbpd-related remains
      drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
      drm/msm/dpu: use PINGPONG_NONE to unbind WB from PP
      drm/msm/a6xx: initialize GMU mutex earlier
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi' and 'msm-next-lumag-mdp5'
into msm-next-lumag
      drm/msm/adreno: fix sparse warnings in a6xx code
      drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
      drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA with coherent SMMU
      drm/msm/a5xx: really check for A510 in a5xx_gpu_init
      drm/msm/adreno: warn if chip revn is verified before being set
      drm/msm/adreno: change adreno_is_* functions to accept const argument
      Merge branch 'drm-next' of git://anongit.freedesktop.org/drm/drm
into msm-next-lumag-base
      drm/msm/adreno: make adreno_is_a690()'s argument const
      drm/msm/dpu: do not enable color-management if DSPPs are not available
      drm/msm/dpu/catalog: define DSPP blocks found on sdm845
      drm/display/dsc: add helper to set semi-const parameters
      drm/msm/dsi: use DRM DSC helpers for DSC setup
      drm/msm: provide fb_dirty implemenation
      drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
      drm/msm/dpu: correct MERGE_3D length
      drm/msm/dpu: remove unused INTF_NONE interfaces
      drm/msm/dsi: dsi_host: drop unused clocks
      drm/msm/dsi: split dsi_ctrl_config() function

Douglas Anderson (2):
      drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset
      drm/msm/dsi: More properly handle errors in regards to
dsi_mgr_bridge_power_on()

Jessica Zhang (12):
      drm/display/dsc: Add flatness and initial scale value calculations
      drm/display/dsc: Add drm_dsc_get_bpp_int helper
      drm/msm: Add MSM-specific DSC helper methods
      drm/msm/dpu: Use fixed DRM DSC helper for det_thresh_flatness
      drm/msm/dpu: Fix slice_last_group_size calculation
      drm/msm/dsi: Use MSM and DRM DSC helper methods
      drm/msm/dsi: update hdisplay calculation for dsi_timing_setup
      msm/drm/dsi: Round up DSC hdisplay calculation
      drm/msm/dsi: Reduce pclk rate for compression
      drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag for DPU >= 7.0
      drm/msm/dpu: Set DATA_COMPRESS on command mode for DCE/DSC 1.2
      drm/msm/dsi: Remove incorrect references to slice_count

Jianhua Lu (1):
      dt-bindings: display/msm: dsi-controller-main: Document qcom,
master-dsi and qcom, sync-dual-dsi

Konrad Dybcio (32):
      dt-bindings: display: msm: sm8350-mdss: Fix DSI compatible
      drm/msm/dpu: Move dpu_hw_{tear_check, pp_vsync_info} to dpu_hw_mdss.h
      drm/msm/dpu: Set DPU_DATA_HCTL_EN for in INTF_SC7180_MASK
      dt-bindings: display/msm: dsi-controller-main: Add SM6350
      dt-bindings: display/msm: dsi-controller-main: Add SM6375
      dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
      dt-bindings: display/msm: Add SM6350 MDSS
      dt-bindings: display/msm: Add SM6375 MDSS
      drm/msm/dpu: Add SM6350 support
      drm/msm/dpu: Add SM6375 support
      drm/msm: mdss: Add SM6350 support
      drm/msm: mdss: Add SM6375 support
      dt-bindings: display/msm: gpu: Document GMU wrapper-equipped A6xx
      dt-bindings: display/msm/gmu: Add GMU wrapper
      drm/msm/adreno: Use adreno_is_revn for A690
      drm/msm/a6xx: Remove static keyword from sptprac en/disable functions
      drm/msm/a6xx: Move force keepalive vote removal to a6xx_gmu_force_off()
      drm/msm/a6xx: Move a6xx_bus_clear_pending_transactions to a6xx_gpu
      drm/msm/a6xx: Improve a6xx_bus_clear_pending_transactions()
      drm/msm/a6xx: Add a helper for software-resetting the GPU
      drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
      drm/msm/a6xx: Extend and explain UBWC config
      drm/msm/a6xx: Move CX GMU power counter enablement to hw_init
      drm/msm/a6xx: Introduce GMU wrapper support
      drm/msm/adreno: Disable has_cached_coherent in GMU wrapper configurations
      drm/msm/a6xx: Add support for A619_holi
      drm/msm/a6xx: Add A610 support
      drm/msm/a6xx: Fix some A619 tunables
      drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
      drm/msm/a6xx: Use adreno_is_aXYZ macros in speedbin matching
      drm/msm/a6xx: Add A619_holi speedbin support
      drm/msm/a6xx: Add A610 speedbin support

Kuogee Hsieh (9):
      drm/msm/dpu: set DSC flush bit correctly at MDP CTL flush register
      drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for DPU < 7.0.0
      drm/msm/dpu: Guard PINGPONG DSC ops behind DPU_PINGPONG_DSC bit
      drm/msm/dpu: Introduce PINGPONG_NONE to disconnect DSC from PINGPONG
      drm/msm/dpu: always clear every individual pending flush mask
      drm/msm/dpu: separate DSC flush update out of interface
      drm/msm/dpu: Tear down DSC datapath on encoder cleanup
      drm/msm/dp: enable HDP plugin/unplugged interrupts at hpd_enable/disable
      drm/msm/dpu: add support for DSC encoder v1.2 engine

Luca Weiss (7):
      drm/msm/iommu: Fix null pointer dereference in no-IOMMU case
      dt-bindings: msm: dsi-phy-28nm: Document msm8226 compatible
      dt-bindings: display/msm: dsi-controller-main: Add msm8226 compatible
      drm/msm/dsi: Add configuration for MSM8226
      drm/msm/dsi: Add phy configuration for MSM8226
      dt-bindings: display/msm: qcom, mdp5: Add msm8226 compatible
      drm/msm/mdp5: Add MDP5 configuration for MSM8226

Marijn Suijten (26):
      drm/msm/dpu: Assign missing writeback log_mask
      drm/msm/dpu: Remove unused INTF0 interrupt mask from SM6115/QCM2290
      drm/msm/dpu: Remove TE2 block and feature from DPU >= 5.0.0 hardware
      drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets out of hwio header
      drm/msm/dpu: Reindent REV_7xxx interrupt masks with tabs
      drm/msm/dpu: Fix PP_BLK_DIPHER -> DITHER typo
      drm/msm/dpu: Use V2 DITHER PINGPONG sub-block in SM8[34]50/SC8280XP
      drm/msm/dpu: Set PINGPONG block length to zero for DPU >= 7.0.0
      drm/msm/dpu: Remove duplicate register defines from INTF
      MAINTAINERS: Add Marijn Suijten as drm/msm reviewer
      drm/msm/dpu: Drop unused members from HW structs
      drm/msm/dpu: Pass catalog pointers in RM to replace for-loop ID lookups
      drm/msm/dpu: Use V4.0 PCC DSPP sub-block in SC7[12]80
      drm/msm/dpu: Remove extraneous register define indentation
      drm/msm/dpu: Sort INTF registers numerically
      drm/msm/dpu: Take INTF index as parameter in interrupt register defines
      drm/msm/dpu: Drop unused poll_timeout_wr_ptr PINGPONG callback
      drm/msm/dpu: Move autorefresh disable from CMD encoder to pingpong
      drm/msm/dpu: Disable pingpong TE on DPU 5.0.0 and above
      drm/msm/dpu: Disable MDP vsync source selection on DPU 5.0.0 and above
      drm/msm/dpu: Factor out shared interrupt register in INTF_BLK macro
      drm/msm/dpu: Describe TEAR interrupt registers for DSI interfaces
      drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block
      drm/msm/dpu: Merge setup_- and enable_tearcheck pingpong callbacks
      drm/msm/dpu: Implement tearcheck support on INTF block
      drm/msm/dpu: Remove intr_rdptr from DPU >= 5.0.0 pingpong config

Neil Armstrong (1):
      dt-bindings: display: msm: dp-controller: document SM8550 compatible

Rob Clark (8):
      drm/msm/atomic: Don't try async if crtc not active
      drm/msm: Fix vmap madv warning
      drm/msm: Fix submit error-path leaks
      iommu/arm-smmu-qcom: Fix missing adreno_smmu's
      drm/msm: Be more shouty if per-process pgtables aren't working
      drm/msm: Set max segment size earlier
      drm/msm: Move cmdstream dumping out of sched kthread
      drm/msm/a6xx: Fix a690 CP_PROTECT settings

Srinivas Kandagatla (1):
      drm/msm/dp: unregister audio driver during unbind

Su Hui (1):
      drm/msm: Remove unnecessary (void*) conversions

Thomas Zimmermann (1):
      drm/msm: Use struct fb_info.screen_buffer

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |  18 +
 .../bindings/display/msm/dsi-phy-28nm.yaml         |   3 +-
 .../devicetree/bindings/display/msm/gmu.yaml       |  51 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |  61 +-
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |   1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |   1 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  23 +-
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 213 +++++++
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 215 +++++++
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |   2 +-
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/display/drm_dsc_helper.c           |  59 ++
 drivers/gpu/drm/msm/Makefile                       |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 130 +++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 624 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  14 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  33 ++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  31 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            | 154 +++--
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  54 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  51 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  42 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  78 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  42 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  24 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  14 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 173 ++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  14 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 138 +++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  56 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  47 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  87 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  68 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  53 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 287 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  28 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 259 ++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  20 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  58 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 158 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  98 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  76 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  55 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 387 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  38 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 183 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 340 ++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  51 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |  33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    | 125 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  78 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        | 362 ++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  66 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  50 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  52 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |  33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  85 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  45 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 139 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 167 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  68 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  14 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  82 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   2 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |  12 +
 drivers/gpu/drm/msm/dp/dp_audio.h                  |   2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   3 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   1 -
 drivers/gpu/drm/msm/dp/dp_debug.c                  |   6 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |   5 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 128 +----
 drivers/gpu/drm/msm/dp/dp_hpd.c                    |  67 ---
 drivers/gpu/drm/msm/dp/dp_hpd.h                    |  78 ---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   1 -
 drivers/gpu/drm/msm/dp/dp_power.c                  |  78 +--
 drivers/gpu/drm/msm/dp/dp_power.h                  |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 177 ++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  68 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |  97 ++++
 drivers/gpu/drm/msm/msm_atomic.c                   |   2 +
 drivers/gpu/drm/msm/msm_debugfs.c                  |   6 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   4 +-
 drivers/gpu/drm/msm/msm_dsc_helper.h               |  38 ++
 drivers/gpu/drm/msm/msm_fbdev.c                    |  20 +
 drivers/gpu/drm/msm/msm_gem.c                      |  22 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  32 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   4 -
 drivers/gpu/drm/msm/msm_iommu.c                    |   9 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  10 +
 drivers/gpu/drm/msm/msm_rd.c                       |  24 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |  10 +
 include/drm/display/drm_dsc_helper.h               |   4 +
 118 files changed, 4603 insertions(+), 2631 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
 create mode 100644 drivers/gpu/drm/msm/msm_dsc_helper.h
