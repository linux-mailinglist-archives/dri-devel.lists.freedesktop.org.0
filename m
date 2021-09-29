Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A941C0E0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 10:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724416EA0D;
	Wed, 29 Sep 2021 08:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E986EA0D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:43:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 475103201805;
 Wed, 29 Sep 2021 04:43:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Sep 2021 04:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Znyc1I1rIaQbi
 jogTNSsg8EHL+eLhYsxmH+dwycnc84=; b=e7CemOtcLwux+XJwtoGM7KaaNcw7u
 9NRETaRtoKRoLWLuUV7RVlj3sQxyPvl2c4cjYoZncRsegYmI9iatJRPoW2VXImmf
 zmdt86YActXTgkGf6ZOZhTm7hJlSnSKL8EDDB2ZIzT+1YkRD4NVJxNAOPZdE9vV8
 Eelbh192sfB/4HFiozuty2zIhh8/WVue/uwuWxyL/cYCsTP1uvBC56/2Hkyyh/Ih
 whGFZtlmK33kS1pw54U3M9rcfPfHLRUE8RkcQboLbbn+j+Pmaqvmix02CHry38TC
 NPuIkOObY8ULFire0iT1e4Qs2u9TBYFRavDUPihJoCsAg4JyA8rphyCBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Znyc1I1rIaQbijogTNSsg8EHL+eLhYsxmH+dwycnc84=; b=KWflr6Zk
 +KbEc5VeuXTansAmgUdSc4KKscNEoz9nWEmEVRZd9nyACxI/cso2MFAP5h8WhMb4
 YAK53qXLdnCm5Y2NTaSC4T/qsjbHe8BkQdNYRyK6rn7vZjHVGXLh6RcXeYf+aABw
 hpYnRnHN/lyPuUYpOPnYUoV3RphrxICAq5DcAe/rdBNwOhAgZ7BQc2X5UR8/dxdL
 qRj6e+mIapEJuNzSV7BQkbn6LWKgewF+0nIQBNPbu8V1QEqnzp0glPO2DA3gio4q
 i7BRvK/mUlfBgTz1WFdASM2X0Jvv8y3LKCyBcHyH9+NBUDyk9IVA0FDvqtBUZrXE
 2O3LVzO2usQltw==
X-ME-Sender: <xms:FidUYZuvz65Mee0eiT2mLK7LbXDewa9m5ojNWpAtS6d3iOvnVU2E9w>
 <xme:FidUYScjDZsrLFURAMi4XMIumHyFepYRsZO1myo1yThx5j4-ft8hf6Q7KINvSBZfK
 j26GiB0aG4XvUUnd50>
X-ME-Received: <xmr:FidUYcxZgQPHjGNBdcB0S67aFlTQ33dRiwIHLn6HuMVLl-mW_Fq_gvG3DIJhSOhQbw1KgjWGRKs2TYZqh2x3M8diXJRPOgqf7CZ_YUGt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FidUYQPws6kEat0dSgm_QvrjX1WXBDyKL6EaTZSJ8jbeB5QzSttpSA>
 <xmx:FidUYZ-nRwQKkvYKsrKVvWMmqu0n5K-Q16FshXzv7pkYpB3zuQwZuQ>
 <xmx:FidUYQXVlRzmi_VgfFh4uxKG4OGZFuVUuDwhSxotq_S1BkxByNv7bA>
 <xmx:FidUYVRNqk5GFNwbwwYxQHVqrZwGcN470uVl4HV2p8_i4xI2-kUoQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 04:43:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 7/7] [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link
 on the Cubieboard
Date: Wed, 29 Sep 2021 10:42:34 +0200
Message-Id: <20210929084234.1271915-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929084234.1271915-1-maxime@cerno.tech>
References: <20210929084234.1271915-1-maxime@cerno.tech>
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

For the sake of the example, let's enable an LVDS Dual-Link display on a
Cubieboard.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts | 69 +++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
index e35e6990c4b2..b10d387385d9 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
@@ -85,6 +85,49 @@ led-1 {
 			gpios = <&pio 7 20 GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	panel: panel {
+		compatible = "panel-lvds";
+		width-mm = <153>;
+		height-mm = <90>;
+		data-mapping = "vesa-24";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hfront-porch = <88>;
+			hactive = <1920>;
+			hback-porch = <148>;
+			hsync-len = <44>;
+
+			vfront-porch = <4>;
+			vactive = <1080>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-even-pixels;
+
+				panel_input_0: endpoint {
+					remote-endpoint = <&tcon0_out_panel>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-odd-pixels;
+
+				panel_input_1: endpoint {
+					remote-endpoint = <&tcon1_out_panel>;
+				};
+			};
+		};
+	};
 };
 
 &ahci {
@@ -218,6 +261,32 @@ &reg_usb2_vbus {
 	status = "okay";
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_lvds0_pins>;
+	link-companion = <&tcon1>;
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_panel: endpoint@0 {
+		remote-endpoint = <&panel_input_0>;
+	};
+};
+
+&tcon1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_lvds1_pins>;
+	link-companion = <&tcon0>;
+	status = "okay";
+};
+
+&tcon1_out {
+	tcon1_out_panel: endpoint@0 {
+		remote-endpoint = <&panel_input_1>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.31.1

