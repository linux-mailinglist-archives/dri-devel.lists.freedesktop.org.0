Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5022B8D35
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36B46E52E;
	Thu, 19 Nov 2020 08:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2ED6E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 23:48:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgPn4GlW6hqiysEoBB8entG2u6qyeDWG8gw7h/qRDg5/yKu7PCs94Ro40d79WCDfnQ4YOyJcGKOgEuyOzSIjcB/jedRFL9oZjdBwPzzDcS+YRY3Vzn+RFgiXtQ8xyqZ5c0oJ9eoMI+VzOmHnR/Gan/xBWdW0WswcCeiOz9WDMKLadP6GrRtHq6FDj3hldP83eezgZzl2S8CkIDam5V0anDhZRQ0AMi+9/h6DHvqQMoeoHgKyN4laxEaHL5H93Jn4gxsRh6Sd/nKLQsEJN55Ro9TrOBlI7hULAvXkIN3sbHDImYdLaUyoTvYLXjAr2Ri6rovNLwRDHiihNL+3ZokYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIoL8cL9tr8UQ3SJA8o91PY4KJ0/n3ZymvIvjTjleos=;
 b=Zpu3YzYpIX2mjGNMTSQsfYrV2HjuesURh2HAToWw/zUXgoCSklvquMiu22mZyq6GD/zvW3FZVjU53nw7zbz/3n6/wo5v0+vuIWpJmelzElq90/BuGhhju9MAHKynLDZiLTHPBjSEgxOez21yq0mIJdjlsZTXLvGqcofj/9R6nEL5v88PeI/JEEdSlLaCpDaN6Jtati9QUW4zsxMR0IZ0hnBVYqeH+SZwvLJMPqQcAm8LtOIzk7X5CV8JK/M6Bv3Qs16eaN23syXOY0gIRZk2Xbni5DpegUdYKSS2Zd+KkWiOtdIQ5l5H3R+GXcCi595JERIYNfX5HJpVEu7gEj3ozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIoL8cL9tr8UQ3SJA8o91PY4KJ0/n3ZymvIvjTjleos=;
 b=MvPdf1nWJWjY9LIZM/7jN74GXxIGoF2ixlYhugdTQx1bGbrpbdJAMxptuksP24WAQjuDAHY/k+Cm+4w/Rk1hH70CzkETj6Y22PLQfz74ozBwi2WAiOZkWryZLHHK/a4NRBi8p8q2w1Hyqx8J3Qm742IXnJzji71ciT1h9dYO4+U=
