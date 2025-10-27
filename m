Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34DAC0EB6A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5465410E4C4;
	Mon, 27 Oct 2025 14:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UvwsmZvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA8F10E4C4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:59:36 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso67380945e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577175; x=1762181975; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NW0g4MULUKaMYiJnLBpd0Ri5YM5rWj5Eltx5XndG2Gs=;
 b=UvwsmZvgR+8kZPgWaz7vyL7guyk7VNvXOgIaKb8uvRiFLuXkDS8Mwkki+CxG7IJKpU
 V981M8dLRuVvpTZRpkvO11DoxyzrRLNu9Uvw+s/X/j20xD4gOXD75vfEO9atScRDbLTO
 Jbijza/r2IGbz2LChRz5omw21igFIWA0LmzWhpicXklUDQahP9YOtDWXX1C1sRWDpf7z
 MOONdohrqf3pQvbffsP/j/Iw7dbYxQnaW9DQgAexeNC6r+ee65HogRQNjVz7EH0HyDNL
 0Qy78CdU7j1+GTHW33JI5ww3mGonNA+LkDLZwq9SzSPBoosdSLZV7FLLQpZ1AlqqkywE
 G9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577175; x=1762181975;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NW0g4MULUKaMYiJnLBpd0Ri5YM5rWj5Eltx5XndG2Gs=;
 b=YDoXveaFitRHo4EcJ8sLD9xpbRngHCiEllIRWbl1WdfDaE7p+3JX5XSk3fUfjnZaTW
 +fw6vAZ7eIfUUHBXom2QVpK0drp7NHrT/OVY22xk+3keEPEarx+Rat8oHUWxxZQwwE8N
 5z6p41XuyTJblBGHLgItKYxmHEzJu7gHzCOVVTMcO8uUug8cCD2LoSwQ4KUsdHfiEs0o
 QJQ8kRBvLU2w6t2CSfnqiaqnJv5eIu+H7ygwxvj4IhFEvEp7ex+a6HOdM3nRgIaJ8Ay6
 PEb6d68RkAEROANGsk1A/s7G93sXE19NczHJHjT+uqQqvNftle/4cedSubhqoOCPxd7y
 8NcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxvSb04vkmiC18hQ8juL9qNO7aRq0ALI+beoC0h7Fho1sO7qFIkBlgvN4jQ1Sp/syZmG4Nwk3Wh48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys/J64K5XvdJKATz6YhYC2pQcTlJ3uzDJDDuKE31y0XMHw37yr
 mhgnCicOCG+OMmG41cmCpKaUpaMiP14jlQpLokiC/rdeeP74xd/G6ZecWoXzAyhTVJk=
X-Gm-Gg: ASbGncsxPx6jWTW5cysbsj9MFihyUNBes58WaatIREuju9d+Hf6EWemYxqt+eBmdfCc
 0tFm9snsn0rSY2P58Iw8453jejpPULcetBcj7W9qC4mYen7MTXIaCMRL2CHiFYcp11ACZj9vnbv
 AsLJulX9BIIT177ug7Yfw/9QLSchiPNyUMDQTwmmjICNxQQZz0e5JvybdvOy4cfxfLmuMe8iyEB
 1or0nrdyF/Tq92B/Op0yiFo2oLbR/+/nDVSPB//CUtxvvfDn6g3vq065H25YMXY+eylxDxU8kJv
 LDitktxtC/MQ+9Zic31UB28nSS/NT4YYXyI1QgQZjouI6CAgCVKk5K4kCj4zoSZ1SIzpkbEXdf6
 S97HtpDN/6wEipnWtoCstItpnyphVCjMMeIrRB1wDabQFEqUZHl907EkJLI7EZ8NEzWqWIpcMuR
 KKebmHAmhz
X-Google-Smtp-Source: AGHT+IEaQneBk0C8dLzRUnxt31IA4a5BDhI6aZOrP71p5Fx9l+6YUOmnTLZBOBxL2PTxl1832j9iLQ==
X-Received: by 2002:a05:600c:34c4:b0:477:171f:65f with SMTP id
 5b1f17b1804b1-477171f0938mr4731325e9.38.1761577175395; 
 Mon, 27 Oct 2025 07:59:35 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:59:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/7] drm/msm: Add display support for Glymur platform
