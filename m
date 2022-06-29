Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05456001E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9394B14A62C;
	Wed, 29 Jun 2022 12:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4AA14A62C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7DA6F320096D;
 Wed, 29 Jun 2022 08:37:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506240; x=1656592640; bh=zT
 7gqvFMOaKzyWEE8muQ2cRqFmJUTFbMWF2geCqQ7ec=; b=2V4ligvnQ0QQM0hmnW
 bLd3fFIAyRqQHZKpf3EmLcYJ+w/6xSRMkMJBsDCiTqayyZA0Sj920a0JbdbZ29KZ
 6ahZ/zBPSwI8msJJtzP9NdYtaBVVf21d+IBTVZadgkAtI5nyRqxFhjnqBeV8Uv+V
 CAu3mG3pKSE8ABPWKklf5GmdO1UYpUFUMRfX9fXT1sGZ8JztbRqI+Goj/mZoTq4K
 dLrUcWSNLLyv6unEeqJL/VpudEDnh+Sjk0DTKl7AiKU4TgmZIorSLUppVE5clQfe
 ad4eaTVSH6Ze5OIXB2IfT9UfAHOa9O+XeFzudBBdhLiRKj9ZH4yza1yYueuO/K4k
 Iuqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506240; x=1656592640; bh=zT7gqvFMOaKzy
 WEE8muQ2cRqFmJUTFbMWF2geCqQ7ec=; b=cwkfmI6dmfmR7Fg/lGVcV/eXFcWH2
 zsSnu3ONDfltE5bc224pdqFdTsuKais7G+sttbzgySbB1KSGH5hQ8xx5fjwF1/Zq
 kH7o63Zk/Qkliym4eEg4xP013tLC0TsJm9enM+UHww4uwOxhA6mpubJEy5ErOtsw
 KP5KFOUp26Z2A3sYSrml1JVgeeqJX550Gt4cU8sydmnDMSVhf24xiZ1uvnP04Mk3
 qU415b0dVEAVoTPSi00SqnKUQznCcxzgXpmjWFw/huKp08YNoxBuqyNGloGH5TqS
 SR5a4q+OAbYtZvNxJXSzsmYcHBeneceMerkNtG4lVxwrSsMSzHHvyVWIA==
X-ME-Sender: <xms:f0e8YhlUN748dLxK6XBaDjaQduNU8oZ84hWMTtK5MkqXAm3sz579HQ>
 <xme:f0e8Ys1gHzAyiE8KhGhUyH9o73s_X4BAW6nMFyAq10mx4RiuMeIYpoO5hUfO3ibgj
 PjoOOHkRtl7lE_hLiM>
X-ME-Received: <xmr:f0e8Ynq9sKga_Bnz3el2RjjO-jcEarAv82ay0vBE7VO1tOoOPNnOBmuNUT_HnZDPORoZvkaWXC6nlLiyaJ9fQqd2oHwduBLDNvF0ePM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:f0e8Yhm111q5Zc0Pfd0ADpQUh0SXDwENwRap2SDXpoXQlaTceur0XQ>
 <xmx:f0e8Yv1V3FdWfxZzw9AgNS-t-8hZvSz4ki-cjnpsuqfLWAtQzLjAwA>
 <xmx:f0e8YguHNIqFZsti61loniebmq5tzX7ZfmNzRfRcKermlvtNHmcTww>
 <xmx:gEe8YqTTed5YkshkMaioqFHDBcK9-KKNpaRRWusVwYZbXvR-_qBliQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 42/71] drm/vc4: hdmi: Switch to DRM-managed connector
 initialization
Date: Wed, 29 Jun 2022 14:34:41 +0200
Message-Id: <20220629123510.1915022-43-maxime@cerno.tech>
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

The current code will call drm_connector_unregister() and
drm_connector_cleanup() when the device is unbound. However, by then, there
might still be some references held to that connector, including by the
userspace that might still have the DRM device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6c44faea4af1..283fea78f3cf 100644
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
@@ -2999,7 +3001,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_hotplug_init(vc4_hdmi);
 	if (ret)
-		goto err_destroy_conn;
+		goto err_put_runtime_pm;
 
 	ret = vc4_hdmi_cec_init(vc4_hdmi);
 	if (ret)
@@ -3021,8 +3023,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_cec_exit(vc4_hdmi);
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-err_destroy_conn:
-	drm_connector_cleanup(&vc4_hdmi->connector);
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 err_disable_runtime_pm:
@@ -3065,7 +3065,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-	drm_connector_cleanup(&vc4_hdmi->connector);
 
 	pm_runtime_disable(dev);
 
-- 
2.36.1

