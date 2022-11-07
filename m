Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDFE61F585
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6037A10E353;
	Mon,  7 Nov 2022 14:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7801210E34F;
 Mon,  7 Nov 2022 14:17:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7A9102B06703;
 Mon,  7 Nov 2022 09:17:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 09:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830674; x=
 1667837874; bh=0oKN06VO67RLG+n7WmkLW6tgiE6KcW8ogpBlG4slTm0=; b=T
 SZThQoOfOpadCSXuXBXf3hL1SnCUUyO5UPZy82pOMnHuHbWtL0hqLEl1vm/GWOGT
 6vhfXQhfjfaqeO4/KrPZXUnkBVLtYY4hnIXxi7f3kVSxeHKBgGyp0QjuJ8UI1sVa
 arH0J4MzxoTzWTZddv00B4lheSbSBnLn2Zop9ZXW+OUdj+ilpzqElLVZ8MEgcRUy
 N4w6h8NYD/2s5/y4AYeuL9vadYVYANncnCPsHHU5KRxUGRNLgqTBRkja90BZqfYI
 5f32jU/C+amqpezMaZX18LuJQQuDmrysU1msAVImTSI0W7Y/1IAM6+HX7VUb0/zy
 //oGBPUiNVjJzOdvtDQ+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830674; x=
 1667837874; bh=0oKN06VO67RLG+n7WmkLW6tgiE6KcW8ogpBlG4slTm0=; b=A
 8TDYdyE2TOP1awAkhdEVsUPJGeeUskMBXPdwatW90dAbuE9spju4cWHJlu5p2jGL
 Ga0xcinVdvdc0DJ6Wq9F9+hMAoEuZpvwrUwx8MBt/km++qyZDK6Me6RCBNVDwYxI
 6Z1woIJ7RaRrsiu0+6t3LcU5/FmY5yqWy5sVDsKHjy09lsQSPmmbZ+Cf6Lskqv28
 cjbfc9P9rld7pA85Z9Z+OJrUGE7HpYiCuFuz3L6NQFTlxj89kHY2JBbtBBSqO7eF
 6PuHElGl/3ZDFIhGzcpVjJ/zA9bgMMXRPGjTcb45GUJk33MeiS1kjxrwuAr/XjWf
 QDAzyce6B1LfUdtxuJfag==
X-ME-Sender: <xms:kRNpYyjr1eCMPohk_-apUowPsHlJ2juZYjZD8b6GBpyLsBKnU9L7XA>
 <xme:kRNpYzAsMa3NWEKZIc9CrQ3MTYxre-g0QjMppznD_rhy7aPMK-iPZeaJOie3Eba2w
 tu56sef3wqod7HpIDg>
X-ME-Received: <xmr:kRNpY6FIQz8WQ_Z_dyO9kfzNZf2dbF4lW0zTypPc9dzpdbJjdFo6doG-cyV12E51EW8iUQQfXwmXv-5Gn9OyePXQOIxZ5Lry3SIL-3k9EyrXkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:khNpY7T-NTr_1lX7PI7RU8Zsv3m2_DjLa-7RCLkMK5xx5gqw439-_w>
 <xmx:khNpY_zuBm5P41nI1sA9w_UIxRw7bcN9avq8ssoGI-GvSU5VJKrEUg>
 <xmx:khNpY57F4GwSI1Pb3mFB-MuLUwtvCWzPqeAnzmX4Y6cqVQg2fzQmoQ>
 <xmx:khNpY_foh-y2eLtTkJAD_QBy7b8IJHjAXI1JG4vGQ-5fDyr5nrZsjEA6rNs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:17:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:42 +0100
Subject: [PATCH v7 16/23] drm/probe-helper: Provide a TV get_modes helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-16-7072a478c6b3@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4733; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=KsSg3MkYNbvBUDSlVgBJTS6Fc0RFsDQehn1uu8plmuo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg75uftfNhpoLL5SIWid7Ho/0sLOsXfVtPgA449flL0f
 H0vrKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQq/RkZ3s3/9H2VZL/egyvFFe919C
 +IqRr6MtzZ+zV1OUu2/j+3bkaGczxhLvt5vA3Kaib4Hng65X3CDJlfJ2eKzKv2Dk17ZFLMDQA=
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

From: Noralf Trønnes <noralf@tronnes.org>

Most of the TV connectors will need a similar get_modes implementation
that will, depending on the drivers' capabilities, register the 480i and
576i modes.

