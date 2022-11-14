Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BF627FD7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9540E10E2A3;
	Mon, 14 Nov 2022 13:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AA210E2A0;
 Mon, 14 Nov 2022 13:00:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3711558023E;
 Mon, 14 Nov 2022 08:00:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 08:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430858; x=
 1668438058; bh=f5Bxyyy3gbM1aob3o5oavcw2aZQ/p0BMdvQWWMyrDVI=; b=R
 1D5VtaycnPq4jh1AQtM28QigfQUn3hUU0KGllPepBPUaZ3t/KijVEvemhxT4MhRe
 6+AD724irdiNjeCGCihKyy27YtopcG2O9A3VLBQzQJCAHgtHXagSYKh1fLQ2CxBY
 arODKGOdU8SYqR00D7zuZ4RqcK8JJqJ3KGdPEi/4cywqwf/0Q7Z/b0ztQ3EIz4PU
 2kCqXTxcH+p7iDLtRCdh0JVK/XJZYPtjhOSWR9evuHUgub8K3oyYDY5NFh8pUeoS
 5/+XC9jVD5cb6vC+gMm5bP11zHyi335VEedxIkQ2ItfmrNmQWrDHdayrjwwOvTNI
 5uhchrGU/hmqkrBKDp7uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430858; x=
 1668438058; bh=f5Bxyyy3gbM1aob3o5oavcw2aZQ/p0BMdvQWWMyrDVI=; b=J
 9vFukDj9AhNePZ0aFGnUDhvuujQpSMzaOIzc8XKQ3zMyKIAFvcy1tDGOQteYi6WD
 HGK0kMVU+ut4edpEly1EEhKElUhIM8IPfwWKzUFrFApLG+kX6zShoAE00iShhJhV
 U4uvYWT6yOBHhdH+Z8trO0VJfNjYEC2gfkIS2ivgmQj1qEBkNC4AU1WnWE7qb+zA
 C7B79T6evZSQPABGyxsfnd3RRopUxjrUYqaKPS7UCjuKaGObfj949eIEhEhv4A9y
 IhXQQv1yEK/LfvKBxiuQeIBAcVisUIZG6QvpIddB3AqibJKGMcrHx18O5yxsKvyf
 DeWaCuO/qk5ndHi7a2aLQ==
X-ME-Sender: <xms:CTxyY7pd9yEn3NePN9TAXikJPOWsmLOOCTDVXjui4WF2QFgHbv8O7w>
 <xme:CTxyY1og9q_36Io3f0wR0ZqeoBLowGeNL1zcmDbzvoOSS7YYx4xlOqje0jLY6qd0m
 f2ZcTDODxoEluUruVs>
X-ME-Received: <xmr:CTxyY4P6NONlnwyFJcZOhVjAew8_9gIKxqbSkMW-qdR7QVdoGzYFYIxduV00wtrvCSK5FEbYkf58tu53Vy8m0faKCscB_UEmKRM8xG_EAXwtQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CTxyY-7HRybhsgkn-l4RagEfgttxIq6tZ9UlSg0786kzmlaA6DgcBw>
 <xmx:CTxyY66427lG2PMzdljUKOs2M4KaTvszG83YeyIOVTS2ygseDmQiAA>
 <xmx:CTxyY2iSyC-3Jdn9pNT2S7fk94wkGa0lzO8sXvjm5ERR2x7NchoRgA>
 <xmx:CjxyY_m_uFqILEBraKu173f51-9M7NsHWFbZQiNN9YCTCTOhvowNfg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:00:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:30 +0100
Subject: [PATCH v9 11/25] drm/modes: Fill drm_cmdline mode from named modes
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-11-24b168e5bcd5@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=V/HryWBeSFhWZNkmbgXKuJjMNJOyfsAtwscHjRyAPVk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1q8jOKW/nTxb6HnXodXuv4f75TmXl1eU7GXPSdqmlhol
 FhXRUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIl0zGb4p/9ooY3oV89/nmFrP1pscP
 U6JC50QCAubob1qjNT+c9cjmL4H6r0OSb58Up7NZOprCf3fElvqrKeuG23dsWpPQ+jk68p8wAA
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

The current code to deal with named modes will only set the mode name, and
then it's up to drivers to try to match that name to whatever mode or
configuration they see fit.

The plan is to remove that need and move the named mode handling out of
drivers and into the core, and only rely on modes and properties. Let's
start by properly filling drm_cmdline_mode from a named mode.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Add Noralf Reviewed-by:w
---
 drivers/gpu/drm/drm_modes.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 7594b657f86a..acee23e1a8b7 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2226,11 +2226,22 @@ static int drm_mode_parse_cmdline_options(const char *str,
 
 struct drm_named_mode {
 	const char *name;
+	unsigned int xres;
+	unsigned int yres;
+	unsigned int flags;
 };
 
+#define NAMED_MODE(_name, _x, _y, _flags)		\
+	{						\
+		.name = _name,				\
+		.xres = _x,				\
+		.yres = _y,				\
+		.flags = _flags,			\
+	}
+
 static const struct drm_named_mode drm_named_modes[] = {
-	{ "NTSC", },
-	{ "PAL", },
+	NAMED_MODE("NTSC", 720, 480, DRM_MODE_FLAG_INTERLACE),
+	NAMED_MODE("PAL", 720, 576, DRM_MODE_FLAG_INTERLACE),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
@@ -2271,6 +2282,9 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->xres = mode->xres;
+		cmdline_mode->yres = mode->yres;
+		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 		cmdline_mode->specified = true;
 
 		return 1;

-- 
b4 0.11.0-dev-99e3a
