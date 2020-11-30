Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959822C7FAE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEDD89E1D;
	Mon, 30 Nov 2020 08:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819226E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:48:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRm4MZgXt6KF2H9Tj5xKr964rgODX8bxeHJu+ns3RgEA2CZZVOhcIoy6rzxjCdSfQGF3mEnZUiBHEmhlZ+o/woVMbIRpxM+GDI9Wy+4EE7SIyfEFWlLq4wDWOjuvU2saSk4uAWcafCzLvz84TTPHKUVjInXwV3hM/W7G7PujbIJnodsqjDJqWe5pIiI5hFh+l8jyn0cmHV/aR+DC7lASE7JgFDa/1QkTwFxRsC+shvvKhUxZPYpapcrzu77LeXvjYYP3XcCLBinzKrhN7EkQVtaQN3Z9izr3y8ck1Wrn1n3VwCqu4pUChqBncLpML/Qi7F1u7Lw+VzOKH6OrLiW4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTCC27UOTEz5t5EbTOxBY7ycnBjnkW7scevgkAupmCY=;
 b=Ic/ReDHKhSY9AABYQi3BcdrbjsOYJcjv6pGBBezkzF+Y1ZoBrwC7Tgi5TXdR1fjnUaAMFQTFo5HHIYHYzoCXoSz6SueQI9PeXGmSBfRdnJznZwNRFcguyM/lZkkaIAyaE1IEtpK/BL3out2HL4JOI82EMVVN4gnOrN8suDzzIiyOtU34cyzm9AFfAZLxjbYRjqiq5pT0B0wmngnj0b5mRObiMLeblGDpX4mnTX2sfpqtVFWC+pFR2lt2p53XGvLHmAgLN2L00YuWMqvYf2WU7zyaZKaBhCtf9CZNvX6A/0MZlBLaiEUePwecpKavS9ojsvOF+8JqsTgMTZ1co5vhmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTCC27UOTEz5t5EbTOxBY7ycnBjnkW7scevgkAupmCY=;
 b=B7niTUzfG5xhfIjfo5KmPD+YAyf1PKv3n9K/jI7Alc5LQDnm3kwA5o7kzBI0Tfa5T4tuEmM7Aqv3CBrHbljvR6QFq8LgQC9f+BcSKh/6ifLg70hfyT8oRHAsZbumQKfaLpfcvs60XKQ9+k14EXhS6zvZJK1IPJhA00r+rTMeDtU=
