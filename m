Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EE3A372EF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEB210E265;
	Sun, 16 Feb 2025 09:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="TZPu83PG";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="gdpypljT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA2610E245
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:02:44 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 30B15114010C;
 Sun, 16 Feb 2025 03:56:40 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Sun, 16 Feb 2025 03:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696200; x=
 1739782600; bh=aoEvA/CFJ1os4TjOsG26WNhs1piY3FD4LMZ7JtNG/qw=; b=T
 ZPu83PGnzt8vQ0A+YNtDAY+kvqNpg9408A+SRQjEFES9IuQQi2pXm5FiY82SXmLZ
 ua/9Kfjf9nBXD3cmJf/1q0jt3OAlggPWSWQNDEX89HKKsAjVhzdPL6vyDaX0msh5
 OShdezM+Pa9rPBgrWGpQMEQyOTzrXgTeD9uZU5snuwAyc12MY6zfEe5kg3leoth2
 wfwRC158kKyYFwz2U9/iBorjNxxTKZIg7tAesqrKLKWMRMowwp9m/PsBnFVaZbZ/
 ZVQQWmKqtPhOxqQfWuFT6Vvxh8BD5kADtQ1oI9BSltHW9mrSyg5SBuTIKgef5mot
 jozF8w6izWo7mwJFJunXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696200; x=1739782600; bh=a
 oEvA/CFJ1os4TjOsG26WNhs1piY3FD4LMZ7JtNG/qw=; b=gdpypljTIAmqOCyKQ
 rM7LpPshO9v6FgKZpMrOLIpfYOFusAvH3YtaDL6mfNpiOSGZVn7Xpm9ELxQ7jVTu
 7X7rOKSTZf+EQmvHywu0xcvMXtmNjDk1MfxcxLF1LeFluNOdimFhrZ5tYOg+uQpI
 RXmWRYEQxtxtiQsrCjEYt0+PhydmqP/QVoMiUDK+TB6tqjb58ntTOv/hhqXVFXqd
 LOYe4rTwMmNh0aYUCEdI0KbbUF9gnuhs7LvPXnVCl/GwlfR2lG9huVqPG7SE8i8h
 cfnvcdLMNYtqKrmNmxZIJqndTckbwgPqPT6KFKu6bHVZXNOjLVbsFfokd/tnVBXO
 lFvzA==
X-ME-Sender: <xms:R6ixZzryH_Jp1YcjYeYGEgfiQyvDfeKzXtl-wcxgckW3kE-tljjPXg>
 <xme:R6ixZ9paqKxg3CxHORivVaTey2OLXt_UUEDppzD732vA9cFm9xhOSiTGEJHzoNUuX
 WpD_R9Upo3W1g_6Dw>
X-ME-Received: <xmr:R6ixZwPjpomNRErIEe8iDfl0HwjmC-tqM5tKgryvksog675yZ26HFFlnSjP4b_t1ey8Mswb2b95isi3D8TtaXry6E6sPyjBKxNwkHCprDl2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:R6ixZ27GqrHAFjAoThjTswovUgHtnbuIthiEIvblurW95uQTJfRhsA>
 <xmx:R6ixZy4VqaHUIDDtkpTguPcqVwFyAIRJnrHaR-bmmhjok7K4jFgpCw>
 <xmx:R6ixZ-j0U6nisYrqpM7z-zftBnj5q8RmpFuaLsuWMYkoyPGJGirFuQ>
 <xmx:R6ixZ05IRe_OdrT_xaobAPfAPhhfWOiXFyS7-gnDAcjedkBr-1DUXw>
 <xmx:SKixZ6qCgjbIbNEnmRWmdWqbKm9_7aMh8ZT_pinOAeuqMHW0QEhm7nYW>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:56:33 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v6 08/27] drm: sun4i: de3: add YUV support to the DE3 mixer
Date: Sun, 16 Feb 2025 21:50:39 +1300
Message-ID: <20250216085432.6373-10-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The mixer in the DE3 display engine supports YUV 8 and 10 bit
formats in addition to 8-bit RGB. Add the required register
configuration and format enumeration callback functions to the mixer,
and store the in-use output format (defaulting to RGB) and color
encoding in the mixer configuration.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v4..v5:
- Remove trailing whitespace

Changelog v5..v6:
- Move color format and encoding flags to mixer and add struct.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 54 +++++++++++++++++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 11 ++++++
 2 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index a170f68708b1f..bc934186bfd6f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -23,7 +23,10 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include <uapi/linux/media-bus-format.h>
+
 #include "sun4i_drv.h"
+#include "sun50i_fmt.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_vi_layer.h"
@@ -390,12 +393,52 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
 			 interlaced ? "on" : "off");
+
+	if (mixer->color_model.format == MEDIA_BUS_FMT_RGB888_1X24)
+		val = SUN8I_MIXER_BLEND_COLOR_BLACK;
+	else
+		val = 0xff108080;
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
+
+	if (mixer->cfg->has_formatter)
+		sun50i_fmt_setup(mixer, mode->hdisplay,
+				 mode->vdisplay, mixer->color_model.format);
+}
+
+static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, u32 *num)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	u32 *formats, count;
+
+	count = 0;
+
+	formats = kcalloc(5, sizeof(*formats), GFP_KERNEL);
+	if (!formats)
+		return NULL;
+
+	if (mixer->cfg->has_formatter) {
+		formats[count++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		formats[count++] = MEDIA_BUS_FMT_YUV8_1X24;
+		formats[count++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		formats[count++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+	}
+
+	formats[count++] = MEDIA_BUS_FMT_RGB888_1X24;
+
+	*num = count;
+
+	return formats;
 }
 
 static const struct sunxi_engine_ops sun8i_engine_ops = {
-	.commit		= sun8i_mixer_commit,
-	.layers_init	= sun8i_layers_init,
-	.mode_set	= sun8i_mixer_mode_set,
+	.commit			= sun8i_mixer_commit,
+	.layers_init		= sun8i_layers_init,
+	.mode_set		= sun8i_mixer_mode_set,
+	.get_supported_fmts	= sun8i_mixer_get_supported_fmts,
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
@@ -484,6 +527,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer->cfg)
 		return -EINVAL;
 
+	/* default output format, supported by all mixers */
+	mixer->color_model.format = MEDIA_BUS_FMT_RGB888_1X24;
+	/* default color encoding, ignored with RGB I/O */
+	mixer->color_model.encoding = DRM_COLOR_YCBCR_BT601;
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 8417b8fef2e1f..5f465a974fbdf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_plane.h>
 
 #include "sunxi_engine.h"
@@ -177,6 +178,11 @@ struct sun8i_mixer_cfg {
 	unsigned int	scanline_yuv;
 };
 
+struct sun8i_color_model {
+	u32			format;
+	enum drm_color_encoding	encoding;
+};
+
 struct sun8i_mixer {
 	struct sunxi_engine		engine;
 
@@ -186,6 +192,11 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	struct regmap			*top_regs;
+	struct regmap			*disp_regs;
+
+	struct sun8i_color_model	color_model;
 };
 
 enum {
-- 
2.48.1

