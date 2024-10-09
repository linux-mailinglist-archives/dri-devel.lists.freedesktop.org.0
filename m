Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CF0996BF2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 15:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B0710E705;
	Wed,  9 Oct 2024 13:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bujwaarj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA65510E6E3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 11:16:15 +0000 (UTC)
X-UUID: e32539a8862f11ef8b96093e013ec31c-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4XpWAyEynjzZc1Gg5Q2UscCHSaUGQb/UYCjpqT1xx6Q=; 
 b=bujwaarj1Xec+lJ6l9kCqiJIw+dRyYyLT+DxMVoXWZumGxaMa0Be8cYr//HXojMZE00/6gL7DBUrQ1jTW+0C6PEfmouJB1t92WgM+EmVllofk/lZVhB1sHig8V6y02B1z9sQVGrIO4f7X0Xquzp/WtQCYY/OOQOKKlXqEb3fle8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:89a91dbc-4804-48c0-be4c-77f7b9113be5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:218a0041-8751-41b2-98dd-475503d45150,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e32539a8862f11ef8b96093e013ec31c-20241009
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <shu-hsiang.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 619177271; Wed, 09 Oct 2024 19:16:10 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 19:16:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 19:16:09 +0800
From: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian Konig <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
 <hidenorik@chromium.org>, <yunkec@chromium.org>, <shun-yi.wang@mediatek.com>, 
 Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
Subject: [PATCH v1 10/10] uapi: linux: add mediatek isp_7x camsys user api
Date: Wed, 9 Oct 2024 19:15:51 +0800
Message-ID: <20241009111551.27052-11-Shu-hsiang.Yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 09 Oct 2024 13:31:32 +0000
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

Add UAPI for MediaTek ISP platform, providing user-space
interfaces for the new camsys driver.

Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
---
 include/uapi/linux/mtkisp_camsys.h | 227 +++++++++++++++++++++++++++++
 1 file changed, 227 insertions(+)
 create mode 100644 include/uapi/linux/mtkisp_camsys.h

