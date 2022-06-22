Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05877554D4E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E50113334;
	Wed, 22 Jun 2022 14:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E768B113361
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id AF3D7320095B;
 Wed, 22 Jun 2022 10:34:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908468; x=1655994868; bh=M/
 KkHqr+LkETaYmgUC7jynAQbjRPTuJCq3SHBPtmkic=; b=SUBgZHczej6AuthZoD
 gcx+8VRV0Fk44JnCgjqmthpiAo6KtN4AltAOU9QfgdrOEZ62JVlzdRanG00CWRE9
 /cwoDr8GfL8G5kGjcEq6AWf2m5dLjbGHK4rSThw8tVwzCie6c5fxTkGBj+dg64fe
 bQyJZnaCO0MbRdewc3m8E4jiVBdNjTq1WkoidOtbfm8OkcITt62F6YW/XRMCZZLw
 HwJL1Vrh/IhvMu/sZr3fPuI45twqSuMTpZZQBjdHJc5+NZUpTxo3p2wVAWBTffKH
 stmQwaW3YTSKKhYDe+yw+99+ChbORXMfeDcwWDmmmZ8plClhKn5U9xDNCZ1lNNsn
 O+nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908468; x=1655994868; bh=M/KkHqr+LkETa
 YmgUC7jynAQbjRPTuJCq3SHBPtmkic=; b=nwwh1KloVCgFQ25S8IK5WH1r4BGb0
 /DPgc2OEUcCSPHBCFvr2O+orA4SYh9P0tS+Uw24vX46cjJtLT9d9jXV1oLo8Emgt
 +ZGbW/ZkPaPWh2ZlYJ0XZsoQET7eeB/cOnWMHCiSRuZEdxkDQVA498Kd/OPKlIVN
 BNo6OhpNvKcqHbnvW2O1nQyDbmHx4BgJdo3PHrTF+/9bDzijD9HgMr0xOZ471cN4
 e73Nw6+5XAecfFTkKXtnvEZaGaeT5+JSa7ro2sKe75LDyWmkXuVD0stlMXiw4KfO
 mUE00AfracE+8deohlnhkzNF+YAAoV/BHpD45HdVk963MDg2W2JHmhGvA==
X-ME-Sender: <xms:dCizYp8KsHRYhzqT-4VDhPTchyBIE4oL7hev-ckAP3wCK-jbM0NCYw>
 <xme:dCizYtt7Cc1goWpbp3eIqA0918RJeEsqIYlQJ41rJ2LGz-NGNax9WiWKdUQCm4q5h
 iI2St9Aj40O0Zt3UWs>
X-ME-Received: <xmr:dCizYnDWlOEK0w9A70oUelj3aSbCi6UTFreivS2LrIDexuLpHb1x9pJ7RX2Lu3mB4kcPYC-7x_onSrIYxi9GmG0tdKoIHsBk2oRdmsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dCizYtdZK9ln5c0hthLyji-7xHpwd_rj3l1z5VQ7adwBRhg4yFG-mw>
 <xmx:dCizYuMupOqG0CLL9YUWLouexPBBbpq9EJudeM4o5ZeNTZ3UjpVL2g>
 <xmx:dCizYvmEMv5iqYn934WtM6b__V-_XrKlNzLXAD_mLTCQCPIdDQIwYA>
 <xmx:dCizYrp6OlykTe1rbSnILOWw51lOiX5rrZdR1699kooV9YQi8jk0IQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 42/68] drm/vc4: hdmi: Use a device-managed action for DDC
Date: Wed, 22 Jun 2022 16:31:43 +0200
Message-Id: <20220622143209.600298-43-maxime@cerno.tech>
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

The reference to the DDC controller device needs to be put back when we're
done with it. Let's use a device-managed action to simplify the driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 36ded0f56548..350220786bef 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2858,6 +2858,13 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
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
@@ -2913,13 +2920,16 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
@@ -2939,7 +2949,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 */
 	ret = vc4_hdmi_runtime_resume(dev);
 	if (ret)
-		goto err_put_ddc;
+		return ret;
 
 	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
@@ -2994,8 +3004,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
-err_put_ddc:
-	put_device(&vc4_hdmi->ddc->dev);
 
 	return ret;
 }
@@ -3032,8 +3040,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
-
-	put_device(&vc4_hdmi->ddc->dev);
 }
 
 static const struct component_ops vc4_hdmi_ops = {
-- 
2.36.1

