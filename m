Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFAEAFB93F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AB110E4F0;
	Mon,  7 Jul 2025 16:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="MFziBjin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA8510E4F0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=/5JocKyr7mQoWxvg7c49KOKaCeM0cjCCuF/Xw82PoCQ=; b=MFziBjin8bd3qnt4c18F6nXcA0
 7oyZ9OaMi3u9igX/SPXhSqHsh5Pv7CK9XleY7EYD5zoi71rLQEQWCiJ5wbssnRR2UVJ5e8N+JAAE2
 dW61LUsQa1EsYCJPTKkTUql87Uz8GPPamGDdogW6fMvs6TdRZ/4e5Aes0YtBFn2TO/1nhFrwIjko2
 uD+lF8TrwhNl42OopT3F2gIoKXtpuuFCE2I2YZq7BPomSIbBgt/4ijI7eAmUuhJ68axs0///sGB5W
 M9eQQ9fLK9k62XDBaUqrfPquKhFrHAGYt3pskwj3s4eAmyRwPGo2oKkD8vsHb5H106kuhIim5oh4K
 4EkWVYlg==;
Received: from i53875bf5.versanet.de ([83.135.91.245]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uYp1w-0004yl-55; Mon, 07 Jul 2025 18:49:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 10/13] arm64: dts: rockchip: add mipi-dcphy to rk3576
Date: Mon,  7 Jul 2025 18:49:03 +0200
Message-ID: <20250707164906.1445288-11-heiko@sntech.de>
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

Add the MIPI-DC-phy node to the RK3576, that will be used by the one
DSI2 controller and hopefully in some future also for camera input.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 8b2161b83059..87d518422a60 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -822,6 +822,12 @@ hdptxphy_grf: syscon@26032000 {
 			reg = <0x0 0x26032000 0x0 0x100>;
 		};
 
+		mipidcphy_grf: syscon@26034000 {
+			compatible = "rockchip,rk3576-dcphy-grf", "syscon";
+			reg = <0x0 0x26034000 0x0 0x2000>;
+			clocks = <&cru PCLK_PMUPHY_ROOT>;
+		};
+
 		vo1_grf: syscon@26036000 {
 			compatible = "rockchip,rk3576-vo1-grf", "syscon";
 			reg = <0x0 0x26036000 0x0 0x100>;
@@ -2538,6 +2544,22 @@ uart11: serial@2afd0000 {
 			status = "disabled";
 		};
 
+		mipidcphy: phy@2b020000 {
+			compatible = "rockchip,rk3576-mipi-dcphy";
+			reg = <0x0 0x2b020000 0x0 0x10000>;
+			clocks = <&cru PCLK_MIPI_DCPHY>,
+				 <&cru CLK_PHY_REF_SRC>;
+			clock-names = "pclk", "ref";
+			resets = <&cru SRST_M_MIPI_DCPHY>,
+				 <&cru SRST_P_MIPI_DCPHY>,
+				 <&cru SRST_P_DCPHY_GRF>,
+				 <&cru SRST_S_MIPI_DCPHY>;
+			reset-names = "m_phy", "apb", "grf", "s_phy";
+			rockchip,grf = <&mipidcphy_grf>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		combphy0_ps: phy@2b050000 {
 			compatible = "rockchip,rk3576-naneng-combphy";
 			reg = <0x0 0x2b050000 0x0 0x100>;
-- 
2.47.2

