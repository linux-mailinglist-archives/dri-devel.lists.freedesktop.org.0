Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB22B8D62
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93F66E54C;
	Thu, 19 Nov 2020 08:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106626E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:07:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrdq7UfTgd/stLO022lDR0tYLDNEufUCnHWdX2p6sKRJcZuezvycs7Cmx5x65uWUkYhBoJyFg1V65OODoN9xH9zxCPotqTVCUa0vFGjmnM1dheBxZFd6/gx3E8RUUOMC39hgS549Frr7UZj37mjmKiCuCcqdTp9iznqNdm8z28dymDVxkaRYaDXaWNNtAYoOiWUz3sC1BC5Y6DESf2swiS65bkjzEnjhz/T7tcEo+UOHMvQdfUTNFCU4hyevDKB+4i263NUH9ywqczx4+9eBrTbVga03e5jN9TEQb8iHfA7ypyGUompEVPt5XI8qE2SNJWDekruoHqEUhzcq00z7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9/IsjCOTiTkt0pSphdZ4YBLSL+jBXL0pj09EddTBEY=;
 b=RX98xBk2bShfGLRhPE/6z/RzfNFauRiR7uhOcoNzfHUZVpIG18SvM/OWM/tWdzZ14NUh26flkwHtqspIYSK5XvFtofdcFxXsInzjHWwSsNQQwe84/SWY6C5jclptZk/dZpMw+mAaVjET9UiCCZQdPG0/44g7v6NtHSawtfkXiNhG7lq7EacjsI/7IHpj3Jzk+MQf40JiW5RyptUrgkYoAuk+9MkFOauukEn8RtVxCJbwrhdBAUZp64XxmUZpLcgl716eJG9uvU3uZTG1MXwOgE8T8gF4/SL7MSD+uCWg98RsDWF+smobdPmNFby+9oiSU2agO815GNUFs3+Yi8BSmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9/IsjCOTiTkt0pSphdZ4YBLSL+jBXL0pj09EddTBEY=;
 b=LgRZ3aGNK1s1lGInlTPFVyMXlMpbMz9YswaZsVii6/TuBc59NqefhhiwazsXVTvUENwy9dmWG0MdmzHl9KjH7+UFddy00N5gANAr8fuKxRtOnYRCrVZvZtAumKTnGU6rfcxSNiEeHFWniyzYaupaARSkMdXgGdgZyNcP6rOpz/M=
Received: from SN1PR12CA0076.namprd12.prod.outlook.com (2603:10b6:802:20::47)
 by BL0PR02MB4914.namprd02.prod.outlook.com (2603:10b6:208:53::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Wed, 18 Nov
 2020 08:06:56 +0000
Received: from SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:20:cafe::b4) by SN1PR12CA0076.outlook.office365.com
 (2603:10b6:802:20::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT041.mail.protection.outlook.com (10.152.72.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 18 Nov 2020 08:06:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 00:06:33 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 00:06:33 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, nishad.saraf@xilinx.com,
 wendy.liang@xilinx.com, robh+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Received: from [172.19.2.167] (port=35936 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kfIU5-0000Nk-PY; Wed, 18 Nov 2020 00:06:33 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH 7/9] misc: xilinx-ai-engine: Add support to request device
 management services
Date: Wed, 18 Nov 2020 00:06:18 -0800
Message-ID: <1605686780-17886-8-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
References: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e6ab063-3b1f-4bcf-ed69-08d88b98eae9
X-MS-TrafficTypeDiagnostic: BL0PR02MB4914:
X-Microsoft-Antispam-PRVS: <BL0PR02MB491405193F50497751C4E6ECB0E10@BL0PR02MB4914.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+qdUDto7Esp+Q/GLK3x5V4f7UqpqcSIjHN9ipiZSdVaCuAHoJK96/z6tC65yv23k1HBxTTdV7/tmdV2V6843TNouesbmmF9QoSxvgXOe1nJ6NFoQsuVUwKXlBo70p4jrCkLGHn44sDTAca2vit5Qil1LWHapNTj13+4oBuMC4OrfOEmWTCae6CZspev/at/Ufj36oMzNQkuOdVGcecI/5aPg2IH1gVgLg4TgTw5HhuI4BbrgMRhNYcLMCSSBtgUbCMuPyyI++pdRbWwcCV0FPF3N2l+/+E4B9J4qQPnUv6dW+WTVFc9QpGdYAxteJYbHNLjCRUR6h6B8DtgPNkFTSv4wsZn92YJA4e++/IlTSlA5fgleBaMiwBB6Fem7Bvmo8PilUtzpKJZS4sNGDSUTdZrHqf2gP2nv6nJQIbc0hmCO4DEc0EVhL+DUxEQURf4
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(376002)(136003)(346002)(46966005)(5660300002)(2616005)(36756003)(6636002)(9786002)(7696005)(186003)(83380400001)(7636003)(356005)(26005)(82740400003)(336012)(82310400003)(426003)(47076004)(8936002)(4326008)(36906005)(7416002)(107886003)(316002)(921005)(478600001)(110136005)(70586007)(8676002)(70206006)(44832011)(6666004)(2906002)(54906003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:06:56.4604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6ab063-3b1f-4bcf-ed69-08d88b98eae9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4914
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Wendy Liang <wendy.liang@xilinx.com>, Nishad
 Saraf <nishad.saraf@xilinx.com>, linux-arm-kernel@lists.infradead.org,
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
index 7e69ff4..78eae90 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/file.h>
+#include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/list.h>
@@ -25,7 +26,8 @@
 
 #include "ai-engine-internal.h"
 
-#define AIE_DEV_MAX	(MINORMASK + 1)
+#define AIE_DEV_MAX			(MINORMASK + 1)
+#define VERSAL_SILICON_REV_MASK		GENMASK(31, 28)
 
 static dev_t aie_major;
 struct class *aie_class;
@@ -318,6 +320,7 @@ static int xilinx_ai_engine_probe(struct platform_device *pdev)
 {
 	struct aie_device *adev;
 	struct device *dev;
+	u32 idcode, version, pm_reg[2];
 	int ret;
 
 	adev = devm_kzalloc(&pdev->dev, sizeof(*adev), GFP_KERNEL);
@@ -345,6 +348,26 @@ static int xilinx_ai_engine_probe(struct platform_device *pdev)
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
