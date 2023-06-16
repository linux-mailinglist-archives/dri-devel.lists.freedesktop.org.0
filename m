Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFFA733610
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 18:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7753A10E662;
	Fri, 16 Jun 2023 16:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E0A10E65E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:33:05 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686933184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhH1R0k1FMdZMqZ1ZmsO99xF4oMGZu9gJvi4I7LfLsg=;
 b=noxmovHQ8qcAa8FiD6l2wd9EDxeauzev60RNLh+aiNP/CcnvTjeNBakKeKb13dVaExApmU
 WjZTCZT42nh7QZwkGbdyO5i5m5RTFYiefLabyyEOXdeT/GefkXa7ZtaqKqPy2KeYiuoAS5
 3e3xX6alivxarp+EITetPN5igwZZtFlxYprVONw0bD/X3D2wM74geOcIDTCyiufB04VnbR
 Cglr8Fz4lk63KeftbTiTD0XNo2RmrTRtB/5Sr0dZyvY7SHDPMuX2mlJIrTrru8e5SWbTTJ
 mei5svfMKQoD+8eBKVSXf/HNuGtGhFZb8Xeju96xRWMfdpcppWy9xHchLk7xkw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B6F7C0007;
 Fri, 16 Jun 2023 16:33:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/panel: sitronix-st7789v: Clarify a definition
Date: Fri, 16 Jun 2023 18:32:53 +0200
Message-Id: <20230616163255.2804163-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
References: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Sitronix datasheet explains BIT(1) of the RGBCTRL register as the
DOTCLK/PCLK edge used to sample the data lines:

    “0” The data is input on the positive edge of DOTCLK
    “1” The data is input on the negative edge of DOTCLK

IOW, this bit implies a falling edge and not a high state. Correct the
definition to ease the comparison with the datasheet.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 605b9f6d0f14..d7c5b3ad1baa 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -27,7 +27,7 @@
 #define ST7789V_RGBCTRL_RCM(n)			(((n) & 3) << 5)
 #define ST7789V_RGBCTRL_VSYNC_HIGH		BIT(3)
 #define ST7789V_RGBCTRL_HSYNC_HIGH		BIT(2)
-#define ST7789V_RGBCTRL_PCLK_HIGH		BIT(1)
+#define ST7789V_RGBCTRL_PCLK_FALLING		BIT(1)
 #define ST7789V_RGBCTRL_DE_LOW			BIT(0)
 #define ST7789V_RGBCTRL_VBP(n)			((n) & 0x7f)
 #define ST7789V_RGBCTRL_HBP(n)			((n) & 0x1f)
@@ -259,7 +259,7 @@ static int st7789v_prepare(struct drm_panel *panel)
 	if (ctx->info->mode->flags & DRM_MODE_FLAG_PHSYNC)
 		polarity |= ST7789V_RGBCTRL_HSYNC_HIGH;
 	if (ctx->info->bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE)
-		polarity |= ST7789V_RGBCTRL_PCLK_HIGH;
+		polarity |= ST7789V_RGBCTRL_PCLK_FALLING;
 	if (ctx->info->bus_flags & DRM_BUS_FLAG_DE_LOW)
 		polarity |= ST7789V_RGBCTRL_DE_LOW;
 
-- 
2.34.1

