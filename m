Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44851ABA509
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7597810E060;
	Fri, 16 May 2025 21:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C9RaaFJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE2F10E060;
 Fri, 16 May 2025 21:24:23 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-86142446f3fso66658839f.2; 
 Fri, 16 May 2025 14:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747430662; x=1748035462; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hunQ4H8lTiSGjqzJkC/Ab+nMJU3/VnMxmp9TrDpedc8=;
 b=C9RaaFJnwf/QWBL9CXT1t3lETnpH+Afgmi2othY56Uz2p3NK/UCGCix21aMkhOiFTb
 L5T1uWD21tOkwqdyO+V5IHKUIqHBmNw/I4HkLxSjpQfVPVdoBUti5F+SKmvkd389kpwc
 v9LYY6otDx3xitfVPPB4gYRJTYl7wNR6UgIxTCBcosdoGTsTD9TQJvpIGj8WrnQMjMsE
 SI2XerCeEXsOJ/DUcw0r26ZieowkAQVU9FerBD3qbBRCZjT2fILVov/j0amriL89Bn5k
 WSUu447VWopNtR4Ek/PhpfeI25ZODc0qXk5r3cu3hjmnoDPwnztb6DWPFMRyodz/iE87
 +MJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747430662; x=1748035462;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hunQ4H8lTiSGjqzJkC/Ab+nMJU3/VnMxmp9TrDpedc8=;
 b=nf/BqDR+aJNJCHB5FsYEQYkxIhuCOCdlWbHQQZaQ9zTDYRpUJceqKT0XP6bRjYXLb1
 ifAS3CcYIG9tE10brzUaYu7oCQm1L5e7GbY8DaQA793dWWkWHzItASUjYEHM+kIN4X4d
 fTn1595hWOcPV9wtxG+ly3k/QcWf+SLZMUZj09Ilz2wbflTR2Px6e3muz5Q/AL/GDz9j
 RhGxwzh8iUha8YtX0O8KT50f2xaiLVtbAT3p+RKDIimxvaV95/dF1QehW9ZnN56fCtCH
 xzC7USpIYBucv/RT+5LuGZ3ZZ1UG95/phJESb4B6SGbZtf9043RIWj7pWU/bkg54aw9S
 GpMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoGUWIV3bmxBExzS8B6Ygt7k0Z0xJ2Lmh2NfSvO/EF0Yw8A7NFVYVZYtpRgCfOCl+IZYKDtpIMMbM=@lists.freedesktop.org,
 AJvYcCVvZFnjNNmSXNYANgtIfTWRymaA4Rq+3XC7qP3xRVPWu1o4WEZaLjXa9QBwq7czgnfdRNYHC6408eSD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmRFe1mRg7TD8ubCebXns6m2uOLx+Z11llhCzTA2zRUN7m2kYs
 LfNiGGKUDBnuJvvqTejPr/DytCyBUGrt9KYbZXukFUt7ziEr4UF0snNbW1LyO6lSitGLrb1mKAb
 KsY6KNwQUyuXAk9K49ulByLHKJPI4ZDk=
X-Gm-Gg: ASbGncshjrRrTCP+fyN68IZGU/j89tpiWcgT8QrF2pw7b0bZC/CpmFjOdm7XdeMKe1z
 Biul4lFQunhSz4Vqow+onV0m7so25nhwX5641ljUZ7JfVs6b7CmN7vCrpzh1CEXAbswDM9CZaYK
 5TpY10BLeTNA/XzJsihX2RgCSTtyNqsEvi//KAcEBgs7lCfWY+N6qOF1D9vcgavQT2nmg=
X-Google-Smtp-Source: AGHT+IGjdEO/w3gIhDVBeeFTdrysqgOxyuo+RYwDrAXCZDpJPU96mUtcQdg57oSVoKaM/mKy1IloXCJ4GHTlv4pID58=
X-Received: by 2002:a05:6602:371b:b0:85b:3f1a:30aa with SMTP id
 ca18e2360f4ac-86a23229aabmr680256739f.9.1747430662007; Fri, 16 May 2025
 14:24:22 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 16 May 2025 14:24:10 -0700
