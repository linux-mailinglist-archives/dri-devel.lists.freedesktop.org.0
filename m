Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B72858343
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 18:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EE710EC5D;
	Fri, 16 Feb 2024 17:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xSIdQ3uw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD4410EC3C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 17:01:20 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56399fb02b3so2906501a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 09:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708102878; x=1708707678; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p1UcFz1FGckNLw1XlmxhxjVgBjfCwoT7hcC1xOssOlI=;
 b=xSIdQ3uw8NIjk3Cw/wkzJ5/yvvMcFihUkI4ov5hC17n9Px6TTjSfm3tZNHH8b6P4Uv
 dJLMKFvmXtFAZkSvCywhKnn8+KFyLXSol+iAb74lVCOKOzwqffBzSmUCKKIxTJnbkugD
 KrZHQ5LGgoOjmHKDAsy/KP9bBc6rrRQdUhPxNzIXNyAEODk6sMSkr70oDwrM/7whCrh6
 j1x0G1YtOTWpnKe3Q5grcD0nd1o2qkGhFB1PQM/Mby50bIUymrJ1Gqb5qljWuq8dxK9n
 6fk9feoDDotPN7ZOrpskvBIWjDdKeJV2WOh2yUDINnBP3aJa1pHVT13mODaULGbUeHBq
 g9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708102878; x=1708707678;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p1UcFz1FGckNLw1XlmxhxjVgBjfCwoT7hcC1xOssOlI=;
 b=BR4DyV08GLQCkRxGtNvK+KODbTSAvAaJyVb1QVoAflVcbci5orAdpbjV62t4nE+k5n
 +ORmsJm60zeYwEAejGSdrEo2tjRKCHpubmYkab9VbyPgT6KINcaoDaZeZrhIWdwTdFHM
 +nQ5OaLE1qgS93+jlPcWIIxgB9ZcJswpD7Huxb5QDyTAgxJuT7WKQABsVJ6VcY1Xf5JN
 B3r0v+kQDm7DZDzkqyeB2ZZHMR/berL85C+NwWWoZwFO2QjXSyVa8vwLJAzXlApWKg3H
 FnvN+MvVc1MFKmwALdKipL2iurWJiWUvXhCjnrNzw7pbjv2wvdJVD0ecoqgo/fk0Eb4C
 KhBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt0ScrOgTSmdyRWevSMlKW2yAu45NagPp/QVG8FmfDKrpPpGAIhTkHo8tXWkoJ+FQLtHSTHCOCv+UFn2rm5X1YOOpLghP+QfKzmecNhleN
X-Gm-Message-State: AOJu0Yzf8Z7d5NQlFgll7nuxffMvjt5zEfgPxnVh/PXrX7tsoemzYclP
 NcdEr5+0URha54RNkJHlhXeUUdhkoqKFF3BVcC3rQ9ajjJUbutGhxoX5nIn0w/w=
X-Google-Smtp-Source: AGHT+IHKQOQB0YGj0ov9AvBSyG6g37XAlR8RWH9o87R5qxWdfqq2CXR/ocGh+Qm9/bbxo+8iSy3IAg==
X-Received: by 2002:a05:6402:28f:b0:560:c951:57ba with SMTP id
 l15-20020a056402028f00b00560c95157bamr4631607edv.26.1708102878588; 
 Fri, 16 Feb 2024 09:01:18 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 u20-20020aa7d894000000b00563a6c9fd71sm159706edq.16.2024.02.16.09.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 09:01:18 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/4] drm/msm: Add display support for X1E80100
Date: Fri, 16 Feb 2024 19:01:04 +0200
Message-Id: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCUz2UC/22NQQ7CIBQFr9KwFvP5pYquvIdxAS20JAQaUNKm6
 d2l3Rijy3nJm1lI0tHqRK7VQqLONtngC9SHirSD9L2mtitMELBmCIxOTAtgALSzaXRyppKfauQ
 cQElDyk3JpKmK0rdDOfqXc2UcozZ22jv3R+HBpmeI857NbFu3AgeGl99CZhQodBetBDa8M3Bz1
 ssYjiH2ZLNl/BiQ8T8GLIbWQKOkEGfe1F+GdV3fLEbD+QgBAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2021; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=0iFXpBAkOI5XFf8B+lBsw7By4yXHr24NnEal53Y4B9U=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlz5TSztKm9Y1ReskOBVpTZu0w//CBKZim1KNW8
 Fk0rx9kfouJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc+U0gAKCRAbX0TJAJUV
 VlCMD/wJQ0F811zULMoG88tizqg5woFm+ExkHS4/mFScQnxjO+250VkA5TNSBM6eDMDqTEYM47x
 Fe1ZqYKqiUvTfjFtiFv2tmdT/vUewNdtQBNNlhaW/3f5NG2E9/xONI03hY6Tf9lQHpEK8B5Q92i
 peLKidNcBoXsOAfufe0rMntPTxGyGYtb3eAs5/N+S+bb17O+HabqxNqSmf2PBKQLLqbRxvc9Kzq
 PMiLF0PkOc22GI7MObDQG7poVcrLMF0zcVaWrBrBO6feSCKlx7S770Szrki1hNi5xyakOuEj5ik
 7cTnPjvjqJyOqgoYot5JYIKc0BdiBhcOqDtXmTLa3pemCeg4eufj4ZflFg6ds5kzssC1M4lUOT7
 WOC7klglnEEEL6zJxkOuvgLjUj64dQJXMoTm7a69k4xLU/MDRa3sZCJQKRbziF4PNFTjr8/DOCO
 eerJ2dt/af/vs7Jwnz/buOATn+c4m7Uy+2P3fG6iWvLBZsB6+hUiiVv6ACpzLJTUTKlNG5n8Ma5
 sNjNnsfp6ZpfdaQjabrJfus/PZ3jAcwhCagh+nLo/Hj+Su4QelJxhp68ajzoKF0OOBckjZIrRE9
 aEQ36y1kFLJu7ATRCzJYHYuXxurcbZgAs8Zr4LOKDN2hmJwFRkmtNxgSuCXS5dePxFZbZUngk69
 AMzRJnKXWtf0tWA==
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

This patchset adds support for display for X1E80100.
The support for embedded DisplayPort on this platform will not
be enabled using the connetor type from driver match data,
but through some 'is-edp' property via DT. This subsequent work
will be part of a separate patchset.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Added Dmitry's R-b tag to the mdss patch
- Swapped order of first two patches, as suggested by Rob
- Added "additionalProperties: true" to all pattern properties in MDSS
  schema
- Link to v2: https://lore.kernel.org/r/20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org

Changes in v2:
- Dropped the 4th patch:
  "drm/msm/dp: Try looking for link-frequencies into the port@0's endpoint first"
- Fixed the qcom,x1e80100-mdss schema by including some missing headers
  in the example
- Added TODO comment for reg_bus_bw
- Switched to SDMA features mask
- Added Krzysztof's R-b tag to mdss schema patch
- Added Dmitry's R-b tag to the dpu patch
- Link to v1: https://lore.kernel.org/r/20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org

---
Abel Vesa (4):
      dt-bindings: display/msm: Document the DPU for X1E80100
      dt-bindings: display/msm: Document MDSS on X1E80100
      drm/msm: mdss: Add X1E80100 support
      drm/msm/dpu: Add X1E80100 support

 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 253 ++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 449 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  13 +
 7 files changed, 722 insertions(+), 1 deletion(-)
---
base-commit: 85a96a047f413da4b663919a4ced39a4715c6835
change-id: 20231201-x1e80100-display-a46324400baf

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

