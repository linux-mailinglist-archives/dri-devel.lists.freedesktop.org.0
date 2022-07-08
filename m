Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C2B56B6CA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99451138B4;
	Fri,  8 Jul 2022 10:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A41F1138CF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 549DF32009CB;
 Fri,  8 Jul 2022 06:00:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 06:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274405; x=1657360805; bh=c3
 p1Rh4+E8NeJFIBMjpjeqXu6/BeA4Ih1QFoIrj2wrE=; b=ArcAe7plXrPB9sWvhG
 PpPEEEcOTMVQ+aTZ1HiyMJRQue5Vhb1elqrv4DQSyBBfAzdb1ZRdsPLqX/PI6eY1
 7ljiORyol/L30X3ReNy23rX7VtdroDGsWkDIm1fwXgHsze3Wlyq8mY8SjJGCtvaQ
 BOLzkzqpVTkEUb8P1YgEIz7sRpe59p7BgKEww/fy1hNF1KXChvEQzDZ3htAdAqr2
 k84mzUrEJppivbqSYopiJXGiB/TREoevuYobXNwnp0vzqZkVnFwlQJySXj3AmaFl
 SU7U/fCpnQIBHBx3nH/WUH6wkonW37J5qeWyhBGhG0FTKmvAtBCRI/Wiul5cY6lZ
 Ty4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274405; x=1657360805; bh=c3p1Rh4+E8NeJ
 FIBMjpjeqXu6/BeA4Ih1QFoIrj2wrE=; b=F0pP8e927dMe1sPfaOj73V3505+JN
 oep4p27AAxf9ZojWeD7klioGuQy8XWlZAZi3/tY500OLNcKIrjB5ZiSjf9ZWrB6s
 dnO9oCXKd7OjoxH/OXMPUop1TOIVg9kcXgXNyxY2tC96MHzvBuuFhf5tlONErJGd
 QJR8MavTl9mTsz1MXTRAmlZQOUtO3QMRhGDQv4oPOFYJxDjJ1YTd6EkONZGQiTi6
 Q1hGzWPSueMgcW7Mdxo8ipPC0ec2faZvtC5XrFmhgmyvnO5MEOz+b2pZq2BBRj+i
 GKXc1c/WIPDgCtZVsvIJnxMHVAoykNkcqNOhdnptmQAjFNB+DOmdLmwkg==
X-ME-Sender: <xms:JQDIYjAcj_ms7SNEs05KyU8GHXkATCCUH1X_h8v9n_zPlpOvhCdsCg>
 <xme:JQDIYpg8eLnHq0HOxM13KI-KDg54X520SSQ5bXLIxYOCDNZWxbg9nWqaV8-iA0cNI
 pPrL8Sk9scW3id6Txc>
X-ME-Received: <xmr:JQDIYum0IqLtrTmXbEr_pvlaeWT3PCAcQoJ4FpxUqdpZF3E7LuPt_G1Thb2WysadFpPnrpY4SpcuhF4dD7N2Q-REnhgDU7FddF13Vq4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JQDIYlzJ_1BprG0lC_OV3q4gC9l6VtIdyQN9WGPuJ01FgcUlOD30hQ>
 <xmx:JQDIYoQo5fBaefQZGjvSoKIvGPN5iPAGqozXDPhZAGbB1WTvEixwgw>
 <xmx:JQDIYoZ0j8aykhSxsCdZ1YRsr7A3AGoxjbhx42AYnwyRqk6oSd9oeg>
 <xmx:JQDIYuNfnJ5NnIOfqHo4On8qtBTWIWKHx5-pFg5-jbwk-V2jnzM3GA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 06:00:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 59/69] drm/vc4: vec: Switch to DRM-managed connector
 initialization
Date: Fri,  8 Jul 2022 11:56:57 +0200
Message-Id: <20220708095707.257937-60-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 518b66bcc0b5..4b843b18c006 100644
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
+				 DRM_MODE_CONNECTOR_Composite, NULL);
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

