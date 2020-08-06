Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA6D23E7E2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 09:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F8E6E975;
	Fri,  7 Aug 2020 07:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7BB6E36F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 11:35:05 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076BPekl022269; Thu, 6 Aug 2020 04:34:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=jN3tbJ0H5AhuKPfGuwHh/w2l9PpmjpyYwBaGYK77DDk=;
 b=mRpjVNWc3jzKQsF9st+GufeZGtZl9B/cp/7Fei5tKb7rZlS1bY68c+VRCOricoYkKk3I
 Sm9lBD3nqRpFDKM0Zht4Kf3E2tlYwI8mYkR13O3l9m704R8pWiWgCdJVmFjZ33v1uCrd
 F9QTNUOwB/MxdZZei4suClSiGNA491Wwf+hDcxuLpkcMzCw0SQwbyXtzP+CNVFoKMgpr
 d6g5R9LrZketZdtWusPPgOiMCwx4PYriP0Ek8kYauQx79k+z8SSzu3hIr1iZzqb0jeS7
 05Y222Aci3q+axuejhnVkVX98Atzs52B+DD4RX8MmenH2fbiNSakHttTLAZvYh5c+PyC DQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0b-0014ca01.pphosted.com with ESMTP id 32n8gy1uvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 04:34:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4si2uPlYGI+WhAZtgvA7WH/XRGFf8xNU8OOCYi6TxyZl+jvXxZrz/R7NI/tNZHgXvDUXmYZzuxTxgrgfsEt1Uob1IVrDp4BxwZ3FSH3Qg51N1yuED5aquyI02mFGzg9KmnS4g0/e5RG5tlZLw+mJnNsUNNKv6BE6gNnvEzkO8eNGXikfq0t6Xfi6XjprtHqM37jgg1BhEZug1TnGcJx4nNKn6qhR2kWTxlSCov861wHQ0ENOPEzou8+qrnnUGHpOdeJGJfWOHIMGV9joBg9G6Tap95XBZOst9l8N9dBIhh7Kyu/tu/hjv13zhoaJP8XixcF0Bea0wP6enVG7RWU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN3tbJ0H5AhuKPfGuwHh/w2l9PpmjpyYwBaGYK77DDk=;
 b=QJGVwwh8p2oqtdAD4TOgIbtTxVldGpRFmqTkNTTnk3u7WgGzXZ6XuCzwIGf/p0F29h7+QiX5m48YSW7BibGzP1IeJrPPN//msVVbds/2YT9bqG1Z2zaB8PtJhk69G/JD5+G/p4OZ8+LdtOVBI3d5rq2BWt69ntWjNyyVG7QVqnpuILx3gXVZxXtJcs3aOfdy5UJnMFXSHXlhgMN2xP6zwc4+kwqdooAbrixAC30QiFOzhoT4Fb1EC52pz6cQk1i5eYVHOJ1oVlDC9QyISQc/I33ekDK0anLGcX/syz39f049Rq5+m657z5Y2VutyIkNfjYTdryEy5PxQEvqpct+lzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.244) smtp.rcpttodomain=samsung.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN3tbJ0H5AhuKPfGuwHh/w2l9PpmjpyYwBaGYK77DDk=;
 b=V4t7kp1CMp71KySbV/5uDMBXagoFSEasgraHqB1v7BGQCUZYluUwHvLMjC5bDRghKXik9fHKjAXLLPpNCfdMQu78djRJsJMANpBJGCLxyE52erCxPEvMF4m3JkO+SSN7oaB7pl+VG5vZU2m5aUK1Mv5hWi+YWniDt8O2+z7Na0s=
