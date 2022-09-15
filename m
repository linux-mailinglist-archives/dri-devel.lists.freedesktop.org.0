Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C55B98C2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 12:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51010E17D;
	Thu, 15 Sep 2022 10:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2010C10E165
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 10:29:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 u15-20020a05600c19cf00b003b4acef34b1so902684wmq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 03:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=t1tgoHzcuNz6608F9ral59980nRZm0iCe/jA9+SaWcw=;
 b=xfY46AXwiEIXzTNjMYfvBmoBvK4Okl/KzOSF3uSeGFm9POQCmX8JyovEnujiJcNHwM
 Q3BVJh22F5JuOT6W6BYomK3QVYIlZkz0XNt+sRs7eohfl2mDzwt9HSwzSjqL1+PF1j5C
 I99VRPz5qfWn/dIucemh/z/u9xxMc9BOy2JhbFIgxaaqqq3q9hJ6G5dA/ZIfbEJy5t0z
 zrTUFWM6+xc6gsr7KV0J85QlrOcwQ4zjeDX9eNA9jOm6bMTFUHS7HeImyzOvC1Kl9jea
 +QRxQhQeaOoNkcXJWMYW5xrvveb4Xy7B53oSinOGsWTXdBO0E9KnJAdbVNffCEsei0Jv
 kVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=t1tgoHzcuNz6608F9ral59980nRZm0iCe/jA9+SaWcw=;
 b=nXo1Rz/rENpwlO1v4+HObDDfi3g6Ku713wr7pQH016Rq5D5hZsi+7ghaMnpFbdiZk2
 C0LIag+AImumMabBjysN7SnUwu7RGDlYYqSspsiQSVJSppAgdxfPI7Ekl8LLlMdBfdTD
 xFruJg7KDLktlaPDW+AzxC7WWeTmlwqD0W3eUPJBj92i/T4ly317O+WU+MQRK0chlj+m
 T+1pYez2drT2+S+4OZAmQpODGP/Hz+oh9beOAqpzp9h8w8cmbQhbdHuVmD/D6raf8qJZ
 JTUPRpUFZ5bPqaF/NiRDyph4KXwIoA4p0YmJkHNkCuz1RqqyfTpEW7ILC7Si07Fj1Fc6
 /c8Q==
X-Gm-Message-State: ACrzQf09QX2PZUuKPIIuEf18ifHwr2BJiWQY8GZL9lirfibvofB0UICu
 DROVWEgNUhCm6XBJ0gpww+u7qw==
X-Google-Smtp-Source: AMsMyM6l0IFcUEUYMdFQtm6+1h40cpF70ZwsOEncfkwpO534Z60smPFIjDXh6oCkTPCcHe7qz5kDEg==
X-Received: by 2002:a05:600c:5110:b0:3b4:b3d7:c30f with SMTP id
 o16-20020a05600c511000b003b4b3d7c30fmr333227wms.93.1663237770497; 
 Thu, 15 Sep 2022 03:29:30 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adff951000000b00228dff8d975sm2098257wrr.109.2022.09.15.03.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 03:29:29 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH v1 2/2] Revert "drm/bridge: chrontel-ch7033: Add byteswap
 order setting"
Date: Thu, 15 Sep 2022 12:29:24 +0200
Message-Id: <20220915102924.370090-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915102924.370090-1-robert.foss@linaro.org>
References: <20220915102924.370090-1-robert.foss@linaro.org>
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

