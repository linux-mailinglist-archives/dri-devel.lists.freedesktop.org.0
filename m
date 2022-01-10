Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA448940A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7584A12AD8E;
	Mon, 10 Jan 2022 08:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C006A12AD87
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:46:51 +0000 (UTC)
X-UUID: 8c7841142e584bf9a9938c54229f31db-20220110
X-UUID: 8c7841142e584bf9a9938c54229f31db-20220110
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 116225925; Mon, 10 Jan 2022 16:46:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 10 Jan 2022 16:46:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 16:46:46 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v11 02/22] dt-bindings: mediatek: add vdosys1 MERGE property
 for mt8195
Date: Mon, 10 Jan 2022 16:46:25 +0800
Message-ID: <20220110084645.31191-3-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220110084645.31191-1-nancy.lin@mediatek.com>
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
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

MT8195 vdosys1 merge1 to merge4 have HW mute function.
Add MERGE additional mute property description.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Acked-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,merge.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 28be8ffeb429..f5b1e632bcd5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -61,6 +61,10 @@ properties:
       command to SMI to speed up the data rate.
     type: boolean
 
+  mediatek,merge-mute:
+    description: Support mute function. Mute the content of merge output.
+    type: boolean
+
   mediatek,gce-client-reg:
     description:
       The register of client driver can be configured by gce with 4 arguments
-- 
2.18.0

