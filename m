Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3CB554D63
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A475F1133AD;
	Wed, 22 Jun 2022 14:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729491133AA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 427A43200942;
 Wed, 22 Jun 2022 10:35:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908516; x=1655994916; bh=6G
 GAvACDK+BbR9Q98DQlVqQqzELr93jEmjzTQEkpjMI=; b=X+OgTkI3NPj1aRO3bD
 454LHfJWmhoS6dAy82g5hyYkY4bZchChPzICeHBThNpSizY6/PV6VHQWYKVdNb1Q
 KDcUk8LuXTFFMiPH3wKcGJNRG8amrmjlaqlJxY8gsJii3Evr0QuelsQ9GD4iuizE
 PeJpb31r1KsrMwVvXTbxfI//lmynrQC3CJvjaUGx9dc72jE3eaNp4dWbcGqLk8BH
 7hWCtVmQELJVrXbHfLTDGZx51rPF4FHm9e7jJ/sAjMgVxG0nMf0cRfgUgAPXSXSg
 5UzimS1pBlHHcTUQgBV7Bb8+YEIktH7wo3pXaYV2E4NukpJxa1NMqGJQPxcUj+2+
 zNAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908516; x=1655994916; bh=6GGAvACDK+BbR
 9Q98DQlVqQqzELr93jEmjzTQEkpjMI=; b=E/mxb4ruuh1dX2J+sQ9vkmTsVOomy
 T+6Smin0j4BLAFpHq+IBlSqS6UgdHHKsKt0E3SSK4kjIDQSWMWCzoMT41tcFE/fh
 iEwXOOvpgi/lpguO/iw/osoSRMleLG/20UucY9wpCoUVnBnRSAhR3/ELG7AlrS1h
 jnQ5XZ+2tTQ9VFURKoDk47f4H/+D9fmqG1yYigcOlDCbiuVJxJM7p0+uwcfW1MIh
 NwzK5S+WnkSCTKl5S8d25FRjsjGC36KYM34WF4BPAc5FIAyfD4UZK3nEAotujvG/
 RqQrDFf6XIe+GI8uSo4gk8AoAHOuhXSD8Yd9UAiAg8yrOTl+DBTqiqTMA==
X-ME-Sender: <xms:pCizYnySUlECWmVHNsDSMLCNQVyLCLPr_HSZD741NCNV9qukyBbniQ>
 <xme:pCizYvTiCaqf2jLOeaQfZgQlVLq-2qlfwDmQBfi-vlYiKKvcL-gvbDCjB0joy0kec
 DyebTuAhEj3xE02BuU>
X-ME-Received: <xmr:pCizYhUybRDTzoZccywuqRdb8wNU-OEtQS5KsoxoGod9RpILXZhaWdfcEyo1pCHkWzXYDaCR9ORicQVccuMei6n5zvsv-JmT5gALUlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pCizYhidvL8S7YjeDUu4h8S0xGcpH1ErRsmW8YSUsmcagiTwU6N8mg>
 <xmx:pCizYpA31vaus_iyNNdjHOXjimQejAae_UdxrlMKVwbu43A1FHznHA>
 <xmx:pCizYqKkxyjMVEAJm-D6t3JEwhGMcj0PjDuytkHZJCQzBIfhURGR0w>
 <xmx:pCizYk8VMkJHRPY_so-kLlSt9ptC5qKUsUAMW-nWkcEYjYL1WXIB6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 58/68] drm/vc4: vec: Switch to DRM-managed connector
 initialization
Date: Wed, 22 Jun 2022 16:31:59 +0200
Message-Id: <20220622143209.600298-59-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_vec.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 518b66bcc0b5..f6858e40ddbc 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -309,7 +309,6 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -322,12 +321,15 @@ static const struct drm_connector_helper_funcs vc4_vec_connector_helper_funcs =
 static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 {
 	struct drm_connector *connector = &vec->connector;
+	int ret;
 
 	connector->interlace_allowed = true;
 
+	ret = drmm_connector_init(dev, connector, &vc4_vec_connector_funcs,
+				 DRM_MODE_CONNECTOR_Composite);
+	if (ret)
+		return ret;
 
-	drm_connector_init(dev, connector, &vc4_vec_connector_funcs,
-			   DRM_MODE_CONNECTOR_Composite);
 	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);
 
 	drm_object_attach_property(&connector->base,
@@ -556,9 +558,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 static void vc4_vec_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct vc4_vec *vec = dev_get_drvdata(dev);
-
-	drm_connector_cleanup(&vec->connector);
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

