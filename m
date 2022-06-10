Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4C7546254
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BA011B30D;
	Fri, 10 Jun 2022 09:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABC311B3BA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D1AEA5C01AE;
 Fri, 10 Jun 2022 05:30:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853430; x=1654939830; bh=ex
 5U9WAr+3orm8mt9QtOR8RGefu932UOpf4Uufdw1po=; b=TziDr2NYzz/tRrA6aM
 YjSx9DMrsYX4RFXE2Yv/SWa9B7KKVDWe1zPBj47+UdO+vB5C410UbHO7q/7ugFxX
 9RvO1p7gQZhClQ6kSq5b/dDIJURUfpLa8pssfZi6R8Q48yySKbGkClzbE/acw/7F
 KoRGB6U7oxRc4wItQGnGUJ0kphxi68FPcAV2uLhfGuGblekY7PuggweIr4mavNG+
 hiY3UJnewBZomSc9InQ7MgD+UC0fDZF9jO8vBZdLjLhn/otlCCAE1V5R0NBxenQu
 VcvkkDxZH6UyFS0lnYYgtsbHfVZz4tudMUKn0AtSqTAIzaE2+UBWwJQOfXytXxEz
 /IBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853430; x=1654939830; bh=ex5U9WAr+3orm
 8mt9QtOR8RGefu932UOpf4Uufdw1po=; b=IjxzuTOcymUuldLVAxp/bjxFIMFvw
 CI/7ZE+6lMHU9dR51smi3IpzR1NVofTwHYIh2QTkeoDmDsPB0DDeqfVHM7dThCCU
 r50qTso2tP4FQ/eTOJH8nkDC684zr/24U6ymvC1mUDlDmEvpPQ0kn+KgmzvIjDAz
 Wom0r+oKChRVsClhiAalHsTbaTpiILHboH49rGj5wGqljxrIGFXvkrULJOkyt5v8
 Bth/ns8VTg5b8wXe/ql8nQWDQpvkC/5VyTbmgMSIOh0sFg6wKyoay7OY29LzW9Qu
 hwzOUJtNODMhl8LT/HwD1nTHqXnIdQa9iFb1QjyhmD28eU9gLQDCvaKzA==
X-ME-Sender: <xms:Ng-jYk_XPvRzgemfLIZnWeIe76kFTJvwkLcIgd8JWHjWT0YFrrF-PQ>
 <xme:Ng-jYsvC_LqASei75a_ab7HGj2J31kUciNqpQ-TAlaTNh7_rTsVZRDx0xMwVq3qgS
 uddBmo5gJgVaN0GKr0>
X-ME-Received: <xmr:Ng-jYqCqJUlD9wOXbQ2v4a71jN1g9vhp69aJYl7SDFNGl2urA3hqnQQkXCCVfcPSZ7GXmlIUG1mLmaf3KZCsUCf0BMpzc5PR3FKgdgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ng-jYkfSuExfx7KcXa23MYwbepUl8bRUaGizuThrKC4Q66k-nxWbOg>
 <xmx:Ng-jYpMWVV-NxprRVWeM9AR3sejZrVx6EJOSNZz6yz8_mJODBOXYnw>
 <xmx:Ng-jYulK7dOkv4gz9nsbM5VM5miS67RMUdgazDS_lCzXcd8zirrTQg>
 <xmx:Ng-jYuoX2sUMXXMzRiY6wT__U7jSBuBSjpCj-zTmA1Weik9rG-zo5w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 35/64] drm/vc4: hdmi: Switch to DRM-managed encoder
 initialization
Date: Fri, 10 Jun 2022 11:28:55 +0200
Message-Id: <20220610092924.754942-36-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eb8ff7b258d1..e5b6e35f57f6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2921,12 +2921,15 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	}
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drmm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	if (ret)
+		goto err_put_runtime_pm;
+
 	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
 	ret = vc4_hdmi_connector_init(drm, vc4_hdmi);
 	if (ret)
-		goto err_destroy_encoder;
+		goto err_put_runtime_pm;
 
 	ret = vc4_hdmi_hotplug_init(vc4_hdmi);
 	if (ret)
@@ -2954,8 +2957,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
-err_destroy_encoder:
-	drm_encoder_cleanup(encoder);
+err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 err_put_ddc:
@@ -2997,7 +2999,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
-	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
 
-- 
2.36.1

