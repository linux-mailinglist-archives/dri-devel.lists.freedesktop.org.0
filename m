Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8069F76B9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 09:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D6410ECC3;
	Thu, 19 Dec 2024 08:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="L9D+Y8ki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121157.qiye.163.com (mail-m121157.qiye.163.com
 [115.236.121.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE0210ECC2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 08:06:48 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 633f41ed;
 Thu, 19 Dec 2024 16:06:44 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 13/15] arm64: dts: rockchip: Add eDP0 node for RK3588
Date: Thu, 19 Dec 2024 16:06:02 +0800
Message-Id: <20241219080604.1423600-14-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219080604.1423600-1-damon.ding@rock-chips.com>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ01MTlYfQ0xCGhlITEMfHx5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
 NVSktLVUpCWQY+
X-HM-Tid: 0a93ddf4710f03a3kunm633f41ed
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBQ6Hxw6OTIPFBUfNTo*DC44
 ESpPFChVSlVKTEhPTkJOTUtNTEtIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKT09JNwY+
DKIM-Signature: a=rsa-sha256;
 b=L9D+Y8kiM4sikmaXMyYtEVu/yyVRNHVUfYYDC4JgGXGRomKqNF0uG3KLhMA9M4dzyFFmcQMwAfsfpDzDyGmH7bNCbDy15fgLW7msY7P55mY6d65BbN5ycInVQr3JO7IuShM2ZT7meHKEKCKOcSuk5X5QHSODq9fVs8pbBXmO0YE=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=gE9wnLTUi9Mb/z4GkPnEix1WrRU2Pn9gOcKQqebUSiQ=;
 h=date:mime-version:subject:message-id:from;
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

Add support for the eDP0 output on RK3588 SoC.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Remove currently unsupported property '#sound-dai-cells'
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 7e125897b0cd..2a7b8e6074b8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1411,6 +1411,34 @@ hdmi0_out: port@1 {
 		};
 	};
 
+	edp0: edp@fdec0000 {
+		compatible = "rockchip,rk3588-edp";
+		reg = <0x0 0xfdec0000 0x0 0x1000>;
+		clocks = <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>, <&cru CLK_EDP0_200M>;
+		clock-names = "dp", "pclk", "spdif";
+		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
+		phys = <&hdptxphy0>;
+		phy-names = "dp";
+		power-domains = <&power RK3588_PD_VO1>;
+		resets = <&cru SRST_EDP0_24M>, <&cru SRST_P_EDP0>;
+		reset-names = "dp", "apb";
+		rockchip,grf = <&vo1_grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			edp0_in: port@0 {
+				reg = <0>;
+			};
+
+			edp0_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	qos_gpu_m0: qos@fdf35000 {
 		compatible = "rockchip,rk3588-qos", "syscon";
 		reg = <0x0 0xfdf35000 0x0 0x20>;
-- 
2.34.1

