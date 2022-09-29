Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0903D5EFAD9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC98110EB16;
	Thu, 29 Sep 2022 16:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D8510EAEF;
 Thu, 29 Sep 2022 16:31:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 56140580800;
 Thu, 29 Sep 2022 12:31:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 29 Sep 2022 12:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469116; x=
 1664476316; bh=EcVa+F5wBs0U8u3lcwqRSumK1Ge7xOxqo2twF/kmNbQ=; b=H
 /lYpJjdsGQj3vhE+9P2EZ1VNqq29if3HzxFuqVxVgwZUZ9rgJkzmy6imO8KwCi7M
 BtuK4AJC1FocZXeAMBaOJqe3tVXk0UoszlAj0Kpz6A0vRHo6KyJ48JB77FGBzC91
 O8aOIyTBfCHHALC949lqlzwmsbggUkD16L3lnTpLFG3Kt9LRIatX6b+Y5hq6gIMg
 Q5lYdlGUwp/BjIvblsSDmgqtQS2SadBwLW7q5oE8QowoAN1flQvYSGNu+iVw3Eo2
 qTISWfl3FUiQGdYCsIEydQSN4IO2QFmAHYqZMDiVFYh1GIbUyDtdG3wv/sAwwWTO
 Zdx93yS45LWo+ACpFx4sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469116; x=
 1664476316; bh=EcVa+F5wBs0U8u3lcwqRSumK1Ge7xOxqo2twF/kmNbQ=; b=G
 T3gyrZWZ0ppWYns+4SEWaRBWshdeKjENIyuF5iTkXJnP6PAIK6I2iEYm+j2gFVqP
 fghSl56cfQP+AHWQkr1/ajK3tE0uT1rScFwxAd6p925xt4dm4yNzRfHR2RDZRtjh
 MigxbbCGDqSJ62dBPPPa0SGxkQK5iOEcnOU1dqGxYY2KgHb3HCzAuaO0yCgtRmC/
 ln9iwnrsSZX0SozwdB24IXiue3R208cZvFrt5ytAnh5AM3DkEGjng/aFIEuGyt/7
 qGQ5RsRjmpxsThXRgPccsMjHJm+ubQsgaAgl3atHI+AUAEcAtH0o7ETrMoXwTSBh
 lU3iX+9xxId7sFry5rO9A==
X-ME-Sender: <xms:fMg1Y-MgUQ9iM3h0G--VUdS0M8XaSRqW_0OSa_ji7SLuThQ4dOEiEw>
 <xme:fMg1Y88OUdx0q8YJ9DNXi8zeBZt8BRO-gWlUaASF-K4-Kl3R76nUEnMu35X5sIdGy
 ht51QrZUuUgKx5uKQ0>
X-ME-Received: <xmr:fMg1Y1SgBcLZ3iaiNTbIcO0u9zWKNvkizbMQxGlo7QVDE40dYWGQLqnSHXOt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fMg1Y-snxJSJmM0AYbtWWCOnDKUzJFwB2Mxg4pzNqQIDCYcD6rnjlw>
 <xmx:fMg1Y2flSWa_weaEr4MZm9NWsvFfLoNrM0KctlP_aYGYSdRXzvvkwA>
 <xmx:fMg1Yy3Taz_WNw4LMWnueiVNDbGxabEvpen326jIap7isTwNBNpbDQ>
 <xmx:fMg1Y1rWgzEavxRDhyu5Jcalk9lT3LUkeqrsAM3m3zgZQJi_qyPXsQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:12 +0200
Subject: [PATCH v4 18/30] drm/connector: Add pixel clock to cmdline mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-18-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=QbNCgm82V6S2tBs6+XZNLt2sq0MrNz5IcEWsIXP+sUQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9ydn0wz+3KqJGjndt+ZxZuXbrU66KzzTjBm5flphaqX
 FthrdJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiHoWMDKvNjI8FnXa74hl6d0OI7o
 fTScWrpQPWMytWvX15L1Xd9jTDP6X3Er/OG8rYW0hmtV0QLj2c1jk9+b9CauHu/xfc067wsQIA
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
