Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5D5FDA6F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BCF10E8BB;
	Thu, 13 Oct 2022 13:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2CA10E23C;
 Thu, 13 Oct 2022 13:19:14 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 16E55580366;
 Thu, 13 Oct 2022 09:19:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 13 Oct 2022 09:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667154; x=
 1665674354; bh=YYd0PqnWEKmmUBALj9YayayVZnxgCaVWJrv+n5E/jvA=; b=e
 2XREhk3x7CN47S5vBhYv17/1N2Ty1QMrQilsOWgQGWmTvgNNBvcSBel7B36SKnLf
 2ja7sWelxNi8Ojd0PpSLKLnP+Lx+UCK55D4Em+r+d/AYkwIYGw8N4UFpCXITo2pC
 goislVMn1KM9FtayncHybVuKYVN2SLetCbfOQFqNDB9MqQczH5IC7M0AcnmZQhh3
 30PT+oxpo0zKDSSndkxaARPmiA6xZWZvCh1TYlm2SXUqCgvOTwQjO2t5lir1EqOt
 r9xM8CtLOy7YGCDZydFYkeA0iAJk1d8kI2N0SB6Z3CzycX4J/dAXOMEppMWXIcoE
 s0hEKBPBLx4o3OsBiHxjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667154; x=
 1665674354; bh=YYd0PqnWEKmmUBALj9YayayVZnxgCaVWJrv+n5E/jvA=; b=H
 +eO9PCg7nRvb7rtvQRFpHvtrB+XuccXaRgxo4k+gZ1x1XZUpcML5YBijAnWxEaFg
 E7ntGAgA7W/aCLG0ohNmVPPXIlBF3YjpPTJaQzN2Sr2g5YtyRAgrFsqZGsjb4R9Z
 hnZrUio0G3AYmV1s/4H8PupnG7gCA3ND5sxE7azIKMbJYd3YQ3wQvB/jTn9iJsQ+
 LLuvnU7gKXhmnErbUsljit8EwK3GWoY8z52X5xCuz6S4dRJ0q8sqEIhOvD9f/e0O
 jq5DoMh0mlAhd9OSYZGMl0DZIN8CJ+FmXXd3dDqxDC+jUowfGk4fesA3pBgPIal1
 qZNb/i8F72m37McFRv6QQ==
X-ME-Sender: <xms:URBIY-v1qN2sOusqnuZoR9FPK7WXR1UmxRapjObBJr_xBbLOxZ5_gQ>
 <xme:URBIYzfze_QsxdOM8P6d-aHSxyjuHQI0uTfqqWpg-yCIS4Bjl2RUCxe_e5DyvXnXN
 o-TXuzBZSdV3gQETlo>
X-ME-Received: <xmr:URBIY5xQXlWUelR2KbFgZadJroaDFawWxMI1O38fOjrESW6C0AtXsgdP5l9IeWo20T_8GuAng9AiOGlCxqEVcfM01cSlE5eNNNfq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufgggfgtkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepvdfgveejhfdtteevvefhleeiueeutefgvdegveekgedujeffgeffgfet
 tdellefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:URBIY5PmR_LEkNWM5nIMz1jqQjNCvDqQs57Qs_HQN67Jh3rrL_61yw>
 <xmx:URBIY-8CjQdzrI4A7Gj8eCIVE0xjfI7OynhhOxjd1pJsxwv1j8dqyA>
 <xmx:URBIYxWW5167ILaUsady0likbguOczW4PnicqpaBA0hSTzfD1Ajguw>
 <xmx:UhBIYyJHECUkT4ladikDSTq8njqoUuzTRIdHDX_1KCVQo2G4Km0hIg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:47 +0200
Subject: [PATCH v5 03/22] drm/connector: Only register TV mode property if
 present
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v5-3-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=FTsIP1A1GQ8K7ONBlLNmVsmveZqLVE7u8ObuOkUY5F8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm4CRQLHM/6ZPNM7uL9CaA9Dd+CMI3uFBBp7WSZW3ji2
 3jujo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPZ38zIMDvo6ZJ46WmTTwn6Lk5XC5
 RVmnH/lVvJjZD7nV6p4p/CahgZOkPS+Re1Hcl49LjqfnaISCnzl/DMPT7BZjZn+zuFvU/xAQA=
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
