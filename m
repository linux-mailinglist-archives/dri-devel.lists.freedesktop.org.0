Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4356B8D753E
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0993A10E193;
	Sun,  2 Jun 2024 12:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z56BJCt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C208910E0ED
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:52 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2eaad2c673fso2532351fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329891; x=1717934691; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ahx0B7IRhOU2KryLmin5A3x+RBjSRe40YtgpLFgn8h8=;
 b=z56BJCt2Nc/uT5cYb+WnovWD2QIXWcnTXC6WccskUo7IrKe+PUmSsmOTFz7edce9nI
 zqcsyjTPGGiz0WE6rq8MXHVcP6QJ7VU7KPkYkODuJXfjbrOFzQqayIullER0PpIo3a3+
 AQzfV4xihR1jMoxirnhRt/U9EdkSsIGMzNBrdfejDX48ouDzwQnaRRJ7iot7zR91QGOL
 vGetiusGx5zCgBrHallnO+uyyTkOhW3Sko5b8Jz00DgerK0Htbw2ebvUuPK/e0DUNqF8
 d4l2SAAUizK6Fs2Mm64SfWU26Y9FBMUpYo4fF1Z72ndlJXVqFYK/kAgCRDY6VDQi2e42
 gnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329891; x=1717934691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ahx0B7IRhOU2KryLmin5A3x+RBjSRe40YtgpLFgn8h8=;
 b=aE32QKDxx2tUPUx55pd9whvPvTlId5OpBKx9YbZgOo1hv0TuolO6T1lGxcnX1nB025
 Ej6hT+0bsX2qerYt9NmLOB6Vpooi8SVOGVHtTahoEvYFNAxrlqFoVzhqWedHuJLuWZrz
 zDpYCSY3Xpbtor47H0n7ApRKmmDWQLsVvAFno7cL6fSkjvgVjxONbOom5MbKE8yfEUwz
 KyZ5xgx2FtTSSYBGAqkoHpsqrMIMpYOQvb5Rux/tQNP6ogEi8rGZyz6GmGxRo83FCBlb
 dQWDv+vtHSDivhsJJNEJPDNpxLeB81NlXFjYYtazyJgsUDYLDjsBVI3f42AK7/OXf2IV
 lwpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnTigcirHdyaY9SgSwaQK4h0d5RE+qm/Ru1rpdVFCEf3G/Us43MgvaOszyzK+oxaah8fflDHZ3W8k2kK2slsUiioAT/EHLtGhFZI7B0bG2
X-Gm-Message-State: AOJu0YzKgOQrO4nlgrd4NpcWR9gxG3Wnwlxbq5ceVUcsF0hF8m8h83ps
 raF7N3lraoVLAIIeQGnpjDYkt9d/ThEzrsAm7cqF/GFtHsWQQnhGcwJIRYhDLJ0=
X-Google-Smtp-Source: AGHT+IE9DlkDZJ/q6anZcEZCR4WzqVIVNYRa7q0Ns7NW+snWcKddBdYHt8pvqycOhI6UxRrnqrZ28A==
X-Received: by 2002:a19:f603:0:b0:52a:e7c7:4ce6 with SMTP id
 2adb3069b0e04-52b895633dbmr5188478e87.39.1717329890815; 
 Sun, 02 Jun 2024 05:04:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:45 +0300
Subject: [PATCH v3 05/12] drm/imx: ldb: drop custom EDID support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-5-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l7M3G39iu9nNrCk8sJLPBZk54Nd8nGO4KLe4Ou6kT5o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/dci5cApIh4CbjmDaF29E9SsPPCAy9IC1BP
 ookreVYSv6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3QAKCRCLPIo+Aiko
 1cwKB/4xCsYHUgD+LgO7CvPxVhR6dSFIH9rYipIXrsQtH3yVtnXKxqJVgzCEVAa05JbbXYH4ozm
 RGrPvgpfVs5QGXj/4+MKxODCFxUFgqKcXQVdlh7exxMGFAAXoc1FMl7K7Kscd59HZM9ALmd95jO
 nkRvO0T+JiSJhIy4mucD6HAXICDqQ9iH64hAwCiC+og87UzNN4W4uWK+Qn5WpFYsn9h9eCL0GR5
 8Aa0ZHfyxbhjEw4Tpo5oN3TLUtg/FfUdILUEkXtOi4Dzy8tLxkjc7eP84g4JYJrwZytzOUmXqlo
 cj1OsANGFG1AJ4XbaaYw73OVV6ibGtMWOB3FKoFa7K2w3JKK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Bindings for the imx-ldb never allowed specifying the EDID in DT. None
of the existing DT files use it. Drop it now in favour of using debugfs
overrides or the drm.edid_firmware support.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 793dfb1a3ed0..1924d8921c62 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -72,7 +72,6 @@ struct imx_ldb_channel {
 	struct device_node *child;
 	struct i2c_adapter *ddc;
 	int chno;
-	const struct drm_edid *drm_edid;
 	struct drm_display_mode mode;
 	int mode_valid;
 	u32 bus_format;
@@ -142,14 +141,17 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (!imx_ldb_ch->drm_edid && imx_ldb_ch->ddc) {
-		imx_ldb_ch->drm_edid = drm_edid_read_ddc(connector,
-							 imx_ldb_ch->ddc);
-		drm_edid_connector_update(connector, imx_ldb_ch->drm_edid);
-	}
+	if (imx_ldb_ch->ddc) {
+		const struct drm_edid *edid = drm_edid_read_ddc(connector,
+								imx_ldb_ch->ddc);
 
-	if (imx_ldb_ch->drm_edid)
-		num_modes = drm_edid_connector_add_modes(connector);
+		if (edid) {
+			drm_edid_connector_update(connector, edid);
+			drm_edid_free(edid);
+
+			return drm_edid_connector_add_modes(connector);
+		}
+	}
 
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
@@ -566,18 +568,10 @@ static int imx_ldb_panel_ddc(struct device *dev,
 	}
 
 	if (!channel->ddc) {
-		const void *edidp;
-		int edid_len;
-
 		/* if no DDC available, fallback to hardcoded EDID */
 		dev_dbg(dev, "no ddc available\n");
 
-		edidp = of_get_property(child, "edid", &edid_len);
-		if (edidp) {
-			channel->drm_edid = drm_edid_alloc(edidp, edid_len);
-			if (!channel->drm_edid)
-				return -ENOMEM;
-		} else if (!channel->panel) {
+		if (!channel->panel) {
 			/* fallback to display-timings node */
 			ret = of_get_drm_display_mode(child,
 						      &channel->mode,
@@ -744,7 +738,6 @@ static void imx_ldb_remove(struct platform_device *pdev)
 	for (i = 0; i < 2; i++) {
 		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
 
-		drm_edid_free(channel->drm_edid);
 		i2c_put_adapter(channel->ddc);
 	}
 

-- 
2.39.2

