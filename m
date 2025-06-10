Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CECAD3A44
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008A110E56D;
	Tue, 10 Jun 2025 14:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IS+5Jaeb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D3410E56A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a4f64cdc2dso430024f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564371; x=1750169171; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Uh60ZOccd7sa8DcZ+nBRds+K253MNKdb3iVqCOh/GY=;
 b=IS+5JaebSdUWJgMueApq8OQO1pppqQubxJK5YoYVu5p+MWJbhIKmqlRQKEGvRSBzly
 bwC6DaRiZjVNp6SHU1HPXeziEc1Dg/6oQs5veRtViVokWskv6erJTMRnG/z1xAnAV2km
 nW5shDzX4VYNP8pN1eNtksBqVvOerpYSTD22vfBneH1zbsqFYpKOV5gIPs8B8alVtGyo
 pqoN/Kui3cQNRKghEsek4rpYHLN5a9NMP4AUiHvQ7AybJAmw09rjhgmneu3To0imSMMA
 Swz8gu1JPRRXw+5SQSZrdOk2N9rnY/+IKaRMaDef9bdnF+AeYIxzifM4EjIhkbS2ehi7
 RfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564371; x=1750169171;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Uh60ZOccd7sa8DcZ+nBRds+K253MNKdb3iVqCOh/GY=;
 b=Q2YT2ezbUUXfA60fYfYFxoWQDp8q5EgMZ0i77QDLRXKZ6SsXRlSmptFb7zAEKel5xh
 DI4bfj/iU/q9vBMmsiaSPQpmJmRX+38QiHcELaFK/k87guHyPqW/l/tolHohm7ophWmu
 9PaFoYCxIxLuf83dY+qYW6egOsTctpnUgg6+cKuTCXbtEf2SOI+PXOzUsw24pgbOyf0J
 tWSSr8ehU3ja33d14hgF50PipJRDexYYl85i5RCAW5G5q5A+lyxaTkLefhDFmTArnOzy
 W+ulb6zPHR4CXVxJNv/BWBawOLbb3hkSKA/dQ8UhKcpnEyhodW3OsZPhcTQUVD2cWR5j
 YVqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjgoafep+HqXgqLQ/7+CooSmS10JUJJhqrjU7bRjIRCeAwouPaWeig1WtDpU3H2Q0y+QItWQh3dSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOCZ0zTouxG4XlLc6YtDWEktjDXDLF3iZAFJUcRxz8NMCWIxdn
 Ec4exw91l/I4yF937xbhB/VvbIW1vyxwZfnyuv9+JyH/fZiYUBk7c3WfdR7It6U+P3o=
X-Gm-Gg: ASbGncuqOrwyrMOSAmQKyRdmOvCT6sG9q8gF8HUwjDM1ln1hs3EXDEpBXpZVhHEnqxI
 ud40vjlZLlv2hXYxqZfN6HoHzEl4fs7vYo4CpiRGjiFXptehP28QM8XLB5ns4u617E1fU7XyzUN
 qamNxqpbuXDXzSkP5Uk1xjbb7tWtx8yACiDSMYSUtdVDPFNoLgCh5CwdtkTFhQSKocGEf9dNleV
 fbJo+sudJ+9y5wrq2QJHMtkzcqpEFwZj8mYvnvpiRJ8P5J53kE/NagPeYjTrIvW2SEe/kMJJAP2
 fguEJhqaKtlXyZa9tmmYToCDVO/MFAVz4G6F3GRvQs/JDc88Ku8cyrD/EgTbqFolIIweMkULRNX
 gdsMNxA==
X-Google-Smtp-Source: AGHT+IGztILC09YW+TicQfyCg2yncYf/i+WuXW8VYpixwySQsgiw+y1EHBWxZruVCt8LLlKtO9jlew==
X-Received: by 2002:a05:6000:230b:b0:3a4:f912:86af with SMTP id
 ffacd0b85a97d-3a53312b378mr4019282f8f.2.1749564369450; 
 Tue, 10 Jun 2025 07:06:09 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 00/17] drm/msm: Add support for SM8750
