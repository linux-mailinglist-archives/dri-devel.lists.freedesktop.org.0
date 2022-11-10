Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DAF6240EF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DEB10E704;
	Thu, 10 Nov 2022 11:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C2710E6E6;
 Thu, 10 Nov 2022 11:07:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D542E580309;
 Thu, 10 Nov 2022 06:07:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Nov 2022 06:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078460; x=
 1668085660; bh=61rty2/E8oljmyBXznF/xHiRnimp90eqyhoo5j5+1vg=; b=k
 D60GsoKWOMuzQzmEh/IY+5qhvgwUfUhkcmvPvgFAwFtuum9E+b1IFGUbXuVI0h8R
 lQNirgb+bb0HIXp60a2g6NAqBTuoRrhbZOyAWxjaiG9bs6KrDV3nWjTT1wlzAlWH
 RqnJK9KLi/5+Oa1NVu++XcdA3KSZ0DKyMHCpZhzuylQAZhCPlIe915aJexhLsheH
 GGEW8Ronk+dCK+UWfkpG8NiEano2Px/uXXdopx3t1J0/e6Oczm5d6WmCOJeMHtf/
 Pph1TbkNJTDRUNoMEDrs7ff7EIWKHFtyUbi2NcVoRUIMeoLMB+NsHZ890HUxQv3M
 YEX4AWeSDs9V1kNT64kXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078460; x=
 1668085660; bh=61rty2/E8oljmyBXznF/xHiRnimp90eqyhoo5j5+1vg=; b=G
 vAE8zeKvOJf3a/WIqOEo1FQHsVHQ+uYrXBGUtP82GBYGDfPELfflLNeA/1Q+CqJD
 hxUFMebzkTk36Rba9fl6dSEvLR3BZITqx5OxHrOT5aMmU3MtxdO1mW7766JaHGtd
 pJBcQwb3dx9yp1UXMfHHzyMln3rKxZrSuyqWNH7ICE26U7npQxmy1PFvB2MppRXy
 dNQ2ASer7X2zzD9w9Ax6psg0vou4abWmw52ec2B17U1doIuIL7reIvHmUY7ki0Zx
 QkhC/GkuIRh8ka/jT0j96kYFJ32wqTnnSOAH+cI3CQMaO1wJ9wiNl1RYmUujrMaE
 C2zAnVBmOQrF++e/otFJg==
X-ME-Sender: <xms:fNtsYzirGW9fCSLC_LOtwOxjEUtHnvmkVdDBV_pP2uScxh8natndhA>
 <xme:fNtsYwBTWA0h4199MzvXLv_XEq3zDoZSmR9ZhtWCJTB_VCtHx3NTlbWtGpPtEuJbv
 o-fyLTR5LvIq1rg28s>
X-ME-Received: <xmr:fNtsYzGvjYQMUwhVxBZ-QouhirAlkmmj2gFm9s0L-fJewCRWKckDeFCyiYcLPqe-QOidNy64AAvPWAzBm7y3DJDszNmYGKAmC3RtE8nV9piM4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fNtsYwQKyf9u8nPQ96fxrcVSO6_0d6mbIQIDpQ3Few1c2cs2nS2zdw>
 <xmx:fNtsYwygjHcYQNSlllCDYJXK79D68iALL8B3l2DijeuVR0bQNDDILQ>
 <xmx:fNtsY26JobJqb9IC3_ZCDHJu3kEyEB0rYou7y1Gz9Evm6zdlCL__aA>
 <xmx:fNtsY4cwr5CLcC2AqiKcKpoudI0IcQn8dymj4AyAiT2baonRIgw8rg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:40 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:23 +0100
Subject: [PATCH v8 11/24] drm/connector: Add pixel clock to cmdline mode
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-11-09ce1466967c@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=tc8kW46OoOxieuA+Cy7NUL9yuFca/SG7rd9wEiGcUPg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1PLDj/Pfig9rcaK+1t4fZ+8oVm1yJzHonFJcXu/7jvV
 mruso5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNZy8PI8CdmjrqvoCfjxLss352id3
 vvY4/7I6VZbeazmn3t6XiGpQz/K103FW/vPJBUfDNxRY5cw8rv1obvn5yUFmXmq6t/LMHIAgA=
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

We'll need to get the pixel clock to generate proper display modes for
all the current named modes. Let's add it to struct drm_cmdline_mode and
fill it when parsing the named mode.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Add Noralf Reviewed-by:w
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
index 9afc7956fdc6..4927dcb2573f 100644
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
