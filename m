Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860DE5A4D35
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5368C10F21B;
	Mon, 29 Aug 2022 13:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F62610F20E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:13:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DE0332B06057;
 Mon, 29 Aug 2022 09:13:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 29 Aug 2022 09:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778795; x=
 1661785995; bh=5SmMwyB9Gqo8FDnXGtfd83YIIFTn/fwrRNe//5Xw3dI=; b=t
 vkJx7SeS1Cy1yJQMfqERqufTAT+s42Q/fsY8BqGnHF2WH82nxv54orocvcQsDRSe
 xHEwnDwiAvdCRWdgtIvjdVG138mZX/FkxJqXEvuQ2j+3dljstbGtxuvN0NKS8cqm
 yrtyLvP1AF5gttBnR3m9QyGJWOHtqfHWm7ZVwmUsaAkcLptw6gsPBkO6fbBADeuW
 5JpByOliaT/Dz6oYTS753tpSe8UO96aZOQaK+AdLwZeuUygTcELBH9EPS8rMva7m
 RDe16clj6vI4xOwZWXcKW/Iyl95azTUmuBDD9kbJuHdDOntoCfrQO6Bn4vaudqHD
 bg5dC3i1jsG08ffjD5y4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778795; x=
 1661785995; bh=5SmMwyB9Gqo8FDnXGtfd83YIIFTn/fwrRNe//5Xw3dI=; b=T
 DNq5wlW/QB6mLqqaE8+uTZxuMwFFIAAdRI99gXbGZGcs2Bp0L+7EnGqbP0ApWb32
 E9+sbTKvmaSY29vURTvbnYqlD8Xc1Trl/mDCb117C/Oz83UyaShSxoiPmhGr1/o8
 3UCcx6RpckiTNPH+uvYeSfzGrnAg1gLg/wjiJUMgpYNy4DYd2RDAG6icAguhH8Rx
 wYBH9bYFVYo+qJbG+5PajyHfJT4X6lf4OClsEi4HlK0zhyR8PymfIYw9kNVHzTh0
 m1kx2cKWIQog50gFNd29gd48AyVJIpxZdi+amzF7hU0ds70gLTiTsHEwK/rADDsi
 Sw7P6ZMPx4x/qinOZSC7Q==
X-ME-Sender: <xms:a7sMYwyB-k92QNp8-nQ9XvK_0dfuOCEAaDSzJjtVa9ARGDDcaWM8Nw>
 <xme:a7sMY0TWn8SnlNgA0BcQGz9GBnFSC_9GLrYrxSSLUTgHCLgYOC0sGgR_7nCAwa9o6
 0kEW5u6rcFzf1gx51M>
X-ME-Received: <xmr:a7sMYyWrn8jEeKYdkKXaGuDlma7RgsvSgFrPMtk-eNPgjKhOtktVUvLbKpZb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:a7sMY-iIvgCVvL2dem2GF3eP8kaq3WYieT102Utpg0w3jw-wqjhb8g>
 <xmx:a7sMYyB_RCJ6kF6QlGRzTf1bCClGBbLnJ3SHOpqyfegcBooyfiWb8g>
 <xmx:a7sMY_J8x5PafkdERhvaHQliP5Z64LnTNyH9-p0iiUdh6A07RKPpUA>
 <xmx:a7sMY065C0Zvo9S-7e8fcRgLIBQnTqOJ1YpBSk4Vc7NDK_iS5wJP4mEmE5E>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:13:14 -0400 (EDT)
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
Subject: [PATCH v2 11/41] drm/modes: Only consider bpp and refresh before
 options
Date: Mon, 29 Aug 2022 15:11:25 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-11-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8m2oE9knJwjnJjXPGWMUzPqprWg4Yy2kfTXAOXrvUBw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+TFb5186ny1/84sy/s5f/fZntb7tNzPRSPttvTSm1cN
 ez4c6ihlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBELosxMhxUVWW7O7lOLH3qibNR5y
 7/5vyrydC9J37Pi3/7lBmPvqhl+GelPS+9T6HOxO6kutbhwMIzWZXcy7ojzn15b1s2dQ1nJTMA
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

Some video=3D options might have a value that contains a dash. However, the=
=0D
command line parsing mode considers all dashes as the separator between the=
=0D
mode and the bpp count.=0D
=0D
Let's rework the parsing code a bit to only consider a dash as the bpp=0D
separator if it before a comma, the options separator.=0D
=0D
A follow-up patch will add a unit-test for this once such an option is=0D
introduced.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>=0D
=0D
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c=0D
index ee581ee17171..b4e1ff56b4d8 100644=0D
--- a/drivers/gpu/drm/drm_modes.c=0D
+++ b/drivers/gpu/drm/drm_modes.c=0D
@@ -2254,20 +2254,22 @@ bool drm_mode_parse_command_line_for_connector(cons=
t char *mode_option,=0D
 =0D
 	name =3D mode_option;=0D
 =0D
+	/* Locate the start of named options */=0D
+	options_ptr =3D strchr(name, ',');=0D
+	if (options_ptr)=0D
+		options_off =3D options_ptr - name;=0D
+	else=0D
+		options_off =3D strlen(name);=0D
+=0D
 	/* Try to locate the bpp and refresh specifiers, if any */=0D
-	bpp_ptr =3D strchr(name, '-');=0D
+	bpp_ptr =3D strnchr(name, options_off, '-');=0D
 	if (bpp_ptr)=0D
 		bpp_off =3D bpp_ptr - name;=0D
 =0D
-	refresh_ptr =3D strchr(name, '@');=0D
+	refresh_ptr =3D strnchr(name, options_off, '@');=0D
 	if (refresh_ptr)=0D
 		refresh_off =3D refresh_ptr - name;=0D
 =0D
-	/* Locate the start of named options */=0D
-	options_ptr =3D strchr(name, ',');=0D
-	if (options_ptr)=0D
-		options_off =3D options_ptr - name;=0D
-=0D
 	/* Locate the end of the name / resolution, and parse it */=0D
 	if (bpp_ptr) {=0D
 		mode_end =3D bpp_off;=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
