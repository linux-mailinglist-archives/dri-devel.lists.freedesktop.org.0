Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A523C57091D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E5E9032D;
	Mon, 11 Jul 2022 17:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEE990319
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:40 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 85E665C0167;
 Mon, 11 Jul 2022 13:40:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561239; x=1657647639; bh=Eb
 gzlmH0IrZ0FiuXQtmne1cDBzit1A+6m6yHtcrTrt0=; b=oD6j+vTPWlUcm239wU
 MgOH018wCfxbA+G6SWRpIhHCHZbTzc0bhqF8EO/AF1DJqVIRH2RR53cX6CXkmQ/H
 WvqwI6gURIkRPyP3yocVNmUV+a/4BRhupu0Igr0zGfj5M/EnI61OLVmWmGfxjHHY
 zpSzNIVUmPowxT+awGLfZgO6nsG1jXGGx3jnZUEipmVONEF3F27bcZ5RtK84QVS+
 vlHq7xbTGYPPm7N9b5kIl9blQi8/WAjqf3BAPq5OcmAnhtqZZrHx+bAFPjCf63qe
 AAleZVyT54o3ctYFK2fCjNHha7jxviwdSIxxl0CIy2gy7ukIbx88IvJGG/h5L+Cf
 tFgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561239; x=1657647639; bh=EbgzlmH0IrZ0F
 iuXQtmne1cDBzit1A+6m6yHtcrTrt0=; b=poKXTUzseojYveTPg7aGdkAxKEURK
 BcRtA4qDafLRo2MXYWSLO3maS5fBWdQKtV889XJC26iQUO+W3HeVHN6MyjDTAEN7
 MuncVV79jBEA3T2qgC/AOPhaJ6ifCI/KAEcXGnaCe5G/oZd3xGRHEwkqYWJoaN2O
 YoUKS0cZiJZBkaVYJmfghM2eToDPxN0nMyJw11pKUgzeOmrXGWwWmLQPdIpTG6pu
 nsu8gSynbyzF8AxcapXgb28ImaM8Pflj9/WpTpG1eaEG2OlXGyDPpSZyLeSho7LF
 x0qtgdetWP2fM3xVBYFbCGPgRXNul9QGO/8fdz3fh1p/1vh0GTc0UNRYg==
X-ME-Sender: <xms:l2DMYt8_uHhXj7YqE-8mtCf-EBfbTbqSIdllj2BH3aGxFCB7rkhg0w>
 <xme:l2DMYhuoX3vntHRFv99KkClsahorPaWnotm_dygFa_7pbdpuRPrgBf5fGkfWD8CVC
 LDLFmCNwBX9G7WRbWw>
X-ME-Received: <xmr:l2DMYrAtB9M38Obo8gLB7auG1iVHcmDKQBqNo9hjK5XdGKVhSdfZaILALMLUeldrqT7iCYSdvzKn4GINy6SM8t2qxFy8av_7zMJeYxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:l2DMYhcAPlAEGfCeHGYUQ4NpdBrpzDN1m3fvKgsbNzS6ZqgqIJhflw>
 <xmx:l2DMYiN48iEpsNsk_vpuw4zus4LJmerI_Uy97QOgdYds8ZAjn0y4jQ>
 <xmx:l2DMYjk1V-fiPGHNGfKFVSe4rtil5VlLsvlxwzhwPuOhUuHcafDSAw>
 <xmx:l2DMYp0lkML7YPtwuZRwKgeXMVpwA3afdQ1LTKDxsbelWSGum7EPDg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 33/69] drm/vc4: dsi: Switch to DRM-managed encoder
 initialization
Date: Mon, 11 Jul 2022 19:39:03 +0200
Message-Id: <20220711173939.1132294-34-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 72889524540e..1a55b7ea52a8 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1687,7 +1687,13 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
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
@@ -1720,7 +1726,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 * normally.
 	 */
 	list_splice_init(&dsi->bridge_chain, &encoder->bridge_chain);
-	drm_encoder_cleanup(encoder);
 }
 
 static const struct component_ops vc4_dsi_ops = {
-- 
2.36.1

