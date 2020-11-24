Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD812C2647
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9B56E420;
	Tue, 24 Nov 2020 12:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078B86E42A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:48:16 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmB12123818;
 Tue, 24 Nov 2020 06:48:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222091;
 bh=aUnABo2a7OoT1MUWvwPCAEBSC038DHRmwx+gB00Y08U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=jaSXzQUByRntpX2jA6Ow9e5iOYryyldublFC4t3fg5onINfvBcottN9PC0Eq5x0Wh
 pcUM4FKpD2QkLSUUvaSUVDHeMGukKLUYC4G2p5DNjhnIubS3bB6G++mkxy9cf7FjOo
 dxpMYP4gB/PH0AsSVneYTpG5eCQyYwjj16ZZiQVo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmBXE047351
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:48:11 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:11 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpk040922;
 Tue, 24 Nov 2020 06:48:09 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 57/80] ARM: dts: omap5: add address-cells & size-cells to
 dsi
Date: Tue, 24 Nov 2020 14:45:15 +0200
Message-ID: <20201124124538.660710-58-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add address-cells & size-cells to DSI nodes so that board files do not
need to define them.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 2bf2e5839a7f..e6f6947965ef 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -517,6 +517,9 @@ dsi1: encoder@0 {
 						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
 							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
 						clock-names = "fck", "sys_clk";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
 					};
 				};
 
@@ -549,6 +552,9 @@ dsi2: encoder@0 {
 						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
 							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
 						clock-names = "fck", "sys_clk";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
 					};
 				};
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
