Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC66322A93A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D45892E3;
	Thu, 23 Jul 2020 07:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B51A89B46
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 08:23:34 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M7ZEwp011440; Wed, 22 Jul 2020 00:41:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=i28qBZxwAQjsMhsg8QTCOJ71aa0KUJ/fbmdKMAy5QQk=;
 b=gYeSr4rm1AmpBnEXRzS26j2WSdxhC71IvF2kXrIiPKtGUHmTrNPNve9wlwN32xiAQ3qS
 ROgjpsf5bECuXQvoDezD4jYDoxTta/zshIRlmPSbSvZmwvdgfj2jH8b3Aj4Ka3wxjdco
 iBlqZ3MVQibPltGmhdRseOAz2AcEcHSENDRBU8Cs8W0WAHJidUoMy41YUUIcA6t0ZSvT
 AO1o01o65zx7zj2qIoXELpLfsqCPvJGcsbPuGlAfzkb28aY2RQg1wlkPMfr8Bam1dd1H
 ILRkXYKIEEXGH3Sr/ScEuhFx4W/ypwjOaN0TKFI2oReVr5D2ZdAGWGZR0YAxhKWtKYvj NA== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 32bvnxcnff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 00:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq5Fu03u++eDtdT3Bn1oNtLdpnLwc76LJauiG4mmvJZ6TTi+YDML2EiV0J5otvJmy6cLYIvqupNm1mfMJ7gPdm+9T0SLQYS46FawH9IFG/t5BGAAGS0hI2cYJg6mP6FbePs7LQjULffDgEBqG+9WYCzMIGFBW7fjuhea+kIma0cx9b7Mvt6hO5Xb5FoL2VHRMgmdd3bXI08nwJL6wXmJCWouW5Qn4pieR9IOjZwt+aO+MeMxOou/PDo82Res1r2SGRAYPXaQ3SVEO6FFWaG7lcAfvCl/aJ790rYfzhRRDhm+3iTWGGmtY70lorNDADVoOa8nC6xoDTCBqHSDdP+vZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i28qBZxwAQjsMhsg8QTCOJ71aa0KUJ/fbmdKMAy5QQk=;
 b=K9wOHCpWR3RFt07MEleU6TXrgyW2+bfgfv7zGsTvmq3aS5Gh17fsvilpZ84zGmbCfWNK+joqaQyMPbBheZq4Bk2p6jhscXANrO30VgWEbmc02YD4djPVCLgM4Z7tR8dlpyGrtAQ3wT3if3lv3NlsVu83y1+yGlFHbTGfXHjkq7fTP+7QYV3goHi7Ryy5f/kNGTCtGIfpTnSvzc7dh3J7lo72USjo7kyuUSeUBFJzLnJq2uMvyZKXFu012PSnCfV50EOujUkydv9dTTsahSHha9m9FO2bN3G0/rWIuu3VbcqsDxjJUTxzfun5EVoMBF5UZiRprM+4J3//jrPe3teSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=samsung.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i28qBZxwAQjsMhsg8QTCOJ71aa0KUJ/fbmdKMAy5QQk=;
 b=jfnq8DGqWtoUyiPMmOPqTM/9/yKGTD/DvVOa6HjDsHQHrMCo+xydw0f41oCIFRNLtG+nCNEsk3PIb2PO0QZTDmwxAd87/4bC476d4v+JtHeiXOsZx9nptS/UMkMOrsVYlyhcVM66daiI6ZCnjXJVz7DRYKpGY4+kaS7JY7w9Mho=
