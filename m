Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762AC5BC7B8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 12:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9091A10E5F4;
	Mon, 19 Sep 2022 10:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4E010E5F0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:20:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id y5so3190284wrh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=FLNJe0JUSRM3gBcqN/9WtyocKRp8artYXxirlKrkCMM=;
 b=UbSLEIHwUbZOFhcPz39rZrpiWK0db+qvUJMVyxwn8ti/Q1PIFhXL4y4K7BLPnqw7cU
 lLS4OMMOAt3b81mbV4TdHk+LFmBUJG9V+CMnJhYs5Xoq08cYCEex6hcKPu1o7YfSM272
 /wXRt2yvu3uRUYuWIA6ZRb+sN1Zpsr2u3mAgKlYRN0LOR8qt27sxz1w3+IjxG3ltCOLW
 72t/VglltSpmlxCB/GMjTytpeX5+YoITmwchFd3GbfK5eYQxqUEWyWRNGY0ObMPKz7vy
 CvJDN1kXPnrSOc9cRvVERgN5M5B16lBjeORGNvFa90o5t9D3/uPFhFaMwd/WMs47VVbV
 a3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FLNJe0JUSRM3gBcqN/9WtyocKRp8artYXxirlKrkCMM=;
 b=RpXmXixUmd2dtv62UAa1ZtVsD8ff32EweyyKP4W6rLEOz3LbVDhGaYoT0v0pSEvlIa
 8gOJlVpO9Go6xaiZm8m8aCjVfMI9k5Obf85023a1H3CtRCABEuMqVSJ1xUyxk6Ya6T0z
 EimhCZ3a7TVy3DidT+8mV0k8lHlEvAkKhgfiZsFC4e78N+YXtlvmr4kmgqvbb401CmxI
 AP1e+TIrDG6wil2sLGwhNj8xGVYy//0PV11oP/lioQfOJE+RzUogAA5vdjNYt2Nj63pG
 Pp87Yty9MSFJXuBIEZ8UkQyj5dirf4ahVgNSRBCi3P3I/AaHA/M1E9w6UBnSzes67kQ/
 uahw==
X-Gm-Message-State: ACrzQf0bChgPHRhE8GWBmFB4N8J0iXHd9S8y9yVuBM1lzRb0CA9ntDqk
 f84AMoRzBO+HgS9fQ/BCyOB1CA==
X-Google-Smtp-Source: AMsMyM6inkEg2Eq/opsVX/kkhffSFPJMLmSfskV7ArGxjBXwiKdCgEh8S8LQDLu8X9H8c72GYi37bw==
X-Received: by 2002:adf:e806:0:b0:22a:f5c6:6954 with SMTP id
 o6-20020adfe806000000b0022af5c66954mr5072807wrm.539.1663582825984; 
 Mon, 19 Sep 2022 03:20:25 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a7bce02000000b003b483000583sm12784245wmc.48.2022.09.19.03.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 03:20:25 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] Revert "drm/bridge: chrontel-ch7033: Add byteswap
 order setting"
Date: Mon, 19 Sep 2022 12:20:09 +0200
Message-Id: <20220919102009.150503-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919102009.150503-1-robert.foss@linaro.org>
References: <20220919102009.150503-1-robert.foss@linaro.org>
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

Revert this patch since it depends on devicetree functionality that
previously has been reverted in the below commit.

commit e798ba3374a1 ("Revert "dt-bindings: Add byteswap order to chrontel ch7033"")

This reverts commit ce9564cfc9aea65e68eb343c599317633bc2321a.

Fixes: 8c9c40ec8344 ("Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP"")
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index c5719908ce2d..ba060277c3fd 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -68,7 +68,6 @@ enum {
 	BYTE_SWAP_GBR	= 3,
 	BYTE_SWAP_BRG	= 4,
 	BYTE_SWAP_BGR	= 5,
-	BYTE_SWAP_MAX	= 6,
 };
 
 /* Page 0, Register 0x19 */
@@ -356,8 +355,6 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
 	int hsynclen = mode->hsync_end - mode->hsync_start;
 	int vbporch = mode->vsync_start - mode->vdisplay;
 	int vsynclen = mode->vsync_end - mode->vsync_start;
-	u8 byte_swap;
-	int ret;
 
 	/*
 	 * Page 4
@@ -401,16 +398,8 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
 	regmap_write(priv->regmap, 0x15, vbporch);
 	regmap_write(priv->regmap, 0x16, vsynclen);
 
-	/* Input color swap. Byte order is optional and will default to
-	 * BYTE_SWAP_BGR to preserve backwards compatibility with existing
-	 * driver.
-	 */
-	ret = of_property_read_u8(priv->bridge.of_node, "chrontel,byteswap",
-				  &byte_swap);
-	if (!ret && byte_swap < BYTE_SWAP_MAX)
-		regmap_update_bits(priv->regmap, 0x18, SWAP, byte_swap);
-	else
-		regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
+	/* Input color swap. */
+	regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
 
 	/* Input clock and sync polarity. */
 	regmap_update_bits(priv->regmap, 0x19, 0x1, mode->clock >> 16);
-- 
2.34.1

