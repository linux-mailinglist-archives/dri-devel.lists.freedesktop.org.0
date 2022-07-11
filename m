Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD0357092F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9575F90346;
	Mon, 11 Jul 2022 17:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B76D90337
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FD405C00B0;
 Mon, 11 Jul 2022 13:40:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561256; x=1657647656; bh=i9
 ggCIUu9asxUtkUoiHDBL4wDwUVp1r254y+hSsGwWQ=; b=BN9OGwJv+Eo31r5nT/
 2/zpzgGkAX8dyn8AAE4BfFNGY9ioE0ctxWSzj6qCtydqHVsi1b6CKXtfUDMPg+O+
 KsitTvsIzGV5s6XDTncdmyOJXSI57e+nye8HTr/Fe0lMFLktK7UlIxVimNsvoStE
 N0Tkp7eBhH5DWI3S3qxKzqc25XHgjDX/zZcu3xlXBWDjB1e7pUM6OT8ef32N+Se6
 44NIwK9dGihnjJWi4tJN5ftXmgHy8JCvakNOEEVhiZ4oDMvLbaaQk8mV6CJFEZDe
 4lFO6gbySYAYw2wqZpwAqsqXIeJoacW2XYzhHpoqW+wcAgyo+C1tCUs30VH7IxIi
 Wkaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561256; x=1657647656; bh=i9ggCIUu9asxU
 tkUoiHDBL4wDwUVp1r254y+hSsGwWQ=; b=bQa9P8Ehwr4gx/xwTw7SlPwbXd4c0
 cI+9wOCJhkAWQsrCgIX7OdYhZmSoFHsVye0PSBt4+Ec6N7mjDquTw4wlxnIsk6G+
 EWKozP83AzXJIvxyfCXtwc64PhMOshQJWwsdyCdbPuCiJQneCHbUyInrgx39/5x2
 lYz8fdJg16BkQA8O1aFf7KbQb/LryAPS71rvxL8Z7MuBz0tv6V/Pjz/wf/KzCbLB
 PkM/bBDyleSjJZttQCbUhgupNijFdbTcj2mNJib8vtJEAE5Oerktt2T9xP0AMBbM
 +0I148553db3IIrHowHXemk7Ge798w2YtVVZtH5waQDwEEpoqyxvs2Vzw==
X-ME-Sender: <xms:qGDMYtownsUVneGjGmS1xmXB4f57BQXaTyWVHu1jy7BddkfSnkay6w>
 <xme:qGDMYvrELKGZf81l41yI9_R79-53z_BVek10g2r8MlzkStFa2jf-nsbkYHtWsLnsk
 nMaw1hSEPkOTx1ZMEI>
X-ME-Received: <xmr:qGDMYqPS4DLVgpFm8I0UkGG0eqwMOZFP6I61iFKcmA7PWyUTEKDjSdPt7-u0yLW2RyQBih9Br0txAVvv5yszYR-hW1VsRBXSSg_6PKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qGDMYo6NH3Rn7cRsEFpRmU6GxvFAzEdwAVZFE9fIoYJbK-sEmUrD8w>
 <xmx:qGDMYs6dyKmeU-R2wr1iPc4_M72g-GWwCM2CWtJiS73yLAhSk5V7jw>
 <xmx:qGDMYgjhACdVYg6H_vlA7e4Og2fIQRsK4kdf9_mgYSbI9hJwNNI-FQ>
 <xmx:qGDMYn0w1_vUHaLty_O4mJgC-ntvz7OIM6WxRm_UJnjW2GITHBXfgQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 43/69] drm/vc4: hdmi: Use a device-managed action for DDC
Date: Mon, 11 Jul 2022 19:39:13 +0200
Message-Id: <20220711173939.1132294-44-maxime@cerno.tech>
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

The reference to the DDC controller device needs to be put back when we're
done with it. Let's use a device-managed action to simplify the driver.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e84600695fe2..2705f879efce 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2933,6 +2933,13 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static void vc4_hdmi_put_ddc_device(void *ptr)
+{
+	struct vc4_hdmi *vc4_hdmi = ptr;
+
+	put_device(&vc4_hdmi->ddc->dev);
+}
+
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
 	const struct vc4_hdmi_variant *variant = of_device_get_match_data(dev);
@@ -2988,13 +2995,16 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return -EPROBE_DEFER;
 	}
 
+	ret = devm_add_action_or_reset(dev, vc4_hdmi_put_ddc_device, vc4_hdmi);
+	if (ret)
+		return ret;
+
 	/* Only use the GPIO HPD pin if present in the DT, otherwise
 	 * we'll use the HDMI core's register.
 	 */
 	vc4_hdmi->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
 	if (IS_ERR(vc4_hdmi->hpd_gpio)) {
-		ret = PTR_ERR(vc4_hdmi->hpd_gpio);
-		goto err_put_ddc;
+		return PTR_ERR(vc4_hdmi->hpd_gpio);
 	}
 
 	vc4_hdmi->disable_wifi_frequencies =
@@ -3065,8 +3075,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	pm_runtime_put_sync(dev);
 err_disable_runtime_pm:
 	pm_runtime_disable(dev);
-err_put_ddc:
-	put_device(&vc4_hdmi->ddc->dev);
 
 	return ret;
 }
@@ -3103,8 +3111,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
-
-	put_device(&vc4_hdmi->ddc->dev);
 }
 
 static const struct component_ops vc4_hdmi_ops = {
-- 
2.36.1

