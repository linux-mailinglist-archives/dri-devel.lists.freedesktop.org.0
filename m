Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8FD1B8014
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D736EB4A;
	Fri, 24 Apr 2020 20:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1F96EAB1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 6027A10AA;
 Fri, 24 Apr 2020 11:35:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2w0cp3nEr88sP
 +MV7TWqwyUO3pJl2Co6QHKEM/4+4iE=; b=N/dSk6AJQ3C/nUbhapEedJE8eLmX2
 64M3LAKqUh5PbHZzy0kcTTR5gXf7I9Yo/XTHyeK8u9Pi5jcpjFxP8RUoIk43kZM4
 mwkHfJmkIAaavFEIn/eU9qJ1BIKL2gTYMVgUimSjt1YWfGKxzxR6iVru+g+2miWt
 2rHB7KDELarm6JAiMkwvcMkUDrhH44bmutGaWQuVIm6uATGP7I0nrzxNaBAfu+1M
 Ax9Iz3rPQjkrPueoeexDFDf1zAAq+eV9IpFSC6otMQZNnYdx6ZlGDCRFHsgYbV1D
 2uCOHCGMvmd/XFmmZP1QveOHsZS2FfvIllEfxsqZVnJl6WG9gvwgFoZcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2w0cp3nEr88sP+MV7TWqwyUO3pJl2Co6QHKEM/4+4iE=; b=kTleo0e+
 gMAEV47fJbZF3oyXrxhwLUEskfUiu7xadCctIv7i/1qOxZn3QCyFPRMFCaLSYCDG
 1M64R8jq+LpW555I2nSnQyEVd4IHcUdZizhXbSOpJCK9nzNrzy+gTRg+eeiPJn/g
 aBebi8YKjr4q5r6lpHT7o08pnSqUz2FLoAbxN3IOgjpOUiY/MPADfnvr+65LbFN+
 8kCSSpqujJSC3G4Qr6xHBucc/JsBCuqf/p8gzcn8LyIqx3iGt7LDFrNjhjNj6D/J
 FPWUJtbp+Oi3M3zCb5ifGRuYBjy3mp7oFGbhJTHc3jCjbaYnrFRmqfeZ5YCtb+CB
 ZkcUKmVxyzw1Nw==
X-ME-Sender: <xms:XgejXvy-mkltDnTqrR6_gzZVfKIgItlOYvFTWoJGCzelGLq5TKUMYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvvdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XgejXtn8h8u_Xl2aJRvaEUlvSidwnL7bxHKLeu1BH9nnvw8KWepvjg>
 <xmx:XgejXmD1VTLs8GlrLpZp-gfcJsccdqw1wihvhDZsY4J85_N-IBGnuw>
 <xmx:XgejXoIyRRU1OayvfaPNQ0lmr-gWNY-K5ylCQ-EKhxxo3PbHaxtDmA>
 <xmx:XwejXnMTX2fvQKu4pEB0q5Qw_6II5LX7R5BEXx0RHOMw8Zz6q7lMiXJQp-U>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A69B328005A;
 Fri, 24 Apr 2020 11:35:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 26/91] ARM: dts: bcm2711: Add HDMI DVP
Date: Fri, 24 Apr 2020 17:34:07 +0200
Message-Id: <5607ea5d992f98051e51bcf30ab28f4a7b065515.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have a driver for the DVP, let's add its DT node.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index a91cf68e3c4c..00bcaed1be32 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -12,6 +12,13 @@
 
 	interrupt-parent = <&gicv2>;
 
+	clk_108MHz: clk-108M {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <108000000>;
+		clock-output-names = "108MHz-clock";
+	};
+
 	soc {
 		/*
 		 * Defined ranges:
@@ -244,6 +251,14 @@
 		hvs@7e400000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		dvp: clock@7ef00000 {
+			compatible = "brcm,brcm2711-dvp";
+			reg = <0x7ef00000 0x10>;
+			clocks = <&clk_108MHz>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 
 	/*
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
