Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE12B478CCC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1410E325;
	Fri, 17 Dec 2021 13:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C9A10EE9B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:51:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CD7645C015B;
 Fri, 17 Dec 2021 08:51:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 17 Dec 2021 08:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Ztxo4N32XiR58
 mScp1s8TZl41sIcckkAII1E43MP8WI=; b=VBx59HdI91cjCbnU0Y+eumZ3Wlm+T
 w/Z4iw9JgwUo3GVNRgqpq+JiOs+uouu35rMf1joB9QdetMOnz8pwBT6X3XZ5fH1Z
 zF87LYVSSQqZqFWNjrSuId/snO/6VBjhuH2YdRaTPla++pCsphP+f25At6gC7uSU
 JtFy+GYa30FmqQffWaxuvZMK2zo8Z13beigyOcz5Zkuapvde6sPfhodQ9av67+xd
 jgr6vM4P7VV4sAIZBDTnOu0r5amXf5+ODGeIrRDzfeY2X99WQ8B2PnDSjCCXpRXN
 jOZ14t6d3FdAM2fDLnOek86oczdvNNgbV0JESU+Bcq8G3TOihMdTi0Odg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Ztxo4N32XiR58mScp1s8TZl41sIcckkAII1E43MP8WI=; b=hAGZe/Lm
 ltIrOEs9vY6R/phjr6CsdzrWD/zMPVk/b1LVu2tuT2EtkWMwVIkf0SbCmwDQyDx1
 8jigk5jDR70LJCwK0An2y/NQ26znMpQuCVP+JYJCjGXOBjqd01UlcLcTwPmQJJ2P
 pWXCrCxDxw/E4Sf7EF/icGRwyyYQ6Iiljo8UzPpVdbi3AyflvG2sodjX0SMVs3SF
 BgrcAi1vhHX5pCah8qBZdQPZLD+yJDi5n7dUsujpZZ5sFd82ToH2LL3uT6WawrD2
 6m4owKAkEAGdDdaIaXTdC6BWwBxU1jwdcrUrfSRbIH8LES3VUF400F7LpHVZhgsK
 BAQyDQO/SRU+Nw==
X-ME-Sender: <xms:6ZW8YUaf82Z8oG7HpJYQ0eigyS55rdkwrIw-sHEIvtCFXb1f3GKZ3g>
 <xme:6ZW8YfbQUYetyGp_6Ut-KP82vBXg2QYfb1k6p8O680sj86-AT0jCdu-wqGccFVZSK
 M_Uq5zMLTCM1Tq11dU>
X-ME-Received: <xmr:6ZW8Ye9Uuw3-IfnlPRd5rp_vFRl4aojfxUrHmokNm5VX8-FtRtkr8zaXa6oiJo5eaNKgUzpEs1BErgXNxNqHKqlLn5LUXkzOuMW7kPM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6ZW8YepPSfobFvuwjLvkJOXr-xoP_nG76U9ulgfbzZDUPISXXz_1uA>
 <xmx:6ZW8YfoG_0JWfoA7L7PYxcA2MrOD3S8v8ep5mUIpU36K4hre7yv9ZA>
 <xmx:6ZW8YcQwOWKemqYtj0Xurv3VYuuGt_T-fQzqcsJVmoj8-kfi6gw3dQ>
 <xmx:6ZW8YTdXNUdvSoWTjFzDehwBNumpm40osD2P8msqKTA0u8dbnNhffA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:51:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v6 7/7] [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link
 on the Cubieboard
Date: Fri, 17 Dec 2021 14:51:19 +0100
Message-Id: <20211217135119.316781-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217135119.316781-1-maxime@cerno.tech>
References: <20211217135119.316781-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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
2.33.1

