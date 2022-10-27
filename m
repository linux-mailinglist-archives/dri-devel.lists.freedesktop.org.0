Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572AF60F818
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D50610E620;
	Thu, 27 Oct 2022 12:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2BF10E612
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 12:53:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9402332000EB;
 Thu, 27 Oct 2022 08:53:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 Oct 2022 08:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666875180; x=
 1666961580; bh=M4cZVZMdHrGM3dgJgg8ZzTElmizmUMuCVd2iPJpLh+Y=; b=D
 v6pgb9+inqit7/Frszc1IuFVE7i7yxsXEj1OGjE2dBKekwppALVlqLXZUqcMuTib
 akhgGFpO/pJUAJyfgFkTBJHZBNindP4CN6jkjQH1n2oA4DVXIHVGKzEQmeGcWvF+
 EHE1CYT1CG1ANqJ9Dzs29LzHLlblwCr1mnH/3JB8teCq3m8AINI7SaOT+9DXq2LY
 04cU+jJyXfvY8fxWAiE+lNoEtWGlFmB5r3mhnKtTUSPjBnG1Mh/I/9NsKZm/nn03
 /Em+/7mdNcT/HQdfURKd2BiSNOXZX9aKTEgC2T1cOLhzzYSYDW1AXHRq4sh4aIV/
 t/Gg606uKYshEi36al9/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666875180; x=
 1666961580; bh=M4cZVZMdHrGM3dgJgg8ZzTElmizmUMuCVd2iPJpLh+Y=; b=P
 wH1+NkYb+2+z8UCXckRe0scrSUeypIGDcmhPO3pb3RyWny6waRsWSY5Abyi6OZKg
 Qre0FtNUK5+dUIkVPydaZd+g5v9FvMkTRPdrgxXiOYlBKs1zwSH4HwBCAdKQdu3W
 BwGPGAPyDoVgGThBjfYWXy7Q5iKwxRNTA6pGPa1I9t8oR1PcvrBPK2hL9YnWehaI
 3epaiv1ZyFMSPuNncrAzEbrKdsmR4eXQOcdof1XlGmKOTlrnkgOgjd8ds5N5+CR4
 uXL5CmNyk09bBQgPXrd46L62GJFoTUEaYiiJQfXcL2uERh2L4OurScSxUYyKlh36
 w68WcmXH73HJ94yXjiwQQ==
X-ME-Sender: <xms:LH9aYwLoSrFpXTgNkHaSX4k0MT11fec9zOneoqDyMPuAK4npcfnuMw>
 <xme:LH9aYwKxJK9Kv433tZ8AuL-VZWur5_DzwruiTZRkwmnr1k7xZ37VkIj9La8fvrg5Y
 GJkz3t8MbXcr8L1lLk>
X-ME-Received: <xmr:LH9aYwuC32oePD2Y0j3sRg2222p6rz3MjlbVt9BDGjljBo8wNB9L_u5YV9_HoBRDgniwgwRqarRdBtje5-GAzMnSCmfOOcveYg47vysqm0BK1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LH9aY9asBwHRlXi3Kfseei4zvTGYwZUyjJLIIkbA32EQtxzPW6519g>
 <xmx:LH9aY3afGHtc7GEqpY-tR8mCoslBwMGIMj894dGC1bDgVh9AlpjAqg>
 <xmx:LH9aY5CFbl4gqxYwqHGjV5usJ2hRG-2f8EZ0M3nqt40wA2VTUH-5tA>
 <xmx:LH9aY9t0_7A0qUqOoyNk60MwcnWUPHKqcD22qUpxU_uoxPNJVVkNjw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 08:52:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 27 Oct 2022 14:52:43 +0200
Subject: [PATCH v5 3/7] firmware: raspberrypi: Provide a helper to query a
 clock max rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v5-3-fe9e7ac8b111@cerno.tech>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, 
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3421; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=i8zuZRYvFTmqHB/fMLg4yNxTy48bnPG8xFxkfaIhP/A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlR9TIygU2HPdwWZs5Zozj5/oO+01t4zxsL+8uuib/pp9sd
 bBXcUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgInoTWJk6OH+2nC1ktX608tpVucXZ5
 j+OXSam1vhUNKeSPGsq+8tghn+Sp9r1DU/eejXmkWTZv8Iedt7KTVUW+So8bzSRduOfbq+mx8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The firmware allows to query for its clocks the operating range of a
given clock. We'll need this for some drivers (KMS, in particular) to
infer the state of some configuration options, so let's create a
function to do so.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/firmware/raspberrypi.c             | 20 ++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h | 26 ++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 932a8bef22fb..b15aa6fce0e9 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -228,6 +228,26 @@ static void rpi_register_clk_driver(struct device *dev)
 						-1, NULL, 0);
 }
 
+unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
+{
+	struct rpi_firmware_clk_rate_request msg =
+		RPI_FIRMWARE_CLK_RATE_REQUEST(id);
+	int ret;
+
+	ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
+				    &msg, sizeof(msg));
+	if (ret)
+		/*
+		 * If our firmware doesn't support that operation, or fails, we
+		 * assume the maximum clock rate is absolute maximum we can
+		 * store over our type.
+		 */
+		 return UINT_MAX;
+
+	return le32_to_cpu(msg.rate);
+}
+EXPORT_SYMBOL_GPL(rpi_firmware_clk_get_max_rate);
+
 static void rpi_firmware_delete(struct kref *kref)
 {
 	struct rpi_firmware *fw = container_of(kref, struct rpi_firmware,
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 9b1db12d013f..ab955591cb72 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -155,12 +155,32 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 
+/**
+ * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
+ * @id:	ID of the clock being queried
+ * @rate: Rate in Hertz. Set by the firmware.
+ *
+ * Used by @RPI_FIRMWARE_GET_CLOCK_RATE, @RPI_FIRMWARE_GET_CLOCK_MEASURED,
+ * @RPI_FIRMWARE_GET_MAX_CLOCK_RATE and @RPI_FIRMWARE_GET_MIN_CLOCK_RATE.
+ */
+struct rpi_firmware_clk_rate_request {
+	__le32 id;
+	__le32 rate;
+} __packed;
+
+#define RPI_FIRMWARE_CLK_RATE_REQUEST(_id)	\
+	{					\
+		.id = _id,			\
+	}
+
 #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
 int rpi_firmware_property(struct rpi_firmware *fw,
 			  u32 tag, void *data, size_t len);
 int rpi_firmware_property_list(struct rpi_firmware *fw,
 			       void *data, size_t tag_size);
 void rpi_firmware_put(struct rpi_firmware *fw);
+unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw,
+					   unsigned int id);
 struct device_node *rpi_firmware_find_node(void);
 struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node);
 struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
@@ -180,6 +200,12 @@ static inline int rpi_firmware_property_list(struct rpi_firmware *fw,
 
 static inline void rpi_firmware_put(struct rpi_firmware *fw) { }
 
+static inline unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw,
+							 unsigned int id)
+{
+	return UINT_MAX;
+}
+
 static inline struct device_node *rpi_firmware_find_node(void)
 {
 	return NULL;

-- 
b4 0.11.0-dev-99e3a
