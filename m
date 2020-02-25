Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2316B9FD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 07:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0CC6E9D8;
	Tue, 25 Feb 2020 06:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5714C6E8A0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 06:46:55 +0000 (UTC)
X-UUID: 6899bc803adf455eb33e7163a8c70a4e-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZT7Dd2Y1yKEa/ZFxOwKFSN23PW3YcbLcZR1d9hGkyN4=; 
 b=PDOVoogu4VlshOLgJKOetUKeEHItiTY1dwrGZBOm3VH0xjeuVdW5WFuKZR+7HSMsiA8BfYahjwYKBh51h5EofnVP+YphjUvaKSw0kNcd5KWCkGwsjdiTViqBRzOHeX/nZLGGgw+vpCk96+5ssFyGbkIj7dUBekCclof+k1Uwrqs=;
X-UUID: 6899bc803adf455eb33e7163a8c70a4e-20200225
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 565801886; Tue, 25 Feb 2020 14:46:47 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 25 Feb 2020 14:45:25 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 25 Feb 2020 14:45:26 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/4] dt-bindings: display: mediatek: update dpi supported
 chips
Date: Tue, 25 Feb 2020 14:46:35 +0800
Message-ID: <20200225064638.112282-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200225064638.112282-1-jitao.shi@mediatek.com>
References: <20200225064638.112282-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 36D434DF1AFD45B96C71B37245CDEFEE9D2EBB3A30CB89FBDF11EFC42E1CB94B2000:8
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add decriptions about supported chips, including MT2701 & MT8173 &
mt8183

1. Add more chips support. ex. MT2701 & MT8173 & MT8183
2. Add property "pinctrl-names" to swap pin mode between gpio and dpi mode. Set
   pin mode to gpio oupput-low to avoid leakage current when dpi disable.
3. Add property "pclk-sample" to config the dpi sample on falling (0),
   rising (1), both falling and rising (2).

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,dpi.txt         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
index b6a7e7397b8b..0dee4f7a227e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
@@ -7,6 +7,7 @@ output bus.
 
 Required properties:
 - compatible: "mediatek,<chip>-dpi"
+  the supported chips are mt2701 , mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -16,6 +17,11 @@ Required properties:
   Documentation/devicetree/bindings/graph.txt. This port should be connected
   to the input port of an attached HDMI or LVDS encoder chip.
 
+Optional properties:
+- pinctrl-names: Contain "gpiomode" and "dpimode".
+- pclk-sample: 0: sample in falling edge, 1: sample in rising edge, 2: sample
+  in both falling and rising edge.
+
 Example:
 
 dpi0: dpi@1401d000 {
@@ -26,6 +32,10 @@ dpi0: dpi@1401d000 {
 		 <&mmsys CLK_MM_DPI_ENGINE>,
 		 <&apmixedsys CLK_APMIXED_TVDPLL>;
 	clock-names = "pixel", "engine", "pll";
+	pclk-sample = 0;
+	pinctrl-names = "gpiomode", "dpimode";
+	pinctrl-0 = <&dpi_pin_gpio>;
+	pinctrl-1 = <&dpi_pin_func>;
 
 	port {
 		dpi0_out: endpoint {
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
