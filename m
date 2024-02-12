Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AF85111A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBCA10EC59;
	Mon, 12 Feb 2024 10:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NyXiGQY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6039410EC0A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:37:36 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-33b13332ca7so1699219f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 02:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707734255; x=1708339055; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AGeqgEbmqsbfk3RnMJf9oWlOyzbWan5F35nXvDZlbY8=;
 b=NyXiGQY+a1UlJ0chOOS3/BXqEowr4XbEXVNXLbpK4F/gVPJVl/vfKXZ7MEaV5J7Lfr
 keQvhjyWFqpG97jHrCnBfaNj3NeERfLp3AiboG6bhM0/mTAgKPRuOptfZ9Q57nW1AgVv
 7kTdXca/gbBgRkS5e+Vd4zw7YxKxCijQrSdJy35f41eqj2492+1WzdPS4O0Rkq2U04KG
 BnNsJW90kAyOF32TQZslT//Q9OFajwzzC67H3l6ObdGFtiMKpv0YiHOW6lCegG1hKbgU
 /GKo/D4C2/c3cnXvokRjGOGyTopsn099cMIp5UB3e6WpX3mVuD8ywX5iyLkzTIq8X/o4
 vYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707734255; x=1708339055;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AGeqgEbmqsbfk3RnMJf9oWlOyzbWan5F35nXvDZlbY8=;
 b=ijB/J/dGL/AfNx0lRWzRMWBQyiU8KcHFq7NCztatB6OsMfOEQkdyMHHIqrlAc4PTkT
 EmrGK/lYQ9OA0DBARnMErBrri9vO7cPn6dG76yQ6DzvlyyI0SE78m+/UKwNrKlviQl2q
 D+ZsKYLt8X2AeLYKluHjtTIJuBlj0Z0yHvOnRxmoEn7nsaWyUKJ+zv/VMEJc/30NzB8H
 TN7PzMdNPCUTiXiMhFXuZ0w/LqBzvhYDx7nbEfZFAOuXWG4C/Oti6EaHr/iVnz546Fjp
 xyDKrVtPDDyM4o1xDN1R0zBZIQJf5AD9EqFVZ6Jac58n12dUNfri3hz3G90tcNcgiyLc
 kOhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrK2I3nmBSqWCJhWv8ZUNsq9jK/Wrmdq3a1mJUoaSNy8PblueyM8kDTuAW0m2ZeTgyVtytKGXIZA6HwgmmxZ7FcBDbxWSZk6HpqqHXkqec
X-Gm-Message-State: AOJu0YyMMe9D5DvXgCGNWI1f029G+j6WlKMoglsUqUmt16HJkY28Jn7g
 pwzuVRScQG+r0H1jUFjuCBYNzAHYrpRvSRFv5ZQcNHRZhckgRD/otmrxiVdJgQ8=
X-Google-Smtp-Source: AGHT+IEFdHM9DPpHcRwXMfc1akm3prQrLo2OqMS8tdCmINovJ9SVS1kKFcoqCiUNMY2LSNPYq5djpg==
X-Received: by 2002:adf:e502:0:b0:33b:7944:c3c5 with SMTP id
 j2-20020adfe502000000b0033b7944c3c5mr2611341wrm.10.1707734254573; 
 Mon, 12 Feb 2024 02:37:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmId5I/w5BR6DtxvrxeEAwWxlupzFvPdV+nzmpyvD3AQaB/XlIK/Mz7iKn8yyOttmwqQzO3jPBlUBMIdQG7VjIfDGAq9C9X/ZBU5SkqEqN0Fl/BkgPRiL9XGPm2NNyL1LkBtJNMeW0Nk4AUQZf2JbGi3Sl9QQQw9bXjpHHgaDOW2GR3CxFEgEXL5R6CN9c3yZjrO6wstHsNnlPq8+mIbAkkpmNVFgysoVtJlli59Pv55+xV1zA0bWWMYYxHWIH6h6/DL2aZ3YaHa4CEstSHaHzUaBG7q42Lt+HgBHfts8H//QhaR8+M0PGiyBRh35HKdQp2qASADW9mMWkiry9G8M4m7EToiY/pnyJFnSKLzbuOIcCjiHYnCGy5yBFXJUYO867qt0aiZOl53LFPvKzJPRqsHIFNj8yRAQ1zeuu1d+PYlcz0V6Y6ZX6ANGAO/M0F7x6UjZJJH6C45UIR8LVk0WHPrm89LPFefpGwYqE/4oiqOb1uP8dx/ONGKuMdy4MbH7k9k8iQdxocnAsii6fZyoXTOzeBIfJP2ZEP2hykYFEwzjmJ7qHEBSTHE5UWK7eMuOHKr8j/jb4rnEb+nqbSGKlXNVAxkJV/lgz4heBsjjyLRAjbl1zDyHOz52pbK55YIuQM/y/TltPJi6ugBm2VagyRzPhwIt1IKMRo03vFu9YFkM49LUBpwRqHTxuaVnERfj8PLIhZIXepI0iQza8KcXuRKS5JtUcbQSia9R1Tl7M/ralhpnyvFMZ6HVmSghlxygheWu8mhWSPL3mWndmJjvN3EOaxK6IwZdaeeh96vkOIlxarhYeATJ6YJcVxeZMvzCIDEdHiIloPxbCnXZaePLc4OmRl4+ksPm5hSk=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056000128e00b0033b50e0d493sm6404188wrx.59.2024.02.12.02.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:37:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/5] drm/msm: Add support for the A750 GPU found on the
 SM8650 platform
