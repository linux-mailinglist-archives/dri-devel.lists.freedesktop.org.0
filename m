Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB07198E4D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 10:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C800C6E2CC;
	Tue, 31 Mar 2020 08:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1158A89CCB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:28:02 +0000 (UTC)
X-UUID: 9f5cff6902c54b979d8ed21b26fa32f1-20200331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=baAC/mjJyyxJyJropjMcUiSH9v9z0VL+7p1/Vb1I9C4=; 
 b=Fq9POf76tGniX09BR9UWOGHjUTmGf6RW+K0xPG8UqKm4iGZd8iRIJRR8FfV5kNVXiTnkHODeNWjClAjBEoOmqAQ0sG9bf6fg60OnjL+kw0KIb6BDhturfJnWw0/s0pRCO6Fc0l1jTBP+jo7VwgjPpn2zKM6IPvglR4mypd6jJAM=;
X-UUID: 9f5cff6902c54b979d8ed21b26fa32f1-20200331
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2133848969; Tue, 31 Mar 2020 16:27:57 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 31 Mar 2020 16:27:56 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 31 Mar 2020 16:27:54 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/4] dt-bindings: display: mediatek: get mipitx calibration
 data from nvmem
Date: Tue, 31 Mar 2020 16:27:23 +0800
Message-ID: <20200331082725.81048-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200331082725.81048-1-jitao.shi@mediatek.com>
References: <20200331082725.81048-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 40A7C3EAC7A8A315B0CB8199B3C5988B4A427A8601750DB27B13C587AA44873F2000:8
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

Add properties to get get mipitx calibration data.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index d78b6d6d8fab..8e4729de8c85 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -36,6 +36,9 @@ Required properties:
 Optional properties:
 - drive-strength-microamp: adjust driving current, should be 3000 ~ 6000. And
 						   the step is 200.
+- nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
+               unspecified default values shall be used.
+- nvmem-cell-names: Should be "calibration-data"
 
 Example:
 
@@ -47,6 +50,8 @@ mipi_tx0: mipi-dphy@10215000 {
 	#clock-cells = <0>;
 	#phy-cells = <0>;
 	drive-strength-microamp = <4600>;
+	nvmem-cells= <&mipi_tx_calibration>;
+	nvmem-cell-names = "calibration-data";
 };
 
 dsi0: dsi@1401b000 {
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
