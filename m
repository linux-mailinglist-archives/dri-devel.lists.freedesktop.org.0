Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD579570947
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86209034B;
	Mon, 11 Jul 2022 17:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05B89032F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 31CD95C010A;
 Mon, 11 Jul 2022 13:41:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561283; x=1657647683; bh=c3
 p1Rh4+E8NeJFIBMjpjeqXu6/BeA4Ih1QFoIrj2wrE=; b=Zj6Fz5IHiNYKbdzJAl
 TlNn6CCmwIZQFaoCxDqk7wwmQHfbdUTAtkBQ6n9sGbpUKL5MGhM7lD0OVt1N7Vy6
 ZtFz6/HTdgKVZhxu0nWWqOYg1FpAFOX+Npn9HGDGvgdNMBQrPtTJYdUu/GY0/+32
 Oa0Q+B8/Xt0b4NwA+sxPTrgYNWZSUKht+/98QbXYCBe/3ylrqUCLoDC+UKUk6O8C
 nQQLWn5nv06aDqv9DgUp7Xa5+afJ6UN2rDvyjMQ0PTkQTRb3NOdjoUyGRxcEplfE
 DUIYKbNJPLyP+WAtLgPgwePdam5Xk7Ina//bGPqa2fqhdmwInA5RdEdEJTwtIhuh
 83QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561283; x=1657647683; bh=c3p1Rh4+E8NeJ
 FIBMjpjeqXu6/BeA4Ih1QFoIrj2wrE=; b=Zq54IQnY1QDtihUIL8aGKkgZeUv11
 ER3I5wKncNry/SSdMAX4Xn/fh2+O1G8dg4Sn4OhoUaC71CAxf6UdCo2Q4x3JOasO
 4ZMM4vDlmgu0dQ2ReAhimA2Qz30vfsHAIRt9j5XBOTYa5yA9zgavoXqKKTaht++t
 KJE38HNpsi2QP9dnm7j0QVFuJSmnl0ZIYcwzKBIdmU4CnqjCoN5jILXI8zxClS2/
 X9Libo6ECuJH2gKM9cMlPn7InI6CqtKCRFybA+1IBcxuExD4ALu82H6l8gtprZAP
 uSgtsei/Dhyo0iyatilho4Ai+P1mQUQrvaxoBNaeyA4SH9OrTxFbzIp5w==
X-ME-Sender: <xms:w2DMYhlvE0EuHgdITM5sLV53qEsRJ84vTwYw4iYuEQV671LIvBH-TA>
 <xme:w2DMYs3fGIyc22186w8YhuuF0Chr-IadlJp8_5uBmM2oarGoZhMKorxiaiYsRV1hy
 Et2H5pOg7VDyzjp2dQ>
X-ME-Received: <xmr:w2DMYnrQBQ6lNsMsYSDWp2VGxby7G2sh4aXLSFzKh8hA-xEEcQ0m1p8PVTS4vHEub-cpK-VhGKTlUR7KA-IaayklrUL440VRu3QSctg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:w2DMYhnMInMMGt3pNQckS81qG_bmmZL-IJDfnn-esHGUoyAMIfsF5A>
 <xmx:w2DMYv0gf1quyqVP3Lvo5XYe6pJy88Few862qsD9KnbLGPu0N5r56A>
 <xmx:w2DMYgv25g-ZAf01UFpDbNP3D7y--gC9L4EmpvuXxxRvkklpn4RsMA>
 <xmx:w2DMYqR2MovYCIkXzoah9LbaoYSL7XosshinKe80ymHI1u-HP_3OqQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 59/69] drm/vc4: vec: Switch to DRM-managed connector
 initialization
Date: Mon, 11 Jul 2022 19:39:29 +0200
Message-Id: <20220711173939.1132294-60-maxime@cerno.tech>
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