Received: from CY4PR03CA0022.namprd03.prod.outlook.com (2603:10b6:903:33::32)
 by SA2PR02MB7530.namprd02.prod.outlook.com (2603:10b6:806:149::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 07:48:44 +0000
Received: from CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::e1) by CY4PR03CA0022.outlook.office365.com
 (2603:10b6:903:33::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 07:48:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT037.mail.protection.outlook.com (10.152.75.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 07:48:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 29 Nov 2020 23:48:31 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
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
 id 1kjdvD-0006Pm-2L; Sun, 29 Nov 2020 23:48:31 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v3 6/9] misc: xilinx-ai-engine: add request and release tiles
Date: Sun, 29 Nov 2020 23:48:22 -0800
Message-ID: <1606722505-16194-7-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11cdcfd4-0d1f-41b4-e0cb-08d895045c8f
X-MS-TrafficTypeDiagnostic: SA2PR02MB7530:
X-Microsoft-Antispam-PRVS: <SA2PR02MB75302A1E38A8531162E7F858B0F50@SA2PR02MB7530.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdJEjxQNL6mKE3ixD1wQXL9L19phLLmSd2MkXK5TZAVbeeIcFHhvgNVLCbZum0IKRYQZqnWiNifI1vsX57+3ESRPd+sxHJO7ZJwRLYqPoRAc8pF/LX0dnbo6KiB23ZZ9St4iOuuhfpcYaNVjw69S0F4db+irCLLq9QuVI86g0jb0r4DUR+TrFVZNTtri9O5hHUh2AB1b/nMOB1UwmTtFEuC+KEvYbNDS64q+CjldDkKL+PeWdmb0D2pVL3hrf5mx1bE8QZfwcurEcOcvDxDfQTwK+eCylvBWw9c0dy244XJsqfMvPBWlIoufCD6on446VMdUyS7SIOq8MgUYeW20EDcU7tMonly5owdEKLZc5jUuRkBz2vV3569+5tkaa/iipMvHcQuyPBNyDazCjXY/zGTNNmBEVyd8fXEoP2bYp5djADmTvbn51/3UIP9Io7az
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39850400004)(136003)(46966005)(70206006)(4326008)(8936002)(70586007)(6666004)(82310400003)(8676002)(36756003)(30864003)(82740400003)(47076004)(83380400001)(5660300002)(356005)(7636003)(426003)(336012)(186003)(921005)(110136005)(2616005)(2906002)(26005)(44832011)(316002)(54906003)(7696005)(6636002)(107886003)(9786002)(7416002)(478600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 07:48:43.7646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cdcfd4-0d1f-41b4-e0cb-08d895045c8f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7530
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

Add request/release and related clock gating functions to AI engine
driver:
* scanning when the partition is being requested to know which tiles
  are in use.
* check if a tile is gated or not
* tiles requesting and releasing ioctl so that user application can
  enable/disable tiles at runtime.

Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 drivers/misc/xilinx-ai-engine/Makefile             |   1 +
 drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 225 +++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 +++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-dev.c      |  19 +-
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h |  34 +++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     |  32 +++
 drivers/misc/xilinx-ai-engine/ai-engine-res.c      |  51 +++++
 include/uapi/linux/xlnx-ai-engine.h                |  31 +++
 8 files changed, 631 insertions(+), 7 deletions(-)
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c

diff --git a/drivers/misc/xilinx-ai-engine/Makefile b/drivers/misc/xilinx-ai-engine/Makefile
index 1b743fa..2e67b25 100644
--- a/drivers/misc/xilinx-ai-engine/Makefile
+++ b/drivers/misc/xilinx-ai-engine/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_XILINX_AIE)	+= xilinx-aie.o
 
 xilinx-aie-$(CONFIG_XILINX_AIE) := ai-engine-aie.o \
+				   ai-engine-clock.o \
 				   ai-engine-dev.o \
 				   ai-engine-dma.o \
 				   ai-engine-mem.o \
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
index ac95aff..ff721b3 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
@@ -41,6 +41,9 @@
 #define AIE_SHIMPL_SHIMRST_MASK			0x1U
 #define AIE_SHIMPL_COLRST_MASK			0x1U
 #define AIE_SHIMPL_CLKCNTR_COLBUF_MASK		0x1U
