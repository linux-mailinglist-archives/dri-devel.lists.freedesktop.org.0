Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80917123D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60DB6EC34;
	Thu, 27 Feb 2020 08:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9B56E24E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:23:35 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QANG6H020044; Wed, 26 Feb 2020 02:23:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=tG/ZbV7s7gU/ODDo9+EtQZ1LFmnGjZIN96zDZbRXfO4=;
 b=VZSwRqPqNwBosVrpY2tW6Eu89eLvW8tuDrJcpriqTKJUt2TlbaXuSeJfnBGq4f04CtGE
 WBC4I5qdZipYzq1zHKDrV2fPyN7Nd83cQmcl5SjXtyBWJzngtMraYuRkAP4pCg6LEjda
 IpjALhe2Ffqt1aU4TB6Yau89aIGgGOc+0PTIoi0SduM3aZ87BTWeaugT4RfXnJaFGDFn
 YX3oiHw8l7oZ1vK4p5cGpq4ZvK22nNr5IdzJIOZsBAyaEQ4y6cSRZ558C1bvHrPI5XNT
 GuSU8wUStRlXE/MWzZlrloM5QYazclE9Mh7wTfOhkzyZD9LvMnNtB+xP52I5Q3mBtc08 tg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2ydcqmjaj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 02:23:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O81+JLxanDGz+FRb/6uij1RIUEtENR03d+QenPh5/6qjcsmGMiWYhPhHnP2nPPieOteuPlVDUt8cZiSL2LAb2NJWUgYDtYceatSehMfiY/p17qq81ztgoSIeET5412RoT8uu6MkNnjoYhnwzzCO0dr2cwbV+X0UySTq5ItS6N3diVW6pbCqGHLLr5rBsqzega8gVoT1yceBCzy8FYERbN4dV/L4UxgqG80bmjRlYZSdqPXTFtHiJG0g4wLH596YzeOf0Hgj4rkoMzysd+R/ndESzVNQVNV2q6M+eM7hjl8yB0xX0vonaaGqMOwggS33cRIC5Tr0PjjwJi1Etuqxltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG/ZbV7s7gU/ODDo9+EtQZ1LFmnGjZIN96zDZbRXfO4=;
 b=Cqcm8mUV/RFwi5AaiQ0Ksak+nuXPwvnz+8IIkAz9qR0Y8Qn4FdRy5BFiH6NYpEwrC6HPvXuZVSI9knfnpa4qi882RtOJ9+Kg8qbN+LOthLQjllSVYJP+9C6C571cGePc/zyLg83zhqoZIFKp9W1MBw13WND6O2EJ24+XRIQDPI7A9RSwFBIL+9q195ZGYSlq0YK2wpCSdZW3IFIBRJjDX/fcNNG3H2O5EqjRy7HrazSup6l4Q5tfmaZmOsgRXsHbkgtqKqM9EJuba7yM3y5Szxd4eXGy+ZKeEMRzhxWmhAcpiQpkRcl5W0oITtHaH0Bcqv1gMJ6g37JmXWF2I5VMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=linux.ie smtp.mailfrom=cadence.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=cadence.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG/ZbV7s7gU/ODDo9+EtQZ1LFmnGjZIN96zDZbRXfO4=;
 b=Imnkj2+RLXuhJVF1KDVN/jPbafO1tSEjJh+Johqr6coXYLB+BggIK75JuCu79kX0JUSsOAERGZpNdMkX59Aqoya58irwPk5LP8hiNmp5p6EIv2+LSFOCXVV1bQTDQAIsyxuQhs95uyWUtGxardKUbWbnJo4jBJ5UC+UTO+kPjFU=
