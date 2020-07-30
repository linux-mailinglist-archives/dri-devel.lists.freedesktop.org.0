Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC26F23402A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C926EA0C;
	Fri, 31 Jul 2020 07:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB746E8AB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:35:29 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4009E5803E1;
 Thu, 30 Jul 2020 05:35:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 30 Jul 2020 05:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Ut3ZT+W4+yvZB
 ml4M9YqRFh4J0n6Jv0UFC/16UuzKdY=; b=KFlJEgPGwRR2vjF0Q+fs8WD5ootQt
 hfzR4ffcWWrBRiergQgLJrKzOI3qxt/Em54M68T9w1cWD4J43FRyaIeq+ZY+f7l6
 +jjtodTVelkQhYaUilqC8wSTz5Xlo0dCaQVXsGm/BHtx/ga+JSy7isz52KWljpG8
 oc/S88ZziRnfdk+0GE6mVcwZCYLqoXRn5Y0+Tn7uexo59+B/xQdO9a/4Z3Tcc2Ze
 z5z8fJvBdEjrgunBTHB0JckOy/riYMn62GH2ErbjivTxtCEkrGSc+/PXgUzClpm7
 6Uu/w9hNdv+2yx16rPQobuXYFGHWhWbZl4UIBw5AwH0p+OEpkTPztvO2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Ut3ZT+W4+yvZBml4M9YqRFh4J0n6Jv0UFC/16UuzKdY=; b=fjTot1oz
 CZm/loUuLwTOf0Xfikhwh/ZO2+/IQs51WirESIfZjNE2IuGUQVZJfcYkD3VNpU65
 4RCy85uxDVmGsRfJsLwvlzajTYSO5kMBgbF6iT1ulDBbEQaLWGWRbDwe3VOGgMJO
 mMc/ZluGrOVyHrcMXCwHTVGXdUvRXyLP5BSI2XTquaxmHTfuFnFaTB88QHHn7Ako
 v2T3aiDc76uVtEaRiEcUFL001gG+MsvBGYg25jfkDpJ8h5N24s6mG0ExrSgbn0zZ
 i58hFmU5BNNEiCo3smOwzFqCnsOvAWE+TcRGtJnM/7tyrsOj3wQYv+aAw8vgSPNz
 pa85ZsHRaditRQ==
X-ME-Sender: <xms:YZQiX0o5WY-1gULOk4Mlb87TvnfdSTSr_c5G-BLg_5YYjzCGWKZEOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieeigddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YZQiX6r8o3ZdGDBFBQKvl2YbKTvNt2WmoXjiSg0RqKdR6MojgZMV6Q>
 <xmx:YZQiX5Oo6yjuL4Ilb6Zc7sRrqGz6jAJXnZviA01pRzVen4lfPCoKoA>
 <xmx:YZQiX75EMkxVaIOokm1p-WJ06rHAlc0tH_2s7SmruAOjF7Sp7m0jtQ>
 <xmx:YZQiXwERekDBNxOMoFeA2m6g5Wd5RNnyn2ns5kQ4vNE1UVExhebczQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD5843280065;
 Thu, 30 Jul 2020 05:35:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link
 on the Cubieboard
Date: Thu, 30 Jul 2020 11:35:04 +0200
Message-Id: <da488b254cfed95796561873f9b400c40f290796.1596101672.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the sake of the example, let's enable an LVDS Dual-Link display on a
Cubieboard.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts | 69 ++++++++++++++++++++++-
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
index b8203e4ef21c..20278a27ec16 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
@@ -85,6 +85,49 @@
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
@@ -218,6 +261,32 @@
 	status = "okay";
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_lvds0_pins>;
+	allwinner,lvds-companion = <&tcon1>;
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
+	allwinner,lvds-companion = <&tcon0>;
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
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
