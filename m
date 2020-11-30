Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8B2C7FBB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B94A6E450;
	Mon, 30 Nov 2020 08:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6626E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHv94TQJNQECJzhTwqcMKzVzahp+ZxtC6tsxaSF3vWyfHDdd1bfFTBK4JLzGFquoxJdesPZnJLOmqSpE9QsxGmLQ9+Pp7aSW1Wcv503e3IWQR1ws5bbsa+LLP1Dd2h63dWVCHL5+QyleJar2eLEk9l48dQGdzqKt/91wBKEbtW/YxScpk7kihuK5PeycaHc8ijK22S25w6IUN28jUALUaZo5WBmCBl/MAQhPO4COYUMfaEKCNZqjoawDH59ZYQlWFELNFXPRLnZr50FmavPf7L+96t7qz0R/JHZC3k3aIy4z+lDUkuqoyUf8dHXJi7mjWxol6B0GBMThpUt1GJ5bVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7V65eYdmRkg1mYGQW5Af8yR9xe5sDfbOhbDZYpJXRE=;
 b=KwBl+z+I9Ah4WQSQ/vJjA99aZbM6ZCROlW/rMOZYCut9jBuA2vpxj63LLLYDu/3g7m+ebz2s4IDJMUCcSoCMO1K/Poz83P4lD4jjMFYesblMZrZgX3u8+5Elr4xMc53W3hGyT9MmLD4w2+FwcOHIfFpJi3NDnS0vyyoYbU+rsM4Da+IuwvSiJ0gxyIO2CmexTSokIc+yH718888pcwWBmGkc5XiVJ4nEUxUClE18lLrI+cb2lxBrrwvBPB36OohOoCObzEkKNP63D3Ga2iw8LkZHOHLsQ04CTKf/ffDebCSzwq0BRp0bIFZ6afqbEaqvRxJme8NhKWaN+JyYxQmD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7V65eYdmRkg1mYGQW5Af8yR9xe5sDfbOhbDZYpJXRE=;
 b=LlNU7IsfsF5pY0xr0XzrNgVzn40AqX5JTJh0huzuZ2eMX0ZoZRj9gQ8Aawn4SXs4bNUSZ3zpsEwC3s1EiBtpJpX5oWphv1p1kJMeU3Q6U+gecCWLitNrYJURWTnDxkwt0gwwDD/CpHwLYvbusqyNJYwvk5TuciYNGaMbfCOARak=
Received: from SN4PR0201CA0059.namprd02.prod.outlook.com
 (2603:10b6:803:20::21) by BN6PR02MB2593.namprd02.prod.outlook.com
 (2603:10b6:404:54::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Mon, 30 Nov
 2020 07:48:45 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::4b) by SN4PR0201CA0059.outlook.office365.com
 (2603:10b6:803:20::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 07:48:45 +0000
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
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 29 Nov 2020 23:48:31 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 29 Nov 2020 23:48:31 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, wendy.liang@xilinx.com, robh+dt@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=48528 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kjdvC-0006Pm-Vw; Sun, 29 Nov 2020 23:48:31 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v3 4/9] misc: xilinx-ai-engine: expose AI engine tile memories
 to userspace