Received: from CO2PR04CA0158.namprd04.prod.outlook.com (2603:10b6:104:4::12)
 by MN2PR07MB6605.namprd07.prod.outlook.com (2603:10b6:208:164::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 11:34:50 +0000
Received: from MW2NAM12FT033.eop-nam12.prod.protection.outlook.com
 (2603:10b6:104:4:cafe::3a) by CO2PR04CA0158.outlook.office365.com
 (2603:10b6:104:4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Thu, 6 Aug 2020 11:34:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.207.220.244)
 smtp.mailfrom=cadence.com; samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=pass action=none header.from=cadence.com;
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.244; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.244) by
 MW2NAM12FT033.mail.protection.outlook.com (10.13.181.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.10 via Frontend Transport; Thu, 6 Aug 2020 11:34:48 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 076BYZWp083124
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 04:34:48 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 6 Aug 2020 13:34:35 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 6 Aug 2020 13:34:35 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 076BYZ6w008213;
 Thu, 6 Aug 2020 13:34:35 +0200
Received: (from sjakhade@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 076BYZ2X008212;
 Thu, 6 Aug 2020 13:34:35 +0200
From: Swapnil Jakhade <sjakhade@cadence.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <Laurent.pinchart@ideasonboard.com>,
 <robh+dt@kernel.org>, <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 3/3] drm: bridge: cdns-mhdp: Add j721e wrapper
Date: Thu, 6 Aug 2020 13:34:32 +0200
Message-ID: <1596713672-8146-4-git-send-email-sjakhade@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44b8cd8d-25d0-4308-5547-08d839fcba24
X-MS-TrafficTypeDiagnostic: MN2PR07MB6605:
X-Microsoft-Antispam-PRVS: <MN2PR07MB6605FC0000CE0644E6D2B282C5480@MN2PR07MB6605.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s0Ly7MvAeJUpGzw/9bSuX873JnhTgoUq9+jVRirOWqxwkIx/JirQNLW4KQRm6lJP2LZOWDt/lNyYLkMgSs308YAAK/h3HfDOI3j54ZZTp+r9AR5oRKWFsiHI3HvrFhpSzJrfXVis7CzVi/ML9EdOyerr7HvRbGj3jiLyNN4srxmyHPbQ+44JhNdXT0iM5SgkWgWhsbVsqZTQetKonuZG0EH09SXk5EJ3JrbpJntyFLCeYKMmje9KM68XtdegumqAI5/UNLSx8Ydkzp4VTSTUacpjRoXXZtR5xFxQERX1mFzCDKeE1RhoDBfJ59/jUE6mfK3CyAs+tCzxsOJbEq1GI09CsgVqEm66Vw7cwbaLqap0/ZaiTRH36piqXAckk4psGlAgdYw24lhL2aUabhIfRzQ/rpfCCcgNl/l+3SMdrcZuYR+vtzn2hyNTTXEIWoAE4i/1Q1kdG/TsVOOCfLDZNrQvt/terPjrCxANMZB/nv0lTzplJ2bsqKqGDybZJaQ2w9eZHgL3VqqkxbXQyErZ+ZjyRIDKjOTqh5wMrWWEVdsZAYWbzhT2dzjlyAgDOKVu
X-Forefront-Antispam-Report: CIP:64.207.220.244; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:wcmailrelayl01.cadence.com; PTR:ErrorRetry; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(36092001)(46966005)(36756003)(36906005)(186003)(82310400002)(4326008)(6666004)(2906002)(83380400001)(8936002)(5660300002)(26005)(336012)(86362001)(110136005)(81166007)(426003)(356005)(42186006)(47076004)(82740400003)(316002)(8676002)(478600001)(54906003)(966005)(2616005)(70586007)(70206006)(7416002)(921003)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 11:34:48.9770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b8cd8d-25d0-4308-5547-08d839fcba24
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.244];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT033.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB6605
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_06:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008060083
X-Mailman-Approved-At: Fri, 07 Aug 2020 07:25:55 +0000
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
 drivers/gpu/drm/bridge/Kconfig           | 13 +++++
 drivers/gpu/drm/bridge/Makefile          |  2 +
 drivers/gpu/drm/bridge/cdns-mhdp-core.c  | 15 +++++
 drivers/gpu/drm/bridge/cdns-mhdp-core.h  |  1 +
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c | 72 ++++++++++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h | 19 +++++++
 6 files changed, 122 insertions(+)
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
index 7046bf077603..be92ebf620b6 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -2,6 +2,8 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 obj-$(CONFIG_DRM_CDNS_MHDP) += cdns-mhdp.o
 cdns-mhdp-y := cdns-mhdp-core.o
+cdns-mhdp-$(CONFIG_DRM_CDNS_MHDP_J721E) += cdns-mhdp-j721e.o
+
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
index d47187ab358b..53c25f6ecddf 100644
--- a/drivers/gpu/drm/bridge/cdns-mhdp-core.c
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
@@ -42,6 +42,8 @@
 
 #include "cdns-mhdp-core.h"
 
+#include "cdns-mhdp-j721e.h"
+
 static DECLARE_WAIT_QUEUE_HEAD(fw_load_wq);
 
 static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
@@ -1702,6 +1704,16 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 
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
 		DRM_ERROR("Failed to attach connector to encoder\n");
@@ -2521,6 +2533,9 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 
 static const struct of_device_id mhdp_ids[] = {
 	{ .compatible = "cdns,mhdp8546", },
+#ifdef CONFIG_DRM_CDNS_MHDP_J721E
+	{ .compatible = "ti,j721e-mhdp8546", .data = &mhdp_ti_j721e_ops },
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mhdp_ids);
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.h b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
index bd97a7aeb28b..d40a0f8615a4 100644
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
index 000000000000..cc33c9afb5bb
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI j721e Cadence MHDP DP wrapper
+ *
+ * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
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
+	return PTR_ERR_OR_ZERO(mhdp->j721e_regs);
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
index 000000000000..7a4a1a269b5e
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TI j721e Cadence MHDP DP wrapper
+ *
+ * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
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
