Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D8656B6AA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C039B113862;
	Fri,  8 Jul 2022 09:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E26113884
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0D30432009D0;
 Fri,  8 Jul 2022 05:58:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 05:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274334; x=1657360734; bh=Ik
 aOpn5jarciFgx6XMEWwCJZnuogpkqkEdIHIdavP9g=; b=VRqgdG4kaDe8zi0ocV
 25r3VRDGyVr2xGGQ3pZGDPQodhYM6oSI3PSCtWdkRSPoo1/TeSAU/63gkpjYbOna
 7DeJXJCuBdPNu5tsqnlzVYefcNLxHCkRyxSm1VVBXEZzw55hwxu6NlFjsWIhNqPG
 h24b44QmKLENN20LXpu0TAvv2Z5Jt1hz4+MCZwFaaGqSbVCjpvTijiPJxOR88c4z
 O4pLmwV31iv5go6aFD/J+BYqGn1Keo93/Zl5ViCl/ZGTZvLgYFMeDtqk3mnKf7+H
 HFcc9K85k4u0hZhUe2Cqe52vQ+X8yCekA31jVoRP06LB62+MLZ9fEKj+cpjBZqvM
 yCzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274334; x=1657360734; bh=IkaOpn5jarciF
 gx6XMEWwCJZnuogpkqkEdIHIdavP9g=; b=dRI1EKFvEA9vrha9IgHw3JN+hR0LF
 1zA5P9qBk9r6ON2a4WFVRD0b1jC4OY49ipP2ZsIx6Zwl2a1HV72h5zSN7thrU6MK
 77AbZYYzCTDz9uYcSLyofy38VB5B4wUgigyJh4+k35mqIOOzt0PMVELNTvWrzm0I
 n8Uigujd4dVJDuywg8vrNn0LN/tawmrtNggEYWRfRhpfpDm6BakWw9jr91i0pjqE
 D5lkn4nOjGsOqVPML6ECdejFZAuHyVENVELBmL7sVWch178V14t1sO9XMobfLjLD
 i6Jw1frDSRu6YKs5NhoavHhmUfIxcNkJFfKbHHNOsFbm02CnQH2Okwtmw==
X-ME-Sender: <xms:3v_HYoediowtaLDS0MXh69LXOMFz2u9aOcNJEp9SzoXnwga29jSquA>
 <xme:3v_HYqN49vIALClOL3vlQEtnPeJqvHWm3W5YLqJu0lneb-aXgyrp29VpaBDz8OE1i
 crQ1sW5bZyaBl0hybA>
X-ME-Received: <xmr:3v_HYpgn-Gq3_37iJwyG5dXvqa4rDHPJwvA8fkjA8kginxDSDBnXRQp7JIc_-ClgZn-PA64j--1Ii18NJEHONILKekHg737w2nKCyPY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3v_HYt_XPhTiHtqyzD7pS-6SxSo4K9SFeI6pWnjO2346ab1TawF7Ag>
 <xmx:3v_HYksIjLQs0LsuhU9q_QlXz6LlpbPjQhXvwA2rQG1rmSXjUh514w>
 <xmx:3v_HYkGGHd_I4zFALUClim94AE7eSEXz_AMbgYRHJO82bds-YbmBMg>
 <xmx:3v_HYmKD7dqB_xGkFxyXZUUBXwz_Rh11PY29BOyMJ6kl4elaUn06Ww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 35/69] drm/vc4: dsi: Fix the driver structure lifetime
Date: Fri,  8 Jul 2022 11:56:33 +0200
Message-Id: <20220708095707.257937-36-maxime@cerno.tech>
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

The vc4_dsi structure is currently allocated through a device-managed
allocation. This can lead to use-after-free issues however in the unbinding
path since the DRM entities will stick around, but the underlying structure
has been freed.

However, we can't just fix it by using a DRM-managed allocation like we did
for the other drivers since the DSI case is a bit more intricate.

Indeed, the structure will be allocated at probe time, when we don't have a
DRM device yet, to be able to register the DSI bus driver. We will then
reuse it at bind time to register our KMS entities in the framework.

In order to work around both constraints, we can use a kref to track the
users of the structure (DSI host, and KMS), and then put our structure when
the DSI host will have been unregistered, and through a DRM-managed action
that will execute once we won't need the KMS entities anymore.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 38 ++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 13266ff334d0..4f5bdb9a328b 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -552,6 +552,8 @@ struct vc4_dsi {
 	struct vc4_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 
+	struct kref kref;
+
 	struct platform_device *pdev;
 
 	struct drm_bridge *bridge;
@@ -1556,6 +1558,31 @@ static void vc4_dsi_dma_chan_release(void *ptr)
 	dsi->reg_dma_chan = NULL;
 }
 
+static void vc4_dsi_release(struct kref *kref)
+{
+	struct vc4_dsi *dsi =
+		container_of(kref, struct vc4_dsi, kref);
+
+	kfree(dsi);
+}
+
+static void vc4_dsi_get(struct vc4_dsi *dsi)
+{
+	kref_get(&dsi->kref);
+}
+
+static void vc4_dsi_put(struct vc4_dsi *dsi)
+{
+	kref_put(&dsi->kref, &vc4_dsi_release);
+}
+
+static void vc4_dsi_release_action(struct drm_device *drm, void *ptr)
+{
+	struct vc4_dsi *dsi = ptr;
+
+	vc4_dsi_put(dsi);
+}
+
 static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -1564,6 +1591,12 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_encoder *encoder = &dsi->encoder.base;
 	int ret;
 
+	vc4_dsi_get(dsi);
+
+	ret = drmm_add_action_or_reset(drm, vc4_dsi_release_action, dsi);
+	if (ret)
+		return ret;
+
 	dsi->variant = of_device_get_match_data(dev);
 
 	INIT_LIST_HEAD(&dsi->bridge_chain);
@@ -1738,11 +1771,12 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct vc4_dsi *dsi;
 
-	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	dsi = kzalloc(sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
 		return -ENOMEM;
 	dev_set_drvdata(dev, dsi);
 
+	kref_init(&dsi->kref);
 	dsi->pdev = pdev;
 	dsi->dsi_host.ops = &vc4_dsi_host_ops;
 	dsi->dsi_host.dev = dev;
@@ -1757,6 +1791,8 @@ static int vc4_dsi_dev_remove(struct platform_device *pdev)
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
+	vc4_dsi_put(dsi);
+
 	return 0;
 }
 
-- 
2.36.1

