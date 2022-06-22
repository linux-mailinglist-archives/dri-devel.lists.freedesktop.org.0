Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1705554D31
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D5511334C;
	Wed, 22 Jun 2022 14:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A71F11333A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E86A43200974;
 Wed, 22 Jun 2022 10:33:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908412; x=1655994812; bh=gm
 4YkPFtQ7bttqoLDmivtwI/hvv5QQb5ESXiaG7HjB4=; b=JSRDvVV8VKgPhr3Q/B
 JGl6AKqnDXpe6qGj0vhDmGIQhHB1q/nRWq/4Gwe0jACLnhJLupl7fsJfKqBlfx3c
 /vnXUrbDiigZBDgE/TnWrosVwx8YULyOXdMmuEDX3qv7lpOWXi21oe6sSIaPUcg0
 qaNq9vUAS9lwFO+b9cZ5gqbdBvcU0R4I4DwSQJ8+ZgAE6jrAkWnXYXETd8VtRALg
 OdLK+kgM1+itagLx7QHdb3mmK9XiiVGv5JACjjxDtM4/RujrloFi4Rh2+jJYvhyS
 Qd2fbFZxl1Z+ckEfKpPg+mmL7d3Hbyz3Y9wXbsvVr2u5Ezkx9sNRchURVQBrcBW/
 81PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908412; x=1655994812; bh=gm4YkPFtQ7btt
 qoLDmivtwI/hvv5QQb5ESXiaG7HjB4=; b=bLY2PkZ37BBMNsy5iPnDasjRyMSSk
 Lie6SdprGXR556L/7OOhy2XHzB6wN6UTYMCmGi2RfV8xnO7+RUaK9oAXlyfko6Kz
 Z9HP8as9Y3PfrQlNprojKX4iRR0s5pKfNNfu5X59i3MlvT3btoSWTewJkd84YmO6
 yjLwvTJchBKvX8iXST7w4nu+0yjhz55T30bochJdRma1te9F+K/HXOPnrzML528i
 iPGkqJ/lkd1xPwet3dZc1pnPO+IC+J48aHfaTBtQ79tG2GOnACPvZ3b3pk0iBSK9
 zjHxgsJpFurzUFPOXjtJ7m+wNlt1vyeCxEcCw/3SG87fp19Bo5b+zPS3A==
X-ME-Sender: <xms:PCizYiAGxxveopmdsYU4KIdPiYSaAA-UuMK-ZRh9_qTd5I2oB-SrVA>
 <xme:PCizYsh3tFB7FLmtv7O9kwc5knnVAu7Cs1VcmZzUxKe_2BAIY1oAaVKPxkWYPDwnj
 DmN20rIU8KMynqf_bE>
X-ME-Received: <xmr:PCizYlkINVTnlunCCF1qIhtlUXmaAoZ-0E4O3aK4CUe298H2Sfx_zLogOILVfYl1iBRqzDfAiGnbSZwrBkTl3F6mhMJBoXWX1xd78Ak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PCizYgzwA6UIo3KWWJjhvqd7laBN-_Ud5WP3v0JG-RmjswbKVYYSyA>
 <xmx:PCizYnTBq7vwUFSZ7qtC3WSU_x79Z5lvVYlIbnxG9B-ttQruUdx5gA>
 <xmx:PCizYrYyxqcEX0d9KKk4GehxUV8fnpllDntBHAOrWYDSw1TuuRDWbg>
 <xmx:PCizYoIjAuV5-SwwBUySCCejxXwDAlQNyiQL70Tci1wn0p9-ZmtGsg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 25/68] drm/vc4: dpi: Return an error if we can't enable our
 clock
Date: Wed, 22 Jun 2022 16:31:26 +0200
Message-Id: <20220622143209.600298-26-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we fail to enable the DPI clock, we just ignore the error and moves
forward. Let's return an error instead.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index d1eaafb43bd1..658e0aa9e2e1 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -270,6 +270,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 			DRM_ERROR("Failed to get core clock: %d\n", ret);
 		return ret;
 	}
+
 	dpi->pixel_clock = devm_clk_get(dev, "pixel");
 	if (IS_ERR(dpi->pixel_clock)) {
 		ret = PTR_ERR(dpi->pixel_clock);
@@ -279,8 +280,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = clk_prepare_enable(dpi->core_clock);
-	if (ret)
+	if (ret) {
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
+		return ret;
+	}
 
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
-- 
2.36.1

