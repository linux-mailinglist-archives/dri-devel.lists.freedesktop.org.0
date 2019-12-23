Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B62B12A223
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4249F6E32C;
	Tue, 24 Dec 2019 14:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF996E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 15:17:14 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBNFGYKA027175; Mon, 23 Dec 2019 07:17:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=qn7dmXTjdeT4tNDYuk5vGKkhUH0u8qV4tNBQ+Huh+VU=;
 b=hPSFeNQYRbQ5v4X9S5/0hectjHZAk4NErC7+n/s5kAnFM1odIzULy8yM2e3sdlisYW+i
 HXjnWKRXi1fLItoix+3DKumSGr3rabLm2bXKmjw9wP/5WUIkqexm1d8SbuTkYQFYJBTi
 pOvQEOORl+AYsimecCFjcPqJStB1ihZSZVTiDXa42nY+P3c4MnNVsllde/veW9/+/NT8
 Zb7StgvC9BtBXZ3f7vDQOgmcQ6U7QEZB+kF0F68vdrqWpf4L0AzJXfh2IKR9u+8xNteq
 vY8axI+8VxlWCJm5Dq8VODzOshUbcZrq/KVpiwxz9LnQuBD2PTf8WA3wreMrXj6ilDgn Ng== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2x1fv3nknt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2019 07:17:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+453bkbxdub2oy1WAzVj3smz/o+YHItuDGitqUh/VJz+2KCF3/O0cmDxer7QFIXtXW8hfVYG0rotcCaRZ8TkrLq4Kx0GmS/TNp/YkM+rbI1BdKQac28Z7K1S/OrGPtQ/Jf00wK49MMaJCKp8feqSwOdQLdC0uacT8zvSWMnSzoQbG2bq1j/We9QL2Y8oaY2VmxI1V+XyAxcrTTollUqIkP7mUmvhXT50J2keJzUYVzTL+rUVnZRQ5q9JFzWyAa+a9ez25FowFLgqcTJ47vZV4ip7X0gt3kTw5LI+gQebj8sCg5Sx2ydxPiweg/4KXbDZrEk/JCwtx867OR9j/dSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn7dmXTjdeT4tNDYuk5vGKkhUH0u8qV4tNBQ+Huh+VU=;
 b=YtTcNeAOzi2uWlxSurcqZep7vcmd9XZsw35cDS9CCa5VyMWEAp1onZIY0VJSQMM0YgpAmsLV6wRZWKlyHlJMqlf14fZhf/NlMRaWpY/fy+2BZgf78xpITYRrMLGZK8ZA5QYSQQU2E9ujiYldXS5DbGkR1imtaoUoBvmzqAIon3gAqmyxGepSUq9nmbqkPYBcjrP0b4GOfKRW1Wj92MNjJ7+UU8aeTuCpi1ZsTu2dZIiswR205IRLwPfNr/sN+vFZ9dNmKXICidrvzelrCknBUrOAuRGhKczQSB+uBjApP6LvMdtyBeDexwxf6lk08mlJaoR6tFWshRmAY+Ii9154Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn7dmXTjdeT4tNDYuk5vGKkhUH0u8qV4tNBQ+Huh+VU=;
 b=UxC4pXOonDU3v3Y1Y79gF/MsgVoOYhs2eTTSdZ7ijcSl/jFU+0eR5p8UA1X9uD6uEChFldt1nrxJdpw1BEbwRZ0gcsghUdkFiBp8qtqr/dnXvSjYar/VzKidEE1iGRoEwHTPuH8K5UCke67I++DDmiW6lWKijwmvGEypD/f9M+0=
