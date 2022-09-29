Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E45EFAE8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF7910EB2B;
	Thu, 29 Sep 2022 16:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FBE10EAF4;
 Thu, 29 Sep 2022 16:32:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3C4585807D7;
 Thu, 29 Sep 2022 12:32:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 29 Sep 2022 12:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469132; x=
 1664476332; bh=z0OXWHl7ZXnpGXDQYtwuUl6hXegl5+VuHozOBqRQcks=; b=W
 KADILYmUrJlyihCL8FFrJlzdxNIHtNDaxAUMigh7gA3/+4qZWYD1O7MVegI4nFxk
 p4cA8gFM5u2gNrDtA4hkfmyQ27VjAdKUk4UU9W4KkcksTW5O2OHjOVwwRKxcPiOw
 fnpONx5CuwRoC22HW3ETR8ymLBDA4RPcAddLx3/Kw1iOTvK+ZOp5dmgQ81fAP3Nj
 1GN5RzDjOdD9wbOSNozOWookoez4KR5hTyUFei7cxXhdYQE9GGnJw82dfXWilPNh
 zcMkwqMRF9V4Ezyc27P1eNQ3FhJ9q3qkPe02puDh0GmpvvR12EBAcxQyct6BJphS
 NyHT1OYtFcrbWnXBxfW/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469132; x=
 1664476332; bh=z0OXWHl7ZXnpGXDQYtwuUl6hXegl5+VuHozOBqRQcks=; b=M
 F5/qdNe5nC8GvNXexEFaGctAkh+kESbka46mF9kW0Vz6diAPRvicY6vu13niNc30
 qoXSo5tBT/kx8BT/PvakIRlYV9UtiR37H8PDZRL8R+CppwcB8ZIyJHOGcuynDAYz
 V4ivdem97aHK3RPo3Ndb83kB/Rg4guLFKif/6W37CpIFw8zS3JGRGgJQTlkb8TuL
 C6vpjPjgrMs+4rlQFQj6bYf40Hp2z0462wOBQeZxJv0psy5VbqnjmH4Q1xwvDYtU
 lTmZEszYO2sbciFjRabHg07tQLKx7woTrB/+GcXT2OXGfKMLypqEdGLOpl2+vVQe
 n/akg/ofozMKwCZVyiTfA==
X-ME-Sender: <xms:jMg1Y-wy8WxjocL56FXkgZd7GHG04aDDPb8Fwj28C7ZyMVoGoP-k7Q>
 <xme:jMg1Y6TS-Pd0GAQbCw2orTF04o0qkB8AjPErglgd8SdR3xVJsVWrGvZJQ5JNQyXX4
 -j5OonBWe8lwRBLnys>
X-ME-Received: <xmr:jMg1YwVgwYCzLwwlWaquryXBNECKMVxCf96qtBlUA_9x8zHmRRlmcIqOX5q5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jMg1Y0jMGa4HdV-jKTf5w0oAosdzIqa8zPiGHiW9QKeEvyiDETVESg>
 <xmx:jMg1YwBvKE1foVg8rwXKNxnB3-cSyxgIBwvPpjmupMjLr4y4QgM63A>
 <xmx:jMg1Y1Lf1wKO6WyK5EGM0q4q2Md6xmtLhBulfKxDvzsWQKcCXynNRQ>
 <xmx:jMg1Y5s0r3bNR8rPdoTk6KyPYMNNr1R6kuE39N4zN6xogzyz3c7vvQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:32:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:20 +0200
Subject: [PATCH v4 26/30] drm/vc4: vec: Use TV Reset implementation
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-26-60d38873f782@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=6QTCuhxSwU/zFGvIlKtnq3tv/dSlBBSEnBrOyUAJMx8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJzxi4r5NivVm2Dnxu2D9jbOX+04d83k+q8CobhWfnVC4
 tOLLjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk4CtGhl1sa28Ke2saxG49tLvR6b
 76HEmpcHnGmbNTLxZVfDTXPcXwv9KhdfK6Gs0U868Mj8ucZzPpfPr3d/tzjj+qLpI5+jM28gIA
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
b4 0.11.0-dev-7da52
