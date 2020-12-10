Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8BB2D5E7D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8716EAB0;
	Thu, 10 Dec 2020 14:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD286E89E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:47:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 49272F42;
 Thu, 10 Dec 2020 08:47:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Dec 2020 08:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=rAUgKgTCccYOY
 3BDepQJV7aDV54fZfrGsRbvwVfnFJE=; b=aDOp4nHZnCjnSXWcHHFA3BR1mfw2f
 rzQvMjZT5G4P2nFt+OwvijBX8CoabvoTGx3A6HLnOSWq4skjQBIWJ5qaCBGC3etg
 XxDIxpScZ5MN3lpjPpVrdKq8AZjNpZB4CVS+SHeP75pGoPQ2KU45byGHlq0UJM2h
 +dP6dNuh0oBgEjPdZWJ8cJtZH7LL+jA+lVdR3Ym/qLg6PoCrONZe+o5ilAmEnVgz
 ERNdPtMXnZauM9bw8XzKMijsPRG6X5walOjAnpjaZMiOTkndjIj4nTdX3bB2Qn+y
 a+2tNkHW9LvqY4I9HGPjzEcyrVCd0i9WPDfjE+GM46r10o/earPWCGwoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=rAUgKgTCccYOY3BDepQJV7aDV54fZfrGsRbvwVfnFJE=; b=PDk8U9Uz
 jr7owVxnCEcNdtGSj+M2Z+vw+QjYunz6Dlan07Hp8N6fuOYv8Z5VL4gLKKFE+jqQ
 eo3DBbdDW818OSgdZtz65WOmi9jBRertM3xtMJ0FzIcTV2rN8gpxzqcpnoLmCWTy
 IAd1duzJvldXwY5+Fol+kmZTmc2/m0HjZlZZdbdWcCphPnAvu6EedQJ8pYVsMrim
 42Jqhx+9OT0fxlJXl8hdXaF/FEwuB5S8YKoecQsF59zun4wo0tEbBWW+cKsbT0eB
 ZaOK3JI9moxAG1HeeSDJ0KTewRLMmu+KYQLYK9m539BvlMlBli/sMNbFAa76zl25
 rPv33tQJxXClwQ==
X-ME-Sender: <xms:3ibSX4naLq6rDUO64xErOOK0Hr1ziBkg7CY_WA-0CZV9WndY2Zv5Yw>
 <xme:3ibSX3yjC--drR6kGtFUiRTEZzJjMM3SduhTid6PMCGVzueprnlT9fEkBahpESTUH
 e16ztbLCh5ZLjWKan8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3ibSXzj5Shw-sSFpNCOmiHkoNJ2SI1Q30lxoockT6mkLafjVH5fpFA>
 <xmx:3ibSX8VZH3lllN2HRgmcBScAG-Gu_6PoUx1rl9oEZPN_YwcX7uouzg>
 <xmx:3ibSX11Am2P439ffMjPqJdANXZxHdseu2ZHitxl1ELjTo2HmVoLs5Q>
 <xmx:3ibSXy7OqiXT5MX9t8Rd3EHYbMYGw8Lka3dWx1ITskceSFqA0HFctQMcAyg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 99AEF108005C;
 Thu, 10 Dec 2020 08:47:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 15/15] ARM: dts: bcm2711: Add the CEC interrupt controller
Date: Thu, 10 Dec 2020 14:46:48 +0100
Message-Id: <20201210134648.272857-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CEC and hotplug interrupts go through an interrupt controller shared
between the two HDMI controllers.

Let's add that interrupt controller and the interrupts for both HDMI
controllers

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 8bb46ae76a92..154cf6d35333 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -316,6 +316,14 @@ bsc_intr: interrupt-controller@7ef00040 {
 			#interrupt-cells = <1>;
 		};
 
+		aon_intr: interrupt-controller@7ef00100 {
+			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
+			reg = <0x7ef00100 0x30>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
 		hdmi0: hdmi@7ef00700 {
 			compatible = "brcm,bcm2711-hdmi0";
 			reg = <0x7ef00700 0x300>,
@@ -338,6 +346,11 @@ hdmi0: hdmi@7ef00700 {
 				    "hd";
 			clock-names = "hdmi", "bvb", "audio", "cec";
 			resets = <&dvp 0>;
+			interrupt-parent = <&aon_intr>;
+			interrupts = <0>, <1>, <2>,
+				     <3>, <4>, <5>;
+			interrupt-names = "cec-tx", "cec-rx", "cec-low",
+					  "wakeup", "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
 			dmas = <&dma 10>;
 			dma-names = "audio-rx";
@@ -377,6 +390,11 @@ hdmi1: hdmi@7ef05700 {
 			ddc = <&ddc1>;
 			clock-names = "hdmi", "bvb", "audio", "cec";
 			resets = <&dvp 1>;
+			interrupt-parent = <&aon_intr>;
+			interrupts = <6>, <7>, <8>,
+				     <9>, <10>, <11>;
+			interrupt-names = "cec-tx", "cec-rx", "cec-low",
+					  "wakeup", "hpd-connected", "hpd-removed";
 			dmas = <&dma 17>;
 			dma-names = "audio-rx";
 			status = "disabled";
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
