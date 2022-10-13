Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A196F5FD6C2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A425C10E678;
	Thu, 13 Oct 2022 09:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6798710E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:13:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C860C5C00D5;
 Thu, 13 Oct 2022 05:13:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 13 Oct 2022 05:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665652397; x=
 1665738797; bh=NbLfsfDu1Gtr2c9qmTrYb//pcpOFa59Pn2YWUwdR2PQ=; b=v
 btCpBwB/dRvHJNh0uI58CDkNB68elf0mXaDTcTgRndoUTf0zCIQeMDtwFrxM8um+
 XwJWnEdsiC5nq5CzPoHkfY6TVE8y1h0mPbCrY7V+JuH9vFurD0A2K4nzhVt0+vhX
 waJUsEwzIlRyZVFXyDSTAIcy/3ONewTOagiq8L5ynmvLk3mrTZwlM/eMs7Ah1zSn
 DJxT7L0b2znlVIRcOmwkOHcmIhwKgWOWo3OZgSL61Q4qMb2qdKmLb8IAE3axLnR6
 Q73dP2H2CZsXliafRb+KFYNDx6NQhifboMeKC6Ium3JJ6hltyb8kOIb5wdkSO7KQ
 imrfWCd8dfcMwFEuvFhSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665652397; x=
 1665738797; bh=NbLfsfDu1Gtr2c9qmTrYb//pcpOFa59Pn2YWUwdR2PQ=; b=T
 PWfBqKrIsFE6oum+0YE5rNlNG508+cLK1ooGcDBMdHx7E5NZZmRoYErukFlsi4QP
 3xgi1gKoZJR0hcplg0V7HkFSwer8XCiQuMVZjvRw1r5sd3cLExrbQgYoZ9K37y4+
 leWarvxWLgtofU0W0xmwzH04Oz+XzjsVgjrASb1R10pVCMwUtsDCoh7IzjYfKpoP
 H+tBLQjw91xozW5dm01eheXGZtvzVdMORMByvGGi75gECCdgwL2WcNFGPAwXv7pF
 1Tqa0ZXQLRqotmapTogf0Xosi7AA8qjAZkvdrTJTOQ+oLoWcu08IuvcQDFsNBEex
 4jhJ+o9VfPdbUbG5cjyeA==
X-ME-Sender: <xms:rdZHYxAI68pXCXXglYqL1L5-UFffOHJzdnMGyz4rc7rPoc2mQNjz3w>
 <xme:rdZHY_jqBia6WuA4jHDtOh7vG8gwPC09ZNyUTci2Ie3h0mN8_swCkn7zMXmjGE0Vk
 mWD5l3MwNAclB69aMM>
X-ME-Received: <xmr:rdZHY8kzDQyMbn7ZlO1-WlYfIKceM72N1oH3JG0UAhHzvPc6Kw1eUnONWNSzOFm0T1TM4QMmyBmtHcVyLXOqRSm1vKOaMcRjxM0R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rdZHY7wOVU669t1po8i_ewJg526jIt7kC76mEnvYNwUmriJXHw6K-w>
 <xmx:rdZHY2TyB58atarGWuYKd9qIE4hh4IBlVxSoxwOYygvo4Dwqd7az9w>
 <xmx:rdZHY-aoPoezv_SwZtqctiul1yxCUErSeBMD9WqB78coG4F7jE09iQ>
 <xmx:rdZHY_Arbk4-qYnD-R38IgCxM3FMPKYGY6XKmnR1IfraCndl1_WH_A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:13:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:13:10 +0200
Subject: [PATCH v3 3/7] firmware: raspberrypi: Provide a helper to query a
 clock max rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v3-3-fc56729d11fe@cerno.tech>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Emma Anholt <emma@anholt.net>, 
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=3367; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=RlOL1ZTsE2adkZajmlAYwbEWoCI8gC05XMJ1fjN2UAo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnu15ZMmB1f+OGOaJ3DD/NDG62OXJho9PnTrrmnjBaasMqU
 TIxY3FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJ6D1lZFi6+Gf0ygvPX4Wtlln+eY
 Lnx/9bRT19U4piEqt+qqocfsnPyNDg1Ovz5+aUr6K1EVMSn5ezSLVI+Bvv+bH/tlxyVIeSNycA
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/firmware/raspberrypi.c             | 20 ++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h | 26 ++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index b916e1e171f8..1353ec2f9b53 100644
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
index 74c7bcc1ac2a..10248c370229 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -154,12 +154,32 @@ enum rpi_firmware_clk_id {
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
@@ -179,6 +199,12 @@ static inline int rpi_firmware_property_list(struct rpi_firmware *fw,
 
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
b4 0.11.0-dev-7da52
