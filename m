Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851345E6569
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6D610EB9B;
	Thu, 22 Sep 2022 14:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC5C10EB93;
 Thu, 22 Sep 2022 14:28:14 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id F3B272B05B36;
 Thu, 22 Sep 2022 10:28:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 22 Sep 2022 10:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856890; x=
 1663864090; bh=dfVq7BXQ9B4uAsI1a5x7OI32Ta0Cs2gU9rZUbwMpsfU=; b=r
 fTs6skAYSFL/b/LcYdjoOgK3dfLrbBkNKkH9FpEXI8spPzKeRD+0c9fzeEyuI1i3
 QPxUxKc0ZVHmmZTpr3Oqgw/gd2s5uJD08KJy0VLsQSorgU5TSFa5pTwK0PzKd/IY
 oX1VDM44hyYcDZTCUrtkuXS6vUTOUpAfZ66D40ZgMMVtgWlcdewUaJdXvvb1SfP5
 EA7uA36N0nSEUECo8mDDZiVXSGCegv1dkhGF4U1WYuJBQXr9SCVb6/EXIL9DUQYa
 ZW6leNtsEBfG0hwbSsEq/FlPa2/OswWBWpg0WP4zdcDK7uOAoP/idepmyopU2IeU
 ffA7/E1tyTX++GsPOxBvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856890; x=
 1663864090; bh=dfVq7BXQ9B4uAsI1a5x7OI32Ta0Cs2gU9rZUbwMpsfU=; b=C
 Pv1sHgjrwaYJmsnrq4QCbS04NI1Gzd3smzXf2fEOzvh6Kt5XuvCwhVxO1winuc2c
 QDoOi7ZeujMAqWNtrcVzZqU9qyiPA3T6scnZKKG6xwv57RjlktTROoMTJz9RqfBB
 OKnll4la2I+nDGt3XqOuy2yqpP31Bo2F9YgL5kzqN3LQ8U3SSiq7GsFtukjUgage
 3GuO0BO5AZyXr/UqA+nUhlrXLVi7bfW04lZXY5hLcg9+7knidGYvHQ/glDtJOtTo
 lQdFHxcGDSDW29z9f2m5P8i8cA4fJYbePfHlmLRRaOUxPc0CDrWjEAbuN7nrIKYx
 wr6521mas84lR2fmkXMWA==
X-ME-Sender: <xms:-nAsY3l2hJPXwwqDieN-FPXLHnRZT_vIWGrSHBg1eNH_S1Gl7Vx5pQ>
 <xme:-nAsY61DWT_2ITtaR5ffVrbo246eDoPSg-tCkAsOFdsEuYLD7fDXti8afSBeh_WAL
 -9H7AeewANkMoMX898>
X-ME-Received: <xmr:-nAsY9qWq4ysMOXd22t8kkv54jYjqGI-r0WU3TzpSTrOl74DQ_WG6Epkawc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-nAsY_mCcnAI4-0jPGtF0rL8JgLGYImZ1CfFvaUASjoP8OB0iX_p4A>
 <xmx:-nAsY10-Park3Eim158pjp3C7VNabXyd4pEmjOpdi4-cc2OLcK3DOw>
 <xmx:-nAsY-u3vSbNd7cJZawtaa2J2HwecVAgmt4FoJ4nWaCy-k_jYqKxuA>
 <xmx:-nAsY0BaeWlcC5Q6_EkmmeL5QQayen1F5nhswUrM18MdO9SX4qHXoAgZJX0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:28:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:39 +0200
Subject: [PATCH v2 22/33] drm/connector: Add a function to lookup a TV mode by
 its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-22-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2242; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=SAjtmTJcJObMxS7pu9nZu7kJ4+czqVT9o2Td3HmdMSc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYEzdTm7Y2tLlmx+b8Z69rSx55wmVlVZ0xOzdrocmd+r
 HbK/o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOZdI/hv+9Ea5fLFj9SG2L2Slm/zY
 izfe7i9/z1mvS/t/1Ohh6ZepmR4ZzynG0bwnWzZz06JfA8n+dJyPFrPG2br5xwPZNgzN+mywAA
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

As part of the command line parsing rework coming in the next patches,
we'll need to lookup drm_connector_tv_mode values by their name, already
defined in drm_tv_mode_enum_list.

In order to avoid any code duplication, let's do a function that will
perform a lookup of a TV mode name and return its value.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e7aa8de08f5b..7acf294aba5f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -992,6 +992,30 @@ static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
 };
 DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
 
+/**
+ * drm_get_tv_mode_from_name - Translates a TV mode name into its enum value
+ * @name: TV Mode name we want to convert
+ * @len: Length of @name
+ *
+ * Translates @name into an enum drm_connector_tv_mode.
+ *
+ * Returns: the enum value on success, a negative errno otherwise.
+ */
+int drm_get_tv_mode_from_name(const char *name, size_t len)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(drm_tv_mode_enum_list); i++) {
+		const struct drm_prop_enum_list *item = &drm_tv_mode_enum_list[i];
+
+		if (strlen(item->name) == len && !strncmp(item->name, name, len))
+			return item->type;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_get_tv_mode_from_name);
+
 static const struct drm_prop_enum_list drm_tv_select_enum_list[] = {
 	{ DRM_MODE_SUBCONNECTOR_Automatic, "Automatic" }, /* DVI-I and TV-out */
 	{ DRM_MODE_SUBCONNECTOR_Composite, "Composite" }, /* TV-out */
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 80e19efb3f42..0dcd08e036b6 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1870,6 +1870,8 @@ const char *drm_get_dp_subconnector_name(int val);
 const char *drm_get_content_protection_name(int val);
 const char *drm_get_hdcp_content_type_name(int val);
 
+int drm_get_tv_mode_from_name(const char *name, size_t len);
+
 int drm_mode_create_dvi_i_properties(struct drm_device *dev);
 void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector);
 

-- 
b4 0.10.0
