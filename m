Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F39D15A335
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3216E9E3;
	Wed, 12 Feb 2020 08:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E776E5D2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 04:27:17 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01C4PmNB028913; Tue, 11 Feb 2020 20:27:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=o4AdgmXqUqX6lriSNaVhaoth4svMU2IeO+EV7vL06z8=;
 b=aRu47TJFPWhEsx3KZCk/4TbMTlxKnJyGFkT7RX7kfZ+FDYZLgEIiP0VV7lyzEfSBkZ2n
 OluCMML77LfyezT9A39rEiC5S1+MIOyMPqoFLAg41r9UAv4bcXeY4JRp8Ei7j0Lz8WXQ
 SP2Mggw/bSD4Ep3cNVJO8V6eSk/+Vkobq0kDgkiYQnxGVaw0sd3ZAQd7N9qK8+vlWKsY
 SJXJ5JVNgfGZ/bwOIwEqg3jKhXc7yCU3RmONFBwBEaw93FTfzduTo7EdjrkYH78UAV3y
 f48snZKMrTmvoxwUEyNwDiyxmEsRgi7P4E1Gz0lgcmmdM33za3TE7NXbUuwi6IQ//cc+ XQ== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2y1u17mxnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 20:27:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOMZXEcq6XLgT5VE/sny3vK6yHB3R7rc0LVJ1K0M+vz8ZwkMLwJccOZaHitMHZ8X2At76xwACRMRKLslA2OTvZHwQJMl9A+5GJFf71uUX2bYJTNEG+9DrClvhGyy0vSjjVhJoZtF+oNdSGtKrESyg6gbawbGU0JlyWa2NhtW0zrRaJgB1J+PRes0YW7jd55PHMJScwmGK2BT4O9GF4XtFo2aA9IUzoEjCTN49+IWMvhgQnonVIkNJk6AgyAoxutx0kNOubd2V9d6uTWvZKGaeJ5g5kQr98fZUFGeCGp2mCWzFJtI6ijdiROz/3pDbDFriHQQQZr4Q83dXOLdN6Mh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4AdgmXqUqX6lriSNaVhaoth4svMU2IeO+EV7vL06z8=;
 b=ksLeRGOiYuyJhuIx5/gKNwuNrQ8qV4SFHwXuV3eem7NJYaiTaiuOYIO3u17ZxZeaZBIOfoo18JYyRGmZLGxL4kFyn1lgjCK2EYKkliRFCLeCayQaiWB57RR2qptl1tuhH16/0p9d1Z6nDiZSxb6c5l3HJH/Efn+rWlF0DmudidnHkaDqLt/ttEGlIwyn8mUbwT4LaF6HsvD8VyfQF8FZ4bkp+Nz/ZlxyfjIzrWkvtkX9LtbEugb8oej9j+ZY3YRcD9Jl3WDCibhdvwn07vRJWAc0v7y/PFpBxCUQ8qiZFWsZf9IztwK5dqtZZ4oEr+vQUX4zZ5m7EkBRTcwdeRZjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4AdgmXqUqX6lriSNaVhaoth4svMU2IeO+EV7vL06z8=;
 b=48UOBtrR97rDvOlB2i6uiuCTrBsH5uNPx7rnPq0ULXxJrSnb8LVdUoAAqzhqiYnDOkXCyZ7tSaLRF+DbazmkWsThw1KEg1CmhEbAg2cGiR9DtBDTjxw2snNTbJT8VF4EXovvcX25VxiiipW+8+/W1S3mkB6OSc+Nu3wHYMSRSbM=