Received: from DM5PR07CA0039.namprd07.prod.outlook.com (2603:10b6:3:16::25) by
 BN7PR07MB4481.namprd07.prod.outlook.com (2603:10b6:406:b2::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Wed, 26 Feb 2020 10:23:15 +0000
Received: from DM6NAM12FT061.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:16:cafe::cb) by DM5PR07CA0039.outlook.office365.com
 (2603:10b6:3:16::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 10:23:15 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT061.mail.protection.outlook.com (10.13.179.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.6 via Frontend Transport; Wed, 26 Feb 2020 10:23:14 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 01QAN2OC018412
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 26 Feb 2020 05:23:13 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 26 Feb 2020 11:23:01 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 26 Feb 2020 11:23:01 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 01QAN1h4028559;
 Wed, 26 Feb 2020 11:23:01 +0100
Received: (from yamonkar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 01QAN116028558;
 Wed, 26 Feb 2020 11:23:01 +0100
From: Yuti Amonkar <yamonkar@cadence.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
 <maxime@cerno.tech>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
Subject: [PATCH v6 3/3] drm: bridge: cdns-mhdp: add j721e wrapper
Date: Wed, 26 Feb 2020 11:22:59 +0100
Message-ID: <1582712579-28504-4-git-send-email-yamonkar@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
References: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(36092001)(189003)(199004)(36756003)(336012)(8676002)(26005)(186003)(478600001)(4326008)(42186006)(316002)(81156014)(81166006)(26826003)(86362001)(110136005)(966005)(54906003)(70206006)(5660300002)(356004)(2616005)(70586007)(7416002)(2906002)(107886003)(426003)(8936002)(921003)(2004002)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR07MB4481; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0319f519-562f-4860-52ed-08d7baa5e3bd
X-MS-TrafficTypeDiagnostic: BN7PR07MB4481:
X-Microsoft-Antispam-PRVS: <BN7PR07MB448148969DE9B3D0EEF5B143D2EA0@BN7PR07MB4481.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rw5ZKT1ddK3QJYKd1a07CI24bYvw7ZvBrCH9EA5H2oea/+oCA3E7H3Ij+rv9mj4/4gVcc20bV4AnuEfv9669RsMfmAtUDOEKzu6H14BOIA3CuHJ4b3V+duYXCFXCrqB3GICDnxDcA+zk8dT4mEFjJzjtvSGjDYklCBenTc+aVr3gKEKvN3zSq/w0sW2PBtFeBItxewuVT6OsH4wfzjr/own4wIUJBw3TfHUZfp7DLNge+PF36iBhVWILhEv66Teg0i4sCyfqu28NmXicrZkzBqw0H2EiHw+HBsOKYHWlnDNnOZX6XmvbjZnOZAT5irGBOH7ED/R6TV6dnjX+EFA5oSsBOfOo0Ux/jKT9/g7xMpzG3KFtZj2nHuTBAPlEZxTgdpjj6XaitHRQGvUBeK4KDllMblFQ+/hFVIIMamKntpQ5TA3ZxsIwlvyyLUNkq0wkCdVXLuhZCDYtSnRx2/OPRF4nixcfBhb+JMLMV5rdWcpzGW4oYDgEzg6emkxcn86njkOEDbhBXqmYLmzu0JVI7PE3NkV5ydM6eJKOx6gyfBm+D8xm/n/MSa+gE4ak7iF685fSkwPaXgn9U1gpjHamsmJojz6gD8ve7M+BRRWF62S8y17nMX+t9UTElJy69JpukFWGT2otpNkEa6rqJk5Y0YfsRaYwDt1a6X9ODSfHo2Y=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 10:23:14.8650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0319f519-562f-4860-52ed-08d7baa5e3bd
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4481
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_02:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260079
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/bridge/Kconfig           | 12 ++++
 drivers/gpu/drm/bridge/Makefile          |  4 ++
 drivers/gpu/drm/bridge/cdns-mhdp-core.c  | 14 +++++
 drivers/gpu/drm/bridge/cdns-mhdp-core.h  |  1 +
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c | 79 ++++++++++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h | 55 +++++++++++++++++
 6 files changed, 165 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 3bfabb76f2bb..ba945071bb0b 100644
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
index 2e2c5be7c714..fa575ad57b95 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -19,5 +19,9 @@ obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
 obj-$(CONFIG_DRM_CDNS_MHDP) += cdns-mhdp.o
 cdns-mhdp-objs := cdns-mhdp-core.o
 
+ifeq ($(CONFIG_DRM_CDNS_MHDP_J721E),y)
+	cdns-mhdp-objs += cdns-mhdp-j721e.o
+endif
+
 obj-y += analogix/
 obj-y += synopsys/
diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
index cc642893baa8..8d07ffe2d791 100644
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
index f8df54917816..0878a6e3fd31 100644
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
index 000000000000..c7f9e8bc9391
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
+void cdns_mhdp_j721e_sst_enable(struct cdns_mhdp_device *mhdp)
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
