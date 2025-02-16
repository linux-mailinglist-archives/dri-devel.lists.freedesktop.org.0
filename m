Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618E4A372C2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 09:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A249210E203;
	Sun, 16 Feb 2025 08:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="ZSiQuSpy";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="F5N7E8HX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C925D10E203
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 08:57:19 +0000 (UTC)
Received: from phl-compute-13.internal (phl-compute-13.phl.internal
 [10.202.2.53])
 by mailfhigh.stl.internal (Postfix) with ESMTP id AB2F525400DB;
 Sun, 16 Feb 2025 03:57:18 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-13.internal (MEProxy); Sun, 16 Feb 2025 03:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696238; x=
 1739782638; bh=SR4aNkCAYUtHiaJCGIpwOMkLEnS0n+g9NnW3F1+kf3I=; b=Z
 SiQuSpyr94y2EW2Yv6d47YqKZ1YSgVnZNNsDVyZD+I6+iO3UHkQ0PO1fyk+1+KNW
 xxK9Bghs8SIuX7luZQiRQ2OxiYIhepAH91l73jUIrDP9PN7bAEF5/qJHDomkyhcE
 dmjEvq1yOm9l/ok4+8zvqbOhZHC2++13XuxbDr4L7xAm4U0KequP5HYOmBVrX6rK
 F1uIdyyMRi9v0Adz9WHqAdjn71zLOb5VQ9iQuVVcGghLViZS7dD77XYDwf3UJriW
 6fD4O+r5/34GKGc4JxwaanHvdfYJQQl5Bkkpxxhh7Qkep9Kgkhvt2Omb/bFL9KF1
 PpcI0dtHQ0SF/7pKujIVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696238; x=1739782638; bh=S
 R4aNkCAYUtHiaJCGIpwOMkLEnS0n+g9NnW3F1+kf3I=; b=F5N7E8HXjVMLiCk3H
 i3qaqioe0zfVKPOTkPKuOIPkseDK3lF6AAK92nbFEFuekENsQJk91LCrBLbEoyf2
 QrQzkw9+7uO7ge2NyPMU86bfMW7lGQRPWJ/WFwLGxhZe9Z2G5HtDW1bfMhLz0Gmc
 PctYAeo7rhuqoNMEZBfbqDmKfYIOY4hEpxlSkt8ObQhSPmkm2pij0/VunYjz4DlQ
 NtnzpSTHypvragUG5dqvYnbjhBBbVsgmK3uV4Wzd350P9oaSRA7KOcXxnlb8tZ/p
 czPkE0uq/mnW7eMLzCbG0e9JpT4MG3e4DgcS3C0IfnYVied77TJfUBJGR++UHW7X
 49eKQ==
X-ME-Sender: <xms:bqixZ_HVyDlXWHd98HMm9ROG6QxD-0pBeYVmg2KU1wIY4kbyNPSXvw>
 <xme:bqixZ8W524pNvj4q9nX8Bqqt1EEM--iuf7gu1m8xBboQ7gKdzMjTW9frIcb45-5iL
 GXuTe2YTXzzrSQBfA>
X-ME-Received: <xmr:bqixZxJvcZeqb7AeFFm6GLMCDTWB0uraOEp8p3s15V_qTUEXj1kSDnssDHuRWshlYRSXqY3AGn9fN6Y7wk7jB-8GT164VrbZjO420QJDkfr5>
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
X-ME-Proxy: <xmx:bqixZ9HikaoziMHdoVb4USAg8DA_TqppYJnWuSCtLYXz2yfr2x1KzQ>
 <xmx:bqixZ1Ud1UQGidOz_q4wy2lVZz7GbFMbqK9mCuWyYV8BI4eBOoStZA>
 <xmx:bqixZ4N3Wgh8gryMTmGw1MQr7s6kGrV3x7LB80jHuIHtLSsQoCxEzA>
 <xmx:bqixZ00mRg_B8yv9IpeaSVDNPuLUbckBYPnS-6I3xuB8OtaQKLjqjQ>
 <xmx:bqixZzlCZ3xu5Eh66NUvCjj9l2NStyivtvg-yt7hsZYr-MjVM-N13i0K>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:57:11 -0500 (EST)
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
Subject: [PATCH v6 13/27] drm: sun4i: support YUV formats in VI scaler
Date: Sun, 16 Feb 2025 21:50:44 +1300
Message-ID: <20250216085432.6373-15-ryan@testtoast.com>
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

