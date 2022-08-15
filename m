Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BD25931D9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A88DCC4D7;
	Mon, 15 Aug 2022 15:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63103CC4F4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:31:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 75EE23200901;
 Mon, 15 Aug 2022 11:31:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 15 Aug 2022 11:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1660577499; x=
 1660663899; bh=9dG/S1pIlNaiOU2NNri/uFIjS8EJ6UrvnFIXQZMn4ZM=; b=t
 WNbA+C7CLgVfKWZuOHmDlSZA+ZoqJ0ADtOuXI3AV3q/ZY0GejbNRgdFY7J3NVdvi
 0OeDpFQECF4L4P8uGEuURbf/o+XHzV5IHBg0D8mXXiW35Gcv4S6q6EiYxc0+NlNp
 xBbKQP1rkhBx1dCo5MTWJEJN/nVscYjACyXF69KMDJAeJRTavrBNNVfIduU8TN4r
 efshu9EKHwvJPGLdE4u6Q3j5iALZDhEJ5twreLgEUAg07+I9rostn/oShK3dl1D3
 DudbQDgFck4+GHz9eNcmiLCHfCNbdajcsqZY/AzddKScra14VSda7FDzubS3YGh4
 GLtEN3eYQgBnR7iCh5nhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660577499; x=
 1660663899; bh=9dG/S1pIlNaiOU2NNri/uFIjS8EJ6UrvnFIXQZMn4ZM=; b=j
 jUJbHv4fPj1HbmuAOnId7hZ7RyNFFl2vBRjicgOwqga/yNMh8sOEIdFEDfTYwgRB
 4Vc6jtFrvnEf/dZYAHPrfWG3dsWIDmmHFwf8UVsOP4uHR5IDfH1QOwJ9cJ5JoJup
 gswGbb42zToDHvRELyd4D5LLTDlRh1IHMwPWw+jrE//YNzCPTZqE9osz6UEZ4Zti
 Pbep3ksGm9gew9TBBjAbHFDxpVQvdJ97qnyDIWoBL+4G59ZV+zUGjbSnZVTfx+Rh
 WMtN1D54+c/UY7ZSUl6ZVQoenuMqxh04uI1b+kd82LcUWYMpQY9TclCEnNINMbE/
 /UhwOYZilz/efW7Vg4f2g==
X-ME-Sender: <xms:22b6Yo9jKnILdZO8QHKJV0ZOGAZ4UBmS-ZNxYx4gjj1pr3JvWDW0Ww>
 <xme:22b6Ygv6SMMIrcwY_egSHprgqVfbbIVgAddKpMEURiJ05PgqO6spkEu5gm3CbPAvJ
 YenHiVAuo6Dc4IqSBk>
X-ME-Received: <xmr:22b6YuCwPLpZYAzfhUoGdT_0fTWnbVZTh_Ka0PEcQc20KOi_rsURIJg3Bg87>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpefgfffgteffuddulefhveeiffffudelvefggeekueetgfffjeehleel
 keejfefhjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:22b6Yof7I2aKhc7peA5SGgnix7LPexScs9PAQO0yiYB-u_85oQ8Ofg>
 <xmx:22b6YtMmBQBf1u3ULacAyDloPoVJu3hI6QOJiAeWsj712Wa-Daavpw>
 <xmx:22b6Yim2fehTxVFLPDE5GSBVJaEr6ksu4VWV6yNyRAEa9NjCMbr4Og>
 <xmx:22b6Yusi7cYfSKhc6C9GBGrW17LGGyeZ5ACXBOkkRq8MUGsYmDXngg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:31:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>
Subject: [PATCH v1 1/7] clk: bcm: rpi: Create helper to retrieve private data
Date: Mon, 15 Aug 2022 17:31:23 +0200
Message-Id: <20220815-rpi-fix-4k-60-v1-1-c52bd642f7c6@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-a76f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=b1A3H6B5SyJxK91Z0ejNFKXqhHgsxCKS0Y2xe7ueH/k=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDEm/0k6o/djEuqNf0iFXvySh9T+f7pwG//S9VqzhKs6y6y/o
 n+/vKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwET+RTEynD8WwawTknH7RwrH3uel9z
 n0J4U3PT7mqJFpvVL7y07ReIb/xea/vy6Um5eizKsSU+fEvnjD4xtstSuWHbo5aSX365Q5DAA=
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

The RaspberryPi firmware clocks driver uses in several instances a
container_of to retrieve the struct raspberrypi_clk_data from a pointer
to struct clk_hw. Let's create a small function to avoid duplicating it
all over the place.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 73518009a0f2..6c0a0fd6cd79 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -73,6 +73,12 @@ struct raspberrypi_clk_data {
 	struct raspberrypi_clk *rpi;
 };
 
+static inline
+const struct raspberrypi_clk_data *clk_hw_to_data(const struct clk_hw *hw)
+{
+	return container_of(hw, struct raspberrypi_clk_data, hw);
+}
+
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
@@ -176,8 +182,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 
 static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -194,8 +199,7 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -211,8 +215,7 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 _rate = rate;
 	int ret;
@@ -229,8 +232,7 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk_variant *variant = data->variant;
 
 	/*

-- 
b4 0.10.0-dev-a76f5
