Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9825E6535
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CB110EB5F;
	Thu, 22 Sep 2022 14:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E2710EB5F;
 Thu, 22 Sep 2022 14:26:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C85CC2B05B0E;
 Thu, 22 Sep 2022 10:26:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Sep 2022 10:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856780; x=
 1663863980; bh=oRoGbxOixjA/FGsVjJsObmY8HyU8mXROxlcsJBjmCK4=; b=r
 M3n8JdbjXgjr1O+Sd2xCag4oK48llGSo95yC5YhEPiJNB+gmI95Lutqb8SDmSmyK
 z7gox+zX+aX0v8f0B628j0qib1SjWpunpL+eAa+I8Ssf7FmlI9eYa3Km5mI2+YA3
 tFca70ZedPkKAhcyUfH+Y/PmwMQDMPS3xNON0ZZ+IT1JSnevuRaYb0jvnw7tNhe4
 ezKMb7zTqFHqwdALxgMD4zW5o77cBstuOSyFV8pFxcvcFTZUU4izcly8je8cN69o
 plfKcylx1E3WMcBf/W9ZdHYCbIzBA1FW+55ttTF8IrbEHTmFFf/bW5un6M5cNMU0
 /uEWH0h075JnHr+1Or4Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856780; x=
 1663863980; bh=oRoGbxOixjA/FGsVjJsObmY8HyU8mXROxlcsJBjmCK4=; b=l
 kf+8ecgyih+WUXsMd9xEYY+7n10huLj3KcQ3Jr8dYUGtdC1b5cGt3gmnOYWhh18D
 TnI55k14GO2G0HFX0UlkYKI4ggXZTEot1ewEip7qWgxzFBh807TPIQUM+L97Vo54
 Lq7T7Jcur/ubUfxa9aV3tctHJcGm4mPMAGVH06ebeXQcWB/JLNaMBDMVbces+SNj
 u3jn1AUifvrQPEu5TAmXrQlfuY3vS8OxLxiDqfgFKkXMvNUHdv4TIjP8Bn9G/Wak
 WTpRlswUvUhN6KTGjdymxrclThyebtPnNX84WAsOaPwlQwl3z2hN/Zwn9KI+yWYg
 06DVbB3505ZAhDZRxb+YA==
X-ME-Sender: <xms:i3AsY4NhBWzuMxgJEVgkBrp57DZAuaGSsVBgw9VjbGrKlC3aTp6JBQ>
 <xme:i3AsY-9SoJrPALGjg0et-LrEZKs_D1Mf7ZK_OxttWthmvboimamYCrUvjA7XJIUlD
 i576Mf535gCE-XAvrI>
X-ME-Received: <xmr:i3AsY_Rheo7QC0YcFPs_XfaNs8_fm3xKI6tyFE6dm02-eUS5VLX5byNUN7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvdfgveejhfdtteevvefhleeiueeutefgvdegveekgedujeffgeffgfet
 tdellefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jHAsYwtZ8Mfnz13ByRm489UmV9R1a28D_ChwvwJClXQclNSTHRY-MA>
 <xmx:jHAsYweQve14SmWczBcRVjKqQxaduBp5q4P7nnIfpmJ9PohVp7j-4g>
 <xmx:jHAsY005d-Ioq_Pw0amPN0NRdJJoSpGK2F6ssFJk_7t00WRk1eiREw>
 <xmx:jHAsY_phBeKgB3tFfAgPBoqWj_YHOcl8KXwK38eX44eMDkMJ0g1PjK6hfPs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:26:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:24 +0200
Subject: [PATCH v2 07/33] drm/connector: Only register TV mode property if
 present
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v2-7-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=K1P8wOW1lXc6QlwFPGKbGqRYBhsEzf9zE4LsFjXniIg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQGHXmol/OEJXP7GaMGVrX9Yml1eSD/OnnxTudbj0coD
 aw/O7ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEHn9i+O/vJTt15rsJa66FruW9VB
 O5dZ5wj+aetVqXLQVE5y6ScxJj+MOZp5C668wsQf4z5848NOlLm7fzFuO8g/8fNurqLXwiXM4JAA==
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
b4 0.10.0
