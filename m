Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AADE5853DC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBFE11222D;
	Fri, 29 Jul 2022 16:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B1A10E503
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id A131058092C;
 Fri, 29 Jul 2022 12:35:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112546; x=
 1659119746; bh=eMs+w/CffVwE2ame872l8/WaiNcHNKMJmaLvcqBWcoA=; b=S
 E+rW9gvtNFtb8V+V7ubutGHjhd9PmCzG+r64L/Yjsymx1qpIfZUGA7qwG0HfE84O
 BrWusApulAuKTaLSZN/C1YF6j4LGVSmjWcArgqH81DOuHamhlZV7bXzYHe21whvg
 8Qqyy/oPKnM4LghOVatGhxb9zTLUS1pQOFMTktQhBzcQrCjlvcxnl2F8PCPVWNjm
 d+6PSvL30Kd1DEkH1KAEg5wD/1orsG1uwHBS5hwr3H5uq/hDX2u6jW0E96ID1gHT
 X/kXoykNUhdcw8BhCTkQMiDKkIRQhFb3PpuKyEAkvge2JCGpKcSGmopglHni/2HG
 wZyhZeG1qpl93ZzWhntOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112546; x=
 1659119746; bh=eMs+w/CffVwE2ame872l8/WaiNcHNKMJmaLvcqBWcoA=; b=P
 ETyWHiCEk9Ru/BIg+QQQXIgCuA8tM7gbdN8R1rJl3ZcQFBBHJL79tNzhGcKSzODU
 V73KEqDL6fA56w8t/pmmAOffHlx7bB4TaAGdOJtqFZvopYoXjnVsc1lZXNXgDmcc
 OVVMZ6EEHAaVIFRjQgYIxkPnpbR8L+ef+b14QK02OIUu7HYqVGLEkdN+dluTyaOT
 6bpBc7+Dbs3FNs8nLF/qX3BOqcxAGZIxGRRExZblAE8af2Bioy3xeLicPuAL6zQn
 Fmo4zbS8bPmePUVGmx5g1LSweaxo3z1DM6OZ6mLSxZ5MqV6Q+XXPQEDhs6QuVpIQ
 N6LEiKf+IkgAVPFYN2Erw==
X-ME-Sender: <xms:YgzkYlXGuQnuvJjpJDSg2tNp0HCBf6WKs2Yet2pneMAYCuT0di5_wg>
 <xme:YgzkYlnsm-DnkEYxdW05gAqflqMm2q75nevMfg6F7NTFApCvGPdkZJ4NxSTxRLxM9
 ybt1eemE5BWGvYVyjA>
X-ME-Received: <xmr:YgzkYhbwJ8CKe26W35DsQWZXIeYkpr-IiPCVFJTdzowtpvdv6hW0EKM1pqVbc9yA4wzRg7cHQam0X-tXock>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YgzkYoVp4F_9i_TkrPQ9rOs3p2xcehTgvd1Ie10GnDv_zzShFN1Wxw>
 <xmx:YgzkYvkvOkq4oOnpEHZKUxdMk7Zh4SZzprpyKRZqJmaHPxu6HD-QwA>
 <xmx:YgzkYle_Uoo9lu6wQWfjF1AJOCIhwRG-z6nyJif3FhQHDQ-320c5MA>
 <xmx:YgzkYj2VJtvfN4pn6AEV6O6eEwF5mfLC3zf-Obvy5FlUVZMEeJ62Fw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:45 -0400 (EDT)
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
Subject: [PATCH v1 05/35] drm/connector: Add TV standard property
Date: Fri, 29 Jul 2022 18:34:48 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=8238; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=jGJUS/VA2iyHNwRJXvB4FtOdyf/I7gunEXYaaarTrag=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHiuhjjyKu6sbMwIPWU79r0t1d+xKXxFs1uEn64t/zk
 7y3bO0pZGIQ5GGTFFFmuC7614wuLcovg+bAZZg4rE8gQBi5OAZjITD6Gf/aMS299rN5e0hj79qhWSf
 ckHvsLfD85L+0ScJixn3Pi190M/136CzTrXT4mSOcf3qafsPsQQ7ZQnPkXj/z/uTnOrC89dAA=
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

The TV mode property has been around for a while now to select and get the
current TV mode output on an analog TV connector.

Despite that property name being generic, its content isn't and has been
driver-specific which makes it hard to build any generic behaviour on top
of it, both in kernel and user-space.

Let's create a new bitmask tv norm property, that can contain any of the
analog TV standards currently supported by kernel drivers. Each driver can
then pass in a bitmask of the modes it supports.

