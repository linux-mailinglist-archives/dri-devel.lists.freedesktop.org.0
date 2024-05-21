Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75C8CA5A7
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 03:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C57A10E401;
	Tue, 21 May 2024 01:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QmXrbNgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5178910E401
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 01:16:21 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-36c791e9faaso20783455ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 18:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716254180; x=1716858980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wk1PVGEUqYUMHx3xjwbIQevWry9UO/Bto1LV6ZupLw4=;
 b=QmXrbNgKpLLt+A6Ssvi1LyeeajoFsHq7Wghso1U+16xIyLL1pLEyL6T2n9LBbBVfZQ
 u8yGkrGzR3AIhXTX/OB4qAjbW+iH6km57hTGsKDSVzo3WyJdo2TvDvi0tltLYr1PipH2
 YpzfwHXD+enUCPKevVO0Cbyk5kz5CqyGsuXHULgA13JnHn6JymAngD8fsRZjj9qamPDm
 UR6BljheCyU++/+6KwWcA5qXEut2hzeEe3oLrCcy+RYip608UcTMDjtzVexG21HkMzxe
 sH5IF56DQDHToV+UkkTTRKzK4ltpcbylb7fL3zc5zxXy2oEVMPzgPNwMNuuR9k8T0nPj
 Igfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716254180; x=1716858980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wk1PVGEUqYUMHx3xjwbIQevWry9UO/Bto1LV6ZupLw4=;
 b=lZVMs+PYspe1wyvyHfsEU7WVvZ3JdmWxYCJZzs+H2WAD1Mp1VsqhONyrCrl0g3iH5+
 +yyWUuHjb4MNwU0O2FuF3i6tGZ+jH+gQyu50zEWrkg3dx2TW/icf94IFhxKNecRvuMJm
 oZhzwbrM1N3UeqAagCKJ8pSLvNphktUjH3g/JVqX64TN4dWS+o/rxpO20QBHK4xVhKr+
 oTacmzsao6w9aEvSilYz9mETztfIuVZ4qCMMgeCaNAxosfJ1XhNe9a2AFDFd/W5y9+i6
 9Sur3Is70mOifAag/rUzbC9D5jnLAWN/eqYBO+R+3IjrMhIvntqOHCBA0/iZSzF1UE8N
 AMhw==
X-Gm-Message-State: AOJu0YxJDXfJEa2yueYGF6egadhEyioYvGe1Y2bkbKuYtbBSRL4eWcUr
 PQ40LZfGc4QrQF5MPWrHtrEFrY9sQnfTU4gA2fdXp3xh0P+pHp5mg0j5LQ==
X-Google-Smtp-Source: AGHT+IEJiw0554sm+YCYgsX80AUBApa7ps6YI9bAy/tOYNreoqOPuVjaxcu+geidy7Fe5pe8Z3rLfQ==
X-Received: by 2002:a05:6e02:1607:b0:36b:2438:8805 with SMTP id
 e9e14a558f8ab-36cc1488a5fmr410004665ab.12.1716254179699; 
 Mon, 20 May 2024 18:16:19 -0700 (PDT)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:7221:2803:58e7:1e5f])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-489376dc92bsm6510089173.134.2024.05.20.18.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 18:16:19 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, ictor.liu@nxp.com, sui.jingfeng@linux.dev,
 aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: adv7511:  Fix Intermittent EDID failures
Date: Mon, 20 May 2024 20:16:14 -0500
Message-ID: <20240521011614.496421-1-aford173@gmail.com>
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

In the process of adding support for shared IRQ pins, a scenario
was accidentally created where adv7511_irq_process returned
prematurely causing the EDID to fail randomly.

Since the interrupt handler is broken up into two main helper functions,
update both of them to treat the helper functions as IRQ handlers. These
IRQ routines process their respective tasks as before, but if they
determine that actual work was done, mark the respective IRQ status
accordingly, and delay the check until everything has been processed.

This should guarantee the helper functions don't return prematurely
while still returning proper values of either IRQ_HANDLED or IRQ_NONE.

Reported by: Liu Ying <victor.liu@nxp.com>
Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index ea271f62b214..ec0b7f3d889c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -401,7 +401,7 @@ struct adv7511 {
 
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
 int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
-void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
+int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
 #else
 static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index 44451a9658a3..4efb2cabf1b5 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -119,7 +119,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511, int rx_buf)
 	cec_received_msg(adv7511->cec_adap, &msg);
 }
 
-void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
+int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 {
 	unsigned int offset = adv7511->info->reg_cec_offset;
 	const u32 irq_tx_mask = ADV7511_INT1_CEC_TX_READY |
@@ -130,17 +130,21 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 				ADV7511_INT1_CEC_RX_READY3;
 	unsigned int rx_status;
 	int rx_order[3] = { -1, -1, -1 };
-	int i;
+	int i, ret = 0;
+	int irq_status = IRQ_NONE;
 
-	if (irq1 & irq_tx_mask)
+	if (irq1 & irq_tx_mask) {
 		adv_cec_tx_raw_status(adv7511, irq1);
+		irq_status = IRQ_HANDLED;
+	}
 
 	if (!(irq1 & irq_rx_mask))
-		return;
+		return irq_status;
 
-	if (regmap_read(adv7511->regmap_cec,
-			ADV7511_REG_CEC_RX_STATUS + offset, &rx_status))
-		return;
+	ret = regmap_read(adv7511->regmap_cec,
+			ADV7511_REG_CEC_RX_STATUS + offset, &rx_status);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * ADV7511_REG_CEC_RX_STATUS[5:0] contains the reception order of RX
@@ -172,6 +176,8 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 
 		adv7511_cec_rx(adv7511, rx_buf);
 	}
+
+	return IRQ_HANDLED;
 }
 
 static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 66ccb61e2a66..56dd2d5a0376 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -469,6 +469,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
 {
 	unsigned int irq0, irq1;
 	int ret;
+	int cec_status;
+	int irq_status = IRQ_NONE;
 
 	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
 	if (ret < 0)
@@ -478,38 +480,41 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
 	if (ret < 0)
 		return ret;
 
-	/* If there is no IRQ to handle, exit indicating no IRQ data */
-	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
-	    !(irq1 & ADV7511_INT1_DDC_ERROR))
-		return -ENODATA;
-
 	regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
 	regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
 
-	if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.encoder)
+	if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.encoder) {
 		schedule_work(&adv7511->hpd_work);
+		irq_status = IRQ_HANDLED;
+	}
 
 	if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERROR) {
 		adv7511->edid_read = true;
 
 		if (adv7511->i2c_main->irq)
 			wake_up_all(&adv7511->wq);
+		irq_status = IRQ_HANDLED;
 	}
 
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
-	adv7511_cec_irq_process(adv7511, irq1);
+	cec_status = adv7511_cec_irq_process(adv7511, irq1);
+
+	if (cec_status < 0)
+		return cec_status;
 #endif
 
-	return 0;
+	/* If there is no IRQ to handle, exit indicating no IRQ data */
+	if (irq_status == IRQ_HANDLED || cec_status == IRQ_HANDLED)
+		return IRQ_HANDLED;
+
+	return IRQ_NONE;
 }
 
 static irqreturn_t adv7511_irq_handler(int irq, void *devid)
 {
 	struct adv7511 *adv7511 = devid;
-	int ret;
 
-	ret = adv7511_irq_process(adv7511, true);
-	return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
+	return adv7511_irq_process(adv7511, true);
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.43.0

