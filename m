Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B49136E3
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 01:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DE010E527;
	Sat, 22 Jun 2024 23:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KpOjV5YF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDD110E518;
 Sat, 22 Jun 2024 23:26:02 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-364b2f92388so2112467f8f.2; 
 Sat, 22 Jun 2024 16:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719098760; x=1719703560; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9HxxfvJUbEcWAuUqzp/z3HeawFFFv82S2A3aKWCvEsY=;
 b=KpOjV5YFMaDOSV0qzky0RoPSSy+X6Z7NWVFo0uWfHovRwyRP7w/MTBMMPXKxsGliav
 DkqZCa9tJUM5QaioDeyjQpdEUDw0cEhwGO/ybiFCP18N9lBBOgAJO1Tgzp3PFVWbR7IN
 qpHHVFrTtM1ZaHJqA2eIm9Ir44dQJ43TeWu3y1fkb+j5Ll89svA5ppeW3+fwfbhr7LEA
 sdKgJUVFVhIcydxotO4ByHzElntpJrHNAU0GtnPqZih/wgZdUx+zlL1uvvA6A7S3agQO
 hmOY5/6RVCWzJNKLnh/3uP9F5foAdZ2uZh24B0n12N3ipyyXhRjfWKgIDSn5KONQoqcN
 1SQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719098760; x=1719703560;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HxxfvJUbEcWAuUqzp/z3HeawFFFv82S2A3aKWCvEsY=;
 b=VblkJQkf1hZSff09owr6YLo8eobcPpSPLtuGfHouF/GR4PbEXnggj+quWQO28aPvCj
 YdHsd8k+Y9+++Xc4Km57JswY4vdKf5n82uZ4ns9M/P8ljYVFfRrOUg9rG6pOwm9PPbyc
 6GcU8YEKJ/IJCLIrsoKRcEiC7bDiqXN+X0k987of419C4Z/F330ryDHR/8Ehv9WN54oU
 J2eqtUbK0EC0AFh0TE906FafuwrHq16a29S4tlz6yeouZc4qvAJ7kNBWwZ+jd5a6/zdP
 LVYl4ikpqhaLtk2FbuQ4MKJ2aEY9rd0lj6bOQxm8ah1JpBU2LjP0RLR+tLLGtyipNLzV
 0jUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSXTeaBmJ4ZmUGx0UNajr5mrG/DdJqCsEqHMM5TlaxAjArT5MzR4Zdm1WoNVOhYjAylsTNv90hrZdn1pVYcoicEwUzdC0lKZVvHe3G/c09wNDplLl+B58oElAEUMESzKhCMZkuMO8sYalo0ZS7F8bC
X-Gm-Message-State: AOJu0Ywq1gTYfDk0tL/EkYexsU/fJG3TQlQfJqEKJH1SViPn9OiCJ9Le
 8QJVaDwEVJ6NPU635TgEeOw8J9RGulu+bxpWdm4D3ZJG3NOB5u+v
X-Google-Smtp-Source: AGHT+IF+eQztVkaYxVTPniLTiN0Q2Wuwvs1PNUhkt+p/MWOEuEvm4JylLlMlCQKx4FGcg1T83BFCHA==
X-Received: by 2002:a05:6000:2c2:b0:366:eb45:6d55 with SMTP id
 ffacd0b85a97d-366eb456ecemr217579f8f.49.1719098760243; 
 Sat, 22 Jun 2024 16:26:00 -0700 (PDT)
Received: from [192.168.1.90]
 (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu.
 [2001:4c4e:1812:9200:deae:e202:304:a5a2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 16:25:59 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 01:25:54 +0200
Subject: [PATCH 4/4] drm/msm/dsi: Add phy configuration for MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v1-4-4ab560eb5bd9@gmail.com>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
In-Reply-To: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0
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

From: Daniil Titov <daniilt971@gmail.com>

Add phy configuration for 28nm dsi phy found on MSM8937 SoC. Only
difference from existing msm8916 configuration is number of phy
and io_start addresses.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 24a347fe2998..dd58bc0a49eb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -545,6 +545,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_28nm_lp_cfgs },
 	{ .compatible = "qcom,dsi-phy-28nm-8226",
 	  .data = &dsi_phy_28nm_8226_cfgs },
+	{ .compatible = "qcom,dsi-phy-28nm-8937",
+	  .data = &dsi_phy_28nm_8937_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_20NM_PHY
 	{ .compatible = "qcom,dsi-phy-20nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 5a5dc3faa971..a9b4eb2c0e8c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -47,6 +47,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8937_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index ceec7bb87bf1..3afc8b1c9bdf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -917,3 +917,21 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs = {
 	.num_dsi_phy = 1,
 	.quirks = DSI_PHY_28NM_QUIRK_PHY_8226,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_28nm_8937_cfgs = {
+	.has_phy_regulator = true,
+	.regulator_data = dsi_phy_28nm_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_regulators),
+	.ops = {
+		.enable = dsi_28nm_phy_enable,
+		.disable = dsi_28nm_phy_disable,
+		.pll_init = dsi_pll_28nm_init,
+		.save_pll_state = dsi_28nm_pll_save_state,
+		.restore_pll_state = dsi_28nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0x1a94400, 0x1a96400 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
+};

-- 
2.45.2

