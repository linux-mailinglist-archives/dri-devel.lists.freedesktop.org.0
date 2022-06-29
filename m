Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83FB560026
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42EF14A654;
	Wed, 29 Jun 2022 12:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27C614A637
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:38 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id CA587320016F;
 Wed, 29 Jun 2022 08:37:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 29 Jun 2022 08:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506257; x=1656592657; bh=tf
 TsFHx8KdIQ0w6FFiBbfhqm0WvwV4R4dQn0EotKHSU=; b=ci33s4YW/IG9vh81qp
 zTLO/UshegiiKU59OQnXtI2QGU6lwyXdSbrEtYttq6FM5zgPOgJlHC6ph6uo5L1y
 Hjs/pzcj2YzXP8XGMXhDh4j75ZPv4KMYXIO9b0p+1Cw4+1UJVy6AVJgC7oxkr7n5
 cfNXa6IAPc22u4HUnXA6+nJZRtSHPlEFzlpps4kNLjdElRpT2w3ZqaqkZa/nhnD0
 DPEFiSaPWh8RLWoWajw4Zr0mWQFlJS4N8ZSdeB4EHcJX6zbu3me+0zVfYvVp/O8O
 WfFuPIcjA7xtutjrgkV2kKl0ThPgia6DUkDj1VS+m7QwjTIvzAWRjMTPEuCsrKLv
 4OSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506257; x=1656592657; bh=tfTsFHx8KdIQ0
 w6FFiBbfhqm0WvwV4R4dQn0EotKHSU=; b=iFvczwStdlnCtirmhoxGNamB0tOPx
 qy6tIFal12c++AF3ctSBTHgoqYzFHQc05lVEsWSoRopvdzga5Sqk3GdUngmyulrq
 wqx+BABTQKetdOQ0rC9EO1xqrqgK2/2d6e2Y9nGtLlUr8vu+gc50U4gUBDeIVMuR
 IzDNEFwrT4vnSX0egOQCNM34LqlPw5zIX1AxpTWmpByEbxD+XvOJDlkt3AmK64KG
 J+X8km8aRVo50pfNX8u5ib6BglVSmCF7q+8dNWEHh1v0SJEOrANWYs3DfC1yJuon
 b7pYOqq+mddDLtZfN+ZP3vppi91P8nHpNiHaOgXFf/b8igjKHmVhQw5RQ==
X-ME-Sender: <xms:kUe8Yr4zBRXDbBhC6PV-5pAOLbEXcLI2U0mvIagNZEoSOsqRvfEmag>
 <xme:kUe8Yg7Y0V7AWWu-XfJI5KO_1jLLMPi8mN9ztfztQEvEBAASwY0NE4CAj4kNNulvy
 xAy2yhm_eQooTVOYR4>
X-ME-Received: <xmr:kUe8YifqvS_az76XHSMy_d0iXOVXVfXBvR7Yq-30QCSCJIRG9iWFRu1U-nrwblXze2hQkg8UZ_xGPiM-0xn2BS1H3VGduoK-3EOr7Jc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kUe8YsIoE-eM8l5FDeXaW_eGbgg6xxqOhQgDGv8ZK99dwOP-kkQ6cw>
 <xmx:kUe8YvJq4qQzgxh9_Nv7ZKIvEgCM5VtodQmdNEqAhNs-fEiYQJ1ieA>
 <xmx:kUe8YlyRe5QTKuZOpBmrX2MccjbsrNmJGzOSlDY4o7KrYcQm-TgTsA>
 <xmx:kUe8YsHwIwrKKNheOXvDJToGOhEncpW4Zn--sasqeM73l7NF70Lzjw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 48/71] drm/vc4: hdmi: Move audio structure offset checks
Date: Wed, 29 Jun 2022 14:34:47 +0200
Message-Id: <20220629123510.1915022-49-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
index 6275db463afd..a130b7d48e46 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2076,6 +2076,26 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -3082,26 +3102,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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

