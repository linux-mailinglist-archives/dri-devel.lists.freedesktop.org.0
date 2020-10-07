Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A68128564F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 03:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF4B6E852;
	Wed,  7 Oct 2020 01:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA706E850
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 01:25:31 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BFFF42BF;
 Wed,  7 Oct 2020 03:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602033929;
 bh=LbtvhHlomJlMeKjRBwGt8cMfd/llRaqA3y9dgqVwxtQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SzO4CFJHmhchAtVZrVns7TnWA6BSism+luShSSJp2xdfgjuSQ3qG9gaiZ+NUiU0hg
 c6Ur6Kar1bmMvvaowYwsgb47l8CkH7O70D5AZ2nNlGx302ittKfckp/mp7bTxXfWJa
 87XBqO5pOceivnNLKri1XzqSpmruvC/JnNdT1HOc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/7] ARM: dts: imx: Remove unneeded LCDIF disp_axi clock
Date: Wed,  7 Oct 2020 04:24:37 +0300
Message-Id: <20201007012438.27970-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LCDIF disp_axi clock is not mandatory in the DT binding and not
required by the driver. Remove it when it points to a dummy clock.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/arm/boot/dts/imx6sl.dtsi  | 5 ++---
 arch/arm/boot/dts/imx6sll.dtsi | 5 ++---
 arch/arm/boot/dts/imx6ul.dtsi  | 5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 1e506ffbcecc..27d8061e06af 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -773,9 +773,8 @@ lcdif: lcdif@20f8000 {
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
-					 <&clks IMX6SL_CLK_LCDIF_AXI>,
-					 <&clks IMX6SL_CLK_DUMMY>;
-				clock-names = "pix", "axi", "disp_axi";
+					 <&clks IMX6SL_CLK_LCDIF_AXI>;
+				clock-names = "pix", "axi";
 				status = "disabled";
 				power-domains = <&pd_disp>;
 			};
diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
index 81137ba427a1..80c7ef5af435 100644
--- a/arch/arm/boot/dts/imx6sll.dtsi
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -648,9 +648,8 @@ lcdif: lcd-controller@20f8000 {
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-					 <&clks IMX6SLL_CLK_LCDIF_APB>,
-					 <&clks IMX6SLL_CLK_DUMMY>;
-				clock-names = "pix", "axi", "disp_axi";
+					 <&clks IMX6SLL_CLK_LCDIF_APB>;
+				clock-names = "pix", "axi";
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 776493923474..6ecdbf9f63c6 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -1007,9 +1007,8 @@ lcdif: lcdif@21c8000 {
 				reg = <0x021c8000 0x4000>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6UL_CLK_LCDIF_PIX>,
-					 <&clks IMX6UL_CLK_LCDIF_APB>,
-					 <&clks IMX6UL_CLK_DUMMY>;
-				clock-names = "pix", "axi", "disp_axi";
+					 <&clks IMX6UL_CLK_LCDIF_APB>;
+				clock-names = "pix", "axi";
 				status = "disabled";
 			};
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
