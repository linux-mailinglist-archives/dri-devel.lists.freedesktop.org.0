Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A91E6F6F
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69446E83E;
	Thu, 28 May 2020 22:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 592216E1A8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 17:05:16 +0000 (UTC)
X-UUID: 68aff3dc5a3b47b8874cfbad71866239-20200529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Xrwn2Nf5VE1A0V8H6tdgcbvBXDbJI4cjOq+ERDxyBvA=; 
 b=HBkaSMV2pFPJy0ntWwpeOPxiIe8ZTxBq3t2EyFwjGBppY1s4NOp02efbMxOOsldKR7+ZdwEpSUMYlknL6e1lAvJe/uI08DDtv4QannTmASK0dtR/8VU5Eo+yB70y2fvBavR9GLJIuBEkBaMMgRS5GiPqS51CDSa6IIax0joQyxs=;
X-UUID: 68aff3dc5a3b47b8874cfbad71866239-20200529
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1194902176; Fri, 29 May 2020 01:05:11 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 01:05:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 May 2020 01:05:07 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 01/16] dt-binding: gce: add gce header file for mt6779
Date: Fri, 29 May 2020 01:04:37 +0800
Message-ID: <1590685491-17107-3-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 28 May 2020 22:46:32 +0000
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the mt6779 gce.

Add gce header file defined the gce hardware event,
subsys number and constant for mt6779.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
 include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
 2 files changed, 227 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt6779-gce.h

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 7b13787ab13d..82c0a83fed09 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -9,7 +9,8 @@ CMDQ driver uses mailbox framework for communication. Please refer to
 mailbox.txt for generic information about mailbox device-tree bindings.
 
 Required properties:
-- compatible: can be "mediatek,mt8173-gce" or "mediatek,mt8183-gce"
+- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce" or
+  "mediatek,mt6779-gce".
 - reg: Address range of the GCE unit
 - interrupts: The interrupt signal from the GCE block
 - clock: Clocks according to the common clock binding
@@ -36,8 +37,9 @@ Optional properties for a client device:
   start_offset: the start offset of register address that GCE can access.
   size: the total size of register address that GCE can access.
 
-Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h'
-or 'dt-binding/gce/mt8183-gce.h'. Such as sub-system ids, thread priority, event ids.
+Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
+'dt-binding/gce/mt8183-gce.h' or 'dt-bindings/gce/mt6779-gce.h'. Such as
+sub-system ids, thread priority, event ids.
 
 Example:
 
