Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B6B968B79
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 18:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503E810E2B6;
	Mon,  2 Sep 2024 16:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HVKrhbsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FF410E101;
 Mon,  2 Sep 2024 16:02:15 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c210e23651so4574730a12.3; 
 Mon, 02 Sep 2024 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725292934; x=1725897734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C5Vz4j/A/EBROJlE9V4B05ru+E+LAW4sw0oP3utBImE=;
 b=HVKrhbsFL/CoNU+WXXSmIWnsbny8WwO9L+MG7xRYTr9HyeqtAxf5fzvZtg0DqvMz7U
 WcT+wBcRcT9LBW5KkMNYg41qYZdqheUINcngC2HsUd7kvZGfIlwdojjuHx7xBCNYRuwh
 8fm9gIY9hxP2OcS1XhuTqZ/jMYHG31uBb9yTwU+tWdmjUcWwfmRuaaDS3roAujjtp0TA
 3eDdrov07REB2bMyYso5HPUkKcmVCJFImxRRKRL/yxS38EQ4Hp2yNj0GpR6S/jql4UIQ
 Kz6UR2xlr8jR39T0sgdYI6VcaM8QXSNTIn+3hGJ337SNVcWsqh/0oumFpVwvZvhSk4zS
 EspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725292934; x=1725897734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C5Vz4j/A/EBROJlE9V4B05ru+E+LAW4sw0oP3utBImE=;
 b=Arp0ChhXFN2nUDj0/YeSnF6w6/nLo1na9SGm7H6mmug47xYvqIyu8ayVvXUdocTko4
 VnVgKmpEPVNon6IfG77aMsDlrWwbNzYpBxYqdZl8v1fsTpwQ3QL6a6Ln7ZEu6RXlQy/8
 rtyNsXJ6eBoFO5Z6nL+jWqL+hO/QioMgwU9ZcUp6tj50y/9qHwL7KLtyb1iswHnKvaGh
 wjQ3u77YXNu4aTKbN06wscUPe8sXuDRpAZLxCx+ApUKj7EQRn/QNuJ49z8vL8fbSqPy9
 09BpPltxOH3OHML6HGU8QWtp1q6h1hNqJMbT2VaVLAWKZE4Al0I+uOpZC5vissCglH2y
 gWeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4QP9n0xYzZKA9OuJ2WRU4qVD4/TXtf1vFFc36mS7PVcKt768ziPbzf1UcG5/U7StiLY2kcpo+K6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQCV0CBrs7benuD13EbeOohUNoHZvX0Xr6hMQ1mYaiP0b+Edgq
 4tsukFnrrf6fgGBYvgyGedK964sBVnLwRXn/rufCCQLCSvOr34sq087U1a6B2CaAWpH8IPrlOKw
 6xc2oEluFfcj6Y9ErhX/tcrPMkXM=
X-Google-Smtp-Source: AGHT+IEhc+/8y64ZulsxnV4yI6VLUOUZZy9iSB4IdqH34+WUVPpWjXBiGG98AToLe56K34DK7eKcTEBawagsbwAnfMs=
X-Received: by 2002:a05:6402:350c:b0:5be:d7d8:49ad with SMTP id
 4fb4d7f45d1cf-5c24374192amr4098204a12.22.1725292932960; Mon, 02 Sep 2024
 09:02:12 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 2 Sep 2024 09:02:01 -0700
Message-ID: <CAF6AEGudK7YMiKDhtvYgp=bY64OZZt0UQSkEkSxLo4rLmeVd9g@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-09-02 for v6.12
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Dave, Sima,

This is the main pull for v6.12.  It ended a bit smaller this time,
there are a few series on the dpu and gpu side that weren't quite
ready to go this time around.

Further description below.

The following changes since commit 6d0ebb3904853d18eeec7af5e8b4ca351b6f9025=
:

  Merge tag 'drm-intel-next-2024-08-29' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
