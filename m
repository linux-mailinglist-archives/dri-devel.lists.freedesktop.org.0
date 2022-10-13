Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740115FDA85
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E9010E8D4;
	Thu, 13 Oct 2022 13:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AB910E8B9;
 Thu, 13 Oct 2022 13:19:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3F529580363;
 Thu, 13 Oct 2022 09:19:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 13 Oct 2022 09:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667170; x=
 1665674370; bh=0gu53s3bsjGo9n1CADsA/9gdlnR4sGfovj9CwsaTXk0=; b=R
 kWe410/XXsi/ruwSy83pqFoJ97zTdDzK6HnEo9C65rY4rcWrZXiiPPVUlABv4UnH
 hhZZ7iplXE4I3xGOOGv9uWjoZSmGj1vbWMFc7+I892yOv80+l4Z4qunShx1Kp6mk
 Goule8EG3bojgksSupfX6yJFRtzDvLBWU0ay+yEJlkETs7SwJTeRekBySeCTm12M
 Hh0wk4AGj5u570G26boHowvAJCoru9JA72llMusiPeaSZbdP4ZmE1J6HHFbzXJHs
 mQpFTtc9atWlj8lJDufmEYViCDXVkt81Sa/8zdQte3BFsRyjRD3//Qdy2WJhTVDG
 sqKABXyR+xpgW+bI5dQnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667170; x=
 1665674370; bh=0gu53s3bsjGo9n1CADsA/9gdlnR4sGfovj9CwsaTXk0=; b=e
 RTvHyjSjXLWACerkycubF9wnfNQ/a0mCWmiUVXKbY+93tLZ2u7wnRNQeHKkKN9Sb
 9jM6MfeuKvstA+YjcHs6k8yLaUFFalpic7rpG5sPHNB44RokD4j4UNzOacK7OmcN
 20ZiejtjrbGhaeXNGbQhEIaFiEGe09jzq3TgLjBdCykwgxwSmm/8RpWmNwEFNs8d
 g+uIiHg3Jf/Itc4ZMdkdaYZkd0RcYRoEqx+2qRJ0N01phdy1ndZEI+qyrbzNasRh
 vsYeqf36MVeECbdXQczFcN0EN/7zrttQdGhV6EBCCFJsAHVjVzNy1N59AKuhsGHM
 88q2ZwTeMYI+MZ1PjgapA==
X-ME-Sender: <xms:YhBIY-kt-CNiFe3gjisQGQko0Upq435DtFVfM3GsucLL39Anc0pFbg>
 <xme:YhBIY13-rPI1lWIMpbPve1xoIfQjEi7wlw80v9Blr6tW69W9vL8q_2XGThAJfrTPG
 pR-52P177fZdQzAl-s>
X-ME-Received: <xmr:YhBIY8ozTNvwhJW2UAkG-5EvW3PeQ1IiHJoBx9aOrwV5EUoen4ZaUsBnkZVSE5Pqof-jyiQi47AyfM3t43CIPdmb2clCip2VBh-h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YhBIYyn1FAWGYa_I-YMIYpfwewMEK9w9SzdE8BOG3R7paM2skoS7pQ>
 <xmx:YhBIY838Psr26zUI1gJmwR-OtudE99DLftMPH13_HVwPpU_l3fk1tw>
 <xmx:YhBIY5tt1AcF-lxIAuZR-pSb0-BjvF5gHkuqLmWqQJB8Aytciddb6g>
 <xmx:YhBIYzCOPQwUhF5AQAYhFfS1FcCe2LYL12PeTPLrL9Jl_as68q5QPw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:56 +0200
Subject: [PATCH v5 12/22] drm/connector: Add a function to lookup a TV mode by
 its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-12-d841cc64fe4b@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2399; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DpcD+G+fPHyJq1nREKWnpKni3Q3z1TTFK0fJstEAUm8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm57Fsp1n3sRI/zp18rr/E53NmV92nFY5EbumVkZwWuy
 eELedJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAif2MYGRby8vFI79GaK9QmsufYXL
 u6N4qqqhtTbnLlHPNd/pmn9TjD/7C2+wtVuyP/iEi4uAYnhLyeZlvlFH5wWt7mXOYT73PucQMA
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
