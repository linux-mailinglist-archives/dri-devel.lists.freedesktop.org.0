Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5B60E4D0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F5810E541;
	Wed, 26 Oct 2022 15:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0273210E520;
 Wed, 26 Oct 2022 15:33:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 62942580418;
 Wed, 26 Oct 2022 11:33:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 26 Oct 2022 11:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798437; x=
 1666805637; bh=yeGVxZmMa0Pww2xIakYHeh9mLXtzw9dQZkTWe47vmhk=; b=N
 M7w6evhMhgF30EI81WO1S33nSUxpgGfzDF+XyQ0UpXyAkIH6G+ksh61hjUCgK29u
 D+tduX1StYIxPgdeR3xoTjfA2E1Vo1YrZYjHTHIWJdSwvuFGFDfyin6n0ZVtzWLO
 ykwbI3Iu3swTjThCo//Uk5xUyT2UJjGZP3iuesB2WamCRJ8DBUTCts+d3+qRjPpu
 AkQXhTXguzfKeP2xk7I6rvFDNWz9e/o09D+LA5pq5iYlK6f7FGSqIL1LQB8gMCnY
 C/MZ+4mUelP8uIs2sPVmQtK09nXpF92WjR6loFx2oI6h8QyQpUvoOKkxx0uYhu4o
 zZfzW85TMP3y3fM36XLug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798437; x=
 1666805637; bh=yeGVxZmMa0Pww2xIakYHeh9mLXtzw9dQZkTWe47vmhk=; b=c
 yvchwkJSslDscc91aA/uRIUdMyzHUPBdksb37PA+7ea9vmU69y8pe42U0zj8Tgli
 dMOndkDkZRGFaEwgtStHGFLeb8YrQKPYs39WksBSOuEkFSopEaEzkVI9cD6Aucpb
 5mR9rZkpg9ZkzkxW2VSlHwSo6tXWPfiBAF76Aa2mrVgJGdRy1Zp2yl+mKhDlUw/5
 I21FmKnuCFiz1cAK6X5mwxmc6sM6rsK08pI5JoDlOWvgIxYfbD2JS0f7DExR/nvi
 kBQhb1t39R43ecUIfpysG4nmZvV/QLdLKpgMfr8w6sprs1vtS7GWfcSPNQFvyeUG
 2zbghnCQGWSBsk+fNVFKw==
X-ME-Sender: <xms:ZVNZY3Krdy2rY3_GQNTPKoextyBrYDWpUKpTjVusVRcV59JWvBiQww>
 <xme:ZVNZY7KHChFTIakESEs5I2h3w2xbRRAOUUU_N_szqbcEcaVWjyVWAEW2_kwsHc5qJ
 5C_F3kCAjOsloBUHX8>
X-ME-Received: <xmr:ZVNZY_sK3iKb_eKoJl6j5DNx3g18aFXwZrzLI5ggMOhknONDs0DjU5H8oCiBiifD9ZdrbKu2Y12GBy49NlU1Tw_GTIyoWtKIDanS-cKqMXrJtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdekveelgfelveelfe
 duheelvdegudffgefhudehgeevjefhhefhhefgvdeuvdenucevlhhushhtvghrufhiiigv
 pedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:ZVNZYwabr2T4WB5Qs1a42FNZ_UnZ681qg8N-8OyATPCjNkWpuwXKWg>
 <xmx:ZVNZY-Yp2P0UxagL-4dCQnhDnriFkI2Lc0s0Te3bXWz0SsdX3v-Mjg>
 <xmx:ZVNZY0AXnd_xZiCZ8ECEFZpcqR7Sxhf8cFpSgKSQE2YWLMeWkfCjRg>
 <xmx:ZVNZY_G7FvcG_7maHSnkxtgelxzKEbvfRfbB1gQqiDyFRFB4XhNXOA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:56 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:31 +0200
Subject: [PATCH v6 12/23] drm/connector: Add a function to lookup a TV mode by
 its name
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-12-e7792734108f@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2450; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=jgY5/K4/seykxcntHx9DzHMMRWK8f+CM5mdeUDsj6d8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW4zG3tkPq7tvMuTzKoctuxT9HyRsGkrZjx3NdrZJlca
 H/aro5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABN5fYuRYdfdpaKLTv+RyZf+9vFvkX
 xs/y8TNf1Zjw9YTr78uk9LTZzhv5OurcFzdg0eB4PtS67t32aV2qkpxWVuJfDckmfziofH+QE=
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

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 24 ++++++++++++++++++++++++
 include/drm/drm_connector.h     |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 820f4c730b38..30611c616435 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -991,6 +991,30 @@ static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
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
index 5c5e67de2296..276f5cb0f351 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1864,6 +1864,8 @@ const char *drm_get_dp_subconnector_name(int val);
 const char *drm_get_content_protection_name(int val);
 const char *drm_get_hdcp_content_type_name(int val);
 
+int drm_get_tv_mode_from_name(const char *name, size_t len);
+
 int drm_mode_create_dvi_i_properties(struct drm_device *dev);
 void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector);
 

-- 
b4 0.11.0-dev-99e3a
