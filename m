Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B168854623B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5962C11B35A;
	Fri, 10 Jun 2022 09:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3295D11B292
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F2C35C01AE;
 Fri, 10 Jun 2022 05:30:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853423; x=1654939823; bh=rJ
 jIUMX6P7H1M+JUHX/Fl9WhS68DmVlyYFu8DsGZ4kk=; b=U9cI0+3/qyEQkMkXIW
 z3099OLW73dYhFSsnBVbIC3CNU4dReTmTMHqMYKEaXjjWI6Ti4oVufQgnAjImutx
 DdCXWJHRSMII2HbBWnf8VCEOyowd1GY5H7e8i3btDmpvu5KeDC6CaAGidIrFOtdB
 EurlHVJlgV5NFjb+6fA8M4oKYyKqpLzdlJCp8Ab9cb4hiMbAl7ZNkkvluL+EZq6j
 lfhAFdcCv9cJnZWkrEfiO+GOwmUm3Ve6ldVG2lb/pqYb00zOwRwCzOktyKMktN0Q
 Wc/oVioPDaalUNXpjZE9P7L6hIJ7AwTk+BayQMD81qB6pbh21jNGc+R9nAoy09St
 62lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853423; x=1654939823; bh=rJjIUMX6P7H1M
 +JUHX/Fl9WhS68DmVlyYFu8DsGZ4kk=; b=mpj80SCmhIEasxjqVsdPITRvAbCT2
 WpHsBjOyvIRnuXmgUtdu0nxsfEUH5oOkvrpSCrBRpGR6kwn6oE5gULIivtpefbLz
 ExDjiCTvVfvgVutKL46hct3HkBAO9v/Q4BhjDBNVJGZqr+JsVlE15fMwHE7DDdgE
 WydmgdXjJY9NdcSy66qM0EVQ47qkHJUNacb0RXv+yD3KWIboT7ppWXw67e0zWW93
 ag12aJcjgdsaWJXwhBqMptKMf3GkBxnqEx4p/msUnfcBoMipvB1cJcDIjULVRWim
 CXPtbn9ckVtkoJR/7IhnTTZwNqvxKNwGKevIK5L0lbGdN4S0BPdADka4g==
X-ME-Sender: <xms:Lw-jYrbU-lLsTJbnDmVAyRvufsifu1u--hz2wMa4XId82qT57egCMw>
 <xme:Lw-jYqYxpuMm6d7-mGHUteoDClTvKo0raZCzwoLA-hnT2njhUauvNF35G7xEBZ-Ib
 AvwLhOs83PdwueI2Ak>
X-ME-Received: <xmr:Lw-jYt-fxu5ZEqjyBCieO39CwgNYr7wmmCAoBGleOrHowCYONw4yvzK6gvDOPl4dr7eR8UV6hu2zDBKWP91mKd37UAtuzJ5P-oUtEP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Lw-jYhrYqyY5dJc_AkKD4IdX8uMzB5e8V7wCEIo0kgJUh1cfZwWK6A>
 <xmx:Lw-jYmojjtuZeyKBTR9OBhLK0xx39rQb6GaBZZgf2CU3xXAqAevCdQ>
 <xmx:Lw-jYnTs9EF39BAWXa4rWRnIXrbURJGXaJwHYYsyvpb1eQYT9Pqutg>
 <xmx:Lw-jYvk4tK4iJIBwpO8S7WJKBjh7EQUxJX06RePrNtiZZwHZTPhspw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 31/64] drm/vc4: dsi: Switch to drmm_of_get_bridge
Date: Fri, 10 Jun 2022 11:28:51 +0200
Message-Id: <20220610092924.754942-32-maxime@cerno.tech>
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

The current code uses a device-managed function to retrieve the next bridge
downstream.

However, that means that it will be removed at unbind time, where the DRM
device is still very much live and might still have some applications that
still have it open.

Switch to a DRM-managed variant to clean everything up once the DRM device
has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index bcaf87b43cbd..10533a2a41b3 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1584,7 +1584,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dsi->bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	dsi->bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
 	if (IS_ERR(dsi->bridge))
 		return PTR_ERR(dsi->bridge);
 
-- 
2.36.1