Received: from SA9PR03CA0009.namprd03.prod.outlook.com (2603:10b6:806:20::14)
 by DM6PR02MB7036.namprd02.prod.outlook.com (2603:10b6:5:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 23:48:29 +0000
Received: from SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:20:cafe::b6) by SA9PR03CA0009.outlook.office365.com
 (2603:10b6:806:20::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Wed, 18 Nov 2020 23:48:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT038.mail.protection.outlook.com (10.152.72.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 23:48:28 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 15:48:11 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 15:48:11 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, wendy.liang@xilinx.com, robh+dt@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=36324 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kfXBL-0000Wz-AH; Wed, 18 Nov 2020 15:48:11 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v2 5/9] misc: xilinx-ai-engine: add setting shim dma bd
 operation
Date: Wed, 18 Nov 2020 15:48:05 -0800
Message-ID: <1605743289-26575-6-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
References: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c766f371-21cf-44e2-0810-08d88c1c7300
X-MS-TrafficTypeDiagnostic: DM6PR02MB7036:
X-Microsoft-Antispam-PRVS: <DM6PR02MB70362B042E783DE16D8AE703B0E10@DM6PR02MB7036.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Brv2difI6KyFyOPC0eNqtdbP1NLbswCCBTyJduNBwvmSgldEW8z3M/NvKSkyUv8SsyeKQvnT8V0HCFLcfIwxMzYgLTmARMuDlI0emtUmD75My83NSgon0BmIk4u7+wNfhp9QznJV8Qpm0hti45EHX0X5KdXUqdCcVNY4DbstWeTRdh/6MHWSTAfQPt18zF+RQ0yT5ZPk+iLVdOM3uLiWlrIUeBjjKX0yzFWHD7KoC2Zs0lNHq1JfL48GX2aSM8Ug95JD6lxrPaTX/+Hb9qPbYV4mYw6tWN2rmieiolIghzV/TZ0VD1FMlao3+cWPh6JO7foXNxRLlS6NxB8G7uw4F6r8i2QoTg4HNgNNM6V4E8bdJ/wFd+uBKA/+3QMqXkc7H704XNRQWatjL4gNalK5vKHexMJWvJcxNO0GPzMMxC86inEcpJTQPSUU1PdyWDX3
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966005)(7636003)(44832011)(47076004)(82740400003)(70206006)(4326008)(6666004)(36756003)(6636002)(2906002)(5660300002)(30864003)(356005)(70586007)(107886003)(8676002)(8936002)(9786002)(7416002)(336012)(26005)(426003)(7696005)(54906003)(316002)(478600001)(921005)(36906005)(186003)(110136005)(83380400001)(2616005)(82310400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 23:48:28.8470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c766f371-21cf-44e2-0810-08d88c1c7300
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7036
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
 dri-devel@lists.freedesktop.org, Wendy Liang <wendy.liang@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add operation to set SHIM DMA buffer descriptor.

The following operations are added to set the buffer descriptors:
* attach DMA buffer which enables AI engine device to access the DMA
  buffer memory
* detach DMA buffer which disables AI engine device to access the DMA
  buffer memory
* set DMA buffer descriptor, which takes buffer descriptor contents
  pointer, the dmabuf fd, and the offset to the start of dmabuf as
  as argument. It validates the dmabuf and the offset and size of the
  buffer. And then it calculates the DMA address of the buffer and set
  the buffer descriptor content to the hardware DMA buffer descriptor.

The main logic to control what's go into the buffer descriptor and which
buffer descriptor to use is in the userspace AI engine library.

Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 drivers/misc/xilinx-ai-engine/Makefile             |   1 +
 drivers/misc/xilinx-ai-engine/ai-engine-aie.c      |  19 +
 drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h |  45 ++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     |  17 +
 include/uapi/linux/xlnx-ai-engine.h                |  43 ++
 6 files changed, 606 insertions(+)
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c

diff --git a/drivers/misc/xilinx-ai-engine/Makefile b/drivers/misc/xilinx-ai-engine/Makefile
index 2dbed42..1b743fa 100644
--- a/drivers/misc/xilinx-ai-engine/Makefile
+++ b/drivers/misc/xilinx-ai-engine/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_XILINX_AIE)	+= xilinx-aie.o
 
 xilinx-aie-$(CONFIG_XILINX_AIE) := ai-engine-aie.o \
 				   ai-engine-dev.o \
+				   ai-engine-dma.o \
 				   ai-engine-mem.o \
 				   ai-engine-part.o \
 				   ai-engine-res.o \
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
index 7fce2f00..19c262d 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
@@ -107,6 +107,24 @@ static const struct aie_single_reg_field aie_col_clkbuf = {
 	.regoff = AIE_SHIMPL_CLKCNTR_REGOFF,
 };
 
