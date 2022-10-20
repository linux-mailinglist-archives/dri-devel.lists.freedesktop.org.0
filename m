Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A7D605AC5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6493A10E5D2;
	Thu, 20 Oct 2022 09:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D60D10E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:13:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DE29E2B05D99;
 Thu, 20 Oct 2022 05:13:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 20 Oct 2022 05:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666257214; x=
 1666264414; bh=CXd9oRopfbOxK5QPR9Spj+UXGsDItKKcc5F0wWKHw/k=; b=i
 6UJC1IG+XOUa9o3Z1Vw95D+pejwL0gY2pexQQMTA7Eq9YMcldKUGo8TjKesqgp26
 98cYnbAJCUiFZDZMsDx2V4SjKHIgTz/6sIgU6JLmvAWGWf7Zl8Vl3F3m3tOuIBwF
 UM0ymR33IlnCHyKcYwjq6lcUVz4wi9KiFs0ZJc8rBrZNOfjG59HoINNF8SfutbFt
 aNSbiTUFgp4szOmktYP9kTTs8q5WtxuvafypzFNLlb3rNs243VfvjxmvO4BNKB3W
 /0JsJ87DlA8EVmuTG5P1Aw2+GOqEF3+/fcveTL/8SFKv7uGQQqzdOfhAc6HZWQ7l
 HUjAoqtYh5m1goW1gPggA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666257214; x=
 1666264414; bh=CXd9oRopfbOxK5QPR9Spj+UXGsDItKKcc5F0wWKHw/k=; b=Y
 0NizKBvjNJtcGdf1cm/4cCM54ku0hv+ZinYWysg9mf3Jc3aU/AKtnE/60pLwap8M
 sRXJqoY7zzPo+a8RK58KDKlrLw6GISd+TYsToWJC+rzABn/9l7PvACbR7rgq5Kzl
 AazX1aqBd5Cm+5PKpNlPWk3hct7DVLSzNgGFu/WxRcZSJpa5d8TFDIuZFxUd12lg
 CTKSN6IDRS2XwfwHfBHItNbSwpLq7pRaR17ZG/Lsu7Qpe0ALq/rrpJCBg2u6OwX9
 cWjFrA7JuPzwbv2IAF+l6al7GZCAjE5XtanKkbk9wormIeDdN8w40yLPRwOixZvz
 jLaGIUkA4kcIkjRK8sLoQ==
X-ME-Sender: <xms:PhFRYy4QDpIH053OmVodSrNk-SSrPzLQn_wZG3hR1KtMTfBK5fnqFA>
 <xme:PhFRY75T5Oh85Grg3T8S3kZX5--wXlsiqBjZcXH8yaMLSAfavhg9V8eP6zgte9Ja5
 BqrtQ0DgKIprt0aGBY>
X-ME-Received: <xmr:PhFRYxe0_DrEbkvKhIl0ZpfFBsRUtGWgFPPrRsdjYEPosmtMtbEqp_f4Leuq9xwS1MXzvgnKbHehbjXZWhwAQy-qyRXUjK0A9K38J_U4KWLlEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhepfeduhfegveehhfeftd
 euveeuleduuddttedutddvvdegkeehleevhfetkeetiefhnecuvehluhhsthgvrhfuihii
 vgepudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvg
 gthh
X-ME-Proxy: <xmx:PhFRY_LDfGP2EkItiK8XeyRINTEZd1n7YE4IUzn2Vo50VRVFDh8S4g>
 <xmx:PhFRY2Kehi-N5tQ-Gom2atidDD2WpXRfbaTGdmFsPHCjU-jqxsBZFg>
 <xmx:PhFRYwwY3K3GdbwBoW2fWtYmGysCvxrSJR_KZk3WFTOwIvkBNbWgoA>
 <xmx:PhFRYyr6ynQ2QFFT1y43Nf6jiHGV7QsJ59iDkvjZm2G50a8hPDRZWjGs5Dc>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 05:13:33 -0400 (EDT)
From: maxime@cerno.tech
Date: Thu, 20 Oct 2022 11:12:11 +0200
Subject: [PATCH v4 3/7] firmware: raspberrypi: Provide a helper to query a
 clock max rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v4-3-a1b40526df3e@cerno.tech>
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Ray Jui <rjui@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3411; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=c1P+fLFDaTroanhyem4W+5lau6usqj5h7iESMD9wvPc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmBAq/2iy4PNzHUl5oysXL242N/5zbPjHNcZszZ4+pU/sM1
 r/BjRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACay4zEjw2etxqTMY95Tw4zbDz7UOb
 JA64rryVXxSUJSEecipm1b6c7IcHQ2Y1XpM7uHR+KZJjXtfvth1/513Cw1jZLb7M9/fmXzmBcA
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
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
b4 0.10.1
