Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EAA681E6E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 23:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4B810E130;
	Mon, 30 Jan 2023 22:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469A210E130;
 Mon, 30 Jan 2023 22:51:46 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id p133so11402878oig.8;
 Mon, 30 Jan 2023 14:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JLfwhfzga9llztUAJKH2uBrKxvpKISWe9EbVQV4bALo=;
 b=YtSLE4oTWAo9zbLYkdNReT4pjL77WmY6i/QL3faiEpau9W5/aGtUxXpG2CXs5Dl0xt
 q+EVytjcY3uZGUtjqOzUGV6YlZwKQqaExm7nldV7nOBNIrlaq5O9OTpxzot0QrseVXKN
 XX3uxAkPDzpz+vxa7UxQEGS3ZiugCYO6vSoyg+bLL4eh2ZD2BZIu73Vv5wwYkMpfloU/
 PAvpJHSqeCp7/y4w/jsd8qCKVnaC7oEeYd1uf06Rk+gJ6bTKZdRgXpqH1C8c6l1Kmhwk
 wFFrMv9t1dOvSJ6NM0r0mM+jKBYxYRLZAn9c7RP3wQp0a9N9nL8kjPcSvh+3J6T0LoVV
 qeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JLfwhfzga9llztUAJKH2uBrKxvpKISWe9EbVQV4bALo=;
 b=DkPYMVJ8j/cP2A6GxAarV17+Y+kmEyJmYLDp0Hsal0jr+ZjB+YE5xSexTpskAzunu6
 9D3349gTlbHVaOq9jPXhQio5wh0QWKI0q74C/JfNCg1Z3iK6K98P88mIHz80ZclGC8MI
 uR2SrrscvKMF4eNKrIZTB96bVRoyzC6Mn1vKm6syAQ5fZ+OTp7LPoBRDDCo9Ju3UU1S9
 xCPBYN68s04GuYrJeYJG0rc7296edqbSXpZVA9099w7eVKX1Hw3/aoDQfrp6TwgrvYeV
 /IJWiTiRgRQxZDlHxbn5LegxzT2YLORPkt+ROLUjhrO4B3vSKT3KtmSQEkQHAxLb8P2i
 mfyA==
X-Gm-Message-State: AFqh2kqBGozmqOEniwOrPyCgtyNGYMh9Hhyl8fydOb6sQLCjvc0yQjx4
 bmImKUGVeEYE3cKa8F6ZSP9u/rbzkP5n7PlpBuQ=
X-Google-Smtp-Source: AMrXdXurp8FCt3y8C6ZVIQ42dMfDn4SgpGaLbNnhQ6gOq8Atfh7vAd/kgXg2MNCAkraMEpVCEZ8szsA0acqhBxyK/Zw=
X-Received: by 2002:a54:418f:0:b0:360:ffcc:3685 with SMTP id
 15-20020a54418f000000b00360ffcc3685mr2375392oiy.183.1675119105303; Mon, 30
 Jan 2023 14:51:45 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 30 Jan 2023 14:51:42 -0800
Message-ID: <CAF6AEGv6zQ-zsgS+NG+WuV=tk51q9vA2QdKqYhNgiXQddAdZjA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2023-01-30 for v6.3
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Hui Tang <tanghui20@huawei.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Adam Skladowski <a39.skl@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here is msm-next for v6.3.  There is one devfreq patch to address a
build break issue in configurations without PM_DEVFREQ enabled (such
as COMPILE_TEST=y).

The following changes since commit 03a0a1040895711e12c15ab28d4d1812928e171d:

  Merge tag 'drm-misc-next-2023-01-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-01-04
14:59:25 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-01-30

for you to fetch changes up to dbd7a2a941b8cbf9e5f79a777ed9fe0090eebb61:

  PM / devfreq: Fix build issues with devfreq disabled (2023-01-30
07:37:40 -0800)

----------------------------------------------------------------
msm-next for v6.3

There is one devfreq patch, maintainer acked to land via msm-next to
avoid a build break on platforms that do not support PM_DEVFREQ.  And
otherwise the usual assortment:

GPU:
- Add MSM_SUBMIT_BO_NO_IMPLICIT
- a2xx: Support to load legacy firmware
- a6xx: GPU devcore dump updates for a650/a660
- GPU devfreq tuning and fixes

DPU, DSI, MDSS:
- Support for SM8350, SM8450 SM8550 and SC8280XP platform

