Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C9A154B1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE7810EB40;
	Fri, 17 Jan 2025 16:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TOfT/hde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0584810EB40
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737132511;
 bh=chwved6+F4e8V86Eu0th416VVGnscEUzoZkPxQP7yrQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TOfT/hdefZ+yu5C8jsTKkivpVTcchZCbGtKERCDzKzp6rjodS4lDAgu+JMSPYublV
 aY/lbopcnD/pLNGokRTC3YP/6zW+CLYDnL7qS9J5m9nBlNFMzx6JxiC6/I4Z2puvIr
 w/axS6ux3GAl7pS6ROBHirgXmgxQ+U+41ggcocZW2S3I8VmYZ4Igb5b82QWBJozOEP
 oVFpyM9zpI/s1tH4uk0+/UiICDT7rGi0eEs/RitBY70nhXCtqdbcsow0kSdXbiFsr+
 7JO5sNiZrQ/Fz/pkDxun0V2GZ22ix2CsnHvHLPR+zSNL0WeKfKpF7gLfGBSnhLHu4h
 fLD40e7iyoNnw==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2276F17E1073;
 Fri, 17 Jan 2025 17:48:28 +0100 (CET)
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
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Johan Jonker <jbx6244@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: [PATCH v1 2/2] arm64: dts: rockchip: Add HDMI0 audio output on rock-5b
Date: Fri, 17 Jan 2025 11:46:58 -0500
Message-ID: <20250117164815.67253-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117164815.67253-1-detlev.casanova@collabora.com>
References: <20250117164815.67253-1-detlev.casanova@collabora.com>
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

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  1 +
 .../boot/dts/rockchip/rk3588-rock-5b.dts      | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index a337f3fb8377..fcd1c85e6ce8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1395,6 +1395,7 @@ hdmi0: hdmi@fde80000 {
 		reset-names = "ref", "hdp";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vo-grf = <&vo1_grf>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 
 		ports {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index c44d001da169..50e13216ff28 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -49,6 +49,21 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
+	hdmi0-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <128>;
+		simple-audio-card,name = "hdmi0";
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
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -318,6 +333,10 @@ i2s0_8ch_p0_0: endpoint {
 	};
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
 &package_thermal {
 	polling-delay = <1000>;
 
-- 
2.48.1

