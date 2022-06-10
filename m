Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C6546245
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DC711B36D;
	Fri, 10 Jun 2022 09:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A9611B292
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 72BD85C01B2;
 Fri, 10 Jun 2022 05:30:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853425; x=1654939825; bh=Yd
 +oOZ36zi4/c/qBWOg40qqMaDw5bRQm9O894jMggCA=; b=z9Nus1RA56PiXX7KTg
 wHQvu8VNV6DHGIZxlQmGg+iBMKLeVyNlcBw6LWDwsEQ98Us/Z3Ld4a+BJN/36WIh
 ouRhffSOeDbfwNpfUzvCXi1f+78k8shWzEk2w2X4ojz89SFqbKqx+UVdhLydlDq4
 MExmq+9l7HDV1JaI0WY3s/Ju4WA6FMCblLp+E0Gs8tQwPYfncW9LMQeaxXBE4sB+
 8Z2zvJQEBikQedqT0vE9h90tLDOThy41X0Z9Xc/Ivg5owFusgn6eCIFpvXTSJpIV
 Ar8Y3UHcFKfvuVf+ZEri3l7uLfDtysZW+4apSFPjBV9n3RlZtPYjoy0DirU3z5rV
 O8GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853425; x=1654939825; bh=Yd+oOZ36zi4/c
 /qBWOg40qqMaDw5bRQm9O894jMggCA=; b=LTEgfIpLKZ5MfEew3wsZjmG7+dnMR
 ZZ5bgmK7VQmBWOrNxkhnciLXb55fQoTP+t38qZcpTJE4muFBkx95LUMKReT6UCic
 murtxcWju03zVyptkv/RlTgA8cae2K5J7ofkoAnQHZhi9Y6z20DNvtEC2+JNYb1W
 EOt0WtWRe/8XE1PttMxKemZtneM0GXSYjSqbwu/9OsTdHBjr7NQnD4SFc44wsZ1U
 7m94Y+o1e/uQtuSLylEcxQqctRGBbnYYfcP24mgsJ07wUHnc1y4lf+RMpjUS8Mt7
 gSQ4c/oVCZczLg0Pm1G3Q/QYEbZvh1dVHwI+nRwj67hxT9KWsIF8EWmhw==
X-ME-Sender: <xms:MQ-jYoMPoO127f3kcBiuND9jCjkJMLTGZu3BknNBYP-Rd1YCbTKtGg>
 <xme:MQ-jYu9o0ClLcRcvixBp8bW8KfrSRUwVaxh9jkiHHB2XAEs5GZNRZ2VyEPiUgVOcF
 oRTKZOdRTfKfSZKWjM>
X-ME-Received: <xmr:MQ-jYvS_twFVAmHnFbLXr6k0Ym3mvCT1Vh7huWpccPZxnnSqcZXIbcYTSqepCRT8ji1X8WjB2COUGyAXKtgaC7AtYZ-ES7fjHXssD3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MQ-jYgtfhaMlR-FaYpy0MpOrAWOfFuz4xNuXXSRQNxmG1UG23ZyiEA>
 <xmx:MQ-jYgcelddaeUUEF-ZA3UhMW5XuMyVWwA0cLFk7QvN56o2peWiQuQ>
 <xmx:MQ-jYk2v0gQzXYzdLSP6rKwkptowg0_wZQUkIAFV2tmoOuKhCw3HNw>
 <xmx:MQ-jYv5shNXMYHke9xUjkp8tSVCPILxme5EnUno7jhCUBmocdQ0r9w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 32/64] drm/vc4: dsi: Fix the driver structure lifetime
Date: Fri, 10 Jun 2022 11:28:52 +0200
Message-Id: <20220610092924.754942-33-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_dsi.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 10533a2a41b3..282537f27b8e 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -510,6 +510,8 @@ struct vc4_dsi {
 	struct vc4_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 
+	struct kref kref;
+
 	struct platform_device *pdev;
 
 	struct drm_bridge *bridge;
@@ -1479,6 +1481,15 @@ vc4_dsi_init_phy_clocks(struct vc4_dsi *dsi)
 				      dsi->clk_onecell);
 }
 
+static void vc4_dsi_release(struct kref *kref);
+
+static void vc4_dsi_put(struct drm_device *drm, void *ptr)
+{
+	struct vc4_dsi *dsi = ptr;
+
+	kref_put(&dsi->kref, &vc4_dsi_release);
+}
+
 static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -1488,6 +1499,12 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	dma_cap_mask_t dma_mask;
 	int ret;
 
+	kref_get(&dsi->kref);
+
+	ret = drmm_add_action_or_reset(drm, vc4_dsi_put, dsi);
+	if (ret)
+		return ret;
+
 	dsi->variant = of_device_get_match_data(dev);
 
 	INIT_LIST_HEAD(&dsi->bridge_chain);
@@ -1642,16 +1659,25 @@ static const struct component_ops vc4_dsi_ops = {
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
@@ -1666,6 +1692,7 @@ static int vc4_dsi_dev_remove(struct platform_device *pdev)
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
+	kref_put(&dsi->kref, &vc4_dsi_release);
 	return 0;
 }
 
-- 
2.36.1

