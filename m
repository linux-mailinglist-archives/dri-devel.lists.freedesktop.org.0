Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F37DB83A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A8810E291;
	Mon, 30 Oct 2023 10:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA17C10E290
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:36:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40839807e82so24880115e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 03:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698662203; x=1699267003; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qe+6f2RNQqzEAAJWEhcjfCOgBjDBSpwsYGSepbX/BrQ=;
 b=zxsVw9J4RDVA4JQKJhHPxZpMjlOgiHrXHNTgV4+nM27sSf9IaMJ8/Gfgnmk6zrMDcN
 6VBDMRu2snChKmCXrMz+Nc6rSVLZ8TVQBjNURAVK9bmA7d6GKXt+CZiKYz4UpSlM3+VQ
 1Fapw5CU4XPAklkqCvWGOTAd9ifdrC4STLF+v4uYrhj8lVlkHmDzUBEM92TgTAbZ8scG
 H3hVlBLmoBvuBZRI3QuUTTF/QjnAMtoBGH1UWlB3UXKMXyI+mQKRoxv0wjqXL4mTDN/f
 Bvy0iFqOI/Sqb5ITiFuB+rar/Sluw2SBdSBBSBy5TOciVIt4PopptLQutO8PTa3t31no
 /tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698662203; x=1699267003;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qe+6f2RNQqzEAAJWEhcjfCOgBjDBSpwsYGSepbX/BrQ=;
 b=ICcmTvVmnQYBEgrVe7/TgyA50oV2/eXbES6b/3dpDMnWJ0ILCfNKE4OlIlW/6N3vZk
 WBAhPjdmPtfjWPJGiOfogv9qXtM/oGUShdk/VeQVGXLXsm14hbghZ8qKNeSA+tulgLlI
 9gwhiyafpdntYHtw159W3vxYip01WSC5FWPc9aX3+9/VHGzsYrA4gxkAsftSDFh902lB
 FDG7f/8+rl5tHy9voNTZakHM2JQ3SKyX2K/Pc6Te4/ILZG3+8H8yxnWjUMbHiJ7bDiix
 M5jFvSCQ6KpPtjiXBOhpITGnJeTrtvp8lDArsdoba5kwO4j56WtfiMm4VUW/Vkd0N5n6
 vJNA==
X-Gm-Message-State: AOJu0Yx+GxCV6DWSB0okMjjzORJTIyg8B/8VVZvCFi3pVEeK6DPUlSQw
 BTjdQ5jzYICi4hjsNER5SOKVaQ==
X-Google-Smtp-Source: AGHT+IEUBN2wlGCusHu79enfFQGZ1xXOJx57ZCWzP6fbJ1Q4MD/uv7gXLh62Ks81UpHClZFgYo1NMQ==
X-Received: by 2002:a05:600c:3b9a:b0:401:b92f:eec5 with SMTP id
 n26-20020a05600c3b9a00b00401b92feec5mr13979002wms.9.1698662202849; 
 Mon, 30 Oct 2023 03:36:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c458500b004060f0a0fd5sm8783209wmo.13.2023.10.30.03.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:36:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/8] drm/msm: Introduce display support for SM8650
Date: Mon, 30 Oct 2023 11:36:22 +0100
Message-Id: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACaHP2UC/33Nyw6CMBCF4VchXTumLSkXV76HYdGWESYR2nSQa
 AjvbiWuXf5n8Z1NMCZCFpdiEwlXYgpzDn0qhB/tPCBQn1toqUslVQVLiOSBp6YyEp6Rl4R2gql
 nBiz71qBsfe0akYGY8E6vA791uUfiJaT38bWq7/pjtfnHrgokOKdV6xpfW6OuD5ptCueQBtHt+
 /4BB3mpXcUAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fZztST0Tz52prZISRUQq/mJrmvbzIZBrY3BqrBlopSs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP4c2EA4xjcpeqPPieVb2X/c8s09EMY/1qKLqgq/X
 sGzboCaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT+HNgAKCRB33NvayMhJ0TlkD/
 9gXQqPK/9qLaLVBSQLxX3rLwEc9QE6uuLjc6rmn+KCegWWpNrrsww18EyianHJYXiDYBwyYC3KmBYr
 Z7Fd1SDV8nL9vP/LQebm6SfQVD8LgihMqPmDGto2csG+cv3HaLOI/HFANOlwZuYtK5rC3yC2heEuA0
 WQ0/ZIfpDqbXxN7YqMw9FhvtWCEeY0bY507d3F4uRVuMCsnXZGCEayk2npNOmvPhI0OQzQiF4w723F
 twuV4hA487XNKVKrQSbbdjcI/GV+hL53LG4h4SmQdkDzRGeq0+yJ2eagwmfxfLAE//Y4aY6d5gOi5P
 OFsdaBnSPxZZX2DBRLjkJsCNSyR3I3A4/uYs7ZfHMnBDM7PwqU746GJgjJMgyKdZ1H2sBe7XiQxTc1
 n1bkAK+6oGaYVCbGRUCixgKi7v2jdlZuCGI3FkyQLBC2AUj3UDu1yjrB0nUsid3jHNnAaKuRzA0v/F
 jR9rJsud6Ki7lPaBp2B4Iolv3v5L7eakgtORdg51LyUYI9Pl6GIhHi7vHLF5HWcnVjvcJpRB8wKyn+
 g8ZZ84nQW7G0IUW4m0XgdCUGe+XXhZudiDbe6325nss0gfHvzql64sokpvkMbBhCYwphDVZpOkhFey
 0d0KOxETyjTx140ZMKQW439lAgO+b8qUlIyjFtTYJBPyI1exc2amOPZYRR9w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SM8650 MDSS is very close from the MDSS 9.0.0 found
on the SM8550 SoC, with the following difference:
- DSI PHY 2.8.8, no significant differences
- DPU 10.0.0:
  - Enhanced max_linewidth to 8k
  - PINGPONG_8 & PINGPONG_9
  - MERGE_3D_4
  - DSC_4 & DSC_5, DSC_NATIVE_42x on DSC0/1

This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
in addition to the driver changes.

Support for Display Port output is expected for later.

Dependencies: None

For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstream/integ

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Rebased on top of https://patchwork.freedesktop.org/series/119804/ 
- Enabled SDMA
- Fixed sm8650_rt_pri_lvl table
- Collected Reviewed-by tags
- Link to v1: https://lore.kernel.org/r/20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org

---
Neil Armstrong (8):
      dt-bindings: display: msm-dsi-phy-7nm: document the SM8650 DSI PHY
      dt-bindings: display: msm-dsi-controller-main: document the SM8650 DSI Controller
      dt-bindings: display: msm: document the SM8650 DPU
      dt-bindings: display: msm: document the SM8650 Mobile Display Subsystem
      drm/msm/dpu: add support for SM8650 DPU
      drm/msm: mdss: add support for SM8650
      drm/msm: dsi: add support for DSI-PHY on SM8650
      drm/msm: dsi: add support for DSI 2.8.0

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 127 ++++++
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     | 322 +++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 457 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  26 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  27 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 15 files changed, 989 insertions(+)
---
base-commit: 8c53ca7d71a2d7274b51ec14a0d91b6ede09fd83
change-id: 20231016-topic-sm8650-upstream-mdss-e3d95e09c7b8

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

