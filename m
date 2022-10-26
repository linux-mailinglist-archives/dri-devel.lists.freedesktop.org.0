Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54E60E4D3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB93510E574;
	Wed, 26 Oct 2022 15:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A160710E520;
 Wed, 26 Oct 2022 15:34:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E846580350;
 Wed, 26 Oct 2022 11:34:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 26 Oct 2022 11:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798451; x=
 1666805651; bh=oukDemhxypEyvHT0sYH/3SEdEy222Ldgm0MEgJ8oq9g=; b=q
 4VnfLoshwVR1xRhCzeMA9sj4Zr8b0hZPmHG0hBYoEhtYYE5ShChwDrceTQePxafw
 p2nRRjGs9AbAcuxTBKFKv6dgVRHBSd/hZfq0Sn+Ofj0BjzAVRo5YWQIR75eYFNDK
 OdOKucLsorPhOmTk6ch0l0980mDyb5/oh/nY88XytCcE6zx0TrkeXrJGP2OeBIkr
 gBFT0O6XjeeQGfL8ynrnNIJLUH4jrDB9aSZ7EauncPYX77MclxRIG+0JlySPTBgs
 BqyHWAJjAC4P6cV5At0Bzg9lXWGtQAEFLU2QGG0RG2KwxG0a/mCDBvAgnFbDjpav
 StOiNIi+oKMhJ2wJ2I0nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798451; x=
 1666805651; bh=oukDemhxypEyvHT0sYH/3SEdEy222Ldgm0MEgJ8oq9g=; b=h
 xN5v+SioKxvkNnB8vldVG9jGCPunj3EiPSkVIp/PSqUElNh1Z9unnBtMOSQbC61s
 uQa/48ijKqSy60aAneu2m42UbxF3spSmlxsTUymlSYmCr6DTWr5AXKqmc3T34LcJ
 T3mMb9TWTAdQhxzlncL3zoiDS+0mT7rNArTHngA3zXqb/n7DzOQxdbMfeQgEY0L6
 I+WKVo2tPEwvzgobakI6pL7iJTshLnENEj7Pvtk1H66FbOwvfWNvZhX2IeRnwkmG
 0cqQ4/NHtUy13d5XkIarDiJF7AT1bS+Iedh9j3kNPBieYoKJbXWVRSlsTkSwfO/R
 ut0yqm7AQFCzoMjunvCsQ==
X-ME-Sender: <xms:clNZY_VaLyUBdXFWc1sxiklgstnExOlfQsd2Fk55IL9Bx7lgL4bUng>
 <xme:clNZY3n0s_jhWUiISv9siroIRgCPOhjrZlE-SzS8Qyji-uxz8UThgFXKS4DXlj_kq
 0ej7pzbfbmtxyIGY4Q>
X-ME-Received: <xmr:clNZY7YlMNcQ_ngIfEwvkqnlI45STyqmySL6-f2Pfy_S04EgfuycY98Q_fabTTZVjV70o0FBptih_gOA5Bye64lrQVgzQzz9DQawJm_8fFhmBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdekveelgfelveelfe
 duheelvdegudffgefhudehgeevjefhhefhhefgvdeuvdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:clNZY6X-DL6TvYvEi_16PR2MrV2ClEDrMQOkY7zyGRRMN6JEUB3nGg>
 <xmx:clNZY5lusKpxkRrwDlfPAv__vi1hXnzZws7j8JC0tmhpWjx3swJRTA>
 <xmx:clNZY3cpb1RXTyJ1HFj1P_BkJPvRcZbHujH2WJ6GFTI_JJ_kwVNbHA>
 <xmx:c1NZY9z4og5OkPFMNhGSbFew27ST3MpoZx346TmPxSRTbeE4V7umzw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:34:10 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:38 +0200
Subject: [PATCH v6 19/23] drm/vc4: vec: Use TV Reset implementation
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-19-e7792734108f@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=6LiUnTDsFKEct00H/NRDhJCnVgRq8L+pVBYvvSqO2lQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwe4n8g76L/2j+/xDbteKaW/KeW7P0Ta6bWu99/cX0ykh
 aQKyHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIxZmMDE0cqtLVlwLDLkn9fvVMXn
 hbqVFwQPvi8Jf7Znk7MTxaepjhn+q8ntm1+l9lv1VImxxa+2R3j+CbDMZd4bstM2aqih8M5gIA
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

The analog TV properties created by the drm_mode_create_tv_properties() are
not properly initialised at reset. Let's switch our implementation to call
drm_atomic_helper_connector_tv_reset().

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index adc9bf99e3fd..90e375a8a8f9 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -268,6 +268,12 @@ vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_unknown;
 }
 
+static void vc4_vec_connector_reset(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_reset(connector);
+	drm_atomic_helper_connector_tv_reset(connector);
+}
+
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_connector_state *state = connector->state;
@@ -288,7 +294,7 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = vc4_vec_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };

-- 
b4 0.11.0-dev-99e3a
