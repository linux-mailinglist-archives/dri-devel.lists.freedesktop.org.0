Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE045197D23
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 15:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B141C6E2E8;
	Mon, 30 Mar 2020 13:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122986E2E8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 13:40:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UDSjd2004381; Mon, 30 Mar 2020 15:40:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=05Cp8FHkCUAY1uBXkh3rN+fUJ2vNWzHm6qdMX+Azm+8=;
 b=Y88gBSDr5K8hhZANqaYvDTtojUfVlgBBXc5IyuwCP4B4YeCVaOERix6AX09FKDLfYmGf
 +7cbnbh+dbZxc8q9q6IfHqBEx3pjS0BstS0EQUsfOpoPG2gwQydfAKWZMCvK8aF+Nse7
 kdF7VFtvSfZ9FcXzJMYSMCdLV7hzDD17L7WBRFhKVAenBNq1p6PWVvT2K52XpcAQYafC
 a/hE2nKc9BgVs/uW7soyEtGl71/H6A6GkTud8EysfPJsGCpIA47pgGx7wfX2y6t1eQj8
 eT4hBW2WTjWC553Qg48Xj7PmhxigaAuobJ2cuVedWdzmxXv9FkD39zwnjrLUTCV6ow/f 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbm9p1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 15:40:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 35F8D10002A;
 Mon, 30 Mar 2020 15:40:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 053992BC7AC;
 Mon, 30 Mar 2020 15:40:13 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 30 Mar
 2020 15:40:12 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 30 Mar 2020 15:40:12 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 TORGUE" <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/stm: ltdc: check number of endpoints
Thread-Topic: [PATCH] drm/stm: ltdc: check number of endpoints
Thread-Index: AQHV7g4ofITfVj+w50Wq5yte7qHdC6hhVL8Q
Date: Mon, 30 Mar 2020 13:40:12 +0000
Message-ID: <6a14216d33374f6d8d8a5653cad683e9@SFHDAG6NODE3.st.com>
References: <1582877258-1112-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1582877258-1112-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Yannick,
Thank you for your patch,
Acked-by: Philippe Cornu <philippe.cornu@st.com>
(sorry for the email format)
Philippe :-)

-----Original Message-----
From: Yannick FERTRE <yannick.fertre@st.com> 
Sent: Friday, February 28, 2020 09:08
To: Yannick FERTRE <yannick.fertre@st.com>; Philippe CORNU <philippe.cornu@st.com>; Benjamin GAIGNARD <benjamin.gaignard@st.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Maxime Coquelin <mcoquelin.stm32@gmail.com>; Alexandre TORGUE <alexandre.torgue@st.com>; dri-devel@lists.freedesktop.org; linux-stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
Subject: [PATCH] drm/stm: ltdc: check number of endpoints

Number of endpoints could exceed the fix value MAX_ENDPOINTS(2).
Instead of increase simply this value, the number of endpoint could be read from device tree. Load sequence has been a little rework to take care of several panel or bridge which can be connected/disconnected or enable/disable.

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 102 +++++++++++++++++++++++----------------------
 1 file changed, 52 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c index df585fe..f894968 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -42,8 +42,6 @@

 #define MAX_IRQ 4

-#define MAX_ENDPOINTS 2
-
 #define HWVER_10200 0x010200
 #define HWVER_10300 0x010300
 #define HWVER_20101 0x020101
@@ -1201,36 +1199,20 @@ int ltdc_load(struct drm_device *ddev)
 	struct ltdc_device *ldev = ddev->dev_private;
 	struct device *dev = ddev->dev;
 	struct device_node *np = dev->of_node;
-	struct drm_bridge *bridge[MAX_ENDPOINTS] = {NULL};
-	struct drm_panel *panel[MAX_ENDPOINTS] = {NULL};
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	struct drm_crtc *crtc;
 	struct reset_control *rstc;
 	struct resource *res;
-	int irq, ret, i, endpoint_not_ready = -ENODEV;
+	int irq, i, nb_endpoints;
+	int ret = -ENODEV;

 	DRM_DEBUG_DRIVER("\n");

