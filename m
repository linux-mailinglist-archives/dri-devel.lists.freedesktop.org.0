Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9EAFB946
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DA910E4F1;
	Mon,  7 Jul 2025 16:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="IR1Yo93b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829B410E4F1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=QVv9VN6mF2jxRpVKoSC9NQ/7rqOozAMNWU4uby4GCM4=; b=IR1Yo93bPSVYTBpRB2sx+wIFNR
 cKsnu3dqCuXZdo7vsfK/S4xBckIlpnz6iKMzQZUpOj8Yh7EpZJabNQzbcetjIkLKJTKvjbOFrnbCY
 GZf64RuNZwUsQUWDMZuRX2Kvh3A/yrf/GbSm7B9MLIld5KNkyjw6Gk1g1tjP8ivysdH6mPk2SPr3j
 zJCi3NHDSrHV23YPISx13kFZK7TZUejR6eBIYn+XYtaJOk+aPt3uEHdzpfiVd+5Svc05Y36sK/Mfg
 M/u+tfOMCl+vDAY3kHRVPAqIGp+Y2WV9RtIxxnuEsRSKYkG3vYiqLz2LpQhGo9zHC/CwrGFmLO/co
 MM+Yx4Uw==;
Received: from i53875bf5.versanet.de ([83.135.91.245]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uYp1x-0004yl-H7; Mon, 07 Jul 2025 18:49:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 12/13] arm64: dts: rockchip: add vcc3v3-lcd-s0 regulator to
 roc-rk3576-pc
Date: Mon,  7 Jul 2025 18:49:05 +0200
Message-ID: <20250707164906.1445288-13-heiko@sntech.de>
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

This fixed regulator is described by the schematics as being part of the
baseboard and its output supply is then routed to the 30pin DSI connector
on the board.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
index d4e437ea6cd8..d0ab1d1e0e11 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
@@ -107,6 +107,18 @@ vcc1v8_ufs_vccq2_s0: regulator-vcc1v8-ufs-vccq2-s0 {
 		vin-supply = <&vcc_1v8_s3>;
 	};
 
+	vcc3v3_lcd_s0: regulator-vcc3v3-lcd-s0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_pwren_h>;
+		regulator-name = "vcc3v3-lcd-s0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
 	vcc3v3_pcie: regulator-vcc3v3-pcie {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -715,6 +727,10 @@ rtc_int_l: rtc-int-l {
 	};
 
 	power {
+		lcd_pwren_h: lcd-pwren-h {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		vcc5vd_en: vcc5vd-en {
 			rockchip,pins = <2 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
-- 
2.47.2

