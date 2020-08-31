Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52634257642
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457E889E15;
	Mon, 31 Aug 2020 09:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBFF89CE2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 08:24:04 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07V8AS0b024321; Mon, 31 Aug 2020 01:23:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=GPGeAANQaCpwgent/Iab8glO30A5qLloXj7Rt2yOPcQ=;
 b=duFfV+BJnP5R7uw+G3RBrc979DEIt2Kb/yp6KoDc2CqB2PTDTURhY2ZQhATVFJAWsjPn
 UqPrD7gyVQ/T6+pHvLvoqT/5Q5DkRwvnUIUNOXws6rTRWlhES4eWq2/XSILfZgVMnWDl
 nCWrxgrDGLD7UmsaYdASTBDFaxqaiuPQAYRPq+6ca02o8aIezkP4UD/00yYbF82vN4pZ
 kZ5SKRvrAEhp87GBGg8MqhP38qRrWOlmDbr2qXB1JH/GxBE5ObC0masqkP47+OYlmxfI
 2FkL7k4RD5zfxP+ULDY/U7wG0ONPkQMI6+d3L8m6qsc6t4BRuSBsBFCMnLwliwNtrucd QA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by mx0b-0014ca01.pphosted.com with ESMTP id 337jkw6839-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 01:23:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmfSmNmnKOBmahlh0hW/y1WfcJ1XJuw6RwEjE69u3K1cXkKJhZ+buUt7xZZ7/7xL/QF4dI4lb+LA5tdHTCPvX4L12kh+qs154B8I3G4Uai/pASoKevUHEvGzvFycg8p3kGdR6BIequDvQXs0DhIyU1Z4RkoQmxm91jpUjlI6Uw6srt6HlxRwQzXcEZQ3taVGg6uKitDo1J/XsAQryMSPFCctGlN6cdiHS8v3CpJ7w5KJqPX8Wv17U7ChcP9W7XDDD5MlUAUC4klrAGLmP1++uD9eixvnRkXW20h5AWlPP5eEQsyAwDiaThJCcUcWWSdzKnGKCEp4q195372Tayzdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPGeAANQaCpwgent/Iab8glO30A5qLloXj7Rt2yOPcQ=;
 b=HAnMcF6W0K0UMvLMWy8os5XWJFVSTjxv1ORfuMwQ2V7/hRSdqDywmTI7dHbroSQW9z+s4gvsnw1DW8mPmRHpYLXqU4gAksg0Ij2bwYUFsf86HO+bf1+delwxqDmBQ6hJeJqewb1uopiOI6eihF35gMXdkriUoOqgForRdSJZV2LXxdUSOajXwTtf7wPaszT4/1KcJzCYaucUkqKAoPb7lDxuDat6rh+3y06VEqNKU9oCIbJEdQhIYW8WS8+W2/8t88YUJ6p98ZOiPam67HlPYTWKsfS0y//McMJGjIuMl+jv1XtWddnqtYkJ8lS5U/ArFot0xAUQTXbM7yIfV3ANOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPGeAANQaCpwgent/Iab8glO30A5qLloXj7Rt2yOPcQ=;
 b=iHefTAYi9Z79DarjdAmRd1EQO5DpdVU0zmBERVuRgAxTVnPVPA/YhTkk8LtsAY2f5gaHzYlgnCZm+yEM6AfMgJUeNzFEINXnOzLf7+zJ7kEVlLSLT0V4I+3aNIRBgqFBGtEBUlE/8HIKuE5wBMZtsdi6J496TG2kM4kevmGcCEM=
Received: from BN4PR12CA0002.namprd12.prod.outlook.com (2603:10b6:403:2::12)
 by CY1PR07MB2571.namprd07.prod.outlook.com (2a01:111:e400:c60e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 08:23:51 +0000
Received: from BN8NAM12FT041.eop-nam12.prod.protection.outlook.com
 (2603:10b6:403:2:cafe::db) by BN4PR12CA0002.outlook.office365.com
 (2603:10b6:403:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Mon, 31 Aug 2020 08:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 199.43.4.23)
 smtp.mailfrom=cadence.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 BN8NAM12FT041.mail.protection.outlook.com (10.13.182.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.7 via Frontend Transport; Mon, 31 Aug 2020 08:23:50 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 07V8NeKU010126
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 31 Aug 2020 04:23:48 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Mon, 31 Aug 2020 10:23:40 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 31 Aug 2020 10:23:40 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 07V8NeTe010300;
 Mon, 31 Aug 2020 10:23:40 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 07V8NeYg010299;
 Mon, 31 Aug 2020 10:23:40 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 3/3] drm: bridge: cdns-mhdp8546: Add TI J721E wrapper
Date: Mon, 31 Aug 2020 10:23:35 +0200
Message-ID: <1598862215-10222-4-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
References: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aa151f7-f30e-4ccb-f8d2-08d84d873065
X-MS-TrafficTypeDiagnostic: CY1PR07MB2571:
X-Microsoft-Antispam-PRVS: <CY1PR07MB2571E757488F66704E7CB52EC5510@CY1PR07MB2571.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUYqUZgi7JhMfnEoVmT/E0U1vqJDaWvB8ZNoQnywSQjwBjiJI1ZPcUwQafX5bqLibaeBkkkHWnCRsCpy1tzDY3KLyAPUndNBYRcamwStd3PSXy0FiW5vn3jF0qCtiWXEkf1AKK7qML0/d2jjQF2Hq2PuWe/0qMs7s7lARpfBVLN9EPWtvKU7+C9pqibFWVfZFZ5XdmveuEZ6MA4vs6MivgbrbpXO5O9rVH7oK/8FZ8hcxb3aQjBtS2FObYTwvCUBQ+edr2/IyTYJMJo6pAgIVdBZ7ocrXcke7Iu/y1wC/vt2AJdAmcMpa3ygDpPJwL91hYZMNCHH444D13yE1M+gL2Iri2+VoEiV0A8AEV9SBlXlSnWMZ7xfkLbylLp2Lisy4CC1GWvPrjhyq/Hcp5nrZlgqPObgoFaZLxSMQhvOtWAScFB7yHYCfFENKaupnvJA4RadA8g+uEjJzpwPWU1SU9KjwXjGznO2+KD1uZ9lJPW+LesvoAm9I3gTlwAqwAL5DZQK9i9QzsfSKQQI31PSYacuVML5YUC4r8FRDeppwhpPdZJUJsxh8z8m/gS/Hv/X
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(36092001)(46966005)(2616005)(426003)(5660300002)(82740400003)(356005)(4326008)(82310400002)(47076004)(110136005)(966005)(83380400001)(81166007)(54906003)(42186006)(316002)(2906002)(6666004)(186003)(336012)(86362001)(36756003)(478600001)(26005)(8676002)(8936002)(7416002)(70586007)(70206006)(921003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 08:23:50.0518 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa151f7-f30e-4ccb-f8d2-08d84d873065
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT041.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2571
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_01:2020-08-28,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008310050
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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
index 14be6f370d6e..5dc83b2e3603 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -50,6 +50,8 @@
 
 #include "cdns-mhdp8546-core.h"
 
+#include "cdns-mhdp8546-j721e.h"
+
 static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
 {
 	int ret, empty;
@@ -2522,6 +2524,14 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 
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
index 14ba7431fab8..d2183f3f3263 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -344,6 +344,7 @@ struct cdns_mhdp_platform_info {
 
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