-	/* Get endpoints if any */
-	for (i = 0; i < MAX_ENDPOINTS; i++) {
-		ret = drm_of_find_panel_or_bridge(np, 0, i, &panel[i],
-						  &bridge[i]);
-
-		/*
-		 * If at least one endpoint is -EPROBE_DEFER, defer probing,
-		 * else if at least one endpoint is ready, continue probing.
-		 */
-		if (ret == -EPROBE_DEFER)
-			return ret;
-		else if (!ret)
-			endpoint_not_ready = 0;
-	}
-
-	if (endpoint_not_ready)
-		return endpoint_not_ready;
-
-	rstc = devm_reset_control_get_exclusive(dev, NULL);
-
-	mutex_init(&ldev->err_lock);
+	/* Get number of endpoints */
+	nb_endpoints = of_graph_get_endpoint_count(np);
+	if (!nb_endpoints)
+		return -ENODEV;

 	ldev->pixel_clk = devm_clk_get(dev, "lcd");
 	if (IS_ERR(ldev->pixel_clk)) {
@@ -1244,6 +1226,43 @@ int ltdc_load(struct drm_device *ddev)
 		return -ENODEV;
 	}

+	/* Get endpoints if any */
+	for (i = 0; i < nb_endpoints; i++) {
+		ret = drm_of_find_panel_or_bridge(np, 0, i, &panel, &bridge);
+
+		/*
+		 * If at least one endpoint is -ENODEV, continue probing,
+		 * else if at least one endpoint returned an error
+		 * (ie -EPROBE_DEFER) then stop probing.
+		 */
+		if (ret == -ENODEV)
+			continue;
+		else if (ret)
+			goto err;
+
+		if (panel) {
+			bridge = drm_panel_bridge_add_typed(panel,
+							    DRM_MODE_CONNECTOR_DPI);
+			if (IS_ERR(bridge)) {
+				DRM_ERROR("panel-bridge endpoint %d\n", i);
+				ret = PTR_ERR(bridge);
+				goto err;
+			}
+		}
+
+		if (bridge) {
+			ret = ltdc_encoder_init(ddev, bridge);
+			if (ret) {
+				DRM_ERROR("init encoder endpoint %d\n", i);
+				goto err;
+			}
+		}
+	}
+
+	rstc = devm_reset_control_get_exclusive(dev, NULL);
+
+	mutex_init(&ldev->err_lock);
+
 	if (!IS_ERR(rstc)) {
 		reset_control_assert(rstc);
 		usleep_range(10, 20);
@@ -1285,27 +1304,7 @@ int ltdc_load(struct drm_device *ddev)
 			DRM_ERROR("Failed to register LTDC interrupt\n");
 			goto err;
 		}
-	}

-	/* Add endpoints panels or bridges if any */
-	for (i = 0; i < MAX_ENDPOINTS; i++) {
-		if (panel[i]) {
-			bridge[i] = drm_panel_bridge_add_typed(panel[i],
-							       DRM_MODE_CONNECTOR_DPI);
-			if (IS_ERR(bridge[i])) {
-				DRM_ERROR("panel-bridge endpoint %d\n", i);
-				ret = PTR_ERR(bridge[i]);
-				goto err;
-			}
-		}
-
-		if (bridge[i]) {
-			ret = ltdc_encoder_init(ddev, bridge[i]);
-			if (ret) {
-				DRM_ERROR("init encoder endpoint %d\n", i);
-				goto err;
-			}
-		}
 	}

 	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL); @@ -1340,8 +1339,8 @@ int ltdc_load(struct drm_device *ddev)

 	return 0;
 err:
-	for (i = 0; i < MAX_ENDPOINTS; i++)
-		drm_panel_bridge_remove(bridge[i]);
+	for (i = 0; i < nb_endpoints; i++)
+		drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);

 	clk_disable_unprepare(ldev->pixel_clk);

@@ -1350,11 +1349,14 @@ int ltdc_load(struct drm_device *ddev)

 void ltdc_unload(struct drm_device *ddev)  {
-	int i;
+	struct device *dev = ddev->dev;
+	int nb_endpoints, i;

 	DRM_DEBUG_DRIVER("\n");

-	for (i = 0; i < MAX_ENDPOINTS; i++)
+	nb_endpoints = of_graph_get_endpoint_count(dev->of_node);
+
+	for (i = 0; i < nb_endpoints; i++)
 		drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);

 	pm_runtime_disable(ddev->dev);
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