diff --git a/include/dt-bindings/gce/mt6779-gce.h b/include/dt-bindings/gce/mt6779-gce.h
new file mode 100644
index 000000000000..06101316ace4
--- /dev/null
+++ b/include/dt-bindings/gce/mt6779-gce.h
@@ -0,0 +1,222 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_GCE_MT6779_H
+#define _DT_BINDINGS_GCE_MT6779_H
+
+#define CMDQ_NO_TIMEOUT		0xffffffff
+
+/* GCE HW thread priority */
+#define CMDQ_THR_PRIO_LOWEST	0
+#define CMDQ_THR_PRIO_1		1
+#define CMDQ_THR_PRIO_2		2
+#define CMDQ_THR_PRIO_3		3
+#define CMDQ_THR_PRIO_4		4
+#define CMDQ_THR_PRIO_5		5
+#define CMDQ_THR_PRIO_6		6
+#define CMDQ_THR_PRIO_HIGHEST	7
+
+/* GCE subsys table */
+#define SUBSYS_1300XXXX		0
+#define SUBSYS_1400XXXX		1
+#define SUBSYS_1401XXXX		2
+#define SUBSYS_1402XXXX		3
+#define SUBSYS_1502XXXX		4
+#define SUBSYS_1880XXXX		5
+#define SUBSYS_1881XXXX		6
+#define SUBSYS_1882XXXX		7
+#define SUBSYS_1883XXXX		8
+#define SUBSYS_1884XXXX		9
+#define SUBSYS_1000XXXX		10
+#define SUBSYS_1001XXXX		11
+#define SUBSYS_1002XXXX		12
+#define SUBSYS_1003XXXX		13
+#define SUBSYS_1004XXXX		14
+#define SUBSYS_1005XXXX		15
+#define SUBSYS_1020XXXX		16
+#define SUBSYS_1028XXXX		17
+#define SUBSYS_1700XXXX		18
+#define SUBSYS_1701XXXX		19
+#define SUBSYS_1702XXXX		20
+#define SUBSYS_1703XXXX		21
+#define SUBSYS_1800XXXX		22
+#define SUBSYS_1801XXXX		23
+#define SUBSYS_1802XXXX		24
+#define SUBSYS_1804XXXX		25
+#define SUBSYS_1805XXXX		26
+#define SUBSYS_1808XXXX		27
+#define SUBSYS_180aXXXX		28
+#define SUBSYS_180bXXXX		29
+#define CMDQ_SUBSYS_OFF		32
+
+/* GCE hardware events */
+#define CMDQ_EVENT_DISP_RDMA0_SOF		0
+#define CMDQ_EVENT_DISP_RDMA1_SOF		1
+#define CMDQ_EVENT_MDP_RDMA0_SOF		2
+#define CMDQ_EVENT_MDP_RDMA1_SOF		3
+#define CMDQ_EVENT_MDP_RSZ0_SOF			4
+#define CMDQ_EVENT_MDP_RSZ1_SOF			5
+#define CMDQ_EVENT_MDP_TDSHP_SOF		6
+#define CMDQ_EVENT_MDP_WROT0_SOF		7
+#define CMDQ_EVENT_MDP_WROT1_SOF		8
+#define CMDQ_EVENT_DISP_OVL0_SOF		9
+#define CMDQ_EVENT_DISP_2L_OVL0_SOF		10
+#define CMDQ_EVENT_DISP_2L_OVL1_SOF		11
+#define CMDQ_EVENT_DISP_WDMA0_SOF		12
+#define CMDQ_EVENT_DISP_COLOR0_SOF		13
+#define CMDQ_EVENT_DISP_CCORR0_SOF		14
+#define CMDQ_EVENT_DISP_AAL0_SOF		15
+#define CMDQ_EVENT_DISP_GAMMA0_SOF		16
+#define CMDQ_EVENT_DISP_DITHER0_SOF		17
+#define CMDQ_EVENT_DISP_PWM0_SOF		18
+#define CMDQ_EVENT_DISP_DSI0_SOF		19
+#define CMDQ_EVENT_DISP_DPI0_SOF		20
+#define CMDQ_EVENT_DISP_POSTMASK0_SOF		21
+#define CMDQ_EVENT_DISP_RSZ0_SOF		22
+#define CMDQ_EVENT_MDP_AAL_SOF			23
+#define CMDQ_EVENT_MDP_CCORR_SOF		24
+#define CMDQ_EVENT_DISP_DBI0_SOF		25
+#define CMDQ_EVENT_ISP_RELAY_SOF		26
+#define CMDQ_EVENT_IPU_RELAY_SOF		27
+#define CMDQ_EVENT_DISP_RDMA0_EOF		28
+#define CMDQ_EVENT_DISP_RDMA1_EOF		29
+#define CMDQ_EVENT_MDP_RDMA0_EOF		30
+#define CMDQ_EVENT_MDP_RDMA1_EOF		31
+#define CMDQ_EVENT_MDP_RSZ0_EOF			32
+#define CMDQ_EVENT_MDP_RSZ1_EOF			33
+#define CMDQ_EVENT_MDP_TDSHP_EOF		34
+#define CMDQ_EVENT_MDP_WROT0_W_EOF		35
+#define CMDQ_EVENT_MDP_WROT1_W_EOF		36
+#define CMDQ_EVENT_DISP_OVL0_EOF		37
+#define CMDQ_EVENT_DISP_2L_OVL0_EOF		38
+#define CMDQ_EVENT_DISP_2L_OVL1_EOF		39
+#define CMDQ_EVENT_DISP_WDMA0_EOF		40
+#define CMDQ_EVENT_DISP_COLOR0_EOF		41
+#define CMDQ_EVENT_DISP_CCORR0_EOF		42
+#define CMDQ_EVENT_DISP_AAL0_EOF		43
+#define CMDQ_EVENT_DISP_GAMMA0_EOF		44
+#define CMDQ_EVENT_DISP_DITHER0_EOF		45
+#define CMDQ_EVENT_DISP_DSI0_EOF		46
+#define CMDQ_EVENT_DISP_DPI0_EOF		47
+#define CMDQ_EVENT_DISP_RSZ0_EOF		49
+#define CMDQ_EVENT_MDP_AAL_FRAME_DONE		50
+#define CMDQ_EVENT_MDP_CCORR_FRAME_DONE		51
+#define CMDQ_EVENT_DISP_POSTMASK0_FRAME_DONE	52
+#define CMDQ_EVENT_MUTEX0_STREAM_EOF		130
+#define CMDQ_EVENT_MUTEX1_STREAM_EOF		131
+#define CMDQ_EVENT_MUTEX2_STREAM_EOF		132
+#define CMDQ_EVENT_MUTEX3_STREAM_EOF		133
+#define CMDQ_EVENT_MUTEX4_STREAM_EOF		134
+#define CMDQ_EVENT_MUTEX5_STREAM_EOF		135
+#define CMDQ_EVENT_MUTEX6_STREAM_EOF		136
+#define CMDQ_EVENT_MUTEX7_STREAM_EOF		137
+#define CMDQ_EVENT_MUTEX8_STREAM_EOF		138
+#define CMDQ_EVENT_MUTEX9_STREAM_EOF		139
+#define CMDQ_EVENT_MUTEX10_STREAM_EOF		140
+#define CMDQ_EVENT_MUTEX11_STREAM_EOF		141
+#define CMDQ_EVENT_DISP_RDMA0_UNDERRUN		142
+#define CMDQ_EVENT_DISP_RDMA1_UNDERRUN		143
+#define CMDQ_EVENT_DISP_RDMA2_UNDERRUN		144
+#define CMDQ_EVENT_DISP_RDMA3_UNDERRUN		145
+#define CMDQ_EVENT_DSI0_TE			146
+#define CMDQ_EVENT_DSI0_IRQ_EVENT		147
+#define CMDQ_EVENT_DSI0_DONE_EVENT		148
+#define CMDQ_EVENT_DISP_POSTMASK0_RST_DONE	150
+#define CMDQ_EVENT_DISP_WDMA0_RST_DONE		151
+#define CMDQ_EVENT_MDP_WROT0_RST_DONE		153
+#define CMDQ_EVENT_MDP_RDMA0_RST_DONE		154
+#define CMDQ_EVENT_DISP_OVL0_RST_DONE		155
+#define CMDQ_EVENT_DISP_OVL0_2L_RST_DONE	156
+#define CMDQ_EVENT_DISP_OVL1_2L_RST_DONE	157
+#define CMDQ_EVENT_DIP_CQ_THREAD0_EOF		257
+#define CMDQ_EVENT_DIP_CQ_THREAD1_EOF		258
+#define CMDQ_EVENT_DIP_CQ_THREAD2_EOF		259
+#define CMDQ_EVENT_DIP_CQ_THREAD3_EOF		260
+#define CMDQ_EVENT_DIP_CQ_THREAD4_EOF		261
+#define CMDQ_EVENT_DIP_CQ_THREAD5_EOF		262
+#define CMDQ_EVENT_DIP_CQ_THREAD6_EOF		263
+#define CMDQ_EVENT_DIP_CQ_THREAD7_EOF		264
+#define CMDQ_EVENT_DIP_CQ_THREAD8_EOF		265
+#define CMDQ_EVENT_DIP_CQ_THREAD9_EOF		266
+#define CMDQ_EVENT_DIP_CQ_THREAD10_EOF		267
+#define CMDQ_EVENT_DIP_CQ_THREAD11_EOF		268
+#define CMDQ_EVENT_DIP_CQ_THREAD12_EOF		269
+#define CMDQ_EVENT_DIP_CQ_THREAD13_EOF		270
+#define CMDQ_EVENT_DIP_CQ_THREAD14_EOF		271
+#define CMDQ_EVENT_DIP_CQ_THREAD15_EOF		272
+#define CMDQ_EVENT_DIP_CQ_THREAD16_EOF		273
+#define CMDQ_EVENT_DIP_CQ_THREAD17_EOF		274
+#define CMDQ_EVENT_DIP_CQ_THREAD18_EOF		275
+#define CMDQ_EVENT_DIP_DMA_ERR_EVENT		276
+#define CMDQ_EVENT_AMD_FRAME_DONE		277
+#define CMDQ_EVENT_MFB_DONE			278
+#define CMDQ_EVENT_WPE_A_EOF			279
+#define CMDQ_EVENT_VENC_EOF			289
+#define CMDQ_EVENT_VENC_CMDQ_PAUSE_DONE		290
+#define CMDQ_EVENT_JPEG_ENC_EOF			291
+#define CMDQ_EVENT_VENC_MB_DONE			292
+#define CMDQ_EVENT_VENC_128BYTE_CNT_DONE	293
+#define CMDQ_EVENT_ISP_FRAME_DONE_A		321
+#define CMDQ_EVENT_ISP_FRAME_DONE_B		322
+#define CMDQ_EVENT_ISP_FRAME_DONE_C		323
+#define CMDQ_EVENT_ISP_CAMSV_0_PASS1_DONE	324
+#define CMDQ_EVENT_ISP_CAMSV_0_2_PASS1_DONE	325
+#define CMDQ_EVENT_ISP_CAMSV_1_PASS1_DONE	326
+#define CMDQ_EVENT_ISP_CAMSV_2_PASS1_DONE	327
+#define CMDQ_EVENT_ISP_CAMSV_3_PASS1_DONE	328
+#define CMDQ_EVENT_ISP_TSF_DONE			329
+#define CMDQ_EVENT_SENINF_0_FIFO_FULL		330
+#define CMDQ_EVENT_SENINF_1_FIFO_FULL		331
+#define CMDQ_EVENT_SENINF_2_FIFO_FULL		332
+#define CMDQ_EVENT_SENINF_3_FIFO_FULL		333
+#define CMDQ_EVENT_SENINF_4_FIFO_FULL		334
+#define CMDQ_EVENT_SENINF_5_FIFO_FULL		335
+#define CMDQ_EVENT_SENINF_6_FIFO_FULL		336
+#define CMDQ_EVENT_SENINF_7_FIFO_FULL		337
+#define CMDQ_EVENT_TG_OVRUN_A_INT_DLY		338
+#define CMDQ_EVENT_TG_OVRUN_B_INT_DLY		339
+#define CMDQ_EVENT_TG_OVRUN_C_INT		340
+#define CMDQ_EVENT_TG_GRABERR_A_INT_DLY		341
+#define CMDQ_EVENT_TG_GRABERR_B_INT_DLY		342
+#define CMDQ_EVENT_TG_GRABERR_C_INT		343
+#define CMDQ_EVENT_CQ_VR_SNAP_A_INT_DLY		344
+#define CMDQ_EVENT_CQ_VR_SNAP_B_INT_DLY		345
+#define CMDQ_EVENT_CQ_VR_SNAP_C_INT		346
+#define CMDQ_EVENT_DMA_R1_ERROR_A_INT_DLY	347
+#define CMDQ_EVENT_DMA_R1_ERROR_B_INT_DLY	348
+#define CMDQ_EVENT_DMA_R1_ERROR_C_INT		349
+#define CMDQ_EVENT_APU_GCE_CORE0_EVENT_0	353
+#define CMDQ_EVENT_APU_GCE_CORE0_EVENT_1	354
+#define CMDQ_EVENT_APU_GCE_CORE0_EVENT_2	355
+#define CMDQ_EVENT_APU_GCE_CORE0_EVENT_3	356
+#define CMDQ_EVENT_APU_GCE_CORE1_EVENT_0	385
+#define CMDQ_EVENT_APU_GCE_CORE1_EVENT_1	386
+#define CMDQ_EVENT_APU_GCE_CORE1_EVENT_2	387
+#define CMDQ_EVENT_APU_GCE_CORE1_EVENT_3	388
+#define CMDQ_EVENT_VDEC_EVENT_0			416
+#define CMDQ_EVENT_VDEC_EVENT_1			417
+#define CMDQ_EVENT_VDEC_EVENT_2			418
+#define CMDQ_EVENT_VDEC_EVENT_3			419
+#define CMDQ_EVENT_VDEC_EVENT_4			420
+#define CMDQ_EVENT_VDEC_EVENT_5			421
+#define CMDQ_EVENT_VDEC_EVENT_6			422
+#define CMDQ_EVENT_VDEC_EVENT_7			423
+#define CMDQ_EVENT_VDEC_EVENT_8			424
+#define CMDQ_EVENT_VDEC_EVENT_9			425
+#define CMDQ_EVENT_VDEC_EVENT_10		426
+#define CMDQ_EVENT_VDEC_EVENT_11		427
+#define CMDQ_EVENT_VDEC_EVENT_12		428
+#define CMDQ_EVENT_VDEC_EVENT_13		429
+#define CMDQ_EVENT_VDEC_EVENT_14		430
+#define CMDQ_EVENT_VDEC_EVENT_15		431
+#define CMDQ_EVENT_FDVT_DONE			449
+#define CMDQ_EVENT_FE_DONE			450
+#define CMDQ_EVENT_RSC_EOF			451
+#define CMDQ_EVENT_DVS_DONE_ASYNC_SHOT		452
+#define CMDQ_EVENT_DVP_DONE_ASYNC_SHOT		453
+#define CMDQ_EVENT_DSI0_TE_INFRA		898
+
+#endif
-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
