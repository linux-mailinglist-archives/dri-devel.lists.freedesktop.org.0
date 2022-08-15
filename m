Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBDC5931E5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21785CC568;
	Mon, 15 Aug 2022 15:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2A6CC4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:31:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 63C043200657;
 Mon, 15 Aug 2022 11:31:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 15 Aug 2022 11:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1660577504; x=
 1660663904; bh=zDlYuKttoMMva0k5dTZ+8Vb+jrME1/H4pvpISkPn7Lg=; b=R
 7FVtnuK3s2G9UnAjv4Tvy1spq9QYCS+kDbNeymJ9SM4ICGUfu57OJqOJZOur65DG
 fowYJhI+NffD+F07ktE3h9Z4mTFJb0aH6Y646y0zZ2hNKubL/D04X7YlN/tJcBLM
 iykLuLavlKa3m5VQS9EeFr0TCvsqSfoPj0zTckws91Ku5zY9S+s4gAIiFpgMcVl9
 ss4v/GxcX91tVhlqSjD7jofz70opEeCKlURojelEF7FFz/TlVbnvUZXsGzIUSKAd
 Umco9tcz5GqXpGkDSks6MnfBPGmUR7nL4MVmdW7KwOTsoVr+76kSHy5RLFTYzFKo
 8WVdVb7Y+khT4mVysGjkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660577504; x=
 1660663904; bh=zDlYuKttoMMva0k5dTZ+8Vb+jrME1/H4pvpISkPn7Lg=; b=5
 j+uTraAsefqk6eSBj8rukf/1tDHJ29C0JR7+1o+zJiwU/JO41wRaSRiGye7xzVzN
 zEVuZD46kXLgpHfd/gSFGeKE63DyAqYr1vkcpHQpG43Sgy9TIKN05if+tdNdFRRM
 08XKkTvfDEH5NrCCous39MgsVdpZNkcr1RgTdsiH0ilUuPl+vTfWaVdZ83H9ujpP
 3wwCvpATmBqhlVhuzsN9Wo2Mey7O83119WQqgln6ASR0rAkDavgHrU4NUEcR1XHV
 phtokOuru4ztF+7gw+Mypuc6c+C/MFbcp3HMzsShp7AEoCB2WJOmKMfY2c8MGwRe
 xHDWhpdGcjN4JZDYQsLZA==
X-ME-Sender: <xms:4Gb6Yt1mec6Y9AgVjOoKGbHFosWF2OpVel_stgV5vT-RqpBMFTQdPA>
 <xme:4Gb6YkF2zb2J8KQdS9Y_FpRMl2OdmAi5v1Kof562elEr5ZCOvnG_KuE2nmWKktA9O
 L6Hb_zXCJVpmXPovEU>
X-ME-Received: <xmr:4Gb6Yt4XBsIe2pjMMNyaV0UXqholGNggi7oJ9dpxpJ8Nqsclo3QyZz2snV5X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpefgfffgteffuddulefhveeiffffudelvefggeekueetgfffjeehleel
 keejfefhjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4Gb6Yq0Jld-vO3YnvavfI5YwQCaC3X_bO2VqGpM46GbJdjicmhLyJw>
 <xmx:4Gb6YgFR5kbQcfVXWQbktCBmJn6vwb0DSgLa4KFG1aZo0NKOLo6yLA>
 <xmx:4Gb6Yr__qSjLnjG6blGlNr-z-F6l-nwypssaINF1qvO5_hkMuQnDQQ>
 <xmx:4Gb6YmHZaYmRna6xYOIyjDP6_Obp0Qnajcv3jrqNKoXTZmAGT-E0Ng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:31:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>
Subject: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the maximum
Date: Mon, 15 Aug 2022 17:31:24 +0200
Message-Id: <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-a76f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wAQVJMgLbRnifaGUTCUy+ZporTuJb2HjcXq358WgEfw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDEm/0k7k61kV2XhfO/8gQ3a536KV+bJHJz7kVePKS7D+65rp
 vnRjRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZSa8nwT3+X3d6Zs7ROP5R9FyL55V
 S78UeNhIDPbod21As5/7y0eQrDP3tL2XNdthnvfvzqbnsgqinNciNZLOZGStfU/5sTJzTrsQEA
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

One of such parameters is the hdmi_enable_4kp60 parameter that will
setup the clocks in a way that is suitable to reach the pixel
frequencies required by the 4k at 60Hz and higher modes.

If the user forgot to enable it, then those modes will simply not work
but are still likely to be picked up by the userspace, which is a poor
user-experience.

The kernel can't access the config.txt file directly, but one of the
effect that parameter has is that the core clock frequency maximum will
be much higher. Thus we can infer whether it was enabled or not by
querying the firmware for that maximum, and if it isn't prevent any of
the modes that wouldn't work.

The HDMI driver is already doing this, but was relying on a behaviour of
clk_round_rate() that got changed recently, and doesn't return the
result we would like anymore.

We also considered introducing a CCF function to access the maximum of a
given struct clk, but that wouldn't work if the clock is further
constrained by another user.

It was thus suggested to create a small, ad-hoc function to query the
RaspberryPi firmware for the maximum rate a given clock has.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6c0a0fd6cd79..182e8817eac2 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+#include <soc/bcm2835/raspberrypi-clocks.h>
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
 enum rpi_firmware_clk_id {
@@ -254,6 +255,33 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
+unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
+{
+	const struct raspberrypi_clk_data *data;
+	struct raspberrypi_clk *rpi;
+	struct clk_hw *hw;
+	u32 max_rate;
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
+					 RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
+					 &max_rate);
+	if (ret)
+		return 0;
+
+	return max_rate;
+}
+EXPORT_SYMBOL_GPL(rpi_firmware_clk_get_max_rate);
+
 static const struct clk_ops raspberrypi_firmware_clk_ops = {
 	.is_prepared	= raspberrypi_fw_is_prepared,
 	.recalc_rate	= raspberrypi_fw_get_rate,
diff --git a/include/soc/bcm2835/raspberrypi-clocks.h b/include/soc/bcm2835/raspberrypi-clocks.h
new file mode 100644
index 000000000000..ff0b608b51a8
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-clocks.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SOC_RASPBERRY_CLOCKS_H__
+#define __SOC_RASPBERRY_CLOCKS_H__
+
+#if IS_ENABLED(CONFIG_CLK_RASPBERRYPI)
+unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk);
+#else
+static inline unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
+{
+	return ULONG_MAX;
+}
+#endif
+
+#endif /* __SOC_RASPBERRY_CLOCKS_H__ */

-- 
b4 0.10.0-dev-a76f5
