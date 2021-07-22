Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3170A3D211D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0226C6EA0E;
	Thu, 22 Jul 2021 09:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C4D6E9D8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:45:57 +0000 (UTC)
X-UUID: bf153e58d2d64c86bbceafca022adefe-20210722
X-UUID: bf153e58d2d64c86bbceafca022adefe-20210722
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1826774129; Thu, 22 Jul 2021 17:45:55 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:53 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v2 05/14] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
Date: Thu, 22 Jul 2021 17:45:42 +0800
Message-ID: <20210722094551.15255-6-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722094551.15255-1-nancy.lin@mediatek.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vdosys1 reset control bit for MT8195 platform.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 include/dt-bindings/reset/mt8195-resets.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
index 7ec27a64afc7..e024b2b6a3a7 100644
--- a/include/dt-bindings/reset/mt8195-resets.h
+++ b/include/dt-bindings/reset/mt8195-resets.h
@@ -26,4 +26,16 @@
 
 #define MT8195_TOPRGU_SW_RST_NUM               16
 
+/* VDOSYS1 */
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC 25
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC 26
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC 27
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC 28
+#define MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC 29
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC 51
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC 52
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC 53
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC 54
+#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC 55
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
-- 
2.18.0

