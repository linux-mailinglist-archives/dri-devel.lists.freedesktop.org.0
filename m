Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73381269F23
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE976E843;
	Tue, 15 Sep 2020 07:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82BD6E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 12:49:08 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08ECiSBg023262; Mon, 14 Sep 2020 05:48:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=N8JMFGqFMKNXZsHa3hkDiZukJz+JpMaumuBzMP+aKsI=;
 b=oiyU0iVfrBxtOTpgUdz7qAbbzTrfvM9IUfgI+TjOpwOxUOCHKvQWQma6sQoduyFt9sWs
 tZTHRzg/TWyJwOPJNNvLm9hc+tpdarp6CsiK4ALZ2d9g+MVXmQ/Ggt5jILG2SjhVvuzy
 53y3wtSTJO3aoReMyeos0l+qPAAD8Z2DkalivclzKSkxaUilLlKFpsBBtiA2DaFpapOO
 OzLwQ9rFEZdmHnHdUIoeKXa8Jh8fEqP4ErF2KyI8FN5Emf6HWSBFV0pfcbnbUXQieHEp
 q8TPrGbASerJ2yvNvgo80+o7vNwOZGsxxKzSKrt8oB5G3WmPy4exEk3Y9Q+UfeFwMMz5 +w== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2053.outbound.protection.outlook.com [104.47.36.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 33gswy5vw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 05:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNoYKESxEJHA0rvwATzXEp5fsoS334oghSOBOWHDIizRGeaLRAxeS53fKcpU06PulTjwXvTrpzJDDdhHOGEkeUZBu17uc9PJ+Ny4mHfiRE8QtnwT4iOHjAaGtaSRE7Ax2dBNsyrMl+0n9I6V1ouUprV8j74CnOxdY1SwCJcCnHP6CFN1q72ofKdbZSIOK/u586k49l3eQ7nmcx5lSlaMOi30cGixr8/2RJDIQMUUK+oziHaRd1PezpgKEcSEhZ8aIUrUQ0LkDATzTq7CBg+Y4oS8BWTw+36yCGeYa7pIA1IRQZjvqhGe4WrchxcPlbpfYjDGAXyadEpXbZf8deinAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8JMFGqFMKNXZsHa3hkDiZukJz+JpMaumuBzMP+aKsI=;
 b=Gv9Sk0oMAo4xOPcCexw5Uj+riPP7mrwmWz/q10UId8K3sryHweWFlfP5UZ38X4r1tXhAkMaKFJ+0DuxiBeimAsq5FiIfu2KM2osU9ReQ85DWTpEqTNtb3QJCBM7STWEwP63Fn7PJzouQxSnPAgy3Bq8y0qd1NPe/ng217E9SQ4TRv4wtzwATPBeQN+55d6cEyVH3ay7XV7+qxb5VUHIooLO/I+HCG8ZkMzy8jIxjo6u6mbvHw1RY7zOphU3bXnjDfTqjBDf/7pZKxpkdbgnYZ6OG/olD6kdLH4Y8B4S8BlFix2rCNRd/BwuXXMtdrD/mL99jD6r23ZdIrw3OQtpXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.147) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8JMFGqFMKNXZsHa3hkDiZukJz+JpMaumuBzMP+aKsI=;
 b=cBaOI2Jdv+JDc24sJth14FGZ4RD8SKmMN8kutcPpnNN+64SjOoNg6+y3wR5N7CKYtU/xZn94117GU2zzBNruovpewmwLhRYYtXCFCNlal7KsOe+UhSIjP4w5b5+m1h4aLOhWTrGs75t9VZv+KZ5tZWBnigS6SipMe0JfepW8iXE=
Received: from BN8PR16CA0022.namprd16.prod.outlook.com (2603:10b6:408:4c::35)
 by CY4PR0701MB3764.namprd07.prod.outlook.com (2603:10b6:910:8c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Mon, 14 Sep
 2020 12:48:48 +0000
Received: from BN8NAM12FT036.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::80) by BN8PR16CA0022.outlook.office365.com
 (2603:10b6:408:4c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 12:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 158.140.1.147)
 smtp.mailfrom=cadence.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.147 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.147; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.147) by
 BN8NAM12FT036.mail.protection.outlook.com (10.13.182.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Mon, 14 Sep 2020 12:48:47 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 08ECmd4l017910
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 14 Sep 2020 05:48:48 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 14 Sep 2020 14:48:38 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 14 Sep 2020 14:48:38 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 08ECmb5t015779;
 Mon, 14 Sep 2020 14:48:37 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 08ECmb3P015778;
 Mon, 14 Sep 2020 14:48:37 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 3/3] drm: bridge: cdns-mhdp8546: Add TI J721E wrapper
