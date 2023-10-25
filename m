Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB207D6352
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B1E10E57C;
	Wed, 25 Oct 2023 07:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E3910E57C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:35:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32dd70c5401so3565486f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698219317; x=1698824117; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5z/V4Jmy9kuxnbn3ouk6FBjzE9CgTURmmBJt5Ad2jiY=;
 b=x3aobW40KHeKSOPypNb2fObTY3FDyL9ETEKfyXH27cuwn/uNJwhmYnvOGc/3cIKL8H
 eaFACKpLyNzEbzFn+MfIpN/5ker8alM151HbrDVaaTzN42/U8v1xx4M4FfqEycjXKO0S
 8HzcE3KEkyHzBINArTHeJBrIIAxio2scpzUWy+GF2EFi2kPDvgFFG7rqOgG1Qm83U7ny
 dxA9XL1dotGuvaKzRi3TpuHl0KBUue45c57JDLAOcmX8vnLvZ1KX6viw9gn7VhQwh3h1
 i/omhZxlp3Bbb1Thim/2gXRZivMB9TnAfjzyO9Ygn6tYF4ibSgPWbstxH7OoUDja0N0L
 T59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698219317; x=1698824117;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5z/V4Jmy9kuxnbn3ouk6FBjzE9CgTURmmBJt5Ad2jiY=;
 b=wKI5U4CUvPvYqRvH6XkaLQDw+nFtzI1jY8EtT0PCiwZaRhGhIkSpEEAkNVs7xruQ+j
 MuqQnhZuKabyGTdlF+WG3OAXjAo46sBzzDo/7gizFC9N5lLU1KYxOCR/HxPMV0bShjhq
 VudyiwKtuIttpjhCas2SfTx1H6ly2qbJj8TB0SRFF3OBrjFK9uS0tubwBsxbiFJSk4Ec
 6gicMLTTMmU8DIUZabNzL4hMn+lcsrUn0lw3P5JB4GZSCy4+TGqZmFqkwT8DMyVMmKRT
 km4dnWALjxUiYctGssMhgy6nBzB2vvlfpaUT49TAwDwwq/AkL17YiMzEEOeusKOROKyf
 pJWA==
X-Gm-Message-State: AOJu0YwORGMbLiHLHrqftTlWj5Iu8Lx7LZBF/nPCbZue0vDuHD9KSXxn
 T98yjrn905L/tnSj0v6SDtj//w==
X-Google-Smtp-Source: AGHT+IE5zyDvAyehklMpJ1ZEUwAbRzg6PLLJ4r41F8kakjZ1hGGNicIg9kP4MsQSpO+6DvjHlvWxgQ==
X-Received: by 2002:a5d:67c5:0:b0:32d:b9c5:82fb with SMTP id
 n5-20020a5d67c5000000b0032db9c582fbmr10037908wrw.30.1698219317422; 
 Wed, 25 Oct 2023 00:35:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a5d60d2000000b003248a490e3asm11449058wrt.39.2023.10.25.00.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 00:35:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Oct 2023 09:35:06 +0200
Subject: [PATCH 8/8] drm/msm: dsi: add support for DSI 2.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-mdss-v1-8-bb219b8c7a51@linaro.org>
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0yTTxYhVn2OwUhlFrykG9TyQLX4KleetjzQPvdPaNCE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMUoKLkNIC0plpTG8eAgW09BRrCnILlvA5niTNpw
 8X6TYmKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjFKAAKCRB33NvayMhJ0QDhD/
 9PTVjrCJUYTDE+PBfqY1lyYKPJqK/UFS51fCg5PPHBX2ZHtBLT/xO+uCr9k902qMhFZYm07vODeIEN
 CbxMb6NmFMoHqfMV4Xn5r9lKSQsQzmfhwhTbZlNf+2G6s0dwmZnKde01l+jJurrq4HFPl+P15J7vp5
 UmLWGA+3AG5iRHIm+FxKhTZ1P8RGwuKm03LB8QXSdiuvVNtpofdCT7H4EdU86xDyZp/8TU9fouYC/v
 pniJ4sgVi5ESVKu5xOjEWhzK5a1P/uFenfM8Ab0q/MofAlv5lZndIKZjo84LsFcbvZof7/THY2pm2T
 V1vB3YxIeNzhkM+hhELyzcSzimR71fzY4zfinl8cljz61aggfrRRe2We8x8jofoVQXmpSLpK5X6Jum
 KJKqQ608tJ1HLyedpJ+UIzzOYZoLYTC1+ml9hg8oTddd8PIvm/mxOc3wLRsnQWRRgYApfZq6hsEJUO
 AxjhwryeBeeaBvptdtNlTZKEfjQ8DG/aWA6pFa6FUEj8fA+ubM8FrY7AnAlaC+lxtaFaYMRpGXD9M4
 gM4nQbFz7uzmtM/Cng2l8iroXuwSIWURZKNnKWU3mBTA/Nh5CCRgX+BD4LW3UwmE4rDrX3RYfQnz31
 0E8BlRbvtcpo1WZXwJDBJnT7M+rnxQA5QQl/W6KIkp3cfiQpLaLY372wlWlQ==
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
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DSI Controller version 2.8.0 support for the SM8650 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 1f98ff74ceb0..10ba7d153d1c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -190,6 +190,21 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	},
 };
 
+static const struct regulator_bulk_data sm8650_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 16600 },	/* 1.2 V */
+};
+
+static const struct msm_dsi_config sm8650_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -281,6 +296,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_7_0,
 		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
+		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 43f0dd74edb6..4c9b4b37681b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -28,6 +28,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
 #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
+#define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 

-- 
2.34.1