+static const struct aie_dma_attr aie_shimdma = {
+	.laddr = {
+		.mask = 0xffffffffU,
+		.regoff = 0U,
+	},
+	.haddr = {
+		.mask = 0xffff0000U,
+		.regoff = 0x8U,
+	},
+	.buflen = {
+		.mask = 0xffffffffU,
+		.regoff = 0x4U,
+	},
+	.bd_regoff = 0x0001d000U,
+	.num_bds = 16,
+	.bd_len = 0x14U,
+};
+
 static u32 aie_get_tile_type(struct aie_location *loc)
 {
 	if (loc->row)
@@ -232,6 +250,7 @@ int aie_device_init(struct aie_device *adev)
 	adev->kernel_regs = aie_kernel_regs;
 	adev->col_rst = &aie_col_rst;
 	adev->col_clkbuf = &aie_col_clkbuf;
+	adev->shim_dma = &aiev1_shimdma;
 
 	/* Get the columns resource */
 	/* Get number of columns from AI engine memory resource */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-dma.c b/drivers/misc/xilinx-ai-engine/ai-engine-dma.c
new file mode 100644
index 0000000..007bec4
--- /dev/null
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-dma.c
@@ -0,0 +1,481 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx AI Engine driver DMA implementation
+ *
+ * Copyright (C) 2020 Xilinx, Inc.
+ */
+
+#include "ai-engine-internal.h"
+#include <linux/dma-buf.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/refcount.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+
+/**
+ * struct aie_dmabuf - AI engine dmabuf information
+ * @attach: dmabuf attachment pointer
+ * @sgt: scatter/gather table
+ * @refs: refcount of the attached aie_dmabuf
+ * @node: list node
+ */
+struct aie_dmabuf {
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	refcount_t refs;
+	struct list_head node;
+};
+
+/**
+ * aie_part_find_dmabuf() - find a attached dmabuf
+ * @apart: AI engine partition
+ * @dmabuf: pointer to dmabuf
+ * @return: pointer to AI engine dmabuf struct of the found dmabuf, if dmabuf
+ *	    is not found, returns NULL.
+ *
+ * This function scans all the attached dmabufs to see the input dmabuf is
+ * in the list. if it is attached, return the corresponding struct aie_dmabuf
+ * pointer.
+ */
+static struct aie_dmabuf *
+aie_part_find_dmabuf(struct aie_partition *apart, struct dma_buf *dmabuf)
+{
+	struct aie_dmabuf *adbuf;
+
+	list_for_each_entry(adbuf, &apart->dbufs, node) {
+		if (dmabuf == adbuf->attach->dmabuf)
+			return adbuf;
+	}
+
+	return NULL;
+}
+
+/**
+ * aie_part_get_dmabuf_da_from_off() - get DMA address from offset to a dmabuf
+ * @apart: AI engine partition
+ * @dmabuf_fd: dmabuf file descriptor
+ * @off: offset to the start of a dmabuf
+ * @len: memory length
+ * @return: dma address, or 0 if @off or @len is invalid, or if @dmabuf_fd is
+ *	    not attached.
+ *
+ * This function returns DMA address if has been mapped to a dmabuf which has
+ * been attached to the AI engine partition.
+ */
+static dma_addr_t
+aie_part_get_dmabuf_da_from_off(struct aie_partition *apart, int dmabuf_fd,
+				u64 off, size_t len)
+{
+	struct dma_buf *dbuf = dma_buf_get(dmabuf_fd);
+	struct aie_dmabuf *adbuf;
+
+	if (IS_ERR(dbuf)) {
+		dev_err(&apart->dev,
+			"failed to get dma address, not able to get dmabuf from %d.\n",
+			dmabuf_fd);
+		return 0;
+	}
+
+	adbuf = aie_part_find_dmabuf(apart, dbuf);
+	dma_buf_put(dbuf);
+	if (!adbuf) {
+		dev_err(&apart->dev,
+			"failed to get dma address, dmabuf %d not attached.\n",
+			dmabuf_fd);
+		return 0;
+	}
+
+	if (off >= dbuf->size || off + len >= dbuf->size) {
+		dev_err(&apart->dev,
+			"failed to get dma address from buf %d, off=0x%llx, len=0x%zx.\n",
+			dmabuf_fd, off, len);
+		return 0;
+	}
+
+	return sg_dma_address(adbuf->sgt->sgl) + off;
+}
+
+/**
+ * aie_part_set_shimdma_bd() - Set the buffer descriptor to AI engine partition
+ *			       hardware
+ * @apart: AI engine partition
+ * @loc: AI engine tile location
+ * @bd_id: buffer descriptor ID
+ * @bd: pointer buffer descriptor content
+ * @return: 0 for success, negative value for failure
+ *
+ * This function sets the specified buffer descriptor content to the
+ * specified buffer descriptor in the specified AI engine SHIM NOC tile.
+ */
+static int aie_part_set_shimdma_bd(struct aie_partition *apart,
+				   struct aie_location loc, u32 bd_id, u32 *bd)
+{
+	const struct aie_dma_attr *shim_dma = apart->adev->shim_dma;
+	struct aie_location loc_adjust;
+	u32 i, regoff, intile_regoff;
+
+	intile_regoff = shim_dma->bd_regoff + shim_dma->bd_len * bd_id;
+	loc_adjust.col = loc.col + apart->range.start.col;
+	loc_adjust.row = loc.row + apart->range.start.row;
+	regoff = aie_cal_regoff(apart->adev, loc_adjust, intile_regoff);
+
+	for (i = 0; i < shim_dma->bd_len / (sizeof(*bd));
+	     i++, regoff += sizeof(*bd))
+		iowrite32(bd[i], apart->adev->base + regoff);
+	return 0;
+}
+
+/**
+ * aie_part_validate_bdloc() - Validate SHIM DMA buffer descriptor location
+ * @apart: AI engine partition
+ * @loc: tile location
+ * @bd_id: buffer descriptor id
+ *
+ * @return: 0 for success, negative value for failure
+ *
+ * This function validate the SHIM DMA buffer descriptor base address.
+ */
+static int aie_part_validate_bdloc(struct aie_partition *apart,
+				   struct aie_location loc, u32 bd_id)
+{
+	const struct aie_dma_attr *shim_dma = apart->adev->shim_dma;
+	struct aie_location loc_adjust;
+	u32 ttype;
+
+	loc_adjust.col = loc.col + apart->range.start.col;
+	loc_adjust.row = loc.row + apart->range.start.row;
+
+	if (aie_validate_location(apart, loc_adjust) < 0) {
+		dev_err(&apart->dev,
+			"invalid loc (%u,%u) in (%u,%u).\n",
+			loc.col, loc.row,
+			apart->range.size.col, apart->range.size.row);
+		return -EINVAL;
+	}
+
+	ttype = apart->adev->ops->get_tile_type(&loc_adjust);
+	if (ttype != AIE_TILE_TYPE_SHIMNOC) {
+		dev_err(&apart->dev,
+			"failed to set bd, (%u,%u) is not SHIM NOC\n",
+			loc.col, loc.row);
+		return -EINVAL;
+	}
+
+	if (bd_id >= shim_dma->num_bds) {
+		dev_err(&apart->dev,
+			"invalid SHIM DMA bd id: %u.\n", bd_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * aie_part_attach_dmabuf() - Attach dmabuf to an AI engine
+ * @apart: AI engine partition
+ * @dbuf: pointer to the DMA buffer to attach
+ * @return: pointer to AI engine dmabuf structure for success, or error value
+ *	    for failure
+ *
+ * This function attaches a dmabuf to the specified AI engine partition.
+ */
+static struct aie_dmabuf *aie_part_attach_dmabuf(struct aie_partition *apart,
+						 struct dma_buf *dbuf)
+{
+	struct aie_dmabuf *adbuf;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+
+	attach = dma_buf_attach(dbuf, &apart->dev);
+	if (IS_ERR(attach)) {
+		dev_err(&apart->dev, "failed to attach dmabuf\n");
+		return ERR_CAST(attach);
+	}
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		dev_err(&apart->dev, "failed to map dmabuf attachment\n");
+		dma_buf_detach(dbuf, attach);
+		return ERR_CAST(sgt);
+	}
+
+	if (sgt->nents != 1) {
+		dma_addr_t next_sg_addr = sg_dma_address(sgt->sgl);
+		struct scatterlist *s;
+		unsigned int i;
+
+		for_each_sg(sgt->sgl, s, sgt->nents, i) {
+			if (sg_dma_address(s) != next_sg_addr) {
+				dev_err(&apart->dev,
+					"dmabuf not contiguous\n");
+				dma_buf_unmap_attachment(attach, sgt,
+							 attach->dir);
+				dma_buf_detach(dbuf, attach);
+				return ERR_PTR(-EINVAL);
+			}
+
+			next_sg_addr = sg_dma_address(s) + sg_dma_len(s);
+		}
+	}
+
+	adbuf = devm_kzalloc(&apart->dev, sizeof(*adbuf), GFP_KERNEL);
+	if (!adbuf) {
+		dma_buf_unmap_attachment(attach, sgt, attach->dir);
+		dma_buf_detach(dbuf, attach);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	adbuf->attach = attach;
+	/*
+	 * dmabuf attachment doesn't always include the sgt, store it in
+	 * AI engine dma buf structure.
+	 */
+	adbuf->sgt = sgt;
+
+	refcount_set(&adbuf->refs, 1);
+
+	list_add(&adbuf->node, &apart->dbufs);
+	return adbuf;
+}
+
+/**
+ * aie_part_dmabuf_attach_get() - Get reference to an dmabuf attachment
+ * @adbuf: AI engine partition attached dmabuf
+ *
+ * This call will increase the reference count by 1
+ */
+static void aie_part_dmabuf_attach_get(struct aie_dmabuf *adbuf)
+{
+	refcount_inc(&adbuf->refs);
+}
+
+/**
+ * aie_part_dmabuf_attach_put() - Put reference to an dmabuf attachment
+ * @adbuf: AI engine partition attached dmabuf
+ *
+ * This call will decrease the reference count by 1. If the refcount reaches
+ * 0, it will detach the dmabuf.
+ */
+static void aie_part_dmabuf_attach_put(struct aie_dmabuf *adbuf)
+{
+	struct dma_buf *dbuf;
+
+	if (!refcount_dec_and_test(&adbuf->refs))
+		return;
+
+	dbuf = adbuf->attach->dmabuf;
+	dma_buf_unmap_attachment(adbuf->attach, adbuf->sgt, adbuf->attach->dir);
+	dma_buf_detach(dbuf, adbuf->attach);
+	dma_buf_put(dbuf);
+	list_del(&adbuf->node);
+}
+
+/**
+ * aie_part_release_dmabufs() - detach all the attached dmabufs from partition
+ * @apart: AI engine partition
+ */
+void aie_part_release_dmabufs(struct aie_partition *apart)
+{
+	struct aie_dmabuf *adbuf, *tmpadbuf;
+
+	list_for_each_entry_safe(adbuf, tmpadbuf, &apart->dbufs, node) {
+		struct dma_buf *dbuf = adbuf->attach->dmabuf;
+
+		dma_buf_unmap_attachment(adbuf->attach, adbuf->sgt,
+					 adbuf->attach->dir);
+		dma_buf_detach(dbuf, adbuf->attach);
+		dma_buf_put(dbuf);
+		list_del(&adbuf->node);
+		devm_kfree(&apart->dev, adbuf);
+	}
+}
+
+/**
+ * aie_part_attach_dmabuf_req() - Handle attaching dmabuf to an AI engine
+ *				  partition request
+ * @apart: AI engine partition
+ * @user_args: user AI engine dmabuf argument
+ *
+ * @return: 0 for success, negative value for failure
+ *
+ * This function attaches a dmabuf to the specified AI engine partition and map
+ * the attachment. It checks if the dmabuf is already attached, if it is not
+ * attached, attach it. It returns the number of entries of the attachment to
+ * the AI engine dmabuf user argument. If user wants to know the sg list, it
+ * can use AI engine get sg ioctl.
+ */
+long aie_part_attach_dmabuf_req(struct aie_partition *apart,
+				void __user *user_args)
+{
+	struct aie_dmabuf *adbuf;
+	struct dma_buf *dbuf;
+	long ret;
+	int dmabuf_fd = (int)(uintptr_t)user_args;
+
+	dbuf = dma_buf_get(dmabuf_fd);
+	if (IS_ERR(dbuf)) {
+		dev_err(&apart->dev, "failed to get dmabuf from %d.\n",
+			dmabuf_fd);
+		return PTR_ERR(dbuf);
+	}
+
+	ret = mutex_lock_interruptible(&apart->mlock);
+	if (ret) {
+		dma_buf_put(dbuf);
+		return ret;
+	}
+
+	adbuf = aie_part_find_dmabuf(apart, dbuf);
+	if (!adbuf)
+		adbuf = aie_part_attach_dmabuf(apart, dbuf);
+	else
+		aie_part_dmabuf_attach_get(adbuf);
+
+	mutex_unlock(&apart->mlock);
+
+	if (IS_ERR(adbuf)) {
+		dev_err(&apart->dev, "failed to attach dmabuf\n");
+		dma_buf_put(dbuf);
+		return PTR_ERR(adbuf);
+	}
+
+	return 0;
+}
+
+/**
+ * aie_part_detach_dmabuf_req() - Handle detaching dmabuf from an AI engine
+ *				  partition request
+ * @apart: AI engine partition
+ * @user_args: user AI engine dmabuf argument
+ *
+ * @return: 0 for success, negative value for failure
+ *
+ * This function unmaps and detaches a dmabuf from the specified AI engine
+ * partition.
+ */
+long aie_part_detach_dmabuf_req(struct aie_partition *apart,
+				void __user *user_args)
+{
+	int dmabuf_fd;
+	struct dma_buf *dbuf;
+	struct aie_dmabuf *adbuf;
+	int ret;
+
+	dmabuf_fd = (int)(uintptr_t)user_args;
+
+	dbuf = dma_buf_get(dmabuf_fd);
+	if (IS_ERR(dbuf)) {
+		dev_err(&apart->dev, "failed to get dmabuf %d.\n", dmabuf_fd);
+		return PTR_ERR(dbuf);
+	}
+
+	ret = mutex_lock_interruptible(&apart->mlock);
+	if (ret) {
+		dma_buf_put(dbuf);
+		return ret;
+	}
+
+	adbuf = aie_part_find_dmabuf(apart, dbuf);
+	dma_buf_put(dbuf);
+	if (!adbuf) {
+		dev_err(&apart->dev, "failed to find dmabuf %d.\n", dmabuf_fd);
+		mutex_unlock(&apart->mlock);
+		return -EINVAL;
+	}
+
+	aie_part_dmabuf_attach_put(adbuf);
+
+	mutex_unlock(&apart->mlock);
+
+	return 0;
+}
+
+/**
+ * aie_part_set_dmabuf_bd() - Set AI engine SHIM DMA dmabuf buffer descriptor
+ * @apart: AI engine partition
+ * @user_args: user AI engine dmabuf argument
+ *
+ * @return: 0 for success, negative value for failure
+ *
+ * This function set the user specified buffer descriptor into the SHIM DMA
+ * buffer descriptor. The buffer descriptor contained in the @user_args has the
+ * offset to the start of the buffer descriptor.
+ */
+long aie_part_set_dmabuf_bd(struct aie_partition *apart,
+			    void __user *user_args)
+{
+	struct aie_device *adev = apart->adev;
+	const struct aie_dma_attr *shim_dma = adev->shim_dma;
+	struct aie_dmabuf_bd_args args;
+	u32 *bd, *tmpbd, len, laddr, haddr, regval;
+	u64 off;
+	dma_addr_t addr;
+	int ret;
+
+	if (copy_from_user(&args, user_args, sizeof(args)))
+		return -EFAULT;
+
+	ret = aie_part_validate_bdloc(apart, args.loc, args.bd_id);
+	if (ret) {
+		dev_err(&apart->dev, "invalid SHIM DMA BD reg address.\n");
+		return -EINVAL;
+	}
+
+	bd = memdup_user((void __user *)args.bd, shim_dma->bd_len);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
+
+	regval = bd[shim_dma->buflen.regoff / sizeof(u32)];
+	len = aie_get_reg_field(&shim_dma->buflen, regval);
+	if (!len) {
+		dev_err(&apart->dev, "no buf length from shim dma bd.\n");
+		kfree(bd);
+		return -EINVAL;
+	}
+
+	/* Get low 32bit address offset */
+	tmpbd = (u32 *)((char *)bd + shim_dma->laddr.regoff);
+	laddr = *tmpbd & shim_dma->laddr.mask;
+	/* Get high 32bit address offset */
+	tmpbd = (u32 *)((char *)bd + shim_dma->haddr.regoff);
+	haddr = *tmpbd & shim_dma->haddr.mask;
+	off = laddr | ((u64)haddr << 32);
+
+	ret = mutex_lock_interruptible(&apart->mlock);
+	if (ret) {
+		kfree(bd);
+		return ret;
+	}
+
+	/* Get device address from offset */
+	addr = aie_part_get_dmabuf_da_from_off(apart, args.buf_fd, off, len);
+	if (!addr) {
+		dev_err(&apart->dev, "invalid buffer 0x%llx, 0x%x.\n",
+			off, len);
+		mutex_unlock(&apart->mlock);
+		kfree(bd);
+		return -EINVAL;
+	}
+
+	/* Set low 32bit address */
+	laddr = lower_32_bits(addr);
+	tmpbd = (u32 *)((char *)bd + shim_dma->laddr.regoff);
+	*tmpbd &= ~shim_dma->laddr.mask;
+	*tmpbd |= aie_get_field_val(&shim_dma->laddr, laddr);
+
+	/* Set high 32bit address */
+	haddr = upper_32_bits(addr);
+	tmpbd = (u32 *)((char *)bd + shim_dma->haddr.regoff);
+	*tmpbd &= ~shim_dma->haddr.mask;
+	*tmpbd |= aie_get_field_val(&shim_dma->haddr, haddr);
+
+	ret = aie_part_set_shimdma_bd(apart, args.loc, args.bd_id, bd);
+	mutex_unlock(&apart->mlock);
+	if (ret)
+		dev_err(&apart->dev, "failed to set to shim dma bd.\n");
+
+	kfree(bd);
+	return ret;
+}
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
index e84610b..bf3a09c 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
@@ -90,6 +90,24 @@ struct aie_part_mem {
 };
 
 /**
+ * struct aie_dma_attr - AI engine DMA attributes structure
+ * @laddr: low address field attributes
+ * @haddr: high address field attributes
+ * @buflen: buffer length field attributes
+ * @bd_regoff: SHIM DMA buffer descriptors register offset
+ * @num_bds: number of buffer descriptors
+ * @bd_len: length of a buffer descriptor in bytes
+ */
+struct aie_dma_attr {
+	struct aie_single_reg_field laddr;
+	struct aie_single_reg_field haddr;
+	struct aie_single_reg_field buflen;
+	u32 bd_regoff;
+	u32 num_bds;
+	u32 bd_len;
+};
+
+/**
  * struct aie_tile_operations - AI engine device operations
  * @get_tile_type: get type of tile based on tile operation
  * @get_mem_info: get different types of memories information
@@ -127,6 +145,7 @@ struct aie_resource {
  * @ops: tile operations
  * @col_rst: column reset attribute
  * @col_clkbuf: column clock buffer attribute
+ * @shim_dma: SHIM DMA attribute
  * @size: size of the AI engine address space
  * @array_shift: array address shift
  * @col_shift: column address shift
@@ -147,6 +166,7 @@ struct aie_device {
 	const struct aie_tile_operations *ops;
 	const struct aie_single_reg_field *col_rst;
 	const struct aie_single_reg_field *col_clkbuf;
+	const struct aie_dma_attr *shim_dma;
 	size_t size;
 	struct aie_resource cols_res;
 	u32 array_shift;
@@ -159,6 +179,7 @@ struct aie_device {
 /**
  * struct aie_partition - AI engine partition structure
  * @node: list node
+ * @dbufs: dmabufs list
  * @adev: pointer to AI device instance
  * @pmems: pointer to partition memories types
  * @range: range of partition
@@ -172,6 +193,7 @@ struct aie_device {
  */
 struct aie_partition {
 	struct list_head node;
+	struct list_head dbufs;
 	struct aie_device *adev;
 	struct aie_part_mem *pmems;
 	struct aie_range range;
@@ -229,6 +251,20 @@ static inline u32 aie_get_field_val(const struct aie_single_reg_field *field,
 }
 
 /**
+ * aie_get_reg_field() - get value from a field from a register valuer
+ * @field: a field in a register
+ * @regval: register value
+ * @return: value of a register field
+ */
+static inline u32 aie_get_reg_field(const struct aie_single_reg_field *field,
+				    u32 regval)
+{
+	long long mask64 = (long long)field->mask & 0x00000000ffffffff;
+
+	return (regval & field->mask) >> __bf_shf(mask64);
+}
+
+/**
  * aie_cal_regoff() - calculate register offset to the whole AI engine
  *		      device start address
  * @adev: AI engine device
@@ -286,5 +322,14 @@ int aie_part_clean(struct aie_partition *apart);
 
 int aie_mem_get_info(struct aie_partition *apart, unsigned long arg);
 
+long aie_part_attach_dmabuf_req(struct aie_partition *apart,
+				void __user *user_args);
+long aie_part_detach_dmabuf_req(struct aie_partition *apart,
+				void __user *user_args);
+long aie_part_set_bd(struct aie_partition *apart, void __user *user_args);
+long aie_part_set_dmabuf_bd(struct aie_partition *apart,
+			    void __user *user_args);
+void aie_part_release_dmabufs(struct aie_partition *apart);
+
 int aie_device_init(struct aie_device *adev);
 #endif /* AIE_INTERNAL_H */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-part.c b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
index 4be6d38..dcfb9ec 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-part.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
@@ -8,6 +8,7 @@
 #include <linux/cdev.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -221,6 +222,7 @@ static int aie_part_release(struct inode *inode, struct file *filp)
 	if (ret)
 		return ret;
 
+	aie_part_release_dmabufs(apart);
 	aie_part_clean(apart);
 
 	apart->status = 0;
@@ -296,6 +298,12 @@ static long aie_part_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	}
 	case AIE_GET_MEM_IOCTL:
 		return aie_mem_get_info(apart, arg);
+	case AIE_ATTACH_DMABUF_IOCTL:
+		return aie_part_attach_dmabuf_req(apart, argp);
+	case AIE_DETACH_DMABUF_IOCTL:
+		return aie_part_detach_dmabuf_req(apart, argp);
+	case AIE_SET_SHIMDMA_DMABUF_BD_IOCTL:
+		return aie_part_set_dmabuf_bd(apart, argp);
 	default:
 		dev_err(&apart->dev, "Invalid ioctl command %u.\n", cmd);
 		ret = -EINVAL;
@@ -422,6 +430,7 @@ static struct aie_partition *aie_create_partition(struct aie_device *adev,
 		return ERR_PTR(-ENOMEM);
 
 	apart->adev = adev;
+	INIT_LIST_HEAD(&apart->dbufs);
 	memcpy(&apart->range, range, sizeof(*range));
 	mutex_init(&apart->mlock);
 
@@ -443,6 +452,10 @@ static struct aie_partition *aie_create_partition(struct aie_device *adev,
 		return ERR_PTR(ret);
 	}
 
+	/* Set up the DMA mask */
+	dev->coherent_dma_mask = DMA_BIT_MASK(48);
+	dev->dma_mask = &dev->coherent_dma_mask;
+
 	/*
 	 * Create array to keep the information of the different types of tile
 	 * memories information of the AI engine partition.
@@ -521,6 +534,10 @@ of_aie_part_probe(struct aie_device *adev, struct device_node *nc)
 	apart->dev.of_node = nc;
 	apart->partition_id = partition_id;
 
+	ret = of_dma_configure(&apart->dev, nc, true);
+	if (ret)
+		dev_warn(&apart->dev, "Failed to configure DMA.\n");
+
 	dev_info(&adev->dev,
 		 "AI engine part(%u,%u),(%u,%u), id %u is probed successfully.\n",
 		 range.start.col, range.start.row,
diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
index 5e40d00..9080f57 100644
--- a/include/uapi/linux/xlnx-ai-engine.h
+++ b/include/uapi/linux/xlnx-ai-engine.h
@@ -129,6 +129,21 @@ struct aie_partition_req {
 	__u32 flag;
 };
 
+/**
+ * struct aie_dmabuf_bd_args - AIE dmabuf buffer descriptor information
+ * @bd: DMA buffer descriptor, within the buffer descriptor, the address field
+ *	will be the offset to the start of the dmabuf
+ * @buf_fd: DMA buffer handler which is dmabuf file descriptor
+ * @loc: Tile location relative to the start of a partition
+ * @bd_id: buffer descriptor id
+ */
+struct aie_dmabuf_bd_args {
+	__u32 *bd;
+	struct aie_location loc;
+	int buf_fd;
+	__u32 bd_id;
+};
+
 #define AIE_IOCTL_BASE 'A'
 
 /* AI engine device IOCTL operations */
@@ -159,4 +174,32 @@ struct aie_partition_req {
  */
 #define AIE_GET_MEM_IOCTL		_IOWR(AIE_IOCTL_BASE, 0x9, \
 					      struct aie_mem_args)
+/**
+ * DOC: AIE_ATTACH_DMABUF_IOCTL - attach a dmabuf to AI engine partition
+ *
+ * This ioctl is used to attach a dmabuf to the AI engine partition. AI engine
+ * partition will return the number of scatter gather list elements of the
+ * dmabuf.
+ */
+#define AIE_ATTACH_DMABUF_IOCTL		_IOR(AIE_IOCTL_BASE, 0xa, int)
+
+/**
+ * DOC: AIE_DETACH_DMABUF_IOCTL - dettach a dmabuf from AI engine partition
+ *
+ * This ioctl is used to detach a dmabuf from the AI engine partition
+ */
+#define AIE_DETACH_DMABUF_IOCTL		_IOR(AIE_IOCTL_BASE, 0xb, int)
+
+/**
+ * DOC: AIE_SET_SHIMDMA_DMABUF_BD_IOCTL - set buffer descriptor which contains
+ *					  dmabuf to SHIM DMA
+ *
+ * This ioctl is used to set the buffer descriptor to SHIM DMA. The
+ * aie_dmabuf_bd_args contains the dmabuf fd and the buffer descriptor contents.
+ * The address field in the buffer descriptor contents should be the offset to
+ * the start of the dmabuf.
+ */
+#define AIE_SET_SHIMDMA_DMABUF_BD_IOCTL	_IOW(AIE_IOCTL_BASE, 0x10, \
+					     struct aie_dmabuf_bd_args)
+
 #endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
