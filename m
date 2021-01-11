Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2302F2970
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47116E02A;
	Tue, 12 Jan 2021 07:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA5E6E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:23:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9646C58067D;
 Mon, 11 Jan 2021 09:23:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 09:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=aK6UGlO5NwyBY
 sA003WjrWhuBRMRE4V1u0CrJOpUvi4=; b=FwNJFoiteH8ISxZtF/ldrLT7cGPG7
 JwK0b17r9SQOPpW9nY1kzh/laWydFrnhgHNK9G4HrRw3RVD8pgUcNdRXQAjqHo63
 aqF/DccL6vm1Hf2AQx+NZPBQoZTOPF5pIRNamWh6BhUU0XHjBdRjtj0QFonjMeL2
 xg5IiP/AOHJNydmppKSxWIXz5yDdQ55WDjoJRoCkGaZe/Q4HUK52CZDO025pb7bf
 kdO8MVw+PiA/SwXLW8nDYgEzf8Jy5SdPAXRqc8acSOByJcEzHkZnc8IIILEpAxip
 f/V5O8xMu+JUhN2eNUalq/hWaHcnVuqCnNZxfTO9uX5BWdSxL21yzNR8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=aK6UGlO5NwyBYsA003WjrWhuBRMRE4V1u0CrJOpUvi4=; b=Kok8bDTh
 Wd3yTbIfLtGFvZriVJxi02gcFJxr06fMY252qZZF1Nuzjfljkz7moZcqhTWm3fhm
 yWxqk6eqOhMTSlGu10uocIxUQdIDBUFSvviMRnqYCawe3LrRXp9UgmM9LNlGP/C0
 rxK36pyDOYiDXHlgituPTUPF15xcd3E/pIQjoX7Kbwjst2F1g+xEndHbCjEYguJ1
 0t1vy4/8jm1SM4gu6OIwozDgBY9F3ivYI9jeJPjbmAOJtrnIcTaFlosySErfLWH7
 DxieH+sXwHQ2i+f2pL7JOw4iPtz7sPpLlhPKkI8C/jbAv9ELqUoA1VWM6UEmytqw
 IHdbrW0W6rFGbg==
X-ME-Sender: <xms:Y1_8X0gs2dXZ3ztSmcD9WErM8-Qrgbziz7wcCJlHZetXkBixoLBX0Q>
 <xme:Y1_8X88LFtb6HUKm_OIeR8FjUg_hmMVAj866n5SAqjF7a2jPzRKJ3UNYM1ugkd5wJ
 AM_A861Kn0AlHMDHuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Y1_8X4_29_t4QLh00RqQAGBH_t6v_69cYFSI-09tWyRqsTGFAn6rnA>
 <xmx:Y1_8X9Bhlx9zYeskr6RZiti4bCClbtb8j8yoYsndSJlVZWvv8i4Y2A>
 <xmx:Y1_8XwyPFBBkx_Hqv_TPAz5l845tr2vl9B45pL8FUaghjkYRrxWJUQ>
 <xmx:Y1_8X9lKTrDurNJzxWAflOBl0j_i98lsuQB1t9jyn0vT22n2dh-ycg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF0E724005A;
 Mon, 11 Jan 2021 09:23:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt controller
Date: Mon, 11 Jan 2021 15:23:08 +0100
Message-Id: <20210111142309.193441-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BSC controllers used for the HDMI DDC have an interrupt controller
shared between both instances. Let's add it to avoid polling.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