Date: Sun, 29 Nov 2020 23:48:20 -0800
Message-ID: <1606722505-16194-5-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cfe98d1-731e-4085-d69d-08d895045d88
X-MS-TrafficTypeDiagnostic: BN6PR02MB2593:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2593E17DE53F660875BD1C8FB0F50@BN6PR02MB2593.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gElfvBgk5dWOtCytBsWqB6HTqMOhrPHkxNzbNhx4au+fpsp2ToiqVi3JdGY5E3Ep91B4rDjLI929ryFMdXcDT3vIItCXeBMacx2VYV0EnqjU6lxaQM4H2dZJdWrTz25PWq3pwZinJP9vis2sck7ilzAA2lqinYTmuV8tF0cVG9Us4lE9QlXU7FUBK6JzdNf1Pwv5HU8wBJEdwKt5GDK+HNtuJ6AVLPR4TuzHD02PoqZmLXHqZZzFbt8w/0afnSb02f1D3mG3Zkuz5mup0e6KazMC/DTvNJ5ChO6PH+S+v2M7wwfiXmAdHUeyYZ6c8+KVTPz/om7A4Ow9zOCdBHoe8cNndRH7JaM8D/aag62ivTewbo0GsRTVJ/Meb8dY+KdycG8qZv7tzORfaLSGH0+Y79MAoD2oW4jOBLcFKrCB+0S9yjh6PDbmRuhkI8tFmhXtHPvc8WRamwN5RE2Yna7Zei4OfvIgto2Nj4+FyrCUjeU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39850400004)(46966005)(5660300002)(4326008)(356005)(316002)(30864003)(36906005)(7636003)(8676002)(336012)(107886003)(70586007)(70206006)(186003)(921005)(26005)(6666004)(36756003)(47076004)(2906002)(44832011)(6636002)(2616005)(7696005)(8936002)(7416002)(478600001)(82310400003)(426003)(110136005)(54906003)(83380400001)(9786002)(82740400003)(102446001)(461764006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 07:48:45.3722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfe98d1-731e-4085-d69d-08d895045d88
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2593
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no concern to have userspace to directly access AI engine
program and data memories. It will be much faster to directly copy
data to and from these memories from userspace.

We choose to use DMA buf for the data and program memory because of the
DMA buf features. DMA buf can share the DMA memory between applications
and different devices, which can benefit on how to share data with AI
engine device in future.

There is one DMA buf per type of memory in an AI engine partition. e.g.
There is one DMA buf for all the tile core program memories in an AI
engine partition. There is another DMA buf for all the tile data
memories in an AI engine partition.

Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 drivers/misc/xilinx-ai-engine/Makefile             |   1 +
 drivers/misc/xilinx-ai-engine/ai-engine-aie.c      |  36 +++
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h |  30 +++
 drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     |  47 ++++
 drivers/misc/xilinx-ai-engine/ai-engine-reset.c    |  38 +++
 include/uapi/linux/xlnx-ai-engine.h                |  50 ++++
 7 files changed, 477 insertions(+)
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c

diff --git a/drivers/misc/xilinx-ai-engine/Makefile b/drivers/misc/xilinx-ai-engine/Makefile
index 39bec61..2dbed42 100644
--- a/drivers/misc/xilinx-ai-engine/Makefile
+++ b/drivers/misc/xilinx-ai-engine/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_XILINX_AIE)	+= xilinx-aie.o
 
 xilinx-aie-$(CONFIG_XILINX_AIE) := ai-engine-aie.o \
 				   ai-engine-dev.o \
+				   ai-engine-mem.o \
 				   ai-engine-part.o \
 				   ai-engine-res.o \
 				   ai-engine-reset.o
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
index 36127f0..7fce2f00 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
@@ -12,10 +12,14 @@
 
 #include "ai-engine-internal.h"
 
+#define KBYTES(n)	((n) * 1024)
+
 #define AIE_ARRAY_SHIFT		30U
 #define AIE_COL_SHIFT		23U
 #define AIE_ROW_SHIFT		18U
 
+#define NUM_MEMS_PER_TILE	2U
+
 /*
  * Registers offsets
  */
@@ -114,6 +118,37 @@ static u32 aie_get_tile_type(struct aie_location *loc)
 	return AIE_TILE_TYPE_SHIMNOC;
 }
 
