Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A81E2D5E89
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B3E6EAD0;
	Thu, 10 Dec 2020 14:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5780B6E89E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:47:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E9AE6ECB;
 Thu, 10 Dec 2020 08:47:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 08:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=33oSiXdSZylYg
 pfeTrEZ/L2Seb+RHHNfFg6qHXNR8Pk=; b=swk7Bi/P4wIR3VlSMdEv/9KS3rr4V
 aq0v9ZpPbYSMmDq5AxKktSYa3PAGoqyeWzvu/h5dXmPeJ2lKnETbuSyVKolqW520
 Qyfdiy8ox2lsaxuryW0yufCB+RFIg3pW+ElNlSHulWIFxqAEMbXKV+ZlEzZzZ08X
 PcEKe7pwd6ZNL6423olam3aiFe6mEELvehMDkJqdLo7mSWlQUkf41EGEKdeI+Qyh
 7g4WH9YhDyHN95cYMxRtILGAQKDXPQ4fQ3jXNtW5r/juPCfaV12HcnYOkBIbhKQm
 vvCx7cQNe+9BiuKi0DujoMnX3G6psNuYvDNz4c0rIeVAdNS3tAJFMUtaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=33oSiXdSZylYgpfeTrEZ/L2Seb+RHHNfFg6qHXNR8Pk=; b=XHheXdQB
 6j/CQnuMdhrFYhCcbGlpXRn3IKOzI+vUPTHSstdi5oIx2Pw71rWt5FSKUby5FinS
 xM/s57nXtFEyGeCVuj9jWzGyxVw8HO2J82KjwVLknKiD9askNNHxxFr/w6sbgaI+
 1vCWLkQ8hYnwIE6RPJnE0wi/PEvNeutWWfTUynZ/5R/n5NcmW3pe3bXrzc+bWhvB
 FfZ3K7N6p0W9FXnDZp9arWkjrHXOylaq5N+3NrDTsA4ZqOmB/MOoem+eWf7+fARD
 UJ0+x4h1Pr50gqL+wwFjYXeW0XzJ+8RiOJld3vn8wQMUtKElnuipnCN+StIZ26p9
 bom5bzNzItk52w==
X-ME-Sender: <xms:3SbSX02saM-OZ7rau-hiS6q9JlleN-oxSilg-8VKD5SY3C0Cq2AtYw>
 <xme:3SbSX5KVRJCbr1IezwmxG1rjmOVE-iAdmII-zuzSjYwE2YAY_SMS1qGJmDJER0DAn
 ljAZD4cisQ6lfHt56s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3SbSXx0n15eoh-5_mO32jnYACWB-qNk-bLuBDuo-WTt8yjC6UIys-A>
 <xmx:3SbSX1mYaaI99bClyRWzqckUvnZotM123AF54MfTpSa4KrUZ2KtFNQ>
 <xmx:3SbSX0jHp0Mfa-eGAzVRxf5qZNy8QQ0yosmjf-ZFHu6STKM3OLHKeA>
 <xmx:3SbSX8euGKauDykmwaWjhrex1jcbF1qMQP9DdaPaLDj0XENvihZ65cJGjbA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3E3CE108005B;
 Thu, 10 Dec 2020 08:47:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 14/15] ARM: dts: bcm2711: Add the BSC interrupt controller
Date: Thu, 10 Dec 2020 14:46:47 +0100
Message-Id: <20201210134648.272857-15-maxime@cerno.tech>
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

The BSC controllers used for the HDMI DDC have an interrupt controller
shared between both instances. Let's add it to avoid polling.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 4847dd305317..8bb46ae76a92 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -308,6 +308,14 @@ dvp: clock@7ef00000 {
 			#reset-cells = <1>;
 		};
 
+		bsc_intr: interrupt-controller@7ef00040 {
+			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
+			reg = <0x7ef00040 0x30>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
 		hdmi0: hdmi@7ef00700 {
 			compatible = "brcm,bcm2711-hdmi0";
 			reg = <0x7ef00700 0x300>,
@@ -341,6 +349,8 @@ ddc0: i2c@7ef04500 {
 			reg = <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
 			reg-names = "bsc", "auto-i2c";
 			clock-frequency = <97500>;
+			interrupt-parent = <&bsc_intr>;
+			interrupts = <0>;
 			status = "disabled";
 		};
 
@@ -377,6 +387,8 @@ ddc1: i2c@7ef09500 {
 			reg = <0x7ef09500 0x100>, <0x7ef05b00 0x300>;
 			reg-names = "bsc", "auto-i2c";
 			clock-frequency = <97500>;
+			interrupt-parent = <&bsc_intr>;
+			interrupts = <1>;
 			status = "disabled";
 		};
 	};
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
