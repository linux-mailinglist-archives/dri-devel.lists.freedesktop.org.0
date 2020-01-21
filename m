Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F59144D4F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6146F3EB;
	Wed, 22 Jan 2020 08:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D471F6EBE7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:38:43 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00L8bjhT015309; Tue, 21 Jan 2020 03:38:23 -0500
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com with ESMTP id 2xkyta6tbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 03:38:22 -0500
Received: from SCSQMBX10.ad.analog.com (scsqmbx10.ad.analog.com [10.77.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 00L8cKQ0049903
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
 verify=FAIL); Tue, 21 Jan 2020 03:38:21 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 21 Jan
 2020 00:38:19 -0800
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 21 Jan 2020 03:38:18 -0500
Received: from btogorean-pc.ad.analog.com ([10.48.65.146])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 00L8Sm9a001010;
 Tue, 21 Jan 2020 03:38:14 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 1/3] drm: bridge: adv7511: Remove DRM_I2C_ADV7533 Kconfig
Date: Tue, 21 Jan 2020 10:27:20 +0200
Message-ID: <20200121082719.27972-2-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200121082719.27972-1-bogdan.togorean@analog.com>
References: <20200121082719.27972-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_02:2020-01-20,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=1
 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210073
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:09 +0000
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, wsa+renesas@sang-engineering.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, alexander.deucher@amd.com,
 tglx@linutronix.de, sam@ravnborg.org, matt.redfearn@thinci.com,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit remove DRM_I2C_ADV7533 resulting a simpler driver and less
choices in Kconfig.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
---
 drivers/gpu/drm/bridge/adv7511/Kconfig       | 11 +-----
 drivers/gpu/drm/bridge/adv7511/Makefile      |  3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 39 --------------------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  4 --
 4 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/Kconfig b/drivers/gpu/drm/bridge/adv7511/Kconfig
index 8a56ff81f4fb..a7fe07117345 100644
--- a/drivers/gpu/drm/bridge/adv7511/Kconfig
+++ b/drivers/gpu/drm/bridge/adv7511/Kconfig
@@ -4,8 +4,9 @@ config DRM_I2C_ADV7511
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
+	select DRM_MIPI_DSI
 	help
-	  Support for the Analog Device ADV7511(W) and ADV7513 HDMI encoders.
+	  Support for the Analog Device ADV7511(W)/13/33 HDMI encoders.
 
 config DRM_I2C_ADV7511_AUDIO
 	bool "ADV7511 HDMI Audio driver"
@@ -15,14 +16,6 @@ config DRM_I2C_ADV7511_AUDIO
 	  Support the ADV7511 HDMI Audio interface. This is used in
 	  conjunction with the AV7511  HDMI driver.
 
-config DRM_I2C_ADV7533
-	bool "ADV7533 encoder"
-	depends on DRM_I2C_ADV7511
-	select DRM_MIPI_DSI
-	default y
-	help
-	  Support for the Analog Devices ADV7533 DSI to HDMI encoder.
-
 config DRM_I2C_ADV7511_CEC
 	bool "ADV7511/33 HDMI CEC driver"
 	depends on DRM_I2C_ADV7511
diff --git a/drivers/gpu/drm/bridge/adv7511/Makefile b/drivers/gpu/drm/bridge/adv7511/Makefile
index b46ebeb35fd4..d8ceb534b51f 100644
--- a/drivers/gpu/drm/bridge/adv7511/Makefile
+++ b/drivers/gpu/drm/bridge/adv7511/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-adv7511-y := adv7511_drv.o
+adv7511-y := adv7511_drv.o adv7533.o
 adv7511-$(CONFIG_DRM_I2C_ADV7511_AUDIO) += adv7511_audio.o
 adv7511-$(CONFIG_DRM_I2C_ADV7511_CEC) += adv7511_cec.o
-adv7511-$(CONFIG_DRM_I2C_ADV7533) += adv7533.o
 obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511.o
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 52b2adfdc877..12552d54931b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -393,7 +393,6 @@ static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 }
 #endif
 
-#ifdef CONFIG_DRM_I2C_ADV7533
 void adv7533_dsi_power_on(struct adv7511 *adv);
 void adv7533_dsi_power_off(struct adv7511 *adv);
 void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
@@ -402,44 +401,6 @@ int adv7533_patch_cec_registers(struct adv7511 *adv);
 int adv7533_attach_dsi(struct adv7511 *adv);
 void adv7533_detach_dsi(struct adv7511 *adv);
 int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
-#else
-static inline void adv7533_dsi_power_on(struct adv7511 *adv)
-{
-}
-
-static inline void adv7533_dsi_power_off(struct adv7511 *adv)
-{
-}
-
-static inline void adv7533_mode_set(struct adv7511 *adv,
-				    const struct drm_display_mode *mode)
-{
-}
-
-static inline int adv7533_patch_registers(struct adv7511 *adv)
-{
-	return -ENODEV;
-}
-
-static inline int adv7533_patch_cec_registers(struct adv7511 *adv)
-{
-	return -ENODEV;
-}
-
-static inline int adv7533_attach_dsi(struct adv7511 *adv)
-{
-	return -ENODEV;
-}
-
-static inline void adv7533_detach_dsi(struct adv7511 *adv)
-{
-}
-
-static inline int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
-{
-	return -ENODEV;
-}
-#endif
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9e13e466e72c..34df29d79e2b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1266,9 +1266,7 @@ static const struct i2c_device_id adv7511_i2c_ids[] = {
 	{ "adv7511", ADV7511 },
 	{ "adv7511w", ADV7511 },
 	{ "adv7513", ADV7511 },
-#ifdef CONFIG_DRM_I2C_ADV7533
 	{ "adv7533", ADV7533 },
-#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7511_i2c_ids);
@@ -1277,9 +1275,7 @@ static const struct of_device_id adv7511_of_ids[] = {
 	{ .compatible = "adi,adv7511", .data = (void *)ADV7511 },
 	{ .compatible = "adi,adv7511w", .data = (void *)ADV7511 },
 	{ .compatible = "adi,adv7513", .data = (void *)ADV7511 },
-#ifdef CONFIG_DRM_I2C_ADV7533
 	{ .compatible = "adi,adv7533", .data = (void *)ADV7533 },
-#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adv7511_of_ids);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