+static unsigned int aie_get_mem_info(struct aie_range *range,
+				     struct aie_part_mem *pmem)
+{
+	unsigned int i;
+
+	if (range->start.row + range->size.row <= 1) {
+		/* SHIM row only, no memories in this range */
+		return 0;
+	}
+	if (!pmem)
+		return NUM_MEMS_PER_TILE;
+
+	for (i = 0; i < NUM_MEMS_PER_TILE; i++) {
+		struct aie_mem *mem = &pmem[i].mem;
+
+		memcpy(&mem->range, range, sizeof(*range));
+		if (!mem->range.start.row) {
+			mem->range.start.row = 1;
+			mem->range.size.row--;
+		}
+	}
+	/* Setup tile data memory information */
+	pmem[0].mem.offset = 0;
+	pmem[0].mem.size = KBYTES(32);
+	/* Setup program memory information */
+	pmem[1].mem.offset = 0x20000;
+	pmem[1].mem.size = KBYTES(16);
+
+	return NUM_MEMS_PER_TILE;
+}
+
 /**
  * aie_set_shim_reset() - Set AI engine SHIM reset
  * @adev: AI engine device
@@ -170,6 +205,7 @@ static int aie_reset_shim(struct aie_device *adev, struct aie_range *range)
 
 static const struct aie_tile_operations aie_ops = {
 	.get_tile_type = aie_get_tile_type,
+	.get_mem_info = aie_get_mem_info,
 	.reset_shim = aie_reset_shim,
 };
 
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
index 2acd34f..e84610b 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
@@ -12,6 +12,8 @@
 #include <linux/bits.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/file.h>
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -67,8 +69,30 @@ struct aie_device;
 struct aie_partition;
 
 /**
+ * struct aie_part_mem - AI engine partition memory information structure
+ * @apart: AI engine partition
+ * @dbuf: dmabuf pointer associated with the memory
+ * @mem: memory information of a type of memory
+ * @size: size of the total memories in the partition
+ *
+ * This structure is to keep the information of a type of memory in a
+ * partition. The memory information will be stored in @mem property.
+ * The following information will be keep:
+ *  * memory start address offset within a tile
+ *  * memory size
+ *  * what tiles contain this type of memory
+ */
+struct aie_part_mem {
+	struct aie_partition *apart;
+	struct dma_buf *dbuf;
+	struct aie_mem mem;
+	size_t size;
+};
+
+/**
  * struct aie_tile_operations - AI engine device operations
  * @get_tile_type: get type of tile based on tile operation
+ * @get_mem_info: get different types of memories information
  * @reset_shim: reset shim, it will assert and then release SHIM reset
  *
  * Different AI engine device version has its own device
@@ -76,6 +100,8 @@ struct aie_partition;
  */
 struct aie_tile_operations {
 	u32 (*get_tile_type)(struct aie_location *loc);
+	unsigned int (*get_mem_info)(struct aie_range *range,
+				     struct aie_part_mem *pmem);
 	int (*reset_shim)(struct aie_device *adev, struct aie_range *range);
 };
 
