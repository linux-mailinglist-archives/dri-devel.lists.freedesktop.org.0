Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FABF546250
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3821B11B3DE;
	Fri, 10 Jun 2022 09:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3D911B3DE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B73A65C01AE;
 Fri, 10 Jun 2022 05:30:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853437; x=1654939837; bh=LG
 2s29Q2wCEHhbxknfeIVyGJw7GQY8kWj8VeYfe10T8=; b=YP9rVV0ZSqbAWW5G1y
 UCJmKmzbWvBv7yWchnf5bv284uDrECxhtPJv8SLj6jRQzso7cwZszo08S50rZCfg
 lgbzPk+HavE58imyBeuta3Q4tl9AsRVd59BWof1jDuwDkZ6QAnvj0b/ALc+5GKQY
 b3hxI6YCReWSSjBcO9iR0ODJOVJLjQCr3ti6mFmOVN5qXVBNNWf2D/D/iuzxnkUB
 khFcs349qD2IFyPKjhiDNlKMO41ePc8JhplSjDO8+gc/ATdxM3n27CD+hWoVRr3p
 5wBeO5RODdoY54nwATzA14AyaHmQaUqRMJhBYuQ9EWktgiGvpelsbEdfXuSiIWB4
 tuZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853437; x=1654939837; bh=LG2s29Q2wCEHh
 bxknfeIVyGJw7GQY8kWj8VeYfe10T8=; b=GZkAViDR8o0lM/q/NlITJnPajN5em
 lr2ikVt2sRJE4UqQ1r/fXs0W4Dh+3tgT+HARt5ZBOpA1EdkItBdEiFiZRhwU2JB/
 n3AHwyzM8gmxOsVe1j+nGr9HDuURU+CPce6nSp+GRikku0k8cygRIqrV6D0ieO26
 jPnPH6+GWoGU/aPmWHUxj3CMZvQEZMCrucX4Z9eEg+gIQdFMlEw9ki0xBhZvIvF3
 xhLapidP6B0xR1ltAYD5P7L3bG43tiPgrq4ezvwKLanj/rL4Q1OsEV/9RMAgDxl4
 7sq0gc2P4JfeiVQROD8yZnAindebdIxQLEzMdO5YfgY2jJfX4FftkInVw==
X-ME-Sender: <xms:PQ-jYsx6lPmCrFQTPZFb7uaCFrF_D7XN9YnygGqPjiN4ksQojEzdHw>
 <xme:PQ-jYgStkQ7-EkRZwJIqZiJ7IAqhSCrdkmzZpgi3_EOWPtaL3AOE9Gd4slmCkEUOq
 HSUxTU5nFyJdyplhGc>
X-ME-Received: <xmr:PQ-jYuWaiAQu_jZt2PEmTEkakVQr7jEyDQZF9-t9LBhcBjEqLW-NkpqLoaqOPPRaEIeIq5hhiUC1HhcFAcJDOygCNY-VsnagBH_mAHk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PQ-jYqgdU08QiURCSdVZAUXZm34o2uQgoltHMFE6QyiInHDyqo1eQA>
 <xmx:PQ-jYuBULLaSoYX4y5AOR0GyLE1xStUMhdGkpBOepsfJuaDqYsd1kw>
 <xmx:PQ-jYrL_h2R_JEhMMghzBqE-ngCAjs1hJSGsMArbtg9iWOM1C2DMvg>
 <xmx:PQ-jYh8lGq5hWAJzAab9YU-QvDZB_B7xM2sjn6AziXduSEy5CCtcWQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 39/64] drm/vc4: hdmi: Use a device-managed action for DDC
Date: Fri, 10 Jun 2022 11:28:59 +0200
Message-Id: <20220610092924.754942-40-maxime@cerno.tech>
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

The reference to the DDC controller device needs to be put back when we're
done with it. Let's use a device-managed action to simplify the driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 402bfde3b5fe..bb9bd0c701be 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2857,6 +2857,13 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
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
@@ -2912,13 +2919,16 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
@@ -2938,7 +2948,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 */
 	ret = vc4_hdmi_runtime_resume(dev);
 	if (ret)
-		goto err_put_ddc;
+		return ret;
 
 	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
@@ -2990,8 +3000,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
-err_put_ddc:
-	put_device(&vc4_hdmi->ddc->dev);
 
 	return ret;
 }
@@ -3028,8 +3036,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
-
-	put_device(&vc4_hdmi->ddc->dev);
 }
 
 static const struct component_ops vc4_hdmi_ops = {
-- 
2.36.1

