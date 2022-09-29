Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7745EFAB6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676A210EAF9;
	Thu, 29 Sep 2022 16:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF31310EAEF;
 Thu, 29 Sep 2022 16:31:58 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3B285580801;
 Thu, 29 Sep 2022 12:31:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 29 Sep 2022 12:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469118; x=
 1664476318; bh=Bn+yLC+WwAngcBNckGbTNQ6x0wysJQILdOm8yz9juZI=; b=O
 ltSatKWEVsTksQy6v9qdc/8JoCNegSCm95ul0LAQ3deXBoKNOXW+z6ibyHrBsjJL
 c1iVK/d7JeLjvbeaXY2SFaaotpLF6AHVjLjbBtTmTpA8JPLgMseD4R9H6JgOMKez
 ioacR6NAzE8VL7N9ZNBPzuaA1Ejcs8NG8PnsuRBlYVZsYkZUyapi9VnMx4xY+9yU
 9h1eYsykIA0T3Yz8G//ZHVgFYKRklJjrIVcztm2Y+HZ7LYl8/7I559KxMwS6KpvE
 f0DwOCqf2N9Nc3WZ671J90a3HoePBNT5zxvVABr8LEX/3BOZXXH4l2T7y+NB2D+t
 0WzDac1Scot8D5g2656Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469118; x=
 1664476318; bh=Bn+yLC+WwAngcBNckGbTNQ6x0wysJQILdOm8yz9juZI=; b=T
 2L0fRLeCLX7osK+nhQEW80JqSLfXCdQDWc837lUJWQTo8vr2PUoixDlvNInuz+a3
 Ny1m7WugCHFQZUA4VjMd0Z26ADt1SorKMz7PGAzIcoQo7VVwDjsVX4V2sjRp6bAj
 sIfg9WZNi0as5Gki4eoJubllndMtLN5k2XjiXF69IroWL7FwkUWRKUYL3SLudjxx
 ABKOYU771RMmMkKdT2t44JuFv5QGdWeJuwB730RE4rumudb4rIVjz9drZFIaxCi+
 8muPSoAIJrDz8mBX2a4j2oyDG/KeJZ5CKRs24dNwn/WKzQbSc18RPu1N0JoDB/Ka
 BgKPMFASeymlZ6lO4U7Mg==
X-ME-Sender: <xms:fsg1Yxdc1kqANVivgv7rm23XCM_Fzpc_sv77YOUSCGqgusyfZwfyGg>
 <xme:fsg1Y_P7K5PYej023eg0iw-nJDGfX9EVam-NCtFt5YtprKWTkIxQ3-dxzDB8X46ym
 EQsT4ydaCZP-YiT7yw>
X-ME-Received: <xmr:fsg1Y6jweiMfGwq6HeOiItCoC2D7FcKVw_2r39s3RlEEozoIwG4W2Svl_KTB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fsg1Y6_TUl9RiABx4y3t-tQryR_Jb-z5sxzSAg3qx9xjKP5ak5rpow>
 <xmx:fsg1Y9sfCyR6vXfDdnRfz74wGK6Rsc_wPfxsCvlxkQYC8EQHPVz5NQ>
 <xmx:fsg1Y5HuJSCvuTsX5ooqWkJMVKbbmd_6V7vUqW8s2RwI_QAQ1EII8A>
 <xmx:fsg1Y-6xcY6ZPup8lYi2J2AKrV5CSi5AwNu6z6FRn3hzm1n2m_dlOw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:13 +0200
Subject: [PATCH v4 19/30] drm/connector: Add a function to lookup a TV mode by
 its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-19-60d38873f782@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2399; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=xwC5gv3HSLLd/JRgPYDbUCEfU3CZ/zUu6g2c/goWffs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9wbNpfosp1qkXrpPfWhgmqg5Pa8CXODwxr+OdixfONU
 a+PsKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQ+HmZk2DclX3Xqtk3RprG/70++1m
 RZt+q4d0N5Ncf7J2FWH3ovtjMyXH/aZXu+uphni3aA/7TWF87uEq++ztl2ubHVY17gi0/TmAA=
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

As part of the command line parsing rework coming in the next patches,
we'll need to lookup drm_connector_tv_mode values by their name, already
defined in drm_tv_mode_enum_list.

In order to avoid any code duplication, let's do a function that will
perform a lookup of a TV mode name and return its value.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 24 ++++++++++++++++++++++++
 include/drm/drm_connector.h     |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8edc347ef664..ead5b30c193c 100644
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
index a501db7d2222..a33f24a76738 100644
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
b4 0.11.0-dev-7da52
