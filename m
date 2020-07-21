Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7B227CCB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 12:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360C36E575;
	Tue, 21 Jul 2020 10:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30047.outbound.protection.outlook.com [40.107.3.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260DF6E566
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 10:20:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heeqLk0lumC29d7mqSJwHfPZRNtC7sSxXFGE3j4dRPwG6zpZXY3dZabcPip/88oa+QaywZYmRv3Crngk5fatWuu5StFeJbbTNvymzs0ddZQH97WPGSBcaIu2zbOU0Na0ajjtR0GVUnxZUqATiTMmVzcHbhPyOyMkaPKJrFf3jZqZtRiGjTBGJD56C40Z0JT8rDr61ur8bqIALXajSktOKk8l3S0OK3q8wQSuMoBWJKGLh1HFPvm5U9aA5uicO8Dn6ZeP3UxqV94FBdkycx+MLGLKx2N3pK1eo5Anqg/yanz1KMd3gVEd4sTkJJVaEBitLtWXHGufEJ+cnSVGBPw4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2uXRfjlTeWpExV8Sgs+LYmbLtalszmro9CG33eQzI4=;
 b=EDNNIC8DMfOz/vn/d3fT3vjHwBi8WnU5HGYUVq1gYNehbi2kGHvBbVSiIWxbCqzfKhJSC73DwpeoQz4DJGB3BQ0lcyXDk2P9LZ9+DiDgX/59/7qUMmuTi1CT8xnJdVuHryM1caI8t6gzSQUscextewdds6iR7fdrVQBegfgZqcHuwKiDqICWLS7FCV+t7b6Wn1l5xzpKeu3Zcpt7HmhzLkU4OqqpHqMr+OgZjnWnchu96pNDygDUKkJBr0C/FKtfFjqA5PqaWDbd41cSz2zb8TwW5d1CD+cU9r563ArOZjY2xXSFVJINQIagBo+lQaljLqXPQGK3+9pLQ/vX8arWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2uXRfjlTeWpExV8Sgs+LYmbLtalszmro9CG33eQzI4=;
 b=iiRs7122SS+vN2Dt8a4u09SxEWtIEu5ZWIN65y7VCVCERb6GGMLEunGDw4TDAHQuspEZodasSM3QMjHUMMyFvybnYGna6vB4B1nOCOx9xrKSxEPumjQyi1xzpTMejigmCevUvUjSgBEBNqvm6/BcubQYpbsLD3j4GxEvppD4jsE=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR0402MB2735.eurprd04.prod.outlook.com
 (2603:10a6:800:b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 21 Jul
 2020 10:20:41 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 10:20:41 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v7 3/5] drm/imx/dcss: use drm_bridge_connector API
Date: Tue, 21 Jul 2020 13:20:02 +0300
Message-Id: <20200721102007.18368-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721102007.18368-1-laurentiu.palcu@oss.nxp.com>
References: <20200721102007.18368-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:207:8::24) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0138.eurprd07.prod.outlook.com (2603:10a6:207:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.15 via Frontend Transport; Tue, 21 Jul 2020 10:20:39 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b68a325-6f91-437a-8823-08d82d5fb842
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2735:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB273540696F702B8C13E5A22ABE780@VI1PR0402MB2735.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qviEy/fgdNRK1qRgW47sJzdsRRC/ct5z/69hHzMiJd3W5XPDZ+JM34DS+02nkzzq9zpnbgeVMqlFJr4ekslxMQH8fewdoiYyOdBeTjadvKUwk0xiTXIWSAE86DLZSShV+IWIBWQwLLnyk0lUiSR+o/WzxjI7QkgQFKplpsaTEQbhHOfIUHAgQxxZZPRrWzguRxjVlelj3zPhtMqI69P0z2sFLLXj0umeuUylK9WwUAzp013sioB/FthdHsFTgq1iEq4k1wSdErrmB8vSVJ+WEd5NwLerjc8y/2MiSuNxLdVkLdt45yHfKGJUFaBXOQwpJ43vPUFnnjfT6Gzz4i+0rQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(26005)(4326008)(66476007)(66946007)(66556008)(6512007)(2906002)(5660300002)(478600001)(1076003)(8936002)(7416002)(6506007)(110136005)(8676002)(52116002)(54906003)(316002)(956004)(6666004)(86362001)(44832011)(2616005)(16526019)(6486002)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: DNdRKIJCRbKCoI2Pri8zygkOQu0ERYxZgjT3EWku4RTPGrQyAKSJ02KnsgbhGje2KAtRcOkN43Obvp7fr09VMtxjPWZHh6xtuC/tzkpfge9Uw9fU2mXhxLEFaFhO3HOe/aSS+dEsFuftfSLlJgwmJ/rBNOM2442QfmLN/UdavoClewGYjLzISbybhqzx1OUrSh/scNf1SLBYlXgDqecAk+4qVVqIZIabrBoFiheEKrfmbo4kY0qghbkEtGH9z63kzIDqWoKKVlCyVJ8qaVg4XYESga7K7GCZ4xFRjSv261wgK7hHf4mTMKjLMAEs6Ldd+ORNsjTBCWrZ1VsQ/09tZtCREAJkFWWzjuIYOsdcUecuPGI6uT2mEQjGxTapv5wgfIaRDY1GRKI2rM2+fpx79i1r20ZhiiZCHMrGSq0pqCkF7/vzKe5AVh/d3TGJQ0qeJbu4ivuvR2+TMBCoaJ8nWZFUHO5UiU32HoZH+b+ubO0=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b68a325-6f91-437a-8823-08d82d5fb842
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 10:20:41.1824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MR4XzBMXsAxMpis7sfMrTHoSTxV6rtj8QKa71/CINaI2gDlKmDsmXgAcJIO6DMx91TAot8xpWCGCzbenPhpxmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2735
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 laurentiu.palcu@oss.nxp.com, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Make use of drm_bridge_connector API to have the connector initialized by the
display controller.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 17 +++++++++++++---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 31 ++++++++++++++++++++++++-----
 drivers/gpu/drm/imx/dcss/dcss-kms.h |  1 +
 3 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 83a4840435cf..c849533ca83e 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -8,9 +8,12 @@
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_device.h>
 #include <drm/drm_modeset_helper.h>
 
 #include "dcss-dev.h"
+#include "dcss-kms.h"
 
 static void dcss_clocks_enable(struct dcss_dev *dcss)
 {
@@ -247,9 +250,13 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
 int dcss_dev_suspend(struct device *dev)
 {
 	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
+	struct drm_device *ddev = dcss_drv_dev_to_drm(dev);
+	struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
 	int ret;
 
-	drm_mode_config_helper_suspend(dcss_drv_dev_to_drm(dev));
+	drm_bridge_connector_disable_hpd(kms->connector);
+
+	drm_mode_config_helper_suspend(ddev);
 
 	if (pm_runtime_suspended(dev))
 		return 0;
@@ -266,9 +273,11 @@ int dcss_dev_suspend(struct device *dev)
 int dcss_dev_resume(struct device *dev)
 {
 	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
+	struct drm_device *ddev = dcss_drv_dev_to_drm(dev);
+	struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
 
 	if (pm_runtime_suspended(dev)) {
-		drm_mode_config_helper_resume(dcss_drv_dev_to_drm(dev));
+		drm_mode_config_helper_resume(ddev);
 		return 0;
 	}
 
@@ -278,7 +287,9 @@ int dcss_dev_resume(struct device *dev)
 
 	dcss_ctxld_resume(dcss->ctxld);
 
-	drm_mode_config_helper_resume(dcss_drv_dev_to_drm(dev));
+	drm_mode_config_helper_resume(ddev);
+
+	drm_bridge_connector_enable_hpd(kms->connector);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 3ca49d0a3e61..135a62366ab8 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -74,7 +75,7 @@ static const struct drm_encoder_funcs dcss_kms_simple_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static int dcss_kms_setup_encoder(struct dcss_kms_dev *kms)
+static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
 {
 	struct drm_device *ddev = &kms->base;
 	struct drm_encoder *encoder = &kms->encoder;
@@ -103,7 +104,23 @@ static int dcss_kms_setup_encoder(struct dcss_kms_dev *kms)
 		return ret;
 	}
 
-	return drm_bridge_attach(encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret < 0) {
+		dev_err(ddev->dev, "Unable to attach bridge %pOF\n",
+			bridge->of_node);
+		return ret;
+	}
+
+	kms->connector = drm_bridge_connector_init(ddev, encoder);
+	if (IS_ERR(kms->connector)) {
+		dev_err(ddev->dev, "Unable to create bridge connector.\n");
+		return PTR_ERR(kms->connector);
+	}
+
+	drm_connector_attach_encoder(kms->connector, encoder);
+
+	return 0;
 }
 
 struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
@@ -131,18 +148,20 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 
 	drm->irq_enabled = true;
 
-	ret = dcss_crtc_init(crtc, drm);
+	ret = dcss_kms_bridge_connector_init(kms);
 	if (ret)
 		goto cleanup_mode_config;
 
-	ret = dcss_kms_setup_encoder(kms);
+	ret = dcss_crtc_init(crtc, drm);
 	if (ret)
-		goto cleanup_crtc;
+		goto cleanup_mode_config;
 
 	drm_mode_config_reset(drm);
 
 	drm_kms_helper_poll_init(drm);
 
+	drm_bridge_connector_enable_hpd(kms->connector);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto cleanup_crtc;
@@ -152,6 +171,7 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	return kms;
 
 cleanup_crtc:
+	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	dcss_crtc_deinit(crtc, drm);
 
@@ -167,6 +187,7 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
 	struct drm_device *drm = &kms->base;
 
 	drm_dev_unregister(drm);
+	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm_crtc_vblank_off(&kms->crtc.base);
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.h b/drivers/gpu/drm/imx/dcss/dcss-kms.h
index 1f51c86c6986..dfe5dd99eea3 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.h
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.h
@@ -29,6 +29,7 @@ struct dcss_kms_dev {
 	struct drm_device base;
 	struct dcss_crtc crtc;
 	struct drm_encoder encoder;
+	struct drm_connector *connector;
 };
 
 struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
