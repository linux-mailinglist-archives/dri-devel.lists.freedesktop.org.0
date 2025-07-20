Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBEB0B466
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 11:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E88110E17E;
	Sun, 20 Jul 2025 09:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="inTep5QD";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="mw3Y3eyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CEF10E17E
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 09:01:09 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 707857A0189;
 Sun, 20 Jul 2025 04:52:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sun, 20 Jul 2025 04:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1753001523; x=
 1753087923; bh=V8jVCNBeo/+6f3Mo8OE9T6Hkz0Ib2C8UypT57jXFp3E=; b=i
 nTep5QD3SOrLVtWUx/yStr90f+zFyJTIqgfv7SJlewJ11ST5hCphpLKBqzZE6hck
 1iNV2CCIu55nJccFp59JHPe9Kd2K/tP9tsZX6ojIPS4OcOkLklkHXYGo38PWRZwu
 94bLetnGY2r3z9IS28v7oG6n8YyRDvjsVSr7carlXhThLEuPk2ZtBCWC3UhpPt1U
 +fDvRHB+kq1LWc5YpnGwYIfHdS8Ko5JO3Jn7lVqmwejPPp0tsi767G0HM6gKZf2Z
 NDJojk++91tC0UHAKgULHMae0aUhZaop6AqH9BArdtLOAFk9DljUviiFzNNUws5j
 Bmc+X0csQ6p3oS0hGpJhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1753001523; x=1753087923; bh=V
 8jVCNBeo/+6f3Mo8OE9T6Hkz0Ib2C8UypT57jXFp3E=; b=mw3Y3eyIpZl1ypRFT
 Oasg3AzEuEja397h9R8hix+h+C0a7szyYB4SaEzBuemF85zmA5JC/IP26M9v37MN
 E3fmfNgHhVZZPIBB9Ut/lqTkQLGCu6B1NzTYu1OwmoJahx+8hcq1vDqOksnxMxF+
 M8vdXeX2RQvYwcHNA0WlPIwYK85/Q9yY6wmcgMrCnnJzvWVlFWOa/l8fePEPsyIX
 rSh8IlyVboMHmrITDvUYM/JJ7RJIctU2PW93DZdjWfOll/jI69Agl1hL8NDd0ZBY
 C74mzOas8LN3wP7U9QssWyxPNnB0MMrNwmSreF3BT+/Vkjgowb9+mGOdxB8r2hlX
 gekEg==
X-ME-Sender: <xms:M658aGIS9UOhZDqcwXYOul5OaJKczvr1YgnU59-0721uv3tej0Sydw>
 <xme:M658aJD7MIL2iO-C5HJ6Ed_KUfP758lkYwzjmcHZNrIWPo_mpeCDl2j0scUDSC4xm
 BCaCF0B9mFoIaNgTg>
X-ME-Received: <xmr:M658aA7IBAtmJtS5DuFqdKdSR7p0GtR3D-6BpZQ8t6F0rfxdPspqPxC45XCmJz7U0LmjPgs471LCPGVTACdeI5j747Z6jQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
 necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
 hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
 theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
 gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
 thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
 drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
 kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
 hlrdgtohhm
X-ME-Proxy: <xmx:M658aNH_rF0hjDBpHor-Yf2hSivaaCXRFxZK9R05yqhBXunogvi-5A>
 <xmx:M658aDQwY599IYLUMJsPVHhmOxK_2jqtTwLDDRJ1bq8tUvVTpxmlDg>
 <xmx:M658aPdDJ2H2Dn9oSNvqr6Fh-3GKdwUEXxtqpoOa7M7x3oXAiRnkIQ>
 <xmx:M658aBik_StL-bc4QrSvUNnYjHehB7Nrcgfk8ULmfbO33xV0rtmBkQ>
 <xmx:M658aNH6L_-2E669Ete9w2ud0NTN-GkCcQ12xE9KbSk4nR2-1V6LBidG>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:58 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 10/12] arm64: dts: allwinner: h616: Add LCD timing
 controller nodes
Date: Sun, 20 Jul 2025 20:48:48 +1200
Message-ID: <20250720085047.5340-11-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
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

The Allwinner H616 has a display pipeline similar to other Allwinner
devices, specifically the A10, but using a newer display engine
revision (DE33).

Not all output pins are exposed on all package variants, for example
only the H700 and T507 have LCD pins exposed, but all variants support
HDMI output. On the die these are connected to a display engine via a
TCON TOP and one or more timing controllers (TCONs).

Add TCON nodes for the TOP, and the LCD and TV timing controllers. The
timing controllers are compatible with the existing R40 driver.

HDMI output support is not provided in this series so for now note this
within the relevant node to prevent a DT compiler error.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Add correct register, address and size cell, and endpoint definitions
- Add stub tcon_lcd0_out_lcd endpoint so that device DTs only need to provide remote endpoint.
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 7347332f54a7..e4209dc6b46b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,9 +7,12 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -926,6 +929,144 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h6-tcon-top";
+			reg = <0x06510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>;
+			clock-names = "bus", "tcon-tv0";
+			clock-output-names = "tcon-top-tv0";
+			#clock-cells = <1>;
+			resets = <&ccu RST_BUS_TCON_TOP>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_top_mixer0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_top_mixer0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon_top>;
+					};
+				};
+
+				tcon_top_mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv0_out_tcon_top>;
+					};
+				};
+
+				tcon_top_hdmi_out: port@5 {
+					reg = <5>;
+
+					tcon_top_hdmi_out_hdmi: endpoint {
+						/* placeholder for HDMI  - remote-endpoint = <&hdmi_in_tcon_top>;*/
+					};
+				};
+			};
+		};
+
+		tcon_lcd0: lcd-controller@6511000 {
+			compatible = "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06511000 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon-data-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd0_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					tcon_lcd0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
+					};
+				};
+
+				tcon_lcd0_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					tcon_lcd0_out_lcd: endpoint@0 {
+						reg = <0>;
+					};
+				};
+			};
+		};
+
+		tcon_tv0: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h6-tcon-tv",
+				     "allwinner,sun8i-r40-tcon-tv";
+			reg = <0x06515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb", "tcon-ch1";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv0_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					tcon_tv0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+					};
+				};
+
+				tcon_tv0_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					tcon_tv0_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+					};
+				};
+			};
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-- 
2.50.1

