Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F86240D1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546F010E6EE;
	Thu, 10 Nov 2022 11:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD4510E6CD;
 Thu, 10 Nov 2022 11:07:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C00A35802EC;
 Thu, 10 Nov 2022 06:07:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 06:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078445; x=
 1668085645; bh=XWqHG0ugO/KF71pgDQTt6xRnJ0HMhYVNq0XbrZsO0vc=; b=a
 DW+ZiWp3AfX+W8HOq4Jok3dLgy1b1p4eWb8FrEkBIvZuf/23DUNHHaC1cvPxXF2o
 aGuuCeJtQq7miQTUOyMlWxgBiU+KHLxjmaG8czQ6wlMFTr5nrjA0DUzvXDdrLzPT
 P7aWiK1GiDtZ40TOrr2jOLNCQqhD/7HDbxnnFoRZuWhqKkb1k5sugiuryHLN9NJQ
 o7YMbWoz99xz+64j3nqf7TGiJCH5t72dJtHTVQMg6HB1VKZBhoHKPO03s8zfR933
 Ta9wVXP3/MTyqx8d3HPSh2z3BYUuvb8U+5yHn+aF9/9M5BSvP5Hg9HfbarE2tqf1
 jgZf8rWY5eMbMvgR9HJxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078445; x=
 1668085645; bh=XWqHG0ugO/KF71pgDQTt6xRnJ0HMhYVNq0XbrZsO0vc=; b=Y
 ol6L9RRD99yRcJfin9kW1U2Rogj9BUB3IWqF5CelDRMHYjiP50xS9VSU9YSJYs9L
 G4dnNWsMuZKP0652CgAT5X5bBbeED2aftd3PgP6BTwgeKp+s7RIOmTKex1SzbNyo
 IB/XnVdAB3cZXFMaoRzAfQ7CI7W5PiAXY3FiUfhJ7ItXXteMuIcRFAOOpBhX81ES
 E2f8z4ByXxj4TcnoX3Y6G/1YShZrlZOgoyzT2+KM1ff5W09Bofj7EvGAb95yiWy5
 xa/cuQKjnBewrRJV/lY77OsbIQXWOz1AaMHKDW+jKUT6Y20eINfxYM2/eTdfU8S8
 x2x986DTvrgGw7lLpG9aA==
X-ME-Sender: <xms:bdtsY8e7IC35tFwWZPq-kavXOXDHvFEnYj-Xz_Q_qrzw9h4WxHxRGw>
 <xme:bdtsY-PZDpUk8WMECDtVv2daIgAqpjqq4InLH-xuJt7hpHLPGdcwmkZ34Aulu5UJQ
 GzFYO5Q5JEn7i4Vro8>
X-ME-Received: <xmr:bdtsY9gPuX0KMPy8Nz47Hc64DdoDB79Lw5bJF3d3AdbdiJG174D0alw-B9QaySmYx113JKlZ3K8g7wh7xOVNsJNAaHbkY49G_OZJrgFQDyrf-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bdtsYx87C_xBgsRjuAm2qM-3nKPhlFNWJ7iw3jhvtKTiz6zhWaIiXA>
 <xmx:bdtsY4vKvQY2AUHHe0AV6rXrmQ3krxm9SCIo6Wvk53WteA2Wf2wSRw>
 <xmx:bdtsY4G70iVuQ8f8XZJHXopXXRNH2FBlUTrkJyjF-LtUBn7H-xJOcg>
 <xmx:bdtsYx5s8X9qPcxSoA11MJconuUKS9TVbDpLbNtJv13HjXtfWeq36g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:15 +0100
Subject: [PATCH v8 03/24] drm/connector: Only register TV mode property if
 present
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-3-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8uVhL7qzOAhSYtnGt8Ufng4gvViIiWyq0mJiST1/yTc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1PO56TFffjkZ2R7oyZgSvHqh7PNujS7FjTHp3W9Ocwz
 6bFhRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYS7cjIsH35PrHstzKCcc8Z1ssHNI
 kqaNc6Lkpf8uDYSr/Kly8j2xn+ioiJ9smFLjB9arf9efUd4U1LGacFKmzY53/0UOnDxuUHuAE=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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
