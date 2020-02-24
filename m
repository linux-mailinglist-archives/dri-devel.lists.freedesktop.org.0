Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7119316A29C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7014F6E32A;
	Mon, 24 Feb 2020 09:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC1E6E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 529AF61B;
 Mon, 24 Feb 2020 04:09:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=LR8mdDtlCr3Pd
 X4IZvrJzJtuH1/odhhyEU81Aywpmxc=; b=aL7PnAFOPiCRVmaYG3ryUK3sf8R5m
 ZnmuPVco6woe+bjwu7T09YucP4gIZSZL7gvNwNK1KAnPeJ0WxIfJZvGg4uk1hasj
 CDaPSrhCcen+8uhWjzwlniFWXHhk82q/JF4eWhiqk+heCl7OtaDU7aCSgfy6eKk9
 qx2W52/trEWwukymR1r3Z3nxMT5QQjKi/hR+RFT4SjTxPnK4FTaRvPTjGng0Ru5i
 jLdnaiurP7fRU9dsyzLd+Grh1MXKun7PslhxDg4uXF6y12N9jOWnASmqssZ/Ajxs
 pt69vKuhpbbwTbQmhoJIKccq11W45fzbD9hAwnk5I4HiLtekKjgBugMcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=LR8mdDtlCr3PdX4IZvrJzJtuH1/odhhyEU81Aywpmxc=; b=hylC7+MU
 b36bmJ2rebmaRYXV6/RsMUzeJmgsUsNoebifrINBCPGz96uKkSybzeFd4tnEdKNc
 WCIvO2vrlHg+2dOcYiw9BW/kBuoPNO/HBW/p29tuvgfpuKnK0dXLKPud+cvskHlp
 28viH1uxwN0Xn6l6/v8jQpTHHDQkxT4s9X/jmfTdN+ohunH0mZDBOs1oTd1Tc4Ni
 U+5pICCJzTvcEH4OTfAZ8mJhVae/ej6kXgPLsDMzOWCIJKP01+oHCUSjsQAiEfbY
 d/8tTx3om7HqXyfJj30Ndlov+/BS87+FtK8Wa7aKMtcQHUI9OS15fFsypMErnZtr
 Jc73PHYSvJvuOg==
X-ME-Sender: <xms:yZJTXkwUMzv78SKyxc07yYersDZPatXKz6rSncmSE7mIg7kgvtMB3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepvddunecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yZJTXnBR7wr2czXcS17B5tM6aomeldfQKK6wiaa6GWyh09jzvSOQlQ>
 <xmx:yZJTXq5D0DR6aZj_eeH6Jfc8PmQKozAnQD5x1Hi2Xt2B7MEk7zIsmw>
 <xmx:yZJTXukZxbYL1CLqmFi-K-VA4jtb4H91FtgdxokYavThGmmbryKlAw>
 <xmx:yZJTXp202iWWLB8fjzEwXk_ongMR7ANBRFb_3sKD-1BJzpoOXPm-tkiHPgk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 954AB328005E;
 Mon, 24 Feb 2020 04:09:29 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 28/89] ARM: dts: bcm2711: Add HDMI DVP
Date: Mon, 24 Feb 2020 10:06:30 +0100
Message-Id: <08c939ca305d936db002060704f252d026b77cc5.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
 arch/arm/boot/dts/bcm2711.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 4742e1a77a65..1e89f2a810f3 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -12,6 +12,14 @@
 
 	interrupt-parent = <&gicv2>;
 
+
+	clk_108MHz: clk-108M {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <108000000>;
+		clock-output-names = "108MHz-clock";
+	};
+
 	firmware_clocks: firmware-clocks {
 		compatible = "raspberrypi,firmware-clocks";
 		raspberrypi,firmware = <&firmware>;
@@ -258,6 +266,14 @@
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
 
 	arm-pmu {
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
