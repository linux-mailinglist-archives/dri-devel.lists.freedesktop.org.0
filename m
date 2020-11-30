Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450242C7FB8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8346E44A;
	Mon, 30 Nov 2020 08:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AAF6E413
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXxbcZ/ML5gG/DKeDwkvFHNO765GOBSnNgGaivGCUtz+6jNJP0f3L+pWieMPZBSL4G7kKJd0E2q5iuHTsX6DnCQOKmhA5IkQpxQSbLLNxbMuel1YF1/LzZY0L7mDUYhE4L4wm9nsHG/xjASBwBxs/Uw8yETjZQeBgj5BoAi07rdmvHoDt215AmSLFZpNZ2nGk2rCVaVf317iRE3B5r6dDOixBkVdt+NwlamORetX57rCNoA3mFbbVweeOLr6MOSpqzr9Q7mo0D6tqXcHft+uF+RhH54Wmd+vVryC+dWJ2gNq9QbHdL+i4v8WN5mOx6DhC846fEsvYZWI7zO5nPZqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2by8VBRWU/srdxgpuOmnChitsLFXF25g0h+RLjLQrU=;
 b=Ms0zPoL6IMp/0Km5DYTjdc6I3EQ7PDpihdwZQkkt/NRrrdvBwC7ZmiejHknpv3MKVa5wA+wIDtlGh2Cu32TJ9H4OssbfaUM6ovRrG5IpA1GRFhsyOO8PdKdOtaV7SjtOK7MTqpAgfEQOfvuHYvJz7eZszvfW9eHWRw8dN06Ww2S2wTc+ki5MJalIVqkK9/BrPLIvVocvqTi7vHFufKEbsQrvw5/GIKEfYiNMDNf0+hNt7QafZU61NTN/LkS2K+2DjeudV5A6kQzvD2vkAgddaGvGcHWzRVme7FNnMmiekyeSyvxDmK0PMUh6vAhUv66PmC211HBlXS6HxIq3RdFyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2by8VBRWU/srdxgpuOmnChitsLFXF25g0h+RLjLQrU=;
 b=SgQu+Svo85r0v0ZpVO08T5DQk2qXZGlk43mdt65UyFvZQBsIcP0umw/oFf3JorRy7OLJ5fghZZeJSTaEl0dW2JgcH0AQAZQPe2tzxRSTU2dg54p7G3u3CSmUzrEOCAqJ3MJV/W/biWfsI4R+BQNDgcdmeZxyI49Ojm/xC5UJ7Wo=
Received: from SN4PR0201CA0062.namprd02.prod.outlook.com
 (2603:10b6:803:20::24) by MWHPR02MB2893.namprd02.prod.outlook.com
 (2603:10b6:300:109::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 07:48:46 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::ff) by SN4PR0201CA0062.outlook.office365.com
 (2603:10b6:803:20::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 07:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Mon, 30 Nov 2020 07:48:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 29 Nov 2020 23:48:31 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 29 Nov 2020 23:48:31 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, nishad.saraf@xilinx.com,
 wendy.liang@xilinx.com, robh+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=48528 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kjdvD-0006Pm-3j; Sun, 29 Nov 2020 23:48:31 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v3 7/9] misc: xilinx-ai-engine: Add support to request device
 management services
