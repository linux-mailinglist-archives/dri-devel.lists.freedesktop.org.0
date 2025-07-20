Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D9AB0B46D
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 11:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8910E2B7;
	Sun, 20 Jul 2025 09:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Yw7rfEXX";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="C/WQIsFr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D9810E1A6
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 09:01:10 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id 2679B1D00167;
 Sun, 20 Jul 2025 04:51:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Sun, 20 Jul 2025 04:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1753001518; x=
 1753087918; bh=MDm/inKToRcZI4lPjYrALTs7MKQ8nA7DAiyKGXgO4rs=; b=Y
 w7rfEXXra7bC0rkIKCBLhw+IAwy2w1qx3sug8zetYKXoVQ4bzIE2TJ0TRkpc+TTJ
 ugpaOz2+JQN9QQriAobkmO4QvgTtP+T8n6T6izuXIaOA22Oa2cqAsbWMIL+RkueY
 04CusWSiyKtgIc8WuyOIRLX1aa3ZtHr1cdE63NJnQTEmey3ujL9qR8SPLGCqVVbK
 Z+IjSOKAiHkQH3wyTJOq8/Xnnl/jNfXE04zyw5XTlJwQf7iQZ9/Zjzm+Xa3zUJjF
 IJ5uWNYn8CXh9BF5T0F9DXTDV4K2qRUIOx8mCKzkI0Y/r2fAjmlf0g5WtC03/+1a
 eksKaTIVLXjyrDao4kQhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1753001518; x=1753087918; bh=M
 Dm/inKToRcZI4lPjYrALTs7MKQ8nA7DAiyKGXgO4rs=; b=C/WQIsFrckGSMBGEq
 CuiIHiPjeOyR3f5W0Zx+U8wQmTGca1f0RuwVReEwSqBtH1fw03SgpRu+/XJ3d+my
 3HexOyWi3JKBL9SU8kgb77SDfsK5tHY/TZFfcutS3b9JdXDizkBH9cGQLpnRHjsy
 uvM0iZwwWl3/K2DDwP552fOi/DT+Ui2nKgDM2Mn8O6BEQKe8tCMiaaKFMUIapGDb
 LC7t6VIWZXt0pio7mbaLw7SY5L/TpZ9ybF7hmgn48M8476TLnLF+6xHZkPg6l3PM
 v783+frK1jPxNwQFkueqmh4riSlJNWqD/R8BgNx0lP/jKOq24tZFa21bBQ5mzXE0
 oJViA==
X-ME-Sender: <xms:La58aP_9DokIjbCcshCG5F19SpanChP59sRPKrD3vIAISbl7ozxDrg>
 <xme:La58aMWvjH1EYa-jFQEj0UTs_P8eDCNNrcF7nkXwyAILaxW2thyRjd-l9Io3j3hs5
 96fbS2uXuVorEGOyA>
X-ME-Received: <xmr:La58aIKk_xAvnd0isxFOjtI0kFcE5sxxM35fBFpAeAQJiU3kyUO1HecnF-SttiRpXdd5rnR7frhL-tUOFtiJT75gqs4TtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepheegudffieevieduudefleffueetieeiudelhfetveeggfffheehueduffevjedv
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdp
 nhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehroh
 gshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghl
 rdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
 htthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhr
 rggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrg
 hnugdrohhrghdprhgtphhtthhopegrnhgurhgvrdhprhiihiifrghrrgesrghrmhdrtgho
 mhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprhgtph
 htthhopehkihhkuhgthhgrnhelkeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:La58aADiKGnhV0CjYUmL5IVC3dO8IN0MuSXvIg-BLkPizKYOvZoaqg>
 <xmx:La58aIGZJ40MC3Yq7M67b9DHl6Pk4V_0IPY0kp8l2lE2rbqulRywIQ>
 <xmx:La58aNLJAyOzff44nclJ730ldO_1KlUkgHJZy7QgMFAkX-sOSPi2Og>
 <xmx:La58aHrYDVnJG12IDGjkMVyxcoN_FpF90PAkK34u43F-uy2ynAZj3w>
 <xmx:La58aO2K9YcMiic-b_gCMiVnb2fSIprvUlCvqMqLN8EHHt6d4IzweTHH>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:53 -0400 (EDT)
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
 dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 09/12] arm64: dts: allwinner: h616: add display engine,
 bus and mixer nodes
Date: Sun, 20 Jul 2025 20:48:47 +1200
Message-ID: <20250720085047.5340-10-ryan@testtoast.com>
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

The Allwinner H616 and variants (H618, H700 and T507) have a new display
engine variant (DE33). Support has been added to the existing DE2/DE3
sun4i driver in a previous patch series [1]. The variant is selected via
the appropriate mixer device tree compatible string.

Add the respective device-tree nodes for the DE, bus, clock and mixer to
the H616 DTSI, and the matching SRAM section for the DE.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

[1] https://lore.kernel.org/linux-sunxi/20250528092431.28825-1-ryan@testtoast.com

--
Changelog v1..v2:
- Use A64 fallback for bus driver rather than add additional compatible in driver, enum added to dt-binding in previous patch.
- amend order of display clocks (bus/mod) to match dt binding.
- add mixer register names.
- removed IOMMU binding due to late binding warning likely reflecting sunxi IOMMU driver bug. This is not required for RGB LCD output.
- use H616 compatibles
- Update SRAM name to DE33
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index ceedae9e399b..7347332f54a7 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -94,6 +94,12 @@ l2_cache: l2-cache {
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun50i-h616-display-engine";
+		allwinner,pipelines = <&mixer0>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -150,6 +156,52 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		bus: bus@1000000 {
+			compatible = "allwinner,sun50i-h616-de33",
+				     "allwinner,sun50i-a64-de2";
+			reg = <0x1000000 0x400000>;
+			allwinner,sram = <&de33_sram 1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x1000000 0x400000>;
+
+			display_clocks: clock@8000 {
+				compatible = "allwinner,sun50i-h616-de33-clk";
+				reg = <0x8000 0x100>;
+				clocks = <&ccu CLK_BUS_DE>,
+					 <&ccu CLK_DE>;
+				clock-names = "bus", "mod";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			mixer0: mixer@100000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x100000 0x100000>,
+				      <0x8100 0x40>,
+				      <0x280000 0x20000>;
+				reg-names = "layers", "top", "display";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER0>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer0_out: port@1 {
+						reg = <1>;
+
+						mixer0_out_tcon_top: endpoint {
+							remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
+						};
+					};
+				};
+			};
+		};
+
 		gpu: gpu@1800000 {
 			compatible = "allwinner,sun50i-h616-mali",
 				     "arm,mali-bifrost";
@@ -188,6 +240,12 @@ sram_c: sram@28000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0 0x00028000 0x30000>;
+
+				de33_sram: sram-section@0 {
+					compatible = "sun50i-h616-sram-c",
+						     "allwinner,sun50i-a64-sram-c";
+					reg = <0x0000 0x1e000>;
+				};
 			};
 		};
 
-- 
2.50.1

