Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C973EAC65CB
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F9410E5BD;
	Wed, 28 May 2025 09:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="CGKNiu3G";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="rEP9bJtq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD6810E5BD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:25:10 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 4E119254015F;
 Wed, 28 May 2025 05:25:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Wed, 28 May 2025 05:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1748424309; x=
 1748510709; bh=F/xxKE/RbNWdySHewAO3ADlzlrveCK4NgIZw1I3hAUM=; b=C
 GKNiu3GzOAIbqpw910mo/uMGwWJgqVUlIWq8FrrkAahws0Kf5Z3Y20M9GN6aX0h9
 gTShfeef2OTGzH9RAlTThh2MdUw7byxyvYJDZohc/HlKZ5Y0GxWoTgOE4bk+tHqD
 o4+awKjmR3xzc7cDgVPz6Vvli/9xbEA1wb2vxIgtRJMBiFO+3aKJJKuBqLpN9fBg
 XgqOZia0UZlvgBfYIwEWWThIPU6PFUiX0CSNXuSdVINJ880jixUOCR9F/zuIIfh+
 5qDTNPTjpCs+Jz2ZyGjtYUTWiSjlrXnj5hii4cYTtcHG7gza71WJRMDBoX8J8w5T
 WFUnWtq/dUd4BCNOvPBRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1748424309; x=1748510709; bh=F
 /xxKE/RbNWdySHewAO3ADlzlrveCK4NgIZw1I3hAUM=; b=rEP9bJtqU3iAo/YFe
 N3IWFV0qYxzTdhcuARI4WBicE6mSCxTYYs1ML6gFq8zIWdrHxZvupRCSv0i+eHKJ
 Un1X3SnVV/TI7vsCDny6eVFxsEzNzruS7xFrDXYFavMcOMxv4l/x0FmYQuk6r5I1
 gWYeFktnTbQWv2BHFWsZS0aVp6qkiu52xnkqw7bcjaHjzzLkLQpM7Z81lFnbCUlC
 H0zMhfJs4y/V7t2VD5uaEoAucl+Zdwms1X9RHVpxWr3DlYrP8Zz3YInZ9LPxk/c1
 9GWgykQ/6z5q5INnQN22lRrwln12K8JrFLHyCf23o5CKOJ0Zbcrpq6kP+FeeBw0a
 5nrPA==
X-ME-Sender: <xms:dNY2aK5mZcMJE-1N7yEs74PIxNM7Ilcsx4lliDHfaHY_9zon8sWFSA>
 <xme:dNY2aD4oyyAfrL8ykUmUMpDglKS16IoXjKsPqdaRcU39bUlVAFwDedY9HDG8mjYv7
 J-l3aUOnjOooLNxJQ>
X-ME-Received: <xmr:dNY2aJcuMFGTdLroJajXIZvc8SRrg16lYR0V2ipeGt3zmAghQAHbkDZP0cdNs2-l_gA6Q6peB1K4s-eIkHyt--mQ0WMvBkgDnNnscbwS9K1J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdeltdculddtuddrgeefvddrtd
 dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
 fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
 dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
 jghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhi
 grnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvghrnhepffehieffgedt
 gfffjeetveegfeekleeileekveeuteffteetudffveegieeiheetnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
 shhtrdgtohhmpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtg
 hpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhs
 segtshhivgdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtse
 hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhes
 shhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtg
 hpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdr
 shhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhoh
 hllhgrnhgurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dNY2aHLsdgXn5DJP_X9HhP7GTagj1DEN7VY6nEtqr_zNSxLicVn4ow>
 <xmx:dNY2aOLcbD1Y5UwSWW-bSkDd_56F8L1Yoe6qKjEeYNX1e8HCdJJG_Q>
 <xmx:dNY2aIy0CxM4PP9v_Bx0UnQ2X_N-t_PPrBTzYcRx0F3mS4XCSB5AXQ>
 <xmx:dNY2aCI53-v3Iw9_hIcLP1-3CbNlYDA7wilPf7eUxC5Dyuwd1SMIrA>
 <xmx:ddY2aAx5KKJLrY1alsUJunDzK72pKjYdGDAMWAyFbU0-llFZ0IMB59If>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:25:01 -0400 (EDT)
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
Subject: [PATCH v12 1/8] drm: sun4i: de2/de3: add mixer version enum
Date: Wed, 28 May 2025 21:22:06 +1200
Message-ID: <20250528092431.28825-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528092431.28825-1-ryan@testtoast.com>
References: <20250528092431.28825-1-ryan@testtoast.com>
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

