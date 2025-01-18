Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4EDA15DE9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 17:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3080C10E0E4;
	Sat, 18 Jan 2025 16:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RUZUtwdN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E1810E0E4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 16:07:49 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-436381876e2so4306005e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 08:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737216408; x=1737821208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vwdCXA8clqNZfv6cNEYqxDS+Or4qZ1J1EVJqPwpo/9c=;
 b=RUZUtwdNif2X4ksX9XkBNaLYXpR0ib+JithMdQUQaQDYBQwXhKB4kskVyHPzrimJ9m
 BY/4iPrDU8h1fIhuJW7l9Dg77HMfxMDKt2VnP3YwSXjCBGByxDgjDIJUweKR8D0rhdT9
 pemLOjJNe3HMwTxCoLhvjs6AqyBH8Ld4K77zar2NOaRRGzBfvd0tpBSx9ZL6GVTu9idx
 o9RG4OUBpeeBZKIU2adFm+MSENxjNMchMv5JTSowbmffLBMO7lqRLSvoJMtCMrrYWHOz
 iST4zuAtKUVANPQJn2YeDEHeYk28UPkEIjStGTFJAZx8vmrvvM7ospBwIgAsFL/B8ndU
 kaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737216408; x=1737821208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwdCXA8clqNZfv6cNEYqxDS+Or4qZ1J1EVJqPwpo/9c=;
 b=fj4tNgt9RMulJXKuvdKmI/jVW0XCyo/tNlFsoK8H6pnCUPTqHN9mw7fJF6Ripd0V0Y
 p1RrVCLyoE5Q8nyFE943bk5Je0bH5snsk3mLjDzbs/5PD70niQdVzIsY1KFEP3et6ZlT
 rNGSJ92M+kWRYUb5ZhRqp1IBFbSmq4Q1aQp9MgdKlfjIrNyoHWqu8uiujD/fxrf79mCy
 ZCKH8/SR7uchFusdqcN206LjwJpo709AFJLnB9ENMD+HPqu5QSzitmjKjx7UHu2AehLe
 6E9LwbsOAZxIsv8MElNSka78zJs13nYManyUANGAmEpQH5JownLAeCpisOVE/whpkoHc
 /eNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc88B6xUHPxFZv0EOTLlDTpfc90075kT/KS8JR7QPbfLWWrHDrvvTi7Zf6EjPA8bq4dm0PpLaBmdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztjIusizFevw0CxklqguKHNYaorq2pLtFxU1+SlxW0DuCep2tl
 LgOCv0oEtNAM2EEO5XPZayGShMKDBqNAWxXpLvvg1Xw/HwAVj/BDnRph1Mwf2gw=
X-Gm-Gg: ASbGncv4KwnXX2YTDWfOHZnuAuXYSiHPMdcbxorcq+D1Z3qjUBs3lr7tQ5uT3JkDoTh
 Xqp/7iSdSd73MhQu8TzOaiItKm1DXVvoIe1Glnt8a0v2+jgu7pLIRn8vojhjE8BCMQxWCJls3No
 +h+FydusbcQhhAzffjJyOvORYjY8JPO0y/+zH0Hb+2dA1NVswwyojBXJ+uKqyr+RCulOWcs5JVZ
 D7c5Ck546DApP2Kgk0OQmjhixQFXHzcP5UtsP9hFmnZnVkKkq845UnI3v5dwRRw62yj6VSiYnJa
 AKMEmFtz
X-Google-Smtp-Source: AGHT+IFMVBWg/sRcSunUViba7PAtliDqmSrFRcKnOLFwmE1beALCtPs34+Tkf+oAZ7uLqe5eQ56YKw==
X-Received: by 2002:a05:600c:510b:b0:436:fb10:d595 with SMTP id
 5b1f17b1804b1-438913bff64mr26793385e9.1.1737216408218; 
 Sat, 18 Jan 2025 08:06:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c475csm133966725e9.20.2025.01.18.08.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 08:06:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/panfrost: Drop redundant Mediatek driver data
Date: Sat, 18 Jan 2025 17:06:45 +0100
Message-ID: <20250118160645.78473-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

mediatek_mt8192_supplies are exactly the same as
mediatek_mt8183_b_supplies.  mediatek_mt8188_data is exactly the same as
&mediatek_mt8183_b_data.  There is never point in duplicating all these
structures - it only raises questions or encourages bugs when someone
updates one variant without changing the other.  Drop duplicated code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac7..12ccc5a11c0e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -817,21 +817,11 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
-/* MT8188 uses the same power domains and power supplies as MT8183 */
-static const struct panfrost_compatible mediatek_mt8188_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
-	.supply_names = mediatek_mt8183_b_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
-	.pm_domain_names = mediatek_mt8183_pm_domains,
-	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
-};
-
-static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
 static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
 							   "core3", "core4" };
 static const struct panfrost_compatible mediatek_mt8192_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8192_supplies) - 1,
-	.supply_names = mediatek_mt8192_supplies,
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
+	.supply_names = mediatek_mt8183_b_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
 	.pm_domain_names = mediatek_mt8192_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
@@ -857,7 +847,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
-	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
+	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8183_b_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{}
 };
-- 
2.43.0

