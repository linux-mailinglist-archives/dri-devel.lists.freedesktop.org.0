Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500356001C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CFE14A631;
	Wed, 29 Jun 2022 12:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4632314A61C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0F0393200952;
 Wed, 29 Jun 2022 08:36:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506219; x=1656592619; bh=/U
 qXC/SOuqqKf6eqdhL75IppaCdpiHA25q31BPXM4a8=; b=XTE7N2EGayQorOnOOf
 Fd0eTP5e1KLCrRGsH4mKagu/aObHVldPTZTYG7Eny+ynrfaRbIw9xK7qB3KlwXti
 GPoOI1Z1eEwCpbVMzFCdOXGlfNupFVq9L8EHjE3aITlR++XFsNPcql8pyGoV2Lj7
 fh7sD0RgPtEvWbvw4t2YpNvvdp5bmb37pz/dTxFks/3YFRvebMtzf2ODRSqsW+s/
 af3M5AtFypC/2e5/+1IVNu8+bHIktZmk/FZzhIssWhcjbgYM6qmgOCtI+IbUf7v/
 gBJqZ62dAodjGYa+LWXTqQ6AgQYSY0TIxlu6yRn7XrHxIEQx5JuThzXMYr5zgPxK
 TzLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506219; x=1656592619; bh=/UqXC/SOuqqKf
 6eqdhL75IppaCdpiHA25q31BPXM4a8=; b=c3BpCIivRvDAOOepWVuXuhu28oagy
 W1VQe4ewAT7dI3vcuPWMytIRX/HL7VDdwPr9cc4JXN3jhNMtGXl7rbPIevLrYM+C
 YXSCI2FfyT5h+C6io23XaGEYrmNWNMPxff8xKJUNc6mf7bdpVZtlvtOpQHuOT0YT
 Z3VaAqAGLBx2pZhxUFjv5kOTEc7thRr6BsHmNacVEVgP8FAFDrZnRsmGkweELblV
 AX1oi/+EtOelh3gMsJO4A7t4BbDfQsZ2ABoclCf0PLD5+aLaNqyF32TXE/GAaWFu
 kx8gE6RrrA8EF21HDwdWZ9jRatlMvR3WZLxJPFmelFFsw5LhoFwXO9h/A==
X-ME-Sender: <xms:a0e8YojhTQ0gKWjOuF7WrP4WDV6GdABjzChli4YNChJDSDEsQlhrKQ>
 <xme:a0e8YhBTH8Q4im1bqJczhQBjspV1xXQ048BQ8NPLiNC7Hz7kiOspCTOo6ALHzy4i3
 336SvQaAqwSTkJiIdc>
X-ME-Received: <xmr:a0e8YgEWFxApKshStTt1D_JnOjnDksxHOdKbQnoJD-Jtba8YElrTuY7q_X3G60NwdsnqGplTeh7CDD4KdTDFRv3xbsLsFJ3ebOQhtEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:a0e8YpSwaANhvJs7xDWK865F9MnMpzUY84nlm30mulyP3Nywfls43Q>
 <xmx:a0e8Ylzr697N4xYnZUIQUVboURN5_WVH4G1FQZ4AE6joHUoH_Bjo7A>
 <xmx:a0e8Yn56niHi9oBL0mYO5ovx53gyUI5sqIoqVpm8RvdD241vVd-LyQ>
 <xmx:a0e8Ynt1hrahZtAbrKPqVAa9p5_XRr5wsLF41kFY-j4oliAf1YzQPQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 35/71] drm/vc4: dsi: Fix the driver structure lifetime
Date: Wed, 29 Jun 2022 14:34:34 +0200
Message-Id: <20220629123510.1915022-36-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