+#define AIE_SHIMPL_CLKCNTR_NEXTCLK_MASK		BIT(1)
+#define AIE_TILE_CLKCNTR_COLBUF_MASK		BIT(0)
+#define AIE_TILE_CLKCNTR_NEXTCLK_MASK		BIT(1)
 
 /*
  * AI engine SHIM reset ID.
@@ -221,10 +224,232 @@ static int aie_reset_shim(struct aie_device *adev, struct aie_range *range)
 	return 0;
 }
 
+static int aie_init_part_clk_state(struct aie_partition *apart)
+{
+	int ret, num_tiles;
+
+	num_tiles = apart->range.size.col * (apart->range.size.row - 1);
+
+	ret = aie_resource_initialize(&apart->cores_clk_state, num_tiles);
+	if (ret) {
+		dev_err(&apart->dev,
+			"failed to initialize cores clock state resource.\n");
+		return ret;
+	}
+
+	ret = aie_resource_initialize(&apart->tiles_inuse, num_tiles);
+	if (ret) {
+		dev_err(&apart->dev,
+			"failed to initialize tiles in use resource.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int aie_scan_part_clocks(struct aie_partition *apart)
+{
+	struct aie_device *adev = apart->adev;
+	struct aie_range *range = &apart->range;
+	struct aie_location loc;
+
+	/* Clear the bitmap of cores and memories clock state */
+	aie_resource_put_region(&apart->cores_clk_state, 0,
+				apart->cores_clk_state.total);
+
+	for (loc.col = range->start.col;
+	     loc.col < range->start.col + range->size.col;
+	     loc.col++) {
+		for (loc.row = range->start.row;
+		     loc.row < range->start.row + range->size.row - 1;
+		     loc.row++) {
+			void __iomem *va;
+			u32 val, nbitpos;
+
+			/*
+			 * Reading registers of the current tile to see the next
+			 * tile is clock gated.
+			 */
+			nbitpos = loc.col * (range->size.row - 1) + loc.row;
+
+			if (aie_get_tile_type(&loc) != AIE_TILE_TYPE_TILE) {
+				/* Checks shim tile for next core tile */
+				va = adev->base +
+				     aie_cal_regoff(adev, loc,
+						    AIE_SHIMPL_CLKCNTR_REGOFF);
+				val = ioread32(va);
+
+				/*
+				 * check if the clock buffer and the next clock
+				 * tile is set, if one of them is not set, the
+				 * tiles of the column are clock gated.
+				 */
+				if (!(val & AIE_SHIMPL_CLKCNTR_COLBUF_MASK) ||
+				    !(val & AIE_SHIMPL_CLKCNTR_NEXTCLK_MASK))
+					break;
+
+				/* Set next tile in the row clock state on */
+				aie_resource_set(&apart->cores_clk_state,
+						 nbitpos, 1);
+				continue;
+			}
+
+			/* Checks core tile for next tile */
+			va = adev->base +
+			     aie_cal_regoff(adev, loc,
+					    AIE_TILE_CORE_CLKCNTR_REGOFF);
+			val = ioread32(va);
+
+			/*
+			 * If the next tile is gated, skip the rest of the
+			 * column.
+			 */
+			if (!(val & AIE_TILE_CLKCNTR_NEXTCLK_MASK))
+				break;
+
+			aie_resource_set(&apart->cores_clk_state, nbitpos, 1);
+		}
+	}
+
+	/*
+	 * Set the tiles in use bitmap.
+	 * In case of scanning, tiles which are powered on are considered as
+	 * tiles in use.
+	 */
+	bitmap_copy(apart->tiles_inuse.bitmap, apart->cores_clk_state.bitmap,
+		    apart->tiles_inuse.total);
+
+	return 0;
+}
+
+/* aie_set_col_clocks() - set clocks of a range of tiles of a column
+ * @apart: AI engine partition
+ * @range: range of tiles of a column
+ * @enable: true to enable the clock, false to disable
+ * @return: 0 for success, negative value of errors.
+ */
+static int aie_set_col_clocks(struct aie_partition *apart,
+			      struct aie_range *range, bool enable)
+{
+	struct aie_location ploc;
+	u32 startbit;
+
+	/*
+	 * check if the range is of single column. only single column is allowed.
+	 * check if the start row is tile row, only tile rows are allowed.
+	 */
+	if (range->size.col != 1 || range->start.row < 1)
+		return -EINVAL;
+
+	ploc.col = range->start.col;
+	for (ploc.row = range->start.row - 1;
+	     ploc.row < range->start.row + range->size.row - 1;
+	     ploc.row++) {
+		struct aie_device *adev = apart->adev;
+
+		if (!ploc.row) {
+			void __iomem *va;
+			u32 val = 0;
+
+			/*
+			 * Configure SHIM clock registers to gate or
+			 * ungate next tile.
+			 */
+			if (enable)
+				val = AIE_SHIMPL_CLKCNTR_COLBUF_MASK |
+				      AIE_SHIMPL_CLKCNTR_NEXTCLK_MASK;
+			va = adev->base +
+			     aie_cal_regoff(adev, ploc,
+					    AIE_SHIMPL_CLKCNTR_REGOFF);
+			iowrite32(val, va);
+		} else {
+			void __iomem *va;
+			u32 val = 0;
+
+			/*
+			 * Configure core tile clock registers to gate
+			 * or ungate next tile.
+			 */
+			if (enable)
+				val = AIE_TILE_CLKCNTR_COLBUF_MASK |
+				      AIE_TILE_CLKCNTR_NEXTCLK_MASK;
+			va = adev->base +
+			     aie_cal_regoff(adev, ploc,
+					    AIE_TILE_CORE_CLKCNTR_REGOFF);
+			iowrite32(val, va);
+		}
+
+		/* If the tile clock is not on, jump to next column */
+		if (!enable)
+			break;
+	}
+
+	/* Update clock state bitmap */
+	startbit = range->start.col * (apart->range.size.row - 1) +
+		   range->start.row - 1;
+	if (enable)
+		aie_resource_set(&apart->cores_clk_state, startbit,
+				 range->size.row);
+	else
+		aie_resource_clear(&apart->cores_clk_state, startbit,
+				   range->size.row);
+
+	return 0;
+}
+
+static int aie_set_part_clocks(struct aie_partition *apart)
+{
+	struct aie_range *range = &apart->range, lrange;
+	struct aie_location loc;
+
+	/*
+	 * The tiles below the highest tile whose clock is on, need to have the
+	 * clock on. The first for loop is to scan the clock states bitmap to
+	 * see which tiles are required to be clocked on, and update the bitmap
+	 * to make sure the tiles below are also required to be clocked on.
+	 */
+	for (loc.col = range->start.col;
+	     loc.col < range->start.col + range->size.col;
+	     loc.col++) {
+		u32 startbit, inuse_toprow = 0, clk_toprow = 0;
+
+		startbit = loc.col * (range->size.row - 1);
+
+		for (loc.row = range->start.row + 1;
+		     loc.row < range->start.row + range->size.row;
+		     loc.row++) {
+			u32 bit = startbit + loc.row - 1;
+
+			if (aie_resource_testbit(&apart->tiles_inuse, bit))
+				inuse_toprow = loc.row;
+			if (aie_resource_testbit(&apart->cores_clk_state, bit))
+				clk_toprow = loc.row;
+		}
+
+		/* Update clock states of a column */
+		lrange.start.col = loc.col;
+		lrange.size.col = 1;
+		if (inuse_toprow < clk_toprow) {
+			lrange.start.row = inuse_toprow + 1;
+			lrange.size.row = clk_toprow - inuse_toprow;
+			aie_set_col_clocks(apart, &lrange, false);
+		} else  if (inuse_toprow > clk_toprow) {
+			lrange.start.row = clk_toprow + 1;
+			lrange.size.row = inuse_toprow - clk_toprow;
+			aie_set_col_clocks(apart, &lrange, true);
+		}
+	}
+
+	return 0;
+}
+
 static const struct aie_tile_operations aie_ops = {
 	.get_tile_type = aie_get_tile_type,
 	.get_mem_info = aie_get_mem_info,
 	.reset_shim = aie_reset_shim,
+	.init_part_clk_state = aie_init_part_clk_state,
+	.scan_part_clocks = aie_scan_part_clocks,
+	.set_part_clocks = aie_set_part_clocks,
 };
 
 /**
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-clock.c b/drivers/misc/xilinx-ai-engine/ai-engine-clock.c
new file mode 100644
index 0000000..261702b
--- /dev/null
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-clock.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx AI Engine device driver
+ *
+ * Copyright (C) 2020 Xilinx, Inc.
+ */
+
+#include "ai-engine-internal.h"
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+/**
+ * aie_part_get_clk_state_bit() - return bit position of the clock state of a
+ *				  tile
+ * @apart: AI engine partition
+ * @loc: AI engine tile location
+ * @return: bit position for success, negative value for failure
+ */
+static int aie_part_get_clk_state_bit(struct aie_partition *apart,
+				      struct aie_location *loc)
+{
+	if (apart->adev->ops->get_tile_type(loc) != AIE_TILE_TYPE_TILE)
+		return -EINVAL;
+
+	return loc->col * (apart->range.size.row - 1) + loc->row - 1;
+}
+
+/**
+ * aie_part_scan_clk_state() - scan the clock states of tiles of the AI engine
+ *			       partition
+ * @apart: AI engine partition
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will scan the clock status of both the memory and core
+ * modules.
+ */
+int aie_part_scan_clk_state(struct aie_partition *apart)
+{
+	return apart->adev->ops->scan_part_clocks(apart);
+}
+
+/**
+ * aie_part_check_clk_enable_loc() - return if clock of a tile is enabled
+ * @apart: AI engine partition
+ * @loc: AI engine tile location
+ * @return: true for enabled, false for disabled
+ */
+bool aie_part_check_clk_enable_loc(struct aie_partition *apart,
+				   struct aie_location *loc)
+{
+	int bit;
+
+	if (apart->adev->ops->get_tile_type(loc) != AIE_TILE_TYPE_TILE)
+		return true;
+
+	bit = aie_part_get_clk_state_bit(apart, loc);
+	return aie_resource_testbit(&apart->cores_clk_state, bit);
+}
+
+/**
+ * aie_part_request_tiles() - request tiles from an AI engine partition.
+ * @apart: AI engine partition
+ * @num_tiles: number of tiles to request. If it is 0, it means all tiles
+ * @locs: the AI engine tiles locations array which will be requested
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will enable clocks of the specified tiles.
+ */
+static int aie_part_request_tiles(struct aie_partition *apart, int num_tiles,
+				  struct aie_location *locs)
+{
+	if (num_tiles == 0) {
+		aie_resource_set(&apart->tiles_inuse, 0,
+				 apart->tiles_inuse.total);
+	} else {
+		u32 n;
+
+		if (!locs)
+			return -EINVAL;
+
+		for (n = 0; n < num_tiles; n++) {
+			int bit = aie_part_get_clk_state_bit(apart, &locs[n]);
+
+			if (bit >= 0)
+				aie_resource_set(&apart->tiles_inuse, bit, 1);
+		}
+	}
+
+	return apart->adev->ops->set_part_clocks(apart);
+}
+
+/**
+ * aie_part_release_tiles() - release tiles from an AI engine partition.
+ * @apart: AI engine partition
+ * @num_tiles: number of tiles to release. If it is 0, it means all tiles
+ * @locs: the AI engine tiles locations array which will be released
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will disable clocks of the specified tiles.
+ */
+static int aie_part_release_tiles(struct aie_partition *apart, int num_tiles,
+				  struct aie_location *locs)
+{
+	if (num_tiles == 0) {
+		aie_resource_clear(&apart->tiles_inuse, 0,
+				   apart->tiles_inuse.total);
+	} else {
+		u32 n;
+
+		if (!locs)
+			return -EINVAL;
+
+		for (n = 0; n < num_tiles; n++) {
+			int bit = aie_part_get_clk_state_bit(apart, &locs[n]);
+
+			if (bit >= 0)
+				aie_resource_clear(&apart->tiles_inuse, bit, 1);
+		}
+	}
+
+	return apart->adev->ops->set_part_clocks(apart);
+}
+
+/**
+ * aie_part_request_tiles_from_user() - request tiles from an AI engine
+ *					partition from user
+ * @apart: AI engine partition
+ * @user_args: user AI engine request tiles argument
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will request tiles from user request.
+ */
+int aie_part_request_tiles_from_user(struct aie_partition *apart,
+				     void __user *user_args)
+{
+	struct aie_tiles_array args;
+	struct aie_location *locs = NULL;
+	int ret;
+
+	if (copy_from_user(&args, user_args, sizeof(args)))
+		return -EFAULT;
+
+	if (args.num_tiles) {
+		u32 i;
+
+		locs = kmalloc_array(args.num_tiles, sizeof(*locs),
+				     GFP_KERNEL);
+		if (!locs)
+			return -ENOMEM;
+
+		if (copy_from_user(locs, u64_to_user_ptr(args.locs),
+				   args.num_tiles * sizeof(*locs))) {
+			kfree(locs);
+			return -EFAULT;
+		}
+
+		/* update the location to absolute location */
+		for (i = 0; i < args.num_tiles; i++) {
+			if (locs[i].col > apart->range.size.col ||
+			    locs[i].row > apart->range.size.row) {
+				dev_err(&apart->dev,
+					"failed to request tiles, invalid tile(%u,%u).\n",
+					locs[i].col, locs[i].row);
+				kfree(locs);
+				return -EINVAL;
+			}
+			locs[i].col += apart->range.start.col;
+			locs[i].row += apart->range.start.row;
+		}
+	}
+
+	ret = mutex_lock_interruptible(&apart->mlock);
+	if (ret) {
+		kfree(locs);
+		return ret;
+	}
+
+	ret = aie_part_request_tiles(apart, args.num_tiles, locs);
+	mutex_unlock(&apart->mlock);
+
+	kfree(locs);
+	return ret;
+}
+
+/**
+ * aie_part_release_tiles_from_user() - release tiles from an AI engine
+ *					partition from user
+ * @apart: AI engine partition
+ * @user_args: user AI engine request tiles argument
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will release tiles from user request.
+ */
+int aie_part_release_tiles_from_user(struct aie_partition *apart,
+				     void __user *user_args)
+{
+	struct aie_tiles_array args;
+	struct aie_location *locs = NULL;
+	int ret;
+
+	if (copy_from_user(&args, user_args, sizeof(args)))
+		return -EFAULT;
+
+	if (args.num_tiles) {
+		int i;
+
+		locs = kmalloc_array(args.num_tiles, sizeof(*locs),
+				     GFP_KERNEL);
+		if (!locs)
+			return -ENOMEM;
+
+		if (copy_from_user(locs, u64_to_user_ptr(args.locs),
+				   args.num_tiles * sizeof(*locs))) {
+			kfree(locs);
+			return -EFAULT;
+		}
+
+		/* update the location to absolute location */
+		for (i = 0; i < args.num_tiles; i++) {
+			if (locs[i].col > apart->range.size.col ||
+			    locs[i].row > apart->range.size.row) {
+				dev_err(&apart->dev,
+					"failed to release tiles, invalid tile(%u,%u).\n",
+					locs[i].col, locs[i].row);
+				kfree(locs);
+				return -EINVAL;
+			}
+			locs[i].col += apart->range.start.col;
+			locs[i].row += apart->range.start.row;
+		}
+	}
+
+	ret = mutex_lock_interruptible(&apart->mlock);
+	if (ret) {
+		kfree(locs);
+		return ret;
+	}
+
+	ret = aie_part_release_tiles(apart, args.num_tiles, locs);
+	mutex_unlock(&apart->mlock);
+
+	kfree(locs);
+	return ret;
+}
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
index 69f7216..43f4933 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
@@ -204,17 +204,22 @@ struct aie_partition *aie_request_partition(struct aie_device *adev,
 	} else {
 		/*
 		 * TBD:
-		 * 1. setup NOC AXI MM config to only generate error events
-		 *    for slave error and decode error.
-		 * 2. scan to see which tiles have been clock gated.
+		 * setup NOC AXI MM config to only generate error events
+		 * for slave error and decode error.
 		 *
 		 * This needs to be done before the AI engine partition is
 		 * exported for user to access.
 		 */
-		apart->status = XAIE_PART_STATUS_INUSE;
-		apart->cntrflag = req->flag;
-
-		mutex_unlock(&apart->mlock);
+		/* scan to setup the initial clock state for tiles */
+		ret = aie_part_scan_clk_state(apart);
+		if (ret) {
+			mutex_unlock(&apart->mlock);
+			apart = ERR_PTR(ret);
+		} else {
+			apart->status = XAIE_PART_STATUS_INUSE;
+			apart->cntrflag = req->flag;
+			mutex_unlock(&apart->mlock);
+		}
 	}
 	mutex_unlock(&adev->mlock);
 
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
index bf3a09c..131d22a 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
@@ -112,6 +112,22 @@ struct aie_dma_attr {
  * @get_tile_type: get type of tile based on tile operation
  * @get_mem_info: get different types of memories information
  * @reset_shim: reset shim, it will assert and then release SHIM reset
+ * @init_part_clk_state: initialize clock states software structure which is a
+ *			 bitmap for the AI engine partition. The clock states
+ *			 structure is the structure used to keep track of if
+ *			 the modules in the AI engine partition are gated.
+ * @scan_part_clocks: scan partition modules to check whether the modules are
+ *		      clock gated or not, and update the soft clock states
+ *		      structure. It is required to be called when the partition
+ *		      is requested so that the driver knows which modules are
+ *		      clock gated when the partition is requested. This function
+ *		      expects the caller to apply partition lock before calling
+ *		      this function.
+ * @set_part_clocks: set partition modules clocks gate registers based on the
+ *		     partition clock states bitmap. This function expects the
+ *		     caller to apply partition lock before calling this
+ *		     function. The caller function will need to set the bitmap
+ *		     on which tiles are required to be clocked on.
  *
  * Different AI engine device version has its own device
  * operation.
@@ -121,6 +137,9 @@ struct aie_tile_operations {
 	unsigned int (*get_mem_info)(struct aie_range *range,
 				     struct aie_part_mem *pmem);
 	int (*reset_shim)(struct aie_device *adev, struct aie_range *range);
+	int (*init_part_clk_state)(struct aie_partition *apart);
+	int (*scan_part_clocks)(struct aie_partition *apart);
+	int (*set_part_clocks)(struct aie_partition *apart);
 };
 
 /**
@@ -185,6 +204,8 @@ struct aie_device {
  * @range: range of partition
  * @mlock: protection for AI engine partition operations
  * @dev: device for the AI engine partition
+ * @cores_clk_state: bitmap to indicate the power state of core modules
+ * @tiles_inuse: bitmap to indicate if a tile is in use
  * @partition_id: partition id. Partition ID is the identifier
  *		  of the AI engine partition in the system.
  * @status: indicate if the partition is in use
@@ -199,6 +220,8 @@ struct aie_partition {
 	struct aie_range range;
 	struct mutex mlock; /* protection for AI engine partition operations */
 	struct device dev;
+	struct aie_resource cores_clk_state;
+	struct aie_resource tiles_inuse;
 	u32 partition_id;
 	u32 status;
 	u32 cntrflag;
@@ -308,6 +331,9 @@ int aie_resource_check_region(struct aie_resource *res, u32 start,
 int aie_resource_get_region(struct aie_resource *res, u32 start,
 			    u32 count);
 void aie_resource_put_region(struct aie_resource *res, int start, u32 count);
+int aie_resource_set(struct aie_resource *res, u32 start, u32 count);
+int aie_resource_clear(struct aie_resource *res, u32 start, u32 count);
+bool aie_resource_testbit(struct aie_resource *res, u32 bit);
 
 const struct file_operations *aie_part_get_fops(void);
 u8 aie_part_in_use(struct aie_partition *apart);
@@ -331,5 +357,13 @@ long aie_part_set_dmabuf_bd(struct aie_partition *apart,
 			    void __user *user_args);
 void aie_part_release_dmabufs(struct aie_partition *apart);
 
+int aie_part_scan_clk_state(struct aie_partition *apart);
+bool aie_part_check_clk_enable_loc(struct aie_partition *apart,
+				   struct aie_location *loc);
+int aie_part_request_tiles_from_user(struct aie_partition *apart,
+				     void __user *user_args);
+int aie_part_release_tiles_from_user(struct aie_partition *apart,
+				     void __user *user_args);
+
 int aie_device_init(struct aie_device *adev);
 #endif /* AIE_INTERNAL_H */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-part.c b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
index dcfb9ec..54450b6 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-part.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
@@ -94,6 +94,27 @@ static int aie_part_reg_validation(struct aie_partition *apart, size_t offset,
 		return -EINVAL;
 	}
 
+	/*
+	 * We check if a tile is gated before trying to access the tile.
+	 * As we mmap() the registers as read only to enable faster status
+	 * enquiry, and mmap() memories as write/read to faster memory access,
+	 * user can still access the clock gated tiles from userspace by
+	 * accessing the mmapped space.
+	 * Accessing the gated tiles can cause decode error. With PDI flow,
+	 * the PDI sets up the SHIM NOC AXI MM to only generate AI engine error
+	 * even instead of generating the NSU error. but for non PDI flow, as
+	 * the AXI MM register are protected register, until we have EEMI API
+	 * to update the AXI MM register, access the gated tiles can cause NSU
+	 * errors.
+	 * TODO: To solve this, we need to either request EEMI to configure
+	 * AXI MM or split the mmapped space into tiles based lists.
+	 */
+	if (!aie_part_check_clk_enable_loc(apart, &loc)) {
+		dev_err(&apart->dev,
+			"Tile(%u,%d) is gated.\n", loc.col, loc.row);
+		return -EINVAL;
+	}
+
 	if (!is_write)
 		return 0;
 
@@ -304,6 +325,10 @@ static long aie_part_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		return aie_part_detach_dmabuf_req(apart, argp);
 	case AIE_SET_SHIMDMA_DMABUF_BD_IOCTL:
 		return aie_part_set_dmabuf_bd(apart, argp);
+	case AIE_REQUEST_TILES_IOCTL:
+		return aie_part_request_tiles_from_user(apart, argp);
+	case AIE_RELEASE_TILES_IOCTL:
+		return aie_part_release_tiles_from_user(apart, argp);
 	default:
 		dev_err(&apart->dev, "Invalid ioctl command %u.\n", cmd);
 		ret = -EINVAL;
@@ -343,6 +368,7 @@ static void aie_part_release_device(struct device *dev)
 				apart->range.size.col);
 	list_del(&apart->node);
 	mutex_unlock(&adev->mlock);
+	aie_resource_uninitialize(&apart->cores_clk_state);
 	put_device(apart->dev.parent);
 }
 
