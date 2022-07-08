Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1456B6B2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7643811389C;
	Fri,  8 Jul 2022 09:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCBE1138A1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 85E9732009DD;
 Fri,  8 Jul 2022 05:59:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274349; x=1657360749; bh=z8
 YPR7jlu7nbuFgdKvXujVwbd9FvIL4PE5nAjZS5DrY=; b=vJ98XnE/o7eP6sRWVv
 URM1bme+4REW+j/Xt7PWkGAEOJ6WqayGTQJmbU7HAipwFwzUVtQWcT207r9aVQtL
 IAy1RjifWbfGOuGm5xqmC/6pZMTcOst7HEeTRCQCv77XIbo6bhLh3rhmddOkQqSd
 jdIPAQR8SCTvu3gclPJ9HtuPufWHtRw8w8e0+11n/65dCbgzU7S62n4+77WEoTi8
 6hhR/jiouMir+1BhhdwOxuuH5ddefT2+ylbkPmTC5a55cJ+FQlwbLrlLMDdll+os
 XBdw5Poi2ABiRWV6pyhje6iYRi1tTQ/UriCyr/HVo+dV3/dY07JH96AVBqAHzjIN
 yQeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274349; x=1657360749; bh=z8YPR7jlu7nbu
 FgdKvXujVwbd9FvIL4PE5nAjZS5DrY=; b=3VVEkE/8pMsz0w17pixlrfNX+bLOj
 qAxoVAsS0iHORT7gf9qw/Q6xbHnBVsJYd89E9EZMwZk6UX5+s4No3eiWmqpNOcIQ
 PNbDXgS1H0WWaqQBACs8Mly8QK/6IGacP7u6KxjSyAxySHGOAQ+aqzKP4Pi1mXJ6
 dtMUN8FHAyNkl2ftAOC3KBv9THff+A98VTtOXpMNbc9BSE1YAnn6kVJ2q1yf/NHV
 zyaYhBBfOFFm97ISIv4OKlrAeydDc08M0LJmhGSJ5S639xdqJDll9jNW+a2j/Rum
 LgIKO195Rks6ym95uS6L5GNQ0CyJ5K+oGlnn0dWG+2mbucp4XwuJdipqw==
X-ME-Sender: <xms:7P_HYl_6U_C1XdonxV1Ggq0h_YP1pP6Se7NnmK97l9q9As9D25BTGg>
 <xme:7P_HYpsQPUA8_B_nZUnBKDTd52aWBkuXMWU16yKo7SEzKRfC9RegPJurpGnW2XG86
 fpjEI7Z9IMGCbmy04Y>
X-ME-Received: <xmr:7P_HYjCsL-dbW0ChWaToQvTQ-7sKh1Ogp_Gp96oKoXJyHrYu2mQwv1Gl9SkvoajyEtYGNj2VCEYVfcSpTJLJSTdq7jFSsIXD8cXHJ84>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7P_HYpfcIuWdo4SPtEE6oLj9gb4oXRyWY4BLdg8FDowrdPUR1phElQ>
 <xmx:7P_HYqNaf2vt4vI3xJQ20uAGibQPU0jhD1J9Njj95_-rHff7jyCH8Q>
 <xmx:7P_HYrml0pnzYr_vx8ToqXqKZzV9bvC9I43OpIhEjrPa9-YfQ4FUAw>
 <xmx:7f_HYnpkif67Ig-aZG2Dgg8u_oZf7hAETOBLk6Sf8aCGThCDKzh3uQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 40/69] drm/vc4: hdmi: Switch to DRM-managed connector
 initialization
Date: Fri,  8 Jul 2022 11:56:38 +0200
Message-Id: <20220708095707.257937-41-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