Date: Mon, 14 Sep 2020 14:48:35 +0200
Message-ID: <1600087715-15729-4-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1600087715-15729-1-git-send-email-sjakhade@cadence.com>
References: <1600087715-15729-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 861aae21-ea73-4163-fafd-08d858ac8625
X-MS-TrafficTypeDiagnostic: CY4PR0701MB3764:
X-Microsoft-Antispam-PRVS: <CY4PR0701MB3764C391EAA3E12A03997B8AC5230@CY4PR0701MB3764.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MQy7ZBI/jvFlO/GJwCY7/3To2l/q4BFTxkO30D0pfcoi8cuBLeo21e91wFE/qbqdNirgCcdshlh5LfyjQTU3nl9zmYsDmS+/krCGi01VgmzWNbZbEfd8BTBYLvR7PZUEYrVfHf9FNYVIOwOvU4Db+HRiQ21zTUrZYlK0oerePqnpwttlQ/G6dxjF4KsEvtJYtQI+e6cq7XPGFW5IxIEYWgnFxmCje3KpOPs6Il+rgQcxjuJeTv5+QsNh/V+RJ6N5uZ4gT8gkyDa2Z9yH7G9bHPQGqjwf70getdAdaOt2I1YyNUpyYnc/A1odNVufiX+w3uyZPUNQSAWayUoGmdJSO0UFZ4s0h4Wfyk6snDJMJPZHzUL+Zcjy4WIKjL+nXg2P+5wJLHQptRT7/w/C0yF9kqyehS19yedVK9VPEC8nQ7rcgZ2u6Yt5xkpmca3X68kIe0eLvi1UqoswRgEAsIvJWRS3jhuD+wLBcR1PIKd6o7bRl09GybN6jT2oJw4SgkeDEGMIkav8hBwq8t/WgVj8x/eKCoYt5ZWU6pPAudtsvvXpapnPqShSTafQ+a4pVG/S
X-Forefront-Antispam-Report: CIP:158.140.1.147; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sjmaillnx1.cadence.com; PTR:unknown.Cadence.COM; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(36092001)(46966005)(83380400001)(966005)(54906003)(186003)(336012)(7416002)(478600001)(36906005)(110136005)(356005)(7636003)(86362001)(2906002)(5660300002)(70206006)(36756003)(82740400003)(316002)(82310400003)(8936002)(42186006)(47076004)(4326008)(426003)(70586007)(8676002)(26005)(2616005)(921003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 12:48:47.9751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 861aae21-ea73-4163-fafd-08d858ac8625
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.147];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT036.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0701MB3764
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_03:2020-09-14,
 2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009140103
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
 jsarha@ti.com, tomi.valkeinen@ti.com, sjakhade@cadence.com, nikhil.nd@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add J721E wrapper for mhdp, which sets up the clock and data muxes.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/Kconfig        | 13 ++++
 drivers/gpu/drm/bridge/cadence/Makefile       |  1 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 10 +++
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
 .../drm/bridge/cadence/cdns-mhdp8546-j721e.c  | 78 +++++++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-j721e.h  | 19 +++++
 6 files changed, 122 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index f49d77eb7814..511d67b16d14 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -9,3 +9,16 @@ config DRM_CDNS_MHDP8546
 	  bridge and is meant to be directly embedded in a SoC.
 	  It takes a DPI stream as input and outputs it encoded
 	  in DP format.
+
+if DRM_CDNS_MHDP8546
+
+config DRM_CDNS_MHDP8546_J721E
+	depends on ARCH_K3_J721E_SOC || COMPILE_TEST
+	bool "J721E Cadence DPI/DP wrapper support"
+	default y
+	help
+	  Support J721E Cadence DPI/DP wrapper. This is a wrapper
+	  which adds support for J721E related platform ops. It
+	  initializes the J721E Display Port and sets up the
+	  clock and data muxes.
+endif
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index 676739cdf5e6..8f647991b374 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
 cdns-mhdp8546-y := cdns-mhdp8546-core.o
+cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 7b1bd5d10923..621ebdbff8a3 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -50,6 +50,8 @@
 
 #include "cdns-mhdp8546-core.h"
 
+#include "cdns-mhdp8546-j721e.h"
+
 static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
 {
 	int ret, empty;
@@ -2496,6 +2498,14 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 
 static const struct of_device_id mhdp_ids[] = {
 	{ .compatible = "cdns,mhdp8546", },
+#ifdef CONFIG_DRM_CDNS_MHDP8546_J721E
+	{ .compatible = "ti,j721e-mhdp8546",
+	  .data = &(const struct cdns_mhdp_platform_info) {
+		  .timings = &mhdp_ti_j721e_bridge_timings,
+		  .ops = &mhdp_ti_j721e_ops,
+	  },
+	},
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mhdp_ids);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index c0fff78d15be..5897a85e3159 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -341,6 +341,7 @@ struct cdns_mhdp_platform_info {
 
 struct cdns_mhdp_device {
 	void __iomem *regs;
+	void __iomem *j721e_regs;
 
 	struct device *dev;
 	struct clk *clk;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
new file mode 100644
index 000000000000..dfe1b59514f7
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI j721e Cadence MHDP8546 DP wrapper
+ *
+ * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com>
+ */
+
+#include <linux/io.h>
+#include <linux/platform_device.h>
+
+#include "cdns-mhdp8546-j721e.h"
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
+	return PTR_ERR_OR_ZERO(mhdp->j721e_regs);
+}
+
+static void cdns_mhdp_j721e_enable(struct cdns_mhdp_device *mhdp)
+{
+	/*
+	 * Enable VIF_0 and select DPI2 as its input. DSS0 DPI0 is connected
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
+
+const struct drm_bridge_timings mhdp_ti_j721e_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			   DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
+			   DRM_BUS_FLAG_DE_HIGH,
+};
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
new file mode 100644
index 000000000000..97d20d115a24
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TI j721e Cadence MHDP8546 DP wrapper
+ *
+ * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+ * Author: Jyri Sarha <jsarha@ti.com>
+ */
+
+#ifndef CDNS_MHDP8546_J721E_H
+#define CDNS_MHDP8546_J721E_H
+
+#include "cdns-mhdp8546-core.h"
+
+struct mhdp_platform_ops;
+
+extern const struct mhdp_platform_ops mhdp_ti_j721e_ops;
+extern const struct drm_bridge_timings mhdp_ti_j721e_bridge_timings;
+
+#endif /* !CDNS_MHDP8546_J721E_H */
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
