Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C49B0728A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104D110E780;
	Wed, 16 Jul 2025 10:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="lHtS3x/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DE4510E77B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Pf
 96EL1fdLyOPgckgwexr7VHAXtwv685XpN6hfJsmNc=; b=lHtS3x/Kc95+Jei4n2
 d5KAele+qQIiFpsFIE37B7SildtLfC/HXjlJQ9TLCsNDrA8yMTz2Tw1tDh+eJgqR
 0Tg5VAC7tnnBHhID4W1695mWeA+UIjUdQk35Zf9zQWcxb18wgEfrZJupZUBgtf3p
 qF3ZAQWLbpgA7S1xflwyeJa2U=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wAH0s46eXdoG0BuFQ--.1985S9; 
 Wed, 16 Jul 2025 18:05:07 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, stephen@radxa.com,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 07/10] arm64: dts: rockchip: Add DP0 for rk3588
Date: Wed, 16 Jul 2025 18:04:34 +0800
Message-ID: <20250716100440.816351-8-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716100440.816351-1-andyshrk@163.com>
References: <20250716100440.816351-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAH0s46eXdoG0BuFQ--.1985S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyxJryUuw43JrWfGry5CFg_yoW8XFW5p3
 ZrCrZ3WrW8uF12q39xKw1ktrZ5Aan5CFZYkrnrK340kF1Sqr9rKryfKrnxA34qqr47XwsF
 vFs3try8KFsrAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8a9-UUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgWMXmh3cPPqbgABsc
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

From: Andy Yan <andy.yan@rock-chips.com>

The DP0 is compliant with the DisplayPort Specification
Version 1.4, and share the USBDP combo PHY0 with USB 3.1
HOST0 controller.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 51f11b9c414aa..4a54389c89d75 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1536,6 +1536,36 @@ dsi1_out: port@1 {
 		};
 	};
 
+	dp0: dp@fde50000 {
+		compatible = "rockchip,rk3588-dp";
+		reg = <0x0 0xfde50000 0x0 0x4000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru PCLK_DP0>, <&cru CLK_AUX16M_0>,
+			 <&cru CLK_DP0>, <&cru MCLK_I2S4_8CH_TX>,
+			 <&cru MCLK_SPDIF2_DP0>;
+		clock-names = "apb", "aux", "hdcp", "i2s", "spdif";
+		assigned-clocks = <&cru CLK_AUX16M_0>;
+		assigned-clock-rates = <16000000>;
+		resets = <&cru SRST_DP0>;
+		phys = <&usbdp_phy0 PHY_TYPE_DP>;
+		power-domains = <&power RK3588_PD_VO0>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp0_in: port@0 {
+				reg = <0>;
+			};
+
+			dp0_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hdmi0: hdmi@fde80000 {
 		compatible = "rockchip,rk3588-dw-hdmi-qp";
 		reg = <0x0 0xfde80000 0x0 0x20000>;
-- 
2.43.0

