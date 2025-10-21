Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004FFBF502B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B47B10E580;
	Tue, 21 Oct 2025 07:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="iUrZTOZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6F310E584
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=445YquTwMCYGWvvFlDmuQ2qGeWs3mzkw8t3wT+6a8rU=; b=iUrZTOZzaLL3fyZVeCHJaxvjeC
 BerfNIWSOthofcI0H1WxeVGUXBNntT85YiRWop7D9KbYjW3zCCM31xEbQVa4P1AEB+VjLgV6TI1Bl
 SX9HqLLAr2mkVBbAGsaEqRpVz182SdMmrkcdp5bq17JU4g6EdLu3xvOho7tjBmtbP2Uvh48xnJKcZ
 TMU4ITOKae999SatR0zfGZFmdJJVDQ1hAgCT4HZuem7v5c+z8OLurowI7x7FrIiGSEwWIQpFCYcPa
 Iv4Pc1StT+dtczdgEPmKCN9U3TCl3gyW+Zj+k+yFweP4WLdB/y1e4V9v74vrOHwGQxLnqXH9JfwOa
 Z7tREdIA==;
Received: from [212.111.240.218] (helo=phil.guestnet.ukdd.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vB71P-0000uy-Pz; Tue, 21 Oct 2025 09:43:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 8/9] arm64: dts: rockchip: Enable HDMI output on
 RK3368-Lion-Haikou
Date: Tue, 21 Oct 2025 09:42:53 +0200
Message-ID: <20251021074254.87065-9-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Enable the VOP and HDMI controller on the Lion-Haikou board.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../boot/dts/rockchip/rk3368-lion-haikou.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
index abd1af97456a..a8eb4e9c2778 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
@@ -58,6 +58,16 @@ vcc5v0_otg: regulator-vcc5v0-otg {
 	};
 };
 
+&display_subsystem {
+	status = "okay";
+};
+
+&hdmi {
+	avdd-0v9-supply = <&vdd10_video>;
+	avdd-1v8-supply = <&vcc18_video>;
+	status = "okay";
+};
+
 &i2c_lvds_blc {
 	eeprom: eeprom@50 {
 		compatible = "atmel,24c01";
@@ -101,6 +111,14 @@ &uart1 {
 	status = "disabled";
 };
 
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
 &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&haikou_pin_hog>;
-- 
2.47.2

