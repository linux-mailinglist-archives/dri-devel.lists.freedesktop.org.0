Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B55FDA8C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D516310E8D9;
	Thu, 13 Oct 2022 13:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169B510E8B7;
 Thu, 13 Oct 2022 13:19:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7628B580361;
 Thu, 13 Oct 2022 09:19:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 13 Oct 2022 09:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667168; x=
 1665674368; bh=EcVa+F5wBs0U8u3lcwqRSumK1Ge7xOxqo2twF/kmNbQ=; b=m
 LnWJ/Lg8V369BmZYnbXqPWTvMsOB+T/3dgO2mXVwuUzgJcrnPCiA5pooLH1FOMQB
 jdJaBQXZVYPXy39b6X6jcKHub7YSd0UyKvg+YE/bfe+VtuYlCFLQQSI7wIk4j+Ia
 EM3dei6bNrltBCsfD/Z4CQniLQbiEEAJGTHpCIQeLglvmTjTHLu0RYFmWQP2EEi9
 CnWq3ilnVzrVX7V4qiXq78rEqjMHJCyhzD8fP2wby2jMJYRTRHhvgsuyP8/E/dvd
 UTPEndeGklSvGSYm5xXKXmR/C0wXWMLwbHorbbfta6L+/jwOaEFtZM0IKewBzv4H
 5sRm9tL/mzmzwHHvA55VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667168; x=
 1665674368; bh=EcVa+F5wBs0U8u3lcwqRSumK1Ge7xOxqo2twF/kmNbQ=; b=Q
 ydnxFzxjJs4rP6jo6mXdr/0rIlw6mp6udIVXkFMwXNn8QE49DwtRXihwi/jVwTty
 tMkD0V5aEqisW9pYjdwmULrWgyZgWbWCTHQq3itzsVpjTk1ihc5dRqHzarOBvhqA
 qfNDrPZJXdlE4KAvFwVgrgu0ZG/sTuVKBq01wof/SAzARz4p6a6SDBAU8bwsK/QF
 lPmerAHF0luhE2Zt2nCPie7Cqt9fDo3EHRu2j4/Jlgz2seXNqXSGx0Tr0V6VhjGt
 MtbvdgW/V74p8z6xtpOQFO0DzzPaJxTnTvtDolFHJj1/DCcdcC/kJ43JLzCL9s1F
 TTsNWcU22L4bSiNNcI2xA==
X-ME-Sender: <xms:YBBIYyk4iYA37W4zXgepKqEDkSLjMV17r4F67NHuCRhYWcZj5wxeTQ>
 <xme:YBBIY53bo557u7bmNdjfolvkPoFwy2fNPd6-VfS8E0dBF_iyMiDbD3F3gOGyVjYuE
 np0uAXuMD0X0rbxkNk>
X-ME-Received: <xmr:YBBIYwroL1X90uortUqjRoMy0l_X_HfWEZVkOlpBEKxqVlsXnTDpFfLEkrZ49lvQwF7fUvGSqvbH0P1ZvNYYWnN4iPvqueZsxnsx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YBBIY2k0-ikZFWbX_t2yEtqx8v-xvJGrLwtWkWwqhPQaD5HIHVI32A>
 <xmx:YBBIYw1rrkVFC4lo9xlApkeM3KaaYT3CGMwSxssl2bCrbaetXqQx8w>
 <xmx:YBBIY9veU9ZlrPtGeJUQU7BldkejahcDqZpvwr3AJ5ao34VevEyv0A>
 <xmx:YBBIY3BmQSpQEzQlw1qD6pXmJ_djL2s5cfa7jsg05FIMp9zgisMTbw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:55 +0200
Subject: [PATCH v5 11/22] drm/connector: Add pixel clock to cmdline mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-11-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=QbNCgm82V6S2tBs6+XZNLt2sq0MrNz5IcEWsIXP+sUQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm7yKauNInOklPbqO91esupR3c5fs/Rk30WnHglufuu3
 exZDRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYyUZeR4bzwNLnZ9//l7NsQnvD2on
 /Slp4JWXUSueWsC45IX4k4Ysnwh+M+z+t1u+76fzAK59q52rFWZfXBqgl+QfdP1f0/56UfygUA
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

We'll need to get the pixel clock to generate proper display modes for
all the current named modes. Let's add it to struct drm_cmdline_mode and
fill it when parsing the named mode.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_modes.c | 9 ++++++---
 include/drm/drm_connector.h | 7 +++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 99453aca9a83..068c78d54db2 100644
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
index ef5f1c779de3..a501db7d2222 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1273,6 +1273,13 @@ struct drm_cmdline_mode {
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
b4 0.11.0-dev-7da52
