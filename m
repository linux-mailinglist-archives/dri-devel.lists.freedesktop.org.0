Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A01AFBD68
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D11110E56B;
	Mon,  7 Jul 2025 21:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="T8e7Vv7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E5310E300
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 01:32:27 +0000 (UTC)
X-UUID: 3b66e4645ad211f0b33aeb1e7f16c2b6-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VueyM64I9DP5jDN6y1xvAKCuj1i0ljp2QLN62vlUH+c=; 
 b=T8e7Vv7D2uB8nSWlBeWSgMr4zYqTIm09dm5PKJGSS/XqKtsJ8NPhZD7goV6F1kBaSki9h9YQmuTHnQEvwx4LF/BSuq8/rA7JqwbJdBIVeqE8INN/68elsPrMkt1bK4wDGu1TsUkfnyL/zoTNNIa1dw3/7Du7qbJ15p7oIZIc3Pg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:fa6e4abc-7185-4acc-a37a-e7ff71656bc1, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:9eb4ff7, CLOUDID:39dcf073-15a7-4ae6-ad4b-94c27b45c266,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3b66e4645ad211f0b33aeb1e7f16c2b6-20250707
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <shangyao.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1041078030; Mon, 07 Jul 2025 09:32:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:32:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:32:21 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 05/13] media: platform: mediatek: add isp_7x seninf unit
Date: Mon, 7 Jul 2025 09:31:46 +0800
Message-ID: <20250707013154.4055874-6-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 07 Jul 2025 21:23:55 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "shangyao.lin" <shangyao.lin@mediatek.com>

Introduce support for the MediaTek sensor interface (seninf) in the SoC camera
subsystem, focusing on CSI and stream control. The driver manages parameter
control, metering, status tracking, and interrupt handling for the camera sensor
interface hardware. It integrates with the MediaTek ISP CAMSYS, bridging camera
sensors and the ISP system, and provides V4L2 framework support for dynamic
stream configuration and virtual channel management.

---

Changes in v2:
 * Various fixes per review comments
 * Merged v1's 02/10 and 03/10 into a single patch

---

Question for AngeloGioacchino Del Regno:

Hi Angelo,

Thank you very much for your previous feedback. I have noticed some suggestions
to refactor the register read/write operations to use the regmap API. I would
like to ask: what are the main benefits of switching to regmap, and is it
recommended to convert all register accesses to use regmap for this driver?

If this is the preferred approach, I will update all register operations to use
regmap in v3.

Thank you for your guidance and advice!

Best regards,
Shangyao

---

