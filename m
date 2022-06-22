Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8E554D44
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087D8112571;
	Wed, 22 Jun 2022 14:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1610F3C5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id AEB0032009A4;
 Wed, 22 Jun 2022 10:34:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908442; x=1655994842; bh=yi
 u3QP8bmQwnsUm9AslIw7oOia1UsIJM2BZlAWc4mfI=; b=r4khKF7yrgaU7SvhZy
 TCd5g/wcetp2OH4Mvat1eGqjHvJKOqgINzsc5uNTMRFk4rz99/TGkZBCoL1QI3JF
 V4sWDtx4McDNyWpUmPZ9To3RxlatDP+Zim7Y5YS1SpEvhtBCsos57n8Uq+Ne+Nca
 vP5K9YWvWmfPFbTvLcuMv4CVREIdnEkV8CqkWge+ASlQ2GoK+d8VrOLWqf2FYmf8
 DYBdQZl3PCNvQBvwvbVaQNqhOi6Wy41UP7Parb9c3/qCqigqm7yX+C7qF/xgVPcJ
 +7fF1RWA09NnAS7CDV5moxW7CYEprR4esqLfkDUvq3f9Cif+NCSEbeFtbaZkNkXZ
 VcQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908442; x=1655994842; bh=yiu3QP8bmQwns
 Um9AslIw7oOia1UsIJM2BZlAWc4mfI=; b=tRRXGJ8Wmb/s4Pq6CS77ZQYiGquGF
 5CQWqSqhDNFYP3IIueAm6k8ay1FjrNYbXUaX4pVR0r5g+n+oh0ov1LMrFdRY+2Dz
 NJfev2J+QKrWdYj2BYI+dLnhsqWaTLSl6m+h05VXFvO+Mh3ZMmq3kBWcijqMKJk7
 7SrEAx1MkOcgfey4ZtB3TM8D4BBFQvSMhRIhP3TV2zUr0RAk2ZupCcY99+T3jKRZ
 5VA6Rkvg/6mA2xeir6kbynNP7Z8f71QjbX7AnoIVwBF1h2KkTo3nJcTSr6nKtq/y
 LPlXYv3jTTu+4KB687hSijjziXJwT8UkxqUNHUrVwdYsNYDMThvZ8oOCQ==
X-ME-Sender: <xms:WiizYsJK680oLgFZvBX_vakIcpqGjl7ZnyFz22LHEGe4tUxwXXnCxw>
 <xme:WiizYsI8J4FJehJLPpFtbhue4pQEYk57Znc_Ldp0ckqqX6cnGmg9WwLnuNBHXyBdO
 8LW8pbjduZzvLIZtc4>
X-ME-Received: <xmr:WiizYsuCg3TR-dg4vTvHj8bi53ktfvMRmZIIqNwvGryDZ7upJz7h89xV4mmdNmWlCs_1xsH9XFE3govAukvGDvH8mel983FpYmVXpJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WiizYpZ-iKW1Er73BF5FQ_38qDLSmMHe2CHaPao367PZ71_lIPj3-Q>
 <xmx:WiizYjZuZB-jWGztH4TIpT1mNb6r3owdf1ESjSdbQrkJf_ugqFiXaQ>
 <xmx:WiizYlANdocKJ7HPHqtrUPNsjYd-jVR7gosP_RvIfCdF2sduiBygfw>
 <xmx:WiizYiVo2wM2Lvy50iHCTZAkqVfagKR0RC5OUcY4QDimvE6K5XhzEg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 34/68] drm/vc4: dsi: Fix the driver structure lifetime
Date: Wed, 22 Jun 2022 16:31:35 +0200
Message-Id: <20220622143209.600298-35-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 40 ++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index b3c97aa11e7e..86d53d50ad9d 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -510,6 +510,8 @@ struct vc4_dsi {
 	struct vc4_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 
+	struct kref kref;
+
 	struct platform_device *pdev;
 
 	struct drm_bridge *bridge;
@@ -1479,6 +1481,25 @@ vc4_dsi_init_phy_clocks(struct vc4_dsi *dsi)
 				      dsi->clk_onecell);
 }
 
+static void vc4_dsi_get(struct vc4_dsi *dsi)
+{
+	kref_get(&dsi->kref);
+}
+
+static void vc4_dsi_release(struct kref *kref);
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
@@ -1488,6 +1509,12 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	dma_cap_mask_t dma_mask;
 	int ret;
 
+	vc4_dsi_get(dsi);
+
+	ret = drmm_add_action_or_reset(drm, vc4_dsi_release_action, dsi);
+	if (ret)
+		return ret;
+
 	dsi->variant = of_device_get_match_data(dev);
 
 	INIT_LIST_HEAD(&dsi->bridge_chain);
@@ -1645,16 +1672,25 @@ static const struct component_ops vc4_dsi_ops = {
 	.unbind = vc4_dsi_unbind,
 };
 
+static void vc4_dsi_release(struct kref *kref)
+{
+	struct vc4_dsi *dsi =
+		container_of(kref, struct vc4_dsi, kref);
+
+	kfree(dsi);
+}
+
 static int vc4_dsi_dev_probe(struct platform_device *pdev)
 {
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
@@ -1669,6 +1705,8 @@ static int vc4_dsi_dev_remove(struct platform_device *pdev)
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
+	vc4_dsi_put(dsi);
+
 	return 0;
 }
 
-- 
2.36.1

