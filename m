Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5EA554D40
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3247610E6BA;
	Wed, 22 Jun 2022 14:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C2110E6BA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8F9403200974;
 Wed, 22 Jun 2022 10:33:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908435; x=1655994835; bh=T/
 IxpHABAY+ZyQ/TnWrVF3VGXfblrTJYMWFjxV5OqNE=; b=a8HsqdqXY0D1ng9kK5
 FZRsOncAcBDg1nn9bFX9h6Re718NTMXpWCWgbbdqwXNKm4jLSI1RKAFG5Vc5WyOz
 vtbK1DCByczjaS9wb5h6q3O+rrxHJDMw0yDCH5nSzfNZN0TwvmpPdyA4HR91ruho
 h/s1X3/nZ1kjZZ/J55PDimwGWrvAzjiCJ1R71EGa4g4a7O0U24sd0bH9HqMnnHU3
 qE9zarfEUxq13fta8Z7iaEpUVIB9X4lu6trMMnUT8p90YBFn4ShjvnOCCIwCWTGh
 aDsPIuIQ2GybMzhft5HLnnX86b/pwhlNsAg+2ciePo+sYlWLXbuvELNcm45RL69Y
 VCWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908435; x=1655994835; bh=T/IxpHABAY+Zy
 Q/TnWrVF3VGXfblrTJYMWFjxV5OqNE=; b=jccZ5H4LUnyphIA/JCAI6/+gJFOEo
 b/tz8CuAbnUhWl9wU0z86/iyewltjV4hONSVuICQqwdq8s1m9L1NQrCRuFHSZvjl
 7zLOzvSNJ9Jq9HdiPuXOdr3wLoa2Mvbln7+eYBJnUxJ2KqsX9u2GAIyWWPGasAkw
 WfGoSZHV0vkiLJ3RffM76y+MPTpQKfuc0C/otM41MILH7lJZzyBJ07KtPgK0NIRO
 elLOwupoT54GVLP9daUqZ6cUzl0JkP88wpuPUX1Wf0uMrB7QGTXpEhV44NeJrj8Y
 7XL9V5oWz9ctHBxgyHsgxvWWARlzHgP3y/euP7JfVKiYG7jSs8P8IzK4w==
X-ME-Sender: <xms:UiizYtzadQafU_OLEXZEerU4mDobGX3HZSZAejKa-3VAy2nDnYAeQQ>
 <xme:UiizYtTzlXXoe9lu_wS4DXkXGfjppYXC8HhqxpWJFo_8q47l_sKtwsNH--G5jbqQm
 C6VNJX059reFUzVoxU>
X-ME-Received: <xmr:UiizYnWhuWCW5f1Yl3StAqGRlKevGFblrG1Y0ApnjfBeSMujjV-wXo-nzCvdFaadwImxM3gqvnTDWaufFMZCB2xaaDtvF_-QIY7mmWs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UyizYvhI2Ih_0-sawNW1TpI34iF7_cCdXzchON35RpiovR17jck7xg>
 <xmx:UyizYvCliSYxlwW_dt92LcWmtU2slNYLj2JVy8_IG4OpEf-YNHWZlg>
 <xmx:UyizYoLj161nMnK4K8VuH7oOWFZG-NmpnwLm9ds1ux6U039zjwHnpg>
 <xmx:UyizYq7ohhxzDVqc3VNq9Ql7d1qkJ5HmRskCE79f-RAgpjzQayc5Jg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 32/68] drm/vc4: dsi: Switch to DRM-managed encoder
 initialization
Date: Wed, 22 Jun 2022 16:31:33 +0200
Message-Id: <20220622143209.600298-33-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index dbb3f6fb39b4..f3214675f8b3 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1599,7 +1599,13 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drmm_encoder_init(drm, encoder,
+				NULL,
+				DRM_MODE_ENCODER_DSI,
+				NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
 	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
@@ -1632,7 +1638,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 * normally.
 	 */
 	list_splice_init(&dsi->bridge_chain, &encoder->bridge_chain);
-	drm_encoder_cleanup(encoder);
 }
 
 static const struct component_ops vc4_dsi_ops = {
-- 
2.36.1

