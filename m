Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E657091C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724BF9031F;
	Mon, 11 Jul 2022 17:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0739031C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A5F25C005B;
 Mon, 11 Jul 2022 13:40:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561249; x=1657647649; bh=kq
 6H2VSiu14/KRSi6bRDB4x33u2S7kKjdsg7E2zB4ng=; b=uhREWmxfrvbXKk4Qeq
 MMdV4jy0M2Tz4a6ExKTD/KIGpOM3t5LjGOTggMeuxjNr8Fgf5dn4yxlfaDn0Cgki
 c+eVUvhqzFsvnSStqEd33zrV0BtSF8+zmrSeewD7LIx0dk8OA10SMlknNRc2OAp6
 eZ9NZX6BbJe0Yt1fUIZ5ZDYX6ChNwxGzCydG48DIyRwtjnrgqbMkA2ymhgTQ9YGA
 le4rwjytOtEZa5ukjtQgg3EZTkEWZ4bDBzGnOuBBZPlyFNBTYk9BmvCDKZwBKYz3
 RYd7oS7vpaKdka5TtAx6nKcptBW7vqumNtku6BkDeQ6WPZ9Hj6xz9Mqg76gcKk9J
 T6Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561249; x=1657647649; bh=kq6H2VSiu14/K
 RSi6bRDB4x33u2S7kKjdsg7E2zB4ng=; b=F6PX6lI3nQuKP+p+DWQPwR8qeF/BH
 Oj79eHElK6xAefB9JSW0h+7q2+OGOE7FxFpqGW92G6h/BIfsoQLGfvHFfxr26sU7
 9tSjZmm3sdpMe3DV0HygQ5yEPI0pSyBx3Ax8NnBO+f+NGZBwUw4Awi1w/BtV68io
 0gchvsOq/+s3vi0Q8sAB+qgeNypUVO+U/H/nu4q96L3rnCj7Q3xrmkDJHqSn+LXw
 hVXjKX9mkLPqtS14CkgGWsw42AACC0MqqRFN6BoxVpcY6aOy3CrTWbhD7+yVR6Hj
 xGZTScmwLex5X+pX6aCccSbW2IX00Ccvc2GHsyqpvt7uX83LaBwMCmz1g==
X-ME-Sender: <xms:oWDMYh1wknYH5pwto-48YyZnxE7bxILzIrzGxoHg6XhSjmLrG0kiVQ>
 <xme:oWDMYoHmxdWIFj7E7krjKqsE5gKYud75xOyI5PHTFxyNKW94KEjrn4IIRhZ2Ym43I
 2FskeI2uFGFwnz2m-Q>
X-ME-Received: <xmr:oWDMYh5jpybNwGErNgx5z_c4_Da05WURc1Pfs8OyBHKITLtAJoMNYlM44g3sZhV3r0N55LLvagtWxNiwbiCWgVsW7GtYEWiVGuUVxGE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oWDMYu2T3YDz21B2IN3mGj5AME24zM7ZlPT5ALzAXIBGJ6Fye-kLkQ>
 <xmx:oWDMYkGu_hH5-0kDjjW2YDJXQju6rbFEpOkVNANSfkQ3xXlm_O84hw>
 <xmx:oWDMYv8z0fzoeTuy0tnCZjAmIodqZFu2rIqAvU1uTPKMr68puXQEsw>
 <xmx:oWDMYgjIJH3EpcFF1sk3EzeIGEh1HJE8d5NWpkycH3Qs55wX-VViIQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 39/69] drm/vc4: hdmi: Switch to DRM-managed encoder
 initialization
Date: Mon, 11 Jul 2022 19:39:09 +0200
Message-Id: <20220711173939.1132294-40-maxime@cerno.tech>
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

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a0b4f75a8085..700feb21c4d2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2985,12 +2985,18 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	}
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drmm_encoder_init(drm, encoder,
+				NULL,
+				DRM_MODE_ENCODER_TMDS,
+				NULL);
+	if (ret)
+		goto err_put_runtime_pm;
+
 	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
 	ret = vc4_hdmi_connector_init(drm, vc4_hdmi);
 	if (ret)
-		goto err_destroy_encoder;
+		goto err_put_runtime_pm;
 
 	ret = vc4_hdmi_hotplug_init(vc4_hdmi);
 	if (ret)
@@ -3018,8 +3024,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
 	drm_connector_cleanup(&vc4_hdmi->connector);
-err_destroy_encoder:
-	drm_encoder_cleanup(encoder);
+err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 err_disable_runtime_pm:
 	pm_runtime_disable(dev);
@@ -3062,7 +3067,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 	drm_connector_cleanup(&vc4_hdmi->connector);
-	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
 
-- 
2.36.1