Date: Mon, 27 Oct 2025 16:59:17 +0200
Message-Id: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWI/2gC/2XM0QqCMBTG8VeRXbfYOVNyXfUe0cVymx4wJ1uNR
 Hz3plBQXX4f/H8zizaQjexYzCzYRJH8kIfcFazp9NBaTiZvhgIroUDwtp9uj8ANxbHXEwc0UGu
 8mkMJLEdjsI6eG3i+5N1RvPswbX6C9X1T8Esl4IIbqUDLUqJCe+pp0MHvfWjZaiX89CCg/Osx9
 84pWVl0dd1UX/2yLC+vRk6p7QAAAA==
X-Change-ID: 20250910-glymur-display-12d18a2bd741
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=eDQhQASOEmRkcfF1cnh05g0ZSLG33Cazfq+HFLkLeDs=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jL4e2P0M+fEJRpcgfUYt16mHELFJZJztSOL
 H5lBOKx5SOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+IywAKCRAbX0TJAJUV
 VsFfEAC7FmOy5w629PPMnlYGOFdHi2vJe6IBqwe/XMzgVyHN6nqMBH4VKVuJWuqEIlCZXYin6i1
 qFByl4U3Bu3WpLYhlyWU2Oyb1Q0kIhVPpnYiSfjUtVPKKKrGrPxcLQXaj54P6ulqwh4dE6FQL4j
 FPmwZw1xotu9jIYmdKEgQpzDkZBgPu/hfMptiKHN7s8nTF5BxTvdqvkcMKjLJTMPqqjqLNWOfTx
 MzwCTH8bohm+AjllsfN0rtejPO3I0/I5vXQ0UxgnYm1RhWsji4FpZA+gNS4EimDdotp2ds3Pmu9
 2sIuL/QG2kO7x+tsj9GugfUbUaeynxaVLm+MR9j0F1GVT9tdvlVR5a5o1KCviKcuZ519grI3iTJ
 T9ZmDXNt+MSv3blgzpkP7mgQFZ/rWqwJvwsNjzdvKLARgWuCpUmOWVV/zJzK2KCQOCK6LW3XPjo
 kECMxjfouAxQAIzc5TJ0waCWuPnLK+LUVOnFW0eS6vEDXuhCPuXdKhI/c18+pVNN9IVnM4g8592
 7CNNu1KDOxu3ILGiUPOek81NTRII9//VhsqTt8jHhR27Z/D5ysUPVMmnlQgpabVtd6EJC7+wYZK
 57U4rCzSbhvKZHBkzIUNkfWaP5asFUIz2+Gq4cIHWLr0m2wndOk6KoUBZzHUZQW/UvVa6xAcl+U
 LLklForAsQbzbTA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

The Glymur MDSS is based on the one found in SM8750, with 2 minor number
version bump.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
 - Re-worded first commit in order to better suggest the incompatiblity
   with previous platforms.
 - Picked up Krzysztof R-b tag for 1st patch.
 - Picked up Dmitry's R-b tag for 7th patch.
 - Link to v2: https://lore.kernel.org/r/20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org

Changes in v2:
 - Picked-up Krzysztof's and Dmitry's R-b tags.
 - Fixed the bindings check reported by Rob.
 - Fixed indentation reported by Krzysztof.
 - Re-worded the commits to better explain the incompatibility
   with previous platforms.
 - Add the UBWC config patch, as suggested by Dmitry.
 - Link to v1: https://lore.kernel.org/r/20250911-glymur-display-v1-0-d391a343292e@linaro.org

---
Abel Vesa (7):
      dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
      dt-bindings: display: msm: Document the Glymur Display Processing Unit
      dt-bindings: display: msm: Document the Glymur DiplayPort controller
      drm/msm/mdss: Add Glymur device configuration
      drm/msm/dpu: Add support for Glymur
      drm/msm/dp: Add support for Glymur
      soc: qcom: ubwc: Add configuration Glymur platform

 .../bindings/display/msm/dp-controller.yaml        |   3 +
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 264 ++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 541 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   9 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 11 files changed, 840 insertions(+)
---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20250910-glymur-display-12d18a2bd741

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