@@ -134,6 +160,7 @@ struct aie_device {
  * struct aie_partition - AI engine partition structure
  * @node: list node
  * @adev: pointer to AI device instance
+ * @pmems: pointer to partition memories types
  * @range: range of partition
  * @mlock: protection for AI engine partition operations
  * @dev: device for the AI engine partition
@@ -146,6 +173,7 @@ struct aie_device {
 struct aie_partition {
 	struct list_head node;
 	struct aie_device *adev;
+	struct aie_part_mem *pmems;
 	struct aie_range range;
 	struct mutex mlock; /* protection for AI engine partition operations */
 	struct device dev;
@@ -256,5 +284,7 @@ struct aie_partition *of_aie_part_probe(struct aie_device *adev,
 void aie_part_remove(struct aie_partition *apart);
 int aie_part_clean(struct aie_partition *apart);
 
+int aie_mem_get_info(struct aie_partition *apart, unsigned long arg);
+
 int aie_device_init(struct aie_device *adev);
 #endif /* AIE_INTERNAL_H */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-mem.c b/drivers/misc/xilinx-ai-engine/ai-engine-mem.c
new file mode 100644
index 0000000..4b2697e
--- /dev/null
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-mem.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx AI Engine device memory implementation
+ *
+ * Copyright (C) 2020 Xilinx, Inc.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/xlnx-ai-engine.h>
+
+#include "ai-engine-internal.h"
+
+#define aie_cal_reg_goffset(adev, loc, regoff) ({ \
+	struct aie_device *_adev = (adev); \
+	struct aie_location *_loc = &(loc); \
+	(_loc->col << _adev->col_shift) + \
+	(_loc->row << _adev->row_shift) + (regoff); \
+	})
+
+#define aie_cal_reg_pa(adev, loc, regoff) ({ \
+	struct aie_device *__adev = (adev); \
+	__adev->res->start + aie_cal_reg_goffset(__adev, loc, regoff); \
+	})
+
+static struct sg_table *
+aie_mem_map_dma_buf(struct dma_buf_attachment *attachment,
+		    enum dma_data_direction direction)
+{
+	/*
+	 * TODO: It is mandatory by DMA buf operation. It is used return
+	 * scatterlist table of an attachment. We don't have the implementation
+	 * for now. And thus it has empty implementation.
+	 */
+	(void)attachment;
+	(void)direction;
+	dev_warn(attachment->dev,
+		 "AI engine memory map dma buf is not implemented.\n");
+	return NULL;
+}
+
+static void aie_mem_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				  struct sg_table *table,
+				  enum dma_data_direction direction)
+{
+	/*
+	 * TODO: It is mandatory by DMA buf operation. It is used deallocate
+	 * scatterlist table of an attachment. We don't have the implementation
+	 * for now. And thus it has empty implementation.
+	 */
+	(void)attachment;
+	(void)table;
+	(void)direction;
+	dev_warn(attachment->dev,
+		 "AI engine memory unmap dma buf is not implemented.\n");
+}
+
+static int aie_mem_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct aie_part_mem *pmem = dmabuf->priv;
+	struct aie_mem *mem = &pmem->mem;
+	struct aie_partition *apart = pmem->apart;
+	struct aie_location loc;
+	unsigned long addr = vma->vm_start;
+	unsigned long offset = vma->vm_pgoff * PAGE_SIZE, moffset = 0;
+	unsigned long remainder = vma->vm_end - addr;
+	size_t msize = mem->size;
+
+	if (remainder + offset > pmem->size)
+		return -EINVAL;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	for (loc.col = mem->range.start.col;
+	     loc.col < mem->range.start.col + mem->range.size.col; loc.col++) {
+		for (loc.row = mem->range.start.row;
+		     loc.row < mem->range.start.row + mem->range.size.row;
+		     loc.row++) {
+			unsigned long toffset, len;
+			phys_addr_t mempa;
+			int ret;
+
+			remainder = vma->vm_end - addr;
+			if (!remainder)
+				return 0;
+
+			if (moffset + msize < offset) {
+				moffset += msize;
+				continue;
+			}
+			/*
+			 * calculate offset within the tile memory.
+			 * offset is the offset to vma->start.
+			 * moffset is the tile memory start offset to
+			 * vma->start.
+			 */
+			toffset = offset - moffset;
+			len = msize - toffset;
+			if (len > remainder)
+				len = remainder;
+			mempa = aie_cal_reg_pa(apart->adev, loc,
+					       toffset + mem->offset);
+
+			ret = remap_pfn_range(vma, addr, mempa >> PAGE_SHIFT,
+					      len, vma->vm_page_prot);
+			if (ret) {
+				dev_err(&apart->dev,
+					"failed to mmap (%u,%u)memory, remap failed, 0x%pa, 0x%lx.\n",
+					loc.col, loc.row, &mempa, len);
+				return ret;
+			}
+			addr += len;
+			offset += len;
+			moffset += msize;
+		}
+	}
+	return 0;
+}
+
+static void aie_mem_dmabuf_release(struct dma_buf *dmabuf)
+{
+	struct aie_part_mem *pmem = dmabuf->priv;
+
+	pmem->dbuf = NULL;
+}
+
+static const struct dma_buf_ops aie_mem_dma_buf_ops = {
+	.map_dma_buf = aie_mem_map_dma_buf,
+	.unmap_dma_buf = aie_mem_unmap_dma_buf,
+	.mmap = aie_mem_mmap,
+	.release = aie_mem_dmabuf_release,
+};
+
+/**
+ * aie_mem_create_dmabuf() - creates DMA buffer for AI engine partition
+ *			     memories
+ * @apart: AI engine partition
+ * @pmem: pointer to the partition memory information
+ * @mem: pointer to where it store the memory information and DMA buf file
+ *	 descriptor for user.
+ * @return: 0 for success, negative value for failure
+ *
+ * This function will create DMA buffer for the AI engine partition memory
+ * and will store the DMA buffer file descriptor and memory information in
+ * @mem.
+ */
+static int aie_mem_create_dmabuf(struct aie_partition *apart,
+				 struct aie_part_mem *pmem,
+				 struct aie_mem *mem)
+{
+	struct dma_buf *dmabuf;
+	int ret;
+
+	if (!PAGE_ALIGNED(pmem->mem.size)) {
+		dev_warn(&apart->dev,
+			 "no dmabuf for mem(0x%zx, 0x%zx), not aligned with page size.\n",
+			 pmem->mem.offset, pmem->mem.size);
+		return -EINVAL;
+	}
+
+	dmabuf = pmem->dbuf;
+	if (!dmabuf) {
+		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+
+		exp_info.ops = &aie_mem_dma_buf_ops;
+		exp_info.size = pmem->size;
+		exp_info.flags = O_RDWR;
+		exp_info.priv = pmem;
+
+		dmabuf = dma_buf_export(&exp_info);
+		if (IS_ERR(dmabuf))
+			return PTR_ERR(dmabuf);
+
+		pmem->dbuf = dmabuf;
+	}
+
+	ret = dma_buf_fd(dmabuf, O_CLOEXEC);
+	if (ret < 0) {
+		dev_err(&apart->dev,
+			"dmabuf creation failed, failed to get fd.\n");
+		return ret;
+	}
+	memcpy(mem, &pmem->mem, sizeof(*mem));
+	mem->fd = ret;
+
+	return 0;
+}
+
+/**
+ * aie_mem_get_info() - get AI engine memories information
+ * @apart: AI engine partition
+ * @arg: argument from user to enquire AI engine partition memory information
+ * @return: 0 for success, and negative value for failure
+ *
+ * This function will get the memories information for the specified AI engine
+ * partition. It will create DMA buf file descriptors for the memories and
+ * return the DMA buf file descriptors to users.
+ * It will create a DMA buffer per type of memories.
+ * e.g. There will be a DMA buffer for all the tile program memories in the
+ * partition, and another DMA buffer for all the tile data memories in the
+ * partition.
+ * User can first pass num_mems as 0 in the @arg to enquire for how many types
+ * of memories in this AI engine partition. And then, user can allocate memory
+ * to keep the information for different types of memories, and then use the
+ * same enquiry with non-zero num_mems and none NULL pointer to ask for the
+ * details of the information of all the types of memories in the AI engine
+ * partition.
+ */
+int aie_mem_get_info(struct aie_partition *apart, unsigned long arg)
+{
+	struct aie_mem_args margs;
+	struct aie_mem *mems;
+	unsigned int num_mems, i;
+	int ret;
+
+	if (copy_from_user(&margs, (void __user *)arg, sizeof(margs)))
+		return -EFAULT;
+
+	num_mems = apart->adev->ops->get_mem_info(&apart->range, NULL);
+	if (num_mems <= 0)
+		return -EINVAL;
+
+	if (!margs.num_mems) {
+		struct aie_mem_args __user *umargs_ptr = (void __user *)arg;
+
+		/* This enquiry is to get the number of types of memories. */
+		if (copy_to_user((void __user *)&umargs_ptr->num_mems,
+				 &num_mems, sizeof(num_mems)))
+			return -EFAULT;
+		return 0;
+	}
+
+	if (num_mems != margs.num_mems) {
+		dev_err(&apart->dev,
+			"failed to get mem info, invalid num of mems %d,%d.\n",
+			num_mems, margs.num_mems);
+		return -EINVAL;
+	}
+	if (!margs.mems) {
+		dev_err(&apart->dev,
+			"failed to get mem info, mems pointer is NULL.\n");
+		return -EINVAL;
+	}
+
+	mems = kcalloc(num_mems, sizeof(*mems), GFP_KERNEL);
+	if (!mems)
+		return -ENOMEM;
+
+	/*
+	 * Create DMA buffer for the memories.
+	 * Each type of memory in the partition has its own DMA buf.
+	 */
+	for (i = 0; i < num_mems; i++) {
+		ret = aie_mem_create_dmabuf(apart, &apart->pmems[i], &mems[i]);
+		if (ret)
+			break;
+	}
+	if (!ret) {
+		if (copy_to_user(u64_to_user_ptr(margs.mems), mems,
+				 num_mems * sizeof(mems[0])))
+			ret = -EFAULT;
+	}
+
+	if (ret) {
+		for (i = 0; i < num_mems; i++) {
+			if (mems[i].fd)
+				put_unused_fd(mems[i].fd);
+		}
+	}
+
+	kfree(mems);
+	return ret;
+}
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-part.c b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
index 98f125b..4be6d38 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-part.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
@@ -294,6 +294,8 @@ static long aie_part_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		mutex_unlock(&apart->mlock);
 		break;
 	}
