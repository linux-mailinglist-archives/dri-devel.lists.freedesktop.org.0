Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E6D570921
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291DB90321;
	Mon, 11 Jul 2022 17:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745D290319
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D2CE65C005B;
 Mon, 11 Jul 2022 13:40:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561247; x=1657647647; bh=k2
 FhxsV9mPWPbH1EYTOLAvFcz7yB/Z3YF3ju3GvOnPM=; b=FEdp56fmR+mSa0CFSx
 +WFnl0hT6gAAkkS2M0jJAMVdZ6T9s9HbeNvRkV0eCBdSRlqKYwaa/stWzqIhiE8W
 IoKuEq+0hK9jgbYRIJbbleEmOmnxubS3FQMFB+fTuR8cLp1gl5FRBWZ0H04x4Yq1
 shJRcrWeqqVU2br3AdX1AxvvoHHmKoLV+A69uHTW2T/ZerPcJKOThL95SK+0wW38
 96Vg3m7DX5cxOPS0eJQfvg41SmqJDXn3qJS5DrvHkZYG0BdPJx4ztBWA73kEtfvL
 qFtw4bkr2A7h34mWWepUek/31A5yACBQNVWfZSWgjDTe8nqbRv4Ie6wKEHzm2MG7
 +Puw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561247; x=1657647647; bh=k2FhxsV9mPWPb
 H1EYTOLAvFcz7yB/Z3YF3ju3GvOnPM=; b=l/pCwPN02rG2iQOBLI32Avr4RubqA
 eDRqdFwQ7bDbkFaSY+xT+SPTGuuhvURJXR+C9/9cELheEO3DH6iZr88CYPJEagmU
 /OwJ0DfeBqEevgG/JuI+zUsk1WZ0po7lNOUeIfv6jJr8JYkpHUr6owudvTYl6LSB
 jscQTyUd6cw2KUvd4V/woBZo0heGIXaDmLT9cNhGv3QsDLOlAJlqXmtOcHcbP+A2
 9NFk/elsHV9O5wKc21pmgfWAsdOrsONLcB6Lc9GXqz1aiKWlU073as1I9AxoiV6T
 UVJQLvK7Vl3kTlSlJvSB+5EtAcyNHv4Bc5MII02lo2oIp1AXBIzvNHtDA==
X-ME-Sender: <xms:n2DMYpDPBVdOSgvD6W3bobqkHIMJtL6mTgzBGekNzPYtZXM5dmZAtg>
 <xme:n2DMYnjcqsZN9wThvLa6KBguNa3bxArYz3H7QLqy_bv0XEMdzCGBNIm37Nlkc5rSG
 o9ms5ucox38U_J7Z4k>
X-ME-Received: <xmr:n2DMYkkH1F5FBDVTawnuiyhxF4FWYQUQrbHENXh5EVe1O-55XxR2xFn_fzGxbOmrm0rXyRPoR6wQoqiRVvYi8JBSww8uMCZPeoHHqIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n2DMYjwcAin3mUTO3go9qIXtpnDnenZ0slHGF3E-yLB8qUG91mDorg>
 <xmx:n2DMYuSx16aPOTHyN_JoV83AXBB1EQzgS4aHiwxj74uTKL6fVwG8YQ>
 <xmx:n2DMYmYywAq6EY_o_CCjSzhqKd8ffzpREJZ68Eg8HR4ePBGkdks_lg>
 <xmx:n2DMYkMke9QVd-5D-yfayNHSGvzfboUWY4V-GQj77VB99FV4y7TIFA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 38/69] drm/vc4: hdmi: Remove call to
 drm_connector_unregister()
Date: Mon, 11 Jul 2022 19:39:08 +0200
Message-Id: <20220711173939.1132294-39-maxime@cerno.tech>
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

drm_connector_unregister() is only to be used for connectors that have been
registered through drm_connector_register() after drm_dev_register() has
been called. This is our case here so let's remove the call.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5681fafa4271..a0b4f75a8085 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -267,12 +267,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_disconnected;
 }
 
-static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
@@ -380,7 +374,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_hdmi_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -3023,7 +3017,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
+	drm_connector_cleanup(&vc4_hdmi->connector);
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
 	pm_runtime_put_sync(dev);
@@ -3067,7 +3061,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
+	drm_connector_cleanup(&vc4_hdmi->connector);
 	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
-- 
2.36.1