Date: Sun, 29 Nov 2020 23:48:23 -0800
Message-ID: <1606722505-16194-8-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcf8a174-0e71-43ff-e3ce-08d895045de3
X-MS-TrafficTypeDiagnostic: MWHPR02MB2893:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2893AE82DF08D7145075534AB0F50@MWHPR02MB2893.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnX0kodLIx7J6qgkboM4WG/EgC/GqyyzcEDLHbm5ucZZRikLzB8FYOuTHRhV4Taf3MMWk1pooRS418VS73r97B9/WTb7gEpK2CiRikq/cc8kd0wkuqBv66ljoo4p0AaZr+8aoSZUtO6mnYybuDES3DtqNj4t1/ufAJDRyQ/qZc7hE1cii4qo7CwNzQli3KaJbQvjCWTUv+PYVZh7JpmpSCljMfqhDDC5/okkPVwWZxjRDmpEpZ0gfagi6NCIi5erwp/wwCDWfqVTVrbXf6JaCWMYBukJIwIS0xNiRQQ8+8/xrwqus/8KSTADU81QO4bvcUdBdQ6v+IuvFro8EQwfs52IEcmId1O51jyoBGVGhLGbEFYw/VpWpj6mXwttOXXU6m30Ld+coYhQ1fZDvN92xrIWoRqsU/HwQ5SW8dQHW3qSHyZQQTl+pX1roSRfqO+Q
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(46966005)(9786002)(316002)(110136005)(8676002)(83380400001)(6636002)(36906005)(336012)(8936002)(478600001)(36756003)(54906003)(2906002)(6666004)(5660300002)(70206006)(921005)(26005)(4326008)(2616005)(7416002)(186003)(82740400003)(7636003)(82310400003)(44832011)(356005)(426003)(47076004)(107886003)(7696005)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 07:48:45.9739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf8a174-0e71-43ff-e3ce-08d895045de3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2893
X-Mailman-Approved-At: Mon, 30 Nov 2020 08:25:11 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wendy Liang <wendy.liang@xilinx.com>,
 Nishad Saraf <nishad.saraf@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nishad Saraf <nishad.saraf@xilinx.com>

Platform management services like device control, resets, power
management, etc. are provided by Platform, Loader and Manager(PLM)
through firmware driver APIs. For requesting some of these services,
this change reads AI Engine platform management node ID from DT node.
Some other features like clearing interrupts in the NoC interconnect
might only be valid for particular silicon revisions. For supporting
such silicon specific features, AI Engine driver will query and store
this information in device instance. While at it, this change makes
EEMI operations accessible to all the other source files in the
driver.

Signed-off-by: Nishad Saraf <nishad.saraf@xilinx.com>
Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
---
 drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 25 +++++++++++++++++++++-
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h |  6 ++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
index 43f4933..51c3a4f 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/file.h>
+#include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
@@ -26,7 +27,8 @@
 
 #include "ai-engine-internal.h"
 
-#define AIE_DEV_MAX	(MINORMASK + 1)
+#define AIE_DEV_MAX			(MINORMASK + 1)
+#define VERSAL_SILICON_REV_MASK		GENMASK(31, 28)
 
 static dev_t aie_major;
 struct class *aie_class;
@@ -322,6 +324,7 @@ static int xilinx_ai_engine_probe(struct platform_device *pdev)
 {
 	struct aie_device *adev;
 	struct device *dev;
+	u32 idcode, version, pm_reg[2];
 	int ret;
 
 	adev = devm_kzalloc(&pdev->dev, sizeof(*adev), GFP_KERNEL);
@@ -349,6 +352,26 @@ static int xilinx_ai_engine_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/*
+	 * AI Engine platform management node ID is required for requesting
+	 * services from firmware driver.
+	 */
+	ret = of_property_read_u32_array(pdev->dev.of_node, "power-domains",
+					 pm_reg, ARRAY_SIZE(pm_reg));
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Failed to read power management information\n");
+		return ret;
+	}
+	adev->pm_node_id = pm_reg[1];
+
+	ret = zynqmp_pm_get_chipid(&idcode, &version);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get chip ID\n");
+		return ret;
+	}
+	adev->version = FIELD_GET(VERSAL_SILICON_REV_MASK, idcode);
+
 	dev = &adev->dev;
 	device_initialize(dev);
 	dev->class = aie_class;
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
index 131d22a..b21b7025 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
@@ -41,6 +41,10 @@
 #define AIE_REGS_ATTR_PERM_MASK		GENMASK(15, \
 						AIE_REGS_ATTR_PERM_SHIFT)
 
+/* Silicon Engineering Sample(ES) revision ID */
+#define VERSAL_ES1_REV_ID		0x0
+#define VERSAL_ES2_REV_ID		0x1
+
 /**
  * struct aie_tile_regs - contiguous range of AI engine register
  *			  within an AI engine tile
@@ -173,6 +177,7 @@ struct aie_resource {
  *	      while columns are occupied by partitions.
  * @num_kernel_regs: number of kernel only registers range
  * @version: AI engine device version
+ * @pm_node_id: AI Engine platform management node ID
  */
 struct aie_device {
 	struct list_head partitions;
@@ -193,6 +198,7 @@ struct aie_device {
 	u32 row_shift;
 	u32 num_kernel_regs;
 	int version;
+	u32 pm_node_id;
 };
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
