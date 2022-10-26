Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9073B60E4B6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F51E10E532;
	Wed, 26 Oct 2022 15:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F22310E511;
 Wed, 26 Oct 2022 15:33:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id ED810580391;
 Wed, 26 Oct 2022 11:33:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 26 Oct 2022 11:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798434; x=
 1666805634; bh=pyJuUVmoEreLhGIAMfmEWzT9wwvecaBv0R5jhGD7w8s=; b=R
 F7xiyuwtLYW272iQkBqmMeUm3fbR57enAgOHLGUD+mlnvKPdLrSc8O1JFAOrjXKH
 zO7oIRx1Paj4zdc/3wDVgVdUQKQFe0VOfBFxUsiQA31nDmaatrsyd1gDRSVtKg4q
 SXtcH/iYa0vqRc0aRreEClYeCaIBc9ceY9+hVcZH1H2WCzygKjcZkzzXKhxDBrCM
 5FMp1NmXNDwM0UFVwS2yx04NQ9WX03GAjl71gsxnpxo9M2j/m5+mmzVlBZqnz2eS
 3Zz6q9xdQbkMRnK3H5xomuwCE6FE9PcdpAeYbmUkBWiHP48rAVlG10X6y3vKh74p
 bM+G4Or/ynQ/o3x+EpGoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798434; x=
 1666805634; bh=pyJuUVmoEreLhGIAMfmEWzT9wwvecaBv0R5jhGD7w8s=; b=S
 eL9CzazJAUxDpeH8qkKZjhAHmNDcNh0mk4fuV/6QIGANS+G0Ay4rEAbZilKIdup2
 /sXgWKeQ3J27p0isyLieL1Yjlr6L44iOCPrp5+wPaHjPpFn5P1H4nJmZUUkdgDLQ
 2MNTuevHxYzVJHZiss12QTHNSR3aUJG1dacdpuzzAncw6aAz3iQl/XfHDAPeYK0F
 oY9VoOXaqy3/+ohjLscf3gj/3kNBznH03Pi59ZmYp7xFxXKvyzMXzKy2oE2bxROW
 bJPzuukO2M4cd0AFlAmcjnYXGO3+SXb0ekmDG/nyTeCmZoTY1/hHdkollS4NtoIh
 XY2dpMo2p6trCE7uQ0iWA==
X-ME-Sender: <xms:YlNZY7JMzJ3gX1wsPsNYAyDNXfpY1qUzF_AgymmlLBYQLYs6Yr6buQ>
 <xme:YlNZY_Kv8hQLZ_o8Zgn-BNUjJ1AH6R27lqet0_I44bIt53y3ypELvpuWcs-ctFC_k
 y36xMf9yKYLDgk2wsY>
X-ME-Received: <xmr:YlNZYzuu4PuRgfBIS3oNwCSrMj6kpUxMjUcP5hhB4zxLT2DuXLCJeiBZV5ot-Px2OHDuCLwcR2TdQIEAj92qfYALKVSNeyvwAWdva7tcEihRuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeefudfhgeevhefhfedtue
 evueeluddutdetuddtvddvgeekheelvefhteekteeihfenucevlhhushhtvghrufhiiigv
 pedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:YlNZY0adeigmjTBK4B9skjn2eZrA-67XPTcHmdHJ2CVouUEm2Sd_IA>
 <xmx:YlNZYyafTVLm9E-3AWz9dKHJW2n9JSjILHrMXTXj2eIG_PBkmo1Dhg>
 <xmx:YlNZY4CD9_M-lGJbR1-tbCdBVY9AmdHuc_W_IB6KIlCZ2ZU4ruPv5g>
 <xmx:YlNZYzHztDAWnIcNGyRFmh3M3ZDnIXvlKCjlvp2wwD1KE9L5QLtabA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:53 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:30 +0200
Subject: [PATCH v6 11/23] drm/connector: Add pixel clock to cmdline mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v6-11-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=dwBpTlcm4vsh2Otz5VTcJxTcweYnMFBxICZwtkt6WXs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW4PbidWyW5NX3FLZ+VO8fnFG0Wyb927Ev0n13ZRgP9r
 y3fNHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIxReGvzJZyvbh6t57SlTZo0s/2z
 6q3LVNwvHEQ/OLwc9/bfo4mYnhr2y3wben20qD2+Wt551hC0p+G9FTdlYpVtiiofXwEzURHgA=
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
---
 drivers/gpu/drm/drm_modes.c | 9 ++++++---
 include/drm/drm_connector.h | 7 +++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index acee23e1a8b7..c826f9583a1d 100644
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
@@ -2282,6 +2284,7 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->pixel_clock = mode->pixel_clock_khz;
 		cmdline_mode->xres = mode->xres;
 		cmdline_mode->yres = mode->yres;
 		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 96b2e4e12334..5c5e67de2296 100644
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
b4 0.11.0-dev-99e3a
