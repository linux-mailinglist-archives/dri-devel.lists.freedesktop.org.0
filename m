Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947D8570926
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5CE90342;
	Mon, 11 Jul 2022 17:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FBF90319
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1DA0D5C00AE;
 Mon, 11 Jul 2022 13:40:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 13:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561251; x=1657647651; bh=z8
 YPR7jlu7nbuFgdKvXujVwbd9FvIL4PE5nAjZS5DrY=; b=g4k1abHEGrXW/2RMCe
 BHhSLoFl1r9cIiOe1T4JMAy9mVynbi0rXS85n5nyMkLKng1O9Agco6aSeRseFuBp
 G52CnXutMBtSOVyuxskzKWR8l2mGbnqH8C0FEYC89VO5WLBVIBruco84ngsdrcki
 t5AjI9WRlMtfg2Fo89VbfgN503PAy/HD9jLSC9nqDXoK3evJ2scOgVbEjskU1R/X
 QmxzWZ/f5bZHK1IpwtiwKdJSKjUP9HDatZYPTSiHT7V9+juUKezI6ZxaoK1Ygkfw
 R1cVvk1og87Qy7PnoxPn3xs4i2ZlTGO6ZnxPKy3h9UGKmueiN8dZ/6n006cibCIi
 yBRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561251; x=1657647651; bh=z8YPR7jlu7nbu
 FgdKvXujVwbd9FvIL4PE5nAjZS5DrY=; b=i4ohlpje2Xu+bmmJJxi/yazQpPy5L
 wCfe3lbnkuK6may1/tMvLTB2gXu5Xd4uHMBkBtzuAmQUng6cPxtkAk7Y0UoX6I9X
 a0OkEScQhEiI+lU7bIFI6ZhN0DQgI9ItQR0LArBKvqeAiowQSFZCpjg+8ikw2UY3
 306uBot6aHip5kH+l9JqeUza9lK1mbJNigYZZF58x9hccTG5j2jiyqwYZ65xYsTb
 eWwJmowyZetlKheyIZAsw5REqgB9/u6+2t/1ckN3aOjy8pm4ODQCvGnaI+OoVDiZ
 8hqFONGet2yGFHdNnEOMEZQXf0YPb/C7wu43dguWGrOiJE4OOqBDPIxTQ==
X-ME-Sender: <xms:omDMYvT9Qf0Iw0WQkRhE_PwoKvH4XWSvheZ4blsndeSMe-i-bLvrUg>
 <xme:omDMYgx1KBwMy6I0uZPA8Zal3CPePJqxTDFXKLcqFXX4pmIH5jFH7AilYDjpnGphF
 ZMT4cIfoCyElsRAMHQ>
X-ME-Received: <xmr:omDMYk320pwD1VTeUaOXVxWg8LDcD9fUhtqxEmFwl8hIPWVEA4YCfPbtjaOMGUyGtbQYU9cFFG8NJCv8c712ZIXZMTe7jsGxEuiua78>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:omDMYvB4-2gbou16TWJ_J2FnclBHsKiHtRGw2H9x7-vdJXUQ3_K5wA>
 <xmx:omDMYojiPXsTLyShI7tWc-3U56JwpkuGDRPEa9eYGWg9xIiMn4kE1g>
 <xmx:omDMYjpAJlkxz9VYXQ1-BgDVTddKIh-LoHvCKOLnDYL45kNJBL0P1A>
 <xmx:o2DMYgckWv1mSvx4e00cys7TMmEQAw6R-9gXi9kDAZvU56ZxhspYLQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 40/69] drm/vc4: hdmi: Switch to DRM-managed connector
 initialization
Date: Mon, 11 Jul 2022 19:39:10 +0200
Message-Id: <20220711173939.1132294-41-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 700feb21c4d2..a49463251f2b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -374,7 +374,6 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -392,10 +391,13 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	int ret;
 
-	drm_connector_init_with_ddc(dev, connector,
-				    &vc4_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    vc4_hdmi->ddc);
+	ret = drmm_connector_init(dev, connector,
+				  &vc4_hdmi_connector_funcs,
+				  DRM_MODE_CONNECTOR_HDMIA,
+				  vc4_hdmi->ddc);
+	if (ret)
+		return ret;
+
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/*
@@ -3000,7 +3002,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_hotplug_init(vc4_hdmi);
 	if (ret)
-		goto err_destroy_conn;
+		goto err_put_runtime_pm;
 
 	ret = vc4_hdmi_cec_init(vc4_hdmi);
 	if (ret)
@@ -3022,8 +3024,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_cec_exit(vc4_hdmi);
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-err_destroy_conn:
-	drm_connector_cleanup(&vc4_hdmi->connector);
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 err_disable_runtime_pm:
@@ -3066,7 +3066,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-	drm_connector_cleanup(&vc4_hdmi->connector);
 
 	pm_runtime_disable(dev);
 
-- 
2.36.1

