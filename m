Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1A5546263
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650EA12B5D4;
	Fri, 10 Jun 2022 09:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AD912B0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:31:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 287025C00A6;
 Fri, 10 Jun 2022 05:31:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853463; x=1654939863; bh=vY
 xHzshh5hK5VrUoTim5nMBVzUPd06qabqzlq/ko8H8=; b=lY61XweOpka3N9R+jO
 W/arXhyMSiEq74FAcSH9ckNCR4XG16Yp1MwtTE/OSGh4htmYkl9VCP4171bFsRAh
 5M2aEZK5Pc6RsJgi53WtGWFNUIv6o5U1wU4qlL5B6ZXqHIShHS9JRnxecdcNGiau
 aft+71wf07imcBoeB88qI6CLHOPXeFmK0YNIcEmPm1NsFz1WrrrCdMBF4fvNKM9G
 L90Al6xFFziYBPxP2gjR2zCtSM3EATv6MMpF4zZhOox43a6Ati/v6+CiXKXHVCT0
 VUEDS00hCLiW0akSE9xXaurl4t5QTdPqLhi7s6aGG6viF9gNHoozsnbp6CdXn7n3
 wMOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853463; x=1654939863; bh=vYxHzshh5hK5V
 rUoTim5nMBVzUPd06qabqzlq/ko8H8=; b=XMHENrg3d7zGL/wwSoqYizF07hadd
 ct14af3zC16pmBMIRLJnzift/K94PzcKpWKt6/rlFheU8YDAg2a0WTOuJWCa6IN8
 Anr2nbIYWdIgr94atezdHVsQrhUiSkJgVXCAlQku7b+6sPrWwjF3o5B/35L1t5DK
 E1Q9DX1/WYLurtrhmz/LY/p4/gAwZ+LX4ms5QBKusgFGHmwxiDOGSuoiaCeeC5Gn
 hkMbKwN/Kdbb5LXTykpxZgyWFMFwND2KgoDu/PCDN9RRcbkj/OerTNXTl3fLmZd1
 HEUIYDiRpAnWwO5nsnVcutqiBls03k0QEyy0mvFGz912Z6VX/41K9jtNg==
X-ME-Sender: <xms:Vg-jYoxrTmwZ9ZLw0zm0NTCjNMU19DJ2cjsd06nb-PD0LNL1EGoKeg>
 <xme:Vg-jYsSuCWcTkB4Bmbt5RofpposTbOugmjJmVCt0r0YdcEoyPr7GzRMFHKDKvdXL7
 s3eR7ad_DNbSXvolJ8>
X-ME-Received: <xmr:Vg-jYqXZM55GMSpvmbHmVIF-3eNbIts8hWrmpsHdMPSv7zU32-Bh0C14V4TbcLOxJhgLbve9BEvnoK-AYSIH1AW5N5U0-8kfhnHmPR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Vw-jYmhVnfBSZeUir_ZEuY0sgf9Yd02BaQ3gWavrW8XEIm3Wu0kFyw>
 <xmx:Vw-jYqCR3PXjEKREp5zecxKufEGtS0yMgmKkkyfAQ5b4yQh7Dnnu3g>
 <xmx:Vw-jYnJdJlqUudc2LR93yBMxoz7P_IeVUmM2HAPI5F01o6H3MUZgEA>
 <xmx:Vw-jYt8n3fTqXSNuYsJ2aCypWeRj9rBf8M6ot3vIxuFItMA4yRX1TA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:31:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 54/64] drm/vc4: vec: Switch to DRM-managed connector
 initialization
Date: Fri, 10 Jun 2022 11:29:14 +0200
Message-Id: <20220610092924.754942-55-maxime@cerno.tech>
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

The current code will call drm_connector_unregister() and
drm_connector_cleanup() when the device is unbound. However, by then, there
might still be some references held to that connector, including by the
userspace that might still have the DRM device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 3ccbe34b22ea..c63701503141 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -289,12 +289,6 @@ vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_unknown;
 }
 
-static void vc4_vec_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_connector_state *state = connector->state;
@@ -315,7 +309,6 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_vec_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -328,12 +321,15 @@ static const struct drm_connector_helper_funcs vc4_vec_connector_helper_funcs =
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
@@ -559,9 +555,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 static void vc4_vec_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct vc4_vec *vec = dev_get_drvdata(dev);
-
-	vc4_vec_connector_destroy(&vec->connector);
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