X-Gm-Features: AX0GCFtP7DvImGIA2Ku6TTPV3B-2Yia4D2Tnclm3a819MTvBpglGhA8TuDsVtaw
Message-ID: <CAF6AEGv2Go+nseaEwRgeZbecet-h+Pf2oBKw1CobCF01xu2XVg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2025-05-16 for v6.16
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>
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

Hi Dave, Simona,

Pull for v6.16 as described below.  There are a pair of x1e80100 dts
patches, ack'd by Bjorn, to preserve ordering (the driver part needs
to land before the dts part).  These should not conflict with any
other dts patches in flight this cycle.

The following changes since commit 0d607a59a0f6593e72630854a8bcb8b01b8dce40:

  drm/panel-edp: Add support for CSW MNE007QS3-8 panel (2025-04-29
09:20:32 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2025-05-16

for you to fetch changes up to fc5c669c902c3039aa41731b6c58c0960d0b1bbf:

  dt-bindings: display: msm: correct example in SM8350 MDSS schema
(2025-05-13 21:53:34 +0300)

----------------------------------------------------------------
Updates for v6.16

CI:
- uprev mesa

GPU:
- ACD (Adaptive Clock Distribution) support for X1-85.  This is required
  enable the higher frequencies.
- Drop fictional `address_space_size`.  For some older devices, the address
  space size is limited to 4GB to avoid potential 64b rollover math problems
  in the fw.  For these, an `ADRENO_QUIRK_4GB_VA` quirk is added.  For
  everyone else we get the address space size from the SMMU `ias` (input
  address sizes), which is usually 48b.
- Improve robustness when GMU HFI responses time out
- Fix crash when throttling GPU immediately during boot
- Fix for rgb565_predicator on Adreno 7c3
- Remove `MODULE_FIRMWARE()`s for GPU, the GPU can load the firmware after
  probe and having partial set of fw (ie. sqe+gmu but not zap) causes problems

MDSS:
- Added SAR2130P support to MDSS driver

DPU:
- Changed to use single CTL path for flushing on DPU 5.x+
- Improved SSPP allocation code to allow sharing of SSPP between planes
- Enabled SmartDMA on SM8150, SC8180X, SC8280XP, SM8550
- Added SAR2130P support
- Disabled DSC support on MSM8937, MSM8917, MSM8953, SDM660
- Misc fixes

DP:
- Switch to use new helpers for DP Audio / HDMI codec handling
- Fixed LTTPR handling

DSI:
- Added support for SA8775P
- Added SAR2130P support

MDP4:
- Fixed LCDC / LVDS controller on

HDMI:
- Switched to use new helpers for ACR data
- Fixed old standing issue of HPD not working in some cases

----------------------------------------------------------------
Akhil P Oommen (7):
      drm/msm/adreno: Add support for ACD
      drm/msm/a6xx: Increase HFI response timeout
      drm/msm: a6x: Rework qmp_get() error handling
      drm/msm/adreno: Add module param to disable ACD
      dt-bindings: opp: Add v2-qcom-adreno vendor bindings
      arm64: dts: qcom: x1e80100: Add ACD levels for GPU
      arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3 for GPU

Aleksandrs Vinarskis (4):
      drm/msm/dp: Fix support of LTTPR initialization
      drm/msm/dp: Account for LTTPRs capabilities
      drm/msm/dp: Prepare for link training per-segment for LTTPRs
      drm/msm/dp: Introduce link training per-segment for LTTPRs

Ayushi Makhija (5):
      dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
      dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
      dt-bindings: display: msm: document DSI controller and phy on SA8775P
      drm/msm/dsi: add DSI PHY configuration on SA8775P
      drm/msm/dsi: add DSI support for SA8775P

Chen Ni (1):
      drm/msm: Convert comma to semicolon

Connor Abbott (1):
      drm/msm: Be more robust when HFI response times out

Dmitry Baryshkov (51):
      drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      drm/msm/dpu: program master INTF value
      drm/msm/dpu: pass master interface to CTL configuration
      drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      drm/msm/dpu: don't select single flush for active CTL blocks
      drm/msm/dpu: allocate single CTL for DPU >= 5.0
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      drm/msm/dpu: drop now-unused condition for has_legacy_ctls
      dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      drm/msm/mdp4: register the LVDS PLL as a clock provider
      drm/msm/mdp4: use parent_data for LVDS PLL
      drm/msm/mdp4: move move_valid callback to lcdc_encoder
      drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      drm/msm/dpu: allow sharing SSPP between planes
      drm/msm/dpu: enable SmartDMA on SM8150
      drm/msm/dpu: enable SmartDMA on SC8180X
      drm/msm/dpu: enable SmartDMA on SC8280XP
      drm/msm/dpu: enable SmartDMA on SM8550
      drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit
      dt-bindings: display/msm: dp-controller: describe SAR2130P
      dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
      dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
      dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
      dt-bindings: display/msm: Add Qualcomm SAR2130P
      drm/msm/mdss: add SAR2130P device configuration
      drm/msm/dsi/phy: add configuration for SAR2130P
      drm/msm/dpu: add catalog entry for SAR2130P
      drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timings()
      drm/msm/hdmi: use new helper for ACR tables
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      drm/msm/dpu: drop TE2 definitions
      drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
      drm/msm/dp: reuse generic HDMI codec implementation
      dt-bindings: display/msm/hdmi: drop obsolete GPIOs from schema
      drm/msm/hdmi: convert clock and regulator arrays to const arrays
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: ensure that HDMI is up if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P CTL blocks
      dt-bindings: display: msm: correct example in SM8350 MDSS schema

Konrad Dybcio (2):
      dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
      drm/msm/a6xx: Disable rgb565_predicator on Adreno 7c3

Krzysztof Kozlowski (7):
      drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer reset
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on ctl_path reset
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before blend setup
      drm/msm/dpu: Drop useless comments
      drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
      drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask

Luca Weiss (1):
      dt-bindings: msm: qcom,mdss: Document interconnect paths

Rob Clark (3):
      Merge remote-tracking branch 'drm-misc/drm-misc-next' into msm-next
      drm/msm/adreno: Drop fictional address_space_size
      drm/msm/adreno: Remove MODULE_FIRMWARE()'s

Rob Herring (Arm) (1):
      dt-bindings: display/msm: hdmi: Fix constraints on additional
'port' properties

Stephan Gerhold (1):
      drm/msm/gpu: Fix crash when throttling GPU immediately during boot

Vignesh Raman (1):
      drm/ci: uprev mesa

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   2 +
 .../devicetree/bindings/display/msm/hdmi.yaml      |  19 +-
 .../devicetree/bindings/display/msm/mdp4.yaml      |   9 +-
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |  12 +
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 181 ++++++++-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 439 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |  13 +-
 .../bindings/opp/opp-v2-qcom-adreno.yaml           |  96 +++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  27 +-
 drivers/gpu/drm/ci/build-igt.sh                    |   2 +-
 drivers/gpu/drm/ci/build.sh                        |   6 +-
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   6 +-
 drivers/gpu/drm/ci/image-tags.yml                  |   2 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |   2 +-
 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |   5 -
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   5 -
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |   3 -
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |   9 -
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  44 +--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  96 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  11 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  73 +++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |  21 +
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  19 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |   5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   4 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   5 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  12 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  11 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  21 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  20 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  14 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   6 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   8 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  21 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  25 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 433 ++++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  13 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 230 ++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  16 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  50 ++-
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 121 ------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c      |  51 ++-
 drivers/gpu/drm/msm/dp/dp_audio.c                  | 131 +-----
 drivers/gpu/drm/msm/dp/dp_audio.h                  |  27 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 126 ++++--
 drivers/gpu/drm/msm/dp/dp_display.c                |  55 ++-
 drivers/gpu/drm/msm/dp/dp_display.h                |   6 -
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   8 +
 drivers/gpu/drm/msm/dp/dp_link.h                   |   4 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  18 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  50 +++
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 133 ++++---
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  26 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c              | 107 +----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  63 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |  89 +----
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c                |  14 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   6 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   2 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |   7 +
 101 files changed, 2272 insertions(+), 1064 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
