Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E56240F3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044D410E6D6;
	Thu, 10 Nov 2022 11:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFA010E6FE;
 Thu, 10 Nov 2022 11:07:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id EF75758026A;
 Thu, 10 Nov 2022 06:07:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 10 Nov 2022 06:07:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078477; x=
 1668085677; bh=WzHrTprnBAe52maf9lpsGehgH7WaqwFDWh3sdB6vf8o=; b=m
 P6T6mN2UBm2ef22Yp0DpK2+LDvAfAp5dp4EpYSgrrUau4WT0+pMUcgp53VFyNWa+
 OPLQifV0GacmDNh+ZbHSVlnVze9jpNaDBn62eGelVfWnrHsaCFyhMRcsYdeytPWq
 Wj1ghQo3rT5C5uE8bRiduSwSNCchT8BAj7zVU8B3D/6f/3zk2GjYp02PkfUtlNho
 saiRqdQ0OmHuFnLbY7U/jmxl5LvYEwQPBLQkEr99tkrFtcsmmrZwJH8UapjzTt22
 B/frL8hqgbGlDjpXsMI0vlf8QoiPKsLxZ8RRpMgU51Sawn0qXzLYu9+ra8H1blvT
 exUzATPKLVht7I0AITKbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078477; x=
 1668085677; bh=WzHrTprnBAe52maf9lpsGehgH7WaqwFDWh3sdB6vf8o=; b=D
 ZqJ+aQeBjqAzsuxPFlkhYlTGMB2DTl7hrIoH44HyVNYP5zTi4NEdYRY4Usg2Agpk
 3aoHgMOM2HozM3U4Wj56VUk5c0PVqQNU5VylQIHJCS/PxOV8+6g3HHRTnsQtaD+h
 lZ+JtoPAHuPf+UyKYZJrwbeG6sZvabAy4QL2JXpFHpYDWmmN+9DVY2fAS5T2WkSK
 8v2yGJ59EID9Hh2kk7fG7cUZ550EbHslqh7Y+xPufw5Tut1gIzFWCCRlYGNoKN9E
 XDsxoPMHIvM/Fgy7/p/gB5Qlv2fF/KvQt52260NZEDQXjPVLW/Or5Ld+pI2dzLvo
 IME1lbeT/nBVHBYOgL74A==
X-ME-Sender: <xms:jdtsY75HbpMFbWBAwJqdaSIK9TvT5P1LYEdm58eiVwpaBFhJw0vPEQ>
 <xme:jdtsYw5chwlyHvWPbUyMFLW9v_APCPr9xa98QI516OUKTZUcneQqhiDYdKD_clFCl
 jGjtGsPRoeeQJG3pqI>
X-ME-Received: <xmr:jdtsYycen6OU1a0uad8XrKLo33u2XNJJ7eO9urGdj5VtMUxmJ7guPPvNyyzHy2irBXUa6D8kvBowLWLipVbt-uG4DMWiWDNOuxI0mM2FcBHfIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jdtsY8JMroLUv-a9S8fHponck8QUbYSPZw6kFrTRrME9cw9zRxzVXA>
 <xmx:jdtsY_K-SHg35K58EsbISZa5Z8exN-SCX3Ykbo2X1nCEn2Jh76j2zQ>
 <xmx:jdtsY1xVhfbx1RLzJZphguwCc5T7clRc4LkyjFY9fWMppxFifkv9Hw>
 <xmx:jdtsY9275djZ8bikpCJYz8AdO5n3WW-0axPgxBOfvLVDYd2WHfv0qg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:32 +0100
Subject: [PATCH v8 20/24] drm/vc4: vec: Use TV Reset implementation
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-20-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=C3T6k0df20WcY8Izrp2Cea2hyon8BnPa4arDwQR537s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1Nn/7hyUNRo2mHfzdlBPGIGrmeF2P9/2jVnS1ks06/C
 dz5zOkpYGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjAR51cMn1mO/XVod+JdoDzXQyrq2X
 3eNYblSy0LRY4w7VvrYfogj+E3i8vpEt/ni5iPxvhPlZsxY/Erm1k767dnnF3ts8VEuf0mIwA=
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