Received: from BN8PR03CA0009.namprd03.prod.outlook.com (2603:10b6:408:94::22)
 by CO2PR07MB2503.namprd07.prod.outlook.com (2603:10b6:100:1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Wed, 22 Jul
 2020 07:40:57 +0000
Received: from BN8NAM12FT040.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::ad) by BN8PR03CA0009.outlook.office365.com
 (2603:10b6:408:94::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Wed, 22 Jul 2020 07:40:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 BN8NAM12FT040.mail.protection.outlook.com (10.13.182.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.9 via Frontend Transport; Wed, 22 Jul 2020 07:40:54 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 06M7ehn4188912
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 00:40:53 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 22 Jul 2020 09:40:44 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jul 2020 09:40:44 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 06M7ehf4012885;
 Wed, 22 Jul 2020 09:40:43 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 06M7ehT4012884;
 Wed, 22 Jul 2020 09:40:43 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 3/3] drm: bridge: cdns-mhdp: Add j721e wrapper
Date: Wed, 22 Jul 2020 09:40:40 +0200
Message-ID: <1595403640-12816-4-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1595403640-12816-1-git-send-email-sjakhade@cadence.com>
References: <1595403640-12816-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(36092001)(46966005)(81166007)(54906003)(110136005)(2906002)(36756003)(426003)(83380400001)(82310400002)(966005)(356005)(336012)(47076004)(4326008)(82740400003)(478600001)(8676002)(8936002)(36906005)(316002)(42186006)(2616005)(5660300002)(70206006)(70586007)(26005)(86362001)(7416002)(186003)(921003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 402cfacc-bc37-4124-2ad9-08d82e129102
X-MS-TrafficTypeDiagnostic: CO2PR07MB2503:
X-Microsoft-Antispam-PRVS: <CO2PR07MB2503D00D65433B0DB123DC09C5790@CO2PR07MB2503.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UxMpX0rRhW43JMgBbj8l2FhLZQW920C0lP+d8FeXtuhpC5MMuiPEolhRfK5ex1Fbp0fgoeuEDZ/ADu5fi7ycusB7sb+JaodAzt3tuoSJDE5wJm0BgCj8e9danalN39iXQO9/qrG89eKT8tZlETESxHRmME3sVZ7y49C2c/escF15NB7bkO7Xdw7jyjIox98lKP3i80JR9vvh0TjIBWwGvQHHLfu3bsn99X0h7vrxOwLNQmKpzLEjuu3Y21nPK5HjEcSaR4hbU2LZvjunH3dXHqyUC6J7jBmQXgWT+I1b6dRhN3AKiJVghTBrGSIlJSB/3oFizaHYo7c+bjWI/qDQG/2H6CT9pzWuDK7aFHei2Q0P5InTZqEwfdG0etSlPAiy0+8hP4unFKdpwYrVqfYP45Wdbc/G4iol/cUNhhJ9WjaBSpRwfoIkprkziE5XpNdVQg3wfY1tjTIu/VHvG1kJf17QN13y7jsPuxG4b9rfqmm76elC7AKvb6bQiEiHS1KDGwtMVmUHoBn36bNq6O6BrnDi5kYUgkMXzMwcZ4kYEeq+YfEgNGZNb6jX0vNUbB+/
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 07:40:54.8463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 402cfacc-bc37-4124-2ad9-08d82e129102
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT040.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR07MB2503
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_03:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007220057
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:14 +0000
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
Cc: mparab@cadence.com, yamonkar@cadence.com, praneeth@ti.com, nsekhar@ti.com,
 jsarha@ti.com, tomi.valkeinen@ti.com, sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add j721e wrapper for mhdp, which sets up the clock and data muxes.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/Kconfig           | 13 ++++
 drivers/gpu/drm/bridge/Makefile          |  5 ++
 drivers/gpu/drm/bridge/cdns-mhdp-core.c  | 15 +++++
 drivers/gpu/drm/bridge/cdns-mhdp-core.h  |  1 +
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c | 75 ++++++++++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h | 19 ++++++
 6 files changed, 128 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 6a4c324302a8..8c1738653b7e 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -38,6 +38,19 @@ config DRM_CDNS_MHDP
 	  It takes a DPI stream as input and outputs it encoded
 	  in DP format.
 
+if DRM_CDNS_MHDP
+
+config DRM_CDNS_MHDP_J721E
+	depends on ARCH_K3_J721E_SOC
+	bool "J721E Cadence DPI/DP wrapper support"
+	default y
+	help
+	  Support J721E Cadence DPI/DP wrapper. This is a wrapper
+	  which adds support for J721E related platform ops. It
+	  initializes the J721e Display Port and sets up the
+	  clock and data muxes.
+endif
+
 config DRM_CHRONTEL_CH7033
 	tristate "Chrontel CH7033 Video Encoder"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 0080a9f80f29..f81d606e9598 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -2,6 +2,11 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 obj-$(CONFIG_DRM_CDNS_MHDP) += cdns-mhdp.o
 cdns-mhdp-objs := cdns-mhdp-core.o
+
+ifeq ($(CONFIG_DRM_CDNS_MHDP_J721E),y)
+	cdns-mhdp-objs += cdns-mhdp-j721e.o
+endif
+
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
index b16c5503cef1..eeb33c54334f 100644
--- a/drivers/gpu/drm/bridge/cdns-mhdp-core.c
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
@@ -38,6 +38,8 @@
 
 #include "cdns-mhdp-core.h"
 
+#include "cdns-mhdp-j721e.h"
+
 static DECLARE_WAIT_QUEUE_HEAD(fw_load_wq);
 
 static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
@@ -1691,6 +1693,16 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
 
 	conn->display_info.bus_flags = DRM_BUS_FLAG_DE_HIGH;
 
+	if (of_device_is_compatible(mhdp->dev->of_node, "ti,j721e-mhdp8546"))
+	/*
+	 * DP is internal to J7 SoC and we need to use DRIVE_POSEDGE
+	 * in the display controller. This is achieved for the time being
+	 * by defining SAMPLE_NEGEDGE here.
+	 */
+		conn->display_info.bus_flags |=
+					DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+					DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE;
+
 	ret = drm_connector_attach_encoder(conn, bridge->encoder);
 	if (ret) {
 		dev_err(mhdp->dev, "failed to attach connector to encoder\n");
@@ -2470,6 +2482,9 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 
 static const struct of_device_id mhdp_ids[] = {
 	{ .compatible = "cdns,mhdp8546", },
+#ifdef CONFIG_DRM_CDNS_MHDP_J721E
+	{ .compatible = "ti,j721e-mhdp8546", .data = &mhdp_ti_j721e_ops },
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mhdp_ids);
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.h b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
index d1bfcdef4249..4e176698caca 100644
--- a/drivers/gpu/drm/bridge/cdns-mhdp-core.h
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
@@ -343,6 +343,7 @@ struct cdns_mhdp_bridge_state {
 
 struct cdns_mhdp_device {
 	void __iomem *regs;
+	void __iomem *j721e_regs;
 
 	struct device *dev;
 	struct clk *clk;
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
new file mode 100644
index 000000000000..7555c217c9a0
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI j721e Cadence MHDP DP wrapper
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com
+ */
+
+#include <linux/io.h>
+#include <linux/platform_device.h>
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
+static int cdns_mhdp_j721e_init(struct cdns_mhdp_device *mhdp)
+{
+	struct platform_device *pdev = to_platform_device(mhdp->dev);
+
+	mhdp->j721e_regs = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(mhdp->j721e_regs))
+		return PTR_ERR(mhdp->j721e_regs);
+
+	return 0;
+}
+
+static void cdns_mhdp_j721e_enable(struct cdns_mhdp_device *mhdp)
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
+static void cdns_mhdp_j721e_disable(struct cdns_mhdp_device *mhdp)
+{
+	/* Put everything to defaults  */
+	writel(0, mhdp->j721e_regs + DPTX_DSC_CFG);
+}
+
+const struct mhdp_platform_ops mhdp_ti_j721e_ops = {
+	.init = cdns_mhdp_j721e_init,
+	.enable = cdns_mhdp_j721e_enable,
+	.disable = cdns_mhdp_j721e_disable,
+};
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
new file mode 100644
index 000000000000..f1ff07b82d32
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TI j721e Cadence MHDP DP wrapper
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com
+ */
+
+#ifndef CDNS_MHDP_J721E_H
+#define CDNS_MHDP_J721E_H
+
+#include <linux/platform_device.h>
+#include "cdns-mhdp-core.h"
+
+struct mhdp_platform_ops;
+
+extern const struct mhdp_platform_ops mhdp_ti_j721e_ops;
+
+#endif /* !CDNS_MHDP_J721E_H */
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
