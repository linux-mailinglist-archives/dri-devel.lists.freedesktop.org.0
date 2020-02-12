Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D9D15AA3B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 14:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381056EAB3;
	Wed, 12 Feb 2020 13:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0636EABC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 13:43:02 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d11so2030701qko.8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 05:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=87DN7/fLWnnFI6PlbYzhjd20dcBpIPR3jsC8NVnfyfk=;
 b=ftHaxXtbHUc8JaDpPO2rUvd+80jbyiMAu+h5AAxsn4ZBY40xTNofHxCAM5k2j2WvRQ
 cC3Ou33/+Rj0kvnfmI0ui7XmksigSjfVSCtR2KrQSC23R6h3nsZZBh93yU148fQF5gJE
 yMEUh751saGN/oKTBIPxUI2p8OEbtfBcsTu4bA0kFgqcYaNplW7jbAWEkMX/K2EHVz58
 36PxekO6zlqiXyortKUUKMd42wVm/URv+UcaYGB4b5+A4edro1cP/ZsHGMaWeYlLzIIL
 RlXdCBuGXhrSpC29uKfo5yGi5+9g0n+0BrH/Kz1SYsKhaTGPY9GcoZ19q7uVJKBs8G1C
 KlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=87DN7/fLWnnFI6PlbYzhjd20dcBpIPR3jsC8NVnfyfk=;
 b=MCth+cilYT9yZt3SowR9ZgC4vwrSGd/TuXHpqthIJsnH5v+vKW/+MQs0UGgFZcOLSY
 8ey6fDtRU/Q5HOj1vwk5yK2XIDtWGKmp1Hkd85TN+0ncCA5dErVuPtJujmbCINcLwgwC
 kwWziKkoz+5GPOBRwRd6zQQ+vrdIYxLmBch3VuR05/8dqLIgdo44BVQ+CXCio8y/q4Qh
 CIFV4kHsVHKPOvmNWfvuaOFVFQTFNQ54ICoVFm1PWJW5oYojZ04+IYx8drKul+Dl2aUQ
 LSGAC5+7mMhh5fYq0uZRUhYdF7SHYu/mKE/2E6cKyw4iagRJVcnfTRd8wJvJ5QEOPFpZ
 eTsQ==
X-Gm-Message-State: APjAAAXqHc9r1Z5ZHSAyCGZndnEqJu7yf2JhnZT8X3PcHk3Kf0GMKMIz
 iRiD2tO6xsrVlm/8FGgaoSs=
X-Google-Smtp-Source: APXvYqz1U28cXNN/v/2HdcFf/wvVAKmwiYPH7nNTdDRvz5nL8q3WfZEfEiGmGeBXpyIQpW8qDaKdFg==
X-Received: by 2002:a37:708:: with SMTP id 8mr6967497qkh.406.1581514981905;
 Wed, 12 Feb 2020 05:43:01 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
 by smtp.gmail.com with ESMTPSA id a24sm181802qkl.82.2020.02.12.05.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 05:42:58 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: a.hajda@samsung.com
Subject: [PATCH] drm/bridge: adv7511: Replace hardcoded number
Date: Wed, 12 Feb 2020 10:42:55 -0300
Message-Id: <20200212134255.544-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: dri-devel@lists.freedesktop.org, narmstrong@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hardcoded '12' means the number of elements in the
adv7511_csc_ycbcr_to_rgb[] array, so use the ARRAY_SIZE() macro
to let the code less error prone.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9e13e466e72c..568c6d52cdda 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -132,6 +132,13 @@ static const struct regmap_config adv7511_regmap_config = {
  * Hardware configuration
  */
 
+/* Coefficients for adv7511 color space conversion */
+static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
+	0x0734, 0x04ad, 0x0000, 0x1c1b,
+	0x1ddc, 0x04ad, 0x1f24, 0x0135,
+	0x0000, 0x04ad, 0x087c, 0x1b77,
+};
+
 static void adv7511_set_colormap(struct adv7511 *adv7511, bool enable,
 				 const uint16_t *coeff,
 				 unsigned int scaling_factor)
@@ -142,7 +149,7 @@ static void adv7511_set_colormap(struct adv7511 *adv7511, bool enable,
 			   ADV7511_CSC_UPDATE_MODE, ADV7511_CSC_UPDATE_MODE);
 
 	if (enable) {
-		for (i = 0; i < 12; ++i) {
+		for (i = 0; i < ARRAY_SIZE(adv7511_csc_ycbcr_to_rgb); ++i) {
 			regmap_update_bits(adv7511->regmap,
 					   ADV7511_REG_CSC_UPPER(i),
 					   0x1f, coeff[i] >> 8);
@@ -193,13 +200,6 @@ static int adv7511_packet_disable(struct adv7511 *adv7511, unsigned int packet)
 	return 0;
 }
 
-/* Coefficients for adv7511 color space conversion */
-static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
-	0x0734, 0x04ad, 0x0000, 0x1c1b,
-	0x1ddc, 0x04ad, 0x1f24, 0x0135,
-	0x0000, 0x04ad, 0x087c, 0x1b77,
-};
-
 static void adv7511_set_config_csc(struct adv7511 *adv7511,
 				   struct drm_connector *connector,
 				   bool rgb, bool hdmi_mode)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
