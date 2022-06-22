Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE46554D22
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC06112716;
	Wed, 22 Jun 2022 14:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E30112716
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D0CC83200979;
 Wed, 22 Jun 2022 10:32:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908370; x=1655994770; bh=hX
 MDZJiEHNa7xI4oC8nE6TSYG0uKDhp4JLDs8W/u5bg=; b=1+olxdTkqVegAwy+gt
 OpwW2GJ0uFv3fL9FL394pb3YXCg2+Qn1EHT78rPY4LdFc2CGbz3z8tKimOpFQ2yF
 EGt5CznOob1GI7cYQlPcQDFhQD7OWIYUa48fbizi9MZQ6Bw5th5NmM7Np+Q/+0w4
 yGvCXLwX7IGK7LQNxyFqalLmGfCJjygO1PekAe2bJA5YXlq7V9u8TsZ3BnpbIGPY
 /tkQMhD2DCAkoo703ckkMzoiXQbq4/ih1zInH0dl3D9WGr2OjwIoVC13TzV3vuNC
 IgnA658RYCWX7husVsJWUB7eauRYk1E4wkafreHdnkIMfOWEutPmRHsPJT47HXfX
 Eq5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908370; x=1655994770; bh=hXMDZJiEHNa7x
 I4oC8nE6TSYG0uKDhp4JLDs8W/u5bg=; b=WvoNi9kcgS67bAB29odqiGfGQSpRs
 xHcZ0X06/Fz+WvpGmLvKYnVdaedoiNHxahsUJy6dX4pKceue0mLXhUhcEK5dbF/3
 el+7WKrhkCiPTRlJAbSi+jncviKlVGOwA4l8pzkOfPmEIJjwvHf0NEPaL+JjvasD
 CWBpLp7JYUOLWdo5FVQcIXrqdPkLAgdzIs48LKlmBrwvRbzWJrJC26ipTWr5MsYh
 m6VmbqUxNiIIuVM3h6Fv2RwBjy9xSzKJY5QF20CUr7p1NTygklNYYink27azj/kF
 27UZxCorRKNQSmiwWz3EPtmshUYmalKdcCOVF1mSla02GEStQdw+dRCcQ==
X-ME-Sender: <xms:EiizYnefKZturd245DawE_00t_OZfu-Axbs4FhdpLcBydEXETVG_0w>
 <xme:EiizYtPrp_FmOitSr1jZMI0sCwIAzxftMFAZ7H4K1_jpfFLdcy5V5LO5O3qP5YgN5
 MNub1ofJyan7SJbpUs>
X-ME-Received: <xmr:EiizYghTQxoiOhbQ6LLn3wV2kyZ4t1sPopmBH5yZi7VyHpmrqGpSjCC5A-UGvGL8U-SqmCQnQlNo9OYaP3UzyPfTc9EAm0QfgUkqLjo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EiizYo_2hmuyC0JB_a_aehY9PTeDP3A7L88jKK971oE79Y49QTUG-A>
 <xmx:EiizYjs5E5R0W2Y5j6kWHL6l7pwHNQJxiYepyF7x0xmvZFIzTbIWrg>
 <xmx:EiizYnH85L4AUnuwa8pHUSbpEIojBES3RGBcDmBIf0DzO5TQvcCs5g>
 <xmx:EiizYpXSCG6EzchwvvMzJmnrvEcEkCyOuGdX6HZyWxanToMJvaZ7VQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 11/68] drm/vc4: drv: Call component_unbind_all()
Date: Wed, 22 Jun 2022 16:31:12 +0200
Message-Id: <20220622143209.600298-12-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While we were using the component framework to deal with all the DRM
subdevices, we were not calling component_unbind_all().

This leads to none of the subdevices freeing up their resources as part of
their unbind() or device managed hooks.

Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 14 ++++++++++++--
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 0f0f0263e744..90575171824d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -267,6 +267,13 @@ static void vc4_match_add_drivers(struct device *dev,
 	}
 }
 
+static void vc4_component_unbind_all(void *ptr)
+{
+	struct vc4_dev *vc4 = ptr;
+
+	component_unbind_all(vc4->dev, &vc4->base);
+}
+
 static int vc4_drm_bind(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -291,6 +298,7 @@ static int vc4_drm_bind(struct device *dev)
 	if (IS_ERR(vc4))
 		return PTR_ERR(vc4);
 	vc4->is_vc5 = is_vc5;
+	vc4->dev = dev;
 
 	drm = &vc4->base;
 	platform_set_drvdata(pdev, drm);
@@ -341,6 +349,10 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, vc4_component_unbind_all, vc4);
+	if (ret)
+		return ret;
+
 	ret = vc4_plane_create_additional_planes(drm);
 	if (ret)
 		goto unbind_all;
@@ -361,8 +373,6 @@ static int vc4_drm_bind(struct device *dev)
 	return 0;
 
 unbind_all:
-	component_unbind_all(dev, drm);
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 93fd55b9e99e..c48a73914200 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -75,6 +75,7 @@ struct vc4_perfmon {
 
 struct vc4_dev {
 	struct drm_device base;
+	struct device *dev;
 
 	bool is_vc5;
 
-- 
2.36.1