@@ -466,6 +492,12 @@ static struct aie_partition *aie_create_partition(struct aie_device *adev,
 		return ERR_PTR(ret);
 	}
 
+	ret = adev->ops->init_part_clk_state(apart);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = mutex_lock_interruptible(&adev->mlock);
 	if (ret) {
 		put_device(dev);
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-res.c b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
index 36f08bf..b0c0741 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-res.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
@@ -112,3 +112,54 @@ void aie_resource_put_region(struct aie_resource *res, int start, u32 count)
 		return;
 	bitmap_clear(res->bitmap, start, count);
 }
+
+/**
+ * aie_resource_set() - set the AI engine resource bits
+ * @res: pointer to AI engine resource
+ * @start: start bit to set
+ * @count: number of bits to set
+ * @return: 0 for success and negative value for failure
+ *
+ * This function sets the specified number bits in the resource.
+ */
+int aie_resource_set(struct aie_resource *res, u32 start, u32 count)
+{
+	if (!res || !res->bitmap || !count || start + count > res->total)
+		return -EINVAL;
+
+	bitmap_set(res->bitmap, start, count);
+	return 0;
+}
+
+/**
+ * aie_resource_clear() - clear the AI engine resource bits
+ * @res: pointer to AI engine resource
+ * @start: start bit to set
+ * @count: number of bits to clear
+ * @return: 0 for success and negative value for failure
+ *
+ * This function clears the specified number bits in the resource.
+ */
+int aie_resource_clear(struct aie_resource *res, u32 start, u32 count)
+{
+	if (!res || !res->bitmap || !count || start + count > res->total)
+		return -EINVAL;
+
+	bitmap_clear(res->bitmap, start, count);
+	return 0;
+}
+
+/**
+ * aie_resource_testbit() - test if a bit is set in a AI engine resource
+ * @res: pointer to AI engine resource
+ * @bit: bit to check
+ * @return: true for set, false for not set
+ */
+bool aie_resource_testbit(struct aie_resource *res, u32 bit)
+{
+	if (!res || !res->bitmap || bit >= res->total)
+		return false;
+
+	/* Locate the unsigned long the required bit belongs to */
+	return test_bit(bit, res->bitmap);
+}
diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
index 75d9dbf..a090550 100644
--- a/include/uapi/linux/xlnx-ai-engine.h
+++ b/include/uapi/linux/xlnx-ai-engine.h
@@ -146,6 +146,16 @@ struct aie_dmabuf_bd_args {
 	__u32 bd_id;
 };
 
