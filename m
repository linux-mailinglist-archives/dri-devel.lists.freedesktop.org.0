Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE761F5A5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0776110E36A;
	Mon,  7 Nov 2022 14:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA6410E35A;
 Mon,  7 Nov 2022 14:18:11 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id D9A5C2B0670B;
 Mon,  7 Nov 2022 09:18:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 09:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830688; x=
 1667837888; bh=oukDemhxypEyvHT0sYH/3SEdEy222Ldgm0MEgJ8oq9g=; b=n
 jym3T6EIudHSSfb8O7SVfUcMp4nmW8h56lqREqtEAvO0VzWjSQRbOHFaedtq/T24
 YLBvxFXUMiMpXxr+9DGziyv5b9N0cGD2J4Ks9FhJ/QH17zG3ulBlQ3UN/rCuaeVW
 GPKwbToQm5+fyMYH2+iY/AzuCgTAKURFl1/ym8eVqLNWwAYaAWbrSxc1jMFKElQZ
 Q6jIeB12eMCQpPL/skt5MMHIhhZi+py+zUDLxJi1iNq9pa00tJYg8177cKB8DjdD
 p71x4AGDKljkZYKaFWOsYUQZnF+hfi6VCEwMdqUh+oXNCGroRebfw2FAfj+BryIH
 CzmtoyLVi9HztR/2pSteQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830688; x=
 1667837888; bh=oukDemhxypEyvHT0sYH/3SEdEy222Ldgm0MEgJ8oq9g=; b=J
 YkdOXAexGVz5SM9SZa9DeH6jzqNKCXlCjlhvwXDieB43vMC1wMXNVU+K24etj9lk
 R6MmP5IF0uYy0Vnkjj/BY7PyHTlEMV2VD/qxRdLE63JMGozSu5AYBOmfK0E3Qnup
 9MI+AWJsYUdRewB5X9fDtLef5M7MRP6dOP3vEDilturupHfjD08XgsyzRIwYLwPL
 bJ9tPz4jqRMwRDWTZwjZ/IOOJqn4MO1UwbRIpAOWfrx0359Ic0COZ6upiJ3KJCn+
 A4GbU90d9ln+n+Yo8hZTHZt/mEd8dOaPxcQJpgH0hRMUdZojyrxG4JxKzJG0Bo6Q
 zSNZWYW9mA3uy4R1VlpWw==
X-ME-Sender: <xms:oBNpYxFs582nnurN0weX7a-dh1AE4Rt-UrR31TfoPTOan_O7wZ8s2Q>
 <xme:oBNpY2VlQjxHejPhsNAD-vXt_9AQYtj-8VtoUbcPYCTKHUgMhunYRfY3QU5dPHfwq
 mhS8vL5au6E2myX8wA>
X-ME-Received: <xmr:oBNpYzJC2lX53895X-s-DbZW86aONoJQf2ChHIIndq8diMHQkVW20rjtDS-D5eOJ4VpYhB91HTaj-IZ6M-8w83dMoTtORW_DCbUEZ1UmzTjKhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oBNpY3GHYkwDWE_AY5LDkQ0MtLb-G4IwZPioFssCURqqiBGoQKP2mw>
 <xmx:oBNpY3X1EiIYw274h3rQLGhm1W2pV2vjvq2zXzWM7rUz6-WRMPpAXA>
 <xmx:oBNpYyM9XMm0Ms5HrsZrJqoYPcbKA5IUKdPGDfWv6htgptzNZBk3Ew>
 <xmx:oBNpYxivdaboTz6WJu8YhhHYxMBtvwo-YYfE2aPBpH2oj5H9fLWqIh-xo7M>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:18:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:45 +0100
Subject: [PATCH v7 19/23] drm/vc4: vec: Use TV Reset implementation
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-19-7072a478c6b3@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=6LiUnTDsFKEct00H/NRDhJCnVgRq8L+pVBYvvSqO2lQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg7XPJ4n/JAt583ZZ8T199mOaQxfp6l57OWY1aFqLLAz
 sV+go5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMpEmJkOLnDNu3ArpaiOfnbAsS963
 zOaEnonc8WLGXU/bnx/NlrFQx/eGQbTJMvJizzXiZ3Z6f7Ep2rF1xWPVR4WnFoF4PqND5BBgA=
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