Note:
The PHY operations have been refactored and separated from the seninf driver,
but there are still some issues to confirm with reviewers in this v2 patch
(dt-bindings: media: mediatek: add seninf-core binding). The PHY part will be
moved to drivers/phy/mediatek/ in v3.

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../isp_7x/camsys/kd_imgsensor_define_v4l2.h  |   86 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-def.h    |  237 ++
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.c    | 1441 ++++++++++++
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.h    |   16 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-hw.h     |  108 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-if.h     |   24 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-regs.h   |   44 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.c  |  279 +++
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.h  |   20 +
 .../isp/isp_7x/camsys/mtk_cam-seninf.h        |  161 ++
 .../isp_7x/camsys/mtk_csi_phy_2_0/Makefile    |    5 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h   |  679 ++++++
 .../mtk_cam-seninf-csi0-cphy.h                |   51 +
 .../mtk_cam-seninf-csi0-dphy.h                |   98 +
 .../mtk_cam-seninf-hw_phy_2_0.c               | 1932 +++++++++++++++++
 .../mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h  |  165 ++
 .../mtk_cam-seninf-seninf1-csi2.h             |  264 +++
 .../mtk_cam-seninf-seninf1-mux.h              |  120 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h  |   46 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h      |   43 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h |   76 +
 21 files changed, 5895 insertions(+)
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
new file mode 100755
index 000000000000..54c23afe64bd
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef _KD_IMGSENSOR_DATA_V4L2_H
+#define _KD_IMGSENSOR_DATA_V4L2_H
+
+enum VC_FEATURE {
+	VC_NONE = 0,
+	VC_MIN_NUM,
+	VC_RAW_DATA = VC_MIN_NUM,
+	VC_RAW_DATA_MAX,
+
+	VC_PDAF_MIN_NUM = VC_RAW_DATA_MAX,
+	VC_PDAF_STATS = VC_PDAF_MIN_NUM,
+	VC_PDAF_STATS_NE,
+	VC_PDAF_STATS_ME,
+	VC_PDAF_STATS_SE,
+	VC_PDAF_STATS_PIX_1,
+	VC_PDAF_STATS_PIX_2,
+	VC_PDAF_STATS_NE_PIX_1 = VC_PDAF_STATS_PIX_1,
+	VC_PDAF_STATS_NE_PIX_2 = VC_PDAF_STATS_PIX_2,
+	VC_PDAF_STATS_ME_PIX_1,
+	VC_PDAF_STATS_ME_PIX_2,
+	VC_PDAF_STATS_SE_PIX_2,
+	VC_PDAF_MAX_NUM,
+
+	VC_HDR_MIN_NUM = VC_PDAF_MAX_NUM,
+	VC_HDR_MVHDR = VC_HDR_MIN_NUM,
+	VC_HDR_MAX_NUM,
+
+	VC_3HDR_MIN_NUM = VC_HDR_MAX_NUM,
+	VC_3HDR_EMBEDDED = VC_3HDR_MIN_NUM,
+	VC_3HDR_FLICKER,
+	VC_3HDR_Y,
+	VC_3HDR_AE,
+	VC_3HDR_MAX_NUM,
+
+	VC_STAGGER_MIN_NUM = VC_3HDR_MAX_NUM,
+	VC_STAGGER_EMBEDDED = VC_STAGGER_MIN_NUM,
+	VC_STAGGER_NE,
+	VC_STAGGER_ME,
+	VC_STAGGER_SE,
+	VC_STAGGER_MAX_NUM,
+
+	VC_YUV_MIN_NUM = VC_STAGGER_MAX_NUM,
+	VC_YUV_Y = VC_YUV_MIN_NUM,
+	VC_YUV_UV,
+	VC_YUV_MAX_NUM,
+
+	VC_RAW_EXT_MIN_NUM = VC_YUV_MAX_NUM,
+	VC_RAW_W_DATA = VC_RAW_EXT_MIN_NUM,
+	VC_RAW_PROCESSED_DATA,
+	VC_RAW_EXT_MAX_NUM,
+
+	VC_GENERAL_DATA_MIN_NUM = VC_RAW_EXT_MAX_NUM,
+	VC_GENERAL_EMBEDDED = VC_GENERAL_DATA_MIN_NUM,
+	VC_GENERAL_DATA_MAX_NUM,
+
+	VC_MAX_NUM = VC_GENERAL_DATA_MAX_NUM,
+};
+
+enum {
+	PAD_SINK = 0,
+	PAD_SRC_RAW0,
+	PAD_SRC_RAW1,
+	PAD_SRC_RAW2,
+	PAD_SRC_RAW_W0,
+	PAD_SRC_RAW_EXT0,
+	PAD_SRC_PDAF0,
+	PAD_SRC_PDAF1,
+	PAD_SRC_PDAF2,
+	PAD_SRC_PDAF3,
+	PAD_SRC_PDAF4,
+	PAD_SRC_PDAF5,
+	PAD_SRC_PDAF6,
+	PAD_SRC_HDR0,
+	PAD_SRC_HDR1,
+	PAD_SRC_HDR2,
+	PAD_SRC_GENERAL0,
+	PAD_MAXCNT,
+	PAD_ERR = 0xffff,
+};
+
+#endif              /* _KD_IMGSENSOR_DATA_H */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
new file mode 100755
index 000000000000..39f6005c8227
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
@@ -0,0 +1,237 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2022 MediaTek Inc.
+
+#ifndef __MTK_CAM_SENINF_DEF_H__
+#define __MTK_CAM_SENINF_DEF_H__
+
+#include <linux/bitfield.h>
+
+#define SENINF_VC_MAXCNT 8
+#define SENINF_DEF_PIXEL_MODE 2
+
+#define SENINF_CLK_MARGIN_IN_PERCENT 0
+#define HW_BUF_EFFECT 10
+
+#define SENINF_HS_TRAIL_EN_CONDITION 1450000000
+#define SENINF_TIMESTAMP_CLK 1000
+#define ISP_CLK_LOW 273000000
+
+#define SENINF_CPHY_SETTLE_DELAY_DT 0x10
+#define SENINF_DPHY_SETTLE_DELAY_DT 0x10
+#define SENINF_SETTLE_DELAY_CK 0x11
+#define SENINF_HS_TRAIL_PARAMETER 0x34
+
+#define SENSOR_CLOCK_POLARITY_HIGH	0
+#define SENSOR_CLOCK_POLARITY_LOW	1
+#define NUM_PORTS			2
+#define DEFAULT_WIDTH			1600
+#define DEFAULT_HEIGHT			1200
+#define CSI_PORT_A_MASK GENMASK(3, 1)
+#define SENINF_MAX_STREAM 7
+
+// offset define
+#define ANA_CSI_RX_PORT0_OFFSET   0x0000
+#define ANA_CSI_RX_PORT0B_OFFSET  0x1000
+#define ANA_CSI_RX_PORT1_OFFSET   0x4000
+#define ANA_CSI_RX_PORT1B_OFFSET  0x5000
+#define ANA_CSI_RX_PORT2_OFFSET   0x8000
+#define ANA_CSI_RX_PORT2B_OFFSET  0x9000
+#define ANA_CSI_RX_PORT3_OFFSET   0xC000
+#define ANA_CSI_RX_PORT3B_OFFSET  0xD000
+
+#define ANA_DPHY_TOP_PORT0_OFFSET 0x2000
+#define ANA_DPHY_TOP_PORT1_OFFSET 0x6000
+#define ANA_DPHY_TOP_PORT2_OFFSET 0xA000
+#define ANA_DPHY_TOP_PORT3_OFFSET 0xE000
+
+#define ANA_CPHY_TOP_PORT0_OFFSET 0x3000
+#define ANA_CPHY_TOP_PORT1_OFFSET 0x7000
+#define ANA_CPHY_TOP_PORT2_OFFSET 0xB000
+#define ANA_CPHY_TOP_PORT3_OFFSET 0xF000
+
+#define IF_CTRL_BASE_OFFSET       0x0200
+#define IF_TG_BASE_OFFSET         0x0F00
+#define IF_CSI2_BASE_OFFSET       0x0A00
+#define IF_MUX_BASE_OFFSET        0x0D00
+#define IF_CAM_MUX_OFFSET         0x0400
+#define IF_PORT_STRIDE            0x1000
+
+enum CSI_PORT {
+	CSI_PORT_0 = 0,
+	CSI_PORT_1,
+	CSI_PORT_2,
+	CSI_PORT_3,
+	CSI_PORT_4,
+	CSI_PORT_5,
+	CSI_PORT_0A,
+	CSI_PORT_0B,
+	CSI_PORT_1A,
+	CSI_PORT_1B,
+	CSI_PORT_2A,
+	CSI_PORT_2B,
+	CSI_PORT_3A,
+	CSI_PORT_3B,
+	CSI_PORT_4A,
+	CSI_PORT_4B,
+	CSI_PORT_5A,
+	CSI_PORT_5B,
+	CSI_PORT_MAX_NUM,
+};
+
+#define SENINF_CSI_PORT_NAMES \
+	"0", \
+	"1", \
+	"2", \
+	"3", \
+	"4", \
+	"5", \
+	"0A", \
+	"0B", \
+	"1A", \
+	"1B", \
+	"2A", \
+	"2B", \
+	"3A", \
+	"3B", \
+	"4A", \
+	"4B", \
+	"5A", \
+	"5B", \
+
+enum SENINF_PHY_VER_ENUM {
+	SENINF_PHY_2_0,
+	SENINF_PHY_VER_NUM,
+};
+
+#define MTK_CSI_PHY_VERSIONS "mtk_csi_phy_2_0"
+
+enum SENINF_ENUM {
+	SENINF_1,
+	SENINF_2,
+	SENINF_3,
+	SENINF_4,
+	SENINF_5,
+	SENINF_6,
+	SENINF_7,
+	SENINF_8,
+	SENINF_9,
+	SENINF_10,
+	SENINF_11,
+	SENINF_12,
+	SENINF_NUM,
+};
+
+enum SENINF_MUX_ENUM {
+	SENINF_MUX1,
+	SENINF_MUX2,
+	SENINF_MUX3,
+	SENINF_MUX4,
+	SENINF_MUX5,
+	SENINF_MUX6,
+	SENINF_MUX7,
+	SENINF_MUX8,
+	SENINF_MUX9,
+	SENINF_MUX10,
+	SENINF_MUX11,
+	SENINF_MUX12,
+	SENINF_MUX13,
+	SENINF_MUX_NUM,
+	SENINF_MUX_ERROR = -1,
+};
+
+enum SENINF_CAM_MUX_ENUM {
+	SENINF_CAM_MUX0,
+	SENINF_CAM_MUX1,
+	SENINF_CAM_MUX2,
+	SENINF_CAM_MUX3,
+	SENINF_CAM_MUX4,
+	SENINF_CAM_MUX5,
+	SENINF_CAM_MUX6,
+	SENINF_CAM_MUX7,
+	SENINF_CAM_MUX8,
+	SENINF_CAM_MUX9,
+	SENINF_CAM_MUX10,
+	SENINF_CAM_MUX11,
+	SENINF_CAM_MUX12,
+	SENINF_CAM_MUX13,
+	SENINF_CAM_MUX14,
+	SENINF_CAM_MUX15,
+	SENINF_CAM_MUX_NUM,
+	SENINF_CAM_MUX_ERR = 0xff
+};
+
+/* 0:CSI2(2.5G), 3: parallel, 8:NCSI2(1.5G) */
+enum SENINF_SOURCE_ENUM {
+	CSI2 = 0x0,
+	TEST_MODEL = 0x1,
+	CCIR656	= 0x2,
+	PARALLEL_SENSOR = 0x3,
+	SERIAL_SENSOR = 0x4,
+	HD_TV = 0x5,
+	EXT_CSI2_OUT1 = 0x6,
+	EXT_CSI2_OUT2 = 0x7,
+	MIPI_SENSOR = 0x8,
+	VIRTUAL_CHANNEL_1 = 0x9,
+	VIRTUAL_CHANNEL_2 = 0xA,
+	VIRTUAL_CHANNEL_3 = 0xB,
+	VIRTUAL_CHANNEL_4 = 0xC,
+	VIRTUAL_CHANNEL_5 = 0xD,
+	VIRTUAL_CHANNEL_6 = 0xE,
+};
+
+enum SENINF_CSI2_ENUM {
+	CSI2_1_5G = 0x0,
+	CSI2_2_5G = 0x1,
+	CSI2_2_5G_CPHY = 0x2,
+};
+
+enum TG_FORMAT_ENUM {
+	FMT_RAW_8BIT = 0x0,
+	FMT_RAW_10BIT = 0x1,
+	FMT_RAW_12BIT = 0x2,
+	FMT_YUV422 = 0x3,
+	FMT_RAW_14BIT = 0x4,
+	FMT_RGB565_MIPI	= 0x5,
+	FMT_RGB888_MIPI	= 0x6,
+	FMT_JPEG = 0x7
+};
+
+enum {
+	CLK_CAM_SENINF = 0,
+	CLK_TOP_SENINF,
+	CLK_TOP_SENINF1,
+	CLK_TOP_SENINF2,
+	CLK_TOP_SENINF3,
+	CLK_TOP_SENINF4,
+	CLK_TOP_SENINF5,
+	CLK_TOP_SENINF_END,
+	CLK_TOP_CAMTM = CLK_TOP_SENINF_END,
+	CLK_MAXCNT,
+};
+
+#define SENINF_CLK_NAMES \
+	"clk_cam_seninf", \
+	"clk_top_seninf", \
+	"clk_top_seninf1", \
+	"clk_top_seninf2", \
+	"clk_top_seninf3", \
+	"clk_top_seninf4", \
+	"clk_top_seninf5", \
+	"clk_top_camtm", \
+
+static const int seninf_csi[CSI_PORT_MAX_NUM] = {
+    [CSI_PORT_0]  = SENINF_1,
+    [CSI_PORT_0A] = SENINF_1,
+    [CSI_PORT_0B] = SENINF_2,
+    [CSI_PORT_1]  = SENINF_3,
+    [CSI_PORT_1A] = SENINF_3,
+    [CSI_PORT_1B] = SENINF_4,
+    [CSI_PORT_2]  = SENINF_5,
+    [CSI_PORT_2A] = SENINF_5,
+    [CSI_PORT_2B] = SENINF_6,
+    [CSI_PORT_3]  = SENINF_7,
+    [CSI_PORT_3A] = SENINF_7,
+    [CSI_PORT_3B] = SENINF_8,
+};
+
+#endif /* __MTK_CAM_SENINF_DEF_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
new file mode 100755
index 000000000000..4e447ba0aec7
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
@@ -0,0 +1,1441 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/slab.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/clk.h>
+#include <linux/of_graph.h>
+#include <linux/of_irq.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/pm_opp.h>
+#include <linux/regulator/consumer.h>
+#include <linux/nvmem-consumer.h>
+
+#include <linux/videodev2.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-seninf-def.h"
+#include "mtk_cam-seninf.h"
+#include "mtk_cam-seninf-hw.h"
+#include "mtk_cam-seninf-route.h"
+#include "kd_imgsensor_define_v4l2.h"
+
+#define sd_to_ctx(__sd) container_of(__sd, struct seninf_ctx, subdev)
+#define notifier_to_ctx(__n) container_of(__n, struct seninf_ctx, notifier)
+#define ctrl_hdl_to_ctx(__h) container_of(__h, struct seninf_ctx, ctrl_handler)
+
+static const char * const csi_port_names[] = {
+	SENINF_CSI_PORT_NAMES
+};
+
+static const char * const clk_names[] = {
+	SENINF_CLK_NAMES
+};
+
+static const char * const set_reg_names[] = {
+	SET_REG_KEYS_NAMES
+};
+
+enum REG_OPS_CMD {
+	REG_OPS_CMD_ID,
+	REG_OPS_CMD_CSI,
+	REG_OPS_CMD_RG,
+	REG_OPS_CMD_VAL,
+	REG_OPS_CMD_MAX_NUM,
+};
+
+static int seninf_core_pm_runtime_enable(struct seninf_core *core)
+{
+	int i, ret;
+
+	core->pm_domain_cnt = of_count_phandle_with_args(core->dev->of_node,
+							 "power-domains",
+							 "#power-domain-cells");
+	if (core->pm_domain_cnt == 1) {
+		pm_runtime_enable(core->dev);
+	} else if (core->pm_domain_cnt > 1) {
+		core->pm_domain_devs =
+			devm_kcalloc(core->dev, core->pm_domain_cnt,
+				     sizeof(*core->pm_domain_devs), GFP_KERNEL);
+
+		if (!core->pm_domain_devs)
+			return -ENOMEM;
+
+		for (i = 0; i < core->pm_domain_cnt; i++) {
+			core->pm_domain_devs[i] =
+				dev_pm_domain_attach_by_id(core->dev, i);
+
+			if (IS_ERR(core->pm_domain_devs[i])) {
+				ret = PTR_ERR(core->pm_domain_devs[i]);
+
+				dev_info(core->dev,
+					 "%s: fail to probe pm id: %d (%d)\n",
+					 __func__, i, ret);
+
+				goto detach_pm;
+			}
+		}
+	}
+
+	return 0;
+
+detach_pm:
+	for (--i; i >= 0; i--)
+		dev_pm_domain_detach(core->pm_domain_devs[i], true);
+
+	return ret;
+}
+
+static int seninf_core_pm_runtime_disable(struct seninf_core *core)
+{
+	int i;
+
+	if (core->pm_domain_cnt == 1) {
+		pm_runtime_disable(core->dev);
+	} else {
+		if (!core->pm_domain_devs)
+			return -EINVAL;
+
+		for (i = 0; i < core->pm_domain_cnt; i++) {
+			if (core->pm_domain_devs[i])
+				dev_pm_domain_detach(core->pm_domain_devs[i], 1);
+		}
+	}
+
+	return 0;
+}
+
+static int seninf_core_pm_runtime_get_sync(struct seninf_core *core)
+{
+	int ret, i;
+
+	/* for one pm_domain */
+	if (core->pm_domain_cnt == 1) {
+		ret = pm_runtime_resume_and_get(core->dev);
+		if (ret < 0) {
+			dev_info(core->dev, "fail to resume seninf_core\n");
+			return ret;
+		}
+
+		return 0;
+	}
+
+	if (!core->pm_domain_devs)
+		return -EINVAL;
+
+	/* more than one pm_domain */
+	for (i = 0; i < core->pm_domain_cnt; i++) {
+		if (core->pm_domain_devs[i]) {
+			ret = pm_runtime_resume_and_get(core->pm_domain_devs[i]);
+			if (ret < 0) {
+				dev_info(core->dev,
+					 "fail to resume pm_domain_devs(%d)\n", i);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int seninf_core_pm_runtime_put(struct seninf_core *core)
+{
+	int i;
+
+	if (core->pm_domain_cnt == 1) {
+		pm_runtime_put_sync(core->dev);
+	} else {
+		if (!core->pm_domain_devs || core->pm_domain_cnt < 1)
+			return -EINVAL;
+
+		for (i = core->pm_domain_cnt - 1; i >= 0; i--) {
+			if (core->pm_domain_devs[i])
+				pm_runtime_put_sync(core->pm_domain_devs[i]);
+		}
+	}
+
+	return 0;
+}
+
+static irqreturn_t mtk_irq_seninf(int irq, void *data)
+{
+	mtk_cam_seninf_irq_handler(irq, data);
+	return IRQ_HANDLED;
+}
+
+static int get_seninf_cfg(struct device *dev, struct seninf_core *core)
+{
+	int ret;
+	const char *ver;
+
+	ret = of_property_read_string(dev->of_node, "mtk_csi_phy_ver", &ver);
+	if (ret) {
+		dev_err(dev,
+			"Fail to get mtk_csi_phy_ver property (err=%d)\n", ret);
+
+		return ret;
+	}
+
+	if (!strcasecmp(ver, MTK_CSI_PHY_VERSIONS)) {
+		dev_info(dev, "%s: mtk_csi_phy_ver = %s\n", __func__, ver);
+
+		of_property_read_u32(dev->of_node, "seninf_num",
+				     &g_seninf_cfg->seninf_num);
+		of_property_read_u32(dev->of_node, "mux_num",
+				     &g_seninf_cfg->mux_num);
+		of_property_read_u32(dev->of_node, "cam_mux_num",
+				     &g_seninf_cfg->cam_mux_num);
+		of_property_read_u32(dev->of_node, "pref_mux_num",
+				     &g_seninf_cfg->pref_mux_num);
+
+		dev_info(dev,
+			 "%s: seninf_num = %d, mux_num = %d, cam_mux_num = %d, pref_mux_num =%d\n",
+			 __func__,
+			 g_seninf_cfg->seninf_num,
+			 g_seninf_cfg->mux_num,
+			 g_seninf_cfg->cam_mux_num,
+			 g_seninf_cfg->pref_mux_num);
+
+		return 0;
+	}
+
+	dev_err(dev, "DTS seninf config not correct.\n");
+
+	return -1;
+}
+
+static int seninf_core_probe(struct platform_device *pdev)
+{
+	int i, ret, irq;
+	struct resource *res;
+	struct seninf_core *core;
+	struct device *dev = &pdev->dev;
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, core);
+	core->dev = dev;
+	mutex_init(&core->mutex);
+	INIT_LIST_HEAD(&core->list);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "base");
+	core->reg_if = devm_ioremap_resource(dev, res);
+	if (IS_ERR(core->reg_if))
+		return PTR_ERR(core->reg_if);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ana-rx");
+	core->reg_ana = devm_ioremap_resource(dev, res);
+	if (IS_ERR(core->reg_ana))
+		return PTR_ERR(core->reg_ana);
+
+	ret = get_seninf_cfg(dev, core);
+	if (ret) {
+		dev_err(dev, "failed to get seninf ops\n");
+		return ret;
+	}
+	mtk_cam_seninf_init_res(core);
+
+	spin_lock_init(&core->spinlock_irq);
+	irq = platform_get_irq(pdev, 0);
+	if (!irq) {
+		dev_err(dev, "failed to get irq\n");
+		return -ENODEV;
+	}
+
+	ret = devm_request_irq(dev, irq, mtk_irq_seninf, 0,
+			       dev_name(dev), core);
+	if (ret) {
+		dev_err(dev, "failed to request irq=%d\n", irq);
+		return ret;
+	}
+
+	/* default platform properties */
+	core->cphy_settle_delay_dt = SENINF_CPHY_SETTLE_DELAY_DT;
+	core->dphy_settle_delay_dt = SENINF_DPHY_SETTLE_DELAY_DT;
+	core->settle_delay_ck = SENINF_SETTLE_DELAY_CK;
+	core->hs_trail_parameter = SENINF_HS_TRAIL_PARAMETER;
+
+	/* read platform properties from device tree */
+	of_property_read_u32(dev->of_node, "cphy_settle_delay_dt",
+			     &core->cphy_settle_delay_dt);
+	of_property_read_u32(dev->of_node, "dphy_settle_delay_dt",
+			     &core->dphy_settle_delay_dt);
+	of_property_read_u32(dev->of_node, "settle_delay_ck",
+			     &core->settle_delay_ck);
+	of_property_read_u32(dev->of_node, "hs_trail_parameter",
+			     &core->hs_trail_parameter);
+
+	core->dfs.cnt = 0;
+	core->dfs.reg = NULL;
+
+	ret = seninf_core_pm_runtime_enable(core);
+	if (ret) {
+		dev_info(dev, "failed to enable seninf_core_pm_runtime\n");
+		return ret;
+	}
+
+	for (i = 0; i < CLK_MAXCNT; i++) {
+		core->clk[i] = devm_clk_get(dev, clk_names[i]);
+		if (IS_ERR(core->clk[i])) {
+			dev_info(dev, "failed to get %s\n", clk_names[i]);
+			core->clk[i] = NULL;
+			/* ignore not define seninf */
+		}
+	}
+
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret) {
+		dev_info(dev, "%s: failed to create sub devices\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void seninf_core_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct seninf_core *core = dev_get_drvdata(dev);
+
+	of_platform_depopulate(dev);
+	seninf_core_pm_runtime_disable(core);
+}
+
+static const struct of_device_id seninf_core_of_match[] = {
+	{ .compatible = "mediatek,mt8188-seninf-core" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, seninf_core_of_match);
+
+struct platform_driver seninf_core_pdrv = {
+	.probe	= seninf_core_probe,
+	.remove	= seninf_core_remove,
+	.driver	= {
+		.name = "seninf-core",
+		.of_match_table = seninf_core_of_match,
+	},
+};
+
+static int get_csi_port(struct device *dev, int *port)
+{
+	int i, ret;
+	const char *name;
+
+	ret = of_property_read_string(dev->of_node, "csi-port", &name);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CSI_PORT_MAX_NUM; i++) {
+		if (!strcasecmp(name, csi_port_names[i])) {
+			*port = i;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+static int seninf_subscribe_event(struct v4l2_subdev *sd,
+				  struct v4l2_fh *fh,
+				  struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static void init_fmt(struct seninf_ctx *ctx)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->fmt); i++) {
+		ctx->fmt[i].format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+		ctx->fmt[i].format.width = DEFAULT_WIDTH;
+		ctx->fmt[i].format.height = DEFAULT_HEIGHT;
+		ctx->fmt[i].format.field = V4L2_FIELD_NONE;
+		ctx->fmt[i].format.colorspace = V4L2_COLORSPACE_SRGB;
+		ctx->fmt[i].format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+		ctx->fmt[i].format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+		ctx->fmt[i].format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ctx->vcinfo.vc); i++)
+		ctx->vcinfo.vc[i].pixel_mode = SENINF_DEF_PIXEL_MODE;
+}
+
+static int dev_read_csi_efuse(struct seninf_ctx *ctx)
+{
+	struct nvmem_cell *cell;
+	size_t len = 0;
+	u32 *buf;
+
+	ctx->m_csi_efuse = 0x00000000;
+
+	cell = nvmem_cell_get(ctx->dev, "rg_csi");
+	dev_info(ctx->dev, "ctx->port = %d\n", ctx->port);
+	if (IS_ERR(cell)) {
+		if (PTR_ERR(cell) == -EPROBE_DEFER) {
+			dev_info(ctx->dev,
+				 "read csi efuse returned with error cell %d\n",
+				 -EPROBE_DEFER - EPROBE_DEFER);
+			return PTR_ERR(cell);
+		}
+		dev_info(ctx->dev,
+			 "read csi efuse returned with error cell %d\n", -1);
+		return -1;
+	}
+	buf = (u32 *)nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+	if (IS_ERR(buf)) {
+		dev_info(ctx->dev, "read csi efuse returned with error buf\n");
+		return PTR_ERR(buf);
+	}
+	ctx->m_csi_efuse = *buf;
+	kfree(buf);
+	dev_info(ctx->dev, "Efuse Data: 0x%08x\n", ctx->m_csi_efuse);
+
+	return 0;
+}
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+	.width = DEFAULT_WIDTH,
+	.height = DEFAULT_HEIGHT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+	.quantization = V4L2_QUANTIZATION_DEFAULT,
+};
+
+static int mtk_cam_seninf_init_state(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *mf;
+	unsigned int i;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		mf = v4l2_subdev_state_get_format(sd_state, i);
+		*mf = fmt_default;
+	}
+
+	return 0;
+}
+
+static int mtk_cam_seninf_set_fmt(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+	struct v4l2_mbus_framefmt *format;
+	char sink_format_changed = 0;
+
+	if (fmt->pad < PAD_SINK || fmt->pad >= PAD_MAXCNT)
+		return -EINVAL;
+
+	format = &ctx->fmt[fmt->pad].format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+
+		dev_dbg(ctx->dev,
+			"s_fmt pad %d code/res 0x%x/%dx%d which %d=> 0x%x/%dx%d\n",
+			fmt->pad,
+			fmt->format.code,
+			fmt->format.width,
+			fmt->format.height,
+			fmt->which,
+			format->code,
+			format->width,
+			format->height);
+	} else {
+		/* Update vcinfo once the SINK format changed */
+		if (fmt->pad == PAD_SINK)
+			sink_format_changed = 1;
+
+		format->code = fmt->format.code;
+		format->width = fmt->format.width;
+		format->height = fmt->format.height;
+
+		if (sink_format_changed && !ctx->is_test_model)
+			mtk_cam_seninf_get_vcinfo(ctx);
+
+		dev_info(ctx->dev,
+			 "s_fmt pad %d code/res 0x%x/%dx%d which %d=> 0x%x/%dx%d\n",
+			 fmt->pad,
+			 fmt->format.code,
+			 fmt->format.width,
+			 fmt->format.height,
+			 fmt->which,
+			 format->code,
+			 format->width,
+			 format->height);
+	}
+
+	return 0;
+}
+
+static int mtk_cam_seninf_get_fmt(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	if (fmt->pad < PAD_SINK || fmt->pad >= PAD_MAXCNT)
+		return -EINVAL;
+
+	format = &ctx->fmt[fmt->pad].format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
+	} else {
+		fmt->format.code = format->code;
+		fmt->format.width = format->width;
+		fmt->format.height = format->height;
+		fmt->format.field = format->field;
+		fmt->format.colorspace = format->colorspace;
+		fmt->format.xfer_func = format->xfer_func;
+		fmt->format.ycbcr_enc = format->ycbcr_enc;
+		fmt->format.quantization = format->quantization;
+	}
+
+	return 0;
+}
+
+static int config_hw(struct seninf_ctx *ctx)
+{
+	int i, intf, skip_mux_ctrl;
+	int hs_pol, vs_pol, vc_sel, dt_sel, dt_en;
+	struct seninf_vcinfo *vcinfo;
+	struct seninf_vc *vc;
+	struct seninf_mux *mux;
+
+	intf = ctx->seninf_idx;
+	vcinfo = &ctx->vcinfo;
+
+	mtk_cam_seninf_reset(ctx, intf);
+
+	mtk_cam_seninf_set_vc(ctx, intf, vcinfo);
+
+	mtk_cam_seninf_set_csi_mipi(ctx);
+
+	/* should set false */
+	hs_pol = 0;
+	vs_pol = 0;
+
+	for (i = 0; i < vcinfo->cnt; i++) {
+		vc = &vcinfo->vc[i];
+
+		mux =mtk_cam_seninf_mux_get_pref(ctx,
+							g_seninf_cfg->pref_mux_num);
+		skip_mux_ctrl = 0;
+
+		if (!mux) {
+			mtk_cam_seninf_release_mux(ctx);
+			return -EBUSY;
+		}
+
+		vc->mux = mux->idx;
+		vc->cam = ctx->pad2cam[vc->out_pad];
+
+		if (!skip_mux_ctrl) {
+			mtk_cam_seninf_mux(ctx, vc->mux);
+			mtk_cam_seninf_set_mux_ctrl(ctx, vc->mux,
+						    hs_pol, vs_pol,
+				MIPI_SENSOR,
+				vc->pixel_mode);
+
+			mtk_cam_seninf_set_top_mux_ctrl(ctx, vc->mux, intf);
+
+			/* disable mtk_cam_seninf_set_mux_crop length limit */
+		}
+		dev_info(ctx->dev, "ctx->pad2cam[%d] %d vc->out_pad %d vc->cam %d, i %d",
+			 vc->out_pad, ctx->pad2cam[vc->out_pad], vc->out_pad, vc->cam, i);
+
+		if (vc->cam != 0xff) {
+			vc_sel = 0;
+			dt_sel = vc->dt;
+			dt_en = !!dt_sel;
+
+			/* CMD_SENINF_FINALIZE_CAM_MUX */
+			mtk_cam_seninf_set_cammux_vc(ctx, vc->cam,
+						     vc_sel, dt_sel,
+						     dt_en, dt_en);
+			mtk_cam_seninf_set_cammux_src(ctx, vc->mux, vc->cam);
+			mtk_cam_seninf_set_cammux_chk_pixel_mode(ctx,
+								 vc->cam,
+								 vc->pixel_mode);
+			mtk_cam_seninf_cammux(ctx, vc->cam);
+
+			dev_info(ctx->dev, "vc[%d] pad %d intf %d mux %d cam %d\n",
+				 i, vc->out_pad, intf, vc->mux, vc->cam);
+		} else {
+			dev_info(ctx->dev,
+				 "not set camtg yet, vc[%d] pad %d intf %d mux %d cam %d\n",
+				 i, vc->out_pad, intf, vc->mux, vc->cam);
+		}
+	}
+	return 0;
+}
+
+static int calc_buffered_pixel_rate(struct device *dev,
+				    s64 width, s64 height,
+				    s64 hblank, s64 vblank,
+				    int fps_n, int fps_d, s64 *result)
+{
+	s64 orig_pixel_rate = *result;
+	u64 buffered_pixel_rate, pclk, k;
+
+	if (fps_d == 0 || width == 0 || hblank == 0 || ISP_CLK_LOW == 0) {
+		dev_info(dev,
+			 "Prevent divided by 0, fps_d= %d, w= %llu, h= %llu, ISP_CLK= %d\n",
+			 fps_d, width, hblank, ISP_CLK_LOW);
+		return 0;
+	}
+
+	/* calculate pclk */
+	pclk = (width + hblank) * (height + vblank) * fps_n;
+	do_div(pclk, fps_d);
+
+	/* calculate buffered pixel_rate */
+	buffered_pixel_rate = orig_pixel_rate * width;
+	k = HW_BUF_EFFECT * orig_pixel_rate;
+	do_div(k, ISP_CLK_LOW);
+	do_div(buffered_pixel_rate, (width + hblank - k));
+	*result = buffered_pixel_rate;
+
+	dev_info(dev,
+		 "%s: w %lld h %lld hb %lld vb %lld fps %d/%d pclk %lld->%lld orig %lld k %lld hbe %d\n",
+		 __func__, width, height, hblank, vblank,
+		 fps_n, fps_d, pclk, buffered_pixel_rate, orig_pixel_rate, k, HW_BUF_EFFECT);
+
+	return 0;
+}
+
+static int get_buffered_pixel_rate(struct seninf_ctx *ctx,
+				   struct v4l2_subdev *sd, int sd_pad_idx,
+				   s64 *result)
+{
+	int ret;
+	struct v4l2_ctrl *ctrl;
+	struct v4l2_subdev_format fmt;
+	struct v4l2_subdev_frame_interval fi;
+	s64 width, height, hblank, vblank;
+
+	fmt.pad = sd_pad_idx;
+	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
+	if (ret) {
+		dev_info(ctx->dev, "no get_fmt in %s\n", sd->name);
+		return ret;
+	}
+
+	width = fmt.format.width;
+	height = fmt.format.height;
+
+	memset(&fi, 0, sizeof(fi));
+	fi.pad = sd_pad_idx;
+	ret = v4l2_subdev_call_state_active(sd, pad, get_frame_interval, &fi);
+	if (ret) {
+		dev_info(ctx->dev, "no get_frame_interval in %s\n", sd->name);
+		return ret;
+	}
+
+	ctrl = v4l2_ctrl_find(sd->ctrl_handler, V4L2_CID_HBLANK);
+	if (!ctrl) {
+		dev_info(ctx->dev, "no hblank in %s\n", sd->name);
+		return -EINVAL;
+	}
+
+	hblank = v4l2_ctrl_g_ctrl(ctrl);
+
+	ctrl = v4l2_ctrl_find(sd->ctrl_handler, V4L2_CID_VBLANK);
+	if (!ctrl) {
+		dev_info(ctx->dev, "no vblank in %s\n", sd->name);
+		return -EINVAL;
+	}
+
+	vblank = v4l2_ctrl_g_ctrl(ctrl);
+
+	/* update fps */
+	ctx->fps_n = fi.interval.denominator;
+	ctx->fps_d = fi.interval.numerator;
+
+	return calc_buffered_pixel_rate(ctx->dev, width, height, hblank, vblank,
+					ctx->fps_n, ctx->fps_d, result);
+}
+
+int update_isp_clk(struct seninf_ctx *ctx)
+{
+	int i, pixelmode;
+	struct seninf_dfs *dfs = &ctx->core->dfs;
+	s64 pixel_rate = -1;
+	u64 dfs_freq;
+	struct seninf_vc *vc;
+	int ret = 0;
+
+	if (!dfs->cnt) {
+		dev_info(ctx->dev, "dfs not ready.\n");
+		return ret;
+	}
+
+	vc = mtk_cam_seninf_get_vc_by_pad(ctx, PAD_SRC_RAW0);
+	if (!vc) {
+		dev_info(ctx->dev, "failed to get vc\n");
+		return -1;
+	}
+	dev_info(ctx->dev,
+		 "%s dfs->cnt %d pixel mode %d customized_pixel_rate %lld, buffered_pixel_rate %lld mipi_pixel_rate %lld\n",
+		 __func__, dfs->cnt, vc->pixel_mode, ctx->customized_pixel_rate,
+		 ctx->buffered_pixel_rate, ctx->mipi_pixel_rate);
+
+	/* Use SensorPixelrate */
+	if (ctx->customized_pixel_rate) {
+		pixel_rate = ctx->customized_pixel_rate;
+	} else if (ctx->buffered_pixel_rate) {
+		pixel_rate = ctx->buffered_pixel_rate;
+	} else if (ctx->mipi_pixel_rate) {
+		pixel_rate = ctx->mipi_pixel_rate;
+	} else {
+		dev_info(ctx->dev, "failed to get pixel_rate\n");
+		return -EINVAL;
+	}
+
+	pixelmode = vc->pixel_mode;
+	for (i = 0; i < dfs->cnt; i++) {
+		dfs_freq = dfs->freqs[i];
+		dfs_freq = dfs_freq * (100 - SENINF_CLK_MARGIN_IN_PERCENT);
+		do_div(dfs_freq, 100);
+		if ((dfs_freq << pixelmode) >= pixel_rate)
+			break;
+	}
+
+	if (i == dfs->cnt) {
+		dev_info(ctx->dev, "mux is overrun. please adjust pixelmode\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int debug_err_detect_initialize(struct seninf_ctx *ctx)
+{
+	struct seninf_core *core;
+	struct seninf_ctx *ctx_;
+
+	core = dev_get_drvdata(ctx->dev->parent);
+
+	core->csi_irq_en_flag = 0;
+
+	list_for_each_entry(ctx_, &core->list, list) {
+		ctx_->data_not_enough_flag = 0;
+		ctx_->err_lane_resync_flag = 0;
+		ctx_->crc_err_flag = 0;
+		ctx_->ecc_err_double_flag = 0;
+		ctx_->ecc_err_corrected_flag = 0;
+		ctx_->fifo_overrun_flag = 0;
+		ctx_->size_err_flag = 0;
+		ctx_->data_not_enough_cnt = 0;
+		ctx_->err_lane_resync_cnt = 0;
+		ctx_->crc_err_cnt = 0;
+		ctx_->ecc_err_double_cnt = 0;
+		ctx_->ecc_err_corrected_cnt = 0;
+		ctx_->fifo_overrun_cnt = 0;
+		ctx_->size_err_cnt = 0;
+	}
+
+	return 0;
+}
+
+static int seninf_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	int ret;
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+
+	if (ctx->streaming == enable)
+		return 0;
+
+	if (!ctx->sensor_sd) {
+		dev_info(ctx->dev, "no sensor\n");
+		return -EFAULT;
+	}
+
+	if (enable) {
+		debug_err_detect_initialize(ctx);
+
+		ctx->buffered_pixel_rate = ctx->mipi_pixel_rate;
+		get_buffered_pixel_rate(ctx, ctx->sensor_sd,
+					ctx->sensor_pad_idx,
+					&ctx->buffered_pixel_rate);
+
+		ret = pm_runtime_resume_and_get(ctx->dev);
+		if (ret < 0) {
+			dev_info(ctx->dev,
+				 "%s pm_runtime_resume_and_get ret %d\n",
+				 __func__, ret);
+			return ret;
+		}
+
+		update_isp_clk(ctx);
+
+		ret = config_hw(ctx);
+		if (ret) {
+			dev_info(ctx->dev, "config_seninf_hw ret %d\n", ret);
+			return ret;
+		}
+
+		/* middleware control sensor fsync after set cam-mux */
+
+		ret = v4l2_subdev_call(ctx->sensor_sd, video, s_stream, 1);
+		if (ret) {
+			dev_info(ctx->dev, "sensor stream-on ret %d\n", ret);
+			return ret;
+		}
+
+	} else {
+		ret = v4l2_subdev_call(ctx->sensor_sd, video, s_stream, 0);
+		if (ret) {
+			dev_info(ctx->dev, "sensor stream-off ret %d\n", ret);
+			return ret;
+		}
+
+		mtk_cam_seninf_set_idle(ctx);
+		mtk_cam_seninf_release_mux(ctx);
+
+		mtk_cam_seninf_poweroff(ctx);
+		pm_runtime_put_sync(ctx->dev);
+	}
+
+	ctx->streaming = enable;
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops = {
+	.link_validate = mtk_cam_link_validate,
+	.set_fmt = mtk_cam_seninf_set_fmt,
+	.get_fmt = mtk_cam_seninf_get_fmt,
+};
+
+static const struct v4l2_subdev_video_ops seninf_subdev_video_ops = {
+	.s_stream = seninf_s_stream,
+};
+
+static const struct v4l2_subdev_core_ops seninf_subdev_core_ops = {
+	.subscribe_event	= seninf_subscribe_event,
+	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_internal_ops seninf_subdev_internal_ops = {
+	.init_state = mtk_cam_seninf_init_state,
+};
+
+static const struct v4l2_subdev_ops seninf_subdev_ops = {
+	.core	= &seninf_subdev_core_ops,
+	.video	= &seninf_subdev_video_ops,
+	.pad	= &seninf_subdev_pad_ops,
+};
+
+static int seninf_link_setup(struct media_entity *entity,
+			     const struct media_pad *local,
+			     const struct media_pad *remote, u32 flags)
+{
+	struct v4l2_subdev *sd;
+	struct seninf_ctx *ctx;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+	if (!sd)
+		return -EINVAL;
+	ctx = v4l2_get_subdevdata(sd);
+	if (!ctx)
+		return -EINVAL;
+
+	if (local->flags & MEDIA_PAD_FL_SOURCE) {
+		if (flags & MEDIA_LNK_FL_ENABLED) {
+			if (!mtk_cam_seninf_get_vc_by_pad(ctx, local->index)) {
+				dev_info(ctx->dev,
+					 "%s enable link w/o vc_info pad idex %d\n",
+					 __func__, local->index);
+			}
+		}
+	} else {
+		/* Update vcinfo once the link becomes enabled */
+		if (flags & MEDIA_LNK_FL_ENABLED) {
+			ctx->sensor_sd =
+				media_entity_to_v4l2_subdev(remote->entity);
+			ctx->sensor_pad_idx = remote->index;
+			mtk_cam_seninf_get_vcinfo(ctx);
+		}
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations seninf_media_ops = {
+	.link_setup = seninf_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+struct sensor_async_subdev {
+	struct v4l2_async_connection asc;
+	u32 port;
+	u32 bus_type;
+	u32 lanes;
+};
+
+static int seninf_notifier_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_connection *asc)
+{
+	struct seninf_ctx *ctx = notifier_to_ctx(notifier);
+	struct sensor_async_subdev *s_asd =
+		container_of(asc, struct sensor_async_subdev, asc);
+	int ret;
+
+	dev_info(ctx->dev, "[%s] %s bounded, bus_type:%d, lanes:%d\n",
+		 __func__, sd->entity.name, s_asd->bus_type, s_asd->lanes);
+
+	ctx->is_cphy = (s_asd->bus_type == V4L2_MBUS_CSI2_CPHY);
+	ctx->num_data_lanes = s_asd->lanes;
+
+	ret = media_create_pad_link(&sd->entity, 0, &ctx->subdev.entity, 0, 0);
+	if (ret) {
+		dev_info(ctx->dev, "failed to create link for %s\n",
+			 sd->entity.name);
+		return ret;
+	}
+
+	ret = v4l2_device_register_subdev_nodes(ctx->subdev.v4l2_dev);
+	if (ret) {
+		dev_info(ctx->dev, "failed to create subdev nodes\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void seninf_notifier_unbind(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *sd,
+				   struct v4l2_async_connection *asc)
+{
+	struct seninf_ctx *ctx = notifier_to_ctx(notifier);
+
+	dev_info(ctx->dev, "%s is unbounded\n", sd->entity.name);
+}
+
+static const struct v4l2_async_notifier_operations seninf_async_ops = {
+	.bound = seninf_notifier_bound,
+	.unbind = seninf_notifier_unbind,
+};
+
+static int mtk_cam_seninf_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct seninf_ctx *ctx = ctrl_hdl_to_ctx(ctrl->handler);
+	int ret = -EINVAL;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		break;
+	default:
+		ret = 0;
+		dev_info(ctx->dev, "%s Unhandled id:0x%x, val:0x%x\n",
+			 __func__, ctrl->id, ctrl->val);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops seninf_ctrl_ops = {
+	.s_ctrl = mtk_cam_seninf_set_ctrl,
+};
+
+static int seninf_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+
+	mutex_lock(&ctx->mutex);
+	ctx->open_refcnt++;
+
+	if (ctx->open_refcnt == 1)
+		dev_info(ctx->dev, "%s open_refcnt %d\n",
+			 __func__, ctx->open_refcnt);
+
+	mutex_unlock(&ctx->mutex);
+
+	return 0;
+}
+
+static int seninf_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+
+	mutex_lock(&ctx->mutex);
+	ctx->open_refcnt--;
+
+	if (!ctx->open_refcnt) {
+		dev_info(ctx->dev, "%s open_refcnt %d\n",
+			 __func__, ctx->open_refcnt);
+		if (ctx->streaming)
+			seninf_s_stream(&ctx->subdev, 0);
+	}
+
+	mutex_unlock(&ctx->mutex);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops seninf_internal_ops = {
+	.open = seninf_open,
+	.close = seninf_close,
+};
+
+static const char *const seninf_test_pattern_menu[] = {
+	"Disabled",
+	"generate_test_pattern",
+	"generate_test_pattern_stagger",
+	"generate_test_pattern_pd",
+};
+
+static int seninf_initialize_controls(struct seninf_ctx *ctx)
+{
+	struct v4l2_ctrl_handler *handler;
+	int ret;
+
+	handler = &ctx->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(handler, 2);
+	if (ret)
+		return ret;
+	v4l2_ctrl_new_std_menu_items(handler, &seninf_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(seninf_test_pattern_menu) - 1,
+				     0, 0, seninf_test_pattern_menu);
+
+	if (handler->error) {
+		ret = handler->error;
+		dev_info(ctx->dev, "Failed to init controls(%d)\n", ret);
+		goto err_free_handler;
+	}
+
+	ctx->subdev.ctrl_handler = handler;
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(handler);
+
+	return ret;
+}
+
+static int seninf_parse_endpoint(struct device *dev,
+				 struct v4l2_fwnode_endpoint *vep,
+				 struct sensor_async_subdev *s_asd)
+{
+	struct fwnode_handle *remote_hnd;
+
+	s_asd->port = vep->base.port;
+	s_asd->bus_type = vep->bus_type;
+	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
+
+	dev_dbg(dev, "Got local node port:%d type:%d lanes:%d\n",
+		vep->base.port, vep->bus_type,
+		vep->bus.mipi_csi2.num_data_lanes);
+
+	/* check if sensor endpoint assign mipi lane nums */
+	remote_hnd = fwnode_graph_get_remote_endpoint(vep->base.local_fwnode);
+	if (remote_hnd) {
+		u32 remote_bus = 0, remote_lanes = 0;
+
+		fwnode_property_read_u32(remote_hnd, "bus-type", &remote_bus);
+		if (remote_bus == V4L2_FWNODE_BUS_TYPE_CSI2_DPHY)
+			s_asd->bus_type = V4L2_MBUS_CSI2_DPHY;
+		else if (remote_bus == V4L2_FWNODE_BUS_TYPE_CSI2_CPHY)
+			s_asd->bus_type = V4L2_MBUS_CSI2_CPHY;
+
+		remote_lanes =
+			fwnode_property_count_u32(remote_hnd, "data-lanes");
+		if (remote_lanes > 0 &&
+		    remote_lanes <= vep->bus.mipi_csi2.num_data_lanes)
+			s_asd->lanes = remote_lanes;
+
+		fwnode_handle_put(remote_hnd);
+		dev_dbg(dev, "Got remote node lanes:%d\n", remote_lanes);
+	}
+
+	return 0;
+}
+
+static int seninf_parse_fwnode(struct device *dev,
+			       struct v4l2_async_notifier *notifier)
+{
+	struct fwnode_handle *fwnode = NULL;
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY, /* CDPHY only */
+	};
+	int ret = 0;
+
+	fwnode_graph_for_each_endpoint(dev_fwnode(dev), fwnode) {
+		struct sensor_async_subdev *s_asd;
+
+		ret = v4l2_fwnode_endpoint_parse(fwnode, &vep);
+		if (ret) {
+			dev_err(dev, "failed to parse v4l2 fwnode endpoint\n");
+			break;
+		}
+
+		if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+		    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
+			dev_err(dev, "Got unsupported endpoint:%d, bus:%d\n",
+				vep.base.port, vep.bus_type);
+			continue;
+		}
+
+		s_asd = v4l2_async_nf_add_fwnode_remote(notifier, fwnode,
+							struct sensor_async_subdev);
+		if (IS_ERR(s_asd)) {
+			ret = PTR_ERR(s_asd);
+			break;
+		}
+
+		ret = seninf_parse_endpoint(dev, &vep, s_asd);
+		if (ret < 0)
+			break;
+	}
+
+	if (fwnode)
+		fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
+static int register_subdev(struct seninf_ctx *ctx)
+{
+	int i, ret;
+	struct v4l2_subdev *sd = &ctx->subdev;
+	struct device *dev = ctx->dev;
+	struct media_pad *pads = ctx->pads;
+	struct v4l2_async_notifier *notifier = &ctx->notifier;
+
+	v4l2_subdev_init(sd, &seninf_subdev_ops);
+	sd->internal_ops = &seninf_subdev_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->dev = dev;
+
+	if (strlen(dev->of_node->name) > 16)
+		snprintf(sd->name, sizeof(sd->name), "%s-%s",
+			 dev_driver_string(dev), &dev->of_node->name[16]);
+	else
+		snprintf(sd->name, sizeof(sd->name), "%s-%s",
+			 dev_driver_string(dev), csi_port_names[ctx->port]);
+
+	v4l2_set_subdevdata(sd, ctx);
+
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &seninf_media_ops;
+	sd->internal_ops = &seninf_internal_ops;
+
+	pads[PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	for (i = PAD_SRC_RAW0; i < PAD_MAXCNT; i++)
+		pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	for (i = 0; i < PAD_MAXCNT; i++)
+		ctx->pad2cam[i] = 0xff;
+
+	ret = media_entity_pads_init(&sd->entity, PAD_MAXCNT, pads);
+	if (ret < 0) {
+		dev_info(dev, "failed to init pads\n");
+		return ret;
+	}
+
+	/* register seninf as mtk_cam async child */
+	ret = v4l2_async_register_subdev(sd);
+	if (ret < 0) {
+		dev_info(dev, "failed to register subdev\n");
+		return ret;
+	}
+
+	/* register seninf as sensor async parent */
+	v4l2_async_subdev_nf_init(notifier, sd);
+	ret = seninf_parse_fwnode(dev, notifier);
+	if (ret < 0)
+		dev_info(dev, "no endpoint\n");
+
+	notifier->ops = &seninf_async_ops;
+	ret = v4l2_async_nf_register(notifier);
+	if (ret < 0) {
+		dev_info(dev, "failed to register notifier\n");
+		goto err_unregister_subdev;
+	}
+
+	return 0;
+
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(sd);
+	v4l2_async_nf_cleanup(notifier);
+
+	return ret;
+}
+
+static void unregister_subdev(struct seninf_ctx *ctx)
+{
+	struct v4l2_subdev *sd = &ctx->subdev;
+
+	v4l2_async_nf_unregister(&ctx->notifier);
+	v4l2_async_nf_cleanup(&ctx->notifier);
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+}
+
+static int seninf_probe(struct platform_device *pdev)
+{
+	int ret, port;
+	struct seninf_ctx *ctx;
+	struct device *dev = &pdev->dev;
+	struct seninf_core *core;
+
+	if (!dev->parent)
+		return -EPROBE_DEFER;
+
+	/* get mtk seninf_core */
+	core = dev_get_drvdata(dev->parent);
+	if (!core)
+		return -EPROBE_DEFER;
+
+	/* init seninf_csi ctx */
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, ctx);
+	ctx->dev = dev;
+	ctx->core = core;
+	list_add(&ctx->list, &core->list);
+	INIT_LIST_HEAD(&ctx->list_mux);
+	INIT_LIST_HEAD(&ctx->list_cam_mux);
+
+	ctx->open_refcnt = 0;
+	mutex_init(&ctx->mutex);
+
+	ret = get_csi_port(dev, &port);
+	if (ret) {
+		dev_info(dev, "get_csi_port ret %d\n", ret);
+		return ret;
+	}
+
+	mtk_cam_seninf_init_iomem(ctx, core->reg_if, core->reg_ana);
+	mtk_cam_seninf_init_port(ctx, port);
+	init_fmt(ctx);
+
+	/* platform properties */
+	ctx->cphy_settle_delay_dt = ctx->core->cphy_settle_delay_dt;
+	ctx->dphy_settle_delay_dt = ctx->core->dphy_settle_delay_dt;
+	ctx->settle_delay_ck = ctx->core->settle_delay_ck;
+	ctx->hs_trail_parameter = ctx->core->hs_trail_parameter;
+
+	of_property_read_u32(dev->of_node, "cphy_settle_delay_dt",
+			     &ctx->cphy_settle_delay_dt);
+	of_property_read_u32(dev->of_node, "dphy_settle_delay_dt",
+			     &ctx->dphy_settle_delay_dt);
+	of_property_read_u32(dev->of_node, "settle_delay_ck",
+			     &ctx->settle_delay_ck);
+	of_property_read_u32(dev->of_node, "hs_trail_parameter",
+			     &ctx->hs_trail_parameter);
+
+	dev_info(dev,
+		 "seninf d_settlte/d_settle_ck/d_trail/c_settle= 0x%x/0x%x/0x%x/0x%x\n",
+		 ctx->dphy_settle_delay_dt,
+		 ctx->settle_delay_ck,
+		 ctx->hs_trail_parameter,
+		 ctx->cphy_settle_delay_dt);
+
+	ret = dev_read_csi_efuse(ctx);
+	if (ret < 0)
+		dev_info(dev, "Failed to read efuse data\n");
+
+	ret = seninf_initialize_controls(ctx);
+	if (ret) {
+		dev_info(dev, "Failed to initialize controls\n");
+		return ret;
+	}
+
+	/* bind seninf_csi to mtkcam */
+	ret = register_subdev(ctx);
+	if (ret < 0) {
+		dev_err(dev, "register_subdev failed\n");
+		goto err_free_handler;
+	}
+
+	pm_runtime_enable(dev);
+
+	dev_info(dev, "%s: port=%d\n", __func__, ctx->port);
+
+	dev_info(dev, "camsys | [%s] success\n", __func__);
+
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
+	return ret;
+}
+
+static int runtime_suspend(struct device *dev)
+{
+	int i;
+	struct seninf_ctx *ctx = dev_get_drvdata(dev);
+	struct seninf_core *core = ctx->core;
+
+	mutex_lock(&core->mutex);
+
+	core->refcnt--;
+	if (core->refcnt == 0) {
+		i = CLK_TOP_SENINF_END;
+		do {
+			i--;
+			if (ctx->core->clk[i])
+				clk_disable_unprepare(ctx->core->clk[i]);
+		} while (i);
+		seninf_core_pm_runtime_put(core);
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return 0;
+}
+
+static int runtime_resume(struct device *dev)
+{
+	u32 i;
+	int ret;
+
+	struct seninf_ctx *ctx = dev_get_drvdata(dev);
+	struct seninf_core *core = ctx->core;
+
+	mutex_lock(&core->mutex);
+
+	core->refcnt++;
+
+	if (core->refcnt == 1) {
+		ret = seninf_core_pm_runtime_get_sync(core);
+		if (ret < 0) {
+			dev_info(dev, "seninf_core_pm_runtime_get_sync failed\n");
+			return ret;
+		}
+
+		for (i = 0; i < CLK_TOP_SENINF_END; i++) {
+			if (core->clk[i])
+				ret = clk_prepare_enable(core->clk[i]);
+			if (ret)
+				dev_dbg(dev, "%s: clk seninf%d is empty\n",
+					__func__, i);
+		}
+		mtk_cam_seninf_disable_all_mux(ctx);
+		mtk_cam_seninf_disable_all_cammux(ctx);
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return 0;
+}
+
+static const struct dev_pm_ops pm_ops = {
+	SET_RUNTIME_PM_OPS(runtime_suspend, runtime_resume, NULL)
+};
+
+static void seninf_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct seninf_ctx *ctx = dev_get_drvdata(dev);
+
+	if (ctx->streaming) {
+		mtk_cam_seninf_set_idle(ctx);
+		mtk_cam_seninf_release_mux(ctx);
+	}
+
+	pm_runtime_disable(ctx->dev);
+
+	unregister_subdev(ctx);
+
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
+	mutex_destroy(&ctx->mutex);
+}
+
+static const struct of_device_id seninf_of_match[] = {
+	{ .compatible = "mediatek,mt8188-seninf" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, seninf_of_match);
+
+static int seninf_suspend(struct platform_device *pdev, pm_message_t mesg)
+{
+	return 0;
+}
+
+static int seninf_resume(struct platform_device *pdev)
+{
+	return 0;
+}
+
+struct platform_driver seninf_pdrv = {
+	.probe	= seninf_probe,
+	.remove	= seninf_remove,
+	.suspend = seninf_suspend,
+	.resume = seninf_resume,
+	.driver	= {
+		.name = "seninf",
+		.of_match_table = seninf_of_match,
+		.pm  = &pm_ops,
+	},
+};
+
+int mtk_cam_seninf_calc_pixelrate(struct device *dev, s64 width, s64 height,
+				  s64 hblank, s64 vblank,
+				  int fps_n, int fps_d,
+				  s64 sensor_pixel_rate)
+{
+	int ret;
+	s64 p_pixel_rate = sensor_pixel_rate;
+
+	ret = calc_buffered_pixel_rate(dev, width, height, hblank, vblank,
+				       fps_n, fps_d, &p_pixel_rate);
+	if (ret)
+		return sensor_pixel_rate;
+
+	return p_pixel_rate;
+}
+
+int mtk_cam_seninf_dump(struct v4l2_subdev *sd)
+{
+	int ret = 0;
+	//TODO debug patch
+	return ret;
+}
+
+void mtk_cam_seninf_set_secure(struct v4l2_subdev *sd,
+			       int enable, unsigned int sec_info_addr)
+{
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+
+	ctx->sec_info_addr = sec_info_addr;
+	dev_info(ctx->dev, "[%s]: %x, enable: %d\n",
+		 __func__, sec_info_addr, enable);
+	ctx->is_secure = enable ? 1 : 0;
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
new file mode 100755
index 000000000000..117ae208cf4b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_DRV_H
+#define __MTK_CAM_SENINF_DRV_H
+
+#include "mtk_cam-seninf.h"
+
+extern struct platform_driver seninf_core_pdrv;
+extern struct platform_driver seninf_pdrv;
+
+int update_isp_clk(struct seninf_ctx *ctx);
+
+#endif /*__MTK_CAM_SENINF_DRV_H */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
new file mode 100755
index 000000000000..5d4fc0d6e995
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_HW_H__
+#define __MTK_CAM_SENINF_HW_H__
+
+enum SET_REG_KEYS {
+	REG_KEY_MIN = 0,
+	REG_KEY_SETTLE_CK = REG_KEY_MIN,
+	REG_KEY_SETTLE_DT,
+	REG_KEY_HS_TRAIL_EN,
+	REG_KEY_HS_TRAIL_PARAM,
+	REG_KEY_CSI_IRQ_STAT,
+	REG_KEY_CSI_RESYNC_CYCLE,
+	REG_KEY_MUX_IRQ_STAT,
+	REG_KEY_CAMMUX_IRQ_STAT,
+	REG_KEY_CAMMUX_VSYNC_IRQ_EN,
+	REG_KEY_CSI_IRQ_EN,
+	REG_KEY_MAX_NUM
+};
+
+#define SET_REG_KEYS_NAMES \
+	"RG_SETTLE_CK", \
+	"RG_SETTLE_DT", \
+	"RG_HS_TRAIL_EN", \
+	"RG_HS_TRAIL_PARAM", \
+	"RG_CSI_IRQ_STAT", \
+	"RG_CSI_RESYNC_CYCLE", \
+	"RG_MUX_IRQ_STAT", \
+	"RG_CAMMUX_IRQ_STAT", \
+	"REG_VSYNC_IRQ_EN", \
+	"RG_CSI_IRQ_EN", \
+
+struct mtk_cam_seninf_mux_meter {
+	u32 width;
+	u32 height;
+	u32 h_valid;
+	u32 h_blank;
+	u32 v_valid;
+	u32 v_blank;
+	s64 mipi_pixel_rate;
+	s64 vb_in_us;
+	s64 hb_in_us;
+	s64 line_time_in_us;
+};
+
+struct mtk_cam_seninf_cfg {
+	unsigned int seninf_num;
+	unsigned int mux_num;
+	unsigned int cam_mux_num;
+	unsigned int pref_mux_num;
+};
+
+extern struct mtk_cam_seninf_cfg *g_seninf_cfg;
+
+int mtk_cam_seninf_init_iomem(struct seninf_ctx *ctx, void __iomem *if_base,
+			      void __iomem *ana_base);
+int mtk_cam_seninf_init_port(struct seninf_ctx *ctx, int port);
+int mtk_cam_seninf_is_cammux_used(struct seninf_ctx *ctx, int cam_mux);
+int mtk_cam_seninf_cammux(struct seninf_ctx *ctx, int cam_mux);
+int mtk_cam_seninf_disable_cammux(struct seninf_ctx *ctx, int cam_mux);
+int mtk_cam_seninf_disable_all_cammux(struct seninf_ctx *ctx);
+int mtk_cam_seninf_set_top_mux_ctrl(struct seninf_ctx *ctx, int mux_idx,
+				    int seninf_src);
+int mtk_cam_seninf_get_top_mux_ctrl(struct seninf_ctx *ctx, int mux_idx);
+int mtk_cam_seninf_get_cammux_ctrl(struct seninf_ctx *ctx, int cam_mux);
+u32 mtk_cam_seninf_get_cammux_res(struct seninf_ctx *ctx, int cam_mux);
+int mtk_cam_seninf_set_cammux_vc(struct seninf_ctx *ctx, int cam_mux,
+				 int vc_sel, int dt_sel, int vc_en,
+				 int dt_en);
+int mtk_cam_seninf_set_cammux_src(struct seninf_ctx *ctx, int src,
+				  int target);
+int mtk_cam_seninf_set_vc(struct seninf_ctx *ctx, u32 seninf_idx,
+			  struct seninf_vcinfo *vcinfo);
+int mtk_cam_seninf_set_mux_ctrl(struct seninf_ctx *ctx, u32 mux, int hs_pol,
+				int vs_pol, int src_sel, int pixel_mode);
+int mtk_cam_seninf_set_mux_crop(struct seninf_ctx *ctx, u32 mux, int start_x,
+				int end_x, int enable);
+int mtk_cam_seninf_is_mux_used(struct seninf_ctx *ctx, u32 mux);
+int mtk_cam_seninf_mux(struct seninf_ctx *ctx, u32 mux);
+int mtk_cam_seninf_disable_mux(struct seninf_ctx *ctx, u32 mux);
+int mtk_cam_seninf_disable_all_mux(struct seninf_ctx *ctx);
+int mtk_cam_seninf_set_cammux_chk_pixel_mode(struct seninf_ctx *ctx,
+					     int cam_mux, int pixel_mode);
+int mtk_cam_seninf_set_csi_mipi(struct seninf_ctx *ctx);
+int mtk_cam_seninf_poweroff(struct seninf_ctx *ctx);
+int mtk_cam_seninf_reset(struct seninf_ctx *ctx, u32 seninf_idx);
+int mtk_cam_seninf_set_idle(struct seninf_ctx *ctx);
+int mtk_cam_seninf_switch_to_cammux_inner_page(struct seninf_ctx *ctx,
+					       bool inner);
+int mtk_cam_seninf_set_cammux_next_ctrl(struct seninf_ctx *ctx, int src,
+					int target);
+int mtk_cam_seninf_update_mux_pixel_mode(struct seninf_ctx *ctx, u32 mux,
+					 int pixel_mode);
+int mtk_cam_seninf_irq_handler(int irq, void *data);
+int mtk_cam_seninf_set_sw_cfg_busy(struct seninf_ctx *ctx, bool enable,
+				   int index);
+int mtk_cam_seninf_reset_cam_mux_dyn_en(struct seninf_ctx *ctx, int index);
+int mtk_cam_seninf_enable_global_drop_irq(struct seninf_ctx *ctx, bool enable,
+					  int index);
+int mtk_cam_seninf_enable_cam_mux_vsync_irq(struct seninf_ctx *ctx, bool enable,
+					    int cam_mux);
+int mtk_cam_seninf_disable_all_cam_mux_vsync_irq(struct seninf_ctx *ctx);
+int mtk_cam_seninf_set_reg(struct seninf_ctx *ctx, u32 key, u32 val);
+
+#endif /* __MTK_CAM_SENINF_HW_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
new file mode 100755
index 000000000000..12300b193c14
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2022 MediaTek Inc.
+
+#ifndef __MTK_CAM_SENINF_IF_H__
+#define __MTK_CAM_SENINF_IF_H__
+
+int mtk_cam_seninf_get_pixelmode(struct v4l2_subdev *sd, int pad_id,
+				 int *pixelmode);
+
+int mtk_cam_seninf_set_pixelmode(struct v4l2_subdev *sd, int pad_id,
+				 int pixelmode);
+
+int mtk_cam_seninf_set_camtg(struct v4l2_subdev *sd, int pad_id, int camtg);
+
+int mtk_cam_seninf_calc_pixelrate(struct device *dev, s64 width, s64 height,
+				  s64 hblank, s64 vblank, int fps_n, int fps_d,
+				  s64 sensor_pixel_rate);
+
+int mtk_cam_seninf_dump(struct v4l2_subdev *sd);
+
+unsigned int mtk_cam_seninf_get_vc_feature(struct v4l2_subdev *sd,
+					   unsigned int pad);
+
+#endif /* __MTK_CAM_SENINF_IF_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
new file mode 100755
index 000000000000..a955dbaa29ea
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/bitfield.h>
+
+#ifndef __MTK_CAM_SENINF_REGS_H__
+#define __MTK_CAM_SENINF_REGS_H__
+
+#define SENINF_BITS(base, reg, field, val) do { \
+    void __iomem *__p = (void __iomem *)((u8 __iomem *)(base) + (reg)); \
+    u32 __v = readl(__p); \
+    __v &= ~(field); \
+    __v |= FIELD_PREP(field, val); \
+    writel(__v, __p); \
+} while (0)
+
+#define SENINF_READ_BITS(base, reg, field) \
+({ \
+    void __iomem *__p = (void __iomem *)((u8 __iomem *)(base) + (reg)); \
+    u32 __v = readl(__p); \
+    FIELD_GET(field, __v); \
+})
+
+#define SENINF_READ_REG(base, reg) \
+({ \
+	u32 __iomem *__p = (base) + (reg); \
+	u32 __v = readl(__p); \
+	__v; \
+})
+
+#define SENINF_WRITE_REG(base, reg, val) { \
+	u32 __iomem *__p = (base) + (reg); \
+	writel(val, __p); \
+}
+
+#define SENINF_BITS_VAR(base, reg, mask, val) do { \
+    void __iomem *__p = (void __iomem *)((u8 __iomem *)(base) + (reg)); \
+    u32 __v = readl(__p); \
+    __v &= ~(mask); \
+    __v |= ((val) << __builtin_ctz(mask)) & (mask); \
+    writel(__v, __p); \
+} while (0)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
new file mode 100755
index 000000000000..aa54a865ad84
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/of_graph.h>
+#include <linux/of_device.h>
+
+#include <linux/videodev2.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+
+#include "mtk_cam-seninf.h"
+#include "mtk_cam-seninf-route.h"
+#include "mtk_cam-seninf-if.h"
+#include "mtk_cam-seninf-hw.h"
+#include "mtk_cam-seninf-drv.h"
+#include "kd_imgsensor_define_v4l2.h"
+
+#define to_std_fmt_code(code) \
+	((code) & 0xFFFF)
+
+void mtk_cam_seninf_init_res(struct seninf_core *core)
+{
+	int i;
+
+	INIT_LIST_HEAD(&core->list_mux);
+	for (i = 0; i < g_seninf_cfg->mux_num; i++) {
+		core->mux[i].idx = i;
+		list_add_tail(&core->mux[i].list, &core->list_mux);
+	}
+}
+
+struct seninf_mux *mtk_cam_seninf_mux_get(struct seninf_ctx *ctx)
+{
+	struct seninf_core *core = ctx->core;
+	struct seninf_mux *ent = NULL;
+
+	mutex_lock(&core->mutex);
+
+	if (!list_empty(&core->list_mux)) {
+		ent = list_first_entry(&core->list_mux,
+				       struct seninf_mux, list);
+		list_move_tail(&ent->list, &ctx->list_mux);
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return ent;
+}
+
+struct seninf_mux *mtk_cam_seninf_mux_get_pref(struct seninf_ctx *ctx,
+					        int pref_cnt)
+{
+	int i;
+	struct seninf_core *core = ctx->core;
+	struct seninf_mux *ent = NULL;
+
+	mutex_lock(&core->mutex);
+
+	list_for_each_entry(ent, &core->list_mux, list) {
+		for (i = 0; i < pref_cnt; i++) {
+			if (ent->idx == i) {
+				list_move_tail(&ent->list,
+					       &ctx->list_mux);
+				mutex_unlock(&core->mutex);
+				return ent;
+			}
+		}
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return mtk_cam_seninf_mux_get(ctx);
+}
+
+void mtk_cam_seninf_mux_put(struct seninf_ctx *ctx, struct seninf_mux *mux)
+{
+	struct seninf_core *core = ctx->core;
+
+	mutex_lock(&core->mutex);
+	list_move_tail(&mux->list, &core->list_mux);
+	mutex_unlock(&core->mutex);
+}
+
+struct seninf_vc *mtk_cam_seninf_get_vc_by_pad(struct seninf_ctx *ctx, int idx)
+{
+	int i;
+	struct seninf_vcinfo *vcinfo = &ctx->vcinfo;
+
+	for (i = 0; i < vcinfo->cnt; i++) {
+		if (vcinfo->vc[i].out_pad == idx)
+			return &vcinfo->vc[i];
+	}
+
+	return NULL;
+}
+
+unsigned int mtk_cam_seninf_get_vc_feature(struct v4l2_subdev *sd,
+					   unsigned int pad)
+{
+	struct seninf_vc *pvc = NULL;
+	struct seninf_ctx *ctx = container_of(sd, struct seninf_ctx, subdev);
+
+	pvc = mtk_cam_seninf_get_vc_by_pad(ctx, pad);
+	if (pvc)
+		return pvc->feature;
+
+	return VC_NONE;
+}
+
+int mtk_cam_seninf_get_vcinfo(struct seninf_ctx *ctx)
+{
+	struct seninf_vcinfo *vcinfo = &ctx->vcinfo;
+	struct seninf_vc *vc;
+
+	if (!ctx->sensor_sd)
+		return -EINVAL;
+
+	vcinfo->cnt = 0;
+
+	switch (to_std_fmt_code(ctx->fmt[PAD_SINK].format.code)) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->dt = 0x2a;
+		vc->feature = VC_RAW_DATA;
+		vc->out_pad = PAD_SRC_RAW0;
+		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->dt = 0x2b;
+		vc->feature = VC_RAW_DATA;
+		vc->out_pad = PAD_SRC_RAW0;
+		break;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->dt = 0x2c;
+		vc->feature = VC_RAW_DATA;
+		vc->out_pad = PAD_SRC_RAW0;
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}
+
+void mtk_cam_seninf_release_mux(struct seninf_ctx *ctx)
+{
+	struct seninf_mux *ent, *tmp;
+
+	list_for_each_entry_safe(ent, tmp, &ctx->list_mux, list) {
+		mtk_cam_seninf_mux_put(ctx, ent);
+	}
+}
+
+int mtk_cam_seninf_get_pixelmode(struct v4l2_subdev *sd,
+				 int pad_id, int *pixel_mode)
+{
+	struct seninf_ctx *ctx = container_of(sd, struct seninf_ctx, subdev);
+	struct seninf_vc *vc;
+
+	vc = mtk_cam_seninf_get_vc_by_pad(ctx, pad_id);
+	if (!vc) {
+		pr_info("%s: invalid pad=%d\n", __func__, pad_id);
+		return -1;
+	}
+
+	*pixel_mode = vc->pixel_mode;
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_pixelmode(struct v4l2_subdev *sd,
+				 int pad_id, int pixel_mode)
+{
+	struct seninf_ctx *ctx = container_of(sd, struct seninf_ctx, subdev);
+	struct seninf_vc *vc;
+
+	vc = mtk_cam_seninf_get_vc_by_pad(ctx, pad_id);
+	if (!vc) {
+		pr_info("%s: invalid pad=%d\n", __func__, pad_id);
+		return -1;
+	}
+
+	vc->pixel_mode = pixel_mode;
+	if (ctx->streaming) {
+		update_isp_clk(ctx);
+		mtk_cam_seninf_update_mux_pixel_mode(ctx, vc->mux, pixel_mode);
+	}
+
+	return 0;
+}
+
+static int _mtk_cam_seninf_set_camtg(struct v4l2_subdev *sd,
+				     int pad_id, int camtg, bool disable_last)
+{
+	int old_camtg;
+	struct seninf_ctx *ctx = container_of(sd, struct seninf_ctx, subdev);
+	struct seninf_vc *vc;
+
+	if (pad_id < PAD_SRC_RAW0 || pad_id >= PAD_MAXCNT)
+		return -EINVAL;
+
+	vc = mtk_cam_seninf_get_vc_by_pad(ctx, pad_id);
+	if (!vc)
+		return -EINVAL;
+
+	ctx->pad2cam[pad_id] = camtg;
+
+	/* change cam-mux while streaming */
+	if (ctx->streaming && vc->cam != camtg) {
+		if (camtg == 0xff) {
+			old_camtg = vc->cam;
+			vc->cam = 0xff;
+			mtk_cam_seninf_switch_to_cammux_inner_page(ctx, true);
+			mtk_cam_seninf_set_cammux_next_ctrl(ctx, 0x1f, old_camtg);
+			mtk_cam_seninf_disable_cammux(ctx, old_camtg);
+		} else {
+			/* disable old */
+			old_camtg = vc->cam;
+			/* enable new */
+			vc->cam = camtg;
+			mtk_cam_seninf_switch_to_cammux_inner_page(ctx, true);
+			mtk_cam_seninf_set_cammux_next_ctrl(ctx, 0x1f, vc->cam);
+
+			mtk_cam_seninf_switch_to_cammux_inner_page(ctx, false);
+
+			mtk_cam_seninf_set_cammux_vc(ctx, vc->cam,
+						     0, vc->dt,
+						     !!vc->dt, !!vc->dt);
+			mtk_cam_seninf_set_cammux_src(ctx, vc->mux, vc->cam,);
+			mtk_cam_seninf_set_cammux_chk_pixel_mode(ctx,
+								 vc->cam,
+								 vc->pixel_mode);
+			if (old_camtg != 0xff && disable_last) {
+				/* disable old in next sof */
+				mtk_cam_seninf_disable_cammux(ctx, old_camtg);
+			}
+			mtk_cam_seninf_cammux(ctx, vc->cam); /* enable in next sof */
+			mtk_cam_seninf_switch_to_cammux_inner_page(ctx, true);
+			mtk_cam_seninf_set_cammux_next_ctrl(ctx, vc->mux, vc->cam);
+			if (old_camtg != 0xff && disable_last)
+				mtk_cam_seninf_set_cammux_next_ctrl(ctx,
+								    vc->mux,
+								    old_camtg);
+
+			/* user control sensor fsync after change cam-mux */
+		}
+
+		dev_info(ctx->dev, "%s: pad %d mux %d cam %d -> %d\n",
+			 __func__, vc->out_pad, vc->mux, old_camtg, vc->cam);
+	} else {
+		dev_info(ctx->dev, "%s: pad_id %d, camtg %d, ctx->streaming %d, vc->cam %d\n",
+			 __func__, pad_id, camtg, ctx->streaming, vc->cam);
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_camtg(struct v4l2_subdev *sd, int pad_id, int camtg)
+{
+	return _mtk_cam_seninf_set_camtg(sd, pad_id, camtg, true);
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
new file mode 100755
index 000000000000..f0698b9f9df4
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_ROUTE_H__
+#define __MTK_CAM_SENINF_ROUTE_H__
+
+#define MAX_MUX_CHANNEL 4
+
+void mtk_cam_seninf_init_res(struct seninf_core *core);
+
+struct seninf_mux *mtk_cam_seninf_mux_get(struct seninf_ctx *ctx);
+struct seninf_mux *mtk_cam_seninf_mux_get_pref(struct seninf_ctx *ctx, int pref_cnt);
+void mtk_cam_seninf_mux_put(struct seninf_ctx *ctx, struct seninf_mux *mux);
+void mtk_cam_seninf_release_mux(struct seninf_ctx *ctx);
+struct seninf_vc *mtk_cam_seninf_get_vc_by_pad(struct seninf_ctx *ctx, int idx);
+int mtk_cam_seninf_get_vcinfo(struct seninf_ctx *ctx);
+
+#endif /* __MTK_CAM_SENINF_ROUTE_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
new file mode 100755
index 000000000000..efd6c30ce4b4
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_H__
+#define __MTK_CAM_SENINF_H__
+
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+
+#include "mtk_cam-seninf-def.h"
+#include "kd_imgsensor_define_v4l2.h"
+#include "mtk_cam-seninf-regs.h"
+
+struct seninf_mux {
+	struct list_head list;
+	int idx;
+};
+
+struct seninf_vc {
+	u8 dt;
+	u8 feature;
+	u8 out_pad;
+	u8 pixel_mode;
+	u8 mux; /* allocated per group */
+	u8 cam; /* assigned by cam driver */
+	u8 enable;
+};
+
+struct seninf_vcinfo {
+	struct seninf_vc vc[SENINF_VC_MAXCNT];
+	int cnt;
+};
+
+struct seninf_dfs {
+	struct device *dev;
+	struct regulator *reg;
+	unsigned long *freqs;
+	unsigned long *volts;
+	int cnt;
+};
+
+struct seninf_core {
+	struct device *dev;
+	int pm_domain_cnt;
+	struct device **pm_domain_devs;
+	struct clk *clk[CLK_MAXCNT];
+	struct seninf_dfs dfs;
+	struct list_head list;
+	struct list_head list_mux; /* available mux */
+	struct seninf_mux mux[SENINF_MUX_NUM];
+	struct mutex mutex;  /* protect seninf core operations */
+	void __iomem *reg_if;
+	void __iomem *reg_ana;
+	int refcnt;
+
+	/* platform properties */
+	int cphy_settle_delay_dt;
+	int dphy_settle_delay_dt;
+	int settle_delay_ck;
+	int hs_trail_parameter;
+
+	/* protect variables in irq handler */
+	spinlock_t spinlock_irq;
+
+	/* mipi error detection count */
+	unsigned int detection_cnt;
+	/* enable csi irq flag */
+	unsigned int csi_irq_en_flag;
+};
+
+struct seninf_ctx {
+	struct v4l2_subdev subdev;
+	struct v4l2_async_notifier notifier;
+	struct device *dev;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct media_pad pads[PAD_MAXCNT];
+	struct v4l2_subdev_format fmt[PAD_MAXCNT];
+	struct seninf_core *core;
+	struct list_head list;
+
+	u32 port;
+	u32 port_a;
+	u32 port_b;
+	u32 port_num;
+	u32 num_data_lanes;
+	s64 mipi_pixel_rate;
+	s64 buffered_pixel_rate;
+	s64 customized_pixel_rate;
+	unsigned int m_csi_efuse;
+
+	unsigned int is_4d1c:1;
+	unsigned int is_cphy:1;
+	unsigned int is_test_model:4;
+	unsigned int is_secure:1;
+	unsigned int sec_info_addr;
+	u32 seninf_idx;
+	int pad2cam[PAD_MAXCNT];
+
+	/* remote sensor */
+	struct v4l2_subdev *sensor_sd;
+	u32 sensor_pad_idx;
+
+	/* provided by sensor */
+	struct seninf_vcinfo vcinfo;
+	int fps_n;
+	int fps_d;
+
+	/* dfs */
+	int isp_freq;
+
+	void __iomem *reg_ana_csi_rx[CSI_PORT_MAX_NUM];
+	void __iomem *reg_ana_dphy_top[CSI_PORT_MAX_NUM];
+	void __iomem *reg_ana_cphy_top[CSI_PORT_MAX_NUM];
+	void __iomem *reg_if_top;
+	void __iomem *reg_if_ctrl[SENINF_NUM];
+	void __iomem *reg_if_cam_mux;
+	void __iomem *reg_if_cam_mux_gcsr;
+	void __iomem *reg_if_cam_mux_pcsr[SENINF_CAM_MUX_NUM];
+	void __iomem *reg_if_tg[SENINF_NUM];
+	void __iomem *reg_if_csi2[SENINF_NUM];
+	void __iomem *reg_if_mux[SENINF_MUX_NUM];
+
+	/* resources */
+	struct list_head list_mux; /* work mux */
+	struct list_head list_cam_mux;
+
+	/* flags */
+	unsigned int streaming:1;
+
+	int cphy_settle_delay_dt;
+	int dphy_settle_delay_dt;
+	int settle_delay_ck;
+	int hs_trail_parameter;
+
+	int open_refcnt;
+	struct mutex mutex;  /* protect seninf context */
+
+	/* csi irq */
+	unsigned int data_not_enough_cnt;
+	unsigned int err_lane_resync_cnt;
+	unsigned int crc_err_cnt;
+	unsigned int ecc_err_double_cnt;
+	unsigned int ecc_err_corrected_cnt;
+	/* seninf_mux fifo overrun irq */
+	unsigned int fifo_overrun_cnt;
+	/* cam_mux h/v size irq */
+	unsigned int size_err_cnt;
+	/* error flag */
+	unsigned int data_not_enough_flag;
+	unsigned int err_lane_resync_flag;
+	unsigned int crc_err_flag;
+	unsigned int ecc_err_double_flag;
+	unsigned int ecc_err_corrected_flag;
+	unsigned int fifo_overrun_flag;
+	unsigned int size_err_flag;
+};
+
+#endif /* __MTK_CAM_SENINF_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
new file mode 100755
index 000000000000..e00b8d3904a9
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 MediaTek Inc.
+
+mtk-cam-isp-objs += \
+	mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.o
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
new file mode 100755
index 000000000000..631578ecc060
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
@@ -0,0 +1,679 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#include <linux/bitfield.h>
+
+#ifndef __SENINF_CAM_MUX_H__
+#define __SENINF_CAM_MUX_H__
+
+// Register offset
+#define SENINF_CAM_MUX_CTRL_0  0x0000
+#define SENINF_CAM_MUX_CTRL_1  0x0004
+#define SENINF_CAM_MUX_CTRL_2  0x0008
+#define SENINF_CAM_MUX_CTRL_3  0x000c
+#define SENINF_CAM_MUX_EN      0x0010
+#define SENINF_CAM_MUX_CHK_EN  0x0018
+#define SENINF_CAM_MUX0_OPT    0x0020
+#define SENINF_CAM_MUX1_OPT    0x0024
+#define SENINF_CAM_MUX2_OPT    0x0028
+#define SENINF_CAM_MUX3_OPT    0x002c
+#define SENINF_CAM_MUX4_OPT    0x0030
+#define SENINF_CAM_MUX5_OPT    0x0034
+#define SENINF_CAM_MUX6_OPT    0x0038
+
+#define SENINF_CAM_MUX_CTRL(target)   (0x0100 + 0x10 * ((target) / 4))
+#define SENINF_CAM_MUX_CHK_CTL_1(target)   (0x0104 + 0x10 * (target))
+#define RG_SENINF_CAM_MUX_EXP_HSIZE        GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX_EXP_VSIZE        GENMASK(31, 16)
+
+// SENINF_CAM_MUX_CTRL_0
+#define RG_SENINF_CAM_MUX0_SRC_SEL   GENMASK(3, 0)
+#define RG_SENINF_CAM_MUX1_SRC_SEL   GENMASK(11, 8)
+#define RG_SENINF_CAM_MUX2_SRC_SEL   GENMASK(19, 16)
+#define RG_SENINF_CAM_MUX3_SRC_SEL   GENMASK(27, 24)
+
+// SENINF_CAM_MUX_CTRL_1
+#define RG_SENINF_CAM_MUX4_SRC_SEL   GENMASK(3, 0)
+#define RG_SENINF_CAM_MUX5_SRC_SEL   GENMASK(11, 8)
+#define RG_SENINF_CAM_MUX6_SRC_SEL   GENMASK(19, 16)
+#define RG_SENINF_CAM_MUX7_SRC_SEL   GENMASK(27, 24)
+
+// SENINF_CAM_MUX_CTRL_2
+#define RG_SENINF_CAM_MUX8_SRC_SEL   GENMASK(3, 0)
+#define RG_SENINF_CAM_MUX9_SRC_SEL   GENMASK(11, 8)
+#define RG_SENINF_CAM_MUX10_SRC_SEL  GENMASK(19, 16)
+#define RG_SENINF_CAM_MUX11_SRC_SEL  GENMASK(27, 24)
+
+// SENINF_CAM_MUX_CTRL_3
+#define RG_SENINF_CAM_MUX12_SRC_SEL  GENMASK(3, 0)
+#define RG_SENINF_CAM_MUX13_SRC_SEL  GENMASK(11, 8)
+#define RG_SENINF_CAM_MUX14_SRC_SEL  GENMASK(19, 16)
+#define RG_SENINF_CAM_MUX15_SRC_SEL  GENMASK(27, 24)
+
+// SENINF_CAM_MUX_EN
+#define SENINF_CAM_MUX0_EN   GENMASK(0, 0)
+#define SENINF_CAM_MUX1_EN   GENMASK(1, 1)
+#define SENINF_CAM_MUX2_EN   GENMASK(2, 2)
+#define SENINF_CAM_MUX3_EN   GENMASK(3, 3)
+#define SENINF_CAM_MUX4_EN   GENMASK(4, 4)
+#define SENINF_CAM_MUX5_EN   GENMASK(5, 5)
+#define SENINF_CAM_MUX6_EN   GENMASK(6, 6)
+#define SENINF_CAM_MUX7_EN   GENMASK(7, 7)
+#define SENINF_CAM_MUX8_EN   GENMASK(8, 8)
+#define SENINF_CAM_MUX9_EN   GENMASK(9, 9)
+#define SENINF_CAM_MUX10_EN  GENMASK(10, 10)
+#define SENINF_CAM_MUX11_EN  GENMASK(11, 11)
+#define SENINF_CAM_MUX12_EN  GENMASK(12, 12)
+#define SENINF_CAM_MUX13_EN  GENMASK(13, 13)
+#define SENINF_CAM_MUX14_EN  GENMASK(14, 14)
+#define SENINF_CAM_MUX15_EN  GENMASK(15, 15)
+
+// SENINF_CAM_MUX_CHK_EN
+#define SENINF_CAM_MUX0_CHK_EN   GENMASK(0, 0)
+#define SENINF_CAM_MUX1_CHK_EN   GENMASK(1, 1)
+#define SENINF_CAM_MUX2_CHK_EN   GENMASK(2, 2)
+#define SENINF_CAM_MUX3_CHK_EN   GENMASK(3, 3)
+#define SENINF_CAM_MUX4_CHK_EN   GENMASK(4, 4)
+#define SENINF_CAM_MUX5_CHK_EN   GENMASK(5, 5)
+#define SENINF_CAM_MUX6_CHK_EN   GENMASK(6, 6)
+#define SENINF_CAM_MUX7_CHK_EN   GENMASK(7, 7)
+#define SENINF_CAM_MUX8_CHK_EN   GENMASK(8, 8)
+#define SENINF_CAM_MUX9_CHK_EN   GENMASK(9, 9)
+#define SENINF_CAM_MUX10_CHK_EN  GENMASK(10, 10)
+#define SENINF_CAM_MUX11_CHK_EN  GENMASK(11, 11)
+#define SENINF_CAM_MUX12_CHK_EN  GENMASK(12, 12)
+#define SENINF_CAM_MUX13_CHK_EN  GENMASK(13, 13)
+#define SENINF_CAM_MUX14_CHK_EN  GENMASK(14, 14)
+#define SENINF_CAM_MUX15_CHK_EN  GENMASK(15, 15)
+
+// SENINF_CAM_MUXx_OPT
+#define RG_SENINF_CAM_MUXx_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUXx_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUXx_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUXx_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUXx_VSYNC_BYPASS  GENMASK(24, 24)
+
+#define RG_SENINF_CAM_MUX0_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX0_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX0_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX0_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX0_VSYNC_BYPASS  GENMASK(24, 24)
+
+#define RG_SENINF_CAM_MUX1_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX1_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX1_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX1_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX1_VSYNC_BYPASS  GENMASK(24, 24)
+
+#define RG_SENINF_CAM_MUX2_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX2_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX2_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX2_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX2_VSYNC_BYPASS  GENMASK(24, 24)
+
+#define RG_SENINF_CAM_MUX3_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX3_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX3_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX3_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX3_VSYNC_BYPASS  GENMASK(24, 24)
+
+#define RG_SENINF_CAM_MUX4_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX4_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX4_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX4_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX4_VSYNC_BYPASS  GENMASK(24, 24)
+
+#define RG_SENINF_CAM_MUX5_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX5_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX5_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX5_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX5_VSYNC_BYPASS  GENMASK(24, 24)
+
+#define RG_SENINF_CAM_MUX6_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX6_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX6_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX6_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX6_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX7_OPT
+#define SENINF_CAM_MUX7_OPT 0x003c
+#define RG_SENINF_CAM_MUX7_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX7_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX7_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX7_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX7_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX8_OPT
+#define SENINF_CAM_MUX8_OPT 0x0040
+#define RG_SENINF_CAM_MUX8_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX8_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX8_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX8_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX8_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX9_OPT
+#define SENINF_CAM_MUX9_OPT 0x0044
+#define RG_SENINF_CAM_MUX9_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX9_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX9_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX9_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX9_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX10_OPT
+#define SENINF_CAM_MUX10_OPT 0x0048
+#define RG_SENINF_CAM_MUX10_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX10_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX10_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX10_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX10_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX11_OPT
+#define SENINF_CAM_MUX11_OPT 0x004c
+#define RG_SENINF_CAM_MUX11_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX11_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX11_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX11_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX11_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX12_OPT
+#define SENINF_CAM_MUX12_OPT 0x0050
+#define RG_SENINF_CAM_MUX12_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX12_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX12_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX12_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX12_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX13_OPT
+#define SENINF_CAM_MUX13_OPT 0x0054
+#define RG_SENINF_CAM_MUX13_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX13_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX13_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX13_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX13_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX14_OPT
+#define SENINF_CAM_MUX14_OPT 0x0058
+#define RG_SENINF_CAM_MUX14_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX14_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX14_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX14_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX14_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX15_OPT
+#define SENINF_CAM_MUX15_OPT 0x005c
+#define RG_SENINF_CAM_MUX15_VC_EN         GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX15_DT_EN         GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX15_VC_SEL        GENMASK(12, 8)
+#define RG_SENINF_CAM_MUX15_DT_SEL        GENMASK(21, 16)
+#define RG_SENINF_CAM_MUX15_VSYNC_BYPASS  GENMASK(24, 24)
+
+// SENINF_CAM_MUX_CTRL
+//#define SENINF_CAM_MUX_CTRL 0x0080
+#define SENINF_CAM_MUX_SW_RST                GENMASK(0, 0)
+#define SENINF_CAM_MUX_IRQ_SW_RST            GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX_SLICE_FULL_OPT     GENMASK(7, 7)
+#define RG_SENINF_CAM_MUX_IRQ_CLR_MODE       GENMASK(8, 8)
+#define RG_SENINF_CAM_MUX_IRQ_VERIF_EN       GENMASK(9, 9)
+
+// SENINF_CAM_MUX_DYN_CTRL
+#define SENINF_CAM_MUX_DYN_CTRL 0x0088
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_BSY0    GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_BSY1    GENMASK(4, 4)
+#define CAM_MUX_DYN_PAGE_SEL                 GENMASK(28, 28)
+
+// SENINF_CAM_MUX_DYN_EN
+#define SENINF_CAM_MUX_DYN_EN 0x008c
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_EN0     GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_EN1     GENMASK(31, 16)
+
+// SENINF_CAM_MUX_NEXT_CTRL_0
+#define SENINF_CAM_MUX_NEXT_CTRL_0 0x0090
+#define CAM_MUX0_NEXT_SRC_SEL    GENMASK(3, 0)
+#define CAM_MUX1_NEXT_SRC_SEL    GENMASK(11, 8)
+#define CAM_MUX2_NEXT_SRC_SEL    GENMASK(19, 16)
+#define CAM_MUX3_NEXT_SRC_SEL    GENMASK(27, 24)
+
+// SENINF_CAM_MUX_NEXT_CTRL_1
+#define SENINF_CAM_MUX_NEXT_CTRL_1 0x0094
+#define CAM_MUX4_NEXT_SRC_SEL    GENMASK(3, 0)
+#define CAM_MUX5_NEXT_SRC_SEL    GENMASK(11, 8)
+#define CAM_MUX6_NEXT_SRC_SEL    GENMASK(19, 16)
+#define CAM_MUX7_NEXT_SRC_SEL    GENMASK(27, 24)
+
+// SENINF_CAM_MUX_NEXT_CTRL_2
+#define SENINF_CAM_MUX_NEXT_CTRL_2 0x0098
+#define CAM_MUX8_NEXT_SRC_SEL    GENMASK(3, 0)
+#define CAM_MUX9_NEXT_SRC_SEL    GENMASK(11, 8)
+#define CAM_MUX10_NEXT_SRC_SEL   GENMASK(19, 16)
+#define CAM_MUX11_NEXT_SRC_SEL   GENMASK(27, 24)
+
+// SENINF_CAM_MUX_NEXT_CTRL_3
+#define SENINF_CAM_MUX_NEXT_CTRL_3 0x009c
+#define CAM_MUX12_NEXT_SRC_SEL   GENMASK(3, 0)
+#define CAM_MUX13_NEXT_SRC_SEL   GENMASK(11, 8)
+#define CAM_MUX14_NEXT_SRC_SEL   GENMASK(19, 16)
+#define CAM_MUX15_NEXT_SRC_SEL   GENMASK(27, 24)
+
+// SENINF_CAM_MUX_IRQ_EN
+#define SENINF_CAM_MUX_IRQ_EN 0x00a0
+#define RG_SENINF_CAM_MUX0_HSIZE_ERR_IRQ_EN   GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX0_VSIZE_ERR_IRQ_EN   GENMASK(1, 1)
+#define RG_SENINF_CAM_MUX1_HSIZE_ERR_IRQ_EN   GENMASK(2, 2)
+#define RG_SENINF_CAM_MUX1_VSIZE_ERR_IRQ_EN   GENMASK(3, 3)
+#define RG_SENINF_CAM_MUX2_HSIZE_ERR_IRQ_EN   GENMASK(4, 4)
+#define RG_SENINF_CAM_MUX2_VSIZE_ERR_IRQ_EN   GENMASK(5, 5)
+#define RG_SENINF_CAM_MUX3_HSIZE_ERR_IRQ_EN   GENMASK(6, 6)
+#define RG_SENINF_CAM_MUX3_VSIZE_ERR_IRQ_EN   GENMASK(7, 7)
+#define RG_SENINF_CAM_MUX4_HSIZE_ERR_IRQ_EN   GENMASK(8, 8)
+#define RG_SENINF_CAM_MUX4_VSIZE_ERR_IRQ_EN   GENMASK(9, 9)
+#define RG_SENINF_CAM_MUX5_HSIZE_ERR_IRQ_EN   GENMASK(10, 10)
+#define RG_SENINF_CAM_MUX5_VSIZE_ERR_IRQ_EN   GENMASK(11, 11)
+#define RG_SENINF_CAM_MUX6_HSIZE_ERR_IRQ_EN   GENMASK(12, 12)
+#define RG_SENINF_CAM_MUX6_VSIZE_ERR_IRQ_EN   GENMASK(13, 13)
+#define RG_SENINF_CAM_MUX7_HSIZE_ERR_IRQ_EN   GENMASK(14, 14)
+#define RG_SENINF_CAM_MUX7_VSIZE_ERR_IRQ_EN   GENMASK(15, 15)
+#define RG_SENINF_CAM_MUX8_HSIZE_ERR_IRQ_EN   GENMASK(16, 16)
+#define RG_SENINF_CAM_MUX8_VSIZE_ERR_IRQ_EN   GENMASK(17, 17)
+#define RG_SENINF_CAM_MUX9_HSIZE_ERR_IRQ_EN   GENMASK(18, 18)
+#define RG_SENINF_CAM_MUX9_VSIZE_ERR_IRQ_EN   GENMASK(19, 19)
+#define RG_SENINF_CAM_MUX10_HSIZE_ERR_IRQ_EN  GENMASK(20, 20)
+#define RG_SENINF_CAM_MUX10_VSIZE_ERR_IRQ_EN  GENMASK(21, 21)
+#define RG_SENINF_CAM_MUX11_HSIZE_ERR_IRQ_EN  GENMASK(22, 22)
+#define RG_SENINF_CAM_MUX11_VSIZE_ERR_IRQ_EN  GENMASK(23, 23)
+#define RG_SENINF_CAM_MUX12_HSIZE_ERR_IRQ_EN  GENMASK(24, 24)
+#define RG_SENINF_CAM_MUX12_VSIZE_ERR_IRQ_EN  GENMASK(25, 25)
+#define RG_SENINF_CAM_MUX13_HSIZE_ERR_IRQ_EN  GENMASK(26, 26)
+#define RG_SENINF_CAM_MUX13_VSIZE_ERR_IRQ_EN  GENMASK(27, 27)
+#define RG_SENINF_CAM_MUX14_HSIZE_ERR_IRQ_EN  GENMASK(28, 28)
+#define RG_SENINF_CAM_MUX14_VSIZE_ERR_IRQ_EN  GENMASK(29, 29)
+#define RG_SENINF_CAM_MUX15_HSIZE_ERR_IRQ_EN  GENMASK(30, 30)
+#define RG_SENINF_CAM_MUX15_VSIZE_ERR_IRQ_EN  GENMASK(31, 31)
+
+// SENINF_CAM_MUX_IRQ_STATUS
+#define SENINF_CAM_MUX_IRQ_STATUS 0x00a8
+#define RO_SENINF_CAM_MUX0_HSIZE_ERR_IRQ    GENMASK(0, 0)
+#define RO_SENINF_CAM_MUX0_VSIZE_ERR_IRQ    GENMASK(1, 1)
+#define RO_SENINF_CAM_MUX1_HSIZE_ERR_IRQ    GENMASK(2, 2)
+#define RO_SENINF_CAM_MUX1_VSIZE_ERR_IRQ    GENMASK(3, 3)
+#define RO_SENINF_CAM_MUX2_HSIZE_ERR_IRQ    GENMASK(4, 4)
+#define RO_SENINF_CAM_MUX2_VSIZE_ERR_IRQ    GENMASK(5, 5)
+#define RO_SENINF_CAM_MUX3_HSIZE_ERR_IRQ    GENMASK(6, 6)
+#define RO_SENINF_CAM_MUX3_VSIZE_ERR_IRQ    GENMASK(7, 7)
+#define RO_SENINF_CAM_MUX4_HSIZE_ERR_IRQ    GENMASK(8, 8)
+#define RO_SENINF_CAM_MUX4_VSIZE_ERR_IRQ    GENMASK(9, 9)
+#define RO_SENINF_CAM_MUX5_HSIZE_ERR_IRQ    GENMASK(10, 10)
+#define RO_SENINF_CAM_MUX5_VSIZE_ERR_IRQ    GENMASK(11, 11)
+#define RO_SENINF_CAM_MUX6_HSIZE_ERR_IRQ    GENMASK(12, 12)
+#define RO_SENINF_CAM_MUX6_VSIZE_ERR_IRQ    GENMASK(13, 13)
+#define RO_SENINF_CAM_MUX7_HSIZE_ERR_IRQ    GENMASK(14, 14)
+#define RO_SENINF_CAM_MUX7_VSIZE_ERR_IRQ    GENMASK(15, 15)
+#define RO_SENINF_CAM_MUX8_HSIZE_ERR_IRQ    GENMASK(16, 16)
+#define RO_SENINF_CAM_MUX8_VSIZE_ERR_IRQ    GENMASK(17, 17)
+#define RO_SENINF_CAM_MUX9_HSIZE_ERR_IRQ    GENMASK(18, 18)
+#define RO_SENINF_CAM_MUX9_VSIZE_ERR_IRQ    GENMASK(19, 19)
+#define RO_SENINF_CAM_MUX10_HSIZE_ERR_IRQ   GENMASK(20, 20)
+#define RO_SENINF_CAM_MUX10_VSIZE_ERR_IRQ   GENMASK(21, 21)
+#define RO_SENINF_CAM_MUX11_HSIZE_ERR_IRQ   GENMASK(22, 22)
+#define RO_SENINF_CAM_MUX11_VSIZE_ERR_IRQ   GENMASK(23, 23)
+#define RO_SENINF_CAM_MUX12_HSIZE_ERR_IRQ   GENMASK(24, 24)
+#define RO_SENINF_CAM_MUX12_VSIZE_ERR_IRQ   GENMASK(25, 25)
+#define RO_SENINF_CAM_MUX13_HSIZE_ERR_IRQ   GENMASK(26, 26)
+#define RO_SENINF_CAM_MUX13_VSIZE_ERR_IRQ   GENMASK(27, 27)
+#define RO_SENINF_CAM_MUX14_HSIZE_ERR_IRQ   GENMASK(28, 28)
+#define RO_SENINF_CAM_MUX14_VSIZE_ERR_IRQ   GENMASK(29, 29)
+#define RO_SENINF_CAM_MUX15_HSIZE_ERR_IRQ   GENMASK(30, 30)
+#define RO_SENINF_CAM_MUX15_VSIZE_ERR_IRQ   GENMASK(31, 31)
+
+// SENINF_CAM_MUX_VSYNC_IRQ_EN
+#define SENINF_CAM_MUX_VSYNC_IRQ_EN 0x00b0
+#define RG_SENINF_CAM_MUX_VSYNC_IRQ_EN         GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX_VSYNC_ALL_IRQ_EN     GENMASK(25, 24)
+#define RG_SENINF_CAM_MUX_VSYNC_ALL_NONE_IRQ_EN GENMASK(29, 28)
+
+// SENINF_CAM_MUX_VSYNC_IRQ_STS
+#define SENINF_CAM_MUX_VSYNC_IRQ_STS 0x00b4
+#define RO_SENINF_CAM_MUX_VSYNC_IRQ         GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX_VSYNC_ALL_IRQ     GENMASK(25, 24)
+#define RG_SENINF_CAM_MUX_VSYNC_ALL_NONE_IRQ GENMASK(29, 28)
+
+// SENINF_CAM_MUX_DBG_CTRL
+#define SENINF_CAM_MUX_DBG_CTRL 0x00c0
+#define RG_SENINF_CAM_MUX_DBG_EN   GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX_DBG_SEL  GENMASK(15, 8)
+
+// SENINF_CAM_MUX_DBG_OUT
+#define SENINF_CAM_MUX_DBG_OUT 0x00c4
+#define RO_SENINF_CAM_MUX_DBG_OUT  GENMASK(31, 0)
+
+// SENINF_CAM_MUX_VSYNC_T0_WINDOW_L
+#define SENINF_CAM_MUX_VSYNC_T0_WINDOW_L 0x00d0
+#define RG_SENINF_CAM_MUX_VSYNC_TIMER0_WINDOW_L GENMASK(31, 0)
+
+// SENINF_CAM_MUX_VSYNC_T1_WINDOW_L
+#define SENINF_CAM_MUX_VSYNC_T1_WINDOW_L 0x00d8
+#define RG_SENINF_CAM_MUX_VSYNC_TIMER1_WINDOW_L GENMASK(31, 0)
+
+// SENINF_CAM_MUX_SAT_IRQ_EN
+#define SENINF_CAM_MUX_SAT_IRQ_EN 0x00e0
+#define RG_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE0_IRQ_EN GENMASK(0, 0)
+#define RG_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE1_IRQ_EN GENMASK(1, 1)
+
+// SENINF_CAM_MUX_SAT_IRQ_STATUS
+#define SENINF_CAM_MUX_SAT_IRQ_STATUS 0x00e8
+#define RO_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE0_IRQ GENMASK(0, 0)
+#define RO_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE1_IRQ GENMASK(1, 1)
+
+// SENINF_CAM_SPARE
+#define SENINF_CAM_SPARE 0x00f8
+#define RG_SENINF_TOP_SPARE_0 GENMASK(7, 0)
+#define RG_SENINF_TOP_SPARE_1 GENMASK(23, 16)
+
+// SENINF_CAM_MUX0_CHK_CTL_0
+#define SENINF_CAM_MUX0_CHK_CTL_0 0x0100
+#define RG_SENINF_CAM_MUX0_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX0_CHK_CTL_1
+#define SENINF_CAM_MUX0_CHK_CTL_1 0x0104
+#define RG_SENINF_CAM_MUX0_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX0_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX0_CHK_RES
+#define SENINF_CAM_MUX0_CHK_RES 0x0108
+#define RO_SENINF_CAM_MUX0_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX0_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX0_CHK_ERR_RES
+#define SENINF_CAM_MUX0_CHK_ERR_RES 0x010c
+#define RO_SENINF_CAM_MUX0_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX0_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX1_CHK_CTL_0
+#define SENINF_CAM_MUX1_CHK_CTL_0 0x0110
+#define RG_SENINF_CAM_MUX1_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX1_CHK_CTL_1
+#define SENINF_CAM_MUX1_CHK_CTL_1 0x0114
+#define RG_SENINF_CAM_MUX1_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX1_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX1_CHK_RES
+#define SENINF_CAM_MUX1_CHK_RES 0x0118
+#define RO_SENINF_CAM_MUX1_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX1_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX1_CHK_ERR_RES
+#define SENINF_CAM_MUX1_CHK_ERR_RES 0x011c
+#define RO_SENINF_CAM_MUX1_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX1_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX2_CHK_CTL_0
+#define SENINF_CAM_MUX2_CHK_CTL_0 0x0120
+#define RG_SENINF_CAM_MUX2_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX2_CHK_CTL_1
+#define SENINF_CAM_MUX2_CHK_CTL_1 0x0124
+#define RG_SENINF_CAM_MUX2_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX2_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX2_CHK_RES
+#define SENINF_CAM_MUX2_CHK_RES 0x0128
+#define RO_SENINF_CAM_MUX2_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX2_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX2_CHK_ERR_RES
+#define SENINF_CAM_MUX2_CHK_ERR_RES 0x012c
+#define RO_SENINF_CAM_MUX2_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX2_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX3_CHK_CTL_0
+#define SENINF_CAM_MUX3_CHK_CTL_0 0x0130
+#define RG_SENINF_CAM_MUX3_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX3_CHK_CTL_1
+#define SENINF_CAM_MUX3_CHK_CTL_1 0x0134
+#define RG_SENINF_CAM_MUX3_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX3_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX3_CHK_RES
+#define SENINF_CAM_MUX3_CHK_RES 0x0138
+#define RO_SENINF_CAM_MUX3_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX3_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX3_CHK_ERR_RES
+#define SENINF_CAM_MUX3_CHK_ERR_RES 0x013c
+#define RO_SENINF_CAM_MUX3_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX3_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX4_CHK_CTL_0
+#define SENINF_CAM_MUX4_CHK_CTL_0 0x0140
+#define RG_SENINF_CAM_MUX4_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX4_CHK_CTL_1
+#define SENINF_CAM_MUX4_CHK_CTL_1 0x0144
+#define RG_SENINF_CAM_MUX4_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX4_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX4_CHK_RES
+#define SENINF_CAM_MUX4_CHK_RES 0x0148
+#define RO_SENINF_CAM_MUX4_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX4_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX4_CHK_ERR_RES
+#define SENINF_CAM_MUX4_CHK_ERR_RES 0x014c
+#define RO_SENINF_CAM_MUX4_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX4_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX5_CHK_CTL_0
+#define SENINF_CAM_MUX5_CHK_CTL_0 0x0150
+#define RG_SENINF_CAM_MUX5_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX5_CHK_CTL_1
+#define SENINF_CAM_MUX5_CHK_CTL_1 0x0154
+#define RG_SENINF_CAM_MUX5_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX5_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX5_CHK_RES
+#define SENINF_CAM_MUX5_CHK_RES 0x0158
+#define RO_SENINF_CAM_MUX5_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX5_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX5_CHK_ERR_RES
+#define SENINF_CAM_MUX5_CHK_ERR_RES 0x015c
+#define RO_SENINF_CAM_MUX5_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX5_RCV_ERR_VSIZE GENMASK(31, 16)
+
+#include <linux/bitfield.h>
+
+// SENINF_CAM_MUX6_CHK_CTL_0
+#define SENINF_CAM_MUX6_CHK_CTL_0 0x0160
+#define RG_SENINF_CAM_MUX6_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX6_CHK_CTL_1
+#define SENINF_CAM_MUX6_CHK_CTL_1 0x0164
+#define RG_SENINF_CAM_MUX6_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX6_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX6_CHK_RES
+#define SENINF_CAM_MUX6_CHK_RES 0x0168
+#define RO_SENINF_CAM_MUX6_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX6_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX6_CHK_ERR_RES
+#define SENINF_CAM_MUX6_CHK_ERR_RES 0x016c
+#define RO_SENINF_CAM_MUX6_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX6_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX7_CHK_CTL_0
+#define SENINF_CAM_MUX7_CHK_CTL_0 0x0170
+#define RG_SENINF_CAM_MUX7_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX7_CHK_CTL_1
+#define SENINF_CAM_MUX7_CHK_CTL_1 0x0174
+#define RG_SENINF_CAM_MUX7_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX7_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX7_CHK_RES
+#define SENINF_CAM_MUX7_CHK_RES 0x0178
+#define RO_SENINF_CAM_MUX7_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX7_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX7_CHK_ERR_RES
+#define SENINF_CAM_MUX7_CHK_ERR_RES 0x017c
+#define RO_SENINF_CAM_MUX7_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX7_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX8_CHK_CTL_0
+#define SENINF_CAM_MUX8_CHK_CTL_0 0x0180
+#define RG_SENINF_CAM_MUX8_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX8_CHK_CTL_1
+#define SENINF_CAM_MUX8_CHK_CTL_1 0x0184
+#define RG_SENINF_CAM_MUX8_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX8_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX8_CHK_RES
+#define SENINF_CAM_MUX8_CHK_RES 0x0188
+#define RO_SENINF_CAM_MUX8_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX8_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX8_CHK_ERR_RES
+#define SENINF_CAM_MUX8_CHK_ERR_RES 0x018c
+#define RO_SENINF_CAM_MUX8_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX8_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX9_CHK_CTL_0
+#define SENINF_CAM_MUX9_CHK_CTL_0 0x0190
+#define RG_SENINF_CAM_MUX9_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX9_CHK_CTL_1
+#define SENINF_CAM_MUX9_CHK_CTL_1 0x0194
+#define RG_SENINF_CAM_MUX9_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX9_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX9_CHK_RES
+#define SENINF_CAM_MUX9_CHK_RES 0x0198
+#define RO_SENINF_CAM_MUX9_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX9_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX9_CHK_ERR_RES
+#define SENINF_CAM_MUX9_CHK_ERR_RES 0x019c
+#define RO_SENINF_CAM_MUX9_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX9_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX10_CHK_CTL_0
+#define SENINF_CAM_MUX10_CHK_CTL_0 0x01a0
+#define RG_SENINF_CAM_MUX10_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX10_CHK_CTL_1
+#define SENINF_CAM_MUX10_CHK_CTL_1 0x01a4
+#define RG_SENINF_CAM_MUX10_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX10_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX10_CHK_RES
+#define SENINF_CAM_MUX10_CHK_RES 0x01a8
+#define RO_SENINF_CAM_MUX10_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX10_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX10_CHK_ERR_RES
+#define SENINF_CAM_MUX10_CHK_ERR_RES 0x01ac
+#define RO_SENINF_CAM_MUX10_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX10_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX11_CHK_CTL_0
+#define SENINF_CAM_MUX11_CHK_CTL_0 0x01b0
+#define RG_SENINF_CAM_MUX11_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX11_CHK_CTL_1
+#define SENINF_CAM_MUX11_CHK_CTL_1 0x01b4
+#define RG_SENINF_CAM_MUX11_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX11_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX11_CHK_RES
+#define SENINF_CAM_MUX11_CHK_RES 0x01b8
+#define RO_SENINF_CAM_MUX11_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX11_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX11_CHK_ERR_RES
+#define SENINF_CAM_MUX11_CHK_ERR_RES 0x01bc
+#define RO_SENINF_CAM_MUX11_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX11_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX12_CHK_CTL_0
+#define SENINF_CAM_MUX12_CHK_CTL_0 0x01c0
+#define RG_SENINF_CAM_MUX12_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX12_CHK_CTL_1
+#define SENINF_CAM_MUX12_CHK_CTL_1 0x01c4
+#define RG_SENINF_CAM_MUX12_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX12_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX12_CHK_RES
+#define SENINF_CAM_MUX12_CHK_RES 0x01c8
+#define RO_SENINF_CAM_MUX12_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX12_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX12_CHK_ERR_RES
+#define SENINF_CAM_MUX12_CHK_ERR_RES 0x01cc
+#define RO_SENINF_CAM_MUX12_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX12_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX13_CHK_CTL_0
+#define SENINF_CAM_MUX13_CHK_CTL_0 0x01d0
+#define RG_SENINF_CAM_MUX13_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX13_CHK_CTL_1
+#define SENINF_CAM_MUX13_CHK_CTL_1 0x01d4
+#define RG_SENINF_CAM_MUX13_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX13_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX13_CHK_RES
+#define SENINF_CAM_MUX13_CHK_RES 0x01d8
+#define RO_SENINF_CAM_MUX13_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX13_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX13_CHK_ERR_RES
+#define SENINF_CAM_MUX13_CHK_ERR_RES 0x01dc
+#define RO_SENINF_CAM_MUX13_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX13_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX14_CHK_CTL_0
+#define SENINF_CAM_MUX14_CHK_CTL_0 0x01e0
+#define RG_SENINF_CAM_MUX14_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX14_CHK_CTL_1
+#define SENINF_CAM_MUX14_CHK_CTL_1 0x01e4
+#define RG_SENINF_CAM_MUX14_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX14_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX14_CHK_RES
+#define SENINF_CAM_MUX14_CHK_RES 0x01e8
+#define RO_SENINF_CAM_MUX14_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX14_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX14_CHK_ERR_RES
+#define SENINF_CAM_MUX14_CHK_ERR_RES 0x01ec
+#define RO_SENINF_CAM_MUX14_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX14_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX15_CHK_CTL_0
+#define SENINF_CAM_MUX15_CHK_CTL_0 0x01f0
+#define RG_SENINF_CAM_MUX15_PIX_MODE_SEL GENMASK(1, 0)
+
+// SENINF_CAM_MUX15_CHK_CTL_1
+#define SENINF_CAM_MUX15_CHK_CTL_1 0x01f4
+#define RG_SENINF_CAM_MUX15_EXP_HSIZE GENMASK(15, 0)
+#define RG_SENINF_CAM_MUX15_EXP_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX15_CHK_RES
+#define SENINF_CAM_MUX15_CHK_RES 0x01f8
+#define RO_SENINF_CAM_MUX15_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX15_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_CAM_MUX15_CHK_ERR_RES
+#define SENINF_CAM_MUX15_CHK_ERR_RES 0x01fc
+#define RO_SENINF_CAM_MUX15_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_CAM_MUX15_RCV_ERR_VSIZE GENMASK(31, 16)
+
+#endif
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
new file mode 100755
index 000000000000..7e72f34a297b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __CSI0_CPHY_TOP_H__
+#define __CSI0_CPHY_TOP_H__
+
+#include <linux/bitfield.h>
+
+// CPHY_RX_CTRL
+#define CPHY_RX_CTRL 0x0000
+#define CPHY_RX_TR0_LPRX_EN      GENMASK(0, 0)
+#define CPHY_RX_TR1_LPRX_EN      GENMASK(1, 1)
+#define CPHY_RX_TR2_LPRX_EN      GENMASK(2, 2)
+#define CPHY_RX_TR3_LPRX_EN      GENMASK(3, 3)
+#define CPHY_RX_TR0_HSRX_EN      GENMASK(4, 4)
+#define CPHY_RX_TR1_HSRX_EN      GENMASK(5, 5)
+#define CPHY_RX_TR2_HSRX_EN      GENMASK(6, 6)
+#define CPHY_RX_TR3_HSRX_EN      GENMASK(7, 7)
+#define CPHY_RX_TR0_BIST_EN      GENMASK(16, 16)
+#define CPHY_RX_TR1_BIST_EN      GENMASK(17, 17)
+#define CPHY_RX_TR2_BIST_EN      GENMASK(18, 18)
+#define CPHY_RX_TR3_BIST_EN      GENMASK(19, 19)
+
+// CPHY_RX_DETECT_CTRL_SYNC
+#define CPHY_RX_DETECT_CTRL_SYNC 0x0010
+#define RG_CPHY_RX_DETECT_7S_DIS_SYNC     GENMASK(0, 0)
+#define RG_CPHY_RX_DETECT_7S_MASK_SYNC    GENMASK(7, 1)
+#define RG_CPHY_RX_DETECT_7S_WORD_SYNC    GENMASK(28, 8)
+
+// CPHY_RX_DETECT_CTRL_ESCAPE
+#define CPHY_RX_DETECT_CTRL_ESCAPE 0x0014
+#define RG_CPHY_RX_DETECT_7S_DIS_ESCAPE   GENMASK(0, 0)
+#define RG_CPHY_RX_DETECT_7S_MASK_ESCAPE  GENMASK(7, 1)
+#define RG_CPHY_RX_DETECT_7S_WORD_ESCAPE  GENMASK(28, 8)
+
+// CPHY_RX_DETECT_CTRL_POST
+#define CPHY_RX_DETECT_CTRL_POST 0x0018
+#define RG_CPHY_RX_DETECT_7S_DIS_POST     GENMASK(0, 0)
+#define RG_CPHY_RX_DATA_VALID_POST_EN     GENMASK(4, 4)
+#define RG_CPHY_RX_DETECT_7S_WORD_POST    GENMASK(28, 8)
+
+// CPHY_RX_FSM_STATUS
+#define CPHY_RX_FSM_STATUS 0x00e4
+#define RO_CPHY_RX_TR0_FSM GENMASK(7, 0)
+#define RO_CPHY_RX_TR1_FSM GENMASK(15, 8)
+#define RO_CPHY_RX_TR2_FSM GENMASK(23, 16)
+#define RO_CPHY_RX_TR3_FSM GENMASK(31, 24)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
new file mode 100755
index 000000000000..fc8a190f040b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __CSI0_DPHY_TOP_H__
+#define __CSI0_DPHY_TOP_H__
+
+#include <linux/bitfield.h>
+
+// DPHY_RX_LANE_EN
+#define DPHY_RX_LANE_EN 0x0000
+#define DPHY_RX_LC0_EN    GENMASK(0, 0)
+#define DPHY_RX_LC1_EN    GENMASK(1, 1)
+#define DPHY_RX_LD0_EN    GENMASK(8, 8)
+#define DPHY_RX_LD1_EN    GENMASK(9, 9)
+#define DPHY_RX_LD2_EN    GENMASK(10, 10)
+#define DPHY_RX_LD3_EN    GENMASK(11, 11)
+#define DPHY_RX_SW_RST    GENMASK(31, 31)
+
+// DPHY_RX_LANE_SELECT
+#define DPHY_RX_LANE_SELECT 0x0004
+#define RG_DPHY_RX_LC0_SEL      GENMASK(2, 0)
+#define RG_DPHY_RX_LC1_SEL      GENMASK(6, 4)
+#define RG_DPHY_RX_LD0_SEL      GENMASK(10, 8)
+#define RG_DPHY_RX_LD1_SEL      GENMASK(14, 12)
+#define RG_DPHY_RX_LD2_SEL      GENMASK(18, 16)
+#define RG_DPHY_RX_LD3_SEL      GENMASK(22, 20)
+#define DPHY_RX_CK_DATA_MUX_EN  GENMASK(31, 31)
+
+// DPHY_RX_HS_RX_EN_SW
+#define DPHY_RX_HS_RX_EN_SW 0x0008
+#define RG_DPHY_RX_LC0_HSRX_EN_SW         GENMASK(0, 0)
+#define RG_DPHY_RX_LC1_HSRX_EN_SW         GENMASK(1, 1)
+#define RG_CDPHY_RX_LD0_TRIO0_HSRX_EN_SW  GENMASK(8, 8)
+#define RG_CDPHY_RX_LD1_TRIO1_HSRX_EN_SW  GENMASK(9, 9)
+#define RG_CDPHY_RX_LD2_TRIO2_HSRX_EN_SW  GENMASK(10, 10)
+#define RG_CDPHY_RX_LD2_TRIO3_HSRX_EN_SW  GENMASK(11, 11)
+
+// DPHY_RX_CLOCK_LANE0_HS_PARAMETER
+#define DPHY_RX_CLOCK_LANE0_HS_PARAMETER 0x0010
+#define RG_DPHY_RX_LC0_HS_PREPARE_PARAMETER GENMASK(7, 0)
+#define RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER  GENMASK(23, 16)
+#define RG_DPHY_RX_LC0_HS_PREPARE_EN        GENMASK(28, 28)
+#define RG_DPHY_RX_LC0_HS_OPTION            GENMASK(30, 30)
+
+// DPHY_RX_CLOCK_LANE1_HS_PARAMETER
+#define DPHY_RX_CLOCK_LANE1_HS_PARAMETER 0x0014
+#define RG_DPHY_RX_LC1_HS_PREPARE_PARAMETER GENMASK(7, 0)
+#define RG_DPHY_RX_LC1_HS_SETTLE_PARAMETER  GENMASK(23, 16)
+#define RG_DPHY_RX_LC1_HS_PREPARE_EN        GENMASK(28, 28)
+#define RG_DPHY_RX_LC1_HS_OPTION            GENMASK(30, 30)
+
+// DPHY_RX_DATA_LANE0_HS_PARAMETER
+#define DPHY_RX_DATA_LANE0_HS_PARAMETER 0x0020
+#define RG_CDPHY_RX_LD0_TRIO0_HS_PREPARE_PARAMETER GENMASK(7, 0)
+#define RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER          GENMASK(15, 8)
+#define RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER  GENMASK(23, 16)
+#define RG_CDPHY_RX_LD0_TRIO0_HS_PREPARE_EN        GENMASK(28, 28)
+#define RG_DPHY_RX_LD0_HS_TRAIL_EN                 GENMASK(29, 29)
+
+// DPHY_RX_DATA_LANE1_HS_PARAMETER
+#define DPHY_RX_DATA_LANE1_HS_PARAMETER 0x0024
+#define RG_CDPHY_RX_LD1_TRIO1_HS_PREPARE_PARAMETER GENMASK(7, 0)
+#define RG_DPHY_RX_LD1_HS_TRAIL_PARAMETER          GENMASK(15, 8)
+#define RG_CDPHY_RX_LD1_TRIO1_HS_SETTLE_PARAMETER  GENMASK(23, 16)
+#define RG_CDPHY_RX_LD1_TRIO1_HS_PREPARE_EN        GENMASK(28, 28)
+#define RG_DPHY_RX_LD1_HS_TRAIL_EN                 GENMASK(29, 29)
+
+// DPHY_RX_DATA_LANE2_HS_PARAMETER
+#define DPHY_RX_DATA_LANE2_HS_PARAMETER 0x0028
+#define RG_CDPHY_RX_LD2_TRIO2_HS_PREPARE_PARAMETER GENMASK(7, 0)
+#define RG_DPHY_RX_LD2_HS_TRAIL_PARAMETER          GENMASK(15, 8)
+#define RG_CDPHY_RX_LD2_TRIO2_HS_SETTLE_PARAMETER  GENMASK(23, 16)
+#define RG_CDPHY_RX_LD2_TRIO2_HS_PREPARE_EN        GENMASK(28, 28)
+#define RG_DPHY_RX_LD2_HS_TRAIL_EN                 GENMASK(29, 29)
+
+// DPHY_RX_DATA_LANE3_HS_PARAMETER
+#define DPHY_RX_DATA_LANE3_HS_PARAMETER 0x002c
+#define RG_CDPHY_RX_LD3_TRIO3_HS_PREPARE_PARAMETER GENMASK(7, 0)
+#define RG_DPHY_RX_LD3_HS_TRAIL_PARAMETER          GENMASK(15, 8)
+#define RG_CDPHY_RX_LD3_TRIO3_HS_SETTLE_PARAMETER  GENMASK(23, 16)
+#define RG_CDPHY_RX_LD3_TRIO3_HS_PREPARE_EN        GENMASK(28, 28)
+#define RG_DPHY_RX_LD3_HS_TRAIL_EN                 GENMASK(29, 29)
+
+// DPHY_RX_CLOCK_LANE_FSM
+#define DPHY_RX_CLOCK_LANE_FSM 0x0030
+#define RO_DPHY_RX_CL0_FSM GENMASK(5, 0)
+#define RO_DPHY_RX_CL1_FSM GENMASK(13, 8)
+
+// DPHY_RX_DATA_LANE_FSM
+#define DPHY_RX_DATA_LANE_FSM 0x0034
+#define RO_DPHY_RX_DL0_FSM GENMASK(7, 0)
+#define RO_DPHY_RX_DL1_FSM GENMASK(15, 8)
+#define RO_DPHY_RX_DL2_FSM GENMASK(23, 16)
+#define RO_DPHY_RX_DL3_FSM GENMASK(31, 24)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
new file mode 100755
index 000000000000..a3c926cc3cee
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
@@ -0,0 +1,1932 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+
+#include "../mtk_cam-seninf.h"
+#include "../mtk_cam-seninf-hw.h"
+#include "../mtk_cam-seninf-regs.h"
+#include "mtk_cam-seninf-top-ctrl.h"
+#include "mtk_cam-seninf-seninf1-mux.h"
+#include "mtk_cam-seninf-seninf1.h"
+#include "mtk_cam-seninf-seninf1-csi2.h"
+#include "mtk_cam-seninf-tg1.h"
+#include "mtk_cam-seninf-cammux.h"
+#include "mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h"
+#include "mtk_cam-seninf-csi0-cphy.h"
+#include "mtk_cam-seninf-csi0-dphy.h"
+#include "../kd_imgsensor_define_v4l2.h"
+
+static struct mtk_cam_seninf_cfg _seninf_cfg = {
+	.mux_num = 8,
+	.seninf_num = 4,
+	.cam_mux_num = 11,
+	.pref_mux_num = 11,
+};
+
+struct mtk_cam_seninf_cfg *g_seninf_cfg = &_seninf_cfg;
+
+static inline u32 get_port_num(int port)
+{
+    if (port >= CSI_PORT_0A)
+        return FIELD_GET(CSI_PORT_A_MASK, port - CSI_PORT_0A);
+    else
+        return port;
+}
+
+static inline void mtk_cam_seninf_set_di_ch_ctrl(void __iomem *pseninf,
+						 unsigned int stream_id,
+						 struct seninf_vc *vc)
+{
+	if (stream_id > SENINF_MAX_STREAM)
+		return;
+
+	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
+		    RG_CSI2_DT_SEL, vc->dt);
+	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
+		    RG_CSI2_VC_SEL, 0);
+	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
+		    RG_CSI2_DT_INTERLEAVE_MODE, 1);
+	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
+		    RG_CSI2_VC_INTERLEAVE_EN, 1);
+
+	switch (stream_id) {
+	case 0:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL,
+			    RG_CSI2_S0_GRP_EN, 1);
+		break;
+	case 1:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL,
+			    RG_CSI2_S1_GRP_EN, 1);
+		break;
+	case 2:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL,
+			    RG_CSI2_S2_GRP_EN, 1);
+		break;
+	case 3:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL,
+			    RG_CSI2_S3_GRP_EN, 1);
+		break;
+	case 4:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL,
+			    RG_CSI2_S4_GRP_EN, 1);
+		break;
+	case 5:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL,
+			    RG_CSI2_S5_GRP_EN, 1);
+		break;
+	case 6:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL,
+			    RG_CSI2_S6_GRP_EN, 1);
+		break;
+	case 7:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL,
+			    RG_CSI2_S7_GRP_EN, 1);
+		break;
+	default:
+		return;
+	}
+}
+
+int mtk_cam_seninf_init_iomem(struct seninf_ctx *ctx, void __iomem *if_base,
+			      void __iomem *ana_base)
+{
+	u32 i;
+
+	// reg_ana_csi_rx
+	ctx->reg_ana_csi_rx[CSI_PORT_0]  = ana_base + ANA_CSI_RX_PORT0_OFFSET;
+	ctx->reg_ana_csi_rx[CSI_PORT_0A] = ana_base + ANA_CSI_RX_PORT0_OFFSET;
+	ctx->reg_ana_csi_rx[CSI_PORT_0B] = ana_base + ANA_CSI_RX_PORT0B_OFFSET;
+
+	ctx->reg_ana_csi_rx[CSI_PORT_1]  = ana_base + ANA_CSI_RX_PORT1_OFFSET;
+	ctx->reg_ana_csi_rx[CSI_PORT_1A] = ana_base + ANA_CSI_RX_PORT1_OFFSET;
+	ctx->reg_ana_csi_rx[CSI_PORT_1B] = ana_base + ANA_CSI_RX_PORT1B_OFFSET;
+
+	ctx->reg_ana_csi_rx[CSI_PORT_2]  = ana_base + ANA_CSI_RX_PORT2_OFFSET;
+	ctx->reg_ana_csi_rx[CSI_PORT_2A] = ana_base + ANA_CSI_RX_PORT2_OFFSET;
+	ctx->reg_ana_csi_rx[CSI_PORT_2B] = ana_base + ANA_CSI_RX_PORT2B_OFFSET;
+
+	ctx->reg_ana_csi_rx[CSI_PORT_3]  = ana_base + ANA_CSI_RX_PORT3_OFFSET;
+	ctx->reg_ana_csi_rx[CSI_PORT_3A] = ana_base + ANA_CSI_RX_PORT3_OFFSET;
+	ctx->reg_ana_csi_rx[CSI_PORT_3B] = ana_base + ANA_CSI_RX_PORT3B_OFFSET;
+
+	// reg_ana_dphy_top
+	ctx->reg_ana_dphy_top[CSI_PORT_0]  = ana_base + ANA_DPHY_TOP_PORT0_OFFSET;
+	ctx->reg_ana_dphy_top[CSI_PORT_0A] = ana_base + ANA_DPHY_TOP_PORT0_OFFSET;
+	ctx->reg_ana_dphy_top[CSI_PORT_0B] = ana_base + ANA_DPHY_TOP_PORT0_OFFSET;
+
+	ctx->reg_ana_dphy_top[CSI_PORT_1]  = ana_base + ANA_DPHY_TOP_PORT1_OFFSET;
+	ctx->reg_ana_dphy_top[CSI_PORT_1A] = ana_base + ANA_DPHY_TOP_PORT1_OFFSET;
+	ctx->reg_ana_dphy_top[CSI_PORT_1B] = ana_base + ANA_DPHY_TOP_PORT1_OFFSET;
+
+	ctx->reg_ana_dphy_top[CSI_PORT_2]  = ana_base + ANA_DPHY_TOP_PORT2_OFFSET;
+	ctx->reg_ana_dphy_top[CSI_PORT_2A] = ana_base + ANA_DPHY_TOP_PORT2_OFFSET;
+	ctx->reg_ana_dphy_top[CSI_PORT_2B] = ana_base + ANA_DPHY_TOP_PORT2_OFFSET;
+
+	ctx->reg_ana_dphy_top[CSI_PORT_3]  = ana_base + ANA_DPHY_TOP_PORT3_OFFSET;
+	ctx->reg_ana_dphy_top[CSI_PORT_3A] = ana_base + ANA_DPHY_TOP_PORT3_OFFSET;
+	ctx->reg_ana_dphy_top[CSI_PORT_3B] = ana_base + ANA_DPHY_TOP_PORT3_OFFSET;
+
+	// reg_ana_cphy_top
+	ctx->reg_ana_cphy_top[CSI_PORT_0]  = ana_base + ANA_CPHY_TOP_PORT0_OFFSET;
+	ctx->reg_ana_cphy_top[CSI_PORT_0A] = ana_base + ANA_CPHY_TOP_PORT0_OFFSET;
+	ctx->reg_ana_cphy_top[CSI_PORT_0B] = ana_base + ANA_CPHY_TOP_PORT0_OFFSET;
+
+	ctx->reg_ana_cphy_top[CSI_PORT_1]  = ana_base + ANA_CPHY_TOP_PORT1_OFFSET;
+	ctx->reg_ana_cphy_top[CSI_PORT_1A] = ana_base + ANA_CPHY_TOP_PORT1_OFFSET;
+	ctx->reg_ana_cphy_top[CSI_PORT_1B] = ana_base + ANA_CPHY_TOP_PORT1_OFFSET;
+
+	ctx->reg_ana_cphy_top[CSI_PORT_2]  = ana_base + ANA_CPHY_TOP_PORT2_OFFSET;
+	ctx->reg_ana_cphy_top[CSI_PORT_2A] = ana_base + ANA_CPHY_TOP_PORT2_OFFSET;
+	ctx->reg_ana_cphy_top[CSI_PORT_2B] = ana_base + ANA_CPHY_TOP_PORT2_OFFSET;
+
+	ctx->reg_ana_cphy_top[CSI_PORT_3]  = ana_base + ANA_CPHY_TOP_PORT3_OFFSET;
+	ctx->reg_ana_cphy_top[CSI_PORT_3A] = ana_base + ANA_CPHY_TOP_PORT3_OFFSET;
+	ctx->reg_ana_cphy_top[CSI_PORT_3B] = ana_base + ANA_CPHY_TOP_PORT3_OFFSET;
+
+	ctx->reg_if_top = if_base;
+
+	for (i = SENINF_1; i < _seninf_cfg.seninf_num; i++) {
+		ctx->reg_if_ctrl[i]  = if_base + IF_CTRL_BASE_OFFSET  + (IF_PORT_STRIDE * i);
+		ctx->reg_if_tg[i]    = if_base + IF_TG_BASE_OFFSET    + (IF_PORT_STRIDE * i);
+		ctx->reg_if_csi2[i]  = if_base + IF_CSI2_BASE_OFFSET  + (IF_PORT_STRIDE * i);
+	}
+
+	for (i = SENINF_MUX1; i < _seninf_cfg.mux_num; i++)
+		ctx->reg_if_mux[i] = if_base + IF_MUX_BASE_OFFSET + (IF_PORT_STRIDE * i);
+
+	ctx->reg_if_cam_mux = if_base + IF_CAM_MUX_OFFSET;
+
+	return 0;
+}
+int mtk_cam_seninf_init_port(struct seninf_ctx *ctx, int port)
+{
+	u32 port_num;
+
+	port_num = get_port_num(port);
+
+	ctx->port = port;
+	ctx->port_num = port_num;
+	ctx->port_a = CSI_PORT_0A + (port_num << 1);
+	ctx->port_b = ctx->port_a + 1;
+	ctx->is_4d1c = (port == port_num);
+
+	ctx->seninf_idx = seninf_csi[port];
+
+	return 0;
+}
+
+int mtk_cam_seninf_is_cammux_used(struct seninf_ctx *ctx, int cam_mux)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+	u32 temp = readl(seninf_cam_mux + SENINF_CAM_MUX_EN);
+
+	return !!(temp & (1 << cam_mux));
+}
+
+int mtk_cam_seninf_cammux(struct seninf_ctx *ctx, int cam_mux)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+	u32 temp;
+
+	temp = readl(seninf_cam_mux + SENINF_CAM_MUX_EN);
+	SENINF_WRITE_REG(seninf_cam_mux, SENINF_CAM_MUX_EN,
+			 temp | BIT(cam_mux));
+
+	SENINF_WRITE_REG(seninf_cam_mux, SENINF_CAM_MUX_IRQ_STATUS,
+			 3 << (cam_mux * 2)); /* clr irq */
+
+	dev_dbg(ctx->dev, "cam_mux %d EN 0x%x IRQ_EN 0x%x IRQ_STATUS 0x%x\n",
+		cam_mux, readl(seninf_cam_mux + SENINF_CAM_MUX_EN),
+		readl(seninf_cam_mux + SENINF_CAM_MUX_IRQ_EN),
+		readl(seninf_cam_mux + SENINF_CAM_MUX_IRQ_STATUS));
+
+	return 0;
+}
+
+int mtk_cam_seninf_disable_cammux(struct seninf_ctx *ctx, int cam_mux)
+{
+	void __iomem *base = ctx->reg_if_cam_mux;
+	u32 temp;
+
+	temp = readl(base + SENINF_CAM_MUX_EN);
+
+	if ((1 << cam_mux) & temp) {
+		SENINF_WRITE_REG(base, SENINF_CAM_MUX_EN,
+				 temp & (~(1 << cam_mux)));
+
+		dev_dbg(ctx->dev, "cammux %d EN %x IRQ_EN %x IRQ_STATUS %x",
+			cam_mux, readl(base + SENINF_CAM_MUX_EN),
+			readl(base + SENINF_CAM_MUX_IRQ_EN),
+			readl(base + SENINF_CAM_MUX_IRQ_STATUS));
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_disable_all_cammux(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+
+	SENINF_WRITE_REG(seninf_cam_mux, SENINF_CAM_MUX_EN, 0);
+
+	dev_dbg(ctx->dev, "%s all cam_mux EN 0x%x\n", __func__,
+		readl(seninf_cam_mux + SENINF_CAM_MUX_EN));
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_top_mux_ctrl(struct seninf_ctx *ctx, int mux_idx,
+				    int seninf_src)
+{
+	void __iomem *seninf = ctx->reg_if_top;
+
+	switch (mux_idx) {
+	case SENINF_MUX1:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+			    RG_SENINF_MUX1_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX2:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+			    RG_SENINF_MUX2_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX3:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+			    RG_SENINF_MUX3_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX4:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+			    RG_SENINF_MUX4_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX5:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+			    RG_SENINF_MUX5_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX6:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+			    RG_SENINF_MUX6_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX7:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+			    RG_SENINF_MUX7_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX8:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+			    RG_SENINF_MUX8_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX9:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+			    RG_SENINF_MUX9_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX10:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+			    RG_SENINF_MUX10_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX11:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+			    RG_SENINF_MUX11_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX12:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+			    RG_SENINF_MUX12_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX13:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_3,
+			    RG_SENINF_MUX13_SRC_SEL, seninf_src);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid mux_idx %d\n", mux_idx);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_get_top_mux_ctrl(struct seninf_ctx *ctx, int mux_idx)
+{
+	void __iomem *seninf = ctx->reg_if_top;
+	u32 seninf_src = 0;
+
+	switch (mux_idx) {
+	case SENINF_MUX1:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+					      RG_SENINF_MUX1_SRC_SEL);
+		break;
+	case SENINF_MUX2:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+					      RG_SENINF_MUX2_SRC_SEL);
+		break;
+	case SENINF_MUX3:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+					      RG_SENINF_MUX3_SRC_SEL);
+		break;
+	case SENINF_MUX4:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+					      RG_SENINF_MUX4_SRC_SEL);
+		break;
+	case SENINF_MUX5:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+					      RG_SENINF_MUX5_SRC_SEL);
+		break;
+	case SENINF_MUX6:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+					      RG_SENINF_MUX6_SRC_SEL);
+		break;
+	case SENINF_MUX7:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+					      RG_SENINF_MUX7_SRC_SEL);
+		break;
+	case SENINF_MUX8:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+					      RG_SENINF_MUX8_SRC_SEL);
+		break;
+	case SENINF_MUX9:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+					      RG_SENINF_MUX9_SRC_SEL);
+		break;
+	case SENINF_MUX10:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+					      RG_SENINF_MUX10_SRC_SEL);
+		break;
+	case SENINF_MUX11:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+					      RG_SENINF_MUX11_SRC_SEL);
+		break;
+	case SENINF_MUX12:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+					      RG_SENINF_MUX12_SRC_SEL);
+		break;
+	case SENINF_MUX13:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_3,
+					      RG_SENINF_MUX13_SRC_SEL);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid mux_idx %d", mux_idx);
+		return -EINVAL;
+	}
+
+	return seninf_src;
+}
+
+int mtk_cam_seninf_get_cammux_ctrl(struct seninf_ctx *ctx, int cam_mux)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+	u32 seninf_mux_src = 0;
+
+	switch (cam_mux) {
+	case SENINF_CAM_MUX0:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_0,
+						  RG_SENINF_CAM_MUX0_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX1:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_0,
+						  RG_SENINF_CAM_MUX1_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX2:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_0,
+						  RG_SENINF_CAM_MUX2_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX3:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_0,
+						  RG_SENINF_CAM_MUX3_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX4:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_1,
+						  RG_SENINF_CAM_MUX4_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX5:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_1,
+						  RG_SENINF_CAM_MUX5_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX6:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_1,
+						  RG_SENINF_CAM_MUX6_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX7:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_1,
+						  RG_SENINF_CAM_MUX7_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX8:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_2,
+						  RG_SENINF_CAM_MUX8_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX9:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_2,
+						  RG_SENINF_CAM_MUX9_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX10:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_2,
+						  RG_SENINF_CAM_MUX10_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX11:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_2,
+						  RG_SENINF_CAM_MUX11_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX12:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_3,
+						  RG_SENINF_CAM_MUX12_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX13:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_3,
+						  RG_SENINF_CAM_MUX13_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX14:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_3,
+						  RG_SENINF_CAM_MUX14_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX15:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_3,
+						  RG_SENINF_CAM_MUX15_SRC_SEL);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid cam_mux %d", cam_mux);
+		return -EINVAL;
+	}
+
+	return seninf_mux_src;
+}
+
+u32 mtk_cam_seninf_get_cammux_res(struct seninf_ctx *ctx, int cam_mux)
+{
+	return readl(ctx->reg_if_cam_mux +
+			       SENINF_CAM_MUX0_CHK_RES + (0x10 * cam_mux));
+}
+
+int mtk_cam_seninf_set_cammux_vc(struct seninf_ctx *ctx, int cam_mux,
+				 int vc_sel, int dt_sel, int vc_en,
+				 int dt_en)
+{
+	void __iomem *seninf_cam_mux_vc_addr = ctx->reg_if_cam_mux + (cam_mux << 0x2);
+
+	SENINF_BITS(seninf_cam_mux_vc_addr, SENINF_CAM_MUX0_OPT,
+		    RG_SENINF_CAM_MUX0_VC_SEL, vc_sel);
+	SENINF_BITS(seninf_cam_mux_vc_addr, SENINF_CAM_MUX0_OPT,
+		    RG_SENINF_CAM_MUX0_DT_SEL, dt_sel);
+	SENINF_BITS(seninf_cam_mux_vc_addr, SENINF_CAM_MUX0_OPT,
+		    RG_SENINF_CAM_MUX0_VC_EN, vc_en);
+	SENINF_BITS(seninf_cam_mux_vc_addr, SENINF_CAM_MUX0_OPT,
+		    RG_SENINF_CAM_MUX0_DT_EN, dt_en);
+
+	return 0;
+}
+
+int mtk_cam_seninf_switch_to_cammux_inner_page(struct seninf_ctx *ctx,
+					       bool inner)
+{
+	void __iomem *seninf_cam_mux_addr = ctx->reg_if_cam_mux;
+
+	SENINF_BITS(seninf_cam_mux_addr, SENINF_CAM_MUX_DYN_CTRL,
+		    CAM_MUX_DYN_PAGE_SEL, inner ? 0 : 1);
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_cammux_next_ctrl(struct seninf_ctx *ctx, int src,
+					int target)
+{
+	void __iomem *seninf_cam_mux_base = ctx->reg_if_cam_mux;
+
+	if (target >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, target, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	switch (target) {
+	case SENINF_CAM_MUX0:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_0,
+			    CAM_MUX0_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX1:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_0,
+			    CAM_MUX1_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX2:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_0,
+			    CAM_MUX2_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX3:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_0,
+			    CAM_MUX3_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX4:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_1,
+			    CAM_MUX4_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX5:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_1,
+			    CAM_MUX5_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX6:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_1,
+			    CAM_MUX6_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX7:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_1,
+			    CAM_MUX7_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX8:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_2,
+			    CAM_MUX8_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX9:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_2,
+			    CAM_MUX9_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX10:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_2,
+			    CAM_MUX10_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX11:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_2,
+			    CAM_MUX11_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX12:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_3,
+			    CAM_MUX12_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX13:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_3,
+			    CAM_MUX13_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX14:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_3,
+			    CAM_MUX14_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX15:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_3,
+			    CAM_MUX15_NEXT_SRC_SEL, src);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid src %d target %d", src, target);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_cammux_src(struct seninf_ctx *ctx, int src,
+                                  int target)
+{
+    void __iomem *seninf_cam_mux_base = ctx->reg_if_cam_mux;
+
+    if (target < 0 || target >= _seninf_cfg.cam_mux_num) {
+        dev_dbg(ctx->dev,
+            "%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+            __func__, target, _seninf_cfg.cam_mux_num);
+        return 0;
+    }
+
+	switch (target) {
+	case SENINF_CAM_MUX0:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(0), RG_SENINF_CAM_MUX0_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX1:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(0), RG_SENINF_CAM_MUX1_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX2:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(0), RG_SENINF_CAM_MUX2_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX3:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(0), RG_SENINF_CAM_MUX3_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX4:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(1), RG_SENINF_CAM_MUX4_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX5:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(1), RG_SENINF_CAM_MUX5_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX6:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(1), RG_SENINF_CAM_MUX6_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX7:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(1), RG_SENINF_CAM_MUX7_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX8:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(2), RG_SENINF_CAM_MUX8_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX9:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(2), RG_SENINF_CAM_MUX9_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX10:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(2), RG_SENINF_CAM_MUX10_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX11:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(2), RG_SENINF_CAM_MUX11_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX12:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(3), RG_SENINF_CAM_MUX12_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX13:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(3), RG_SENINF_CAM_MUX13_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX14:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(3), RG_SENINF_CAM_MUX14_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX15:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL(3), RG_SENINF_CAM_MUX15_SRC_SEL, src);
+		break;
+	default:
+		dev_dbg(ctx->dev, "%s: invalid target %d\n", __func__, target);
+		return -EINVAL;
+	}
+
+    SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CHK_CTL_1(target),
+                RG_SENINF_CAM_MUX_EXP_HSIZE, 0);
+    SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CHK_CTL_1(target),
+                RG_SENINF_CAM_MUX_EXP_VSIZE, 0);
+
+    return 0;
+}
+
+int mtk_cam_seninf_set_vc(struct seninf_ctx *ctx, u32 seninf_idx,
+			  struct seninf_vcinfo *vcinfo)
+{
+	void __iomem *seninf_csi2 = ctx->reg_if_csi2[seninf_idx];
+	int i;
+	struct seninf_vc *vc;
+
+	if (WARN_ON(!vcinfo || !vcinfo->cnt))
+		return -EINVAL;
+
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S0_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S1_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S2_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S3_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S4_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S5_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S6_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S7_DI_CTRL, 0);
+
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH0_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH1_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH2_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH3_CTRL, 0);
+
+	for (i = 0; i < vcinfo->cnt; i++) {
+		vc = &vcinfo->vc[i];
+
+		/* General Long Packet Data Types: 0x10-0x17 */
+		if (vc->dt >= 0x10 && vc->dt <= 0x17) {
+			SENINF_BITS(seninf_csi2, SENINF_CSI2_OPT,
+				    RG_CSI2_GENERIC_LONG_PACKET_EN, 1);
+		}
+
+		mtk_cam_seninf_set_di_ch_ctrl(seninf_csi2, i, vc);
+	}
+
+	dev_dbg(ctx->dev, "DI_CTRL 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
+		readl(seninf_csi2 + SENINF_CSI2_S0_DI_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_S1_DI_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_S2_DI_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_S3_DI_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_S4_DI_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_S5_DI_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_S6_DI_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_S7_DI_CTRL));
+
+	dev_dbg(ctx->dev, "CH_CTRL 0x%x 0x%x 0x%x 0x%x\n",
+		readl(seninf_csi2 + SENINF_CSI2_CH0_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_CH1_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_CH2_CTRL),
+		readl(seninf_csi2 + SENINF_CSI2_CH3_CTRL));
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_mux_ctrl(struct seninf_ctx *ctx, u32 mux, int hs_pol,
+				int vs_pol, int src_sel, int pixel_mode)
+{
+	u32 temp = 0;
+	void __iomem *seninf_mux;
+
+	seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_1,
+		    RG_SENINF_MUX_SRC_SEL, src_sel);
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_1,
+		    RG_SENINF_MUX_PIX_MODE_SEL, pixel_mode);
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_OPT,
+		    RG_SENINF_MUX_HSYNC_POL, hs_pol);
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_OPT,
+		    RG_SENINF_MUX_VSYNC_POL, vs_pol);
+
+	temp = readl(seninf_mux + SENINF_MUX_CTRL_0);
+	SENINF_WRITE_REG(seninf_mux, SENINF_MUX_CTRL_0, temp |
+			 SENINF_MUX_IRQ_SW_RST | SENINF_MUX_SW_RST);
+	SENINF_WRITE_REG(seninf_mux, SENINF_MUX_CTRL_0, temp & 0xFFFFFFF9);
+
+	return 0;
+}
+
+int mtk_cam_seninf_update_mux_pixel_mode(struct seninf_ctx *ctx, u32 mux,
+					 int pixel_mode)
+{
+	u32 temp = 0;
+	void __iomem *seninf_mux;
+
+	seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_1,
+		    RG_SENINF_MUX_PIX_MODE_SEL, pixel_mode);
+
+	temp = readl(seninf_mux + SENINF_MUX_CTRL_0);
+	SENINF_WRITE_REG(seninf_mux, SENINF_MUX_CTRL_0, temp |
+			 SENINF_MUX_IRQ_SW_RST | SENINF_MUX_SW_RST);
+	SENINF_WRITE_REG(seninf_mux, SENINF_MUX_CTRL_0, temp & 0xFFFFFFF9);
+
+	dev_dbg(ctx->dev,
+		"%s mux %d SENINF_MUX_CTRL_1(0x%x), SENINF_MUX_OPT(0x%x)",
+		__func__, mux, readl(seninf_mux + SENINF_MUX_CTRL_1),
+		readl(seninf_mux + SENINF_MUX_OPT));
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_mux_crop(struct seninf_ctx *ctx, u32 mux, int start_x,
+				int end_x, int enable)
+{
+	void __iomem *seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CROP_PIX_CTRL,
+		    RG_SENINF_MUX_CROP_START_8PIX_CNT, start_x / 8);
+	SENINF_BITS(seninf_mux, SENINF_MUX_CROP_PIX_CTRL,
+		    RG_SENINF_MUX_CROP_END_8PIX_CNT,
+		    start_x / 8 + (end_x - start_x + 1) / 8 - 1 +
+			    (((end_x - start_x + 1) % 8) > 0 ? 1 : 0));
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_1,
+		    RG_SENINF_MUX_CROP_EN, enable);
+
+	dev_dbg(ctx->dev, "MUX_CROP_PIX_CTRL 0x%x MUX_CTRL_1 0x%x\n",
+		readl(seninf_mux + SENINF_MUX_CROP_PIX_CTRL),
+		readl(seninf_mux + SENINF_MUX_CTRL_1));
+
+	dev_dbg(ctx->dev, "mux %d, start %d, end %d, enable %d\n",
+		mux, start_x, end_x, enable);
+
+	return 0;
+}
+
+int mtk_cam_seninf_is_mux_used(struct seninf_ctx *ctx, u32 mux)
+{
+	void __iomem *seninf_mux = ctx->reg_if_mux[mux];
+
+	return SENINF_READ_BITS(seninf_mux, SENINF_MUX_CTRL_0, SENINF_MUX_EN);
+}
+
+int mtk_cam_seninf_mux(struct seninf_ctx *ctx, u32 mux)
+{
+	void __iomem *seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0, SENINF_MUX_EN, 1);
+	return 0;
+}
+
+int mtk_cam_seninf_disable_mux(struct seninf_ctx *ctx, u32 mux)
+{
+	int i;
+	void __iomem *seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0, SENINF_MUX_EN, 0);
+
+	/* also disable CAM_MUX with input from mux */
+	for (i = SENINF_CAM_MUX0; i < _seninf_cfg.cam_mux_num; i++) {
+		if (mux == mtk_cam_seninf_get_cammux_ctrl(ctx, i))
+			mtk_cam_seninf_disable_cammux(ctx, i);
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_disable_all_mux(struct seninf_ctx *ctx)
+{
+	int i;
+	void __iomem *seninf_mux;
+
+	for (i = 0; i < _seninf_cfg.mux_num; i++) {
+		seninf_mux = ctx->reg_if_mux[i];
+		SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0, SENINF_MUX_EN, 0);
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_cammux_chk_pixel_mode(struct seninf_ctx *ctx,
+					     int cam_mux, int pixel_mode)
+{
+	void __iomem *seninf_cam_mux_base = ctx->reg_if_cam_mux;
+
+	switch (cam_mux) {
+	case SENINF_CAM_MUX0:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX0_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX0_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX1:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX1_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX1_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX2:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX2_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX2_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX3:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX3_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX3_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX4:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX4_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX4_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX5:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX5_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX5_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX6:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX6_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX6_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX7:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX7_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX7_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX8:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX8_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX8_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX9:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX9_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX9_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX10:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX10_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX10_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX11:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX11_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX11_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX12:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX12_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX12_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX13:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX13_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX13_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX14:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX14_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX14_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX15:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX15_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX15_PIX_MODE_SEL, pixel_mode);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid cam_mux %d pixel_mode %d\n",
+			cam_mux, pixel_mode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void csirx_phy_a_power_off(struct seninf_ctx *ctx, u32 port_idx)
+{
+	void __iomem *base = ctx->reg_ana_csi_rx[port_idx];
+
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L0_T0AB_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L1_T1AB_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L2_T1BC_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T0BC_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T0CA_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T1CA_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_BG_LPF_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_BG_CORE_EN, 0);
+
+	usleep_range(200, 300);
+}
+
+static int csirx_phy_a_power_on(struct seninf_ctx *ctx, u32 port_idx)
+{
+	void __iomem *base = ctx->reg_ana_csi_rx[port_idx];
+
+	/* Power off first to ensure a clean state */
+	csirx_phy_a_power_off(ctx, port_idx);
+
+	/* Power on sequence */
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_BG_CORE_EN, 1);
+	usleep_range(10, 20);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_BG_LPF_EN, 1);
+	usleep_range(10, 20);
+
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L0_T0AB_EQ_OS_CAL_EN, 1);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L1_T1AB_EQ_OS_CAL_EN, 1);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L2_T1BC_EQ_OS_CAL_EN, 1);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T0BC_EQ_OS_CAL_EN, 1);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T0CA_EQ_OS_CAL_EN, 1);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T1CA_EQ_OS_CAL_EN, 1);
+
+	usleep_range(200, 300);
+
+	return 0;
+}
+
+static int apply_efuse_data(struct seninf_ctx *ctx)
+{
+	void __iomem *base;
+	u32 m_csi_efuse = ctx->m_csi_efuse;
+	u32 port;
+	int ret = 0;
+
+	if (m_csi_efuse == 0) {
+		dev_dbg(ctx->dev, "No efuse data. Returned.\n");
+		return -1;
+	}
+
+	port = ctx->port;
+	base = ctx->reg_ana_csi_rx[port];
+
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0P_T0A_HSRT_CODE,
+		    (m_csi_efuse >> 27) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0N_T0B_HSRT_CODE,
+		    (m_csi_efuse >> 27) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1P_T0C_HSRT_CODE,
+		    (m_csi_efuse >> 22) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1N_T1A_HSRT_CODE,
+		    (m_csi_efuse >> 22) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2P_T1B_HSRT_CODE,
+		    (m_csi_efuse >> 17) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2N_T1C_HSRT_CODE,
+		    (m_csi_efuse >> 17) & 0x1f);
+
+	dev_dbg(ctx->dev,
+		"CSI%dA CDPHY_RX_ANA_2(0x%x) CDPHY_RX_ANA_3(0x%x) CDPHY_RX_ANA_4(0x%x)",
+		ctx->port,
+		readl(base + CDPHY_RX_ANA_2),
+		readl(base + CDPHY_RX_ANA_3),
+		readl(base + CDPHY_RX_ANA_4));
+
+	if (ctx->is_4d1c == 0)
+		return ret;
+
+	port = ctx->port_b;
+	base = ctx->reg_ana_csi_rx[port];
+
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0P_T0A_HSRT_CODE,
+		    (m_csi_efuse >> 12) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0N_T0B_HSRT_CODE,
+		    (m_csi_efuse >> 12) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1P_T0C_HSRT_CODE,
+		    (m_csi_efuse >> 7) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1N_T1A_HSRT_CODE,
+		    (m_csi_efuse >> 7) & 0x1f);
+
+	if (port < CSI_PORT_2A) {
+		SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2P_T1B_HSRT_CODE,
+			    (m_csi_efuse >> 2) & 0x1f);
+		SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2N_T1C_HSRT_CODE,
+			    (m_csi_efuse >> 2) & 0x1f);
+		
+		dev_dbg(ctx->dev,
+			"CSI%dB CDPHY_RX_ANA_2(0x%x) CDPHY_RX_ANA_3(0x%x) CDPHY_RX_ANA_4(0x%x)",
+			ctx->port,
+			readl(base + CDPHY_RX_ANA_2),
+			readl(base + CDPHY_RX_ANA_3),
+			readl(base + CDPHY_RX_ANA_4));
+	} else {
+		dev_dbg(ctx->dev,
+			"CSI%dB CDPHY_RX_ANA_2(0x%x) CDPHY_RX_ANA_3(0x%x)",
+			ctx->port,
+			readl(base + CDPHY_RX_ANA_2),
+			readl(base + CDPHY_RX_ANA_3));
+	}
+
+	return 0;
+}
+
+static void csirx_phy_a_setup_port(struct seninf_ctx *ctx, u32 port)
+{
+	void __iomem *base = ctx->reg_ana_csi_rx[port];
+
+	SENINF_BITS(base, CDPHY_RX_ANA_1, RG_CSI0_BG_LPRX_VTL_SEL, 0x4);
+	SENINF_BITS(base, CDPHY_RX_ANA_1, RG_CSI0_BG_LPRX_VTH_SEL, 0x4);
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_BG_ALP_RX_VTL_SEL, 0x4);
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_BG_ALP_RX_VTH_SEL, 0x4);
+	SENINF_BITS(base, CDPHY_RX_ANA_1, RG_CSI0_BG_VREF_SEL, 0x8);
+	SENINF_BITS(base, CDPHY_RX_ANA_1, RG_CSI0_CDPHY_EQ_DES_VREF_SEL, 0x2);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_BW, 0x3);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_IS, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR0, 0x0);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR1, 0x0);
+	SENINF_BITS(base, CDPHY_RX_ANA_9, RG_CSI0_RESERVE, 0x3003);
+	SENINF_BITS(base, CDPHY_RX_ANA_SETTING_0, CSR_CSI_RST_MODE, 0x2);
+
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0P_T0A_HSRT_CODE, 0x10);
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0N_T0B_HSRT_CODE, 0x10);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1P_T0C_HSRT_CODE, 0x10);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1N_T1A_HSRT_CODE, 0x10);
+	SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2P_T1B_HSRT_CODE, 0x10);
+	SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2N_T1C_HSRT_CODE, 0x10);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_CPHY_T0_CDR_FIRST_EDGE_EN, 0x0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_CPHY_T1_CDR_FIRST_EDGE_EN, 0x0);
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_CPHY_T0_CDR_SELF_CAL_EN, 0x0);
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_CPHY_T1_CDR_SELF_CAL_EN, 0x0);
+
+	SENINF_BITS(base, CDPHY_RX_ANA_6, RG_CSI0_CPHY_T0_CDR_CK_DELAY, 0x0);
+	SENINF_BITS(base, CDPHY_RX_ANA_7, RG_CSI0_CPHY_T1_CDR_CK_DELAY, 0x0);
+	SENINF_BITS(base, CDPHY_RX_ANA_6, RG_CSI0_CPHY_T0_CDR_AB_WIDTH, 0x9);
+	SENINF_BITS(base, CDPHY_RX_ANA_6, RG_CSI0_CPHY_T0_CDR_BC_WIDTH, 0x9);
+	SENINF_BITS(base, CDPHY_RX_ANA_6, RG_CSI0_CPHY_T0_CDR_CA_WIDTH, 0x9);
+	SENINF_BITS(base, CDPHY_RX_ANA_7, RG_CSI0_CPHY_T1_CDR_AB_WIDTH, 0x9);
+	SENINF_BITS(base, CDPHY_RX_ANA_7, RG_CSI0_CPHY_T1_CDR_BC_WIDTH, 0x9);
+	SENINF_BITS(base, CDPHY_RX_ANA_7, RG_CSI0_CPHY_T1_CDR_CA_WIDTH, 0x9);
+
+	dev_dbg(ctx->dev, "port:%d CDPHY_RX_ANA_0(0x%x)\n",
+		port, SENINF_READ_REG(base, CDPHY_RX_ANA_0));
+}
+
+static int csirx_phyA_init(struct seninf_ctx *ctx)
+{
+	csirx_phy_a_setup_port(ctx, ctx->port);
+
+	if (ctx->is_4d1c)
+		csirx_phy_a_setup_port(ctx, ctx->port_b);
+
+	apply_efuse_data(ctx);
+
+	return 0;
+}
+
+static int csirx_dphy_init(struct seninf_ctx *ctx)
+{
+	void __iomem *base = ctx->reg_ana_dphy_top[ctx->port];
+	u8 bits_per_pixel;
+	int settle_delay_dt, settle_delay_ck, hs_trail, hs_trail_en;
+	u64 data_rate;
+
+	/* Settle delay parameters */
+	settle_delay_dt = ctx->is_cphy ? ctx->core->cphy_settle_delay_dt :
+					 ctx->core->dphy_settle_delay_dt;
+	settle_delay_ck = ctx->core->settle_delay_ck;
+
+	/* HS trail parameter */
+	hs_trail = ctx->hs_trail_parameter;
+
+	/* Settle delay for data lanes */
+	SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+		    RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER,
+		    settle_delay_dt);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+		    RG_CDPHY_RX_LD1_TRIO1_HS_SETTLE_PARAMETER,
+		    settle_delay_dt);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+		    RG_CDPHY_RX_LD2_TRIO2_HS_SETTLE_PARAMETER,
+		    settle_delay_dt);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+		    RG_CDPHY_RX_LD3_TRIO3_HS_SETTLE_PARAMETER,
+		    settle_delay_dt);
+
+	/* Settle delay for clock lanes */
+	SENINF_BITS(base, DPHY_RX_CLOCK_LANE0_HS_PARAMETER,
+		    RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER,
+		    settle_delay_ck);
+	SENINF_BITS(base, DPHY_RX_CLOCK_LANE1_HS_PARAMETER,
+		    RG_DPHY_RX_LC1_HS_SETTLE_PARAMETER,
+		    settle_delay_ck);
+
+	/* HS prepare parameter for data lanes */
+	SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+		    RG_CDPHY_RX_LD0_TRIO0_HS_PREPARE_PARAMETER, 2);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+		    RG_CDPHY_RX_LD1_TRIO1_HS_PREPARE_PARAMETER, 2);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+		    RG_CDPHY_RX_LD2_TRIO2_HS_PREPARE_PARAMETER, 2);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+		    RG_CDPHY_RX_LD3_TRIO3_HS_PREPARE_PARAMETER, 2);
+
+	/* HS trail parameter for data lanes */
+	SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+		    RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER, hs_trail);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+		    RG_DPHY_RX_LD1_HS_TRAIL_PARAMETER, hs_trail);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+		    RG_DPHY_RX_LD2_HS_TRAIL_PARAMETER, hs_trail);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+		    RG_DPHY_RX_LD3_HS_TRAIL_PARAMETER, hs_trail);
+
+	if (!ctx->is_cphy) {
+		bits_per_pixel = 10;
+
+		data_rate = ctx->customized_pixel_rate ?
+			    ctx->customized_pixel_rate : ctx->mipi_pixel_rate;
+		data_rate *= bits_per_pixel;
+		do_div(data_rate, ctx->num_data_lanes);
+
+		hs_trail_en = data_rate < 1400000000;
+
+		SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+			    RG_DPHY_RX_LD0_HS_TRAIL_EN, hs_trail_en);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+			    RG_DPHY_RX_LD1_HS_TRAIL_EN, hs_trail_en);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+			    RG_DPHY_RX_LD2_HS_TRAIL_EN, hs_trail_en);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+			    RG_DPHY_RX_LD3_HS_TRAIL_EN, hs_trail_en);
+	}
+
+	return 0;
+}
+
+static int csirx_cphy_init(struct seninf_ctx *ctx)
+{
+	void __iomem *base = ctx->reg_ana_cphy_top[ctx->port];
+
+	SENINF_BITS(base, CPHY_RX_DETECT_CTRL_POST,
+		    RG_CPHY_RX_DATA_VALID_POST_EN, 1);
+
+	return 0;
+}
+
+static int csirx_phy_init(struct seninf_ctx *ctx)
+{
+	/* phyA init */
+	csirx_phyA_init(ctx);
+
+	/* phyD init */
+	csirx_dphy_init(ctx);
+	csirx_cphy_init(ctx);
+
+	return 0;
+}
+
+static int csirx_seninf_csi2_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
+	int csi_en;
+
+	SENINF_BITS(seninf_csi2, SENINF_CSI2_DBG_CTRL,
+		    RG_CSI2_DBG_PACKET_CNT_EN, 1);
+
+	/* lane/trio count */
+	SENINF_BITS(seninf_csi2, SENINF_CSI2_RESYNC_MERGE_CTRL,
+		    RG_CSI2_RESYNC_CYCLE_CNT_OPT, 1);
+
+	csi_en = BIT(ctx->num_data_lanes) - 1;
+
+	if (ctx->is_cphy) { /* cphy */
+		u8 map_hdr_len[] = { 0, 1, 2, 4, 5 };
+
+		SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_EN, csi_en);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_OPT,
+				RG_CSI2_CPHY_SEL, 1);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
+				RG_CSI2_HEADER_MODE, 2);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
+				RG_CSI2_HEADER_LEN,
+				map_hdr_len[ctx->num_data_lanes]);
+	} else { /* dphy */
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_OPT, RG_CSI2_CPHY_SEL, 0);
+		SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_EN, csi_en);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
+				RG_CSI2_HEADER_MODE, 0);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
+				RG_CSI2_HEADER_LEN, 0);
+	}
+
+	return 0;
+}
+
+static int csirx_seninf_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf = ctx->reg_if_ctrl[ctx->seninf_idx];
+
+	/* enable/disable seninf csi */
+	SENINF_BITS(seninf, SENINF_CSI_CTRL, RG_SENINF_CSI2_EN, 1);
+
+	/* enable/disable seninf, enable after csi2, testmdl is done */
+	SENINF_BITS(seninf, SENINF_CTRL, SENINF_EN, 1);
+
+	return 0;
+}
+
+static int csirx_seninf_top_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_top = ctx->reg_if_top;
+
+	switch (ctx->port) {
+	case CSI_PORT_0:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+			    RG_PHY_SENINF_MUX0_CPHY_MODE, 0); //4T
+		break;
+	case CSI_PORT_0A:
+	case CSI_PORT_0B:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+			    RG_PHY_SENINF_MUX0_CPHY_MODE, 2); //2+2T
+		break;
+	case CSI_PORT_1:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+			    RG_PHY_SENINF_MUX1_CPHY_MODE, 0); //4T
+		break;
+	case CSI_PORT_1A:
+	case CSI_PORT_1B:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+			    RG_PHY_SENINF_MUX1_CPHY_MODE, 2); //2+2T
+		break;
+	case CSI_PORT_2:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+			    RG_PHY_SENINF_MUX2_CPHY_MODE, 0); //4T
+		break;
+	case CSI_PORT_2A:
+	case CSI_PORT_2B:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+			    RG_PHY_SENINF_MUX2_CPHY_MODE, 2); //2+2T
+		break;
+	case CSI_PORT_3:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+			    RG_PHY_SENINF_MUX3_CPHY_MODE, 0); //4T
+		break;
+	case CSI_PORT_3A:
+	case CSI_PORT_3B:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+			    RG_PHY_SENINF_MUX3_CPHY_MODE, 2); //2+2T
+		break;
+	default:
+		break;
+	}
+
+	/* port operation mode */
+	switch (ctx->port) {
+	case CSI_PORT_0:
+	case CSI_PORT_0A:
+	case CSI_PORT_0B:
+		if (ctx->is_cphy) {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+					PHY_SENINF_MUX0_DPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+					PHY_SENINF_MUX0_CPHY_EN, 1);
+		} else {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+					PHY_SENINF_MUX0_CPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+					PHY_SENINF_MUX0_DPHY_EN, 1);
+		}
+		break;
+	case CSI_PORT_1:
+	case CSI_PORT_1A:
+	case CSI_PORT_1B:
+		if (ctx->is_cphy) {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+					PHY_SENINF_MUX1_DPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+					PHY_SENINF_MUX1_CPHY_EN, 1);
+		} else {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+					PHY_SENINF_MUX1_CPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+					PHY_SENINF_MUX1_DPHY_EN, 1);
+		}
+		break;
+	case CSI_PORT_2:
+	case CSI_PORT_2A:
+	case CSI_PORT_2B:
+		if (ctx->is_cphy) {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+					PHY_SENINF_MUX2_DPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+					PHY_SENINF_MUX2_CPHY_EN, 1);
+		} else {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+					PHY_SENINF_MUX2_CPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+					PHY_SENINF_MUX2_DPHY_EN, 1);
+		}
+		break;
+	case CSI_PORT_3:
+	case CSI_PORT_3A:
+	case CSI_PORT_3B:
+		if (ctx->is_cphy) {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+					PHY_SENINF_MUX3_DPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+					PHY_SENINF_MUX3_CPHY_EN, 1);
+		} else {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+					PHY_SENINF_MUX3_CPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+					PHY_SENINF_MUX3_DPHY_EN, 1);
+		}
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid CSI port: %d\n", ctx->port);
+    	return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void csirx_phyA_dphy_4d1c_setting(struct seninf_ctx *ctx, void __iomem *baseA, void __iomem *baseB)
+{
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_CPHY_EN, 0);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_CPHY_EN, 0);
+	/* clear clk sel first */
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L0_CKSEL, 1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L1_CKSEL, 1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L2_CKSEL, 1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L0_CKSEL, 1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L1_CKSEL, 1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L2_CKSEL, 1);
+
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L2_CKMODE_EN, 1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_BW, 0x3);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_IS, 0x1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR0, 0x1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR1, 0x0);
+
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_BW, 0x3);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_IS, 0x1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR0, 0x1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR1, 0x0);
+}
+
+static void csirx_phyA_dphy_setting(struct seninf_ctx *ctx, void __iomem *base)
+{
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_CPHY_EN, 0);
+	/* clear clk sel first */
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L0_CKSEL, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L1_CKSEL, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L2_CKSEL, 0);
+
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L1_CKMODE_EN, 1);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_BW, 0x3);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_IS, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR0, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR1, 0x0);
+}
+
+static void csirx_phyA_cphy_4d1c_setting(struct seninf_ctx *ctx, void __iomem *baseA, void __iomem *baseB)
+{
+	SENINF_BITS(baseA, CDPHY_RX_ANA_0, RG_CSI0_CPHY_EN, 1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_0, RG_CSI0_CPHY_EN, 1);
+
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_BW, 0x3);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_IS, 0x1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG1_EN, 0x0);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR0, 0x3);
+	SENINF_BITS(baseA, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR1, 0x0);
+
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_BW, 0x3);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_IS, 0x1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG1_EN, 0x0);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR0, 0x3);
+	SENINF_BITS(baseB, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR1, 0x0);
+}
+
+static void csirx_phyA_cphy_setting(struct seninf_ctx *ctx, void __iomem *base)
+{
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_CPHY_EN, 1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_BW, 0x3);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_IS, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_DG1_EN, 0x0);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR0, 0x3);
+	SENINF_BITS(base, CDPHY_RX_ANA_5, RG_CSI0_CDPHY_EQ_SR1, 0x0);
+}
+
+static void csirx_phyA_power_on_wrapper(struct seninf_ctx *ctx)
+{
+	if (ctx->is_4d1c) {
+		csirx_phy_a_power_on(ctx, ctx->port_a);
+		csirx_phy_a_power_on(ctx, ctx->port_b);
+	} else {
+		csirx_phy_a_power_on(ctx, ctx->port);
+	}
+}
+
+static int csirx_phyA_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *base, *baseA, *baseB;
+
+	base = ctx->reg_ana_csi_rx[ctx->port];
+	baseA = ctx->reg_ana_csi_rx[ctx->port_a];
+	baseB = ctx->reg_ana_csi_rx[ctx->port_b];
+
+	if (!ctx->is_cphy) { /* dphy */
+		if (ctx->is_4d1c)
+			csirx_phyA_dphy_4d1c_setting(ctx, baseA, baseB);
+		else
+			csirx_phyA_dphy_setting(ctx, base);
+	} else { /* cphy */
+		if (ctx->is_4d1c)
+			csirx_phyA_cphy_4d1c_setting(ctx, baseA, baseB);
+		else
+			csirx_phyA_cphy_setting(ctx, base);
+	}
+
+	csirx_phyA_power_on_wrapper(ctx);
+
+	return 0;
+}
+
+static int csirx_dphy_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *base = ctx->reg_ana_dphy_top[ctx->port];
+
+	if (ctx->is_4d1c) {
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD3_SEL, 4);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD2_SEL, 0);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD1_SEL, 3);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD0_SEL, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LC0_SEL, 2);
+
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD0_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD1_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD2_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD3_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC0_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC1_EN, 0);
+	} else {
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD3_SEL, 5);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD2_SEL, 3);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD1_SEL, 2);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD0_SEL, 0);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LC1_SEL, 4);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LC0_SEL, 1);
+
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD0_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD1_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD2_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD3_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC0_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC1_EN, 1);
+	}
+
+	SENINF_BITS(base, DPHY_RX_LANE_SELECT, DPHY_RX_CK_DATA_MUX_EN, 1);
+
+	return 0;
+}
+
+static int csirx_cphy_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *base = ctx->reg_ana_cphy_top[ctx->port];
+
+	switch (ctx->port) {
+	case CSI_PORT_0:
+	case CSI_PORT_1:
+	case CSI_PORT_2:
+	case CSI_PORT_3:
+	case CSI_PORT_0A:
+	case CSI_PORT_1A:
+	case CSI_PORT_2A:
+	case CSI_PORT_3A:
+		if (ctx->num_data_lanes == 3) {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR0_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR1_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR2_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR3_LPRX_EN, 0);
+		} else if (ctx->num_data_lanes == 2) {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR0_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR1_LPRX_EN, 1);
+		} else {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR0_LPRX_EN, 1);
+		}
+		break;
+	case CSI_PORT_0B:
+	case CSI_PORT_1B:
+	case CSI_PORT_2B:
+	case CSI_PORT_3B:
+		if (ctx->num_data_lanes == 2) {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR2_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR3_LPRX_EN, 1);
+		} else {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR2_LPRX_EN, 1);
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int csirx_phy_setting(struct seninf_ctx *ctx)
+{
+	/* phyA */
+	csirx_phyA_setting(ctx);
+
+	if (ctx->is_cphy)
+		csirx_cphy_setting(ctx);
+	else
+		csirx_dphy_setting(ctx);
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_csi_mipi(struct seninf_ctx *ctx)
+{
+	csirx_phy_init(ctx);
+
+	/* seninf csi2 */
+	csirx_seninf_csi2_setting(ctx);
+
+	/* seninf */
+	csirx_seninf_setting(ctx);
+
+	/* seninf top */
+	csirx_seninf_top_setting(ctx);
+
+	/* phy */
+	csirx_phy_setting(ctx);
+
+	return 0;
+}
+
+int mtk_cam_seninf_poweroff(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_csi2;
+
+	seninf_csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
+
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_EN, 0x0);
+
+	if (ctx->is_4d1c) {
+		csirx_phy_a_power_off(ctx, ctx->port_a);
+		csirx_phy_a_power_off(ctx, ctx->port_b);
+	} else {
+		csirx_phy_a_power_off(ctx, ctx->port);
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_reset(struct seninf_ctx *ctx, u32 seninf_idx)
+{
+	int i;
+	void __iomem *seninf_mux;
+	void __iomem *seninf = ctx->reg_if_ctrl[seninf_idx];
+
+	SENINF_BITS(seninf, SENINF_CSI_CTRL, SENINF_CSI2_SW_RST, 1);
+	udelay(1);
+	SENINF_BITS(seninf, SENINF_CSI_CTRL, SENINF_CSI2_SW_RST, 0);
+
+	dev_dbg(ctx->dev, "reset seninf %d\n", seninf_idx);
+
+	for (i = SENINF_MUX1; i < _seninf_cfg.mux_num; i++)
+		if (mtk_cam_seninf_get_top_mux_ctrl(ctx, i) == seninf_idx &&
+		    mtk_cam_seninf_is_mux_used(ctx, i)) {
+			seninf_mux = ctx->reg_if_mux[i];
+			SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0,
+				    SENINF_MUX_SW_RST, 1);
+			udelay(1);
+			SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0,
+				    SENINF_MUX_SW_RST, 0);
+			dev_dbg(ctx->dev, "reset mux %d\n", i);
+		}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_idle(struct seninf_ctx *ctx)
+{
+	int i;
+	struct seninf_vcinfo *vcinfo = &ctx->vcinfo;
+	struct seninf_vc *vc;
+
+	for (i = 0; i < vcinfo->cnt; i++) {
+		vc = &vcinfo->vc[i];
+		if (vc->enable) {
+			mtk_cam_seninf_disable_mux(ctx, vc->mux);
+			mtk_cam_seninf_disable_cammux(ctx, vc->cam);
+			ctx->pad2cam[vc->out_pad] = 0xff;
+		}
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_irq_handler(int irq, void *data)
+{
+	struct seninf_core *core = (struct seninf_core *)data;
+	unsigned long flags; /* for mipi err detection */
+	struct seninf_ctx *ctx;
+	struct seninf_vc *vc;
+	void __iomem *csi2, *pmux, *seninf_cam_mux;
+	int i;
+	unsigned int csi_irq_ro;
+	unsigned int mux_irq_ro;
+	unsigned int cam_irq_exp_ro;
+	unsigned int cam_irq_res_ro;
+
+	spin_lock_irqsave(&core->spinlock_irq, flags);
+
+	/* debug for set_reg case: REG_KEY_CSI_IRQ_EN */
+	if (core->csi_irq_en_flag) {
+		list_for_each_entry(ctx, &core->list, list) {
+			csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
+			csi_irq_ro =
+				readl(csi2 + SENINF_CSI2_IRQ_STATUS);
+
+			if (csi_irq_ro) {
+				SENINF_WRITE_REG(csi2, SENINF_CSI2_IRQ_STATUS,
+						 0xFFFFFFFF);
+			}
+
+			if (csi_irq_ro & RO_CSI2_ECC_ERR_CORRECTED_IRQ)
+				ctx->ecc_err_corrected_cnt++;
+			if (csi_irq_ro & RO_CSI2_ECC_ERR_DOUBLE_IRQ)
+				ctx->ecc_err_double_cnt++;
+			if (csi_irq_ro & RO_CSI2_CRC_ERR_IRQ)
+				ctx->crc_err_cnt++;
+			if (csi_irq_ro & RO_CSI2_ERR_LANE_RESYNC_IRQ)
+				ctx->err_lane_resync_cnt++;
+			if (csi_irq_ro & RO_CSI2_RECEIVE_DATA_NOT_ENOUGH_IRQ)
+				ctx->data_not_enough_cnt++;
+
+			for (i = 0; i < ctx->vcinfo.cnt; i++) {
+				vc = &ctx->vcinfo.vc[i];
+				pmux = ctx->reg_if_mux[vc->mux];
+				seninf_cam_mux = ctx->reg_if_cam_mux;
+
+				mux_irq_ro = readl(pmux +
+							     SENINF_MUX_IRQ_STATUS);
+
+				cam_irq_exp_ro = readl(seninf_cam_mux +
+								 SENINF_CAM_MUX0_CHK_CTL_1 +
+								 (0x10 * (vc->cam)));
+
+				cam_irq_res_ro = readl(seninf_cam_mux +
+								 SENINF_CAM_MUX0_CHK_RES +
+								 (0x10 * (vc->cam)));
+
+				if (mux_irq_ro)
+					SENINF_WRITE_REG(pmux,
+							 SENINF_MUX_IRQ_STATUS,
+							 0xFFFFFFFF);
+
+				if (cam_irq_res_ro != cam_irq_exp_ro)
+					SENINF_WRITE_REG(seninf_cam_mux,
+							 SENINF_CAM_MUX0_CHK_RES +
+							 (0x10 * (vc->cam)),
+							 0xFFFFFFFF);
+
+				if (mux_irq_ro & (0x1 << 0))
+					ctx->fifo_overrun_cnt++;
+
+				if (cam_irq_res_ro != cam_irq_exp_ro)
+					ctx->size_err_cnt++;
+			}
+
+			/* dump status counter: debug for electrical signal */
+			if (ctx->data_not_enough_cnt >= core->detection_cnt ||
+			    ctx->err_lane_resync_cnt >= core->detection_cnt ||
+			    ctx->crc_err_cnt >= core->detection_cnt ||
+			    ctx->ecc_err_double_cnt >= core->detection_cnt ||
+			    ctx->ecc_err_corrected_cnt >= core->detection_cnt ||
+			    ctx->fifo_overrun_cnt >= core->detection_cnt ||
+			    ctx->size_err_cnt >= core->detection_cnt) {
+				/* disable all interrupts */
+				SENINF_WRITE_REG(csi2, SENINF_CSI2_IRQ_EN, 0x80000000);
+
+				if (ctx->data_not_enough_cnt >= core->detection_cnt)
+					ctx->data_not_enough_flag = 1;
+				if (ctx->err_lane_resync_cnt >= core->detection_cnt)
+					ctx->err_lane_resync_flag = 1;
+				if (ctx->crc_err_cnt >= core->detection_cnt)
+					ctx->crc_err_flag = 1;
+				if (ctx->ecc_err_double_cnt >= core->detection_cnt)
+					ctx->ecc_err_double_flag = 1;
+				if (ctx->ecc_err_corrected_cnt >= core->detection_cnt)
+					ctx->ecc_err_corrected_flag = 1;
+				if (ctx->fifo_overrun_cnt >= core->detection_cnt)
+					ctx->fifo_overrun_flag = 1;
+				if (ctx->size_err_cnt >= core->detection_cnt)
+					ctx->size_err_flag = 1;
+			}
+		}
+	}
+
+	spin_unlock_irqrestore(&core->spinlock_irq, flags);
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_sw_cfg_busy(struct seninf_ctx *ctx, bool enable, int index)
+{
+    void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+    unsigned int mask;
+
+    mask = index ? RG_SENINF_CAM_MUX_DYN_SWITCH_BSY1 : RG_SENINF_CAM_MUX_DYN_SWITCH_BSY0;
+
+    SENINF_BITS_VAR(seninf_cam_mux, SENINF_CAM_MUX_DYN_CTRL, mask, enable);
+
+    return 0;
+}
+
+int mtk_cam_seninf_reset_cam_mux_dyn_en(struct seninf_ctx *ctx, int index)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+
+	if (index == 0)
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
+			    RG_SENINF_CAM_MUX_DYN_SWITCH_EN0, 0);
+	else
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
+			    RG_SENINF_CAM_MUX_DYN_SWITCH_EN1, 0);
+	return 0;
+}
+
+int mtk_cam_seninf_enable_global_drop_irq(struct seninf_ctx *ctx, bool enable,
+					  int index)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+
+	if (index == 0)
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_IRQ_EN,
+			    RG_SENINF_CAM_MUX15_HSIZE_ERR_IRQ_EN, enable);
+	else
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_IRQ_EN,
+			    RG_SENINF_CAM_MUX15_VSIZE_ERR_IRQ_EN, enable);
+	return 0;
+}
+
+int mtk_cam_seninf_enable_cam_mux_vsync_irq(struct seninf_ctx *ctx, bool enable,
+					    int cam_mux)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+	int tmp = 0;
+
+	tmp = SENINF_READ_BITS(seninf_cam_mux, SENINF_CAM_MUX_VSYNC_IRQ_EN,
+			       RG_SENINF_CAM_MUX_VSYNC_IRQ_EN);
+	if (enable)
+		tmp |= (enable << cam_mux);
+	else
+		tmp &= ~(enable << cam_mux);
+	SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_VSYNC_IRQ_EN,
+		    RG_SENINF_CAM_MUX_VSYNC_IRQ_EN, tmp);
+	return 0;
+}
+
+int mtk_cam_seninf_disable_all_cam_mux_vsync_irq(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+
+	SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_VSYNC_IRQ_EN,
+		    RG_SENINF_CAM_MUX_VSYNC_IRQ_EN, 0);
+	return 0;
+}
+
+int mtk_cam_seninf_set_reg(struct seninf_ctx *ctx, u32 key, u32 val)
+{
+	int i;
+	void __iomem *base = ctx->reg_ana_dphy_top[ctx->port];
+	void __iomem *csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
+	void __iomem *pmux, *pcammux;
+	struct seninf_vc *vc;
+	struct seninf_core *core;
+	struct seninf_ctx *ctx_;
+	void __iomem *csi2_;
+
+	core = dev_get_drvdata(ctx->dev->parent);
+
+	if (!ctx->streaming)
+		return 0;
+
+	dev_dbg(ctx->dev, "%s key = 0x%x, val = 0x%x\n", __func__, key, val);
+
+	switch (key) {
+	case REG_KEY_SETTLE_CK:
+		SENINF_BITS(base, DPHY_RX_CLOCK_LANE0_HS_PARAMETER,
+			    RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_CLOCK_LANE1_HS_PARAMETER,
+			    RG_DPHY_RX_LC1_HS_SETTLE_PARAMETER, val);
+		break;
+	case REG_KEY_SETTLE_DT:
+		SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+			    RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+			    RG_CDPHY_RX_LD1_TRIO1_HS_SETTLE_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+			    RG_CDPHY_RX_LD2_TRIO2_HS_SETTLE_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+			    RG_CDPHY_RX_LD3_TRIO3_HS_SETTLE_PARAMETER, val);
+		break;
+	case REG_KEY_HS_TRAIL_EN:
+		SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+			    RG_DPHY_RX_LD0_HS_TRAIL_EN, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+			    RG_DPHY_RX_LD1_HS_TRAIL_EN, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+			    RG_DPHY_RX_LD2_HS_TRAIL_EN, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+			    RG_DPHY_RX_LD3_HS_TRAIL_EN, val);
+		break;
+	case REG_KEY_HS_TRAIL_PARAM:
+		SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+			    RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+			    RG_DPHY_RX_LD1_HS_TRAIL_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+			    RG_DPHY_RX_LD2_HS_TRAIL_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+			    RG_DPHY_RX_LD3_HS_TRAIL_PARAMETER, val);
+		break;
+	case REG_KEY_CSI_IRQ_STAT:
+		SENINF_WRITE_REG(csi2, SENINF_CSI2_IRQ_STATUS,
+				 val & 0xFFFFFFFF);
+		break;
+	case REG_KEY_MUX_IRQ_STAT:
+		for (i = 0; i < ctx->vcinfo.cnt; i++) {
+			vc = &ctx->vcinfo.vc[i];
+			pmux = ctx->reg_if_mux[vc->mux];
+			SENINF_WRITE_REG(pmux, SENINF_MUX_IRQ_STATUS,
+					 val & 0xFFFFFFFF);
+		}
+		break;
+	case REG_KEY_CAMMUX_IRQ_STAT:
+		for (i = 0; i < ctx->vcinfo.cnt; i++) {
+			vc = &ctx->vcinfo.vc[i];
+			pcammux = ctx->reg_if_cam_mux;
+			SENINF_WRITE_REG(pcammux, SENINF_CAM_MUX_IRQ_STATUS,
+					 val & 0xFFFFFFFF);
+		}
+		break;
+	case REG_KEY_CSI_IRQ_EN:
+		{
+			if (!val) {
+				core->csi_irq_en_flag = 0;
+				return 0;
+			}
+
+			core->csi_irq_en_flag = 1;
+			core->detection_cnt = val;
+			list_for_each_entry(ctx_, &core->list, list) {
+				csi2_ = ctx_->reg_if_csi2[ctx_->seninf_idx];
+				SENINF_WRITE_REG(csi2_, SENINF_CSI2_IRQ_EN,
+						 0xA0002058);
+			}
+		}
+		break;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
new file mode 100755
index 000000000000..e4e28c0ef85b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MIPI_RX_ANA_CDPHY_CSI0A_H__
+#define __MIPI_RX_ANA_CDPHY_CSI0A_H__
+
+#include <linux/bitfield.h>
+
+// CDPHY_RX_ANA_0
+#define CDPHY_RX_ANA_0 0x0000
+#define RG_CSI0_BG_CORE_EN                GENMASK(0, 0)
+#define RG_CSI0_BG_LPF_EN                 GENMASK(1, 1)
+#define RG_CSI0_EQ_PROTECT_EN             GENMASK(4, 4)
+#define RG_CSI0_BYTE_CK_RSTB_SEL          GENMASK(5, 5)
+#define RG_CSI0_DPHY_L0_CKSEL             GENMASK(8, 8)
+#define RG_CSI0_DPHY_L1_CKSEL             GENMASK(9, 9)
+#define RG_CSI0_DPHY_L2_CKSEL             GENMASK(10, 10)
+#define RG_CSI0_DPHY_L0_CKMODE_EN         GENMASK(12, 12)
+#define RG_CSI0_DPHY_L1_CKMODE_EN         GENMASK(13, 13)
+#define RG_CSI0_DPHY_L2_CKMODE_EN         GENMASK(14, 14)
+#define RG_CSI0_CDPHY_L0_T0_BYTECK_INVERT GENMASK(16, 16)
+#define RG_CSI0_DPHY_L1_BYTECK_INVERT     GENMASK(17, 17)
+#define RG_CSI0_CDPHY_L2_T1_BYTECK_INVERT GENMASK(18, 18)
+#define RG_CSI0_CPHY_EN                   GENMASK(20, 20)
+#define RG_CSI0_CPHY_T0_CDR_FIRST_EDGE_EN GENMASK(21, 21)
+#define RG_CSI0_CPHY_T1_CDR_FIRST_EDGE_EN GENMASK(22, 22)
+#define RG_CSI0_CDPHY_L0_T0_FORCE_INIT    GENMASK(24, 24)
+#define RG_CSI0_DPHY_L1_FORCE_INIT        GENMASK(25, 25)
+#define RG_CSI0_CDPHY_L2_T1_FORCE_INIT    GENMASK(26, 26)
+#define RG_CSI0_CDPHY_L0_T0_SYNC_INIT_CTRL GENMASK(28, 28)
+#define RG_CSI0_DPHY_L1_SYNC_INIT_CTRL    GENMASK(29, 29)
+#define RG_CSI0_CDPHY_L2_T1_SYNC_INIT_CTRL GENMASK(30, 30)
+#define RG_CSI0_FORCE_HSRT_EN             GENMASK(31, 31)
+
+// CDPHY_RX_ANA_1
+#define CDPHY_RX_ANA_1 0x0004
+#define RG_CSI0_BG_LPRX_VTL_SEL           GENMASK(2, 0)
+#define RG_CSI0_BG_LPRX_VTH_SEL           GENMASK(6, 4)
+#define RG_CSI0_BG_VREF_SEL               GENMASK(11, 8)
+#define RG_CSI0_CDPHY_DELAYCAL_CK_SEL     GENMASK(14, 12)
+#define RG_CSI0_CDPHY_EQ_DES_VREF_SEL     GENMASK(18, 16)
+#define RG_CSI0_CDPHY_DELAY_VREF_SEL      GENMASK(22, 20)
+#define RG_CSI0_DPHY_L0_DELAYCAL_EN       GENMASK(24, 24)
+#define RG_CSI0_DPHY_L1_DELAYCAL_EN       GENMASK(25, 25)
+#define RG_CSI0_DPHY_L2_DELAYCAL_EN       GENMASK(26, 26)
+#define RG_CSI0_DPHY_L0_DELAYCAL_RSTB     GENMASK(28, 28)
+#define RG_CSI0_DPHY_L1_DELAYCAL_RSTB     GENMASK(29, 29)
+#define RG_CSI0_DPHY_L2_DELAYCAL_RSTB     GENMASK(30, 30)
+
+// CDPHY_RX_ANA_2
+#define CDPHY_RX_ANA_2 0x0008
+#define RG_CSI0_L0P_T0A_HSRT_CODE         GENMASK(4, 0)
+#define RG_CSI0_L0N_T0B_HSRT_CODE         GENMASK(12, 8)
+#define RG_CSI0_CPHY_T0_CDR_SELF_CAL_EN   GENMASK(16, 16)
+#define RG_CSI0_CPHY_T1_CDR_SELF_CAL_EN   GENMASK(17, 17)
+#define RG_CSI0_BG_ALP_RX_VTH_SEL         GENMASK(26, 24)
+#define RG_CSI0_BG_ALP_RX_VTL_SEL         GENMASK(30, 28)
+
+// CDPHY_RX_ANA_3
+#define CDPHY_RX_ANA_3 0x000c
+#define RG_CSI0_L1P_T0C_HSRT_CODE         GENMASK(4, 0)
+#define RG_CSI0_L1N_T1A_HSRT_CODE         GENMASK(12, 8)
+#define RG_CSI0_OS_CAL_CNT_SEL            GENMASK(17, 16)
+#define RG_CSI0_EQ_DES_VREF_SEL           GENMASK(25, 20)
+
+// CDPHY_RX_ANA_4
+#define CDPHY_RX_ANA_4 0x0010
+#define RG_CSI0_L2P_T1B_HSRT_CODE         GENMASK(4, 0)
+#define RG_CSI0_L2N_T1C_HSRT_CODE         GENMASK(12, 8)
+
+// CDPHY_RX_ANA_5
+#define CDPHY_RX_ANA_5 0x0014
+#define RG_CSI0_CDPHY_EQ_BW               GENMASK(1, 0)
+#define RG_CSI0_CDPHY_EQ_IS               GENMASK(3, 2)
+#define RG_CSI0_CDPHY_EQ_DG0_EN           GENMASK(4, 4)
+#define RG_CSI0_CDPHY_EQ_DG1_EN           GENMASK(5, 5)
+#define RG_CSI0_CDPHY_EQ_LATCH_EN         GENMASK(6, 6)
+#define RG_CSI0_CDPHY_EQ_SR0              GENMASK(11, 8)
+#define RG_CSI0_CDPHY_EQ_SR1              GENMASK(15, 12)
+#define RG_CSI0_L0_T0AB_EQ_MON_EN         GENMASK(16, 16)
+#define RG_CSI0_L1_T1AB_EQ_MON_EN         GENMASK(17, 17)
+#define RG_CSI0_L2_T1BC_EQ_MON_EN         GENMASK(18, 18)
+#define RG_CSI0_XX_T0BC_EQ_MON_EN         GENMASK(24, 24)
+#define RG_CSI0_XX_T0CA_EQ_MON_EN         GENMASK(25, 25)
+#define RG_CSI0_XX_T1CA_EQ_MON_EN         GENMASK(26, 26)
+
+// CDPHY_RX_ANA_6
+#define CDPHY_RX_ANA_6 0x0018
+#define RG_CSI0_CPHY_T0_CDR_AB_WIDTH      GENMASK(5, 0)
+#define RG_CSI0_CPHY_T0_CDR_BC_WIDTH      GENMASK(13, 8)
+#define RG_CSI0_CPHY_T0_CDR_CA_WIDTH      GENMASK(21, 16)
+#define RG_CSI0_CPHY_T0_CDR_CK_DELAY      GENMASK(29, 24)
+
+// CDPHY_RX_ANA_7
+#define CDPHY_RX_ANA_7 0x001c
+#define RG_CSI0_CPHY_T1_CDR_AB_WIDTH      GENMASK(5, 0)
+#define RG_CSI0_CPHY_T1_CDR_BC_WIDTH      GENMASK(13, 8)
+#define RG_CSI0_CPHY_T1_CDR_CA_WIDTH      GENMASK(21, 16)
+#define RG_CSI0_CPHY_T1_CDR_CK_DELAY      GENMASK(29, 24)
+
+// CDPHY_RX_ANA_8
+#define CDPHY_RX_ANA_8 0x0020
+#define RGS_CSI0_CDPHY_L0_T0AB_OS_CAL_CPLT GENMASK(0, 0)
+#define RGS_CSI0_CDPHY_L1_T1AB_OS_CAL_CPLT GENMASK(1, 1)
+#define RGS_CSI0_CDPHY_L2_T1BC_OS_CAL_CPLT GENMASK(2, 2)
+#define RGS_CSI0_CPHY_T0BC_OS_CAL_CPLT     GENMASK(3, 3)
+#define RGS_CSI0_CPHY_T0CA_OS_CAL_CPLT     GENMASK(4, 4)
+#define RGS_CSI0_CPHY_T1CA_OS_CAL_CPLT     GENMASK(5, 5)
+#define RGS_CSI0_OS_CAL_CODE               GENMASK(15, 8)
+#define RG_CSI0_L0_T0AB_EQ_OS_CAL_EN       GENMASK(16, 16)
+#define RG_CSI0_L1_T1AB_EQ_OS_CAL_EN       GENMASK(17, 17)
+#define RG_CSI0_L2_T1BC_EQ_OS_CAL_EN       GENMASK(18, 18)
+#define RG_CSI0_XX_T0BC_EQ_OS_CAL_EN       GENMASK(19, 19)
+#define RG_CSI0_XX_T0CA_EQ_OS_CAL_EN       GENMASK(20, 20)
+#define RG_CSI0_XX_T1CA_EQ_OS_CAL_EN       GENMASK(21, 21)
+#define RG_CSI0_OS_CAL_SEL                 GENMASK(26, 24)
+#define RG_CSI0_OS_CAL_DIV                 GENMASK(30, 28)
+
+// CDPHY_RX_ANA_9
+#define CDPHY_RX_ANA_9 0x0024
+#define RGS_CSI0_CPHY_T0_DLL_CODE          GENMASK(3, 0)
+#define RGS_CSI0_CPHY_T0_MASK_CAL_CPLT     GENMASK(4, 4)
+#define RGS_CSI0_CPHY_T0_MASK_CAL_OF       GENMASK(5, 5)
+#define RGS_CSI0_CPHY_T1_DLL_CODE          GENMASK(11, 8)
+#define RGS_CSI0_CPHY_T1_MASK_CAL_CPLT     GENMASK(12, 12)
+#define RGS_CSI0_CPHY_T1_MASK_CAL_OF       GENMASK(13, 13)
+#define RG_CSI0_RESERVE                    GENMASK(31, 16)
+
+// CDPHY_RX_ANA_AD_0
+#define CDPHY_RX_ANA_AD_0 0x0048
+#define RO_AD_CSI0_CDPHY_L0P_T0A_LPRX_OUT GENMASK(0, 0)
+#define RO_AD_CSI0_CDPHY_L0N_T0B_LPRX_OUT GENMASK(1, 1)
+#define RO_AD_CSI0_CDPHY_L1P_T0C_LPRX_OUT GENMASK(4, 4)
+#define RO_AD_CSI0_CDPHY_L1N_T1A_LPRX_OUT GENMASK(5, 5)
+#define RO_AD_CSI0_CDPHY_L2P_T1B_LPRX_OUT GENMASK(8, 8)
+#define RO_AD_CSI0_CDPHY_L2N_T1C_LPRX_OUT GENMASK(9, 9)
+
+// CDPHY_RX_ANA_AD_HS_0
+#define CDPHY_RX_ANA_AD_HS_0 0x00a0
+#define RO_AD_CSI0_CPHY_T0CA         GENMASK(7, 0)
+#define RO_AD_CSI0_CPHY_T0BC         GENMASK(15, 8)
+#define RO_AD_CSI0_CDPHY_L0_T0AB     GENMASK(23, 16)
+
+// CDPHY_RX_ANA_AD_HS_1
+#define CDPHY_RX_ANA_AD_HS_1 0x00a4
+#define RO_AD_CSI0_DPHY_L1           GENMASK(23, 16)
+
+// CDPHY_RX_ANA_AD_HS_2
+#define CDPHY_RX_ANA_AD_HS_2 0x00a8
+#define RO_AD_CSI0_CPHY_T1CA         GENMASK(15, 8)
+#define RO_AD_CSI0_CDPHY_L2_T1BC     GENMASK(23, 16)
+#define RO_AD_CSI0_CPHY_T1AB         GENMASK(31, 24)
+
+// CDPHY_RX_ANA_SETTING_0
+#define CDPHY_RX_ANA_SETTING_0 0x00f0
+#define CSR_CSI_CLK_MON              GENMASK(0, 0)
+#define CSR_CSI_CLK_EN               GENMASK(1, 1)
+#define CSR_ASYNC_FIFO_GATING_SEL    GENMASK(7, 4)
+#define CSR_CSI_MON_MUX              GENMASK(15, 8)
+#define CSR_CSI_RST_MODE             GENMASK(17, 16)
+#define CSR_SW_RST                   GENMASK(27, 24)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
new file mode 100755
index 000000000000..08586e426469
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
@@ -0,0 +1,264 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#include <linux/bitfield.h>
+
+#ifndef __SENINF1_CSI2_H__
+#define __SENINF1_CSI2_H__
+
+// SENINF_CSI2_EN
+#define SENINF_CSI2_EN 0x0000
+#define CSI2_LANE0_EN GENMASK(0, 0)
+#define CSI2_LANE1_EN GENMASK(1, 1)
+#define CSI2_LANE2_EN GENMASK(2, 2)
+#define CSI2_LANE3_EN GENMASK(3, 3)
+
+// SENINF_CSI2_OPT
+#define SENINF_CSI2_OPT 0x0004
+#define RG_CSI2_CPHY_SEL GENMASK(0, 0)
+#define RG_CSI2_ECC_EN GENMASK(1, 1)
+#define RG_CSI2_B2P_EN GENMASK(2, 2)
+#define RG_CSI2_GENERIC_LONG_PACKET_EN GENMASK(3, 3)
+#define RG_CSI2_IMG_PACKET_EN GENMASK(4, 4)
+#define RG_CSI2_SPEC_V2P0_SEL GENMASK(5, 5)
+#define RG_CSI2_DESCRAMBLE_EN GENMASK(6, 6)
+#define RG_CSI2_VS_OUTPUT_MODE GENMASK(8, 8)
+#define RG_CSI2_VS_OUTPUT_LEN_SEL GENMASK(9, 9)
+#define RG_CSI2_HSYNC_POL GENMASK(12, 12)
+#define RG_CSI2_VSYNC_POL GENMASK(13, 13)
+#define RG_CSI2_FIFO_PUSH_EN GENMASK(21, 16)
+
+// SENINF_CSI2_HDR_MODE_0
+#define SENINF_CSI2_HDR_MODE_0 0x0008
+#define RG_CSI2_HEADER_MODE GENMASK(7, 0)
+#define RG_CSI2_HEADER_LEN GENMASK(10, 8)
+
+// SENINF_CSI2_RESYNC_MERGE_CTRL
+#define SENINF_CSI2_RESYNC_MERGE_CTRL 0x0010
+#define RG_CSI2_RESYNC_CYCLE_CNT GENMASK(4, 0)
+#define RG_CSI2_RESYNC_CYCLE_CNT_OPT GENMASK(8, 8)
+#define RG_CSI2_RESYNC_DATAOUT_OPT GENMASK(9, 9)
+#define RG_CSI2_RESYNC_BYPASS GENMASK(10, 10)
+
+// common VC/DT
+#define RG_CSI2_VC_INTERLEAVE_EN GENMASK(0, 0)
+#define RG_CSI2_DT_INTERLEAVE_MODE GENMASK(5, 4)
+#define RG_CSI2_VC_SEL GENMASK(12, 8)
+#define RG_CSI2_DT_SEL GENMASK(21, 16)
+
+// SENINF_CSI2_S0_DI_CTRL
+#define SENINF_CSI2_S0_DI_CTRL 0x0020
+#define RG_CSI2_S0_VC_INTERLEAVE_EN GENMASK(0, 0)
+#define RG_CSI2_S0_DT_INTERLEAVE_MODE GENMASK(5, 4)
+#define RG_CSI2_S0_VC_SEL GENMASK(12, 8)
+#define RG_CSI2_S0_DT_SEL GENMASK(21, 16)
+
+// SENINF_CSI2_S1_DI_CTRL
+#define SENINF_CSI2_S1_DI_CTRL 0x0024
+#define RG_CSI2_S1_VC_INTERLEAVE_EN GENMASK(0, 0)
+#define RG_CSI2_S1_DT_INTERLEAVE_MODE GENMASK(5, 4)
+#define RG_CSI2_S1_VC_SEL GENMASK(12, 8)
+#define RG_CSI2_S1_DT_SEL GENMASK(21, 16)
+
+// SENINF_CSI2_S2_DI_CTRL
+#define SENINF_CSI2_S2_DI_CTRL 0x0028
+#define RG_CSI2_S2_VC_INTERLEAVE_EN GENMASK(0, 0)
+#define RG_CSI2_S2_DT_INTERLEAVE_MODE GENMASK(5, 4)
+#define RG_CSI2_S2_VC_SEL GENMASK(12, 8)
+#define RG_CSI2_S2_DT_SEL GENMASK(21, 16)
+
+// SENINF_CSI2_S3_DI_CTRL
+#define SENINF_CSI2_S3_DI_CTRL 0x002c
+#define RG_CSI2_S3_VC_INTERLEAVE_EN GENMASK(0, 0)
+#define RG_CSI2_S3_DT_INTERLEAVE_MODE GENMASK(5, 4)
+#define RG_CSI2_S3_VC_SEL GENMASK(12, 8)
+#define RG_CSI2_S3_DT_SEL GENMASK(21, 16)
+
+// SENINF_CSI2_S4_DI_CTRL
+#define SENINF_CSI2_S4_DI_CTRL 0x0030
+#define RG_CSI2_S4_VC_INTERLEAVE_EN GENMASK(0, 0)
+#define RG_CSI2_S4_DT_INTERLEAVE_MODE GENMASK(5, 4)
+#define RG_CSI2_S4_VC_SEL GENMASK(12, 8)
+#define RG_CSI2_S4_DT_SEL GENMASK(21, 16)
+
+// SENINF_CSI2_S5_DI_CTRL
+#define SENINF_CSI2_S5_DI_CTRL 0x0034
+#define RG_CSI2_S5_VC_INTERLEAVE_EN GENMASK(0, 0)
+#define RG_CSI2_S5_DT_INTERLEAVE_MODE GENMASK(5, 4)
+#define RG_CSI2_S5_VC_SEL GENMASK(12, 8)
+#define RG_CSI2_S5_DT_SEL GENMASK(21, 16)
+
+// SENINF_CSI2_S6_DI_CTRL
+#define SENINF_CSI2_S6_DI_CTRL 0x0038
+#define RG_CSI2_S6_VC_INTERLEAVE_EN GENMASK(0, 0)
+#define RG_CSI2_S6_DT_INTERLEAVE_MODE GENMASK(5, 4)
+#define RG_CSI2_S6_VC_SEL GENMASK(12, 8)
+#define RG_CSI2_S6_DT_SEL GENMASK(21, 16)
+
+// SENINF_CSI2_S7_DI_CTRL
+#define SENINF_CSI2_S7_DI_CTRL 0x003c
+#define RG_CSI2_S7_VC_INTERLEAVE_EN GENMASK(0, 0)
+#define RG_CSI2_S7_DT_INTERLEAVE_MODE GENMASK(5, 4)
+#define RG_CSI2_S7_VC_SEL GENMASK(12, 8)
+#define RG_CSI2_S7_DT_SEL GENMASK(21, 16)
+
+// CSI2 group mode/VSYNC bypass/GRP EN
+#define RG_CSI2_GRP_MODE GENMASK(0, 0)
+#define RG_CSI2_VSYNC_BYPASS GENMASK(1, 1)
+#define RG_CSI2_S0_GRP_EN GENMASK(8, 8)
+#define RG_CSI2_S1_GRP_EN GENMASK(9, 9)
+#define RG_CSI2_S2_GRP_EN GENMASK(10, 10)
+#define RG_CSI2_S3_GRP_EN GENMASK(11, 11)
+#define RG_CSI2_S4_GRP_EN GENMASK(12, 12)
+#define RG_CSI2_S5_GRP_EN GENMASK(13, 13)
+#define RG_CSI2_S6_GRP_EN GENMASK(14, 14)
+#define RG_CSI2_S7_GRP_EN GENMASK(15, 15)
+
+// SENINF_CSI2_CH0_CTRL
+#define SENINF_CSI2_CH0_CTRL 0x0060
+#define RG_CSI2_CH0_GRP_MODE GENMASK(0, 0)
+#define RG_CSI2_CH0_VSYNC_BYPASS GENMASK(1, 1)
+#define RG_CSI2_CH0_S0_GRP_EN GENMASK(8, 8)
+#define RG_CSI2_CH0_S1_GRP_EN GENMASK(9, 9)
+#define RG_CSI2_CH0_S2_GRP_EN GENMASK(10, 10)
+#define RG_CSI2_CH0_S3_GRP_EN GENMASK(11, 11)
+#define RG_CSI2_CH0_S4_GRP_EN GENMASK(12, 12)
+#define RG_CSI2_CH0_S5_GRP_EN GENMASK(13, 13)
+#define RG_CSI2_CH0_S6_GRP_EN GENMASK(14, 14)
+#define RG_CSI2_CH0_S7_GRP_EN GENMASK(15, 15)
+
+
+// SENINF_CSI2_CH1_CTRL
+#define SENINF_CSI2_CH1_CTRL 0x0064
+#define RG_CSI2_CH1_GRP_MODE      GENMASK(0, 0)
+#define RG_CSI2_CH1_VSYNC_BYPASS  GENMASK(1, 1)
+#define RG_CSI2_CH1_S0_GRP_EN     GENMASK(8, 8)
+#define RG_CSI2_CH1_S1_GRP_EN     GENMASK(9, 9)
+#define RG_CSI2_CH1_S2_GRP_EN     GENMASK(10, 10)
+#define RG_CSI2_CH1_S3_GRP_EN     GENMASK(11, 11)
+#define RG_CSI2_CH1_S4_GRP_EN     GENMASK(12, 12)
+#define RG_CSI2_CH1_S5_GRP_EN     GENMASK(13, 13)
+#define RG_CSI2_CH1_S6_GRP_EN     GENMASK(14, 14)
+#define RG_CSI2_CH1_S7_GRP_EN     GENMASK(15, 15)
+
+// SENINF_CSI2_CH2_CTRL
+#define SENINF_CSI2_CH2_CTRL 0x0068
+#define RG_CSI2_CH2_GRP_MODE      GENMASK(0, 0)
+#define RG_CSI2_CH2_VSYNC_BYPASS  GENMASK(1, 1)
+#define RG_CSI2_CH2_S0_GRP_EN     GENMASK(8, 8)
+#define RG_CSI2_CH2_S1_GRP_EN     GENMASK(9, 9)
+#define RG_CSI2_CH2_S2_GRP_EN     GENMASK(10, 10)
+#define RG_CSI2_CH2_S3_GRP_EN     GENMASK(11, 11)
+#define RG_CSI2_CH2_S4_GRP_EN     GENMASK(12, 12)
+#define RG_CSI2_CH2_S5_GRP_EN     GENMASK(13, 13)
+#define RG_CSI2_CH2_S6_GRP_EN     GENMASK(14, 14)
+#define RG_CSI2_CH2_S7_GRP_EN     GENMASK(15, 15)
+
+// SENINF_CSI2_CH3_CTRL
+#define SENINF_CSI2_CH3_CTRL 0x006c
+#define RG_CSI2_CH3_GRP_MODE      GENMASK(0, 0)
+#define RG_CSI2_CH3_VSYNC_BYPASS  GENMASK(1, 1)
+#define RG_CSI2_CH3_S0_GRP_EN     GENMASK(8, 8)
+#define RG_CSI2_CH3_S1_GRP_EN     GENMASK(9, 9)
+#define RG_CSI2_CH3_S2_GRP_EN     GENMASK(10, 10)
+#define RG_CSI2_CH3_S3_GRP_EN     GENMASK(11, 11)
+#define RG_CSI2_CH3_S4_GRP_EN     GENMASK(12, 12)
+#define RG_CSI2_CH3_S5_GRP_EN     GENMASK(13, 13)
+#define RG_CSI2_CH3_S6_GRP_EN     GENMASK(14, 14)
+#define RG_CSI2_CH3_S7_GRP_EN     GENMASK(15, 15)
+
+// SENINF_CSI2_IRQ_EN
+#define SENINF_CSI2_IRQ_EN 0x00c0
+#define RG_CSI2_ERR_FRAME_SYNC_IRQ_EN         GENMASK(0, 0)
+#define RG_CSI2_ERR_ID_IRQ_EN                 GENMASK(1, 1)
+#define RG_CSI2_ECC_ERR_UNDETECTED_IRQ_EN     GENMASK(2, 2)
+#define RG_CSI2_ECC_ERR_CORRECTED_IRQ_EN      GENMASK(3, 3)
+#define RG_CSI2_ECC_ERR_DOUBLE_IRQ_EN         GENMASK(4, 4)
+#define RG_CSI2_CRC_CORRECT_IRQ_EN            GENMASK(5, 5)
+#define RG_CSI2_CRC_ERR_IRQ_EN                GENMASK(6, 6)
+#define RG_CSI2_ERR_MULTI_LANE_SYNC_IRQ_EN    GENMASK(7, 7)
+#define RG_CSI2_FS_RECEIVE_IRQ_EN             GENMASK(8, 8)
+#define RG_CSI2_FE_RECEIVE_IRQ_EN             GENMASK(9, 9)
+#define RG_CSI2_LS_RECEIVE_IRQ_EN             GENMASK(10, 10)
+#define RG_CSI2_LE_RECEIVE_IRQ_EN             GENMASK(11, 11)
+#define RG_CSI2_GS_RECEIVE_IRQ_EN             GENMASK(12, 12)
+#define RG_CSI2_ERR_LANE_RESYNC_IRQ_EN        GENMASK(13, 13)
+#define RG_CSI2_LANE_MERGE_FIFO_AF_IRQ_EN     GENMASK(14, 14)
+#define RG_CSI2_ERR_FRAME_SYNC_S0_IRQ_EN      GENMASK(16, 16)
+#define RG_CSI2_ERR_FRAME_SYNC_S1_IRQ_EN      GENMASK(17, 17)
+#define RG_CSI2_ERR_FRAME_SYNC_S2_IRQ_EN      GENMASK(18, 18)
+#define RG_CSI2_ERR_FRAME_SYNC_S3_IRQ_EN      GENMASK(19, 19)
+#define RG_CSI2_ERR_FRAME_SYNC_S4_IRQ_EN      GENMASK(20, 20)
+#define RG_CSI2_ERR_FRAME_SYNC_S5_IRQ_EN      GENMASK(21, 21)
+#define RG_CSI2_ERR_FRAME_SYNC_S6_IRQ_EN      GENMASK(22, 22)
+#define RG_CSI2_ERR_FRAME_SYNC_S7_IRQ_EN      GENMASK(23, 23)
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L0_IRQ_EN GENMASK(24, 24)
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L1_IRQ_EN GENMASK(25, 25)
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L2_IRQ_EN GENMASK(26, 26)
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L3_IRQ_EN GENMASK(27, 27)
+#define RG_CSI2_ASYNC_FIFO_OVERRUN_IRQ_EN      GENMASK(28, 28)
+#define RG_CSI2_RECEIVE_DATA_NOT_ENOUGH_IRQ_EN GENMASK(29, 29)
+#define RG_CSI2_IRQ_CLR_MODE                   GENMASK(31, 31)
+
+// SENINF_CSI2_IRQ_STATUS
+#define SENINF_CSI2_IRQ_STATUS 0x00c8
+#define RO_CSI2_ERR_FRAME_SYNC_IRQ         GENMASK(0, 0)
+#define RO_CSI2_ERR_ID_IRQ                 GENMASK(1, 1)
+#define RO_CSI2_ECC_ERR_UNDETECTED_IRQ     GENMASK(2, 2)
+#define RO_CSI2_ECC_ERR_CORRECTED_IRQ      GENMASK(3, 3)
+#define RO_CSI2_ECC_ERR_DOUBLE_IRQ         GENMASK(4, 4)
+#define RO_CSI2_CRC_CORRECT_IRQ            GENMASK(5, 5)
+#define RO_CSI2_CRC_ERR_IRQ                GENMASK(6, 6)
+#define RO_CSI2_ERR_MULTI_LANE_SYNC_IRQ    GENMASK(7, 7)
+#define RO_CSI2_FS_RECEIVE_IRQ             GENMASK(8, 8)
+#define RO_CSI2_FE_RECEIVE_IRQ             GENMASK(9, 9)
+#define RO_CSI2_LS_RECEIVE_IRQ             GENMASK(10, 10)
+#define RO_CSI2_LE_RECEIVE_IRQ             GENMASK(11, 11)
+#define RO_CSI2_GS_RECEIVE_IRQ             GENMASK(12, 12)
+#define RO_CSI2_ERR_LANE_RESYNC_IRQ        GENMASK(13, 13)
+#define RO_CSI2_LANE_MERGE_FIFO_AF_IRQ     GENMASK(14, 14)
+#define RO_CSI2_ERR_FRAME_SYNC_S0_IRQ      GENMASK(16, 16)
+#define RO_CSI2_ERR_FRAME_SYNC_S1_IRQ      GENMASK(17, 17)
+#define RO_CSI2_ERR_FRAME_SYNC_S2_IRQ      GENMASK(18, 18)
+#define RO_CSI2_ERR_FRAME_SYNC_S3_IRQ      GENMASK(19, 19)
+#define RO_CSI2_ERR_FRAME_SYNC_S4_IRQ      GENMASK(20, 20)
+#define RO_CSI2_ERR_FRAME_SYNC_S5_IRQ      GENMASK(21, 21)
+#define RO_CSI2_ERR_FRAME_SYNC_S6_IRQ      GENMASK(22, 22)
+#define RO_CSI2_ERR_FRAME_SYNC_S7_IRQ      GENMASK(23, 23)
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L0_IRQ GENMASK(24, 24)
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L1_IRQ GENMASK(25, 25)
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L2_IRQ GENMASK(26, 26)
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L3_IRQ GENMASK(27, 27)
+#define RO_CSI2_ASYNC_FIFO_OVERRUN_IRQ      GENMASK(28, 28)
+#define RO_CSI2_RECEIVE_DATA_NOT_ENOUGH_IRQ GENMASK(29, 29)
+
+// SENINF_CSI2_LINE_FRAME_NUM
+#define SENINF_CSI2_LINE_FRAME_NUM 0x00d0
+#define RO_CSI2_LINE_NUM   GENMASK(15, 0)
+#define RO_CSI2_FRAME_NUM  GENMASK(31, 16)
+
+// SENINF_CSI2_PACKET_STATUS
+#define SENINF_CSI2_PACKET_STATUS 0x00d4
+#define RO_CSI2_PACKET_DT GENMASK(5, 0)
+#define RO_CSI2_PACKET_VC GENMASK(12, 8)
+#define RO_CSI2_PACKET_WC GENMASK(31, 16)
+
+// SENINF_CSI2_GEN_SHORT_PACKET_STATUS
+#define SENINF_CSI2_GEN_SHORT_PACKET_STATUS 0x00d8
+#define RO_CSI2_GENERIC_SHORT_PACKET_DT GENMASK(5, 0)
+#define RO_CSI2_GENERIC_SHORT_PACKET_WC GENMASK(31, 16)
+
+// SENINF_CSI2_PACKET_CNT_STATUS
+#define SENINF_CSI2_PACKET_CNT_STATUS 0x00dc
+#define RO_CSI2_PACKET_CNT     GENMASK(15, 0)
+#define RO_CSI2_PACKET_CNT_BUF GENMASK(31, 16)
+
+// SENINF_CSI2_DBG_CTRL
+#define SENINF_CSI2_DBG_CTRL 0x00e0
+#define RG_CSI2_DBG_SEL           GENMASK(7, 0)
+#define RG_CSI2_DBG_EN            GENMASK(16, 16)
+#define RG_CSI2_DBG_PACKET_CNT_EN GENMASK(17, 17)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
new file mode 100755
index 000000000000..8c4619a516e8
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF1_MUX_H__
+#define __SENINF1_MUX_H__
+
+#include <linux/bitfield.h>
+
+// SENINF_MUX_CTRL_0
+#define SENINF_MUX_CTRL_0 0x0000
+#define SENINF_MUX_EN           GENMASK(0, 0)
+#define SENINF_MUX_IRQ_SW_RST   GENMASK(1, 1)
+#define SENINF_MUX_SW_RST       GENMASK(2, 2)
+
+// SENINF_MUX_CTRL_1
+#define SENINF_MUX_CTRL_1 0x0004
+#define RG_SENINF_MUX_SRC_SEL           GENMASK(3, 0)
+#define RG_SENINF_MUX_PIX_MODE_SEL      GENMASK(9, 8)
+#define RG_SENINF_MUX_FIFO_PUSH_EN      GENMASK(21, 16)
+#define RG_SENINF_MUX_RDY_FORCE_MODE_EN GENMASK(24, 24)
+#define RG_SENINF_MUX_RDY_FORCE_MODE_VAL GENMASK(25, 25)
+#define RG_SENINF_MUX_CROP_EN           GENMASK(28, 28)
+
+// SENINF_MUX_OPT
+#define SENINF_MUX_OPT 0x0008
+#define RG_SENINF_MUX_CNT_INIT_OPT         GENMASK(1, 0)
+#define RG_SENINF_MUX_FIFO_FULL_OUTPUT_OPT GENMASK(9, 8)
+#define RG_SENINF_MUX_FIFO_FULL_WR_MODE    GENMASK(11, 10)
+#define RG_SENINF_MUX_FIFO_OVERRUN_RST_EN  GENMASK(12, 12)
+#define RG_SENINF_MUX_HSYNC_POL            GENMASK(16, 16)
+#define RG_SENINF_MUX_VSYNC_POL            GENMASK(17, 17)
+
+// SENINF_MUX_IRQ_EN
+#define SENINF_MUX_IRQ_EN 0x0010
+#define RG_SENINF_MUX_FIFO_OVERRUN_IRQ_EN  GENMASK(0, 0)
+#define RG_SENINF_MUX_FSM_ERR_IRQ_EN       GENMASK(1, 1)
+#define RG_SENINF_MUX_HSIZE_ERR_IRQ_EN     GENMASK(2, 2)
+#define RG_SENINF_MUX_VSIZE_ERR_IRQ_EN     GENMASK(3, 3)
+#define RG_SENINF_MUX_IRQ_CLR_MODE         GENMASK(31, 31)
+
+// SENINF_MUX_IRQ_STATUS
+#define SENINF_MUX_IRQ_STATUS 0x0018
+#define RO_SENINF_MUX_FIFO_OVERRUN_IRQ GENMASK(0, 0)
+#define RO_SENINF_MUX_FSM_ERR_IRQ      GENMASK(1, 1)
+#define RO_SENINF_MUX_HSIZE_ERR_IRQ    GENMASK(2, 2)
+#define RO_SENINF_MUX_VSIZE_ERR_IRQ    GENMASK(3, 3)
+
+// SENINF_MUX_IMG_SIZE
+#define SENINF_MUX_IMG_SIZE 0x0020
+#define RG_SENINF_MUX_EXPECT_HSIZE GENMASK(15, 0)
+#define RG_SENINF_MUX_EXPECT_VSIZE GENMASK(31, 16)
+
+// SENINF_MUX_CROP_PIX_CTRL
+#define SENINF_MUX_CROP_PIX_CTRL 0x0028
+#define RG_SENINF_MUX_CROP_START_8PIX_CNT GENMASK(11, 0)
+#define RG_SENINF_MUX_CROP_END_8PIX_CNT   GENMASK(27, 16)
+
+// SENINF_MUX_SIZE
+#define SENINF_MUX_SIZE 0x0030
+#define RO_SENINF_MUX_RCV_HSIZE GENMASK(15, 0)
+#define RO_SENINF_MUX_RCV_VSIZE GENMASK(31, 16)
+
+// SENINF_MUX_ERR_SIZE
+#define SENINF_MUX_ERR_SIZE 0x0034
+#define RO_SENINF_MUX_RCV_ERR_HSIZE GENMASK(15, 0)
+#define RO_SENINF_MUX_RCV_ERR_VSIZE GENMASK(31, 16)
+
+// SENINF_MUX_FIFO_STATUS
+#define SENINF_MUX_FIFO_STATUS 0x0040
+#define RO_SENINF_MUX_FIFO_WA  GENMASK(8, 0)
+#define RO_SENINF_MUX_FIFO_WCS GENMASK(12, 12)
+#define RO_SENINF_MUX_FIFO_RA  GENMASK(24, 16)
+#define RO_SENINF_MUX_FIFO_RCS GENMASK(28, 28)
+
+// SENINF_MUX_DBG_CTRL
+#define SENINF_MUX_DBG_CTRL 0x0080
+#define RG_SENINF_MUX_DBG_EN  GENMASK(0, 0)
+#define RG_SENINF_MUX_DBG_SEL GENMASK(15, 8)
+
+// SENINF_MUX_DBG_OUT
+#define SENINF_MUX_DBG_OUT 0x0088
+#define RO_SENINF_MUX_DBG_OUT GENMASK(31, 0)
+
+// SENINF_MUX_CAM_MON
+#define SENINF_MUX_CAM_MON 0x00a0
+#define RO_SENINF_MUX_CAM_MON_0 GENMASK(15, 0)
+#define RO_SENINF_MUX_CAM_MON_1 GENMASK(31, 16)
+
+// SENINF_MUX_PIX_CNT
+#define SENINF_MUX_PIX_CNT 0x00a4
+#define RO_SENINF_MUX_PIX_CNT GENMASK(31, 0)
+
+// SENINF_MUX_FRAME_SIZE_MON_CTRL
+#define SENINF_MUX_FRAME_SIZE_MON_CTRL 0x00a8
+#define RG_SENINF_MUX_FRAME_SIZE_MON_EN GENMASK(0, 0)
+
+// SENINF_MUX_FRAME_SIZE_MON_H_VALID
+#define SENINF_MUX_FRAME_SIZE_MON_H_VALID 0x00b0
+#define RO_SENINF_MUX_FRAME_H_VALID GENMASK(31, 0)
+
+// SENINF_MUX_FRAME_SIZE_MON_H_BLANK
+#define SENINF_MUX_FRAME_SIZE_MON_H_BLANK 0x00b4
+#define RO_SENINF_MUX_FRAME_H_BLANK GENMASK(31, 0)
+
+// SENINF_MUX_FRAME_SIZE_MON_V_VALID
+#define SENINF_MUX_FRAME_SIZE_MON_V_VALID 0x00b8
+#define RO_SENINF_MUX_FRAME_V_VALID GENMASK(31, 0)
+
+// SENINF_MUX_FRAME_SIZE_MON_V_BLANK
+#define SENINF_MUX_FRAME_SIZE_MON_V_BLANK 0x00bc
+#define RO_SENINF_MUX_FRAME_V_BLANK GENMASK(31, 0)
+
+// SENINF_MUX_SPARE
+#define SENINF_MUX_SPARE 0x00f0
+#define RG_SENINF_MUX_SPARE_0 GENMASK(7, 0)
+#define RG_SENINF_MUX_SPARE_1 GENMASK(23, 16)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
new file mode 100755
index 000000000000..f1e195f4184c
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF1_H__
+#define __SENINF1_H__
+
+#include <linux/bitfield.h>
+
+// SENINF_CTRL
+#define SENINF_CTRL 0x0000
+#define SENINF_EN GENMASK(0, 0)
+
+// SENINF_DBG
+#define SENINF_DBG 0x0004
+#define RG_SENINF_DBG_SEL GENMASK(3, 0)
+
+// SENINF_CSI_CTRL
+#define SENINF_CSI_CTRL 0x0010
+#define RG_SENINF_CSI2_EN GENMASK(0, 0)
+#define SENINF_CSI2_SW_RST GENMASK(4, 4)
+
+// SENINF_TESTMDL_CTRL
+#define SENINF_TESTMDL_CTRL 0x0020
+#define RG_SENINF_TESTMDL_EN GENMASK(0, 0)
+#define SENINF_TESTMDL_SW_RST GENMASK(4, 4)
+
+// SENINF_TG_CTRL
+#define SENINF_TG_CTRL 0x0030
+#define SENINF_TG_SW_RST GENMASK(4, 4)
+
+// SENINF_SCAM_CTRL
+#define SENINF_SCAM_CTRL 0x0040
+#define RG_SENINF_SCAM_EN GENMASK(0, 0)
+#define SENINF_SCAM_SW_RST GENMASK(4, 4)
+
+// SENINF_PCAM_CTRL
+#define SENINF_PCAM_CTRL 0x0050
+#define RG_SENINF_PCAM_DATA_SEL GENMASK(2, 0)
+
+// SENINF_CCIR_CTRL
+#define SENINF_CCIR_CTRL 0x0060
+#define SENINF_CCIR_SW_RST GENMASK(4, 4)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
new file mode 100755
index 000000000000..62949e6da530
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF_TG1_H__
+#define __SENINF_TG1_H__
+
+#include <linux/bitfield.h>
+
+// TM_CTL
+#define TM_CTL 0x0008
+#define TM_EN                  GENMASK(0, 0)
+#define TM_RST                 GENMASK(1, 1)
+#define TM_FMT                 GENMASK(2, 2)
+#define TM_BIN_IMG_SWITCH_EN   GENMASK(3, 3)
+#define TM_PAT                 GENMASK(8, 4)
+
+// TM_SIZE
+#define TM_SIZE 0x000c
+#define TM_PXL  GENMASK(15, 0)
+#define TM_LINE GENMASK(31, 16)
+
+// TM_CLK
+#define TM_CLK 0x0010
+#define TM_CLK_CNT      GENMASK(7, 0)
+#define TM_CLRBAR_OFT   GENMASK(20, 8)
+#define TM_CLRBAR_IDX   GENMASK(30, 28)
+
+// TM_DUM
+#define TM_DUM 0x0018
+#define TM_DUMMYPXL GENMASK(15, 0)
+#define TM_VSYNC    GENMASK(31, 16)
+
+// TM_RAND_SEED
+#define TM_RAND_SEED 0x001c
+#define TM_SEED GENMASK(31, 0)
+
+// TM_RAND_CTL
+#define TM_RAND_CTL 0x0020
+#define TM_DIFF_FRM GENMASK(0, 0)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
new file mode 100755
index 000000000000..8e760ef13db9
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF_TOP_H__
+#define __SENINF_TOP_H__
+
+#include <linux/bitfield.h>
+
+// SENINF_TOP_CTRL
+#define SENINF_TOP_CTRL 0x0000
+#define SENINF_TOP_SW_RST             GENMASK(0, 0)
+#define SENINF_TOP_N3D_SW_RST         GENMASK(4, 4)
+#define RG_SENINF1_PCAM_PCLK_SEL      GENMASK(8, 8)
+#define RG_SENINF2_PCAM_PCLK_SEL      GENMASK(9, 9)
+#define RG_SENINF1_PCAM_PCLK_EN       GENMASK(12, 12)
+#define RG_SENINF2_PCAM_PCLK_EN       GENMASK(13, 13)
+#define RG_SLICE_FIFO_FULL_OPT        GENMASK(16, 16)
+
+// SENINF_TOP_MUX_CTRL_0
+#define SENINF_TOP_MUX_CTRL_0 0x0010
+#define RG_SENINF_MUX1_SRC_SEL        GENMASK(3, 0)
+#define RG_SENINF_MUX2_SRC_SEL        GENMASK(11, 8)
+#define RG_SENINF_MUX3_SRC_SEL        GENMASK(19, 16)
+#define RG_SENINF_MUX4_SRC_SEL        GENMASK(27, 24)
+
+// SENINF_TOP_MUX_CTRL_1
+#define SENINF_TOP_MUX_CTRL_1 0x0014
+#define RG_SENINF_MUX5_SRC_SEL        GENMASK(3, 0)
+#define RG_SENINF_MUX6_SRC_SEL        GENMASK(11, 8)
+#define RG_SENINF_MUX7_SRC_SEL        GENMASK(19, 16)
+#define RG_SENINF_MUX8_SRC_SEL        GENMASK(27, 24)
+
+// SENINF_TOP_MUX_CTRL_2
+#define SENINF_TOP_MUX_CTRL_2 0x0018
+#define RG_SENINF_MUX9_SRC_SEL        GENMASK(3, 0)
+#define RG_SENINF_MUX10_SRC_SEL       GENMASK(11, 8)
+#define RG_SENINF_MUX11_SRC_SEL       GENMASK(19, 16)
+#define RG_SENINF_MUX12_SRC_SEL       GENMASK(27, 24)
+
+// SENINF_TOP_MUX_CTRL_3
+#define SENINF_TOP_MUX_CTRL_3 0x001c
+#define RG_SENINF_MUX13_SRC_SEL       GENMASK(3, 0)
+
+// SENINF_TOP_PHY_CTRL_CSI0
+#define SENINF_TOP_PHY_CTRL_CSI0 0x0060
+#define PHY_SENINF_MUX0_DPHY_EN       GENMASK(0, 0)
+#define PHY_SENINF_MUX0_CPHY_EN       GENMASK(1, 1)
+#define RG_PHY_SENINF_MUX0_CPHY_MODE  GENMASK(9, 8)
+
+// SENINF_TOP_PHY_CTRL_CSI1
+#define SENINF_TOP_PHY_CTRL_CSI1 0x0064
+#define PHY_SENINF_MUX1_DPHY_EN       GENMASK(0, 0)
+#define PHY_SENINF_MUX1_CPHY_EN       GENMASK(1, 1)
+#define RG_PHY_SENINF_MUX1_CPHY_MODE  GENMASK(9, 8)
+
+// SENINF_TOP_PHY_CTRL_CSI2
+#define SENINF_TOP_PHY_CTRL_CSI2 0x0068
+#define PHY_SENINF_MUX2_DPHY_EN       GENMASK(0, 0)
+#define PHY_SENINF_MUX2_CPHY_EN       GENMASK(1, 1)
+#define RG_PHY_SENINF_MUX2_CPHY_MODE  GENMASK(9, 8)
+
+// SENINF_TOP_PHY_CTRL_CSI3
+#define SENINF_TOP_PHY_CTRL_CSI3 0x006c
+#define PHY_SENINF_MUX3_DPHY_EN       GENMASK(0, 0)
+#define PHY_SENINF_MUX3_CPHY_EN       GENMASK(1, 1)
+#define RG_PHY_SENINF_MUX3_CPHY_MODE  GENMASK(9, 8)
+
+// SENINF_TOP_PHY_CTRL_CSI4
+#define SENINF_TOP_PHY_CTRL_CSI4 0x0070
+#define PHY_SENINF_MUX4_DPHY_EN       GENMASK(0, 0)
+#define PHY_SENINF_MUX4_CPHY_EN       GENMASK(1, 1)
+#define RG_PHY_SENINF_MUX4_CPHY_MODE  GENMASK(9, 8)
+
+#endif
-- 
2.18.0

