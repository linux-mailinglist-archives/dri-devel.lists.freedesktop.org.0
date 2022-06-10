Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E745546256
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6471A11B964;
	Fri, 10 Jun 2022 09:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22E11B30D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C99B85C01AE;
 Fri, 10 Jun 2022 05:30:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853442; x=1654939842; bh=5e
 ogOCvkZyyF/dlXFgFZGhMVItWUA3MWf3tmxrt4sdA=; b=Wo1omUm6c7yPBxxbxn
 1nNTh4udWIb2f6RDIX1+3aEnpo+0seH9lfTFbH3gKl/Y6HXi5O6FJHwz7aeRICY2
 sJEiWC1w3CjpHDAHDL5N1msoy4g3WBUt99as1LfeVE3LBiTKGWc1yRRg2Z4e1Yaf
 boP2twjGoZayBR5+8/4z9YJ7yihRtQE5iqQdW341p7gqrR0vnpmym7tC+Sii7rt9
 zOrGf/KiL77L5zypgwH8Ij5r883EiGhg/4MKKmerxcLnK//aq/FagxUJKSmWoBBH
 psud/ixull6Q/3JMKDk2qTKgItYMtxQXWVmf6t/G7GHIFPVW+6gZh/+QEqm3ExPy
 j2nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853442; x=1654939842; bh=5eogOCvkZyyF/
 dlXFgFZGhMVItWUA3MWf3tmxrt4sdA=; b=dGUXqrucsaJksxgVve+iA1lkIPSYN
 8YU0AqSCawRWk3P+VjEYYtkd5XFKY2m1HgWuyLutmK4RjqN+Zy5I/hTV5bpTAg/Q
 GL3wGLipMFpMn+/DwAOcjqBqdu9VSp9Z3QeVab06dPsrhiTFWs5IsjSkLG+ZqFg3
 Wa+XqoVjaixpJ/bPfKcRiTLuqh2mbrEtlOJXGYqFxoJQmMjktwHR3AobjvEAxgVS
 QVoB7dR0FZKKq6r8pq+AxnuM7GZqBtrIiY4OptK8FQjSsXoWN4HaWEg0zcVXUWWn
 uRJE82WM3Lh9cpPoIkz2D3ioUj11Qek5CjEhxdzEA8iTTVzeLo12vnv5w==
X-ME-Sender: <xms:Qg-jYuLiPmmxdUvIPw_WlRsaj_NyYbYL6r_K3eZ2qtw8Q4VMAoFoUg>
 <xme:Qg-jYmLC67tNmhS-8muCdfcwxSqLOCGSci19oAbptoe6sbto64NaLsTNM7wtr6mYe
 cnnBiPpLKSnke1OpOA>
X-ME-Received: <xmr:Qg-jYusnvvm7F7Sioy9xhsCUuu5puqBmUOGyoyB_0JOOBxgJHfPFBKZZDs_x0aEFEE0crsW7jSHIu-NTS6CKyoIghRab1DLqfRI7_m8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Qg-jYjaNWwmWQu4f7yPMdkbZfAt8FUbbMqIzCdfGeBf7FWPDo9Y4Dg>
 <xmx:Qg-jYlZo5XrElUFWtif-Hkuv5pqZ1cviCsFt7oComKR5nVIkm3gQrA>
 <xmx:Qg-jYvBMmbM1kB3Up4IdvseyIkTMH9827XZ9o2PFLJPENl1YiLxw_Q>
 <xmx:Qg-jYkUDP0kV7mKyzqZZRTYIqDii4aMuffPHArO_N27VbLhNjz-AaA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 42/64] drm/vc4: hdmi: Move audio structure offset checks
Date: Fri, 10 Jun 2022 11:29:02 +0200
Message-Id: <20220610092924.754942-43-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
index ca0bc8be3e6a..814517c1fdaa 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2041,6 +2041,26 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -3006,26 +3026,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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

