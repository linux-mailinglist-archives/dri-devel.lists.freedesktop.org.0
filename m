Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E760E491
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B27D10E369;
	Wed, 26 Oct 2022 15:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3696B10E33F;
 Wed, 26 Oct 2022 15:33:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 97717580350;
 Wed, 26 Oct 2022 11:33:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 26 Oct 2022 11:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798418; x=
 1666805618; bh=3wY6yKKgv62AzcXoVsot8I6uOq+GeKWGAKfNV0+ifuQ=; b=g
 hceErbCsEqetUGGRzw01HnALuJgpx11t9opZyD1KyaT642g8zh/scGpnQEaSHmgZ
 LEfgZxJMDnB2R0+arfp4i94nHI/Hq8kOzEDAKcPiS1pM740VRx1d7Q58fZ30ixMT
 s+VhrzIdWB3fkzXLGyuWxU+bjvuvmsuWWzF9dgt98dc0+CAutl5/+w5loSo+ZoXw
 lAyoHGQfmEui5S1eGNxhM1i9KTxJG73244wnScpU+QmCx6NxZBcIVvGf7Vg/CF0Y
 mORvPyQEYE/4aHiMMa9giKCKSx+YbzLqpEu2VZx9DubACkIKyZOAk3CYvvXGdnlk
 sRmCIwhr+b0uZKsd4DXYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798418; x=
 1666805618; bh=3wY6yKKgv62AzcXoVsot8I6uOq+GeKWGAKfNV0+ifuQ=; b=S
 F6GGD/Qppnwbm8QhpMgMCgoikBONeIm2ULku4txoVzvlg4CngEFEO6CYO02Nz9Ex
 cgQmXNTWS9EKViPO0GLGxEgW8OZMH6ocC8Oer8TppSXWTeVy9Qmtk9AOxXXxpax9
 UWiHqnTKeFp9YHqyQM5P5R1apbnAlihPdK/SDGNQWaPpCAay/mAqeRbXrCSTdn73
 La5MMs5MY6Dzt/s35KhtFSfYjrm5+mLjVf+goM9ZF6UZqXMYTtnOiji835jazcDB
 P8BSzne9xQlzBNdX5ZOqXwUSNJjQATeuShkmJC1uzG4otG9GEajGlu5tTCM9ky82
 6pyG33I9rEI1/MHjshcNQ==
X-ME-Sender: <xms:UlNZY73zSjuCQPDt5DmMklNUtz7c7y6hsHRRABji723Gm5GlBj4qtQ>
 <xme:UlNZY6GxF3Ze63jjn2_DEtIuwAu6EB4i3nW768jzO8F3RAkXyaEZSo8sHwT1vScUp
 _VLodc3PzGUxOJglvY>
X-ME-Received: <xmr:UlNZY76feedIrzDk-Pbt9BGolqcSz6xuUuLE_O4g3eC4AfqqEWxOYMwUrdxT5vFJlfOYQqiuq5X1vDC0tUbRSzh5MdqNHLuMCk2iivn2QicBdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdekveelgfelveelfe
 duheelvdegudffgefhudehgeevjefhhefhhefgvdeuvdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:UlNZYw0kWSBsgAQWLeHQe09NOencBToGn3bSxZwIgN-8xOI0tgT-yA>
 <xmx:UlNZY-HLl5rzXgiknlxrxeyD0hpJcpI9nYnq9vjnI13j1w-UJaUhpw>
 <xmx:UlNZYx-RIMb4bCKkD2cUCodQSQZ2oaBA9c-SQYZ7FUd15menj6NoCA>
 <xmx:UlNZY2TvkJ-G-F-tZFMyjpq46RqUERFAnqecud8JgJrLZBF8Fvaaeg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:37 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:22 +0200
Subject: [PATCH v6 03/23] drm/connector: Only register TV mode property if
 present
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-3-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sLt4af0dUCmQjTio40kJN6vvpvfJgA2YtBOMCgzR7Zo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW4JCTV99dG62ucNVyc98+V7HS024fqy6kWnvsxvcn3a
 tb6io5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMxTGNkmGryJZ6pSqnxVkn4VqXoFd
 rvOba5M8ucDPtx6tyRv9kzXjL8T39nXPghTKT/BNPpjBlda7Sv9Xy+u/ZCVUHfgkfHXOpsuAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_create_tv_properties() will create the TV mode property
unconditionally.

However, since we'll gradually phase it out, let's register it only if we
have a list passed as an argument. This will make the transition easier.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ede6025638d7..17a5913cefe3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1686,15 +1686,18 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
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
