Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C039FC8F9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 07:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118A810E75C;
	Thu, 26 Dec 2024 06:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="kTKgnoFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m12790.qiye.163.com (mail-m12790.qiye.163.com
 [115.236.127.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6127910E756
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 06:34:01 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6dc511bb;
 Thu, 26 Dec 2024 14:33:57 +0800 (GMT+08:00)
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
Subject: [PATCH v4 16/17] arm64: dts: rockchip: Add eDP0 node for RK3588
Date: Thu, 26 Dec 2024 14:33:12 +0800
Message-Id: <20241226063313.3267515-17-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxCT1YYGR5JTU1CSk9PGkNWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
 NVSktLVUpCWQY+
X-HM-Tid: 0a9401ac01f103a3kunm6dc511bb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mxw6MAw*NTINDEwzGThNKh80
 TykaFBpVSlVKTEhOSkJPQ0hCSkpPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKT0xONwY+
DKIM-Signature: a=rsa-sha256;
 b=kTKgnoFfND/lsaDs1icfudhLhbgqSrKfY5YMVKitDDftWa9ZyCL6m86G8blhuTDnMRGkEHuhcrr9wAImTSgUmtcVd/bi96orEF+CtZNpO2Mio3fTYhLlCgXE34ojVCwa8BSaSpuEA3KQELUFQYN6TR8IQvvksIaP6LPqJZgyAfc=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=gYoWziFH9cpuOH0sbLkObIxPqDNFlUWa43MdtNH76Ug=;
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

Changes in v4:
- Remove currently unsupported clock 'spdif'
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 7e125897b0cd..7ab460c28c51 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1411,6 +1411,34 @@ hdmi0_out: port@1 {
 		};
 	};
 
+	edp0: edp@fdec0000 {
+		compatible = "rockchip,rk3588-edp";
+		reg = <0x0 0xfdec0000 0x0 0x1000>;
+		clocks = <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>;
+		clock-names = "dp", "pclk";
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

