Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12561627FCE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EC810E2B2;
	Mon, 14 Nov 2022 13:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F25710E1DD;
 Mon, 14 Nov 2022 13:00:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8EF09580406;
 Mon, 14 Nov 2022 08:00:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 14 Nov 2022 08:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430842; x=
 1668438042; bh=XWqHG0ugO/KF71pgDQTt6xRnJ0HMhYVNq0XbrZsO0vc=; b=m
 CXW2WiskFTT96m7/d24kWqJeA02FsUTqpgNdrxB+3BcADZOvZBsj4xCbM9qV0ygK
 R2WoyoEYF8zytvCbOC0gmk/9ZRpKGbzgKoIjJBJKfK4FfGGknbD7+N3ny9Zj3YSW
 U7qqUlVjNiXpRGzJYRvVF/8KdsaV5oBmu9nxQN4LX69vAHSLkVdBw38LdVnGVrrk
 j0UqkiWrCeK79ZLwmqM4sA85m0VVXD7Mo/ze6Gq3rUetIHaKBZKWD3MbkZPXpwXn
 /03q8R44LQR1YEdkgMVs2Bl3mWaP5b1icGiBzV6+3WxCNoLIxrtGK/su1X2DuPpk
 QspDEbaA8npAbZPt9kLwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430842; x=
 1668438042; bh=XWqHG0ugO/KF71pgDQTt6xRnJ0HMhYVNq0XbrZsO0vc=; b=I
 qaFaTHS0DYCvINZdHI8GFnRkbco0kN56Q8YLaKDX/YvTmg7pdiRE2BT7BdeN1ErK
 PHqhg2gzNH2DckyRoAc5WovQI87Q7S7lF0BFhZijtxuDsigvjhRsFNKb0qwUBoY2
 b7PZYmcrcsnFrJLnS9S0Zz5UUwrSSKiiRScMEXo/cgfY4U6FkoDyXAP1nPQtzxV9
 k03Acd6+PdeHjFRjD4+H3IvaqPwRiCqZK+ZLhOyccfIrn6Z4gzRRt18+zDHjRrqy
 yX//9IN3siBwU/N2TISdkia5GXVzF5OKsFRQKkBNyenSOQ4Wix/DZtxySplNrYgT
 4kyMqS5jyvfeb9F2s+7PQ==
X-ME-Sender: <xms:-jtyY5X37UWmGVqpG1HKw09f3wDbRT9ic_UqSme-U1EdaSBDotCFFA>
 <xme:-jtyY5lkFE7vSHNSmgLFTu2UbtbuAcUZwXmFccmdH1gLHLWoNvfDE54BGafpzssNV
 j3x8ZgzBgpQpej-2tQ>
X-ME-Received: <xmr:-jtyY1ajfPO9-5fDRD3r3F4gowRsbBdcV-o4jVVY-OqhRho9iL1WDga3rxKBJhrOqSlf7xCcmJ9E-XZ4XrOplq3sdxT3leBkHbmrAyHWYHXmrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-jtyY8U7_BKuD60zGQhQqDSzvmnVLg5NeTyYnXwpc44_Q8nTpi7hqQ>
 <xmx:-jtyYzk1-N4AJk1AViJeed_UgrXWtrzMyrHmUyUiOf5iK7U-0tcmYg>
 <xmx:-jtyY5d78u4c4QQM7CRpqVXiYtVPZDUp6VQ1pCDraWPtnUGB_N-J7A>
 <xmx:-jtyY3wAqhi-KhDUdnLyuKb9NyEHc6lJWEDv1_GXNsZrqOiTfllpbg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:00:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:23 +0100
Subject: [PATCH v9 04/25] drm/connector: Only register TV mode property if
 present
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-4-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8uVhL7qzOAhSYtnGt8Ufng4gvViIiWyq0mJiST1/yTc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1q9/vOx5Zb6u66sKr8kOG82wRU0dMiu7eSSXFP/gtF+y
 9p5YRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbCsInhF/OBmgknemb1sLoFXC0Iqv
 OY7sh/sVzK/pLWObcbDhcXfmdkmBasL9u4X+roobV+nW5cXh9fR9x5nNqW/PrYo8WP82y92AA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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
