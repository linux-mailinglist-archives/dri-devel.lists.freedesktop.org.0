Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B80554D32
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684D311333A;
	Wed, 22 Jun 2022 14:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC4C113358
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 15995320095B;
 Wed, 22 Jun 2022 10:33:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908415; x=1655994815; bh=BB
 s0uJewNrT0bWZEQZBt8oZUQDSEinjlcCS+QPJFnEg=; b=Ui2DASVODQbtRrC5xe
 AXyn3UPxfPpihK/aSS1FF4IJkUZVFHiM8nggX+Yz2U0y9yuMMJztnx+IEQGhD1f4
 I6jGc+QV3cxHVy14kWEZhKKZsWwwU0p+rtwU0dx9vnaeQLAh7dDyvXj9NhMmUmmJ
 Fldquu4Z9CdJ0koweCZ/CH4ps71MQwevL4u43y9mFlaeTCfXlfYUCKyBhnMSOrbJ
 soubeAVhiY6prc+HQ2NQ7aak5l5z23UgNXSp3cecPsXdat90X9pGDwmfy1N4P+aS
 CCLkV3WEgDKNx7JM35xdWnMdRIUPVwdG8bIThhzR4UAHj/A+O//mKb7nGmjLagQ2
 S1Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908415; x=1655994815; bh=BBs0uJewNrT0b
 WZEQZBt8oZUQDSEinjlcCS+QPJFnEg=; b=dlSIhWNt/zyyC7nMo1EtoiN491J6G
 GjwjMx7T1kGjm6tB02HlYUtbfGwxMDtgWfJAl+c5XxNPbwZpYU2vvyafWZ4MeOYl
 gECasazDhf388DH1Dya+QnL7wXGW/9nGAt4xvzSnf6Z5W9IvEOy6rwA93OQeYCb6
 LyVho+N1NjI/DsB2/tl5J9pAdpeWfiB/5gznZbcyNgWagIICr3DihMaVslkXV++u
 vAJ+AWbdTgnD6Q0nhRQdE04H1gCw9U77gle9waxf6z5szpxG5mOTBj3bLq+m4os3
 CwKV3f+EsRvsMTmxNTodpMxf/d8et6nTEECfdmLsgHmwf4p1iVN1tNAew==
X-ME-Sender: <xms:PyizYuswfPMkcaVBLIvZbTwlnrO9DVXNiu_-ApB5cyuod5P4aKWZ7Q>
 <xme:PyizYjcSbmqdcHJ8y0dHUm2p2HdnIWw8rdkPU74Y6LsPr-sU59Nwq5X-4eucl_Htw
 bVyv23CFMxC12RY-Rw>
X-ME-Received: <xmr:PyizYpyDT6lVeaTtPH31s-rtFiQ4APDk8SD3Q3gJ6vS-kzYUMAsfXzKkrS_sUKqb-1vAA1M1YvlNdB7Oj16hy-SCWn9kWxaoAPyiTFo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PyizYpOdzGfbIVAOU0iBR2lc4CIOq_NJ5u1dtxcaxcBg43Nvh3gn_A>
 <xmx:PyizYu_teAH3LnecjFYuXh5zoqJTf_INTElrkwSje_OaUFnWdS6JYw>
 <xmx:PyizYhWlfGExwgaP9wm3jDnbwny5TkmaqgkWk-NHNcQY7NAqEYpHWg>
 <xmx:PyizYlkK8bciWGWO9KCsniDvCOArH1pi6xCt7uU8wa0zGyLHZDEVtQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 26/68] drm/vc4: dpi: Remove unnecessary
 drm_of_panel_bridge_remove call
Date: Wed, 22 Jun 2022 16:31:27 +0200
Message-Id: <20220622143209.600298-27-maxime@cerno.tech>
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

Since we have a managed call to create our panel_bridge instance, the call
to drm_of_panel_bridge_remove() at unbind is both redundant and dangerous
since it might lead to a use-after-free.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 658e0aa9e2e1..5a6cdea7bf7b 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -309,8 +309,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
-	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
-
 	drm_encoder_cleanup(&dpi->encoder.base);
 
 	clk_disable_unprepare(dpi->core_clock);
-- 
2.36.1