Received: from CH2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:610:20::26)
 by BYAPR07MB4583.namprd07.prod.outlook.com (2603:10b6:a02:f8::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.24; Wed, 12 Feb
 2020 04:27:04 +0000
Received: from MW2NAM12FT009.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::209) by CH2PR07CA0013.outlook.office365.com
 (2603:10b6:610:20::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Wed, 12 Feb 2020 04:27:03 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 MW2NAM12FT009.mail.protection.outlook.com (10.13.180.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.10 via Frontend Transport; Wed, 12 Feb 2020 04:27:03 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 01C4Qnkd007965
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 11 Feb 2020 23:27:01 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 12 Feb 2020 05:26:49 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 05:26:49 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 01C4QnYO024562;
 Wed, 12 Feb 2020 05:26:49 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 01C4QnED024561;
 Wed, 12 Feb 2020 05:26:49 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v5 3/3] drm: bridge: cdns-mhdp: add j721e wrapper
Date: Wed, 12 Feb 2020 05:26:44 +0100
Message-ID: <1581481604-24499-4-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1581481604-24499-1-git-send-email-yamonkar@cadence.com>
References: <1581481604-24499-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(36092001)(199004)(189003)(26826003)(36756003)(186003)(110136005)(5660300002)(42186006)(54906003)(316002)(478600001)(966005)(26005)(107886003)(336012)(426003)(2616005)(86362001)(6666004)(356004)(8936002)(70206006)(2906002)(4326008)(81156014)(70586007)(8676002)(81166006)(7416002)(2004002)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4583; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e434d2f5-9e50-4f41-c37f-08d7af73cf6b
X-MS-TrafficTypeDiagnostic: BYAPR07MB4583:
X-Microsoft-Antispam-PRVS: <BYAPR07MB45835BDB5F43E2C998769D03D21B0@BYAPR07MB4583.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 0311124FA9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIeVj3zwTKhSxgn7d78z3vFZiWY9qjQDQXkTC6ZIB26YbWUNOb9VN8X7LJdmCXrK9/hobcr0BuRrPJ0Ve2b6/NCpj3oROu0MSncywH4kg7KCtTnmP6nY+Iw9M7C+H6awVVuBkIHM2rI/lAWvN8H0idnKkka4qNyNrbegK5a3DV14Bl5P74jpw67dtnhBUc8J6c11H1MJq4yas/i1UATKFn1mHYX0elkQloIur9+RzzPzv2hau2Wo/ZgCk+pYsropzTtXjnrHyKGwTsmArvbTQgRR4xS6DjbciWDs9CL0zpaEBI3NzwWHr9oU/+wECqZMWntum60oVlJ+BMlk+cxedEZzAYLrqnZPe2Rp2ULbOEFtXWPS77bdL+D5QLgje1PnLFCkHd6NpnXymFBPgZxMcHcpt646Jyti+s8gymeuk8WLaRZZbyiHBr1uda2Cseckzmwjz5+omE98FIQYvXk33b9ynBQmE01Dr6Zl7u/cnW3qxncajT9PFihz6fqp6tDGyHxLuQCY/FMgFrmxOpSR+xfBq+AfYJNaHDhnKIIRzJNfWkr7tvrNo+pwqDL3EyiNziC8AcJ52/REXcGM3z5nzXw9fWaRgx/fWs2uxz0qq7EgFW3fk2FzRJ5LH5SjNPy0uYpdbKqEJf6cWOkUac7sZrdSY64gJKQfuPXdkEs8JM8=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 04:27:03.0741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e434d2f5-9e50-4f41-c37f-08d7af73cf6b
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4583
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_07:2020-02-11,
 2020-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002120031
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add j721e wrapper for mhdp, which sets up the clock and data muxes.

Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/gpu/drm/bridge/Kconfig           | 12 ++++
 drivers/gpu/drm/bridge/Makefile          |  3 +
 drivers/gpu/drm/bridge/cdns-mhdp-core.c  | 14 +++++
 drivers/gpu/drm/bridge/cdns-mhdp-core.h  |  1 +
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c | 79 ++++++++++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h | 55 +++++++++++++++++
 6 files changed, 164 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c66f2ef04f71..32e3bc5edae8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -38,6 +38,18 @@ config DRM_CDNS_MHDP
 	  It takes a DPI stream as input and output it encoded
 	  in DP format.
 
+if DRM_CDNS_MHDP
+
+config DRM_CDNS_MHDP_J721E
+	bool "J721E Cadence DPI/DP wrapper support"
+	default y
+	help
+	  Support J721E Cadence DPI/DP wrapper. This is a wrapper
+	  which adds support for J721E related platform ops. It
+	  initializes the J721e Display Port and sets up the
+	  clock and data muxes.
+endif
+
 config DRM_DUMB_VGA_DAC
 	tristate "Dumb VGA DAC Bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 71019088d257..7e6c64f9021f 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -21,3 +21,6 @@ obj-y += analogix/
 obj-y += synopsys/
 
 cdns-mhdp-objs := cdns-mhdp-core.o
+ifeq ($(CONFIG_DRM_CDNS_MHDP_J721E),y)
+	cdns-mhdp-objs += cdns-mhdp-j721e.o
+endif
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
index 51ed9cdee161..8483b6b1023b 100644
--- a/drivers/gpu/drm/bridge/cdns-mhdp-core.c
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
@@ -36,8 +36,22 @@
 
 #include "cdns-mhdp-core.h"
 
+#include "cdns-mhdp-j721e.h"
+
+#ifdef CONFIG_DRM_CDNS_MHDP_J721E
+static const struct mhdp_platform_ops mhdp_ti_j721e_ops = {
+	.init = cdns_mhdp_j721e_init,
+	.exit = cdns_mhdp_j721e_fini,
+	.enable = cdns_mhdp_j721e_enable,
+	.disable = cdns_mhdp_j721e_disable,
+};
+#endif
+
 static const struct of_device_id mhdp_ids[] = {
 	{ .compatible = "cdns,mhdp8546", },
+#ifdef CONFIG_DRM_CDNS_MHDP_J721E
+	{ .compatible = "ti,j721e-mhdp8546", .data = &mhdp_ti_j721e_ops },
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mhdp_ids);
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.h b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
index 2f3b67987832..67a99eab5db3 100644
--- a/drivers/gpu/drm/bridge/cdns-mhdp-core.h
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
@@ -335,6 +335,7 @@ struct mhdp_platform_ops {
 
 struct cdns_mhdp_device {
 	void __iomem *regs;
+	void __iomem *j721e_regs;
 
 	struct device *dev;
 	struct clk *clk;
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
new file mode 100644
index 000000000000..a87faf55c065
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI j721e Cadence MHDP DP wrapper
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+
+#include "cdns-mhdp-j721e.h"
+
+#define	REVISION			0x00
+#define	DPTX_IPCFG			0x04
+#define	ECC_MEM_CFG			0x08
+#define	DPTX_DSC_CFG			0x0c
+#define	DPTX_SRC_CFG			0x10
+#define	DPTX_VIF_SECURE_MODE_CFG	0x14
+#define	DPTX_VIF_CONN_STATUS		0x18
+#define	PHY_CLK_STATUS			0x1c
+
+#define DPTX_SRC_AIF_EN			BIT(16)
+#define DPTX_SRC_VIF_3_IN30B		BIT(11)
+#define DPTX_SRC_VIF_2_IN30B		BIT(10)
+#define DPTX_SRC_VIF_1_IN30B		BIT(9)
+#define DPTX_SRC_VIF_0_IN30B		BIT(8)
+#define DPTX_SRC_VIF_3_SEL_DPI5		BIT(7)
+#define DPTX_SRC_VIF_3_SEL_DPI3		0
+#define DPTX_SRC_VIF_2_SEL_DPI4		BIT(6)
+#define DPTX_SRC_VIF_2_SEL_DPI2		0
+#define DPTX_SRC_VIF_1_SEL_DPI3		BIT(5)
+#define DPTX_SRC_VIF_1_SEL_DPI1		0
+#define DPTX_SRC_VIF_0_SEL_DPI2		BIT(4)
+#define DPTX_SRC_VIF_0_SEL_DPI0		0
+#define DPTX_SRC_VIF_3_EN		BIT(3)
+#define DPTX_SRC_VIF_2_EN		BIT(2)
+#define DPTX_SRC_VIF_1_EN		BIT(1)
+#define DPTX_SRC_VIF_0_EN		BIT(0)
+
+/* TODO turn DPTX_IPCFG fw_mem_clk_en at pm_runtime_suspend. */
+
+int cdns_mhdp_j721e_init(struct cdns_mhdp_device *mhdp)
+{
+	struct platform_device *pdev = to_platform_device(mhdp->dev);
+	struct resource *regs;
+
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	mhdp->j721e_regs = devm_ioremap_resource(&pdev->dev, regs);
+	if (IS_ERR(mhdp->j721e_regs))
+		return PTR_ERR(mhdp->j721e_regs);
+
+	return 0;
+}
+
+void cdns_mhdp_j721e_fini(struct cdns_mhdp_device *mhdp)
+{
+}
+
+void cdns_mhdp_j721e_enable(struct cdns_mhdp_device *mhdp)
+{
+	/*
+	 * Eneble VIF_0 and select DPI2 as its input. DSS0 DPI0 is connected
+	 * to eDP DPI2. This is the only supported SST configuration on
+	 * J721E.
+	 */
+	writel(DPTX_SRC_VIF_0_EN | DPTX_SRC_VIF_0_SEL_DPI2,
+	       mhdp->j721e_regs + DPTX_SRC_CFG);
+}
+
+void cdns_mhdp_j721e_disable(struct cdns_mhdp_device *mhdp)
+{
+	/* Put everything to defaults  */
+	writel(0, mhdp->j721e_regs + DPTX_DSC_CFG);
+}
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
new file mode 100644
index 000000000000..de0e4e82b58c
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TI j721e Cadence MHDP DP wrapper
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef CDNS_MHDP_J721E_H
+#define CDNS_MHDP_J721E_H
+
+#include <linux/platform_device.h>
+#include "cdns-mhdp-core.h"
+
+struct cdns_mhdp_j721e_wrap;
+
+#ifdef CONFIG_DRM_CDNS_MHDP_J721E
+
+int cdns_mhdp_j721e_init(struct cdns_mhdp_device *mhdp);
+
+void cdns_mhdp_j721e_fini(struct cdns_mhdp_device *mhdp);
+
+void cdns_mhdp_j721e_enable(struct cdns_mhdp_device *mhdp);
+
+void cdns_mhdp_j721e_disable(struct cdns_mhdp_device *mhdp);
+
+#else
+
+static inline
+int cdns_mhdp_j721e_init(struct cdns_mhdp_device *mhdp)
+{
+	return 0;
+}
+
+static inline
+void cdns_mhdp_j721e_fini(struct cdns_mhdp_device *mhdp)
+{
+}
+
+static inline
+void cdns_mhdp_j721e_sst_enable(struct cdns_mhdp_device *mhdp);
+{
+}
+
+static inline
+void cdns_mhdp_j721e_sst_disable(struct cdns_mhdp_device *mhdp)
+{
+}
+#endif /* CONFIG_DRM_CDNS_MHDP_J721E */
+
+#endif /* !CDNS_MHDP_J721E_H */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
