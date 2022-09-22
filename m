Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F57E5E6567
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6815310EB97;
	Thu, 22 Sep 2022 14:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12DF10EBA4;
 Thu, 22 Sep 2022 14:28:06 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id AD6282B05B32;
 Thu, 22 Sep 2022 10:28:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 22 Sep 2022 10:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856883; x=
 1663864083; bh=0h+j4Ml235vzzhk4vbz+WoFhzY0sO9zK12Ov1UnPsu4=; b=S
 FZ2SNztZYY3YCcMvY9vU8Fgp9KqOhqXb15Yv+rP4F20N2IB+r2FOGUnaVfvxeCA5
 Qs5T0iq8Qxt2gaJWx3dfD4AromirYmJfeztL91DVw0sJWUvsSkS6PoZAy3d7RdLB
 WET8r3vliStt9LpAeIU6whif9xRrEcO25hMQ30gKvXzfGYL9NV3US+3sHyggkzyw
 uNDkyOvOPE4e0nsw31ZUMw1vTahmLowaMOjBSS+BZ02wZc/h3X9hOei9vP3iCkuD
 j9kPeUqWYihzmL6GS2MRi3Uiw+22Yb6eQmTWweqObpWviMxHa1qTBCykhKuU7AWF
 tMr5v0zeBVpgxZGZ0lOaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856883; x=
 1663864083; bh=0h+j4Ml235vzzhk4vbz+WoFhzY0sO9zK12Ov1UnPsu4=; b=C
 xObU6mMlJxh0xcyUVe0lAfXA03pbupq3cG9zYOXnX8OmH7td8dTes8keWJdOrvKv
 m79YxYTwu3fVFyRbYX6Anz9qIn3yLBOs5z0+OFExR7/oTYK+lnAjYGN/DuHquIpA
 gbYZpy33igVSGf8kLtcDpRSJ8bDFxNh/WmtD9j5kPNOgXZKk0zm7Eo9phve1T/7S
 fnvVfPEI7sFDGYKE/5RkNnM+9gNnEPxQTO08iIlIR9P7yczHq1wnDb9uN098qMQy
 Al0x05A/rxQHzEHWVjASfPZEdm33gxu/auFNblF4f1HJABD1dzDq73TstZxlY6Cb
 +XGRVoX2PwW0YVpkaKwjA==
X-ME-Sender: <xms:83AsY7QtVBmfa2YMz9jIeaJDX_TDUe8Yxh7pPU99An9ccDijzKTWHw>
 <xme:83AsY8xJzesFCHdCyK-BV8jcCGkOmBxVuKqVMA3W1IT1wy5qxAHtTo_f80M403fJS
 WUKW5BmQMUOxd9iGUI>
X-ME-Received: <xmr:83AsYw0MJr4dqahX9Tn0bZMy2D9QAx_QsawgY9WUOf3Bd6Kb2l24UDXs_nA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:83AsY7A75stAgaTWehOvwCE-c87eY1xo3zcy-9wNABwM9mdag4uSdw>
 <xmx:83AsY0hOK40UgdKb4kOd8AtJYj7QKH118Y_CUxtvpP4Obco2DwBfOA>
 <xmx:83AsY_qgCx9bxgN7z4oaH49YrLQGvkD0H4_YYgeDtfJl1f5Rb2YI5Q>
 <xmx:83AsYyN9igQ5Fs-DR5dfJ4wjpE-JwAqNkgfLWuaBhLgkaLzqvmKVT-ek7Ec>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:28:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:38 +0200
Subject: [PATCH v2 21/33] drm/connector: Add pixel clock to cmdline mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-21-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=rxoD3Af1weJFe2uj/nLNvKWNvmy0Jf/ctDPA3MS5OG0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYFzp3Yzxmc6Vy27uMBAa8rKkPJUx0sl609r/w9vkb/y
 +uf5jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzknBTDHz57x5nmH9UKKsN+5azbaq
 7L+bzp3VUV7drL85fUhPy+c5mRYfKaG15zJp5WUFz0eeMD/o3Ns/JXBj1xsfm4QEVfQuiLMxMA
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

We'll need to get the pixel clock to generate proper display modes for
all the current named modes. Let's add it to struct drm_cmdline_mode and
fill it when parsing the named mode.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 5d8b6a0d96f3..eb3c4e596c67 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2226,22 +2226,24 @@ static int drm_mode_parse_cmdline_options(const char *str,
 
 struct drm_named_mode {
 	const char *name;
+	unsigned int pixel_clock_khz;
 	unsigned int xres;
 	unsigned int yres;
 	unsigned int flags;
 };
 
-#define NAMED_MODE(_name, _x, _y, _flags)		\
+#define NAMED_MODE(_name, _pclk, _x, _y, _flags)	\
 	{						\
 		.name = _name,				\
+		.pixel_clock_khz = _pclk,		\
 		.xres = _x,				\
 		.yres = _y,				\
 		.flags = _flags,			\
 	}
 
 static const struct drm_named_mode drm_named_modes[] = {
-	NAMED_MODE("NTSC", 720, 480, DRM_MODE_FLAG_INTERLACE),
-	NAMED_MODE("PAL", 720, 576, DRM_MODE_FLAG_INTERLACE),
+	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE),
+	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
@@ -2286,6 +2288,7 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->pixel_clock = mode->pixel_clock_khz;
 		cmdline_mode->xres = mode->xres;
 		cmdline_mode->yres = mode->yres;
 		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fffacbfd0a45..80e19efb3f42 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1279,6 +1279,13 @@ struct drm_cmdline_mode {
 	 */
 	bool bpp_specified;
 
+	/**
+	 * @pixel_clock:
+	 *
+	 * Pixel Clock in kHz. Optional.
+	 */
+	unsigned int pixel_clock;
+
 	/**
 	 * @xres:
 	 *

-- 
b4 0.10.0
