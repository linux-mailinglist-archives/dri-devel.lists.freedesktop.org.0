Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888D5001B0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F74110F15B;
	Wed, 13 Apr 2022 22:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6854610F15B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B5DB05C029F;
 Wed, 13 Apr 2022 18:19:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 13 Apr 2022 18:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888391; x=1649974791; bh=r6
 8Xnm3H33EQgdbz7LYraAskJdNQ1ivO7aFZEAoIKAI=; b=i1JMYe+VYvdvr43zkv
 rDuNGZ58Ro3xDHMyKyBN4OnEAlxiHGLPtCA4+O4bdMEUCj14lZE8046cnZCJ9jnD
 8DLeXDbxxpqVN2xqdlD4cKBi3N/KFWK+l2jmNrrj3TD2wIAfJcE+PH1IyjO7KMkA
 5h+nsE12K6BGbwmLolsUNvj7e1/0ZVxxEcd2LrhvLve6b2Hd2ZGPkb10J8DTfg1N
 n/4Il/14MsUqiF4LmQ15q2tSfeI+3eEab/HWqd5/OY5Bttbjkf7zkhJtr37YIF+d
 1/S+sHJdKWT9rxKu/K2a0xb/s1bpv5XsegcU6zMXBylPARz6LyaWebpxLNBunYxI
 0qYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888391; x=1649974791; bh=r68Xnm3H33EQgdbz7LYraAskJdNQ1ivO7aF
 ZEAoIKAI=; b=oJmZjkvbs64pHexVyL74MFyo9GHxVwHCiDfNn4xRbkQq4HDfreq
 QStpQ8heF6cB14ziPQPfc/GPgN0wbD6qAgc8KvyZjnTrDvsTtUFzBqRiKW81EBu1
 7K2TUQ8fm84JxB/xtYY2MvqGO3ln2axczz8UPpfY9/kNAb7Zw3hl9HyYGFK1U+lD
 2RXkZTz9/V3qRhIRgvqtU/VPh6ZWwm34BSY5LkJn7y9cw5IwT08i7kHCgzmZj8oD
 QecYDvudLylKTpyEDTqNAIpHTwMelF+BocUpWdFy1MT+BPSQsEJrx1ew9ksbQS0Y
 akqFdJqTkcpdv7usqoKqzH4oLDWqxd0mNTg==
X-ME-Sender: <xms:h0xXYr_0kS_F0wycl6-5Oe5zb3iylMP3AjT5qD2-O-CDdemnxZUqPg>
 <xme:h0xXYnvrEu3BVvUcrngelESvvNLqMaJ94oUD81ZWqQNT0dWLoNEgk5_LsTKQMvdyp
 vmJEmrSB5VtgDm9tA>
X-ME-Received: <xmr:h0xXYpAdY6cBxnSldvsjmitlYMaIIvBgkB21yxcYqv9qLombZaeMJMp9uuJHQYFP522krfsjECkdKeY3VnSsviy7u9nuzb1kG5JmdQLGm3Ww5H0u1Y34WmKMSZ0Te3pCLIiuKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:h0xXYndiZrcC_2nDLoKdaqIpEktczpH-hXSLG887NJidp0Dsd4RfVQ>
 <xmx:h0xXYgObBkd1TDUaMvi5vg8La8vBp12YPY5uVC65iPvkKxi5cBq_cQ>
 <xmx:h0xXYplOvy4QEZxBl-r2Ea6WdGZtASpsnB1gqNovxZxul-bTqK8VaA>
 <xmx:h0xXYvM0kgTVrC8H6SQTFQi8hJNrZQEQUyJIaApc1MO8MsBDCEndPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:50 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 15/16] arm64: dts: rockchip: rk356x: Add EBC node
Date: Wed, 13 Apr 2022 17:19:15 -0500
Message-Id: <20220413221916.50995-16-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <x@xff.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RK356x SoCs contain an EBC. Add its node.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 7cdef800cb3c..58c26f240af0 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -508,6 +508,20 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	ebc: ebc@fdec0000 {
+		compatible = "rockchip,rk3568-ebc";
+		reg = <0x0 0xfdec0000 0x0 0x5000>;
+		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_EBC>, <&cru DCLK_EBC>;
+		clock-names = "hclk", "dclk";
+		pinctrl-0 = <&ebc_pins>;
+		pinctrl-names = "default";
+		power-domains = <&power RK3568_PD_RGA>;
+		resets = <&cru SRST_H_EBC>, <&cru SRST_D_EBC>;
+		reset-names = "hclk", "dclk";
+		status = "disabled";
+	};
+
 	sdmmc2: mmc@fe000000 {
 		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x0 0xfe000000 0x0 0x4000>;
-- 
2.35.1