Core:
- Added bindings for SM8150 (driver support already present)

DPU:
- Partial support for DSC on SM8150 and SM8250
- Fixed color transformation matrix being lost on suspend/resume
- Include DSC blocks into register snapshot
- Misc HW catalog fixes

DP:
- Support for DP on SDM845 and SC8280XP platforms
- HPD fixes
- Support for limiting DP link rate via DT property, this enables
- Support for HBR3 rates.

DSI:
- Validate display modes according to the DSI OPP table
- DSI PHY support for the SM6375 platform
- Fixed byte intf clock selection for 14nm PHYs
- Fix the case of empty OPP tables (fixing db410c)
- DT schema rework and fixes

HDMI:
- Turn 8960 HDMI PHY into clock provider,
- Make 8960 HDMI PHY use PXO clock from DT

MDP5:
- Schema conversion to YAML

----------------------------------------------------------------
Abhinav Kumar (2):
      drm/msm/dsi: add a helper method to compute the dsi byte clk
      drm/msm/dsi: implement opp table based check for
dsi_mgr_bridge_mode_valid()

Adam Skladowski (2):
      dt-bindings: display: msm: Rename mdss node name in example
      dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible

Akhil P Oommen (5):
      drm/msm/a6xx: Avoid gx gbit halt during rpm suspend
      drm/msm/adreno: Fix null ptr access in adreno_gpu_cleanup()
      drm/msm: Fix failure paths in msm_drm_init()
      drm/msm/a6xx: Update a6xx gpu coredump
      drm/msm/a6xx: Update ROQ size in coredump

Bjorn Andersson (10):
      dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
      drm/msm/dp: Stop using DP id as index in desc
      drm/msm/dp: Add DP and EDP compatibles for SC8280XP
      drm/msm/dp: Add SDM845 DisplayPort instance
      drm/msm/dp: Rely on hpd_enable/disable callbacks
      drm/msm/dp: Implement hpd_notify()
      dt-bindings: display/msm: Add binding for SC8280XP MDSS
      drm/msm/dpu: Introduce SC8280XP
      drm/msm: Introduce SC8280XP MDSS
      drm/msm/dp: Remove INIT_SETUP delay

Bryan O'Donoghue (7):
      dt-bindings: msm: dsi-phy-28nm: Add missing qcom,
dsi-phy-regulator-ldo-mode
      dt-bindings: msm: dsi-controller-main: Fix operating-points-v2 constraint
      dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
      dt-bindings: msm: dsi-controller-main: Fix description of core clock
      dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
      dt-bindings: msm: dsi-controller-main: Add compatible strings
for every current SoC
      dt-bindings: msm: dsi-controller-main: Document clocks on a per
compatible basis

Christophe JAILLET (1):
      drm/msm/hdmi: Fix the error handling path of msm_hdmi_dev_probe()

