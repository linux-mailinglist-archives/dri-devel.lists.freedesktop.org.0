Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB61831FA33
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 15:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FB26EB36;
	Fri, 19 Feb 2021 13:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CCC6EB35
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:59:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1187C866;
 Fri, 19 Feb 2021 08:59:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 19 Feb 2021 08:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ASAKe7HZhzP72
 CyYi3kuS9lLyH9R9qs9nEfZ8f6xrx8=; b=V+cpgkASL7QxMhtud2yQ1tSp2VBeF
 yjYuXzoTORnjLvXIUW+sZAMzIq78DPKNSTPb9BLsbd05n7FmJvjvpO7FADk+nICj
 SYmw8015R6lCT47nKcwd3QUlMuAEIfdef80auE/luyBs6YR8/YPqgIIBAQWT4cwH
 8ZBf3bUe6zW3tnyxKOHsUcafY2yB16g4eATk4NjrAAP1+Pn1F3rv3v7jPLBJygUa
 yBbUtD1YlS0wObTJtZm+Ceq9LMDzRWGZ1bmbOhgs0pUWdbYmiSqAhCoP89tI39uN
 R4tm+9za6tIFS8xTi7IngfaztLP0TwCM9eY4RhJ13r2Jy45YS/tK7ZWdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ASAKe7HZhzP72CyYi3kuS9lLyH9R9qs9nEfZ8f6xrx8=; b=nU5dlE4d
 +I42aGYF8nBo+fHOZnZXvVHRjROsOVLKIsK4ZYy/w3HLACuDy7MjXsBS69iyj2Rq
 gfK9RgC4e3VSG9yazpG/+4UL7c9PScT+qgmql6eZZ3zych7hok0jCoOn/JMBuXU9
 AhaDwebYz+ej/uLHYNb8yetjJI45s728e7ui3Vabz1t8+yrEvVvsO/og94IHqNtw
 KfL29WokOywgu0sWBFj8fo4uzml1JHNOPM7Zfe9Oke/UNcCcIjtI78UCvdh+2kfh
 +9SVssl2vM07T3ZuOwEOp16ppNoDsJElw9MZERseIOOxt/ECtqC3rAmHlY3uRQRf
 BxeoLf9ZIhjqUA==
X-ME-Sender: <xms:VcQvYHRIo7W8x4M1eEVtqlHNRezoXcJHCd1Xtvnb6er0dzHyUk2Sbw>
 <xme:VcQvYL0SA52aq3t6foDdcptEGhus5K5-8ITs4qRjNzifNQvRtpfRvO7e9DlpC3jaZ
 nywvevxJBVo2HLuA3M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VcQvYHegfiXtHdNSV3-k4lyFVZ4ELa2CgK3gcJTapoCs4RRNiMbHyg>
 <xmx:VcQvYDO0y7PvOQHA4cIvzny9OruYhYjXEf7zoCgfDkH_9LHvF4C6yQ>
 <xmx:VcQvYLX0ZX64Ek8zjYKgNCID9Myf_txT1uxpvoXybMacQMYe-olHAg>
 <xmx:VcQvYG13Exz93pIZifygmMYXfXyVdqGESFvDWVgm8oliMbdokCiDUw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 73A8D240057;
 Fri, 19 Feb 2021 08:59:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 7/7] [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link
 on the Cubieboard
Date: Fri, 19 Feb 2021 14:59:34 +0100
Message-Id: <20210219135934.618684-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219135934.618684-1-maxime@cerno.tech>
References: <20210219135934.618684-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the sake of the example, let's enable an LVDS Dual-Link display on a
Cubieboard.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts | 69 +++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
index b8203e4ef21c..f0e693e92253 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
@@ -85,6 +85,49 @@ green {
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
