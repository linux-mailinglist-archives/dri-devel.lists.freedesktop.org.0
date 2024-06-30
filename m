Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B327191D45F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 00:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C39210E07D;
	Sun, 30 Jun 2024 22:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bOc52fIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACFB10E07D
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 22:19:39 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7f3cd802729so90699639f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 15:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719785978; x=1720390778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4xBwqprF3AIyKjWMpWtTgv9XeBi4pK+ZW2WSJxhUHqk=;
 b=bOc52fIhyo94psD+Ct7iZUCq2nw2rpC4A8NOEU+RBbLHFpNy3BHgBzOlwpJC87mUAQ
 F0ibw79sfNx5eHAMjQ5PNmHhgWrv37TK5uxLZ4I45ouhnj9AAgkOzxI873kA5TKBEUdy
 eTO3qyIqzsRHVItHfBXwnU4plmypYUZvObArQT76RO0zao7xW8pWMUxQFLxpaLsg0rwm
 Idms1uccjv6VeWuU2HVjdG6xGvKNn/et6MDor2YjZa1N2sOmXO1l45E7O/XWJsZ9yRqN
 zn+RZe+rC7/Gp0vFQKBQQFy6sY35aULTwlCuO49+xdU4v8JbvuQBHdCU3iAsuPZwVMPB
 9Uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719785978; x=1720390778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4xBwqprF3AIyKjWMpWtTgv9XeBi4pK+ZW2WSJxhUHqk=;
 b=YzRTZIUkI+t6zCE5Nwpx+LicRuX5YYtd7zt1F5zM7UFy57XehGdqnwMSxAYG+j7L4s
 wgpWhsHH3+V7yG92Em1WqdpDgEIwVY7EBQhlYPQ1nG7d+pmR1nLhCna1WzbmRhduZxCK
 GoyWHSAki8D1w4X8GkWf1oqSLNY24vv3vzS0XDfxSM+w2/0AyvVKmz86Rp3RbH56YQ+0
 N3vYMwiccrUok3tKLefMnMgRoaeOyJ7HqGHOpBsE0TKPYpntOqhh8ene/XKfHDoHsIKs
 s09Y47xMiXkiTw7Cxcq4lqUwtUoy8vgT1JbSRn/lxbJTgtjRyshc5rgr07lv/xtK+2pQ
 1spg==
X-Gm-Message-State: AOJu0YzWna2Q0Kk8oemvb1DBgUQ0IBdDflrjwz5ZjU4LuSWLvkI0J5VP
 TjGsaMDCARj9P/ZxrnRF6CoORCW+bvjZ48G/aYHNmGSgGoaTM61d4eN6VQ==
X-Google-Smtp-Source: AGHT+IFbelENHxw+JrJUzxuU8eqeK32hWjKnOOmc0H3WlPOot9jUlCb8eAKHQjc4ie+sDwHejBlnMg==
X-Received: by 2002:a6b:6106:0:b0:7f6:2e72:e81b with SMTP id
 ca18e2360f4ac-7f62ee168f6mr439239939f.4.1719785978120; 
 Sun, 30 Jun 2024 15:19:38 -0700 (PDT)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:3ec3:787e:965c:8518])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7f61ce9de0dsm171361839f.20.2024.06.30.15.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 15:19:37 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Liu Ying <victor.liu@nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH V3] drm/bridge: adv7511: Fix Intermittent EDID failures
Date: Sun, 30 Jun 2024 17:19:31 -0500
Message-ID: <20240630221931.1650565-1-aford173@gmail.com>
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

Reported-by: Liu Ying <victor.liu@nxp.com>
Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8MP EVK ADV7535 EDID retrieval w/o IRQ
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
V3:  Remove unnecessary declaration of ret by evaluating the return
     code of regmap_read directly.

V2:  Fix uninitialized cec_status
     Cut back a little on error handling to return either IRQ_NONE or
     IRQ_HANDLED.

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
index 44451a9658a3..2e9c88a2b5ed 100644
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
@@ -131,16 +131,19 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 	unsigned int rx_status;
 	int rx_order[3] = { -1, -1, -1 };
 	int i;
+	int irq_status = IRQ_NONE;
 
-	if (irq1 & irq_tx_mask)
+	if (irq1 & irq_tx_mask) {
 		adv_cec_tx_raw_status(adv7511, irq1);
+		irq_status = IRQ_HANDLED;
+	}
 
 	if (!(irq1 & irq_rx_mask))
-		return;
+		return irq_status;
 
 	if (regmap_read(adv7511->regmap_cec,
 			ADV7511_REG_CEC_RX_STATUS + offset, &rx_status))
-		return;
+		return irq_status;
 
 	/*
 	 * ADV7511_REG_CEC_RX_STATUS[5:0] contains the reception order of RX
@@ -172,6 +175,8 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 
 		adv7511_cec_rx(adv7511, rx_buf);
 	}
+
+	return IRQ_HANDLED;
 }
 
 static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 66ccb61e2a66..c8d2c4a157b2 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -469,6 +469,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
 {
 	unsigned int irq0, irq1;
 	int ret;
+	int cec_status = IRQ_NONE;
+	int irq_status = IRQ_NONE;
 
 	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
 	if (ret < 0)
@@ -478,29 +480,31 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
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
 #endif
 
-	return 0;
+	/* If there is no IRQ to handle, exit indicating no IRQ data */
+	if (irq_status == IRQ_HANDLED || cec_status == IRQ_HANDLED)
+		return IRQ_HANDLED;
+
+	return IRQ_NONE;
 }
 
 static irqreturn_t adv7511_irq_handler(int irq, void *devid)
@@ -509,7 +513,7 @@ static irqreturn_t adv7511_irq_handler(int irq, void *devid)
 	int ret;
 
 	ret = adv7511_irq_process(adv7511, true);
-	return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
+	return ret < 0 ? IRQ_NONE : ret;
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.43.0

