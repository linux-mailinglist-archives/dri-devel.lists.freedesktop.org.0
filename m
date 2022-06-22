Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F414554D51
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1BC113396;
	Wed, 22 Jun 2022 14:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2557C113396
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:39 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id EE3D732009AE;
 Wed, 22 Jun 2022 10:34:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 22 Jun 2022 10:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908477; x=1655994877; bh=Rn
 i1Fn8Qnip+34qlsS8E4DrGc3e36YPaGEnlsRQ6ktE=; b=bmJtAmhtPf12j8MXcj
 9muILwz0HLOEYoxY58eQWTACCdUUJCVpGfrz9QESwM5eWScu4IzcPZimBF9Dwntm
 v8MHBlA2oAifoPmhRLzi5GAwbcInhAN7B7V2f8ApsvErg1BYvflPN5M3mbyLHmXE
 UJkFZZmoSmuSMbJWmLVRzSNNi5tQWEQtkhmzLmGQfcdbWh4OxTUGqn+/CtWpymx7
 zpKqNBmnxSJO3+u/SLgHc769H5qtJ4SZkyCllwkEIEQeGsPGgghPXb5usKfoQQ3k
 DzUIMOk7VgoE6oION/LnTEHaS8x2YRFM80gQkCiBKolj8fIhy23n1L8ymYBsycWN
 txRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908477; x=1655994877; bh=Rni1Fn8Qnip+3
 4qlsS8E4DrGc3e36YPaGEnlsRQ6ktE=; b=QxWoQoWeacXsvMl8EdvNXMcg3Oj2L
 mXN1dZvOEloGuUo7gIR7/PyDDc2AyAFa5ilACPEF6A7EQLAwAv4V9/Em0fqNTz0F
 Ukm3EsgriYxX88S3lg/reQreKnA5hBRCT/+4YcEH6hhISLfRZWrs2ZImN0GPWbYu
 rVlBMkR+39JXrdnwDUPDEqHDiP0B+tG0a7jRqgHw9if7/8JvtwA41rA6D3Xyei9b
 7Jj9M91zlNNkYiOOEbkSGdwQPQiw1YaQuh0hVO1lYDCuq3/BHZe5zEcyVf+7MZ/5
 Fy2Q23KHwXBHXbuCJOOA3gIfhBHQmu6GXvIyNhatMK80ySwPJYALbsaCw==
X-ME-Sender: <xms:fSizYnus0NT3s2ZzKEm7q-J5_Vt-VXQiopWvIkSi41cnLHynTq4cGQ>
 <xme:fSizYocOKgvkAscZcE7IMfC8geiWDwrzCXAHgWRibcim902m0vZkmwUqBZxcQOrwx
 Eorg6Mo7vMiekgUrCM>
X-ME-Received: <xmr:fSizYqzRyfeSCCpt-fLjMJVszEEmoMohmseGgvDOZfKN2nh7qqyYm6uikxuN9VG__ASPe0DH2zxy7eq1htGs822hNgalIGwuJjM-jXo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fSizYmM6wootEc5ilnvM0Tkfs9tShTKwqYyuEkki4hAYpV55NkSdLQ>
 <xmx:fSizYn-Sr35775nuZj1JSwaGRBa7ef91IILjHnu_3_ZFCWXuIUlQYQ>
 <xmx:fSizYmUWWl5-zu9k2N5yJ5p5clCAt31rLhpCZV64MuAS_vjdkZ-43g>
 <xmx:fSizYjZRn73mG-VwNTYyLwwd4K9NH8VA23gzD7PUc1ujr-Tt8Gy_SQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 45/68] drm/vc4: hdmi: Move audio structure offset checks
Date: Wed, 22 Jun 2022 16:31:46 +0200
Message-Id: <20220622143209.600298-46-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 40 +++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cba51827b621..1729da01f8b1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2042,6 +2042,26 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	int index;
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
 	if (!of_find_property(dev->of_node, "dmas", NULL)) {
 		dev_warn(dev,
 			 "'dmas' DT property is missing, no HDMI audio\n");
@@ -3012,26 +3032,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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

