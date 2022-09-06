Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88A5AF312
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5289110E71B;
	Tue,  6 Sep 2022 17:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA6910E0D7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:48:34 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1278624b7c4so11781229fac.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sWRT5BEhVQS6Pr9dXQ62RZ1oRnXZDfj0TarvCCPaFKc=;
 b=bWRIf7+vrCgw7Hi6rPLpo976LR+CnntWyAQ933h2ln/uxNTYxyDX9wQI1ba1Hu4vRC
 01aflH0cSU1gbCItvjxMIp231+l8//1Itmew0zbTVulu7ibsxVGdyJPan03HhRqTtRa9
 RjZl+gPqGgl5IUgvv4tUw7s9btr8heTMuJabPKosT0EPs6QGpgq7TdXKXeGzswMvv+lL
 RAf2o3B8062JS4tmREybuT24yBb7hOKGiZZFfuuirENqsyUdsQqVA2has3YTlK7AyD6H
 ZefnhdccvYKnONb2W47HUkOGfWpnXooxSzJwHADw4F7iMoYH7wLSYcHUldEI/E8b8Lok
 qSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sWRT5BEhVQS6Pr9dXQ62RZ1oRnXZDfj0TarvCCPaFKc=;
 b=JcmzCpSKQHU7Kgj16b9+lz3zZ/d0T+/xrkq1y6Zi8b69zl1myXJzWqEv07wMOEKhSZ
 H6nPEuRkGEdMZWbQlbjGmqLr9c81xMU1mxlwsjX3Ojc52QrxbaWnkwLG1bofakOLZTlS
 XySP/EXc83rer+M1keAsSC7fZ/HANWBFmjPXQT25lvrbahCcGNrWBnXcOkJtvU+Y4edr
 vcsdhRjXh3EnhetOCYywqHVyuwoUIvw1bkjpgwgq/qtfkP9JFrY64Ds1dXcp5dJoINCB
 LX++jxnjmmEx5NpdeYjNK0u9nTlmcKuId+zJpwjhan4GU8kqmkXr3NyphLqS86SiuN32
 uLqQ==
X-Gm-Message-State: ACgBeo1DoebbWjwDNjhMgIOjRVSN2wrw5rKo220K+vIilrrQW2JY5Psr
 DiRDhIY5bROAhwSbhbtMvpU=
X-Google-Smtp-Source: AA6agR54mQEhVuh4IwsAy1uuYpGPrkNC/wN76hmiGBP+wIhQiytZlMxIv3W0PDUpIqJw2LEFJ/vhzg==
X-Received: by 2002:aca:6546:0:b0:343:4701:7e13 with SMTP id
 j6-20020aca6546000000b0034347017e13mr9978759oiw.12.1662486513930; 
 Tue, 06 Sep 2022 10:48:33 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 o186-20020aca41c3000000b00344afa2b08bsm5568065oia.26.2022.09.06.10.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:48:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH v2 5/5] arm64: dts: rockchip: Add DSI and DSI-DPHY nodes to
 rk356x
Date: Tue,  6 Sep 2022 12:48:23 -0500
Message-Id: <20220906174823.28561-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906174823.28561-1-macroalpha82@gmail.com>
References: <20220906174823.28561-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, s.hauer@pengutronix.de,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, pgwipeout@gmail.com, linux-phy@lists.infradead.org,
 cl@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

This adds the DSI controller nodes and DSI-DPHY controller nodes to the
rk356x device tree.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 319981c3e9f7..d150568fde82 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -699,6 +699,54 @@ vop_mmu: iommu@fe043e00 {
 		status = "disabled";
 	};
 
+	dsi0: dsi@fe060000 {
+		compatible = "rockchip,rk3568-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0x00 0xfe060000 0x00 0x10000>;
+		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "pclk", "hclk";
+		clocks = <&cru PCLK_DSITX_0>, <&cru HCLK_VO>;
+		phy-names = "dphy";
+		phys = <&mipi_dphy0>;
+		power-domains = <&power RK3568_PD_VO>;
+		reset-names = "apb";
+		resets = <&cru SRST_P_DSITX_0>;
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+		};
+	};
+
+	dsi1: dsi@fe070000 {
+		compatible = "rockchip,rk3568-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0x0 0xfe070000 0x0 0x10000>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "pclk", "hclk";
+		clocks = <&cru PCLK_DSITX_1>, <&cru HCLK_VO>;
+		phy-names = "dphy";
+		phys = <&mipi_dphy1>;
+		power-domains = <&power RK3568_PD_VO>;
+		reset-names = "apb";
+		resets = <&cru SRST_P_DSITX_1>;
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+		};
+	};
+
 	hdmi: hdmi@fe0a0000 {
 		compatible = "rockchip,rk3568-dw-hdmi";
 		reg = <0x0 0xfe0a0000 0x0 0x20000>;
@@ -1594,6 +1642,30 @@ combphy2: phy@fe840000 {
 		status = "disabled";
 	};
 
+	mipi_dphy0: mipi-dphy@fe850000 {
+		compatible = "rockchip,rk3568-dsi-dphy";
+		reg = <0x0 0xfe850000 0x0 0x10000>;
+		clock-names = "ref", "pclk";
+		clocks = <&pmucru CLK_MIPIDSIPHY0_REF>, <&cru PCLK_MIPIDSIPHY0>;
+		#phy-cells = <0>;
+		power-domains = <&power RK3568_PD_VO>;
+		reset-names = "apb";
+		resets = <&cru SRST_P_MIPIDSIPHY0>;
+		status = "disabled";
+	};
+
+	mipi_dphy1: mipi-dphy@fe860000 {
+		compatible = "rockchip,rk3568-dsi-dphy";
+		reg = <0x0 0xfe860000 0x0 0x10000>;
+		clock-names = "ref", "pclk";
+		clocks = <&pmucru CLK_MIPIDSIPHY1_REF>, <&cru PCLK_MIPIDSIPHY1>;
+		#phy-cells = <0>;
+		power-domains = <&power RK3568_PD_VO>;
+		reset-names = "apb";
+		resets = <&cru SRST_P_MIPIDSIPHY1>;
+		status = "disabled";
+	};
+
 	usb2phy0: usb2phy@fe8a0000 {
 		compatible = "rockchip,rk3568-usb2phy";
 		reg = <0x0 0xfe8a0000 0x0 0x10000>;
-- 
2.25.1

