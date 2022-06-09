Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E8544164
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 04:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCF011AF97;
	Thu,  9 Jun 2022 02:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619B111AF97
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 02:22:41 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id c18so12249696pgh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 19:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zUInyvNeOnDXs6rfO5VKVDhyL30Ry7vKQyVq8b/sXhM=;
 b=URFVRvzYDluiblUwQq0fFYaerhtlF8YxghQ8N9Sk9qFp3XcUC/UN6ixBnaxA2e4s9l
 2XU1ufsmKeJFRB8lKM/0XUTQ/seh6zC/7VWXW2ktyopwuZvHMa1x42kogSv8c9cYuK5i
 keBswrmSPE26QtkbcNEIqCYXw0L9DJJdv8Hz/RFjEo5yib6drZVERoP/5ge5QUE5I4JO
 s+5/rxrM0nBL0ig3B3rRwZr2ndKjhCmlcQpdyM6l8ekz29Pb4d9wWNvoAVelyCL2IDEW
 2WNlja1Ue5RBd7NabxHWxha+FK3kDgvIDtp5e/ZDNmCQSKuXljhNcLxLGG2Zqw3gab0h
 fhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zUInyvNeOnDXs6rfO5VKVDhyL30Ry7vKQyVq8b/sXhM=;
 b=a1d5v7q3SbnNjk7Z6SyM1Urpm6UHJ5IDHsZnMeDbaHpIGfiaJUAOKkjpBt9vGtLHiq
 u6GU/o3nfpxi2Yv79ZfVbGKbNXoVeT25RUPWU7okYSV48U+7QWNmSbGjkVpJ/AXOTvFN
 DWrisWJnbrIWIpQPOOaJ/WEnF1i0TihHX913cCTZSn3vssAnGtHxbw7Rniqm2m1eRO0O
 ejikrk6YyU/2gmGyYYpYUaf/yc1dl8Y8y6hFicBBoSaSuXA0IwrTYJ9b2VRNelFOACdO
 jRRdTm2B6cRXreUhTolfsttuHXU3Qi70dyoW/Y11E7sYmzvDQcSBwJrfLWzRnKgZEQ0a
 C0aA==
X-Gm-Message-State: AOAM530OSyVbP8n/VxTyu9Mlj6qKdW5KeZXL7ye6QCfqS15xtKIAr43B
 bC34G10PHyfDtD9M/AZZ90Q=
X-Google-Smtp-Source: ABdhPJxgN6xlX7nmneOpKS4cylXau9IRK1Vj1JgQbUIyitFG9LNgyXER82qKAdrSu8+0lZQhHjeIXw==
X-Received: by 2002:a63:ea4f:0:b0:3c6:6534:d8f2 with SMTP id
 l15-20020a63ea4f000000b003c66534d8f2mr32515923pgk.187.1654741360832; 
 Wed, 08 Jun 2022 19:22:40 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:478:d041:804b:4db9:72:b011])
 by smtp.gmail.com with ESMTPSA id
 y22-20020aa78056000000b005183f333721sm15748770pfm.87.2022.06.08.19.22.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jun 2022 19:22:40 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH v3 2/2] backlight: rt4831: Apply ocp level from devicetree
Date: Thu,  9 Jun 2022 10:22:19 +0800
Message-Id: <1654741339-12756-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654741339-12756-1-git-send-email-u0084500@gmail.com>
References: <1654741339-12756-1-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add 'richtek,bled-ocp-microamp' property parsing in
device_property_init function.

This value may configure prior to the kernel driver. If it's not specified in
devicetree, keep the original setting. Else, use clamp to align the
value in min/max range and also roundup to choose the best selector.

Reported-by: Lucas Tsai <lucas_tsai@richtek.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Since v2:
- Prase the 'richtek,bled-ocp-microamp', clamp the value in min/max range, and
  roundup to get the best selector.

---
 drivers/video/backlight/rt4831-backlight.c | 33 +++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
index 42155c7..8c2001b 100644
--- a/drivers/video/backlight/rt4831-backlight.c
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -12,6 +12,7 @@
 #define RT4831_REG_BLCFG	0x02
 #define RT4831_REG_BLDIML	0x04
 #define RT4831_REG_ENABLE	0x08
+#define RT4831_REG_BLOPT2	0x11
 
 #define RT4831_BLMAX_BRIGHTNESS	2048
 
@@ -23,6 +24,11 @@
 #define RT4831_BLDIML_MASK	GENMASK(2, 0)
 #define RT4831_BLDIMH_MASK	GENMASK(10, 3)
 #define RT4831_BLDIMH_SHIFT	3
+#define RT4831_BLOCP_MASK	GENMASK(1, 0)
+
+#define RT4831_BLOCP_MINUA	900000
+#define RT4831_BLOCP_MAXUA	1800000
+#define RT4831_BLOCP_STEPUA	300000
 
 struct rt4831_priv {
 	struct device *dev;
@@ -85,7 +91,7 @@ static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
 {
 	struct device *dev = priv->dev;
 	u8 propval;
-	u32 brightness;
+	u32 brightness, ocp_uA;
 	unsigned int val = 0;
 	int ret;
 
@@ -120,6 +126,31 @@ static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
 	if (ret)
 		return ret;
 
+	/*
+	 * This OCP level is used to protect and limit the inductor current.
+	 * If inductor peak current reach the level, low-side MOSFET will be
+	 * turned off. Meanwhile, the output channel current may be limited.
+	 * To match the configured channel current, the inductor chosen must
+	 * be higher than the OCP level.
+	 *
+	 * Not like the OVP level, the default 21V can be used in the most
+	 * application. But if the chosen OCP level is smaller than needed,
+	 * it will also affect the backlight channel output current to be
+	 * smaller than the register setting.
+	 */
+	ret = device_property_read_u32(dev, "richtek,bled-ocp-microamp",
+				       &ocp_uA);
+	if (!ret) {
+		ocp_uA = clamp_val(ocp_uA, RT4831_BLOCP_MINUA,
+				   RT4831_BLOCP_MAXUA);
+		val = roundup(ocp_uA - RT4831_BLOCP_MINUA,
+			      RT4831_BLOCP_STEPUA);
+		ret = regmap_update_bits(priv->regmap, RT4831_REG_BLOPT2,
+					 RT4831_BLOCP_MASK, val);
+		if (ret)
+			return ret;
+	}
+
 	ret = device_property_read_u8(dev, "richtek,channel-use", &propval);
 	if (ret) {
 		dev_err(dev, "richtek,channel-use DT property missing\n");
-- 
2.7.4