That implementation will also need to set the preferred flag and order
the modes based on the driver and users preferrence.

This is especially important to guarantee that a userspace stack such as
Xorg can start and pick up the preferred mode while maintaining a
working output.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Used Noralf's implementation

Changes in v6:
- New patch
---
 drivers/gpu/drm/drm_probe_helper.c | 97 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  1 +
 2 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 2fc21df709bc..edb2e4c4530a 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1147,3 +1147,100 @@ int drm_connector_helper_get_modes(struct drm_connector *connector)
 	return count;
 }
 EXPORT_SYMBOL(drm_connector_helper_get_modes);
+
+static bool tv_mode_supported(struct drm_connector *connector,
+			      enum drm_connector_tv_mode mode)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *property = dev->mode_config.tv_mode_property;
+
+	unsigned int i;
+
+	for (i = 0; i < property->num_values; i++)
+		if (property->values[i] == mode)
+			return true;
+
+	return false;
+}
+
+/**
+ * drm_connector_helper_tv_get_modes - Fills the modes availables to a TV connector
+ * @connector: The connector
+ *
+ * Fills the available modes for a TV connector based on the supported
+ * TV modes, and the default mode expressed by the kernel command line.
+ *
+ * This can be used as the default TV connector helper .get_modes() hook
+ * if the driver does not need any special processing.
+ *
+ * Returns:
+ * The number of modes added to the connector.
+ */
+int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *tv_mode_property =
+		dev->mode_config.tv_mode_property;
+	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
+	unsigned int ntsc_modes = BIT(DRM_MODE_TV_MODE_NTSC) |
+		BIT(DRM_MODE_TV_MODE_NTSC_443) |
+		BIT(DRM_MODE_TV_MODE_NTSC_J) |
+		BIT(DRM_MODE_TV_MODE_PAL_M);
+	unsigned int pal_modes = BIT(DRM_MODE_TV_MODE_PAL) |
+		BIT(DRM_MODE_TV_MODE_PAL_N) |
+		BIT(DRM_MODE_TV_MODE_SECAM);
+	unsigned int tv_modes[2] = { UINT_MAX, UINT_MAX };
+	unsigned int i, supported_tv_modes = 0;
+
+	if (!tv_mode_property)
+		return 0;
+
+	for (i = 0; i < tv_mode_property->num_values; i++)
+		supported_tv_modes |= BIT(tv_mode_property->values[i]);
+
+	if ((supported_tv_modes & ntsc_modes) &&
+	    (supported_tv_modes & pal_modes)) {
+		uint64_t default_mode;
+
+		if (drm_object_property_get_default_value(&connector->base,
+							  tv_mode_property,
+							  &default_mode))
+			return 0;
+
+		if (cmdline->tv_mode_specified)
+			default_mode = cmdline->tv_mode;
+
+		if (BIT(default_mode) & ntsc_modes) {
+			tv_modes[0] = DRM_MODE_TV_MODE_NTSC;
+			tv_modes[1] = DRM_MODE_TV_MODE_PAL;
+		} else {
+			tv_modes[0] = DRM_MODE_TV_MODE_PAL;
+			tv_modes[1] = DRM_MODE_TV_MODE_NTSC;
+		}
+	} else if (supported_tv_modes & ntsc_modes) {
+		tv_modes[0] = DRM_MODE_TV_MODE_NTSC;
+	} else if (supported_tv_modes & pal_modes) {
+		tv_modes[0] = DRM_MODE_TV_MODE_PAL;
+	} else {
+		return 0;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
+		struct drm_display_mode *mode;
+
+		if (tv_modes[i] == DRM_MODE_TV_MODE_NTSC)
+			mode = drm_mode_analog_ntsc_480i(dev);
+		else if (tv_modes[i] == DRM_MODE_TV_MODE_PAL)
+			mode = drm_mode_analog_pal_576i(dev);
+		else
+			break;
+		if (!mode)
+			return i;
+		if (!i)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+		drm_mode_probed_add(connector, mode);
+	}
+
+	return i;
+}
+EXPORT_SYMBOL(drm_connector_helper_tv_get_modes);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 5880daa14624..4977e0ab72db 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -35,5 +35,6 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
 int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
 					 const struct drm_display_mode *fixed_mode);
 int drm_connector_helper_get_modes(struct drm_connector *connector);
+int drm_connector_helper_tv_get_modes(struct drm_connector *connector);
 
 #endif

-- 
b4 0.11.0-dev-99e3a