Date: Tue, 10 Jun 2025 16:05:38 +0200
Message-Id: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALU7SGgC/33RTW7CMBAF4KtEXteVx38hWfUeVRcTewyWIEntJ
 AIh7l4Di7Qi6vJZ8jdPM1eWKUXKrK2uLNEScxz6EuxbxdwB+z3x6EtmUkgjQDS80zyfdrUR3Mc
 8HvHCLaFRdW00BmDl35goxPPD/Pwq+RDzNKTLY8QC99f/tAW44J0KYAIG7Zr64xh7TMP7kPbsz
 i1yJSTUW4QshJcCvPMeLeoXQv0iJGwRqhCKsDEdWCUIXwi9Ego2CX1vgbZT1JjG1faFMCuhldg
 iTCF2DjslnCLtwx/i9tx1ou+5nG16Lny9WlsVWYMExf04c5+GkQfCaU6UeW2F8sUk2DVtKVKoD
 jNxN5xOcWqrns4TfzSzIMqo2w+vL++oKQIAAA==
X-Change-ID: 20250109-b4-sm8750-display-6ea537754af1
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8185;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zqG+rAh3JU8PM61xmhjjpwGkAzkkZlm5Sx7G8HYJOm0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDu88H5T+TupFHPKem9jqGq+8CTCaALNcfy4i
 h1LVhzzutWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7vAAKCRDBN2bmhouD
 17dID/4g3wyrNo8Ta9UKLgYQyzHcdkITUTf7AgjLfbk/aU63LNAeAuy4ssQP1oO+nIPk/Dy192R
 ISfpQflrEn8Qs5HHyzzyrvlgkIECYpuLvchnAQR+tuS3Yf7jx4Ch8LrHKzPyQ12tYSrRg1tQ30V
 g3af/9u7C0Q+CZhCdYP0ixXxx9PHc1nvhSYpKVEjA76/jsAVoSjLpf1r7TgvfxajZyTFUETiZHL
 kaWayFFr11E2jJHZoCbGy88Qg//LHYHhROQGhrQbCnhXbDbLvYLFhp/5tSs7jms3CM0mSnxCfEO
 +yatae0c2/m6+xYEb4RDZdLyGj1oDfa2HVYMR1AoK5us1S9UXNFtg2e0/cC1YFaroKqlFtHA+XZ
 eXRU2WbRXoq+q6EXCYP87CsuYj5CTDyDjRqtKJW+ujZsCNp7MC///jIHK5EAzt92ug+zRxkjG7N
 lKkDtA9pbR6SkKijfAM2AQIkBTvZYlYExhLsj/axsjimUVPat/IkqsHngpu4TrIRL93yIe5NIRO
 e67faF0AJVT9MT8PEm11cleKKI/L/UqMDCMHyg0sFHOM4Pgqi2FRUBWuwj0Pl3jmYx3qIG3NnFv
 sqKypM5PZoNknfK1+2hJGoNmxNGpvgVraMozuyE2Ey/9sJPJGvriiWFPOFAcYTqGkR+JiCdWFF5
 JMZuZ+QMp5RHaHA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Hi,

Dependency / Rabased on top of
==============================
https://lore.kernel.org/r/20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com/

Changes in v6:
=============
- Add ack/rb tags
- Dropped dispcc-sm8750 patch, because I sent it separately.
- Several changes due to rebasing on updagted Dmitry's "dpu drop
  features" rework.
- Drop applied patches.
- New patch: drm/msm/dpu: Consistently use u32 instead of uint32_t
- Fix dimmed display issue (thanks Abel Vesa) in patch "Implement 10-bit
  color alpha for v12.0 DPU".
- Implement remaining comments from Dmitry like code style (blank line),
  see also individual changelogs.
- Link to v5: https://lore.kernel.org/r/20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org

Changes in v5:
=============
- Add ack/rb tags
- New patches:
  #6: clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks
  #14: drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
  #15: drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
  #16: drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared
  #17: drm/msm/dsi/phy: Fix missing initial VCO rate

- Patch drm/msm/dsi: Add support for SM8750:
  - Only reparent byte and pixel clocks while PLLs is prepared. Setting
    rate works fine with earlier DISP CC patch for enabling their parents
    during rate change.

- Link to v4: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org

Changes in v4
=============
- Add ack/rb tags
- Implement Dmitry's feedback (lower-case hex, indentation, pass
  mdss_ver instead of ctl), patches:
  drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
  drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU

- Rebase on latest next
- Drop applied two first patches
- Link to v3: https://lore.kernel.org/r/20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org

Changes in v3
=============
- Add ack/rb tags
- #5: dt-bindings: display/msm: dp-controller: Add SM8750:
  Extend commit msg

- #7: dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750:
  - Properly described interconnects
  - Use only one compatible and contains for the sub-blocks (Rob)

- #12: drm/msm/dsi: Add support for SM8750:
  Drop 'struct msm_dsi_config sm8750_dsi_cfg' and use sm8650 one.
- drm/msm/dpu: Implement new v12.0 DPU differences
  Split into several patches
