Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2743560020
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E9514A644;
	Wed, 29 Jun 2022 12:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5190F14A637
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 28733320016F;
 Wed, 29 Jun 2022 08:37:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506248; x=1656592648; bh=SQ
 66iLNoWkolscizgxt3QzaVuhWzNbP6LyqVs/n0EjU=; b=0baTCxO6RJhCieKr4b
 ONpeH4Ebaz1ilOBB7L0S7Xd2BenWn6287w+ne4CK97fV3xRxcoM52aUjUE4s3eUH
 AUNLC6ZbQE1TyTm8z/Ql5Q76lHwsTfR+q3xqqrcu2NPFPAVRhoqa1H7VZ2Nan3QY
 h6Su32U7Ga8PrVrCGflQZ53zcwSC0U7QCWW2adnfroH7dqu/crRjDmi2EJix6VJT
 r+SrIsXulJNcAUNF5XX1X70GUcRpBEENqEInrfbFnfyRKxZ0pJyzbTqG3KfsUbuA
 Ygup1/Xjo3NvgeZjxxBTM5SG0kzrTsPqebaaX7zAmEAFPIzdQI6mu/X5txdYaB9y
 2gVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506248; x=1656592648; bh=SQ66iLNoWkols
 cizgxt3QzaVuhWzNbP6LyqVs/n0EjU=; b=KZ7LmnXObpp2RdNBnyfwOjLnT11yp
 Ho4rDAn8XP+EpLL5LP2nswtdAquW7AJOHZoEBZdj6VhdcdRQoNQxCIres/NnmSYP
 uLPB+Gs5Ki/+Fhu95faMIBIcgKHTJWyfic2WP3BzEQ/ciW5vNgbx0slagK2PbYAs
 UalJ30c2JcY1Ed7wCJFcpXAPVCClQ8usfGZ/etTwMOtZj26q/bdA9TtQ1J1pxci+
 Xo/UZMNAVsbXnQnL14hvD7F1j4eH+PKe7pGkdnC97sTqDm/W7VUnJDl4mp14xoEg
 3kpegTNw4dieEHQblQRs8e782bgNmGTrcdWIOPbzJIiAEgAtqgt8g+rjg==
X-ME-Sender: <xms:iEe8YqfpUR23yWVusWq8d2OL9_Em509GngiUqHLB9l2ja-YdcIXHpQ>
 <xme:iEe8YkOitpNfxRkSwioIlpW6N4epQ_PVag8J2leCirwdBKUUrn3fAWMe-Ibq_GDF0
 UWti9Lcdn0EMbyMOT4>
X-ME-Received: <xmr:iEe8Yrigr6Flm-CzN5Mb6aI5oQBmfiO3HWLA4WIOwr0G9emO4wa0aapK8XQHUduTjMSOCOyu8zTD1WtomUQqMqbgdtnuWDORwraBHAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iEe8Yn8qsKCUEp_S9VuiV32gKqDjr7glqADXEzknsLpeaWsabxVJQQ>
 <xmx:iEe8Ymv2hzw-s734UBgCh7-zfoTja6bzfCwBT6mv9uBh8UcIHqYsAA>
 <xmx:iEe8YuGp0mKzb1zCkEVRCxqRHl2uLZmWa9WIOTfAfjyKndr5J548Fg>
 <xmx:iEe8YoKydeUFfWYRWUPA61rsjcLwVd2pph_7NO7Qj2hfQywzvvp_dg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 45/71] drm/vc4: hdmi: Use a device-managed action for DDC
Date: Wed, 29 Jun 2022 14:34:44 +0200
Message-Id: <20220629123510.1915022-46-maxime@cerno.tech>
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

The reference to the DDC controller device needs to be put back when we're
done with it. Let's use a device-managed action to simplify the driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 83ca1c02dde2..274f17880455 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2932,6 +2932,13 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
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
@@ -2987,13 +2994,16 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
@@ -3064,8 +3074,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	pm_runtime_put_sync(dev);
 err_disable_runtime_pm:
 	pm_runtime_disable(dev);
-err_put_ddc:
-	put_device(&vc4_hdmi->ddc->dev);
 
 	return ret;
 }
@@ -3102,8 +3110,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
 	pm_runtime_disable(dev);
-
-	put_device(&vc4_hdmi->ddc->dev);
 }
 
 static const struct component_ops vc4_hdmi_ops = {
-- 
2.36.1

