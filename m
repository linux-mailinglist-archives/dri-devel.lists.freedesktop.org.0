Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03916BD8E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 10:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079E889F4A;
	Tue, 25 Feb 2020 09:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 109A56EA76
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:41:16 +0000 (UTC)
X-UUID: 715bc4b9216941a88e154c325204f587-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SYqjf55bgEilwKvR5E5iUnNYlLZi0fnyp+qvXPo+QZU=; 
 b=UlXGXTaryjo9Zr/L96T9UCjX4VdUBLj45xcMxo5jbSJ6dDUfd3I+x9a7q6LJgREwY4Dltqguodmmr+tTRBXQ8DePjqRlqnSwOy+sAL8YRKYljz0V1dSAO9qnEGizf58bXVmWmow28OYZsJNiAH7ARyZf9soToYLBSoU9cgqyOVQ=;
X-UUID: 715bc4b9216941a88e154c325204f587-20200225
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 319737610; Tue, 25 Feb 2020 17:41:12 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 25 Feb 2020 17:37:15 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 25 Feb 2020 17:39:50 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 4/7] dt-bindings: display: mediatek: dpi sample data in
 dual edge support
Date: Tue, 25 Feb 2020 17:40:54 +0800
Message-ID: <20200225094057.120144-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200225094057.120144-1-jitao.shi@mediatek.com>
References: <20200225094057.120144-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4B0FB546FF66D627201F8C17E97E65579B3C837BCC58C8EA2829E5A0F820878A2000:8
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

Add property "pclk-sample" to config the dpi sample on falling (0),
rising (1), both falling and rising (2).

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
index a7b1b8bfb65e..f362fff51437 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
@@ -20,6 +20,9 @@ Required properties:
 Optional properties:
 - pinctrl-names: Contain "gpiomode" and "dpimode".
   pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
+- pclk-sample: 0: sample in falling edge, 1: sample in rising edge, 2: sample
+  in both falling and rising edge.
+  pclk-sample see Documentation/devicetree/bindings/media/video-interfaces.txt.
 
 Example:
 
@@ -37,6 +40,7 @@ dpi0: dpi@1401d000 {
 
 	port {
 		dpi0_out: endpoint {
+			pclk-sample = 0;
 			remote-endpoint = <&hdmi0_in>;
 		};
 	};
-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
