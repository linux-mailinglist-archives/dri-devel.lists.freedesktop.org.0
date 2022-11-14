Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BB4627FFC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A591A10E2CA;
	Mon, 14 Nov 2022 13:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B6310E2A9;
 Mon, 14 Nov 2022 13:01:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 81A68580242;
 Mon, 14 Nov 2022 08:01:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 14 Nov 2022 08:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430861; x=
 1668438061; bh=61rty2/E8oljmyBXznF/xHiRnimp90eqyhoo5j5+1vg=; b=k
 vn0/gcOe2bcD3T4vnTzJZXYFDndXfI717ZkXcOtDUrMmOSp9b12s8ROTiuWzZyWY
 8e06oDboqNct+HWt+UyZOUmYwPrRHZ0m18y6ZGvkMv3cQHNwMmALa3OaPL2vK5GV
 81Xk4g8cATjNXXj4cm4TnTURvtSWyzqRqT6ouJfUA5cRf5gdR+G9dKHLAPtmfPzR
 pMwERWez8f2QecPyk+A6CRsdAUnw0hOV6Ej9oodRepq+4gRKQ/4LSdCky8FlM/vq
 InfMktLwXtPUdQK0xJkD42IYtiwUWDObZo1s/28f6TC2A1xw0HefEA8MsKfqWjz1
 S1BL0Htk0naZywF6iWvZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430861; x=
 1668438061; bh=61rty2/E8oljmyBXznF/xHiRnimp90eqyhoo5j5+1vg=; b=F
 L6zwW4/YPquvmOagnK7qGqybwqixm+D3VbzF6+AETr7fFW6ajBEc6tdetAGABPZn
 Mg/3pia98WlXPaQ4sQwGUmbuYo/fctxnPuXm960hC8r2ZC2kvktADPak5ATwBsgR
 T5w7W96epWx74wfFny8lcSMJNLCYA2+ehcv8WCqshHiWU+6fvlTBihX9lZmthFxF
 Hsnu7MDx/dvq8BFKn8QJQR/WAGADj4/GRwZ6ZGxBnmaCxlMfFKjpO8dcEtqUzjaN
 N++DT3//zfubYJu5X07gciWIYPMxseXvqgfHYq601YkAZS9TPVQg0X65Hsy2Avn3
 i+SNly0X0MrkEiIGHpcdg==
X-ME-Sender: <xms:CzxyY1e3-xxd94O4DRQFMhmuNOnPGduPW95ErpCwdga_J7R-OFU6TA>
 <xme:CzxyYzNWDzxkoYlhGAUTPmm8uTQ6Q81nO_REtnyMO3nZipxg0ro4wenoY4boiyCtJ
 2WiDhZZpL7_MXX8WD0>
X-ME-Received: <xmr:CzxyY-jdXQLD_YU4K8DQ3qQvycXV2CFeFhr2_1X20lWN3oBRAU_A3vz2Ls5B2HTiX1AylqKJuBGNPGzxx99Gkwm5dqRK0RB1hN7NgXq-44gNbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DDxyY-9XGV48xShSdaQYWxZmy-BivPIXOMyw1lAOcTKc7LFF6fV0KQ>
 <xmx:DDxyYxvvYmRoOTsmm6Yb7EVIyrjc4UkIWticHqsT75a0kzaVqEw-fA>
 <xmx:DDxyY9GsvPghm6CYodJGTevYAp573AUtVC0XahT6bamCTeW0XDJ8Eg>
 <xmx:DTxyYy7TJ4nJ1L8dugPBBZC7BdbhdFnB_knh6rppDHTABu_NevyCjw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:00:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:31 +0100
Subject: [PATCH v9 12/25] drm/connector: Add pixel clock to cmdline mode
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-12-24b168e5bcd5@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=tc8kW46OoOxieuA+Cy7NUL9yuFca/SG7rd9wEiGcUPg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1q9jO/4xvl+6ZGJE/+ntXcK+V/+yr3a9fPyf6Nw1c/+p
 f1nm31HKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJqIgwMjxPP7K0I4V97wX5GX92ZL
 XWTLOIyvfzdOVi8qp6taMo6iPDfx/diPP+Z31TTFJjqrzVXGdaTrg9XWtN4Ufv8Gy7ByF57AA=
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