+	case AIE_GET_MEM_IOCTL:
+		return aie_mem_get_info(apart, arg);
 	default:
 		dev_err(&apart->dev, "Invalid ioctl command %u.\n", cmd);
 		ret = -EINVAL;
@@ -337,6 +339,41 @@ static void aie_part_release_device(struct device *dev)
 }
 
 /**
+ * aie_part_create_mems_info() - creates array to store the AI engine partition
+ *				 different memories types information
+ * @apart: AI engine partition
+ * @return: 0 for success, negative value for failure
+ *
+ * This function will create array to store the information of different
+ * memories types in the partition. This array is stored in @apart->pmems.
+ */
+static int aie_part_create_mems_info(struct aie_partition *apart)
+{
+	unsigned int i, num_mems;
+
+	num_mems = apart->adev->ops->get_mem_info(&apart->range, NULL);
+	if (!num_mems)
+		return 0;
+
+	apart->pmems = devm_kcalloc(&apart->dev, num_mems,
+				    sizeof(struct aie_part_mem),
+				    GFP_KERNEL);
+	if (!apart->pmems)
+		return -ENOMEM;
+
+	apart->adev->ops->get_mem_info(&apart->range, apart->pmems);
+	for (i = 0; i < num_mems; i++) {
+		struct aie_mem *mem = &apart->pmems[i].mem;
+
+		apart->pmems[i].apart = apart;
+		apart->pmems[i].size = mem->size *
+				       mem->range.size.col *
+				       mem->range.size.row;
+	}
+	return 0;
+}
+
+/**
  * aie_create_partition() - create AI engine partition instance
  * @adev: AI engine device
  * @range: AI engine partition range to check. A range describes a group
@@ -406,6 +443,16 @@ static struct aie_partition *aie_create_partition(struct aie_device *adev,
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * Create array to keep the information of the different types of tile
+	 * memories information of the AI engine partition.
+	 */
+	ret = aie_part_create_mems_info(apart);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = mutex_lock_interruptible(&adev->mlock);
 	if (ret) {
 		put_device(dev);
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-reset.c b/drivers/misc/xilinx-ai-engine/ai-engine-reset.c
index fc0262f7..d35cd8d 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-reset.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-reset.c
@@ -86,6 +86,43 @@ static void aie_part_set_cols_clkbuf(struct aie_partition *apart, bool enable)
 }
 
 /**
+ * aie_part_clear_mems() - clear memories of every tile in a partition
+ * @apart: AI engine partition
+ */
+static void aie_part_clear_mems(struct aie_partition *apart)
+{
+	struct aie_device *adev = apart->adev;
+	struct aie_part_mem *pmems = apart->pmems;
+	u32 i, num_mems;
+
+	/* Get the number of different types of memories */
+	num_mems = adev->ops->get_mem_info(&apart->range, NULL);
+	if (!num_mems)
+		return;
+
+	/* Clear each type of memories in the partition */
+	for (i = 0; i < num_mems; i++) {
+		struct aie_mem *mem = &pmems[i].mem;
+		struct aie_range *range = &mem->range;
+		u32 c, r;
+
+		for (c = range->start.col;
+		     c < range->start.col + range->size.col; c++) {
+			for (r = range->start.row;
+			     r < range->start.row + range->size.row; r++) {
+				struct aie_location loc;
+				u32 memoff;
+
+				loc.col = c;
+				loc.row = r;
+				memoff = aie_cal_regoff(adev, loc, mem->offset);
+				memset_io(adev->base + memoff, 0, mem->size);
+			}
+		}
+	}
+}
+
+/**
  * aie_part_clean() - reset and clear AI engine partition
  * @apart: AI engine partition
  * @return: 0 for success and negative value for failure
@@ -115,6 +152,7 @@ int aie_part_clean(struct aie_partition *apart)
 	if (ret < 0)
 		return ret;
 
+	aie_part_clear_mems(apart);
 	aie_part_set_cols_clkbuf(apart, false);
 
 	return 0;
diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
index 0f46151..9faeebe 100644
--- a/include/uapi/linux/xlnx-ai-engine.h
+++ b/include/uapi/linux/xlnx-ai-engine.h
@@ -6,6 +6,10 @@
 #ifndef _UAPI_AI_ENGINE_H_
 #define _UAPI_AI_ENGINE_H_
 
+#ifndef __KERNEL__
+#include <stdlib.h>
+#endif
+
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
@@ -42,6 +46,33 @@ struct aie_range {
 };
 
 /**
+ * struct aie_mem - AIE memory information
+ * @range: range of tiles of the memory
+ * @offset: register offset within a tile of the memory
+ * @size: of a the memory in one tile
+ * @fd: file descriptor of the memory
+ */
+struct aie_mem {
+	struct aie_range range;
+	size_t offset;
+	size_t size;
+	int fd;
+};
+
+/**
+ * struct aie_mem_args - AIE memory enquiry arguments
+ * @num_mems: number of "struct aie_mem" elements
+ *	      e.g. two memory information elements, one for tile core memory,
+ *	      and the other for tile data memory.
+ * @mems: array of struct aie_mem which are the AI engine memories
+ *	  information.
+ */
+struct aie_mem_args {
+	unsigned int num_mems;
+	__u64 mems;
+};
+
+/**
  * struct aie_reg_args - AIE access register arguments
  * @op: if this request is to read, write or poll register
  * @mask: mask for mask write, 0 for not mask write
@@ -110,4 +141,23 @@ struct aie_partition_req {
 /* AI engine partition IOCTL operations */
 #define AIE_REG_IOCTL			_IOWR(AIE_IOCTL_BASE, 0x8, \
 					      struct aie_reg_args)
+/**
+ * DOC: AIE_GET_MEM_IOCTL - enquire information of memories in the AI engine
+ *			    partition
+ * This ioctl is used to get the information of all the different types of
+ * memories in the AI engine partition. Application can get the memories
+ * information in two steps:
+ * 1. passing 0 as @num_mems in struct aie_mem_args to enquire the number of
+ *    different memories in the partition, the value will be returned in
+ *    @num_mems.
+ * 2. passing the number of memories in @num_mems and valid pointer as @mems of
+ *    struct aie_mem_args to store the details information of different
+ *    memories. The driver will create DMA buf for each type of memories, and
+ *    will return the memory addressing information along with the DMA buf file
+ *    descriptors in @mems.
+ * After getting the memories information, user can use mmap() with the DMA buf
+ * file descriptor to enable access the memories from userspace.
+ */
+#define AIE_GET_MEM_IOCTL		_IOWR(AIE_IOCTL_BASE, 0x9, \
+					      struct aie_mem_args)
 #endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
