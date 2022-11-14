Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE57262801C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DE510E2D5;
	Mon, 14 Nov 2022 13:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA3610E2A0;
 Mon, 14 Nov 2022 13:01:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3839A58025A;
 Mon, 14 Nov 2022 08:01:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 14 Nov 2022 08:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430880; x=
 1668438080; bh=WzHrTprnBAe52maf9lpsGehgH7WaqwFDWh3sdB6vf8o=; b=Q
 Vk+Ki+A2Z+UBvWFMtJ7nptBnIEJbM6+5HqsW/zCLDwJ2Syx3IsIe3vRDyAGdb/dG
 ssshZ1NpB9Ke91IAcxJoMbD4JgOZtDzpsR60nie5yGslp+MI/8HINLOTRzsR75jv
 pe0ik3+A0JR+soY0fIsmhm4XBDBHjhPrwFrNWlPPhNu22X0jA/pHeU6mZhb4SMvL
 FXHaBEOtjrfWQyFTN8gn3GT939it5iI43x7zc8wn1RYXG4hjRf5DnQoQVpDqUbB3
 ovZJgDagmHAfyNmhFTSXGMLRDktMWk+VojORBpLirbuq4k8QeRZs28UfjAj47c99
 OGJ47mt/x10dVrdDIrBEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430880; x=
 1668438080; bh=WzHrTprnBAe52maf9lpsGehgH7WaqwFDWh3sdB6vf8o=; b=A
 gHNwOK2C0UtKepsK4xLVemkzUOpUli8wwwTy9E4bQni3Xr6lOG730juhbkSbU3F8
 319OkPHJQQiEYe8ckmzkwQYxZBSTv8ckrKe7RFbxvXs8LOe5RmAW04IJfRBqVKPN
 ei0xnUdr52MeQYTLV09pwJI9+/vTTIuuUZ9PtnVzT8588tzlLHTEBJf9IF5oA55V
 YkCSMQuQ7vaFrqy/xcr5B+5JP2xCjKEexdwTr8DqlSSXQeSw97st6MfFZYgqp7bN
 S8r5kjMr1lpWvwawkU+gUwwdHonLBwqmRRwwqU09lTq6hCDZI8XY/l0WyI1AEj6X
 JAX34J/TZHHi9nw9Q8Cvg==
X-ME-Sender: <xms:HzxyY3G927NJIhEXiVLbOBdq1rK9UJhm6P8j3PvKLIG1LnOlYOf0Ww>
 <xme:HzxyY0VL5eqtw7IClSjHJvyTwMJnmAVRmPCo2i4qvKPmX51vvJm4QcWuq3_QAXFPG
 gIzXIy6d4wkUQfeC14>
X-ME-Received: <xmr:HzxyY5JiPTaNf3YtiqaAuPb3eOdrFP0vcMdlEfm7reagQTNi77GkvggU4nQrRny0BwFa7BnR3Hj_QYp_QcjcHnAa3cWKNK8FjElPA0IxVVPeAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IDxyY1GQLf4oCHCzxStOV2UZqW06wYMQwjgmSST4-UDCCF5ISDfnrg>
 <xmx:IDxyY9X8_q3H5o5_yz2PbBobGKuxPQ_zSNv3joN1iNQ-TNfovkyRkQ>
 <xmx:IDxyYwOh-3fKDHT76rAqNDIqop_Vl_CV1OQt1urBs4jnZC2D3sruSA>
 <xmx:IDxyY3glUemzLZoCquT1YP7YGhysmlKpkCmz0WJWTel0V7yS0MuR6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:40 +0100
Subject: [PATCH v9 21/25] drm/vc4: vec: Use TV Reset implementation
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-21-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=C3T6k0df20WcY8Izrp2Cea2hyon8BnPa4arDwQR537s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1m+6Op345u1XfxQgtrShlm+FIN+pp/vWpizsalIuFq18
 J5XSUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIkwZzD80zux1vRO0e7fUZoT4v3eiD
 zX0r+rHPGtJPrIpwRZreuH9Rj+qZX+q/q07+7ZR44XEr1iLH+LCxye1sQW5iLEYCwlmXeWCQA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The analog TV properties created by the drm_mode_create_tv_properties() are
not properly initialised at reset. Let's switch our implementation to call
drm_atomic_helper_connector_tv_reset().

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
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