Received: from DM6PR07CA0071.namprd07.prod.outlook.com (2603:10b6:5:74::48) by
 CY4PR07MB3157.namprd07.prod.outlook.com (2603:10b6:903:d1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Mon, 23 Dec 2019 15:16:59 +0000
Received: from DM6NAM12FT044.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::205) by DM6PR07CA0071.outlook.office365.com
 (2603:10b6:5:74::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Mon, 23 Dec 2019 15:16:59 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT044.mail.protection.outlook.com (10.13.178.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16 via Frontend Transport; Mon, 23 Dec 2019 15:16:59 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xBNFGkVR020918
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 23 Dec 2019 10:16:58 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 23 Dec 2019 16:16:47 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 23 Dec 2019 16:16:47 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBNFGlkU016123;
 Mon, 23 Dec 2019 16:16:47 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBNFGkMn016120;
 Mon, 23 Dec 2019 16:16:46 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v2 3/3] drm/mhdp: add j721e wrapper
Date: Mon, 23 Dec 2019 16:16:42 +0100
Message-ID: <1577114202-15970-4-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1577114202-15970-1-git-send-email-yamonkar@cadence.com>
References: <1577114202-15970-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(199004)(189003)(36092001)(54906003)(4326008)(6666004)(42186006)(316002)(86362001)(110136005)(356004)(426003)(336012)(478600001)(26826003)(186003)(5660300002)(26005)(2616005)(70206006)(36756003)(81156014)(107886003)(8936002)(2906002)(70586007)(7416002)(81166006)(76130400001)(8676002)(966005)(2004002)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR07MB3157; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a00e5e7d-79d6-4762-6e0a-08d787bb27e6
X-MS-TrafficTypeDiagnostic: CY4PR07MB3157:
X-Microsoft-Antispam-PRVS: <CY4PR07MB315794BA4B545ED4EF290922D22E0@CY4PR07MB3157.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 0260457E99
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwYyh/TIxi5KAM62hjw4ABB9G6BaUJKcrii7Uf94TmIYd9IjvD2YzQi+EBPDBQ1v7TMbq47sdXVpqDNG3FPPESyjpRSvEGlDboAE+T/T2GMxH7zc5wkpxIAumBA5eZA4Qo84WaRgmNa2Na0fiXOhW9IRKyEn9Js/PrGkYt1SGFC6Xar8317Xd9/dieqMIi+oCHBTci+0mSAErdhv8pRIEd1R2ZejrARVILI0qq3b23Bu08NFJXG1XeX5cOF3eLij4bKY2W7CPcdBMoqhNxnpsMFCswXlGW5QzkaRO725Erz+6qcllgSXl1m4qGy4pe4Rd+uiwlyeZwR4sHZOER7/tdBHEQU/BVJCqjcbMEtgvkkqBa7uxcLsD1qRzGBl0/4QEXYuEy9xWfSrRuKu4AjaRQuqaDEEpJdU5Gq0i8ZRO0vJEh4gRwgHBuUynbwmu1MpRmwpZd9GlATHFcxcWqNSkQ2tADqwthKc3t9E+ND3RFf+QefesUGQGgwPScWqmw40bF6p8utdbBPLb6GehIBClL921/d4XhDxKHTwURbHWkMqkA1wUsWxmBo+6XpPxXw0SEtYemx4Q7vDKqWITUcZj68xUwK24mvAPTeLZCRwuQj5roVZ+oQDF/ze10HyXMxZLGeEaSsoHpRbXLwIDIfuEQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 15:16:59.3531 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a00e5e7d-79d6-4762-6e0a-08d787bb27e6
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB3157
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-23_06:2019-12-23,2019-12-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912230129
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
---
 drivers/gpu/drm/bridge/Kconfig           | 10 ++++
 drivers/gpu/drm/bridge/Makefile          |  3 ++
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c | 79 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h | 55 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp.c       | 14 +++++-
 drivers/gpu/drm/bridge/cdns-mhdp.h       |  1 +
 6 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 616c05f..4b6799b 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -48,6 +48,16 @@ config DRM_CDNS_MHDP
 	  It takes a DPI stream as input and output it encoded
 	  in DP format.
 
+if DRM_CDNS_MHDP
+
+config DRM_CDNS_MHDP_J721E
+	bool "J721E Cadence DPI/DP wrapper support"
+	default y
+	help
+	  Support J721E Cadence DPI/DP wrapper.It sets up
+	  the clock and data muxes.
+endif
+
 config DRM_DUMB_VGA_DAC
 	tristate "Dumb VGA DAC Bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c1a0da7..d358184 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -20,3 +20,6 @@ obj-$(CONFIG_DRM_CDNS_MHDP) += mhdp8546.o
 obj-y += synopsys/
 
 mhdp8546-objs := cdns-mhdp.o
+ifeq ($(CONFIG_DRM_CDNS_MHDP_J721E),y)
+	mhdp8546-objs += cdns-mhdp-j721e.o
+endif
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
new file mode 100644
index 0000000..a87faf5
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
index 0000000..bd53508
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
+#include "cdns-mhdp.h"
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
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp.c b/drivers/gpu/drm/bridge/cdns-mhdp.c
index 543ce80..19e7684 100644
--- a/drivers/gpu/drm/bridge/cdns-mhdp.c
+++ b/drivers/gpu/drm/bridge/cdns-mhdp.c
@@ -35,9 +35,21 @@
 #include <asm/unaligned.h>
 
 #include "cdns-mhdp.h"
-
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
 static const struct of_device_id mhdp_ids[] = {
 	{ .compatible = "cdns,mhdp8546", },
+#ifdef CONFIG_DRM_CDNS_MHDP_J721E
+	{ .compatible = "ti,j721e-mhdp8546", .data = &mhdp_ti_j721e_ops },
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mhdp_ids);
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp.h b/drivers/gpu/drm/bridge/cdns-mhdp.h
index 9acb89d..c9013be 100644
--- a/drivers/gpu/drm/bridge/cdns-mhdp.h
+++ b/drivers/gpu/drm/bridge/cdns-mhdp.h
@@ -335,6 +335,7 @@ struct mhdp_platform_ops {
 
 struct cdns_mhdp_device {
 	void __iomem *regs;
+	void __iomem *j721e_regs;
 
 	struct device *dev;
 	struct clk *clk;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
