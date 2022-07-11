Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996257092E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8707290333;
	Mon, 11 Jul 2022 17:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0B190319
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DFCC85C0152;
 Mon, 11 Jul 2022 13:40:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561242; x=1657647642; bh=Ik
 aOpn5jarciFgx6XMEWwCJZnuogpkqkEdIHIdavP9g=; b=vKr/0VJmgyJnnlSrPj
 nGlubwOYlr0wEMKGgq80QSYocTtXSXvzqlFWotiJRLL3aZhxZ02FIDjQE0O1Sbcs
 Txzum0H7BsDgnXmXY4/yej2nEuHPqsawGKKFVRY1T7BpbXAdvLJDWArfC9TwruLO
 D5wWr31NgOe4L29GEDnpGwAq32Prj+dyUkcsUvAPoL5gEZjaSPK17CLLRl9sAErN
 7A1+EB8Bcwh+UbOE1NWeRMMJjsKSO+ecgmPW3dfS90npbSrfMY6DDqH5QDKgpPe7
 gRv8xbca6/mBry4iyFrRdwCdkW5jp/O7HfyUvPVcou+RcGJLO5qdxiBLw3tkaB+r
 l+FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561242; x=1657647642; bh=IkaOpn5jarciF
 gx6XMEWwCJZnuogpkqkEdIHIdavP9g=; b=cEVT1mTROVs5ALClmEqQv/msWn6kY
 TYBCpvQx8B7veelleenk6ZKcG/bDVAzygCF1vFjcUVX6gzv1VS3KewBxzPMgsSnN
 3BxawRKQTfAFIA45rZPWrlGXXjnBEsga2VQZxfOZfZY4HKK9QuJfaPkoktRa/ppa
 ll8Nyxo1jahIm+Xqna30B2aEPTavMXXKyNfyXB1fzCjsS2pdQGilNf4hVeP6hR/Z
 FTGRA1meG2+gCAluyNQE4XwhI0iJbCfFlMRksLY8e2ibY+y6F/0j/W1FX7m1VknI
 CcyYbpxDpao6O3zOrOdMmCJSZ+zJz3sx+plOWhWc8s2XvD+6wunXB5YnQ==
X-ME-Sender: <xms:mmDMYjSyxohlCAdXQt2on2hYmH4fawti9v_clnFjxy22vR6-EgG5WA>
 <xme:mmDMYky0mmgmTHH98qy6CUPX7hofN5INGHDrBHN2i1wVDdc7nUm_Y0rcwbqph9zsb
 qB7Ymk54JVCUfQa0wU>
X-ME-Received: <xmr:mmDMYo1kS50_NTjHnAU0xMihAi8w72s9mVx9AU-0OZ6kUi9dz665OgbIrw8_q9kopGaNZCm6LwApduqFbzsTJis_2abKW-Af_jwiGU0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mmDMYjDqT_KelEOir-pQ1mjwITGRQkwBaWyT-0f7DzMRzrEqYD5vFQ>
 <xmx:mmDMYsia8bj78g1jh3fMhebIelhYpnMzcoVb3ZzaStRrnUqCMFiziQ>
 <xmx:mmDMYnozNXHSPajgXU34iIvw8Ru778zSGnYoC475A590r8Iu3cDemw>
 <xmx:mmDMYkc--wuBLdcoBKr-epEqe2j_eHEqRRBx1yzKr0z65oQsbNmgWA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 35/69] drm/vc4: dsi: Fix the driver structure lifetime
Date: Mon, 11 Jul 2022 19:39:05 +0200
Message-Id: <20220711173939.1132294-36-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

