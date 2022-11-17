Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D462D6D3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A9910E597;
	Thu, 17 Nov 2022 09:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFB610E593;
 Thu, 17 Nov 2022 09:29:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 113F82B069CA;
 Thu, 17 Nov 2022 04:29:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 17 Nov 2022 04:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677346; x=
 1668684546; bh=XWqHG0ugO/KF71pgDQTt6xRnJ0HMhYVNq0XbrZsO0vc=; b=Y
 jF7IDppe6yneQboruPODYnqwCoKhgkpK9HY6lj/gABdiLmyHfELryY/UQOoYZ2qk
 azqLTT0LdPNmfOgS2zqasc6oFy9NTLFLHIbK0FWzEAE5HsifoqCtcG45G5uj30uM
 uN4j14Nr1fq6uyRXPQGu3Aa45aqHg9UJdQTQG25KoY3Bg/DerOLM25bdgnZyk7vx
 ME3r3i+58PJOO11vVwNPEVzSabMC2By6m934gpBO4N+GKv7zIXYaFn+CZj6jx5aL
 Ka52Ce2UmSK0WGXb/FFF09PJKaS7GuipALt7nYA4LzcBCyTnDBzQjSDuP6EzXOeF
 z/I/s7YL8+MjIpNGbZNzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677346; x=
 1668684546; bh=XWqHG0ugO/KF71pgDQTt6xRnJ0HMhYVNq0XbrZsO0vc=; b=i
 oQdkduC45fH/n829SeoFvs57Gvdz8dV+TJmK8sO9kbbvFiMStv7s3rWsnsvPeJXg
 VJUsu+xMZV/dV0hxfjn8sC50cS7jC0ozMbnjH7xOQsTXF1wiKd/KbI5YwEccaQi5
 BmrZQpOqszCGPr5AMZ7NYA5+9IZJmhHjC4zhqdYfupprgCuvWeM1GfQlFw+cf1Hl
 kc0wlBKZehsWz4a498Sr7nJGKkLx8xTyoqvgQK3OFqrr6b1r7PUMPx6VIcg9Y9vr
 gTy7xzgbPNBLJXdGXLzIA+pE+5TMIfnsjqP/tHxyZbcvV9jW2qKm1ouV8FkSCpz2
 IcAcQ7c4GCHrzOAS5QdCg==
X-ME-Sender: <xms:4v51Y6AA68H_FTL0W2wgJMOT5ZStNOnHQcM3WThMR1Yk09YjhTcx3w>
 <xme:4v51Y0ggFU_cD4wDL4L-zf3qYqTMe_y8RgzgChHaMf9QIQknWOs-5ro0pNTY73F8w
 sswx1pSlusmbgtIgBc>
X-ME-Received: <xmr:4v51Y9nGv9D3m749T0F_nRbb_91fZP1T0G5-E-2REam7DHxRb-cUIEreS0FWXSy0yyEMUWge6zm_a266gmYNPFkwdXFetRhHGlqd4DiEQ6BKRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4v51Y4wMPvEfxY13J_qC7Yge5sgFz-KQ2xg9tN1pxxfXyzyl5sTKrQ>
 <xmx:4v51Y_TjBKw9A2rLOr6twGVC8JgvfY7y7FRhQtA9xuXVaoqigiNuaw>
 <xmx:4v51YzbjuOBH3uOI3ged1aC8rKYT_7-mP4LnLj-L1lstPlrwcxNUiw>
 <xmx:4v51Y69Ocs4DNE9rg5W4SyCGusceLSmGoD7NoYGUCR95yYNj5FyKF_aWmdo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:46 +0100
Subject: [PATCH v10 03/19] drm/connector: Only register TV mode property if
 present
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-3-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8uVhL7qzOAhSYtnGt8Ufng4gvViIiWyq0mJiST1/yTc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y60P4l8d/rpmevLzFLf5M93eXWM/9+mt3ez1QTO7fpl
 MyOppqOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATCWxk+J+75clpuS1x2QoVK1idFm
 bK7e98lHlNcNWsrOeWZ0+rRi1lZFjKsGH9+uJXGt1nIu9dtdR+WtjvFtohszxQ4/uMvzsnxHMCAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_create_tv_properties() will create the TV mode property
unconditionally.

However, since we'll gradually phase it out, let's register it only if we
have a list passed as an argument. This will make the transition easier.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 05edff79d312..78fcffae100b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1690,15 +1690,18 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
 	if (drm_mode_create_tv_margin_properties(dev))
 		goto nomem;
 
-	dev->mode_config.legacy_tv_mode_property =
-		drm_property_create(dev, DRM_MODE_PROP_ENUM,
-				    "mode", num_modes);
-	if (!dev->mode_config.legacy_tv_mode_property)
-		goto nomem;
 
-	for (i = 0; i < num_modes; i++)
-		drm_property_add_enum(dev->mode_config.legacy_tv_mode_property,
-				      i, modes[i]);
+	if (num_modes) {
+		dev->mode_config.legacy_tv_mode_property =
+			drm_property_create(dev, DRM_MODE_PROP_ENUM,
+					    "mode", num_modes);
+		if (!dev->mode_config.legacy_tv_mode_property)
+			goto nomem;
+
+		for (i = 0; i < num_modes; i++)
+			drm_property_add_enum(dev->mode_config.legacy_tv_mode_property,
+					      i, modes[i]);
+	}
 
 	dev->mode_config.tv_brightness_property =
 		drm_property_create_range(dev, 0, "brightness", 0, 100);

-- 
b4 0.11.0-dev-99e3a