Now that YUV formats are available, enable support in the VI scaler.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Changelog v4..v5:
- Add commit description
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 85 +++++++++++++++++--------
 1 file changed, 58 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 7ba75011adf9f..2e49a6e5f1f1c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -843,6 +843,11 @@ static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 		       DE2_VI_SCALER_UNIT_SIZE * channel;
 }
 
+static bool sun8i_vi_scaler_is_vi_plane(struct sun8i_mixer *mixer, int channel)
+{
+	return true;
+}
+
 static int sun8i_vi_scaler_coef_index(unsigned int step)
 {
 	unsigned int scale, int_part, float_part;
@@ -867,44 +872,65 @@ static int sun8i_vi_scaler_coef_index(unsigned int step)
 	}
 }
 
-static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
-				      u32 hstep, u32 vstep,
-				      const struct drm_format_info *format)
+static void sun8i_vi_scaler_set_coeff_vi(struct regmap *map, u32 base,
+					 u32 hstep, u32 vstep,
+					 const struct drm_format_info *format)
 {
 	const u32 *ch_left, *ch_right, *cy;
-	int offset, i;
+	int offset;
 
-	if (format->hsub == 1 && format->vsub == 1) {
-		ch_left = lan3coefftab32_left;
-		ch_right = lan3coefftab32_right;
-		cy = lan2coefftab32;
-	} else {
+	if (format->is_yuv) {
 		ch_left = bicubic8coefftab32_left;
 		ch_right = bicubic8coefftab32_right;
 		cy = bicubic4coefftab32;
+	} else {
+		ch_left = lan3coefftab32_left;
+		ch_right = lan3coefftab32_right;
+		cy = lan2coefftab32;
 	}
 
 	offset = sun8i_vi_scaler_coef_index(hstep) *
 			SUN8I_VI_SCALER_COEFF_COUNT;
-	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
-		regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF0(base, i),
-			     lan3coefftab32_left[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, i),
-			     lan3coefftab32_right[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, i),
-			     ch_left[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, i),
-			     ch_right[offset + i]);
-	}
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YHCOEFF0(base, 0),
+			  &lan3coefftab32_left[offset],
+			  SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, 0),
+			  &lan3coefftab32_right[offset],
+			  SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, 0),
+			  &ch_left[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, 0),
+			  &ch_right[offset], SUN8I_VI_SCALER_COEFF_COUNT);
 
 	offset = sun8i_vi_scaler_coef_index(hstep) *
 			SUN8I_VI_SCALER_COEFF_COUNT;
-	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
-		regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
-			     lan2coefftab32[offset + i]);
-		regmap_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, i),
-			     cy[offset + i]);
-	}
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, 0),
+			  &lan2coefftab32[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, 0),
+			  &cy[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+}
+
+static void sun8i_vi_scaler_set_coeff_ui(struct regmap *map, u32 base,
+					 u32 hstep, u32 vstep,
+					 const struct drm_format_info *format)
+{
+	const u32 *table;
+	int offset;
+
+	offset = sun8i_vi_scaler_coef_index(hstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YHCOEFF0(base, 0),
+			  &lan2coefftab32[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+	offset = sun8i_vi_scaler_coef_index(vstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, 0),
+			  &lan2coefftab32[offset], SUN8I_VI_SCALER_COEFF_COUNT);
+
+	table = format->is_yuv ? bicubic4coefftab32 : lan2coefftab32;
+	offset = sun8i_vi_scaler_coef_index(hstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	regmap_bulk_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, 0),
+			  &table[offset], SUN8I_VI_SCALER_COEFF_COUNT);
 }
 
 void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
@@ -994,6 +1020,11 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 		     SUN8I_SCALER_VSU_CHPHASE(base), chphase);
 	regmap_write(mixer->engine.regs,
 		     SUN8I_SCALER_VSU_CVPHASE(base), cvphase);
-	sun8i_vi_scaler_set_coeff(mixer->engine.regs, base,
-				  hscale, vscale, format);
+
+	if (sun8i_vi_scaler_is_vi_plane(mixer, layer))
+		sun8i_vi_scaler_set_coeff_vi(mixer->engine.regs, base,
+					     hscale, vscale, format);
+	else
+		sun8i_vi_scaler_set_coeff_ui(mixer->engine.regs, base,
+					     hscale, vscale, format);
 }
-- 
2.48.1

