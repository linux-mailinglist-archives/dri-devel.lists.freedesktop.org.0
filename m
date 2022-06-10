Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1A546239
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2930011B2B8;
	Fri, 10 Jun 2022 09:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693C711B2B8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C96DD5C01AE;
 Fri, 10 Jun 2022 05:30:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853421; x=1654939821; bh=Fo
 JpJts91TAjnc9cQ72PVS+bANSYcIv8qUjWOhT2XXY=; b=GeIXE34/7ERJK+htYE
 Jz2s/JQUPvdArTvAcE3KGLoElozAVbSJraHkOBA2rNNNnRdEEs/84JWC2F0hMrEk
 BF90l9RNgN5G212WIvk+9xAPoCoryV1sRq6j2WuYnArudhgGpK6xiRRjEP1SG+rZ
 KWYZjOiF/g/OUNHsz9SkBZ76y5ZZ1z7Hdem/244/evvjp9Kw/hRT4wEXTbq+HkUY
 DPfegwixlzi8N5eF/73FhQYkLv+3pFz8JjkLilpHE6lTbgWtrJflBdWTbHfdNc7R
 cwrU6aORjGfTLIRhsSjF/ZF95xWYwdPhYYv6Q5WO2HFYzL+XZJaJT4SzSAxoHn82
 VewQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853421; x=1654939821; bh=FoJpJts91TAjn
 c9cQ72PVS+bANSYcIv8qUjWOhT2XXY=; b=qTm3QDOnEwo9c6NQ/GJ+hyQ3x38LD
 FYVJCZCh8GIDrNA1aWqT7A2Fe9D7yG95Mzazza0h0tcld39xGcr8QzM3K9hdzgMY
 n9EK4pgZNBCWnPBaV3j0QAqbCCd27ECBNUIsmfDv3GkV64bGJNSaYcYpotUjGS1k
 m7jG1UGDgy4LD3xTofMJaCseYbKpES2fPlTSBCsqMxg3lv6qSUpDTcplfFKbJne+
 +t2YyTn9+n/sv2Ip2threnkaFaYkLeaN+STi1/r0L4ZO1QC6bAymt6OrpikqZ6Qm
 oggy2mLXEdT6bVktXssucrTJlA5Dwj9O0QMW/QXnITN137c320HjRceWQ==
X-ME-Sender: <xms:LQ-jYrLxWudCnL-UMNXz9TAHZUTW9aAe-0I_fkRlAOqyKc7gIeQ4MQ>
 <xme:LQ-jYvLw7KpP07bBPuVE707gfB2VWnf7dsr1Ot2mkjEyNIQHUi-1ot_dvS45niM8O
 xmO3D2eJyqjphq2npU>
X-ME-Received: <xmr:LQ-jYjtb1Jn70ghnUg2ZYLrzpc1GNb7upPSCIcrohMo9k3YCrWqERABKozwK7re9RfUtmhX4og9_N6tyjLDUXv-GL5kg2Ga8Gs7TeKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LQ-jYkZGqdKG4QZ_Q5fX8tcjpKsdq3SdqmsN8YTD--2Afbb7iaog6A>
 <xmx:LQ-jYiaUAYBzfyYirGFX2kNhlAtdcXEtxes4EGtl-hkOVdR-Q7fOEA>
 <xmx:LQ-jYoDUtPMtnmQr4oXMrzxUyrmMlyWlhOYiJVVkgs4L7Z2A91tD5A>
 <xmx:LQ-jYpXVr7D7hqClxD6U3RtSOeBdKi5wbBchawnqFWwqAbgjDZ1crA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 30/64] drm/vc4: dsi: Switch to DRM-managed encoder
 initialization
Date: Fri, 10 Jun 2022 11:28:50 +0200
Message-Id: <20220610092924.754942-31-maxime@cerno.tech>
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

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index dbb3f6fb39b4..bcaf87b43cbd 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1599,7 +1599,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drmm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
 	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
@@ -1632,7 +1635,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 * normally.
 	 */
 	list_splice_init(&dsi->bridge_chain, &encoder->bridge_chain);
-	drm_encoder_cleanup(encoder);
 }
 
 static const struct component_ops vc4_dsi_ops = {
-- 
2.36.1