- Link to v2: https://lore.kernel.org/r/20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org

Changes in v2
=============
- Implement LM crossbar, 10-bit alpha and active layer changes:
  New patch: drm/msm/dpu: Implement new v12.0 DPU differences
- New patch: drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
- Add CDM
- Split some DPU patch pieces into separate patches:
  drm/msm/dpu: Drop useless comments
  drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
  drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
- Split DSI and DSI PHY patches
- Mention CLK_OPS_PARENT_ENABLE in DSI commit
- Mention DSI PHY PLL work:
  https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
- DPU: Drop SSPP_VIG4 comments
- DPU: Add CDM
- Link to v1: https://lore.kernel.org/r/20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
      drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
      drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared
      drm/msm/dsi/phy_7nm: Fix missing initial VCO rate
      drm/msm/dsi/phy: Add support for SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/dpu: Consistently use u32 instead of uint32_t
      drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
      drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
      drm/msm/dpu: Implement LM crossbar for v12.0 DPU
      drm/msm/mdss: Add support for SM8750

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/dsi-controller-main.yaml  |  54 ++-
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 ++++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 494 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  57 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  56 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  17 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          | 210 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  14 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  61 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 158 ++++++-
 drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
 drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  25 +-
 25 files changed, 1685 insertions(+), 36 deletions(-)
---
base-commit: 9a3b1b1b837c4085ada0e47dc46b399ea4eb80f0
change-id: 20250109-b4-sm8750-display-6ea537754af1
prerequisite-change-id: 20241213-dpu-drop-features-7603dc3ee189:v5
prerequisite-patch-id: 09ea9d7e22f5bc9ff3a4cd7e78be26c5dd154798
prerequisite-patch-id: 42012ab2eb0a46b5d3818e1b59af93c22020138d
prerequisite-patch-id: 361f60c8b2eb46b794d64d1eee9ac21644ded7c2
prerequisite-patch-id: cb6a74cf415236caf49ac6f7fd40bbfcb0bd6778
prerequisite-patch-id: f412cbfc9f6a50738e9d13493a1b3775f9a91942
prerequisite-patch-id: ceeb81f111e4dcb4c1fed5b26a3db274272ae59d
prerequisite-patch-id: d28630601cb7fb106decaab036b6ab400d5e6b6b
prerequisite-patch-id: 9b6ef3a2d66ab25c0dc0c9e68406ea4d948d2920
prerequisite-patch-id: 346d20e7cb51fe60058414bc8227a3d49a20806e
prerequisite-patch-id: 8cfd3ed00998e7713d065b875abeaee40bb1de46
prerequisite-patch-id: 5bd409601455e655eb253c97e8a45ebdf0351871
prerequisite-patch-id: a116df9db7a38831b4d99908753f5e747aa86be5
prerequisite-patch-id: 0e74b407b739f91d338ee328a7bd406cbd1b7d86
prerequisite-patch-id: 2a4739ced79df9818b8d6fd14f7c37b63524ec00
prerequisite-patch-id: 24c19cc08357986131b70f93f597bb0406e19c3a
prerequisite-patch-id: 35143dd7831bbcb3ef78492342683800aaae3f7a
prerequisite-patch-id: 2b292dabe10b76a444e9c2588422b6b54f9f7dbb
prerequisite-patch-id: ba31ff07e7f114a5e3b40fd9ea80b1005e481529
prerequisite-patch-id: 5fa3ca0d70d1efffa702278b6880520e44afa982
prerequisite-patch-id: ca74335a125aee670fe733df32e4960c9e82a302
prerequisite-patch-id: d2f4fd210e5ef44f26939548df78017950fdbf97
prerequisite-patch-id: 47381cd6f4e2044a9a66525c46c4cdcdabcbf9a2
prerequisite-patch-id: bf483037378a25ecdc8d2d1601a61d9fa3f6903f
prerequisite-patch-id: 0d4d741ae44545698e0dbc7add62ef52820021d2
prerequisite-patch-id: 0de4d879d932dc35e5fa50439e6126e3ea560929
prerequisite-patch-id: 73201d8fe16f7c701b9fa9485e0c362ac49b4abf
prerequisite-patch-id: 429a252eeb9a0cfa1881e89bf092d32105246ce4
prerequisite-patch-id: 6e38493372299cfb94a82f060cff0fba3ec45047
prerequisite-patch-id: 7ca84aededdfd010139aca6ce4053990255a24bc
prerequisite-patch-id: 2150afe0ffe671a1c608c36c9f7a8374727167f2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

