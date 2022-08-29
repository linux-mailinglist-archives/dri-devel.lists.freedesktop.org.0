Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42655A4D29
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F77110F1E6;
	Mon, 29 Aug 2022 13:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C7A10F1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:12:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 76BDF2B05FBF;
 Mon, 29 Aug 2022 09:12:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778747; x=
 1661785947; bh=FUxBpFLSpEpdeB7d6rfKBhHHVk+Wnl894IA7RcPFbO8=; b=L
 tl2lzDZVHwS7dKQAe3f03jOfE/cEUgVzIdS1y01dn3utBM6GauzoQZVqOEQ/+UTu
 Vvbq5EooDy7chugsAWs6av2tt79+QSTEAqvhxsmnnM7Tt8aVYfgIF0MEtgcgZcD+
 YoX1DZ6qDG3WrVrWhHu1vpESfxO+T7f7rlVpHmC/1gc1l7mwjrqlsT6MGGnMTo7+
 EJGwTZzgBg7vKlB5ciW7BiP5ygTXjSC5yCdNvekfnMsYMktK68Vq9qS7F4VDfMWB
 hvfdhaUp4bGQyy+5DJ+JukNegFKykIQIaqj3kOk21sbXG/GnYYewvsh8SAD0quaQ
 fC2dS9EDfPKyLfLo2s06A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778747; x=
 1661785947; bh=FUxBpFLSpEpdeB7d6rfKBhHHVk+Wnl894IA7RcPFbO8=; b=c
 9/GisJr+NTP2CPEeUms/aSkaZxXvDXxUQbUEu+/XS5oONSRkCVNc+s95U7KKVlZs
 jWEAns0Si4eiP6KVHOphd0cDDZhxqISNJ8qCyG7v8IFTMV6gj+d4b1Kk4yImX5jS
 4B4UPABx2lenJGZ8DvkVhtmgp1wymi12IKLIbNIHFkAMWEzJ0jhS/xCAScjipP1O
 i0BZ1WKXb7G9LZUILo2mqFxFkk2gXoGVxeUwgzVeBLTY8Mdj1te207nlvXTdGcVa
 5ZIpS4mYF7lvOZrvARcAGK9VsKX0ZNalTnjlLp3rUJJ4spL7Ah15NER/DIyDN5ka
 thZnHHgJxLirV4AKF4pKA==
X-ME-Sender: <xms:O7sMY4XZuHrvAlFwvLIR1ngSAdsFTmWIELMNamYvotrbAXwYhUtkcQ>
 <xme:O7sMY8k3tHjkWXQKSub2UTT225nXeCQA-mobxaKYlItzpDXhTpdj_05iXYVTwXjJB
 hLG8rwZG0mfliYDYVI>
X-ME-Received: <xmr:O7sMY8auhgGCIIMmlu7HPQVpwAngHXUvCK0sUUlayFEV6KZjFhv7XEhmw9Ve>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:O7sMY3W6yb5pg0cYscCxeIjtMLK-EuNvetOXz7jlJAlnkmZeJ-iseg>
 <xmx:O7sMYylGiQ-6FA22HQauCp9ow60FMS6gKJvoU-0z8OEXsIxutSUrmA>
 <xmx:O7sMY8dRLq8YJShJRf8ooLhpeNqt2RArmnc5OigCk7BqW7PPnXmJhw>
 <xmx:O7sMYytJnCvlxNk2Zb-V8RrhGG7hsgj9PgmFbEvZ3guP1Ngk5BwPkQ2_uxg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:12:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 04/41] drm/connector: Rename subconnector state variable
Date: Mon, 29 Aug 2022 15:11:18 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-4-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=2244; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=OONh/z5JtUSoKCW+mxGXJavuhFd8shOk9r+qmSxAS9c=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+Q5fi2YG6d6zH7G9qCF3s0GW5TFeaaFteqEbHrqZ2N9
 t9ywo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMRmMrIsLZKT5/j6mfTfk2pHd03dt
 dNc7xgFFWz3Hn1z1MmyvlNjxgZnk3vDbrm2/BatKtxy7rqr8L5rWa6fT8ruJZ43tq66WQvIwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is two TV subconnector related properties registered by=0D
drm_mode_create_tv_properties(): subconnector and select subconnector.=0D
=0D
While the select subconnector property is stored in the kernel by the=0D
drm_tv_connector_state structure, the subconnector property isn't stored=0D
anywhere.=0D
=0D
Worse, the select subconnector property is stored in a field called=0D
subconnector, creating some ambiguity about which property content we're=0D
accessing.=0D
=0D
Let's rename that field to one called select_subconnector to make it move=0D
obvious what it's about.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>=0D
=0D
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic=
_uapi.c=0D
index 79730fa1dd8e..c74c78a28171 100644=0D
--- a/drivers/gpu/drm/drm_atomic_uapi.c=0D
+++ b/drivers/gpu/drm/drm_atomic_uapi.c=0D
@@ -687,7 +687,7 @@ static int drm_atomic_connector_set_property(struct drm=
_connector *connector,=0D
 		 */=0D
 		return -EINVAL;=0D
 	} else if (property =3D=3D config->tv_select_subconnector_property) {=0D
-		state->tv.subconnector =3D val;=0D
+		state->tv.select_subconnector =3D val;=0D
 	} else if (property =3D=3D config->tv_left_margin_property) {=0D
 		state->tv.margins.left =3D val;=0D
 	} else if (property =3D=3D config->tv_right_margin_property) {=0D
@@ -795,7 +795,7 @@ drm_atomic_connector_get_property(struct drm_connector =
*connector,=0D
 		else=0D
 			*val =3D connector->dpms;=0D
 	} else if (property =3D=3D config->tv_select_subconnector_property) {=0D
-		*val =3D state->tv.subconnector;=0D
+		*val =3D state->tv.select_subconnector;=0D
 	} else if (property =3D=3D config->tv_left_margin_property) {=0D
 		*val =3D state->tv.margins.left;=0D
 	} else if (property =3D=3D config->tv_right_margin_property) {=0D
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h=0D
index 23112f0c11cf..60b5662dec7c 100644=0D
--- a/include/drm/drm_connector.h=0D
+++ b/include/drm/drm_connector.h=0D
@@ -703,7 +703,7 @@ struct drm_connector_tv_margins {=0D
  * @hue: hue in percent=0D
  */=0D
 struct drm_tv_connector_state {=0D
-	enum drm_mode_subconnector subconnector;=0D
+	enum drm_mode_subconnector select_subconnector;=0D
 	struct drm_connector_tv_margins margins;=0D
 	unsigned int mode;=0D
 	unsigned int brightness;=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
