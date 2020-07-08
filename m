Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B7219933
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180766E9E7;
	Thu,  9 Jul 2020 07:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401966E905
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4A85A2F2;
 Wed,  8 Jul 2020 13:43:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=jLgbV2zJcDXsc
 OF8tmDfCZC7s9/iU/zmjwoPk02j6nM=; b=UNRqpjMa0L3djqi7ZnGHsNH/ZVGKU
 6IkbWPB74M7Og0hqVKR3gEpvOnmXr4pi8vqLvO+2mb5wxd7L56pzOVabV10EIJp/
 fEKX2zOlFKq5sBW7WR8z7UldtD2t+ZGm5zZdBnYnOWqohkbToOzpmmqgbXbhZFn0
 RaeQOsbMPjjHErNUe8ItgGAV6MQxf7K5f5KsZayx1PtyJRuoo4z+8+NytOyGkHlL
 3qjkdQFTwFT4tPQ0ElsuJxHFk0ZmWkn+Kaz5XJl194n5o5cy35+Uk3HZ33EI8/Q5
 JkFzjfax9MZK8w0oGYYJL/fF9zU1NI7y/oaB5aCa9YHSRVjovi26BsqGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=jLgbV2zJcDXscOF8tmDfCZC7s9/iU/zmjwoPk02j6nM=; b=C1jAAWoO
 T70yXvBjI9ojA8Lr/QOrJNXW1aJ37GvjoBfN+AxhtdD8JaWmFNheIMoAbP3fgnXU
 jWsxrBuX3nfr1pXVZAGlCtu09oCtiwZ6jlfLqGmTw307Yg5fK5z7a3PVNyDrMr0s
 ckLxqwaXkI9QMunUvJn0JFrBoawcgSJALJJWPI2rDEsUFcSQEoyYnlTj8d+iAW5H
 67Kuykou4jEOzkiTIDJCp7mWq5fjxOs/kh359oz/UeaanZelYcQmA1qQla9bvIK5
 mZun9HgOMKpikesRuQTV5sWOc24JFSwvpk/pW94fAosQGGK1cA6FfNPJBESFSl0D
 mswjQHP7q2Qnfw==
X-ME-Sender: <xms:ygUGX2w-282LBQXl6N3P_T7BLeXAQPbo8dAZMKZuJjwQ_MjixilvhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ygUGXyS49BtSGfm0-40J9gKLbrGN3aYrgPr6JUt3dPuyzCjhZWjehw>
 <xmx:ygUGX4UXM7XY8yZrGe8kIdN4wccp8JNlQ9S6Nj0XZ3f_6kqTX3MKtQ>
 <xmx:ygUGX8jtYVcbC_HGiy3fSEJTVrkc-zMBXjz4byBTl7RYFFrviVy3ZQ>
 <xmx:ygUGX2CTTOVokJa5bAAmhgtyrJYqWFDnDf0UIT0x5ejN38VQIBVjJxaVp_E>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 87AC3306005F;
 Wed,  8 Jul 2020 13:43:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 47/78] drm/vc4: hdmi: Retrieve the vc4_hdmi at unbind using
 our device
Date: Wed,  8 Jul 2020 19:41:55 +0200
Message-Id: <0fc40024f73b3bc6d9eba0b47da217ed130c3374.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

The unbind function needs to retrieve a vc4_hdmi structure pointer through
the struct device that we're given since we want to support multiple HDMI
controllers.

However, our optional ASoC support doesn't make that trivial since it will
overwrite the device drvdata if we use it, but obviously won't if we don't
use it.

Let's make sure the fields are at the proper offset to be able to cast
between the snd_soc_card structure and the vc4_hdmi structure
transparently so we can support both cases.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h |  4 ++--
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 09b297a1b39d..7cd1394c10fa 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1200,6 +1200,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (!vc4_hdmi)
 		return -ENOMEM;
 
+	dev_set_drvdata(dev, vc4_hdmi);
 	encoder = &vc4_hdmi->encoder.base.base;
 	vc4_hdmi->encoder.base.type = VC4_ENCODER_TYPE_HDMI0;
 	vc4_hdmi->pdev = pdev;
@@ -1362,7 +1363,28 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 {
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
-	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct vc4_hdmi *vc4_hdmi;
+
+	/*
+	 * ASoC makes it a bit hard to retrieve a pointer to the
+	 * vc4_hdmi structure. Registering the card will overwrite our
+	 * device drvdata with a pointer to the snd_soc_card structure,
+	 * which can then be used to retrieve whatever drvdata we want
+	 * to associate.
+	 *
+	 * However, that doesn't fly in the case where we wouldn't
+	 * register an ASoC card (because of an old DT that is missing
+	 * the dmas properties for example), then the card isn't
+	 * registered and the device drvdata wouldn't be set.
+	 *
+	 * We can deal with both cases by making sure a snd_soc_card
+	 * pointer and a vc4_hdmi structure are pointing to the same
+	 * memory address, so we can treat them indistinctly without any
+	 * issue.
+	 */
+	BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) != 0);
+	BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
+	vc4_hdmi = dev_get_drvdata(dev);
 
 	cec_unregister_adapter(vc4_hdmi->cec_adap);
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector.base);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 749a807cd1f3..d43462789450 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -53,13 +53,13 @@ struct vc4_hdmi_audio {
 
 /* General HDMI hardware state. */
 struct vc4_hdmi {
+	struct vc4_hdmi_audio audio;
+
 	struct platform_device *pdev;
 
 	struct vc4_hdmi_encoder encoder;
 	struct vc4_hdmi_connector connector;
 
-	struct vc4_hdmi_audio audio;
-
 	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
 	void __iomem *hd_regs;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
