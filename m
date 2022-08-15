Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71F05931E0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9C6CC4E4;
	Mon, 15 Aug 2022 15:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D517990187
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:31:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 9FE1C3200657;
 Mon, 15 Aug 2022 11:31:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 15 Aug 2022 11:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1660577510; x=
 1660663910; bh=StVI078uHa9LEWnG3+gzk/1OZCUwJHy0Ly4XGqnb+/8=; b=A
 hmnCyQSp2Jtlf3f0dUI9MLEgz8E4A+RnMruBEqvpi1pTfcmIpsymmPJjwGlxq874
 /j7vA+OkJXZi3WjEybSDzv4LkLm9+ngQlBDxzAB5/RM7gOVKaRJPiZT7C0VcbVNc
 uzTS88yipsohfEqFV5n02QPobU0tWA0OA92i93DvMgxBzeNF0mtnNEmVxXe9wR7A
 CWeIa6ubrpeYxfz3mjiW3NucISW2VEVuELBwvT3bIA+me2pHP878+iJOBnq1hpUM
 xD9jblTpgzp0dot/nUZMilqS93AyMgjZM3ENQX8oK4HJqEK/xN3lDLYRMWNhX6AH
 YnnmADwgazbDkBPS8Ymaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660577510; x=
 1660663910; bh=StVI078uHa9LEWnG3+gzk/1OZCUwJHy0Ly4XGqnb+/8=; b=x
 zf6+KwdZoTkI4sr5gdPdwmWq6puivzVW91VyGhdHMhmjG1oh7/FX7TnGT6uaGdrl
 scZ40hTOh4246dty6a+d1x3J6YiyfR2BvqxOPVXWIlNjvENDeHFqbsmLxv97KZa7
 speKtRpDy2pIPp1jSJaavH9YdK+k6RfIBf41ZkOPxZudVaFgMdM++xx5FFaQWFQU
 7LL0uAvKk53Rbn/RNAaZs7KnpE9d73aqXzr7a8rW5LuVYRJsaj1rxcvGbqbSQYHH
 uibeijS+jxyyiwvixZBuSE89yRKTerscMYzhKecLcmA4uJegAnge4fDeRZDezssk
 mMkIPrMsX0L8b/zkzjHRg==
X-ME-Sender: <xms:5Wb6YmIxcMm-0vIoeaYApC3pQ9yQWySv7FdfcOiCqsrunEKqN-oy6g>
 <xme:5Wb6YuIucVuUBZQaIgo1UmcBFe_3AvAojbO2WnmstuC4fXY0HSq4r6b2S5wL5ZAWd
 qWz65A5w3nlCBWqJIA>
X-ME-Received: <xmr:5Wb6YmtaCMvps0IGvEbbiQtWrIJFxqAqP8SC8-yi4f3V-IZ1l0LIVmrqG6la>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpefgfffgteffuddulefhveeiffffudelvefggeekueetgfffjeehleel
 keejfefhjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5Wb6YrYNUl0Pkqv5jVjyp_ESJmGPx4_m9nV5imoP9lbZGC2QLR0h2A>
 <xmx:5Wb6YtYeTShHVu37PnbkwTfO9NgzNBYM0e-gLFumIx6USbP60_CjLA>
 <xmx:5Wb6YnABufQPmFB9zsT44q5Wgwftqf_YIoJ395UvXlJT2crMba-I4A>
 <xmx:5mb6YmIXdAepp2aZ3CDuQIQUyUVhuavDWCvSzyKVLGRsR0heSFpvyA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:31:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>
Subject: [PATCH v1 3/7] clk: bcm: rpi: Add a function to retrieve the minimum
Date: Mon, 15 Aug 2022 17:31:25 +0200
Message-Id: <20220815-rpi-fix-4k-60-v1-3-c52bd642f7c6@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-a76f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=2926; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=G3fWEKQi3f54XxrlPgabVz9v9R9wr1SUhSPhe0bvlgw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDEm/0k605p6aNW1Kn0mO0c0wnpXmJtGO1//sMbHvW6XBvVvS
 wPZORykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYitZLhf3b+ltdrHxiefibZ36F0qr
 vepvigPnv9Q8nLHxdHrqjVmMHIsMlnxkZOh5ovH5YxJG+891R3yYsL6yM/TMu+ff/SdbkkaVYA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RaspberryPi firmware can be configured by the end user using the
config.txt file.

Some of these options will affect the kernel capabilities, and we thus
need to be able to detect it to operate reliably.

One of such parameters is the core_clock parameter that allows users to
setup the clocks in a way that is suitable to reach the pixel
frequencies required by the 4096x2016 resolution at 60Hz and higher
modes.

If the user misconfigured it, then those modes will simply not work
but are still likely to be picked up by the userspace, which is a poor
user-experience.

The kernel can't access the config.txt file directly, but one of the
effect that parameter has is that the core clock frequency minimum will
be raised. Thus we can infer its setup by querying the firmware for that
minimum, and if it isn't ignore any of the modes that wouldn't work.

We had in the past a discussion for the maximum and it was suggested to
create a small, ad-hoc function to query the RaspberryPi firmware for
the minimum rate a given clock has, so let's do the same here.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 182e8817eac2..b81da5b1dd1e 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -282,6 +282,33 @@ unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(rpi_firmware_clk_get_max_rate);
 
+unsigned long rpi_firmware_clk_get_min_rate(struct clk *clk)
+{
+	const struct raspberrypi_clk_data *data;
+	struct raspberrypi_clk *rpi;
+	struct clk_hw *hw;
+	u32 min_rate;
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	hw =  __clk_get_hw(clk);
+	if (!hw)
+		return 0;
+
+	data = clk_hw_to_data(hw);
+	rpi = data->rpi;
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
+					 &min_rate);
+	if (ret)
+		return 0;
+
+	return min_rate;
+}
+EXPORT_SYMBOL_GPL(rpi_firmware_clk_get_min_rate);
+
 static const struct clk_ops raspberrypi_firmware_clk_ops = {
 	.is_prepared	= raspberrypi_fw_is_prepared,
 	.recalc_rate	= raspberrypi_fw_get_rate,
diff --git a/include/soc/bcm2835/raspberrypi-clocks.h b/include/soc/bcm2835/raspberrypi-clocks.h
index ff0b608b51a8..627535877964 100644
--- a/include/soc/bcm2835/raspberrypi-clocks.h
+++ b/include/soc/bcm2835/raspberrypi-clocks.h
@@ -5,11 +5,17 @@
 
 #if IS_ENABLED(CONFIG_CLK_RASPBERRYPI)
 unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk);
+unsigned long rpi_firmware_clk_get_min_rate(struct clk *clk);
 #else
 static inline unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
 {
 	return ULONG_MAX;
 }
+
+static inline unsigned long rpi_firmware_clk_get_min_rate(struct clk *clk)
+{
+	return 0;
+}
 #endif
 
 #endif /* __SOC_RASPBERRY_CLOCKS_H__ */

-- 
b4 0.10.0-dev-a76f5
