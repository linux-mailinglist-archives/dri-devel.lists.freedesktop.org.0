Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A7324321B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 03:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F066E351;
	Thu, 13 Aug 2020 01:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828C76E354
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 01:29:38 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 841661872;
 Thu, 13 Aug 2020 03:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597282176;
 bh=WCYq+um9ir1mx1ChPeJdr5YnNRG9Q/YllI/SmChkUQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cJb/nD7VEGYcU2B+8NR6z2ymtMdYa7wxZ4IzorZmEnT4XDGGlEBn0bjnUR72k8O1z
 duFggTukibr438WmDjUCLs/Ohwy1qny1EJqstT06VKZed4lqP4ottDYccdbK/xVgQo
 rT1mpVMWy5hZN2BCfqXL1gSk5DQ10M4sNJQiqqjE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] ARM: dts: imx: Remove unneeded LCDIF disp_axi clock
Date: Thu, 13 Aug 2020 04:29:09 +0300
Message-Id: <20200813012910.13576-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
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
---
 arch/arm/boot/dts/imx6sl.dtsi  | 5 ++---
 arch/arm/boot/dts/imx6sll.dtsi | 5 ++---
 arch/arm/boot/dts/imx6ul.dtsi  | 5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index deeb647ffc3f..a4d74216c9f4 100644
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
index c51072bb43ba..55775318559b 100644
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
index b16cce1680a9..35df39cc85a4 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -982,9 +982,8 @@ lcdif: lcdif@21c8000 {
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