+/**
+ * struct aie_tiles_array - AIE tiles array
+ * @locs: tiles locations array. An array of struct aie_location.
+ * @num_tiles: number of tiles in the tiles locations array
+ */
+struct aie_tiles_array {
+	__u64 locs;
+	__u32 num_tiles;
+};
+
 #define AIE_IOCTL_BASE 'A'
 
 /* AI engine device IOCTL operations */
@@ -204,4 +214,25 @@ struct aie_dmabuf_bd_args {
 #define AIE_SET_SHIMDMA_DMABUF_BD_IOCTL	_IOW(AIE_IOCTL_BASE, 0x10, \
 					     struct aie_dmabuf_bd_args)
 
+/**
+ * DOC: AIE_REQUEST_TILES_IOCTL - request AI engine tiles
+ *
+ * This ioctl is used to request tiles.
+ * When requested the AI engine partition, the kernel driver will scan the
+ * partition to track which tiles are enabled or not. After that, if user
+ * want to request for more tiles, it will use this ioctl to request more
+ * tiles.
+ * If the aie_tiles_array is empty, it means it will request for all tiles
+ * in the partition.
+ */
+#define AIE_REQUEST_TILES_IOCTL		_IOW(AIE_IOCTL_BASE, 0xe, \
+					     struct aie_tiles_array)
+
+/**
+ * DOC: AIE_RELEASE_TILES_IOCTL - release AI engine tiles
+ *
+ * This ioctl is used to release tiles
+ */
+#define AIE_RELEASE_TILES_IOCTL		_IOW(AIE_IOCTL_BASE, 0xf, \
+					     struct aie_tiles_array)
 #endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
