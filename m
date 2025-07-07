Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13126AFB931
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6454D10E332;
	Mon,  7 Jul 2025 16:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="qbVfqFY5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50FD10E332
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=p8ly7oF3wY3svi7kAE9pak8dnHj/ipa3jtx+B3eJ+EE=; b=qbVfqFY5KmjT4Bmb0hMOj8w8lU
 +BqxWITtoDMD0j0fU0ZFuoNevU7Y/wRFaLorWfYs9JfBrY/qesPLbjNi2OgcfsyaPjx1VK2s6Z7ij
 9VErhST7UFzKmHooHc/tO/n1MJDVt8K0nQFxeYpqGPVS3VL6Ysix2qm11IgP3VWiCoYjz6NF3Dir9
 XR3P4yBMPLKxWK6rAmK/tM8GqRHzAWtDJuYWLje3A7nz+x3Kd5ckEQkBfoO6D3M3qn35gXvDyQiLF
 gJh0XcpIXIr4xd6eWDgOkmmBW/EcDLESbzYvV7eh5Q+e/5zpVDA22NdEVu8AkPRAZFYokyzvLVf8e
 nlQFRIPg==;
Received: from i53875bf5.versanet.de ([83.135.91.245]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uYp1w-0004yl-RI; Mon, 07 Jul 2025 18:49:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 11/13] arm64: dts: rockchip: add the dsi controller to rk3576
Date: Mon,  7 Jul 2025 18:49:04 +0200
Message-ID: <20250707164906.1445288-12-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RK3576 comes with one DSI2 controllers based on the same newer
Synopsis IP as the ones on the RK3588.

Add the necessary node for it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 87d518422a60..5e9c3dce5823 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1271,6 +1271,34 @@ sai6: sai@27d50000 {
 			status = "disabled";
 		};
 
+		dsi: dsi@27d80000 {
+			compatible = "rockchip,rk3576-mipi-dsi2";
+			reg = <0x0 0x27d80000 0x0 0x10000>;
+			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru PCLK_DSIHOST0>, <&cru CLK_DSIHOST0>;
+			clock-names = "pclk", "sys";
+			power-domains = <&power RK3576_PD_VO0>;
+			resets = <&cru SRST_P_DSIHOST0>;
+			reset-names = "apb";
+			phys = <&mipidcphy PHY_TYPE_DPHY>;
+			phy-names = "dcphy";
+			rockchip,grf = <&vo0_grf>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dsi_in: port@0 {
+					reg = <0>;
+				};
+
+				dsi_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		hdmi: hdmi@27da0000 {
 			compatible = "rockchip,rk3576-dw-hdmi-qp";
 			reg = <0x0 0x27da0000 0x0 0x20000>;
-- 
2.47.2