We'll then be able to phase out the older tv mode property.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c06d0639d552..d7ff6c644c2f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -700,6 +700,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->tv.margins.bottom = val;
 	} else if (property == config->tv_mode_property) {
 		state->tv.mode = val;
+	} else if (property == config->tv_norm_property) {
+		state->tv.norm = val;
 	} else if (property == config->tv_brightness_property) {
 		state->tv.brightness = val;
 	} else if (property == config->tv_contrast_property) {
@@ -810,6 +812,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->tv.margins.bottom;
 	} else if (property == config->tv_mode_property) {
 		*val = state->tv.mode;
+	} else if (property == config->tv_norm_property) {
+		*val = state->tv.norm;
 	} else if (property == config->tv_brightness_property) {
 		*val = state->tv.brightness;
 	} else if (property == config->tv_contrast_property) {
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3142c8142b3..68a4e47f85a9 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1637,6 +1637,7 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
 /**
  * drm_mode_create_tv_properties - create TV specific connector properties
  * @dev: DRM device
+ * @supported_tv_norms: Bitmask of TV norms supported (See DRM_MODE_TV_NORM_*)
  * @num_modes: number of different TV formats (modes) supported
  * @modes: array of pointers to strings containing name of each format
  *
@@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
  * 0 on success or a negative error code on failure.
  */
 int drm_mode_create_tv_properties(struct drm_device *dev,
+				  unsigned int supported_tv_norms,
 				  unsigned int num_modes,
 				  const char * const modes[])
 {
+	static const struct drm_prop_enum_list tv_norm_values[] = {
+		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
+		{ __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },
+	};
 	struct drm_property *tv_selector;
 	struct drm_property *tv_subconnector;
+	struct drm_property *tv_norm;
 	unsigned int i;
 
 	if (dev->mode_config.tv_select_subconnector_property)
@@ -1686,6 +1716,13 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
 	if (drm_mode_create_tv_margin_properties(dev))
 		goto nomem;
 
+	tv_norm = drm_property_create_bitmask(dev, 0, "tv norm",
+					   tv_norm_values, ARRAY_SIZE(tv_norm_values),
+					   supported_tv_norms);
+	if (!tv_norm)
+		goto nomem;
+	dev->mode_config.tv_norm_property = tv_norm;
+
 	dev->mode_config.tv_mode_property =
 		drm_property_create(dev, DRM_MODE_PROP_ENUM,
 				    "mode", num_modes);
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 4a788c1c9058..457529e5d857 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -573,7 +573,9 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_vec *vec;
 	int ret;
 
-	ret = drm_mode_create_tv_properties(drm, ARRAY_SIZE(tv_mode_names),
+	ret = drm_mode_create_tv_properties(drm,
+					    0,
+					    ARRAY_SIZE(tv_mode_names),
 					    tv_mode_names);
 	if (ret)
 		return ret;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1e9996b33cc8..78275e68ff66 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -143,6 +143,32 @@ enum subpixel_order {
 
 };
 
+#define DRM_MODE_TV_NORM_NTSC_443	(1 << 0)
+#define DRM_MODE_TV_NORM_NTSC_J		(1 << 1)
+#define DRM_MODE_TV_NORM_NTSC_M		(1 << 2)
+#define DRM_MODE_TV_NORM_PAL_60		(1 << 3)
+#define DRM_MODE_TV_NORM_PAL_B		(1 << 4)
+#define DRM_MODE_TV_NORM_PAL_D		(1 << 5)
+#define DRM_MODE_TV_NORM_PAL_G		(1 << 6)
+#define DRM_MODE_TV_NORM_PAL_H		(1 << 7)
+#define DRM_MODE_TV_NORM_PAL_I		(1 << 8)
+#define DRM_MODE_TV_NORM_PAL_M		(1 << 9)
+#define DRM_MODE_TV_NORM_PAL_N		(1 << 10)
+#define DRM_MODE_TV_NORM_PAL_NC		(1 << 11)
+#define DRM_MODE_TV_NORM_SECAM_60	(1 << 12)
+#define DRM_MODE_TV_NORM_SECAM_B	(1 << 13)
+#define DRM_MODE_TV_NORM_SECAM_D	(1 << 14)
+#define DRM_MODE_TV_NORM_SECAM_G	(1 << 15)
+#define DRM_MODE_TV_NORM_SECAM_K	(1 << 16)
+#define DRM_MODE_TV_NORM_SECAM_K1	(1 << 17)
+#define DRM_MODE_TV_NORM_SECAM_L	(1 << 18)
+#define DRM_MODE_TV_NORM_HD480I		(1 << 19)
+#define DRM_MODE_TV_NORM_HD480P		(1 << 20)
+#define DRM_MODE_TV_NORM_HD576I		(1 << 21)
+#define DRM_MODE_TV_NORM_HD576P		(1 << 22)
+#define DRM_MODE_TV_NORM_HD720P		(1 << 23)
+#define DRM_MODE_TV_NORM_HD1080I	(1 << 24)
+
 /**
  * struct drm_scrambling: sink's scrambling support.
  */
@@ -687,6 +713,7 @@ struct drm_tv_connector_state {
 	enum drm_mode_subconnector subconnector;
 	struct drm_connector_tv_margins margins;
 	unsigned int mode;
+	unsigned int norm;
 	unsigned int brightness;
 	unsigned int contrast;
 	unsigned int flicker_reduction;
@@ -1779,6 +1806,7 @@ void drm_connector_attach_dp_subconnector_property(struct drm_connector *connect
 
 int drm_mode_create_tv_margin_properties(struct drm_device *dev);
 int drm_mode_create_tv_properties(struct drm_device *dev,
+				  unsigned int supported_tv_norms,
 				  unsigned int num_modes,
 				  const char * const modes[]);
 void drm_connector_attach_tv_margin_properties(struct drm_connector *conn);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 6b5e01295348..d9e79def8b92 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -704,6 +704,12 @@ struct drm_mode_config {
 	 */
 	struct drm_property *dp_subconnector_property;
 
+	/**
+	 * @tv_norm_property: Optional TV property to select the TV
+	 * standard output on the connector.
+	 */
+	struct drm_property *tv_norm_property;
+
 	/**
 	 * @tv_subconnector_property: Optional TV property to differentiate
 	 * between different TV connector types.

-- 
b4 0.10.0-dev-49460
