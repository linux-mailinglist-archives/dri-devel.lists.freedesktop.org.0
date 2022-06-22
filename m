Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C544C554D49
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF723112D2B;
	Wed, 22 Jun 2022 14:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31CA112704
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4C5C232009A1;
 Wed, 22 Jun 2022 10:34:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:34:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908451; x=1655994851; bh=Zr
 qHCq9Fdxckz8SbpBPJ58a4gt2Q5giG/4Vkn9M/l7Y=; b=YViGFMqI2sN2mJqfrv
 PrfGSGjsPe+Wnxtd4OMN297AqXVVA9AcxY0BXhBHhjUu4IUIU+zanXPGtad5LGlr
 s2Zf62whDaYVf30aYqjCs825BO7B+SodXRHAenTj7FwCuLJBv4ddYmDs53zjxNVq
 6QaZLRtTXTeIIJ52wkmLrcdHnNn/h9GLhMOBD2bFb+IunoKhd2USgy3P4iISYbTR
 t92szC6x7dnHQHeLgAilg8VDhEBj+c49MWj7RRgIDU/OeAmFZdGeWXI6zmBbT9Kh
 vK6E8TGo6jJdnckM8Je63a3lhsUCbN5MYh945c4kSP/glgcUAJFuD5pfLWkcPCLq
 NOCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908451; x=1655994851; bh=ZrqHCq9Fdxckz
 8SbpBPJ58a4gt2Q5giG/4Vkn9M/l7Y=; b=W1cqjtAv3iwkboY9XAKxvFebm+oT6
 MtUeug0izuGY0agGPdvR/6HMIQk4j56WYm4jxlzFZsn2Rb9B+dlNSnZvaqBgHIP3
 oRLpN/VzXhxbcU6mNjFpoNJOEhEZjvmtUaZJDCK9ofY2qwDoyciRf4qoFSFAZbay
 ixeSes3pmg5EsUY/Vnm8CCZwv7/EG9KEzVnGdHzxSO2GpYI6PkKFu/rPool/g5Pn
 xQxwD6vjjuviAacIiK9BD/HiSQySxJ06rB/+S6Lh3ls9ZevS/LfVPViJOUvXktA1
 pYHBwlzMCOL/BlKmAh1UlwhmwOzphH6U7LS2iz3Vuaps9IgWTIZF1AzEg==
X-ME-Sender: <xms:YyizYt17ZH9eOwQgp60UX1PrJD_P6mWuU9StKZvE5AJe9m-gztV3Ww>
 <xme:YyizYkFnw6KBrruaa3hQ2TlbFythnk7uU_fB0nEn2P1KSYmrgYsoHt_Hdvmzqu5C4
 qWU9631VTrDAx1MHAM>
X-ME-Received: <xmr:YyizYt60Q2Htx2YKxM0fYDT8UD2L8tWtwwYsRyOQ7TaPX1pryGsAK6JmVwdcMfmvoSU0y2f7PC52V_iH6669cWTR-lOUJ8xHvhE2f9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YyizYq3i3sMGrP3bq0WjcNa-6awYyZ9pJOok_bAi33lFcQE8h23qMQ>
 <xmx:YyizYgG2Td8m_THODmGR95yhou1qsDplyDphABhsNQKe7HYdvo4Rfw>
 <xmx:YyizYr8Abg0lQputjqwuPJSn_8Xn6iaQ8wh062EJrBMonwh5Em6Q6Q>
 <xmx:YyizYshtfJk6tpFqueHTmq2RGxVKmbTOhFCJ_ADJfigdxEuN9l_BGw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 37/68] drm/vc4: hdmi: Remove call to
 drm_connector_unregister()
Date: Wed, 22 Jun 2022 16:31:38 +0200
Message-Id: <20220622143209.600298-38-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_unregister() is only to be used for connectors that have been
registered through drm_connector_register() after drm_dev_register() has
been called. This is our case here so let's remove the call.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index fd7bfcd1696f..7d08be14b075 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -256,12 +256,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
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
@@ -369,7 +363,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_hdmi_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -2954,7 +2948,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 err_destroy_conn:
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
+	drm_connector_cleanup(&vc4_hdmi->connector);
 err_destroy_encoder:
 	drm_encoder_cleanup(encoder);
 	pm_runtime_put_sync(dev);
@@ -2997,7 +2991,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
+	drm_connector_cleanup(&vc4_hdmi->connector);
 	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
-- 
2.36.1