diff --git a/include/uapi/linux/mtkisp_camsys.h b/include/uapi/linux/mtkisp_camsys.h
new file mode 100644
index 000000000000..9c43f0799dbf
--- /dev/null
+++ b/include/uapi/linux/mtkisp_camsys.h
@@ -0,0 +1,227 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * MediaTek ISP camsys User space API
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#ifndef _MTKISP_CAMSYS_USER_H
+#define _MTKISP_CAMSYS_USER_H
+
+#include <linux/videodev2.h>
+#include <linux/v4l2-controls.h>
+
+#define V4L2_BUF_FLAG_TIMESTAMP_COPY		0x00004000
+#define V4L2_BUF_FLAG_TIMESTAMP_BOOTIME		0x00008000
+
+/* MTK ISP camsys events */
+#define V4L2_EVENT_REQUEST_DRAINED              (V4L2_EVENT_PRIVATE_START + 1)
+#define V4L2_EVENT_REQUEST_DUMPED               (V4L2_EVENT_PRIVATE_START + 2)
+
+/* The base for the mediatek camsys driver controls */
+/* We reserve 48 controls for this driver. */
+#define V4L2_CID_USER_MTK_CAM_BASE		(V4L2_CID_USER_BASE + 0x10d0)
+
+/* MTK ISP camsys controls */
+#define V4L2_CID_MTK_CAM_USED_ENGINE_LIMIT	(V4L2_CID_USER_MTK_CAM_BASE + 1)
+#define V4L2_CID_MTK_CAM_BIN_LIMIT		(V4L2_CID_USER_MTK_CAM_BASE + 2)
+#define V4L2_CID_MTK_CAM_FRZ_LIMIT		(V4L2_CID_USER_MTK_CAM_BASE + 3)
+#define V4L2_CID_MTK_CAM_RESOURCE_PLAN_POLICY	(V4L2_CID_USER_MTK_CAM_BASE + 4)
+#define V4L2_CID_MTK_CAM_USED_ENGINE		(V4L2_CID_USER_MTK_CAM_BASE + 5)
+#define V4L2_CID_MTK_CAM_BIN			(V4L2_CID_USER_MTK_CAM_BASE + 6)
+#define V4L2_CID_MTK_CAM_FRZ			(V4L2_CID_USER_MTK_CAM_BASE + 7)
+#define V4L2_CID_MTK_CAM_USED_ENGINE_TRY	(V4L2_CID_USER_MTK_CAM_BASE + 8)
+#define V4L2_CID_MTK_CAM_BIN_TRY		(V4L2_CID_USER_MTK_CAM_BASE + 9)
+#define V4L2_CID_MTK_CAM_FRZ_TRY		(V4L2_CID_USER_MTK_CAM_BASE + 10)
+#define V4L2_CID_MTK_CAM_PIXEL_RATE		(V4L2_CID_USER_MTK_CAM_BASE + 11)
+#define V4L2_CID_MTK_CAM_FEATURE		(V4L2_CID_USER_MTK_CAM_BASE + 12)
+#define V4L2_CID_MTK_CAM_SYNC_ID		(V4L2_CID_USER_MTK_CAM_BASE + 13)
+#define V4L2_CID_MTK_CAM_RAW_PATH_SELECT	(V4L2_CID_USER_MTK_CAM_BASE + 14)
+#define V4L2_CID_MTK_CAM_HSF_EN			(V4L2_CID_USER_MTK_CAM_BASE + 15)
+#define V4L2_CID_MTK_CAM_PDE_INFO		(V4L2_CID_USER_MTK_CAM_BASE + 16)
+#define V4L2_CID_MTK_CAM_MSTREAM_EXPOSURE	(V4L2_CID_USER_MTK_CAM_BASE + 17)
+#define V4L2_CID_MTK_CAM_RAW_RESOURCE_CALC	(V4L2_CID_USER_MTK_CAM_BASE + 18)
+#define V4L2_CID_MTK_CAM_TG_FLASH_CFG		(V4L2_CID_USER_MTK_CAM_BASE + 19)
+#define V4L2_CID_MTK_CAM_RAW_RESOURCE_UPDATE	(V4L2_CID_USER_MTK_CAM_BASE + 20)
+#define V4L2_CID_MTK_CAM_CAMSYS_HW_MODE		(V4L2_CID_USER_MTK_CAM_BASE + 21)
+
+/* Luminance+Chrominance formats */
+#define V4L2_PIX_FMT_YUYV10  v4l2_fourcc('Y', 'U', 'Y', 'A') /* 16  YUV 4:2:2 10-bit */
+#define V4L2_PIX_FMT_YVYU10  v4l2_fourcc('Y', 'V', 'Y', 'A') /* 16  YUV 4:2:2 10-bit */
+#define V4L2_PIX_FMT_UYVY10  v4l2_fourcc('U', 'Y', 'V', 'A') /* 16  YUV 4:2:2 10-bit */
+#define V4L2_PIX_FMT_VYUY10  v4l2_fourcc('V', 'Y', 'U', 'A') /* 16  YUV 4:2:2 10-bit */
+#define V4L2_PIX_FMT_YUYV12  v4l2_fourcc('Y', 'U', 'Y', 'C') /* 16  YUV 4:2:2 12-bit */
+#define V4L2_PIX_FMT_YVYU12  v4l2_fourcc('Y', 'V', 'Y', 'C') /* 16  YUV 4:2:2 12-bit */
+#define V4L2_PIX_FMT_UYVY12  v4l2_fourcc('U', 'Y', 'V', 'C') /* 16  YUV 4:2:2 12-bit */
+#define V4L2_PIX_FMT_VYUY12  v4l2_fourcc('V', 'Y', 'U', 'C') /* 16  YUV 4:2:2 12-bit */
+
+/* two planes -- one Y, one Cr + Cb interleaved  */
+#define V4L2_PIX_FMT_NV12_10 v4l2_fourcc('1', '2', 'A', 'U') /* 12  Y/CbCr 4:2:0 10 bits un-packed */
+#define V4L2_PIX_FMT_NV21_10 v4l2_fourcc('2', '1', 'A', 'U') /* 12  Y/CrCb 4:2:0 10 bits un-packed */
+#define V4L2_PIX_FMT_NV16_10 v4l2_fourcc('1', '6', 'A', 'U') /* 16  Y/CbCr 4:2:2 10 bits un-packed */
+#define V4L2_PIX_FMT_NV61_10 v4l2_fourcc('6', '1', 'A', 'U') /* 16  Y/CrCb 4:2:2 10 bits un-packed */
+#define V4L2_PIX_FMT_NV12_12 v4l2_fourcc('1', '2', 'C', 'U') /* 12  Y/CbCr 4:2:0 12 bits un-packed */
+#define V4L2_PIX_FMT_NV21_12 v4l2_fourcc('2', '1', 'C', 'U') /* 12  Y/CrCb 4:2:0 12 bits un-packed */
+#define V4L2_PIX_FMT_NV16_12 v4l2_fourcc('1', '6', 'C', 'U') /* 16  Y/CbCr 4:2:2 12 bits un-packed */
+#define V4L2_PIX_FMT_NV61_12 v4l2_fourcc('6', '1', 'C', 'U') /* 16  Y/CrCb 4:2:2 12 bits un-packed */
+
+/* Vendor specific - MediaTek ISP bayer formats */
+#define V4L2_PIX_FMT_MTISP_SBGGR8   v4l2_fourcc('M', 'B', 'B', '8') /*  Packed  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG8   v4l2_fourcc('M', 'B', 'G', '8') /*  Packed  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG8   v4l2_fourcc('M', 'B', 'g', '8') /*  Packed  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB8   v4l2_fourcc('M', 'B', 'R', '8') /*  Packed  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR10  v4l2_fourcc('M', 'B', 'B', 'A') /*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG10  v4l2_fourcc('M', 'B', 'G', 'A') /*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG10  v4l2_fourcc('M', 'B', 'g', 'A') /*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB10  v4l2_fourcc('M', 'B', 'R', 'A') /*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR12  v4l2_fourcc('M', 'B', 'B', 'C') /*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG12  v4l2_fourcc('M', 'B', 'G', 'C') /*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG12  v4l2_fourcc('M', 'B', 'g', 'C') /*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB12  v4l2_fourcc('M', 'B', 'R', 'C') /*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR14  v4l2_fourcc('M', 'B', 'B', 'E') /*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG14  v4l2_fourcc('M', 'B', 'G', 'E') /*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG14  v4l2_fourcc('M', 'B', 'g', 'E') /*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB14  v4l2_fourcc('M', 'B', 'R', 'E') /*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR8F  v4l2_fourcc('M', 'F', 'B', '8') /*  Full-G  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG8F  v4l2_fourcc('M', 'F', 'G', '8') /*  Full-G  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG8F  v4l2_fourcc('M', 'F', 'g', '8') /*  Full-G  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB8F  v4l2_fourcc('M', 'F', 'R', '8') /*  Full-G  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR10F  v4l2_fourcc('M', 'F', 'B', 'A') /*  Full-G 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG10F  v4l2_fourcc('M', 'F', 'G', 'A') /*  Full-G 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG10F  v4l2_fourcc('M', 'F', 'g', 'A') /*  Full-G 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB10F  v4l2_fourcc('M', 'F', 'R', 'A') /*  Full-G 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR12F  v4l2_fourcc('M', 'F', 'B', 'C') /*  Full-G 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG12F  v4l2_fourcc('M', 'F', 'G', 'C') /*  Full-G 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG12F  v4l2_fourcc('M', 'F', 'g', 'C') /*  Full-G 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB12F  v4l2_fourcc('M', 'F', 'R', 'C') /*  Full-G 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR14F  v4l2_fourcc('M', 'F', 'B', 'E') /*  Full-G 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG14F  v4l2_fourcc('M', 'F', 'G', 'E') /*  Full-G 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG14F  v4l2_fourcc('M', 'F', 'g', 'E') /*  Full-G 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB14F  v4l2_fourcc('M', 'F', 'R', 'E') /*  Full-G 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRB8F  v4l2_fourcc('M', 'F', '8', 'P') /* three planes Full-G 8-bit */
+#define V4L2_PIX_FMT_MTISP_SGRB10F  v4l2_fourcc('M', 'F', 'A', 'P') /* three planes Full-G 10-bit */
+#define V4L2_PIX_FMT_MTISP_SGRB12F  v4l2_fourcc('M', 'F', 'C', 'P') /* three planes Full-G 12-bit */
+
+/* Vendor specific - MediaTek Luminance+Chrominance formats */
+#define V4L2_PIX_FMT_MTISP_YUYV10P v4l2_fourcc('Y', 'U', 'A', 'P') /* YUV 4:2:2 10-bit packed */
+#define V4L2_PIX_FMT_MTISP_YVYU10P v4l2_fourcc('Y', 'V', 'A', 'P') /* YUV 4:2:2 10-bit packed */
+#define V4L2_PIX_FMT_MTISP_UYVY10P v4l2_fourcc('U', 'Y', 'A', 'P') /* YUV 4:2:2 10-bit packed */
+#define V4L2_PIX_FMT_MTISP_VYUY10P v4l2_fourcc('V', 'Y', 'A', 'P') /* YUV 4:2:2 10-bit packed */
+#define V4L2_PIX_FMT_MTISP_NV12_10P v4l2_fourcc('1', '2', 'A', 'P') /* Y/CbCr 4:2:0 10 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV21_10P v4l2_fourcc('2', '1', 'A', 'P') /* Y/CrCb 4:2:0 10 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV16_10P v4l2_fourcc('1', '6', 'A', 'P') /* Y/CbCr 4:2:2 10 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV61_10P v4l2_fourcc('6', '1', 'A', 'P') /* Y/CrCb 4:2:2 10 bits packed */
+#define V4L2_PIX_FMT_MTISP_YUYV12P v4l2_fourcc('Y', 'U', 'C', 'P') /* YUV 4:2:2 12-bit packed */
+#define V4L2_PIX_FMT_MTISP_YVYU12P v4l2_fourcc('Y', 'V', 'C', 'P') /* YUV 4:2:2 12-bit packed */
+#define V4L2_PIX_FMT_MTISP_UYVY12P v4l2_fourcc('U', 'Y', 'C', 'P') /* YUV 4:2:2 12-bit packed */
+#define V4L2_PIX_FMT_MTISP_VYUY12P v4l2_fourcc('V', 'Y', 'C', 'P') /* YUV 4:2:2 12-bit packed */
+#define V4L2_PIX_FMT_MTISP_NV12_12P v4l2_fourcc('1', '2', 'C', 'P') /* Y/CbCr 4:2:0 12 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV21_12P v4l2_fourcc('2', '1', 'C', 'P') /* Y/CrCb 4:2:0 12 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV16_12P v4l2_fourcc('1', '6', 'C', 'P') /* Y/CbCr 4:2:2 12 bits packed */
+#define V4L2_PIX_FMT_MTISP_NV61_12P v4l2_fourcc('6', '1', 'C', 'P') /* Y/CrCb 4:2:2 12 bits packed */
+
+/* Vendor specific - MediaTek specified compressed format */
+#define V4L2_PIX_FMT_MTISP_NV12_UFBC v4l2_fourcc('1', '2', '8', 'F') /* Y/CbCr 4:2:0 8 bits compressed */
+#define V4L2_PIX_FMT_MTISP_NV21_UFBC v4l2_fourcc('2', '1', '8', 'F') /* Y/CrCb 4:2:0 8 bits compressed */
+#define V4L2_PIX_FMT_MTISP_NV12_10_UFBC v4l2_fourcc('1', '2', 'A', 'F') /* Y/CbCr 4:2:0 10 bits compressed */
+#define V4L2_PIX_FMT_MTISP_NV21_10_UFBC v4l2_fourcc('2', '1', 'A', 'F') /* Y/CrCb 4:2:0 10 bits compressed */
+#define V4L2_PIX_FMT_MTISP_NV12_12_UFBC v4l2_fourcc('1', '2', 'C', 'F') /* Y/CbCr 4:2:0 12 bits compressed */
+#define V4L2_PIX_FMT_MTISP_NV21_12_UFBC v4l2_fourcc('2', '1', 'C', 'F') /* Y/CrCb 4:2:0 12 bits compressed */
+#define V4L2_PIX_FMT_MTISP_BAYER8_UFBC v4l2_fourcc('M', 'B', '8', 'U') /* Raw 8 bits compressed */
+#define V4L2_PIX_FMT_MTISP_BAYER10_UFBC v4l2_fourcc('M', 'B', 'A', 'U') /* Raw 10 bits compressed */
+#define V4L2_PIX_FMT_MTISP_BAYER12_UFBC v4l2_fourcc('M', 'B', 'C', 'U') /* Raw 12 bits compressed */
+#define V4L2_PIX_FMT_MTISP_BAYER14_UFBC v4l2_fourcc('M', 'B', 'E', 'U') /* Raw 14 bits compressed */
+
+/* Vendor specific - MediaTek ISP parameters for firmware */
+#define V4L2_META_FMT_MTISP_3A    v4l2_fourcc('M', 'T', 'f', 'a') /* AE/AWB histogram */
+#define V4L2_META_FMT_MTISP_AF    v4l2_fourcc('M', 'T', 'f', 'f') /* AF histogram */
+#define V4L2_META_FMT_MTISP_LCS   v4l2_fourcc('M', 'T', 'f', 'c') /* Local contrast enhanced statistics */
+#define V4L2_META_FMT_MTISP_LMV   v4l2_fourcc('M', 'T', 'f', 'm') /* Local motion vector histogram */
+#define V4L2_META_FMT_MTISP_PARAMS v4l2_fourcc('M', 'T', 'f', 'p') /* ISP tuning parameters */
+
+/*
+ * struct mtk_cam_resource_sensor - sensor resoruces for format negotiation
+ *
+ */
+struct mtk_cam_resource_sensor {
+	struct v4l2_fract interval;
+	__u32 hblank;
+	__u32 vblank;
+	__u64 pixel_rate;
+	__u64 cust_pixel_rate;
+};
+
+/*
+ * struct mtk_cam_resource_raw - MTK camsys raw resoruces for format negotiation
+ *
+ * @feature: value of V4L2_CID_MTK_CAM_FEATURE the user want to check the
+ *		  resource with. If it is used in set CTRL, we will apply the value
+ *		  to V4L2_CID_MTK_CAM_FEATURE ctrl directly.
+ * @strategy: indicate the order of multiple raws, binning or DVFS to be selected
+ *	      when doing format negotiation of raw's source pads (output pads).
+ *	      Please pass MTK_CAM_RESOURCE_DEFAULT if you want camsys driver to
+ *	      determine it.
+ * @raw_max: indicate the max number of raw to be used for the raw pipeline.
+ *	     Please pass MTK_CAM_RESOURCE_DEFAULT if you want camsys driver to
+ *	     determine it.
+ * @raw_min: indicate the max number of raw to be used for the raw pipeline.
+ *	     Please pass MTK_CAM_RESOURCE_DEFAULT if you want camsys driver to
+ *	     determine it.
+ * @raw_used: The number of raw used. The used don't need to writ this failed,
+ *	      the driver always updates the field.
+ * @bin: indicate if the driver should enable the bining or not. The driver
+ *	 update the field depanding the hardware supporting status. Please pass
+ *	 MTK_CAM_RESOURCE_DEFAULT if you want camsys driver to determine it.
+ * @path_sel: indicate the user selected raw path. The driver
+ *	      update the field depanding the hardware supporting status. Please
+ *	      pass MTK_CAM_RESOURCE_DEFAULT if you want camsys driver to
+ *	      determine it.
+ * @pixel_mode: the pixel mode driver used in the raw pipeline. It is written by
+ *		driver only.
+ * @throughput: the throughput be used in the raw pipeline. It is written by
+ *		driver only.
+ *
+ */
+struct mtk_cam_resource_raw {
+	__s64	feature;
+	__u16	strategy;
+	__u8	raw_max;
+	__u8	raw_min;
+	__u8	raw_used;
+	__u8	bin;
+	__u8	path_sel;
+	__u8	pixel_mode;
+	__u64	throughput;
+};
+
+/*
+ * struct mtk_cam_resource - MTK camsys resoruces for format negotiation
+ *
+ * @sink_fmt: sink_fmt pad's format, it must be return by g_fmt or s_fmt
+ *		from driver.
+ * @sensor_res: senor information to calculate the required resource, it is
+ *		read-only and camsys driver will not change it.
+ * @raw_res: user hint and resource negotiation result.
+ * @status: resource negotiation status.
+ *
+ */
+struct mtk_cam_resource {
+	__u64 sink_fmt;
+	struct mtk_cam_resource_sensor sensor_res;
+	struct mtk_cam_resource_raw raw_res;
+	__u8 status;
+};
+
+/**
+ * struct mtk_cam_pde_info - PDE module information for raw
+ *
+ * @pdo_max_size: the max pdo size of pde sensor.
+ * @pdi_max_size: the max pdi size of pde sensor or max pd table size.
+ * @pd_table_offset: the offest of meta config for pd table content.
+ */
+struct mtk_cam_pde_info {
+	__u32 pdo_max_size;
+	__u32 pdi_max_size;
+	__u32 pd_table_offset;
+};
+#endif /* _MTKISP_CAMSYS_USER_H */
-- 
2.18.0