Dmitry Baryshkov (57):
      drm/msm: another fix for the headless Adreno GPU
      dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
      drm/msm/dsi/phy: rework register setting for 7nm PHY
      drm/msm/mdp4: convert to drm_crtc_handle_vblank()
      drm/msm/mdp5: convert to drm_crtc_handle_vblank()
      dt-bindings: display/msm: *mdss.yaml: split required properties clauses
      drm/msm: clean event_thread->worker in case of an error
      dt-bindings: display/msm: gpu: add rbcpr clock
      dt-bindings: display/msm: qcom, sdm845-mdss: document the DP device
      dt-bindings: display/msm: *dpu.yaml: split required properties clauses
      dt-bindings: display/msm: add support for the display on SM8450
      drm/msm/dpu: merge all MDP TOP registers to dpu_hwio.h
      drm/msm/dpu: add support for MDP_TOP blackhole
      drm/msm/dpu: add support for SM8450
      drm/msm: mdss add support for SM8450
      drm/msm/dpu: disable DSC blocks for SM8350
      drm/msm/a2xx: support loading legacy (iMX) firmware
      dt-bindings: display/msm: qcom, mdss: fix HDMI PHY node names
      drm/msm/dpu: remove dpu_encoder_virt_ops
      drm/msm/dpu: merge two CRTC debugfs dirs
      drm/msm/dpu: enable sourcesplit for sc7180/sc7280
      dt-bindings: display/msm: convert MDP5 schema to YAML format
      dt-bindings: display/msm: add SoC-specific compats to qcom, mdp5.yaml
      dt-bindings: display/msm: add core clock to the mdss bindings
      dt-bindings: display/msm: rename mdss nodes to display-subsystem
      dt-bindings: display/msm: rename mdp nodes to display-controller
      drm/msm/dpu: fix blend setup for DMA4 and DMA5 layers
      drm/msm/dpu: simplify ctl_setup_blendstage calculation
      drm/msm/dpu: simplify blend configuration
      drm/msm/dpu: enable DPU_MDP_AUDIO_SELECT for sc8180x
      drm/msm/dpu: add missing dpu_encoder kerneldoc
      dt-bindings: display/msm: add qcom, sc8280xp-edp to list of eDP devices
      dt-bindings: display/msm: qcom, sc8280xp-mdss: add DP / eDP child nodes
      drm/msm/dpu: point sc8280xp_dpu_cfg to sc8280xp_regdma
      drm/msm/dpu: use sm8350_regdma on SM8350 platform
      drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
      drm/msm/dsi: add support for DSI 2.6.0
      drm/msm/dsi: correct byte intf clock rate for 14nm DSI PHY
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi',
'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag
      Merge branch 'msm-next-lumag' into HEAD
      dt-bindings: display/msm: dsi-controller-main: remove #address/#size-cells
      dt-bindings: display/msm: dsi-controller-main: account for apq8064
      dt-bindings: display/msm: dsi-controller-main: allow using fewer lanes
      dt-binbings: display/msm: dsi-controller-main: add missing supplies
      drm/msm/dpu: sc7180: add missing WB2 clock control
      drm/msm: use strscpy instead of strncpy
      drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg doc
      drm/msm/dpu: add missing ubwc_swizzle setting to catalog
      drm/msm/dpu: fix sm8450 CTL configuration
      drm/msm/dsi: properly handle the case of empty OPP table in
dsi_mgr_bridge_mode_valid
      dt-bindings: phy: qcom, hdmi-phy-other: use pxo clock
      dt-bindings: phy: qcom, hdmi-phy-other: mark it as clock provider
      drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
      drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
      drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
      drm/msm/dpu: correct the UBWC version on sm6115
      drm/msm/dpu: set pdpu->is_rt_pipe early in dpu_plane_sspp_atomic_update()

Hui Tang (1):
      drm/msm/dpu: check for null return of devm_kzalloc() in
dpu_writeback_init()

Jessica Zhang (1):
      drm/msm/dpu: Reapply CTM if modeset is needed

Jiasheng Jiang (8):
      drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
      drm/msm/gem: Add check for kmalloc
      drm/msm: Add missing check and destroy for alloc_ordered_workqueue
      drm/msm/dsi: Add missing check for alloc_ordered_workqueue
      drm/msm/dsi: Drop the redundant fail label
      drm/msm/dpu: Add check for cstate
      drm/msm/dpu: Add check for pstates
      drm/msm/mdp5: Add check for kzalloc

Konrad Dybcio (10):
      dt-bindings: msm/dsi: Don't require vcca-supply on 14nm PHY
      dt-bindings: msm/dsi: Don't require vdds-supply on 10nm PHY
      drm/msm/adreno: Make adreno quirks not overwrite each other
      drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ mask
      dt-bindings: display/msm: Add SM8150 MDSS & DPU
      dt-bindings: display/msm: Add SM8150 MDSS & DPU
      dt-bindings: display/msm: Add SM6375 DSI PHY
      drm/msm/dsi: Add phy configuration for SM6375
      dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
      drm/msm/dsi: Allow 2 CTRLs on v2.5.0

Krzysztof Kozlowski (2):
      dt-bindings: display: msm: drop unneeded list for single compatible
      dt-bindings: display: msm: drop redundant part of title

Kuogee Hsieh (5):
      drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq is not
for aux transfer
      dt-bindings: msm/dp: add data-lanes and link-frequencies property
      drm/msm/dp: parse data-lanes as property of dp_out endpoint
      drm/msm/dp: Add capability to parser and retrieve max DP link
supported rate from link-frequencies property of dp_out endpoint
      drm/msm/dp: add support of max dp link rate