Date: Mon, 12 Feb 2024 11:37:29 +0100
Message-Id: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOn0yWUC/x3MQQ5AMBBA0avIrE1SE6VcRSyowSzQtIikcXeN5
 Vv8HyGwFw7QZhE83xLk2BOKPAO7DvvCKFMykKJSkTJ4Hk4shs1UWuHiLixNM2kmS2NRQ8qc51m
 ef9n17/sBgVxxc2IAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=A28mYhUDB9oRP8F12OtBxkw1cw1ciKnKbEzOFwRp3DY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlyfTqaPw7Mg4iK72Rftn29yA4DDPKGhDoW9VhU50l
 MHnYUPSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcn06gAKCRB33NvayMhJ0XffD/
 0dlM3LxjzviVCefCZEiEYUMeCmN1LifE0PAQaBfxfcOYHcLseB2thwisyqSRjLVy5I8Ewg1lny/ZgH
 SfVb3jEnVkZU/2To5Dwoo3hZP/Rr3at4XjbMrJMK6wITMYsNtmu3/ujRmRVjfTpYJ59bHkM/lh81lD
 OyjD16xrrD9JZvwouJBBHI8Svwu4HWrdlqb/vZg0mpl7TiCKi1m7GcwAC7SPOn7qtqepCudqHEeR5H
 j2b+ClNmvQAbRO+JWI8W5d/AJY16Qgd+P+tFZd78X5tbSA6r8SGzpR71X2+i+VhFpqqSNAdWFJqCNl
 BGynhTC2980c4Lqmb9m0zA+xaA6Qns2Y+lzXER4zX/PLRPje+4FB2rTM+ahhrO5nXw3crtTA5wBFff
 j1fGxkZgwv2+pmgSr11ZRKad6t2i16xbpoyw/gVaUUNRb2fa4PLfJs5P1mF3TnmjpmOYUEeXMLqvfR
 a4q3LwkrlLgKQdTUpmY9xvdyYIh1x7F5WpAbtD91ZWG+yFLJTxVY0tiPTwFcE6x006JxmKXrLpVckI
 FTbTydU9xaVWLTgb0i+3o/BisgbkDEzyNADMEejXIWeQK44wsOT4jYjwRLFTePnysA5aUR70NKAm4b
 RKXMTXm3CYLh6sS41bHqs/BmjUhJJgwIuFMWWnao/0HXTDYU6doBeX4tMcMw==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike the the very close A740 GPU on the SM8550 SoC, the A750 GPU
doesn't have an HWCFG block but a separate register set.

The missing registers are added in the a6xx.xml.h file that would
require a subsequent sync and the non-existent hwcfg is handled
in a6xx_set_hwcg().

The A750 GPU info are added under the adreno_is_a750() macro and
the ADRENO_7XX_GEN3 family id.

This adds:
- the GMU and SMMU bindings
- DRM driver changes
- DT nodes

Dependencies: None

Tested using Mesa's !26934 Merge Request [0] on the SM8650-QRD
and with kmscube & vkcube to test basic rendering.

[0] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26934

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (5):
      dt-bindings: display/msm/gmu: Document Adreno 750 GMU
      dt-bindings: arm-smmu: Document SM8650 GPU SMMU
      drm: msm: add support for A750 GPU
      arm64: dts: qcom: sm8650: add GPU nodes
      arm64: dts: qcom: sm8650-qrd: enable GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   7 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 169 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  29 +++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  14 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
 9 files changed, 241 insertions(+), 6 deletions(-)
---
base-commit: 84baf172e2fa30d6d6d0fb8ed076b47e836b74f1
change-id: 20240208-topic-sm8650-gpu-489d5e2c2b17

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

