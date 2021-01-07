Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6642ECBEA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674F16E40B;
	Thu,  7 Jan 2021 08:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C90D89824
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 03:11:31 +0000 (UTC)
X-UUID: 2ff67c3ec6a8448dbe331a53cfeb546e-20210107
X-UUID: 2ff67c3ec6a8448dbe331a53cfeb546e-20210107
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 976730749; Thu, 07 Jan 2021 11:11:27 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 11:11:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 11:11:24 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v9,
 01/11] dt-bindings: mediatek: add rdma-fifo-size description for
 mt8183 display
Date: Thu, 7 Jan 2021 11:11:11 +0800
Message-ID: <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

rdma fifo size may be different even in same SOC, add this
property to the corresponding rdma

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 33977e1..b07881e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -66,6 +66,14 @@ Required properties (DMA function blocks):
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
 
+Optional properties (RDMA function blocks):
+- mediatek,rdma-fifo-size: rdma fifo size may be different even in same SOC, add this
+  property to the corresponding rdma
+  the value is the Max value which defined in hardware data sheet.
+  mediatek,rdma-fifo-size of mt8173-rdma0 is 8K
+  mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
+  mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
+
 Examples:
 
 mmsys: clock-controller@14000000 {
@@ -103,6 +111,7 @@ rdma0: rdma@1400e000 {
 	clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 	mediatek,larb = <&larb0>;
+	mediatek,rdma-fifosize = <8192>;
 };
 
 rdma1: rdma@1400f000 {
-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
