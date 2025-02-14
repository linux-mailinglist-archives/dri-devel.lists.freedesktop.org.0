Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A6FA36377
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6F210ED15;
	Fri, 14 Feb 2025 16:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="F7wEv5iI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AC710ED11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739551635;
 bh=SrFZdZudr7RArsBjh8BhpE0G7d7aPvrz97c6D+4TCUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F7wEv5iIWcQpuhRifPwkGwnbfl8wruNabVEmDdQCoHSuC0KvnNTVygl8AsOq87wK3
 8hyfaGFgzXMsvmZ577HHmNYrbijTecCApgQQOpXXQimv6jj3AoIr/96B5z96iJMKDB
 cDjpFuaZVOUeW04qX1kvFnRCUPLIUwHPUn81rL+BPgIiM8CHJh2aTRI0rxjD1V3iH8
 XndAyODRyDpOUzJV6z+xTm81SYnkI/Mt/fWcGoQrwipNdXnsVImh3iKluUIzWdZz5g
 zr2RjG5XhixXpMmvxf9AZfgODjfH3OG6zRBoO+H3YVz6/VoV2TXbPdSYcBhAQKoTsD
 mlBZs7rx9R7Nw==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D4C717E0B59;
 Fri, 14 Feb 2025 17:47:12 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Niklas Cassel <cassel@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 FUKAUMI Naoki <naoki@radxa.com>, Johan Jonker <jbx6244@gmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH RESEND v6 2/3] arm64: dts: rockchip: Add HDMI0 audio output
 for rk3588 SoC
Date: Fri, 14 Feb 2025 11:44:01 -0500
Message-ID: <20250214164528.534278-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214164528.534278-1-detlev.casanova@collabora.com>
References: <20250214164528.534278-1-detlev.casanova@collabora.com>
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

Use the simple-audio-card driver with the hdmi0 QP node as CODEC and
the i2s5 device as CPU.

The simple-audio-card,mclk-fs value is set to 128 as it is done in
the downstream driver.

The #sound-dai-cells value is set to 0 in the hdmi0 node so that it can be
used as an audio codec node.

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger Haikou
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce72..f9f888dedd8f0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -382,6 +382,22 @@ scmi_reset: protocol@16 {
 		};
 	};
 
+	hdmi0_sound: hdmi0-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <128>;
+		simple-audio-card,name = "hdmi0";
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi0>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s5_8ch>;
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_partition0>;
@@ -1394,6 +1410,7 @@ hdmi0: hdmi@fde80000 {
 		reset-names = "ref", "hdp";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vo-grf = <&vo1_grf>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 
 		ports {
-- 
2.48.1

