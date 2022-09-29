Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226EC5EFA99
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAF410EAD6;
	Thu, 29 Sep 2022 16:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72C210EAD0;
 Thu, 29 Sep 2022 16:31:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 22EB458080B;
 Thu, 29 Sep 2022 12:31:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 12:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469089; x=
 1664476289; bh=YYd0PqnWEKmmUBALj9YayayVZnxgCaVWJrv+n5E/jvA=; b=V
 ScKVHGeKHja69U2dhNm74x5NXaNPluXZ3l8WLpi4KfTxgDYEuT3dTkitaVVp2JRE
 gvoF9o4yKJm+dgozPefI39Oo7XHOEP3rr3hCJUecOHPQsvxqAEAzE0d3YoW32YBa
 1WxBrmUz7zRsMOQfgCfRnk+rYLP51CW5rSCh0KumgNadRIfLm8lsmoCHj1yJIvRi
 44/Ncg3yXK1FvrM9dK1t4WuoFka+Pb47RkFovGLmm7rfib5ny1kojTeABJjNuk55
 Hh/bSGryxfasgtzOn4F1uSrOl2em3YkuPodQ9wm87Oi+Q00JFSt/jZzS9SWpCsFc
 YOh3h383td/KRzUrtf3xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469089; x=
 1664476289; bh=YYd0PqnWEKmmUBALj9YayayVZnxgCaVWJrv+n5E/jvA=; b=e
 sicxinWNxw8rUmO2R6ujB3xFHL6skH1Ekf3JfeMXG5VVaSPO6SSMhWeACFSAE/TL
 9M53cPufRTmDadXc8gqkw9etXWDDb5MB8gbIGPrI15dn2++Co4VyYecLtWzfSCfz
 J1XCawL85oSe+Zb9Ganq4gAJSSU2+Pg0M/Mb7LkRWdMwD5/WsbQ31UCA3UZjBcRz
 Pqfle6iO3/6rLeXV5S218BCWi3HstwoZiNBex35wNSSeMfXb/1Ma5nCQSxOjJeTr
 9MtotC5hAWIoVqSztqSnXY3BX5OfifyKrMzOmI5USolBIs/XZVCzXtEzsF2qXJPs
 XGCQ15h0xZ4Q3HOyQPsYA==
X-ME-Sender: <xms:YMg1Y6aaj4-90uYkg0rACkwsN69_Yu-GFW3nUlE02kNwNQhYqPQB8Q>
 <xme:YMg1Y9YYFPLv-6xHunXwqQBXTBegqPFbxddU7FAfvU2jd1RUeOrwpk5kL-h92YRNp
 HCzxXXwFPeAuo8jKhY>
X-ME-Received: <xmr:YMg1Y08vh5GrwITLIx-qvPmJOsEX36MnYzAd41aGJzONXgWntLk3pQwZtxcc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YMg1Y8qKx87FlZK3RpMefdMqDYAxPOIkXSNWTnoglbOWdhgquUxkPw>
 <xmx:YMg1Y1pYI6yRuDnpJ2SgFXx0w480UkyFzYzEpIYIRvm6fwt87zktgg>
 <xmx:YMg1Y6QWTAwvk8wVho0Vq0UGa7GrQnCYiYjU-W-5n0sZBM5EE5yUzw>
 <xmx:Ycg1Y4WrO7idaSta-h0UDhGGFETE1M3uFSPB6e1_FWcAPN6uvzUXhw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:02 +0200
Subject: [PATCH v4 08/30] drm/connector: Only register TV mode property if
 present
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-8-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=FTsIP1A1GQ8K7ONBlLNmVsmveZqLVE7u8ObuOkUY5F8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9y+iE0qjpvQbbf5U2AO46bttW3febniT+acrovXq+zQ
 C57XUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIno/2H4n5lhvoBNcKLsoY41842sGv
 hsTRz94/WcHgQyF0Qt6U5XZPhnpHf55aLLausen25Y0JER2taStUJYn4WD+c8k7hW//Xz4AQ==
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
b4 0.11.0-dev-7da52
