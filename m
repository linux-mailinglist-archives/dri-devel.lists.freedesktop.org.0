Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0981B37EA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0376E317;
	Wed, 22 Apr 2020 06:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6CB6E311
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 06:51:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pPWY002122;
 Wed, 22 Apr 2020 01:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587538285;
 bh=upP5WA4qSGdUri1Qc9y0c7ggU/AdA1J+HO5qhLQGGMg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yjKxu2Ct2Lsucn+iO0Cx6dHX4nc5q+q7QH3+CF46UZ0+of0KD4bMz00HKU9HWnx4l
 vBW8g3bDAr1HTrTnfLD6qZmyw5ntC5z/XhLPiGTchc2zO5W8gmbCRLUi0IsCSICJAG
 YCVLCY0Nb2mDq4VcnYKISzjoltBVv5Geu2q5sxmU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03M6pPjY039981
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Apr 2020 01:51:25 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Apr 2020 01:51:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Apr 2020 01:51:24 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pKUX100224;
 Wed, 22 Apr 2020 01:51:23 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Lee Jones <lee.jones@linaro.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: [PATCHv3 1/4] backlight: led_bl: fix cosmetic issues
Date: Wed, 22 Apr 2020 09:51:11 +0300
Message-ID: <20200422065114.22164-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422065114.22164-1-tomi.valkeinen@ti.com>
References: <20200422065114.22164-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix issues reported by checkpatch. No functional changes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/led_bl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 3f66549997c8..d4e1ce684366 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -126,7 +126,7 @@ static int led_bl_get_leds(struct device *dev,
 }
 
 static int led_bl_parse_levels(struct device *dev,
-			   struct led_bl_data *priv)
+			       struct led_bl_data *priv)
 {
 	struct device_node *node = dev->of_node;
 	int num_levels;
@@ -148,8 +148,8 @@ static int led_bl_parse_levels(struct device *dev,
 			return -ENOMEM;
 
 		ret = of_property_read_u32_array(node, "brightness-levels",
-						levels,
-						num_levels);
+						 levels,
+						 num_levels);
 		if (ret < 0)
 			return ret;
 
@@ -159,14 +159,15 @@ static int led_bl_parse_levels(struct device *dev,
 		 */
 		db = priv->default_brightness;
 		for (i = 0 ; i < num_levels; i++) {
-			if ((i && db > levels[i-1]) && db <= levels[i])
+			if ((i && db > levels[i - 1]) && db <= levels[i])
 				break;
 		}
 		priv->default_brightness = i;
 		priv->max_brightness = num_levels - 1;
 		priv->levels = levels;
-	} else if (num_levels >= 0)
+	} else if (num_levels >= 0) {
 		dev_warn(dev, "Not enough levels defined\n");
+	}
 
 	ret = of_property_read_u32(node, "default-brightness-level", &value);
 	if (!ret && value <= priv->max_brightness)
@@ -208,7 +209,8 @@ static int led_bl_probe(struct platform_device *pdev)
 	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
 		      FB_BLANK_UNBLANK;
 	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
-			&pdev->dev, priv, &led_bl_ops, &props);
+						 &pdev->dev, priv, &led_bl_ops,
+						 &props);
 	if (IS_ERR(priv->bl_dev)) {
 		dev_err(&pdev->dev, "Failed to register backlight\n");
 		return PTR_ERR(priv->bl_dev);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
