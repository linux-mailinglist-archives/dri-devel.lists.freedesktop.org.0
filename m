Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3F55A4DB1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018D110F296;
	Mon, 29 Aug 2022 13:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D29310F28D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:15:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id DF5142B05E5E;
 Mon, 29 Aug 2022 09:15:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778953; x=
 1661786153; bh=fGq4pxjwR9dhN8V94rScn9Z1raHP34bbSYZqQRlSHw0=; b=c
 VXAet/qyIapvApr4WQBJpPocgntulpZY1iMHgEOHg6IOdnmDSveEjj3Z8AKVmHc7
 C3snlSKLgltL8UUmjsAtZfPms8eriiJSBQMJMMv96+UWrrIZbcihxTFOzArWyOUS
 WYbvYV1ir05vDLmz/OcTIJUsqeJPnF0O4HFr56HWO+O6dnm42EWhfga8x4dwhgm4
 wj07s+IrTQg1peX5jGvfNDhFycYUccwXfFSFYh0v7Jin/SzkCTbbx2AUa2TCzJiH
 ZOqUGD7DJTplKseM17IJPtDX3OCWHkeNrc5iOZ/S0+nDdioFGvGvk9CX5VMP9WJr
 WMRsBmhG0wdCzBgWU2a+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778953; x=
 1661786153; bh=fGq4pxjwR9dhN8V94rScn9Z1raHP34bbSYZqQRlSHw0=; b=t
 XOfZrOEyjM13jfV1nPLKePsnAo8mXNQfreTSb+SO/DhCM67pNDSwKfdu2lE9O7MZ
 8dA6mZBcgOJSrU1zbEtdHJ3nNM0gmeERQXR0SI6jApcEXKgu+LWtYRQ+stQRcA9a
 1QvQq/z/rLnXizwQ/LU4Oo+LlHDDwW4WWup/C9Hqderml0ot9FMIYHFIl9yKjHCM
 G1xzNsm/sPJCmUV741nzZ6KcIdYWeZ2Rj43M08xaNOAa3OmaXGiBsmPaCo+ewMmR
 dRWTGI8I//uQzxge+fvfoMw9BUx+yhAB5h0t3v5gU29SrQ5rypa+sry1bXeIbZ9+
 rFvdyor2LMfebHEuijAZQ==
X-ME-Sender: <xms:CbwMY5lv_41j_OE-P-G8UBWFUExV6USRSTZ7JBatlEBZWisV4tblpw>
 <xme:CbwMY00WCMtyhe2SDEKoguUCPgWtj-tJ8kMKSyhAIfuCMeyI018c9Iv9pPD8T6zia
 JePfdDp2vt0rhLCkEw>
X-ME-Received: <xmr:CbwMY_oE1wIe6eHHH-09LpWsGskMyYBz8-OaIjupOr2NK53P07ukT7baWM-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CbwMY5kmYQu1bfBSA0m59MNTZhRKTVlAevVrZ7iYvn64h5f92_tKPg>
 <xmx:CbwMY32pWqA9-pSWFG91Wnpv4yx3CXcdvGY5fXLabDHvxErI8WJX-g>
 <xmx:CbwMY4sUA-FUVrMlExBuoAxl9eYhppLJgBcQ1w_1853zshtafthUKA>
 <xmx:CbwMY4_VJPI7-GrSiiQYvxgizfO_nDFDkni_CMwTUm0Jap8D8j65BFlVQb8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:15:52 -0400 (EDT)
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
Subject: [PATCH v2 35/41] drm/sun4i: tv: Convert to atomic hooks
Date: Mon, 29 Aug 2022 15:11:49 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-35-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=EjOnDOZq2Ss8h1qrZ2KbpJgd2LCqDkVnUyJOEPlgRRU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxSZmRf9TNF9MLFCtKDh5WYP9ySNxJebzPxF3ifKTegX
 //Oho5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABN5wc3I0C3w1OXska8Z0ziW3cybKH
 d28trNi/xnvNBh45Yo2PNjxhRGhkkfI1cdvB1c0TZjwVWp4y6Fs9e7/trsvM4iWiQ+JfzHEyYA
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

The sun4i TV driver still uses legacy enable and disable hook=0D
implementation. Let's convert to the atomic variants.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i=
_tv.c=0D
index 53152d77c392..f7aad995ab5b 100644=0D
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
@@ -339,7 +339,8 @@ static void sun4i_tv_mode_to_drm_mode(const struct tv_m=
ode *tv_mode,=0D
 	mode->vtotal =3D mode->vsync_end  + tv_mode->vback_porch;=0D
 }=0D
 =0D
-static void sun4i_tv_disable(struct drm_encoder *encoder)=0D
+static void sun4i_tv_disable(struct drm_encoder *encoder,=0D
+			    struct drm_atomic_state *state)=0D
 {=0D
 	struct sun4i_tv *tv =3D drm_encoder_to_sun4i_tv(encoder);=0D
 	struct sun4i_crtc *crtc =3D drm_crtc_to_sun4i_crtc(encoder->crtc);=0D
@@ -353,7 +354,8 @@ static void sun4i_tv_disable(struct drm_encoder *encode=
r)=0D
 	sunxi_engine_disable_color_correction(crtc->engine);=0D
 }=0D
 =0D
-static void sun4i_tv_enable(struct drm_encoder *encoder)=0D
+static void sun4i_tv_enable(struct drm_encoder *encoder,=0D
+			    struct drm_atomic_state *state)=0D
 {=0D
 	struct sun4i_tv *tv =3D drm_encoder_to_sun4i_tv(encoder);=0D
 	struct sun4i_crtc *crtc =3D drm_crtc_to_sun4i_crtc(encoder->crtc);=0D
@@ -469,8 +471,8 @@ static void sun4i_tv_mode_set(struct drm_encoder *encod=
er,=0D
 }=0D
 =0D
 static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs =3D {=0D
-	.disable	=3D sun4i_tv_disable,=0D
-	.enable		=3D sun4i_tv_enable,=0D
+	.atomic_disable	=3D sun4i_tv_disable,=0D
+	.atomic_enable	=3D sun4i_tv_enable,=0D
 	.mode_set	=3D sun4i_tv_mode_set,=0D
 };=0D
 =0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
