Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318A862D6FA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497B910E5BF;
	Thu, 17 Nov 2022 09:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69C010E5B9;
 Thu, 17 Nov 2022 09:30:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 328502B069CD;
 Thu, 17 Nov 2022 04:30:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Nov 2022 04:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677401; x=
 1668684601; bh=WzHrTprnBAe52maf9lpsGehgH7WaqwFDWh3sdB6vf8o=; b=i
 BVwlbQXQBTNRQ/fyZWeIQFloB9X1GEjkg6nXr+X/iGLFY9m+X2VZr8R6L1xjXIs2
 D9Fbz0eyfFtUgc7xxBns6PDg7BvfsKSKwroUlUi4vN3jjGLWwx9GCM2XE8Tv5N1U
 PrvYegd3YC1UIfnyt0Ntml3R9yUjsGKO8z8Q2dAT1adYTx+rRVEyYGifyVIbQnco
 +jInckNSC3PWNoZ03HAhqx+CcvTY7IAA56OdcFhYbBqiKC53LRTXZ6Ix+xI6Us7p
 bOb+BdjmDYmhguPhSdY1T9AmpPS3SDQyBLRTi8ii7JT2r1VEGS4jsQXnwjO9IW8W
 bqZOD1l/KwmoR+mv9EUuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677401; x=
 1668684601; bh=WzHrTprnBAe52maf9lpsGehgH7WaqwFDWh3sdB6vf8o=; b=r
 k6uD6a6m37a6z+aMbtHhFsNedwaDgxiZDjdA0qsnIpMQOIRjGU6d+RKUWEux5auI
 RaVtjgdaqiNKyNb2nF6gp2nLjY76VJknHFkE4mRMFip0QxkWrFEVnpPQWYYEGjuK
 CcB544lXUFm+4hbvxkOZfJzdVqPj3ZDkO29yfY8R3E3mvwjwkNBwiXZErGvjnC9k
 44ePJuGqhwcIo925B1G+ku9ThWdmPqeKR3SpvgGlEbvPG/EmT0XeM6kkta6myYZ8
 SQVQrB5U7zc8ZUVGR3U3FH4rhL2/Q0MAe1/Wdp2pduZxGV0yaot89Mfi4PAKfZFz
 OftfHbWJLu/4heOGp3/jg==
X-ME-Sender: <xms:Gf91Y1uRTrVukrdRZQaV5K3DZDx-KVAZkVNAuIa0wqLlN8ayqCXo_Q>
 <xme:Gf91Y-fB5fpx-mrNlqfGP9Ob0kq_0Hot8uFS8ZW4xszi1tzctkQVjGP7wmuJw4GMX
 0Vv88IvoP9A1C9U_0c>
X-ME-Received: <xmr:Gf91Y4xxXUrSGKIPbGhn-YK-PabIfJKDCZS9-Wvde-vX8RLpRNeKPLzBT7ZBMlsiUNgeM31PP9hdH567G7CBVSEpr53b4X-Swq155Jjdpk6wuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Gf91Y8OMwPcMmECFnGvIFbUDZJXnQ1F8Vg84SQbdgoKWGgdv61Ju5w>
 <xmx:Gf91Y1_lepVKCPHJ3osUESqajaJjjuabV_DzEc3WdEQHqx10J7CrrQ>
 <xmx:Gf91Y8Wf4WWJETo455MHsZ0nyC1zIvNW84-gdfAeA1V9j9VNCOKb6w>
 <xmx:Gf91YxI_yeNWgwKHuLV7-npuoyhhjBCKjKqJlL40Wpi43JrBkaUNLCpHos8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:30:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:58 +0100
Subject: [PATCH v10 15/19] drm/vc4: vec: Use TV Reset implementation
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-15-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=C3T6k0df20WcY8Izrp2Cea2hyon8BnPa4arDwQR537s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y70B0nN+HxLfOWPbbLyvIl3u9oDRDOc8hsStvRsKZct
 22zfUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIm8ncXwT3P91EVq+YYhYW2Rhxh8Cy
 KebZbZUTxDb96fz0sUHGe6PmT4py7fHlPe2C7TzKHAF198u+DDkisBdkGW+ZsTPF+zFG3iBgA=
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
