Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5D1301FF
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8045D6E40D;
	Sat,  4 Jan 2020 11:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5C76E110
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 15:28:11 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5B6409DFA;
 Fri,  3 Jan 2020 10:28:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 03 Jan 2020 10:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TULb9dflR8f+i
 ar3Jra82jnUYUmBfpvUi/00CZDkdqw=; b=Xe35b4raQXdDk6erfRm9RcsNCi1iB
 dPvQG1r7ACZLQ4MTa7yv14VcPpYe5z5NJBs2Pj/qiTZUb0qFCT5ZDvB/9GHwt2KF
 TsOQ3N4TUXk35EkszFozOAJqksCZY4TU7elbViRWRj3Tv4EPnSBLWLX6ynz7quXJ
 Kw/4CTXfA8/xnv4ZcxdpN+g3XWZos5b1iZpXRIrD6nuinvRztZ6qDqtyhzgCzUrA
 sz6Lp5f2G9gtmwXpVCN1qiZJZC9JqA3q5BIMO3ST+1Vh58vVre0nQ2o12VCuZ86i
 xIeDmpvwIm/1oS1DH6PMrhfi3DSXgwVZQXZVzOGt/VhCjtEg1XkDOQySA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TULb9dflR8f+iar3Jra82jnUYUmBfpvUi/00CZDkdqw=; b=CYG5raXD
 wzN9Wk4AkfnlUXjh7rPjEBGPIUq3KFltXI/iDglrf1zYR81jPjQdZJVMZRu2kKIh
 napyl7tZ6SYuqgu+rnYVVa2OLhzpVkcSRvh8TvSzgtO38hUSqdZEWqobtpcdO0dK
 ZhGwXhr3tcSrR6WGG0rso2dsPGz9WUQHMFu8rBqH1BWZkBfGfI/rBTlsCSPGFA3s
 d8BqIuRXyv00TyBXar4f4muD8omWrig7EKjgxhId5Tz/gT8j94py+4/ODct2nxkv
 7+BCIElbN2um5uXO0WMoYtnFXiDRHc3UD1CQVx4Gt/jijYBOjvBmeOi1jW2epsVT
 G2p5d9RkGA9XwA==
X-ME-Sender: <xms:il0PXg7pNP86bbok-xln6obbRGTTSYhetK_w9Qq4hIExWfYo-9UAFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegfedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:il0PXmm2YJ5BqfiCd0Ii3YWSpD_NDeTM_vCu4gv0uxSm850Fd7e0EA>
 <xmx:il0PXnXjTMULhxjosG8XTT2iLX1ngjyMBUUQJ5BF4eV3rC-BNqFPXw>
 <xmx:il0PXo4jp24etIEr1-gZwpZLPLnieZVnUfymBWOf3z09tpz4Q53Azg>
 <xmx:il0PXt_thndju0xsSyOFl3jK_erV92rgi1zAW7xtrrc2oLrMIrCWlg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F368530607CE;
 Fri,  3 Jan 2020 10:28:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 4/4] ARM: dts: sunxi: Add missing LVDS resets and clocks
Date: Fri,  3 Jan 2020 16:28:01 +0100
Message-Id: <20200103152801.47254-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200103152801.47254-1-maxime@cerno.tech>
References: <20200103152801.47254-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some old SoCs, while supporting LVDS, don't list the LVDS clocks and reset
lines. Let's add them when relevant.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/sun6i-a31.dtsi     | 23 +++++++++++++++--------
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 12 ++++++++----
 arch/arm/boot/dts/sun9i-a80.dtsi     |  8 ++++++--
 3 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 4d622ec48b24..7762fbd9a133 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -286,14 +286,18 @@ tcon0: lcd-controller@1c0c000 {
 			reg = <0x01c0c000 0x1000>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dma 11>;
-			resets = <&ccu RST_AHB1_LCD0>;
-			reset-names = "lcd";
+			resets = <&ccu RST_AHB1_LCD0>,
+				 <&ccu RST_AHB1_LVDS>;
+			reset-names = "lcd",
+				      "lvds";
 			clocks = <&ccu CLK_AHB1_LCD0>,
 				 <&ccu CLK_LCD0_CH0>,
-				 <&ccu CLK_LCD0_CH1>;
+				 <&ccu CLK_LCD0_CH1>,
+				 <&ccu 15>;
 			clock-names = "ahb",
 				      "tcon-ch0",
-				      "tcon-ch1";
+				      "tcon-ch1",
+				      "lvds-alt";
 			clock-output-names = "tcon0-pixel-clock";
 			#clock-cells = <0>;
 
@@ -336,14 +340,17 @@ tcon1: lcd-controller@1c0d000 {
 			reg = <0x01c0d000 0x1000>;
 			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dma 12>;
-			resets = <&ccu RST_AHB1_LCD1>;
-			reset-names = "lcd";
+			resets = <&ccu RST_AHB1_LCD1>,
+				 <&ccu RST_AHB1_LVDS>;
+			reset-names = "lcd", "lvds";
 			clocks = <&ccu CLK_AHB1_LCD1>,
 				 <&ccu CLK_LCD1_CH0>,
-				 <&ccu CLK_LCD1_CH1>;
+				 <&ccu CLK_LCD1_CH1>,
+				 <&ccu 15>;
 			clock-names = "ahb",
 				      "tcon-ch0",
-				      "tcon-ch1";
+				      "tcon-ch1",
+				      "lvds-alt";
 			clock-output-names = "tcon1-pixel-clock";
 			#clock-cells = <0>;
 
diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index 70ec3493061b..48487f6d4ab9 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -184,13 +184,17 @@ tcon0: lcd-controller@1c0c000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dma 12>;
 			clocks = <&ccu CLK_BUS_LCD>,
-				 <&ccu CLK_LCD_CH0>;
+				 <&ccu CLK_LCD_CH0>,
+				 <&ccu 13>;
 			clock-names = "ahb",
-				      "tcon-ch0";
+				      "tcon-ch0",
+				      "lvds-alt";
 			clock-output-names = "tcon-pixel-clock";
 			#clock-cells = <0>;
-			resets = <&ccu RST_BUS_LCD>;
-			reset-names = "lcd";
+			resets = <&ccu RST_BUS_LCD>,
+				 <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd",
+				      "lvds";
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 3b533e85da43..ce4fa6706d06 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -878,8 +878,12 @@ tcon0: lcd-controller@3c00000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_LCD0>, <&ccu CLK_LCD0>;
 			clock-names = "ahb", "tcon-ch0";
-			resets = <&ccu RST_BUS_LCD0>, <&ccu RST_BUS_EDP>;
-			reset-names = "lcd", "edp";
+			resets = <&ccu RST_BUS_LCD0>,
+				 <&ccu RST_BUS_EDP>,
+				 <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd",
+				      "edp",
+				      "lvds";
 			clock-output-names = "tcon0-pixel-clock";
 			#clock-cells = <0>;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
