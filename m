Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0635BE65E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 14:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C4810E1B0;
	Tue, 20 Sep 2022 12:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911AE10E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 12:53:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 734EA3200A22;
 Tue, 20 Sep 2022 08:53:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 20 Sep 2022 08:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663678383; x=
 1663764783; bh=Oiy8kIrWntAe9Yt5cwgH+aW2cgmJxqz4HocKaGGRcNk=; b=E
 tkMWkXgpBxKlSbUPsQdMtUQkgHXbrfmVUzOzgUsXr3G/U3+V+fqnIh/aplPBbnDS
 VLcF10RAHeEpSUqSNvGc49/Nr1rjIf2GVdweXmr8DeRmUQj+TQQ1b4vf/tFwyUUT
 6If//qhRUHQqhUMhgUWkpbbSI35uEbB136zoeF7u8VYThjhyX+iLYLgJW2YLpbkh
 Y10DRcXEPf+FPg9uH6VUvubWCcuaGt8GlRLyaVC8sF4SXSPOS603vT4ik/XIrQww
 LOcwHlDsWAXnd504rQxNJhePvi/QRTvA2jXhST8Rap9xOAbWiwawuLJT4sWUI340
 KfUFdnENO84RyfVwxlrrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663678383; x=
 1663764783; bh=Oiy8kIrWntAe9Yt5cwgH+aW2cgmJxqz4HocKaGGRcNk=; b=o
 kuWE/2f+d5a8axPLZGdphHCAsCZAibP0zhA604Ws1qeI0zobNK2SHDfhgEqn88t1
 oNLHU11GnGCl31eZHH1Awnm2CVMx1T6mzkX9Va6hNvmWgWGxCjszRXpeDVR8RnYf
 cAq+AwSZJO295NyZz5OiFUAxg5J/XV6EWBR1YpWQ6OFmH6DmFytyiTvJn3EMHYKu
 pLqdxZ+Eafzocs6FYe3PO9310ifSZL9tZ6C6BktjO87uzxrzZ7TuIrzPdiN9DLoW
 +d/CWwc0NhBrxtFv3I+IXunCdmQcQptvr8lGpG3fHr0Luohr1gEGQth4eoglR+zH
 e1lvAJxTJUGL+npPIqeLg==
X-ME-Sender: <xms:r7cpY-4VxxMohQj58tkAYoFk2LBr0JNdv8MOCxth96ukRCzQrEvVvQ>
 <xme:r7cpY35G1iwkZtHcG23i5J1OWIuIlXhAUGbIXOwyTEQBctq39KSflXP8GpfWsm8U7
 JjRY4bzegkrOOw1TBA>
X-ME-Received: <xmr:r7cpY9ePGdJqsETkNtaeZqBz-GH6wkzf5McSkEMoauvLlmf1jCr-TpMqW0dH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:r7cpY7LUNL1ARVlteTRhJzM-RY5hRtcGilppBoFIEWmA79su4tBmJA>
 <xmx:r7cpYyJA8rL8UTxMTcHBlGT0SNSs51zdc91ILQ83e_RJ2wSJP_LctA>
 <xmx:r7cpY8x2AvMLQ2oa6BbycyBzt28PWRTvnQkTzK6RVOotZwbZvn0GkA>
 <xmx:r7cpY34FvMCVBkiUO7xEQdsRG6JTyaP8Nd-mPSZXU_vpmyOejakDuA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 08:53:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 20 Sep 2022 14:50:22 +0200
Subject: [PATCH v2 3/7] firmware: raspberrypi: Provide a helper to query a
 clock max rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v2-3-983276b83f62@cerno.tech>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Airlie <airlied@linux.ie>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Ray Jui <rjui@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JMjc9vTvD3H2O1YtnTvuBs8PHnlojILED71Z9PcUCZo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMma2/ncKlKnsvlVbvHoLpr69asJ88cXN/68mjtF7o39cre1
 s8z+dJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAil4MYGTZXnd5UHKNXUhTSuGGO+Q
 R/t84VDr+ik/VsD9W0yXsWtTAy9CTdmbzNV6I8Kvh2pvrljQ1B/451nfkdtfhZQvepSQ0fmAE=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The firmware allows to query for its clocks the operating range of a
given clock. We'll need this for some drivers (KMS, in particular) to
infer the state of some configuration options, so let's create a
function to do so.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index b916e1e171f8..c4b9ea70f5a7 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -228,6 +228,21 @@ static void rpi_register_clk_driver(struct device *dev)
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
+		return 0;
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
b4 0.10.0
