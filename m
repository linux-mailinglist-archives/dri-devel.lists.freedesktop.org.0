Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE25056B6BB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060191138B2;
	Fri,  8 Jul 2022 09:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352331138A9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:28 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0652C32009DD;
 Fri,  8 Jul 2022 05:59:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274366; x=1657360766; bh=DW
 ZbYLi0cjtGubYZuuuGmcB1bDLcI15DQrOzNP6kQek=; b=P/UjsaXyCQp+mQkRq+
 WVrSyE8JW/ueQ2DAbVuF57RhKgvhrEagvWlMYNw/aQqs0fAH6ggU5KVGdM+8oC0t
 5ey8PloOREl0oi42aWNZ3Wy+p3oJ1E4PH7WwdszRPEyT0ev7K0cIo3he3SI5fmX3
 +iKTVrnBJF+0bj58LfaGsp3hD5O1fTdDlR15kOlkKF1zeY7hDugvkbu2Npn+CDfj
 aBjVFsfq0OGhE1DO4ZI+Rn6fZgWMtYnsH89j1y6A0OyJ2KZAEw3OhL43zLt0Ow+n
 04YyK1chrI9qn/8fSGLMyRqyoEfUrtccYjfw2LazDd2zJpFUfCMKDCKQAhCjh2xm
 aSBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274366; x=1657360766; bh=DWZbYLi0cjtGu
 bYZuuuGmcB1bDLcI15DQrOzNP6kQek=; b=Z85MVzFQaiiGTpMqKTb+owkYBddyU
 /zcqp/qmgFqo3IOmVU9lskm2uELE61Bq5zGwdtpfV4i0QusURWGCI9H1l1UUxzwy
 ue6a960kpsF1/eXv9S+ePOCYzQmS8/xiolDecyadaXqTBoKuW59hJ51eDpCckdMM
 Rvy2rJpHPTLWMiEC1wd5e6PIrxwhCuXb4XwkW4aZ1D7jrUeWiW8I+5s9mGOVNszL
 wWV/RnAOaFMDxJTdUqf4hpEUpC6hXPwtFUoYDGOmkn+mlVdNGlTl1JsdlNEnv53Q
 BiYSoeuNCahXIqA5I/ArqhAs/8hXgX3C+8YCAR8p4C+R+AQcGdLCBaiJw==
X-ME-Sender: <xms:_v_HYjH3JpuXJgQhS4-5BmkYE0KzHjoqpCXvHlXRb0Nvbju9QK2yKg>
 <xme:_v_HYgViz7jFoTO0fbq16NZymEtHrDWCM2bV1hJwoACIxVC310Tl-EpUV3iuNTFqw
 g6B79GDblXvDfYeSq8>
X-ME-Received: <xmr:_v_HYlKSWazNGqQ9IAvz7ctfhroLAf0t6k-8ed9vV2RqwV3NzKmsVjVOt-Pcx24hcwIg7ngtA8fsFoTxinwmlKK-sxtDEgHnIDfHkkc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_v_HYhFlFCDbYLBVP_IUdFl4gXDtbjOWpIeAyWBS8SpWf6UnsOpRjQ>
 <xmx:_v_HYpUSbCFEXs_9hcLk5BSyARLuP6kwhvSh5Ulq40lf26VvXVIV2A>
 <xmx:_v_HYsNj-CtUkTZtC_mwHm6vSeiYI8k_oujn0YzNCn-2WnPBJLlIdw>
 <xmx:_v_HYvwQ-o3RMXj3tCA0lOWFZvF3v0LWewcjxe5ycCqkfnlbfrRgWA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 46/69] drm/vc4: hdmi: Move audio structure offset checks
Date: Fri,  8 Jul 2022 11:56:44 +0200
Message-Id: <20220708095707.257937-47-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI driver unbind hook doesn't have any ALSA-related code anymore, so
let's move the ALSA sanity checks and comments we have to some other part
of the driver dedicated to ALSA.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 40 +++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 514253fa26fe..5676fc499c16 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2077,6 +2077,26 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	int index, len;
 	int ret;
 
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
+
 	if (!of_find_property(dev->of_node, "dmas", &len) || !len) {
 		dev_warn(dev,
 			 "'dmas' DT property is missing or empty, no HDMI audio\n");
@@ -3083,26 +3103,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
-	/*
-	 * ASoC makes it a bit hard to retrieve a pointer to the
-	 * vc4_hdmi structure. Registering the card will overwrite our
-	 * device drvdata with a pointer to the snd_soc_card structure,
-	 * which can then be used to retrieve whatever drvdata we want
-	 * to associate.
-	 *
-	 * However, that doesn't fly in the case where we wouldn't
-	 * register an ASoC card (because of an old DT that is missing
-	 * the dmas properties for example), then the card isn't
-	 * registered and the device drvdata wouldn't be set.
-	 *
-	 * We can deal with both cases by making sure a snd_soc_card
-	 * pointer and a vc4_hdmi structure are pointing to the same
-	 * memory address, so we can treat them indistinctly without any
-	 * issue.
-	 */
-	BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) != 0);
-	BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
-
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

