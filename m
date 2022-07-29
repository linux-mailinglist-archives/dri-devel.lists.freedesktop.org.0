Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3AC5853F3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B260113DDA;
	Fri, 29 Jul 2022 16:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BB6112034
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D479858075F;
 Fri, 29 Jul 2022 12:35:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112549; x=
 1659119749; bh=Vukv1YK6KFpFeMtPU+pPqM7OIglwqAumIwUtACYHZg8=; b=X
 OfQJnrbmK4CI59PvH5b1/hLH2Q+RKy53EhMj8XRRW6gDowlzepM6ZLKuSjGufzWp
 L9sblTBBWyAKfbeXmz6Zh6w52+U22zVCzmQGzDH3GswQLFaHV8IGjYxgcrcIMJIN
 LXbJgMLplAjj8O97diFI1vpCUQMz60nQemZBQc7xxSaaMu32l59zO/SfHm4dkT21
 6rp7Ui5RBcQ9ZQ9hu8X3tnoKtc7lk78GEgflGTOmQTRAAB/7l5IN9pjHq83aDDbQ
 hoYOFzD8dAy6yzWy5G0N619ti4ZBO4z4lJkIGqa/+ErfnPSRlQHpFYMNgf9rUB8W
 iPyydpv69nrgVJkkswB9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112549; x=
 1659119749; bh=Vukv1YK6KFpFeMtPU+pPqM7OIglwqAumIwUtACYHZg8=; b=y
 yGdVrMndN2GDHe5hUwKEWAjUKorz7JejanyGgNntt16a6aMpjYJTp94GLkff+s/g
 2UqmpWGn4Vzogr1ccbW2qKm9/PGvZNYTOTeJfgz2czRalaCE7sG05bOhHrqyptWS
 FweumVeHzlH6DtU/lrl6EDHmTsriCtFfBxDt5VD+8KvPwScCE5qY3v2jABGoFgdP
 yzY+WOnSmAf/CBfT4hQR3TD9FOD8GQ7Mz0x/Jkmq56NUAEF67xperhMMRK5aigrd
 C5DiK00rTGtUCb4mU80V7RB8vSdX73hQ97InCVj2XzhA4gdV/0WmMlOiGbcVGzQb
 Tcb/bJ8NpPk85+TinEWAg==
X-ME-Sender: <xms:ZQzkYhdfyLogS4Steh6hSkUQ_et08A84GWMG9_pHtPzwatkzX3LYAA>
 <xme:ZQzkYvNC6W9CZWZbCkBCAcouNulshoxN6spV3lBk8y0inZf6jfBnqm8mVIj6tMW44
 yJ5rnKJunNh7FVj4Xk>
X-ME-Received: <xmr:ZQzkYqgr3KG1wT3GSwxqoweT5sbiMKV5XnYImoXoITGXqT4SOrIEpCZ3cZ1J5Bms4o5C7ndItf0t4DIkLuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZQzkYq_yuu3WWlrIgXHt8H_J6PixUhgtfvCKHRo8v7X8SAr_jaNyWg>
 <xmx:ZQzkYttSOubmL35-USJakD8DariUAu5tyiudJq7PmcLc42pTn9DCgg>
 <xmx:ZQzkYpGlEDqjJtm8lkr3NK2mfEvyeVIHGUdsuqwt8eG8iZK4uDKSog>
 <xmx:ZQzkYs8BygWcGtiTlDA0w0V22JWzM5SXTs1buM91ON03jPg08sgyaw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 06/35] drm/connector: Only register TV mode property if
 present
Date: Fri, 29 Jul 2022 18:34:49 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-6-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=r0YGPY/lR3DbpNDfMeJZNI+IjZaGoFc9GNv9eKuIsNA=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHq+DhJr3FT9FW/hPvh5RJJm696M5x7WdSZZ13l9FZf
 q2ZSRykLgzAHg6yYIst1wbd2fGFRbhE8HzbDzGFlAhnCwMUpABMpfMXIsOmnq2Sb1fa8oKOvuJa9e1
 S24xdXs84euxsa63YwGL/Iv8zwP/UvX4tdlV+k8tSlv5iPKU2auWZqjnspq5D4mktS1j9C+gA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_create_tv_properties() will create the TV mode property
unconditionally.

However, since we'll gradually phase it out, let's register it only if we
have a list passed as an argument. This will make the transition easier.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 68a4e47f85a9..d73a68764b6e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1684,7 +1684,6 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
 	struct drm_property *tv_selector;
 	struct drm_property *tv_subconnector;
 	struct drm_property *tv_norm;
-	unsigned int i;
 
 	if (dev->mode_config.tv_select_subconnector_property)
 		return 0;
@@ -1723,15 +1722,19 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
 		goto nomem;
 	dev->mode_config.tv_norm_property = tv_norm;
 
-	dev->mode_config.tv_mode_property =
-		drm_property_create(dev, DRM_MODE_PROP_ENUM,
-				    "mode", num_modes);
-	if (!dev->mode_config.tv_mode_property)
-		goto nomem;
+	if (num_modes) {
+		unsigned int i;
 
-	for (i = 0; i < num_modes; i++)
-		drm_property_add_enum(dev->mode_config.tv_mode_property,
-				      i, modes[i]);
+		dev->mode_config.tv_mode_property =
+			drm_property_create(dev, DRM_MODE_PROP_ENUM,
+					    "mode", num_modes);
+		if (!dev->mode_config.tv_mode_property)
+			goto nomem;
+
+		for (i = 0; i < num_modes; i++)
+			drm_property_add_enum(dev->mode_config.tv_mode_property,
+					      i, modes[i]);
+	}
 
 	dev->mode_config.tv_brightness_property =
 		drm_property_create_range(dev, 0, "brightness", 0, 100);

-- 
b4 0.10.0-dev-49460