Marijn Suijten (10):
      drm/msm/dpu: Print interrupt index in addition to the mask
      drm/msm/dpu: Wire up DSC mask for active CTL configuration
      drm/msm/dsi: Use DSC slice(s) packet size to compute word count
      drm/msm/dsi: Flip greater-than check for slice_count and slice_per_intf
      drm/msm/dpu: Reject topologies for which no DSC blocks are available
      drm/msm/dpu: Remove num_enc from topology struct in favour of num_dsc
      drm/msm/dpu: Implement DSC binding to PP block for CTL V1
      drm/msm/dpu: Add DSC configuration for SM8150 and SM8250
      drm/msm/dpu: Disallow unallocated resources to be returned
      drm/msm/dpu: Add DSC hardware blocks to register snapshot

Miaoqian Lin (1):
      drm/msm/dpu: Fix memory leak in msm_mdss_parse_data_bus_icc_path

Neil Armstrong (5):
      drm/msm/dpu: add support for SM8550
      drm/msm: mdss: add support for SM8550
      dt-bindings: display/msm: document the SM8550 DSI PHY
      drm/msm/dsi: add support for DSI-PHY on SM8550
      drm/msm/dsi: add support for DSI 2.7.0

Rob Clark (5):
      drm/msm: Add MSM_SUBMIT_BO_NO_IMPLICIT
      drm/msm/gpu: Add devfreq tuning debugfs
      drm/msm/gpu: Bypass PM QoS constraint for idle clamp
      drm/msm/gpu: Add default devfreq thresholds
      PM / devfreq: Fix build issues with devfreq disabled

Robert Foss (5):
      dt-bindings: display: msm: Add qcom, sm8350-dpu binding
      dt-bindings: display: msm: Add qcom, sm8350-mdss binding
      drm/msm/dpu: Add SM8350 to hw catalog
      drm/msm/dpu: Add support for SM8350
      drm/msm: Add support for SM8350

Yang Li (1):
      drm/msm/dpu: Fix some kernel-doc comments

 .../bindings/display/msm/dp-controller.yaml        |  31 +-
 .../bindings/display/msm/dpu-common.yaml           |  12 +-
 .../bindings/display/msm/dsi-controller-main.yaml  | 287 ++++++-
 .../bindings/display/msm/dsi-phy-10nm.yaml         |   1 -
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 -
 .../bindings/display/msm/dsi-phy-28nm.yaml         |   5 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   5 +-
 .../bindings/display/msm/dsi-phy-common.yaml       |   7 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   2 +
 .../devicetree/bindings/display/msm/mdp5.txt       | 132 ----
 .../bindings/display/msm/mdss-common.yaml          |   9 +-
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml | 156 ++++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |  55 +-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  12 +-
 .../bindings/display/msm/qcom,msm8998-mdss.yaml    |  14 +-
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  12 +-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |   8 +-
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  12 +-
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  12 +-
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   9 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   9 +-
 .../bindings/display/msm/qcom,sc8280xp-dpu.yaml    | 122 +++
 .../bindings/display/msm/qcom,sc8280xp-mdss.yaml   | 151 ++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  12 +-
 .../bindings/display/msm/qcom,sdm845-mdss.yaml     |  20 +-
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |   5 +-
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |   5 +-
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  92 +++
 .../bindings/display/msm/qcom,sm8150-mdss.yaml     | 332 ++++++++
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      |   7 +
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     |  14 +-
 .../bindings/display/msm/qcom,sm8350-dpu.yaml      | 120 +++
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     | 223 ++++++
 .../bindings/display/msm/qcom,sm8450-dpu.yaml      | 139 ++++
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     | 345 ++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml          |  27 +-
 drivers/gpu/drm/msm/Kconfig                        |   7 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  27 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |  18 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  15 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   9 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  61 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  66 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  47 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  12 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 872 ++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 147 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  27 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  25 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |  21 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c           |   9 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   5 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c           |   9 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       |   3 +
 drivers/gpu/drm/msm/dp/dp_aux.c                    |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c                | 157 ++--
 drivers/gpu/drm/msm/dp/dp_display.h                |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   3 +
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   4 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   7 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   1 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  50 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |   2 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   3 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  22 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  69 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  20 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  12 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 243 +++++-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  16 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c           |  21 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |  12 +
 drivers/gpu/drm/msm/msm_drv.c                      |  20 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  12 +-
 drivers/gpu/drm/msm/msm_fence.c                    |   2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  15 +
 drivers/gpu/drm/msm/msm_gpu.h                      |  15 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              | 148 ++--
 drivers/gpu/drm/msm/msm_mdss.c                     |  22 +-
 include/linux/devfreq.h                            |   7 +-
 include/uapi/drm/msm_drm.h                         |   4 +-
 101 files changed, 4117 insertions(+), 784 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