The Allwinner DE2 and DE3 display engine mixers are currently identified
by a simple boolean flag. This will not scale to support additional DE
variants.

Convert the boolean flag to an enum.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v5..v6:
- Update struct comment regarding change from is_de3 flag to de_type

Changelog v10..v11:
- Convert mixer enum to upper case and move enum definition and matching sun8i_mixer_cfg struct change (for DE2 and DE3) from patch 10.
---
 drivers/gpu/drm/sun4i/sun8i_csc.c       |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 14 ++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h     | 13 +++++++++----
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  8 ++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 ++--
 6 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 58480d8e4f70..c100d29b1a89 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -212,7 +212,7 @@ void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
 {
 	u32 base;
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
 		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
 						mode, encoding, range);
 		return;
@@ -228,7 +228,7 @@ void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
 {
 	u32 base;
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
 		sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enable);
 		return;
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b41d33baa30..f5368761aad9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -537,7 +537,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	base = sun8i_blender_base(mixer);
 
 	/* Reset registers and disable unused sub-engines */
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -628,6 +628,7 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.ui_num		= 3,
@@ -636,6 +637,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.ui_num		= 1,
@@ -644,6 +646,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
@@ -653,6 +656,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
@@ -662,6 +666,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -670,6 +675,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
+	.de_type = SUN8I_MIXER_DE2,
 	.vi_num = 2,
 	.ui_num = 1,
 	.scaler_mask = 0x3,
@@ -680,6 +686,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -689,6 +696,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
@@ -698,6 +706,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
@@ -707,6 +716,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -716,7 +726,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
-	.is_de3		= true,
+	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d7898c9c9cc0..d34e7fb3143a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -151,6 +151,11 @@ enum {
 	CCSC_D1_MIXER0_LAYOUT,
 };
 
+enum sun8i_mixer_type {
+	SUN8I_MIXER_DE2,
+	SUN8I_MIXER_DE3,
+};
+
 /**
  * struct sun8i_mixer_cfg - mixer HW configuration
  * @vi_num: number of VI channels
@@ -162,7 +167,7 @@ enum {
  * @ccsc: select set of CCSC base addresses from the enumeration above.
  * @mod_rate: module clock rate that needs to be set in order to have
  *	a functional block.
- * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
+ * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  */
 struct sun8i_mixer_cfg {
@@ -171,7 +176,7 @@ struct sun8i_mixer_cfg {
 	int		scaler_mask;
 	int		ccsc;
 	unsigned long	mod_rate;
-	unsigned int	is_de3 : 1;
+	unsigned int	de_type;
 	unsigned int	scanline_yuv;
 };
 
@@ -214,13 +219,13 @@ engine_to_sun8i_mixer(struct sunxi_engine *engine)
 static inline u32
 sun8i_blender_base(struct sun8i_mixer *mixer)
 {
-	return mixer->cfg->is_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
+	return mixer->cfg->de_type == SUN8I_MIXER_DE3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
 		return DE2_CH_BASE + channel * DE2_CH_SIZE;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index ae0806bccac7..8b7a58e27517 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -93,7 +93,7 @@ static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	int vi_num = mixer->cfg->vi_num;
 
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
 		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 9c09d9c08496..112f0a37cf4a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -25,7 +25,7 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
 		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
 		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
@@ -483,7 +483,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 	} else {
@@ -507,7 +507,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 
-	if (mixer->cfg->vi_num == 1 || mixer->cfg->is_de3) {
+	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
@@ -524,7 +524,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
 			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3)
 		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
 	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 7ba75011adf9..bd03607c8b7f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,7 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
@@ -956,7 +956,7 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 		cvphase = vphase;
 	}
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		u32 val;
 
 		if (format->hsub == 1 && format->vsub == 1)
-- 
2.49.0

