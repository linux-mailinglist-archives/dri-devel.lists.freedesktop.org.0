Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E984A3898F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D794B10E54B;
	Mon, 17 Feb 2025 16:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yPcW7g72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB8810E54B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:41:45 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ab7c4350826so81821166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810504; x=1740415304; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tl1qk986xZ9hRS1Mx9gWyhQ2tNCZt95h0ZGTwuGdgzE=;
 b=yPcW7g72g28XtIxEQPO8VBP+RHrOmK3iu2ogoUg7ZLmivv3pNgmZ0Jra+8EElqu39Y
 6Ooslg1tGotOFWanHUxS777Ul4/6F1jigntnkZlWisCf5l2+CoWV/LHNccrPYHytNlDX
 Q+t8Gk5ES0IjiVC/QBARonkN1JwIwmmbuuYqabJC/7FEVLLlsBQ8RKPDRdH/BXhttO4h
 ocW9fbGxW2bFPocQKxLh8zeCkhz+BmimncEaWEsjnfGwMNFdZkadVzMYE4IkT8Y0OQ4P
 sTDrbTo3vA3CZS84sUECwR85jLCrkNaNmLNbyJDL5FFm86koM5soVOeY+ZoJ6RnMaTpf
 lKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810504; x=1740415304;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tl1qk986xZ9hRS1Mx9gWyhQ2tNCZt95h0ZGTwuGdgzE=;
 b=o+SiC8AZhHfmuWhVQHiSD/7+Ylg0S5Oy6Gn7h7XU4vXTGrCNFtEILd1E3n0K5oYdac
 71acyAevaLFo/uzNt0Pc2N7oFV7epU0NtKwoiV4ZR+xFq5mdfMpBFbQ7z/U3H1S5Pblf
 K9sC6Xbovylb4yf6q5zh5p1otMKutndvYE5BhCkLZnPmoCTi9MCbEW1SHoTRKFlQnJN0
 fCY7hny3as5zrxkHdyQCyFrlVKbvJsem//2s5fLHRkdEne91a/gfIMhY59G0jyxvkaJU
 jUuVqPVzQnDhAFV/RU5Q2JOt3Ifg7BIxjGv6DJPE1rTP2bbFwkjg0mAT5p9UZkf+FKFZ
 wqIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1M0VbnYIlb8o43f3+aAY5V9ohK8T/gt5kPRBqIGgnuIdCVey3epz0UmC7oUXGnqnjBKvKJ3Jy65c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZl90fY8A+XACLBHS0nJ4EyM7u94WqGPadORSSPnZJaTBW+IGf
 0CGmtvS2VX1CCxSaJJ56rp3yJBFT+fzMAPG3vxfsvyVchatzyw1+DGM4BUvpbw8=
X-Gm-Gg: ASbGncvLBhN8qxBvGvLjY6PEyEf4vGe9vawcI855/sCneCm+bXggtPR1wp6SBR2OQZl
 xqK6CGCXfka9HyynAv+5NJZcWr8Sx2qsD4oU9oxSKia4M/b/9vpCc0BSS23p+9q/qyCvcubaL76
 p7fHJjoaJuGsGFoOsp1SeNuDQS+94GFGh+5yjap4hDL76+U7+Lal3kDUJ9973HJ2/VwdvywAKTX
 PqsYu0DY+m4WObbu7DnhTxCGAPMvH4xtE5RKR53uvxT0pc4U2R6LcyRp1E+bP9VmNbG1xxBbBlv
 DHnEN3J+2/Ts0K/s20d7zgdz5BRrdas=
X-Google-Smtp-Source: AGHT+IFcQeNVHnsKf9IkLIKYVAi4SxUUfp260hQPfDzut6VqqPWdr13KL6UsKqTMH8NkbWY8oez30A==
X-Received: by 2002:a17:906:6a03:b0:ab7:425d:1fa2 with SMTP id
 a640c23a62f3a-abb70d95991mr424723366b.10.1739810503738; 
 Mon, 17 Feb 2025 08:41:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/16] drm/msm: Add support for SM8750
Date: Mon, 17 Feb 2025 17:41:21 +0100
Message-Id: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFms2cC/32NQQ6DIBBFr2Jm3WkAoVRXvUfjAhV0EisGGlJju
 HupB+jyveS/f0C0gWyEtjog2ESR/FpAXCoYZrNOFmksDIIJxThrsJcYX3etGI4Ut8XseLNG1Vo
 raRyHstuCdfQ5m8+u8Ezx7cN+XiT+s/9qiSPDvnZcOePk0OjHQqsJ/urDBF3O+QvwbVf7swAAA
 A==
X-Change-ID: 20250109-b4-sm8750-display-6ea537754af1
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3920;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4GpjtyPhX2tIp7jKFxe8+OhXpy9WD8kHJbcuRQ6OQrE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a03lqV9dIyHRAwlUHltfCOEPr1IiF36ellm
 Mlcs/X8ZX2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmtAAKCRDBN2bmhouD
 14NnD/9a4pjkt2J6S54Y+zsdMes7Q8++B4dMo0E+BAcDVAIW+FD7aMnvRQY+gsH8ZrDSV8wrXWa
 Zt+3ARMZ+s6bjYynoZ3saHvO8tYiCPojMUn6UPnpBQ/jAJZ7KGvukfWJ6IKN2geKNqyy4FZPaH6
 U7ARb55Vt/7KAbdceUn1TaNEMFlzZeFWPu5jM1o1Hc+4XjrdsCfQ7lfDIFqCPJIMp7q1di1RH3n
 sWxrXBfcEv93aAQJUj24Vf+oaq61tMLVRp+N1EN6k/n7WYcP7RCpQaEIaN6f9XKJfBeg1UIGhWY
 slvUnjub3z53iIgvdtLYuz5/EGqm+ChSCL9fQ3o08gh62U3DgpRTJ3kddlqR8QmxJPK9Q2qMCAp
 xvSz8WYJnLAA128U4V78rc3RVgN14inNw5LJOfa15BNYLdfRDdznWN+ol5A5EWgMlCm80EU/vUI
 2V+NH+57BieX1jEWvb7jE8dYiwOZuDNAJ0pBsApZaCX1J80jV5IG6gndFpyKisLY3HnH9xfy0Ci
 AWMdNov83jiCl6ZI42MYxqPzvyO8j6gGtVTb30BoDJRz+PuWlcuR69etka/UnwBk0Pdil0fX8bK
 JBwFHSG/eu3ORZDfeFyROJrnpQZaxdQvfIOt2uPHx+BsMpOsTlIPRvHhkBB5IX4GXt6u4nb7p2W
 rQQJXEiVe/CnP8Q==
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

Dependency / Rabased on top of:
https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/

Changes in v2:
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

Description:
=============
I got modetest writeback working, but DSI panel on MTP8750 still shows
darkness.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (16):
      dt-bindings: display/msm: dsi-controller-main: Combine if:then: entries
      dt-bindings: display/msm: dsi-controller-main: Add missing minItems
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      drm/msm/dpu: Drop useless comments
      drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
      drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
      drm/msm/dsi/phy: Add support for SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
      drm/msm/dpu: Implement new v12.0 DPU differences
      drm/msm/mdss: Add support for SM8750

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/dsi-controller-main.yaml  | 124 +++---
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 460 +++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  59 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  71 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          | 210 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  25 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  80 ++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  79 +++-
 drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
 drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  14 +
 26 files changed, 1655 insertions(+), 101 deletions(-)
---
base-commit: 44ddcc7604ae61eadc748ccc6156bf4b98697978
change-id: 20250109-b4-sm8750-display-6ea537754af1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

