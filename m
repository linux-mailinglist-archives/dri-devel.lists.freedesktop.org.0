Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15BE249C22
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8825D6E252;
	Wed, 19 Aug 2020 11:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF346E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2120214F1;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=O4vgNwTHiXZS7BW6/Yll/k5o8U1mTh8w04hTRoj11Gc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eDL3E2nDEAeo4qo4yLkxmGZyWDf//57rJI44KuYGZ1N7FbeelvAAINu0jG0VE4Bqn
 thndG0aLa+okPvdbGCCorhre2sBNKpqQGnPGHCdFEIM+/Obkpn8xpMYawiT3pBKHs3
 Ep6U3sFAJDOAkfguVjobKjV+63PiuWdZhU9zaI0A=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00EuaM-NY; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 10/49] staging: hikey9xx/gpu: add debug prints for this driver
Date: Wed, 19 Aug 2020 13:45:38 +0200
Message-Id: <71e74aa8ff84a2f0b879c46a63d5f51f6d808348.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, devel@driverdev.osuosl.org,
 Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linuxarm@huawei.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mauro.chehab@huawei.com,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, linux-kernel@vger.kernel.org,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiubin Zhang <zhangxiubin1@huawei.com>

Add some debug prints on adv7535 and kirin_drm_drv.

Signed-off-by: Xiubin Zhang <zhangxiubin1@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/hdmi/adv7535.c  | 40 ++++++++++++++++++--
 drivers/staging/hikey9xx/gpu/kirin_drm_drv.c |  2 +-
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
index a21a8f8b917e..04c1e7b9ca8e 100644
--- a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
+++ b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
@@ -28,7 +28,8 @@
 
 #include "adv7535.h"
 
-#define HPD_ENABLE	1
+//#define HPD_ENABLE	1
+#define HPD_ENABLE	0
 //#define TEST_COLORBAR_DISPLAY
 #ifdef CONFIG_HDMI_ADV7511_AUDIO
 extern int adv7511_audio_init(struct device *dev);
@@ -785,19 +786,25 @@ adv7511_detect(struct adv7511 *adv7511,
 {
 	enum drm_connector_status status;
 	unsigned int val;
+	unsigned int time = 0;
 #if HPD_ENABLE
 	bool hpd;
 #endif
 	int ret;
 
 	ret = regmap_read(adv7511->regmap, ADV7511_REG_STATUS, &val);
-	if (ret < 0)
+	if (ret < 0) {
+		DRM_ERROR("regmap_read fail, ret = %d \n", ret);
 		return connector_status_disconnected;
+	}
 
-	if (val & ADV7511_STATUS_HPD)
+	if (val & ADV7511_STATUS_HPD) {
+		DRM_INFO("connected : regmap_read val = 0x%x \n", val);
 		status = connector_status_connected;
-	else
+	} else {
+		DRM_INFO("disconnected : regmap_read val = 0x%x \n", val);
 		status = connector_status_disconnected;
+	}
 
 #if HPD_ENABLE
 	hpd = adv7511_hpd(adv7511);
@@ -820,7 +827,32 @@ adv7511_detect(struct adv7511 *adv7511,
 	}
 #endif
 
+	if (status == connector_status_disconnected) {
+		do {
+			ret = regmap_read(adv7511->regmap, ADV7511_REG_STATUS, &val);
+			if (ret < 0) {
+				DRM_ERROR("regmap_read fail, ret = %d \n", ret);
+				return connector_status_disconnected;
+			}
+
+			if (val & ADV7511_STATUS_HPD) {
+				DRM_INFO("connected : regmap_read val = 0x%x \n", val);
+				status = connector_status_connected;
+			} else {
+				DRM_INFO("disconnected : regmap_read val = 0x%x \n", val);
+				status = connector_status_disconnected;
+			}
+			time ++;
+			mdelay(20);
+		} while (status == connector_status_disconnected && time < 10);
+	}
+
+	if (time >= 10)
+		DRM_ERROR("Read connector status timout, time = %d \n", time);
+
 	adv7511->status = status;
+
+	DRM_INFO("hdmi connector status = %d \n", status);
 	return status;
 }
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
index 958aafa1a09c..ec1f668f2d21 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
@@ -144,7 +144,7 @@ static int kirin_drm_kms_init(struct drm_device *dev)
 	/* init kms poll for handling hpd */
 	drm_kms_helper_poll_init(dev);
 
-#if 0
+#if 1
 	/* force detection after connectors init */
 	(void)drm_helper_hpd_irq_event(dev);
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
