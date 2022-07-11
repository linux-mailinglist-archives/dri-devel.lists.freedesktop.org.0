Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C8570933
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3656590343;
	Mon, 11 Jul 2022 17:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A979035A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:01 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 54FD75C006F;
 Mon, 11 Jul 2022 13:41:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561261; x=1657647661; bh=DW
 ZbYLi0cjtGubYZuuuGmcB1bDLcI15DQrOzNP6kQek=; b=VJXZpH4Zn7Y3axbl5X
 m8S8ZCEgMSuG8056b6YH0Gyiwcpt2tGWbk5y2UutkK//v4hms6pOeLiWHpyDsP1x
 6QEdp4SZP2rOXD+tNHxhPqG4CvhV5fHhz0oNJOjyz0xi0RJ1zOD4s78R/0rmi0ci
 haBBWJPd4OY3C8jGiIPzsKtO4hfsE+TRRbTcl85MdcNNffCcQX57Bkbjk2h43pOK
 JKKuCAxRRSE1CJS9BmDJnLMP23OVF1CGvSMLeUuA0KywpnmjNnYUrgdSYyh25pLl
 MRdxpNB4DiXfo0rp4pfFdpT1Ooyh4drah65dPY/5pdF48Ua0ZvEgVI9ByCjOlXoM
 8VNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561261; x=1657647661; bh=DWZbYLi0cjtGu
 bYZuuuGmcB1bDLcI15DQrOzNP6kQek=; b=aW6xXsmz658Vbz/KS/GvJNQ0qlCaQ
 iUT0tCWepGdoPLyLDaezC+QfFuxer/zd/73jgcmvYw2C5ACbsMbaDj3k8a8DqNGN
 TNOPvHFlFlz9Y/j8d0VbMbQcsfcdt9PyoGpQpq6pJEGw5KBnETYWU37FzX7bskDE
 He0uh2di8k/5uIJIw1omYX0nrudUmeDgpEwA5Y5YMj2GUx6n9FD59yUYnnlKhKmo
 P+/lNhyo9EvvpWuVUCABJ2lz+ZqBAtj48P+H7CQGgV4506WJX9SqV6xpIBpGMcA1
 P9TgMjeFg6vfBpVjjqu+iOoDaJg6TBD1dyFVcqfqaC3mjovo58kcYGO2w==
X-ME-Sender: <xms:rWDMYtyrIRre-dInhoEj1PpO4H3SHWbX9Pu1vOc68XwtxLGwt5h-dw>
 <xme:rWDMYtTwg98LjFlHstpcLY12SWat3eSjlmNFfQqRsi35ZcZJApIbndgjEPI6XYvGr
 MCOrxsBcS1Sfd8MzGI>
X-ME-Received: <xmr:rWDMYnVaXIg9n-yFZ08C4242_wDg-3yeu7wLib3PqnH6NvD_svR36fN9lOhWqailcwEZMh60sBlk3VlZ_MK9s658kHKonyXo9clYXPc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudehnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rWDMYvgNVyeaNvoLk-I3ObbzaP82qTtI3ULJSTLVmE2IvsFsP-5eIg>
 <xmx:rWDMYvCGgSMinKaTcOUYr0v6UN_o3KEqcZRNXW-aLoJhjRkW4d4n8Q>
 <xmx:rWDMYoKwiINf-Cq6Kdy8gTpkVSmU6ShCkTcnO84ud8RTtTuD5b1x6w>
 <xmx:rWDMYq_Pxlwns4AaW7Y3WQmm3sWERK6mpYAMeOI5cDcqFxw29n_ydg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 46/69] drm/vc4: hdmi: Move audio structure offset checks
Date: Mon, 11 Jul 2022 19:39:16 +0200
Message-Id: <20220711173939.1132294-47-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

