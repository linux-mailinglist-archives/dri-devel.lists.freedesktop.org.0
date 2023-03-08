Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954C6B0CEC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9E010E60D;
	Wed,  8 Mar 2023 15:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF1310E60B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 15:34:20 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id ks17so11313754qvb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 07:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678289659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=;
 b=fbtcVf78wm2MkSmtDAJmRhaQh1osCKcowM4XAkX+nCcGF6az0qTlAyto4b3XzMMEX8
 1tWYJB2tGCwuoFs/SKIAAromzTNWKoDnp9kWRseyGcwp3MqEWUqh+tI4bK2RS0vIpbU7
 5nJHnHuuaiLHIKo98wHgib+iOiPcGFwS0xSrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678289659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=;
 b=JUG9Ow30Y4xxRUeHTgNbHNyHWhaV/+hFYcw+IJ4PqACcvubkUzFXa7aeuTRE8BiXkB
 hgObVCRAyRGrUxS783ykadEhK4Q1FMErmFcQ/MWirgQ6U/VNqmR669veVwQhaD4nCKtB
 COka9vXp845Dj8p0KJ2xy55pO2njLN969Kq7lDjATb2ZozFQ7crmGvgPE4aEaNuIpBAw
 YzffuCOBPJ3oGio0Nrv4C2zg1vvYsrUfrHBFZgzQWcTioayi9nDLB0mPLopKBVprKbq7
 TLYjiL26s83ipvMZWQRtfJitabf5adUGE3cANYqzb/dOwx6fEXZCmW428m2+P02oz+42
 XmlQ==
X-Gm-Message-State: AO0yUKXc2Q2rLE5K5KUxIy8xpu/epVZC9sVtYDEM2TyW2vGq9WehG5Ai
 d2cQdMKKNgQsjnTQTM3fe1M62JEP8kA5ZhG0scyRJQ==
X-Google-Smtp-Source: AK7set+/Yh8U5nfOjnXXD2FUZZsh5QPgFOmkiVgcnLubTQxADoPInKttBVk6EZO8zlHUC1jUa+tgiw==
X-Received: by 2002:a05:6214:493:b0:56e:9986:4fa9 with SMTP id
 pt19-20020a056214049300b0056e99864fa9mr36817046qvb.7.1678289659298; 
 Wed, 08 Mar 2023 07:34:19 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:8752:d0ab:8bcc:f9a8])
 by smtp.gmail.com with ESMTPSA id
 c134-20020ae9ed8c000000b0073d873df3fesm10506884qkg.30.2023.03.08.07.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:34:19 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 RESEND 3/3] drm/mediatek: Enable AR30 and BA30 overlays on
 MT8195
Date: Wed,  8 Mar 2023 10:33:58 -0500
Message-Id: <20230308153358.333297-4-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230308153358.333297-1-greenjustin@chromium.org>
References: <20230308153358.333297-1-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, greenjustin@chromium.org,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested using "modetest -P" on an MT8195 device.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index a6255e847104..7d26f7055751 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -85,6 +85,22 @@ static const u32 mt8173_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+static const u32 mt8195_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -616,8 +632,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8195_formats,
+	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.supports_clrfmt_ext = true,
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
-- 
2.39.1.456.gfc5497dd1b-goog