(2024-08-30 13:41:32 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-09-02

for you to fetch changes up to 15302579373ed2c8ada629e9e7bcf9569393a48d:

  drm/msm/dpu: enable writeback on SM6350 (2024-09-02 02:53:44 +0300)

----------------------------------------------------------------
Updates for v6.12

DPU:
- Fix implement DP/PHY mapping on SC8180X
- Enable writeback on SM8150, SC8180X, SM6125, SM6350

DP:
- Enable widebus on all relevant chipsets

DSI:
- Fix PHY programming on SM8350 / SM8450

HDMI:
- Add support for HDMI on MSM8998

MDP5:
- NULL string fix

GPU:
- A642L speedbin support
- A615 support
- A306 support
- A621 support
- Expand UBWC uapi
- A7xx GPU devcoredump fixes
- A5xx preemption fixes
- cleanups

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: enable widebus on all relevant chipsets

Aleksandr Mishin (1):
      drm/msm: Fix incorrect file name output in adreno_request_fw()

Arnaud Vrac (1):
      drm/msm: add msm8998 hdmi phy/pll support

Connor Abbott (7):
      drm/msm: Use a7xx family directly in gpu_state
      drm/msm: Dump correct dbgahb clusters on a750
      drm/msm: Fix CP_BV_DRAW_STATE_ADDR name
      drm/msm: Update a6xx register XML
      drm/msm: Expand UBWC config setting
      drm/msm: Expose expanded UBWC config uapi
      drm/msm: Fix UBWC macrotile_mode for a680

Dmitry Baryshkov (6):
      drm/msm/dpu: Configure DP INTF/PHY selector
      drm/msm/dsi: correct programming sequence for SM8350 / SM8450
      drm/msm/dpu: enable writeback on SM8150
      drm/msm/dpu: enable writeback on SC8108X
      drm/msm/dpu: enable writeback on SM6125
      drm/msm/dpu: enable writeback on SM6350

Eugene Lepshy (1):
      drm/msm/a6xx: Add A642L speedbin (0x81)

Konrad Dybcio (7):
      drm/msm/adreno: Assign msm_gpu->pdev earlier to avoid nullptrs
      drm/msm/a6xx: Evaluate adreno_is_a650_family in pdc_in_aop check
      drm/msm/a6xx: Store primFifoThreshold in struct a6xx_info
      drm/msm/a6xx: Store correct gmu_cgc_mode in struct a6xx_info
      drm/msm/a6xx: Use the per-GPU value for gmu_cgc_mode
      drm/msm/a6xx: Set GMU CGC properties on a6xx too
      drm/msm/a6xx: Add A621 support

Laurent Pinchart (1):
      drm/msm: Remove prototypes for non-existing functions

Li Zetao (1):
      drm/msm/adreno: Use kvmemdup to simplify the code

Marc Gonzalez (3):
      dt-bindings: phy: add qcom,hdmi-phy-8998
      dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
      drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible

Otto Pfl=C3=BCger (1):
      drm/msm/adreno: Add A306A support

Richard Acayan (1):
      drm/msm/adreno: add a615 support

Rob Clark (1):
      drm/msm: Remove unused pm_state

Sherry Yang (1):
      drm/msm: fix %s null argument error

Vladimir Lypak (4):
      drm/msm/a5xx: disable preemption in submits by default
      drm/msm/a5xx: properly clear preemption records on resume
      drm/msm/a5xx: fix races in preemption evaluation stage
      drm/msm/a5xx: workaround early ring-buffer emptiness check

 .../devicetree/bindings/display/msm/hdmi.yaml      |   28 +-
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |    1 +
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   11 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   14 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   16 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |   30 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  141 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   21 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   89 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   46 +-
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   15 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   51 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   18 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   18 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   18 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   41 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |    2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   10 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   12 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |    8 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |    5 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |  779 ++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h                      |    4 -
 drivers/gpu/drm/msm/msm_gpu.c                      |    1 -
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1118 ++++++++++++++++=
+++-
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |   89 ++
 include/uapi/drm/msm_drm.h                         |    2 +
 37 files changed, 2527 insertions(+), 130 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
