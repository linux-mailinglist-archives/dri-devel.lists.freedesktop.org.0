Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0342756B6B0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99B8113886;
	Fri,  8 Jul 2022 09:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D4E11388F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:50 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 096D932009AE;
 Fri,  8 Jul 2022 05:58:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 05:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274328; x=1657360728; bh=Eb
 gzlmH0IrZ0FiuXQtmne1cDBzit1A+6m6yHtcrTrt0=; b=bd5agLNmoP84Bchls3
 fenvUKuknfiu8F2Cgw+qt39OwryhBTmbLszWrYplU1IbvSqnRy7EuSILeA6VruvC
 vJkbSP6xx5Q2kETPow7lHrENhjFOcZwsBcHkOwWmgg0IAPFQRk3+aZtwtIF9DRrZ
 faviVPVYw/j9djbYdrfwZRQWBerPIH2DQHTc922GX7d4HJQTb5POA47Fx2b9ote5
 uuQCHkIHHEknCreOV2k3bVMasGjEjjmjXdPJN5iW12KYqk2/iHnT8fGXfjH4gb65
 FKEhHVHEJ1dG2T9pzKuqON27Iyfx7ASAhLWIQrVBozfD576+5Ad5bL53LBkCwKqY
 rwAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274328; x=1657360728; bh=EbgzlmH0IrZ0F
 iuXQtmne1cDBzit1A+6m6yHtcrTrt0=; b=aXtRyLdNyN4TGSbCE1VPRGPbZZpIQ
 WbVocCDO4UNldeHveCk0apIoUCZlGgrcJkwdpgyqSvUVrbAzfPIkRHQZf00DwcvD
 mAkkKXrKd0JHwkUJ9iXpGhKFdsGxpd3y693j7lkOusXZmeDZhx1ZRdso5xIWo1Q1
 7azvvk9R36QSeauU4nLXRzfbrumKc0mu5PgyegLvck4vNZrJ4DkqDLPu14NHqvfB
 IbYRnoyLI4laEju3P0D2Bsa49QqZYqtycQ8PSYBKkF1N81ZQV1N38851rcCEC1jo
 QuSjoz3WkcIYiRg7y0C34JArq9qwRy2C65PT/63AFUOuiFtwuAbaIMJxw==
X-ME-Sender: <xms:2P_HYvvUzWd3wvxEE5Dom-5ej1rTSGXm7SmU_95anz0cFYfeHSCQJQ>
 <xme:2P_HYgdNV2lxWTeyQaMxWAGeAxgH95u3-JbvM66Y162y_fO5OkxQwxzAZqDjb9KDb
 E7jecx9GpyOhekLhNw>
X-ME-Received: <xmr:2P_HYixuNFUroVp7T7cXa9rhzOBv87UOP6UrtJQReUPN6GkyE0Ti1Q1h4MvU8EF4K1ovKFN_56Ggt-Oles5pbJpdUjY_FVsMvlO4ecc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2P_HYuPcwV-5ZC-hMyQgNnBhYSX2oaZzAGoaJPQ4RV-W9jbop1B2_A>
 <xmx:2P_HYv_Chqmr-5TBTmHBbTsmxFvesQRx0pL3Kfi3ERHv6lrJJ6Wmlg>
 <xmx:2P_HYuW8jKcsQ7puvCqkukfLwbTZtH2m-GvPzVyrkLxqj6HQNr0eTw>
 <xmx:2P_HYqko08rRiAOl2xSEl9k928RZQrYuei9Ku4J21Tpuxwl79k2Zig>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 33/69] drm/vc4: dsi: Switch to DRM-managed encoder
 initialization
Date: Fri,  8 Jul 2022 11:56:31 +0200
Message-Id: <20220708095707.257937-34-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 72889524540e..1a55b7ea52a8 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1687,7 +1687,13 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drmm_encoder_init(drm, encoder,
+				NULL,
+				DRM_MODE_ENCODER_DSI,
+				NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
 	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
@@ -1720,7 +1726,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 * normally.
 	 */
 	list_splice_init(&dsi->bridge_chain, &encoder->bridge_chain);
-	drm_encoder_cleanup(encoder);
 }
 
 static const struct component_ops vc4_dsi_ops = {
-- 
2.36.1

