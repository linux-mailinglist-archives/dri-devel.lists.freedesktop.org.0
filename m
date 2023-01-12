Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38324668737
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DE210E94F;
	Thu, 12 Jan 2023 22:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8B10E94D;
 Thu, 12 Jan 2023 22:47:13 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-15b9c93848dso12254991fac.1; 
 Thu, 12 Jan 2023 14:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FQUwPv/TMyXJrNzfCcwmEvY/QdFqohc2tALE1xmmzVM=;
 b=om+f6raMoRk1heKxqHNySh0DV96srUosmJsC04L7Nyr2ihmjajq+tPA3goALZ4ynX0
 0eETcEId6DBKdSrGTFkEuCUISndR7vD1tABN7vsW6EA/xl6PiGq09c6h0Iavjyra8pEu
 R/Vp9Xa1xyeoFgbKPJEHxkV4L0GDCpn9JqHb62FysvcpxgB7hE5CEY++UnushXTx+LCp
 aVS3DJQzX1vTFdaapDi5ikREJtENmHKcxTvUzxFqGyPRHsi1nJ4O1ArI6+9qSAXK/JXW
 yocDO2wOCZqP7GEYrfiek0g289CmMskGZfL4PSV8JBHE5rD+W5VLSWQqxL7apwCxqPvH
 QoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FQUwPv/TMyXJrNzfCcwmEvY/QdFqohc2tALE1xmmzVM=;
 b=XnKkDjCR0bGnRxzkpsRNEDtNRQo4/oDy/0AQ/KH/Tzk/jpWhf1zIDABSaLsWLlyjYq
 PCe8svqQNljnhf40GAeWjEu/EizV+m+IYHRwnl0ZTwoxi/ffn6oWZvq5J/EuzRB8WXSW
 gMMyrWo62z3oN+g6aWjUIfabviTA58JWKL9e2AEDFW+j62K5Fvy8qSlc9gj9O/OyQWEY
 Xb09+/rK6xb2eYwt+8PEUwYTsTH7Ipw+s9o+3sbN6X6eqVSAw3EJdWj0YkVKexyoPO5r
 VwZfWpBVAqFbr+kIOQvdKvORkF8T4nTh9bYgYFY1b/w9i2UrTKWzpedubAuwzJB+ErNw
 v5Iw==
X-Gm-Message-State: AFqh2kqUhpSPLNJn2dBspJ5vEq8WX3olmxt5Vrbg3Z6ps3//TriVYY+N
 w+WVlCQXYIIqvbRmR2kXJBzgwEY3+ZVGXp1EzCo=
X-Google-Smtp-Source: AMrXdXvdZptTCsXrHi4BTk//sSbh/jnXYupMny8L1cXQkzTKzWGrFLrL6ndL5Yx77FuXhtnFkr2ea4eIUTBbzgkrI58=
X-Received: by 2002:a05:6870:cb98:b0:15b:96b8:e2be with SMTP id
 ov24-20020a056870cb9800b0015b96b8e2bemr922634oab.38.1673563632873; Thu, 12
 Jan 2023 14:47:12 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 12 Jan 2023 14:47:07 -0800
Message-ID: <CAF6AEGv7=in_MHW3kdkhqh7ZFoVCmnikmr29YYHCXR=7aOEneg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-01-12 for v6.3-rc4
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

Hi Dave,

A few fixes for the v6.3 cycle.  Summary below.

The following changes since commit 8d1d17d47eaebe4466459846d07e4ba8953fa585:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi' and
'msm-next-lumag-mdp5' into msm-next-lumag (2022-11-26 12:06:29 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-01-12

for you to fetch changes up to f4a75b5933c998e60fd812a7680e0971eb1c7cee:

  drm/msm/a6xx: Avoid gx gbit halt during rpm suspend (2023-01-05
15:13:16 -0800)

----------------------------------------------------------------
msm-fixes for v6.3-rc4

Display Fixes:

- Fix the documentation for dpu_encoder_phys_wb_init() and
  dpu_encoder_phys_wb_setup_fb() APIs to address doc warnings
- Remove vcca-supply and vdds-supply as mandatory for 14nm PHY and
  10nm PHY DT schemas respectively as they are not present on some
  SOCs using these PHYs
- Add the dsi-phy-regulator-ldo-mode to dsi-phy-28nm.yaml as it was
  missed out during txt to yaml migration
- Remove operating-points-v2 and power-domain as a required property
  for the DSI controller as thats not the case for every SOC
- Fix the description from display escape clock to display core
  clock in the dsi controller yaml
- Fix the memory leak for mdp1-mem path for the cases when we return
  early after failing to get mdp0-mem ICC paths for msm
- Fix error handling path in msm_hdmi_dev_probe() to release the phy
  ref count when devm_pm_runtime_enable() fails
- Fix the dp_aux_isr() routine to make sure it doesnt incorrectly
  signal the aux transaction as complete if the ISR was not an AUX
  isr. This fixes a big hitter stability bug on chromebooks.
- Add protection against null pointer dereference when there is no
  kms object as in the case of headless adreno GPU in the shutdown
  path.

GPU Fixes:

- a5xx: fix quirks to actually be a bitmask and not overwrite each
  other
- a6xx: fix gx halt sequence to avoid 1000ms hang on some devices
- kexec shutdown fix
- fix potential double free

----------------------------------------------------------------
Adam Skladowski (1):
      dt-bindings: display: msm: Rename mdss node name in example

Akhil P Oommen (1):
      drm/msm/a6xx: Avoid gx gbit halt during rpm suspend

Bryan O'Donoghue (4):
      dt-bindings: msm: dsi-phy-28nm: Add missing qcom,
dsi-phy-regulator-ldo-mode
      dt-bindings: msm: dsi-controller-main: Fix operating-points-v2 constraint
      dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
      dt-bindings: msm: dsi-controller-main: Fix description of core clock

Christophe JAILLET (1):
      drm/msm/hdmi: Fix the error handling path of msm_hdmi_dev_probe()

Dmitry Baryshkov (1):
      drm/msm: another fix for the headless Adreno GPU

Konrad Dybcio (3):
      dt-bindings: msm/dsi: Don't require vcca-supply on 14nm PHY
      dt-bindings: msm/dsi: Don't require vdds-supply on 10nm PHY
      drm/msm/adreno: Make adreno quirks not overwrite each other

Kuogee Hsieh (1):
      drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq is not
for aux transfer

Miaoqian Lin (1):
      drm/msm/dpu: Fix memory leak in msm_mdss_parse_data_bus_icc_path

Yang Li (1):
      drm/msm/dpu: Fix some kernel-doc comments

 .../bindings/display/msm/dsi-controller-main.yaml         |  4 +---
 .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml     |  1 -
 .../devicetree/bindings/display/msm/dsi-phy-14nm.yaml     |  1 -
 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml     |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml           |  2 +-
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c                     | 15 +++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c                     |  7 +++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h                     |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h                   | 10 ++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c       |  3 +--
 drivers/gpu/drm/msm/dp/dp_aux.c                           |  4 ++++
 drivers/gpu/drm/msm/hdmi/hdmi.c                           | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_drv.c                             |  2 +-
 drivers/gpu/drm/msm/msm_mdss.c                            |  6 ++++--
 15 files changed, 48 insertions(+), 26 deletions(-)
