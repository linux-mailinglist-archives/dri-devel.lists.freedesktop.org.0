Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D34554D4B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1566811264F;
	Wed, 22 Jun 2022 14:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B470811264F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8992A3200979;
 Wed, 22 Jun 2022 10:34:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908458; x=1655994858; bh=Qw
 g5YeyacFNh2ycM6ZUtrVNbwJV0rlsa1hK8h1W00T8=; b=FKjfcb0VwhzHafYAPF
 OLREjUZBfVqZxJ5XnnhygEg8LMDmN4T9pvSPPeQSPAIIivyG5FvSq9g3d3BhSbUs
 pxfEfQNfjoleJnj8rNVC4RSANnHD90+dy6ECVOU8kryH4MaP2YKrdVxz9tnPGtUK
 vdkivsjRTfNPO2CqGKeH2/pAD025Q9heXTD7CxzgFgbCywXi5YAs9s7k/lWTt8JU
 uL3qiuRnMlZDdTy1hjIAjoH2nffIyXpHh8JNK2G9OmlA0gHv8qxe5/pP1kr13/P3
 +0R0+rHDxC1T2zsK5BNUqF5l6eu68i7qTMk2OJDcvGyDIWmQfB8B1crakEj6ui3I
 HGyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908458; x=1655994858; bh=Qwg5YeyacFNh2
 ycM6ZUtrVNbwJV0rlsa1hK8h1W00T8=; b=Y/SWI0atDpUGDv/pfb1yPhJpwi3zO
 P8562/yXSJ79Bplq7849VS1EBEDlfcpKoQB4hAa0Epv9kQ//D2/WGzAzjF5Ot+8N
 A6eg+PxKe5vLLnbZLVgbfxpCkYFssr4wl8UmiQN1lNTZkw0aWcb0k30gMfC3fxdV
 Crg/wUVmY0ZpvGEOaAWlpuJ5+g+gxeNmkkvyZLOdKGav5pq0goZ2sp0yAy2ENLrH
 BPAylvlJA76rAWvIj0N7LE3kwh5Bl75aoEjlZJ4Z9Yt9DSBGU6DflJhzhiHZZ4oL
 d/LBxf8EAnH5U63KsKK4a834bdxWcYGvjpELR1xSUvBxBxXQOdCZqYqQA==
X-ME-Sender: <xms:aSizYkBdfwxhkBggPU59N1ZoR6Osz-sUP9lRMUVxNQuDEKox4bFznQ>
 <xme:aSizYmhQ-H4nqOiiohg2UzUI4LHmhSjATIUYAf2SnnvtOksosJmyv_094dzabDJoD
 T1mrPj-0z9xw8r5Zc4>
X-ME-Received: <xmr:aSizYnkEOG8NS2xBmVMW6Lt875vfTur8_7hKR75phK9WNGX0QEbOg61UBo_rIm2b6_3llxEDVCpBzXiPaVQ0qT5Jl4pchx5UFHFVztY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aSizYqwJTgFjIaNAwcFXa6mlV9RJ2lhEreFUy5FkK72lKk8SAAwJlA>
 <xmx:aSizYpRqvvnLAFb-OthNP_K07Zm4c_nU_4qIjmURUyZsHOw3Fs0PRg>
 <xmx:aSizYlb1KoMsBEGJWKhzNuDE43WM2Hkgsl27AtaMnRbDHpJd9pB-WA>
 <xmx:aiizYnOa1RfOAYbJHrWNd1MST5n5WuCNrMhU4y9vW36qG8OLLKn2hQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 39/68] drm/vc4: hdmi: Switch to DRM-managed connector
 initialization
Date: Wed, 22 Jun 2022 16:31:40 +0200
Message-Id: <20220622143209.600298-40-maxime@cerno.tech>
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

The current code will call drm_connector_unregister() and
drm_connector_cleanup() when the device is unbound. However, by then, there
might still be some references held to that connector, including by the
userspace that might still have the DRM device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 592f85993a80..2d1f87f89994 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -363,7 +363,6 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -381,10 +380,13 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	int ret;
 
-	drm_connector_init_with_ddc(dev, connector,
-				    &vc4_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    vc4_hdmi->ddc);
+	ret = drmm_connector_init_with_ddc(dev, connector,
+					   &vc4_hdmi_connector_funcs,
+					   DRM_MODE_CONNECTOR_HDMIA,
+					   vc4_hdmi->ddc);
+	if (ret)
+		return ret;
+
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/*
@@ -2931,7 +2933,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_hotplug_init(vc4_hdmi);
 	if (ret)
-		goto err_destroy_conn;
+		goto err_put_runtime_pm;
 
 	ret = vc4_hdmi_cec_init(vc4_hdmi);
 	if (ret)
@@ -2953,8 +2955,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_cec_exit(vc4_hdmi);
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-err_destroy_conn:
-	drm_connector_cleanup(&vc4_hdmi->connector);
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
@@ -2996,7 +2996,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-	drm_connector_cleanup(&vc4_hdmi->connector);
 
 	pm_runtime_disable(dev);
 
-- 
2.36.1

