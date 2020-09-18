Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F18C270BED
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA32E6E195;
	Sat, 19 Sep 2020 08:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775906ECE9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:09:47 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IC8qUx006988; Fri, 18 Sep 2020 05:09:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=N8JMFGqFMKNXZsHa3hkDiZukJz+JpMaumuBzMP+aKsI=;
 b=ai5J5usUVQb9eNcHiiVUE54i07SuaX6RfNrBlciqyeJCK5xLJ0VHwwtVFAdmhmdFvZd3
 UIH78OJHzquY3jh9HIMsDMopahBTZw4Ce6rDhQUQtR+n0vg9pR0QS/HiDPuMyndTBu3l
 +cnQkc5zgdWKTCkjr0TIdTKIzURYMvpu7QDQ23drDlzmpjS0MlZqbk+zu0usd4k9TiW0
 mlq/Y2N4k1WPELJy1acjOSymiIbwwGnKnKfqSm09NoF+lk1odiblCoHkvscHPBWBezPP
 uvmUzTVCrV1GLwY9BZ61PvWoEoihANlVlYADmig96Z1oqza2p5S8t7fCmSiRsqsDaeAF ig== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by mx0b-0014ca01.pphosted.com with ESMTP id 33k5nk3ym6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 05:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HacMIfnvNeHzRX15SKUEEXu3PiTs4DUf+1jqOL5s5ZeTE3QumYMY700LJvJT7v66pFsJHrJvgwJdWbQ2yeaM4a/ZCoy0FS5fffB94KxG8DLe94KpPbRL0pS7LX0ih+mqabKfXZi+Fk7tHQijWrbNdi/6lqeDKqBCB5/LFjl6WVfkq6ZomxM2Ak2skaHpsWECDxbqzv+LEx9d/ALzeHmsX4Y3VdO9Yhf8A5YWKdbVQwd2mvOcOapzQog+dcDmxTpos37fG51/gHRbBPM73wC/eRo+qQDwtCnF8yRL+cvvUhWYjo4L7iCX2joi/XqiorD9B51ODmObJzjGPSKVOD1KAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8JMFGqFMKNXZsHa3hkDiZukJz+JpMaumuBzMP+aKsI=;
 b=bTzVqTHSF+/cn/SbQhe+/fNug/H7ixSHk8lSuKpVK2rd80DhzGJ+/QQrigF4DWXbcwIS/+cA68uXWF7D7I2M88jFCKn4UB+G0Uf3RB42AL3Xckiv3LG/al+YQfWOVk3Vg2bCxdtR9VZdBvQOPNdB5U9AUSLoxYdqaS8HViEGXlUwPGDqZDZUA2bZIyJKk1mxoC4qi1/+G8ZEwGL8pHM1A3wS4YpENVM0x+NKIvqdeJF8LDvbLNYqSeY3h+mDWYjyvwKqQIGyFPG5LpDW/oSsNYFSHG8oHQPAjb8HYVPuw5sn+wUXQC+I6wwxm+4LwABqFSxlPhxrF4R4AaKPF7S0Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8JMFGqFMKNXZsHa3hkDiZukJz+JpMaumuBzMP+aKsI=;
 b=A3HRHxTwHgZLTcgTl46f/rUc4zhf1weCWG2FTAJ0WOnBblp5eW0569w5DoL2jTUdeGXNKeZ5vnMRAYy/0ih/2haGjWqYYLS/ZLZoJMHdqlll5ifv/EWKbHtzER/u5AlLwwb4redlPA0ckb25bvObBxGr0Ru4csZN/OuDrQLrSsg=
Received: from BN3PR03CA0111.namprd03.prod.outlook.com (2603:10b6:400:4::29)
 by SN6PR07MB4941.namprd07.prod.outlook.com (2603:10b6:805:a7::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 18 Sep
 2020 12:09:34 +0000
Received: from BN8NAM12FT044.eop-nam12.prod.protection.outlook.com
 (2603:10b6:400:4:cafe::30) by BN3PR03CA0111.outlook.office365.com
 (2603:10b6:400:4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Fri, 18 Sep 2020 12:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 BN8NAM12FT044.mail.protection.outlook.com (10.13.183.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.6 via Frontend Transport; Fri, 18 Sep 2020 12:09:32 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 08IC9RGt092496
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 05:09:31 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 18 Sep 2020 14:09:27 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 18 Sep 2020 14:09:27 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 08IC9R2P023804;
 Fri, 18 Sep 2020 14:09:27 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 08IC9Rub023803;
 Fri, 18 Sep 2020 14:09:27 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 3/3] drm: bridge: cdns-mhdp8546: Add TI J721E wrapper
Date: Fri, 18 Sep 2020 14:09:23 +0200
Message-ID: <1600430963-23753-4-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1600430963-23753-1-git-send-email-sjakhade@cadence.com>
References: <1600430963-23753-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 182c6120-b021-4e7c-f4f1-08d85bcbb3dd
X-MS-TrafficTypeDiagnostic: SN6PR07MB4941:
X-Microsoft-Antispam-PRVS: <SN6PR07MB494199CBF9FC20BB7F5A485BC53F0@SN6PR07MB4941.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7IyLKBHxvfwvEHQNjuTKOpIeP4/NMdZKJsoXvesh0AgzKmi9ax95A0m89Xcp0JUou9lEB4mgJEeOMoiOBuwC0Mqr5kh5X+x44RzrN6vZRB/vZUNPwQ9PBzymLf4TKWbU1R3YXB0FG3j/iXMzZTegmhwMHjXBchu59PZDonIxce4V3335odaXrS8l5wnSrw39mR5SEgathUHrQ0r20xRsVkzjen4W2Lv1hMoN6qOwAjsMyD5PILEIxqQMGTfjJIg58AoWjvA2MsYVgZWmBrW0SbQdRpVyQL0rn2l4yMz/GRZUXRQTuPzOBMXUpnImNsBRNtC82oxlNaMI8k8QToElj7A9sqCKUpf6/UZE1LanFL1urBYx/x3tW/gQt+4y+4bPc+gSj0DbFP7cwyFB2uTOzG2D1zP2s9w/kgqs7ciDUYuNu9YAPo4qLLIp3E7n9Zx8gCakJeDZ8AwcWON4ob2azhEl1qsoTMbXMDRMaPGcrzl29A4Wuh2kslhw/D377CytTECNupdMl4I/KOmycM8primxIf/ryoS0G7DXpy1lxcWfgzXDZtitSm8CUNg9aN2f
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(36092001)(46966005)(336012)(86362001)(426003)(5660300002)(4326008)(82310400003)(70206006)(966005)(83380400001)(42186006)(36756003)(6666004)(478600001)(8676002)(36906005)(316002)(2616005)(8936002)(186003)(70586007)(110136005)(26005)(2906002)(82740400003)(47076004)(7416002)(356005)(81166007)(54906003)(921003)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 12:09:32.5502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 182c6120-b021-4e7c-f4f1-08d85bcbb3dd
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT044.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4941
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180101
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
 jsarha@ti.com, vkoul@kernel.org, tomi.valkeinen@ti.com, sjakhade@cadence.com,
 nikhil.nd@ti.com
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
