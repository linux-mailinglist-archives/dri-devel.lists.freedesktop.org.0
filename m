Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5856B6B6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9AF113882;
	Fri,  8 Jul 2022 09:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C9B113882
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4933432009E1;
 Fri,  8 Jul 2022 05:59:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274357; x=1657360757; bh=i9
 ggCIUu9asxUtkUoiHDBL4wDwUVp1r254y+hSsGwWQ=; b=M866F+YgRp8MKptygG
 wWJyU7mpnk9Jw7VlVI+IeKcc65zhh+welVf7dVFjwCZ51OeN8Zp+ONZkM9KcPg4V
 8n8N3me4S6K290nXdBSITqAvJ3cersTppK73KBRYB0/xe9ygCHUJthoOTZIdE8Sk
 8qHwFczVlKJq0gXT1+jdpaUpasS2Q6gep2yh/0JNSCQV6BaNYmZjQN/Izfyo+lxg
 1qGUQVp3FSCgYdddUsLaLGK/shpkhtaRBGAsHMAhhSSAL4bMqNcaSDLK12a9YEjI
 z70yBtZLgKkQ/W8Oh4ZI7SiJgfTFKg82tb0kx70Z3s8Eow8zuQoAR40nUdqPUl6M
 D4Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274357; x=1657360757; bh=i9ggCIUu9asxU
 tkUoiHDBL4wDwUVp1r254y+hSsGwWQ=; b=ad8kOuUIf0ZwRrciBG+QXtPtIDTym
 7JRJ6RxJM1fQFFw2cdkOhouE5brpXNihrDI0VEHrxoE0jNFMXY/IQ7DWYqV2AmkJ
 dc8wvssRmFhCBDV9aWRrQPDqIzZ38ege/uZQ98fIQRmlbnDydzrqBCSpeDtl53Yd
 8FokcnS5hAJ4KrNEZeNJItIJsDZAW8t0JqARaH5tX9IUOLD1ADFO9IPYdezag0nc
 XSeyfR9vzraMi0mJXwq+s0GdXAQ7vv35UaFsPBMA3TbE3ny9ScZOJNNvPnaNWAJo
 ogjqdTZqPW4J//KcKZkOkFoAKph3058NgQNxbLbA0qTyjw5tAVnnuL/Fg==
X-ME-Sender: <xms:9f_HYtcor3d2xAsQK9rpxcv2gBakRFv2WtDGtkqDhmN0E6wxSB6j3A>
 <xme:9f_HYrOpb7QvP6TrYf0OOMZmKo9KFrJP6SWxU3IZIGGS9tQEmyabEfp52uvydYYID
 ob9fMT471ZVZjxObaY>
X-ME-Received: <xmr:9f_HYmhrZsiRpmn2tmxHji4D4oS97s2l3ZEEIMEdQIF27tcMYL4I6TbNw9f82_TIOdPb87ohnRvpAYz0SfRyIeBtmmywf64eI-wnD2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9f_HYm-X3tDorB0ygX9IvU6Eibpv59WzCtuYP7a-Q4EWJDRrTUdMRQ>
 <xmx:9f_HYpv4awPT0GH36Awa_gfBPMcyp0fE5ZyV6w0eDIz1FNBdDktJ-A>
 <xmx:9f_HYlG4HpDmwRINIb9gBcOuk1XU3tnfBqBW3LNi6_Q0YeXUqEwQkw>
 <xmx:9f_HYjJ-oamiG3w9siA2_-q88MX6tHy55jUUFbERqd8UkwsCmirQ-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 43/69] drm/vc4: hdmi: Use a device-managed action for DDC
Date: Fri,  8 Jul 2022 11:56:41 +0200
Message-Id: <20220708095707.257937-44-maxime@cerno.tech>
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

