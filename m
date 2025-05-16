Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F8AB9A8A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193F410EA50;
	Fri, 16 May 2025 10:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="sLElz0wx";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="DBW2Oduo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D46310EA4D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:52:35 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 6E0F1254004F;
 Fri, 16 May 2025 06:52:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Fri, 16 May 2025 06:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1747392754; x=
 1747479154; bh=CEtcfQ6ACm2tRcIuRVXTdOHp/WBKUspiCkAehaBP6+Q=; b=s
 LElz0wxLdlaHHy3mNTaB8DJAxVU9ex/H6qShejoa+iwiBQbYAzrfDqzUm4+4ncLr
 y6zwcJ7Y1CERyaQfa45v7Otxegj14C/NhzuZ7qJ+FvAjwwRl2amL4P/FUh4ntng5
 w58pKkHDnDhzVlnlVdPoJ7Bm8tY+P7N4ZnvbBGsPzZwuFSOleeaypAM9f1jmFqht
 oSZ+Wiujn21t0+TtOvT6WmQDKcrIpLJSFttX5zCVBxMxRdfpArm8eewPFXNM+6hI
 CznoBEjVvtOdz0djJJZ0wpqKZ2DK7y0p1ZEBhJf9onIIIoLJ4NhLe5AFBecPrVCM
 3g/D048VEdIoK7CT7QyPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1747392754; x=1747479154; bh=C
 EtcfQ6ACm2tRcIuRVXTdOHp/WBKUspiCkAehaBP6+Q=; b=DBW2OduoRLNnglzXM
 fiMXZPSmWDm8UyqXC3BKdts2GiENn+3lyNS/te/AvC1/f6Q1q077KyQD6M3ISsKk
 Q/6lMiSoqPW7lhrY0RINnYAx+9YsGbU8x526Rv92mwfczHv81rnmaJgBBfjMTx+x
 W/SBn9UHDG0W6IpTK4wOel63ps8aIbPqSnWTPnlxJ8IW4F/FsP1UtguMRawb7KaX
 TqfXl4tHtXkNkqwQDBJl+OhZqeDbqSmpVjJ67x5DsGRnvVF9/FhfR/xb1AT11VxN
 GIyb+DZIpIHUiF5HslhF0xvtAY/5EpnUiMTvZXR2L7Fksyw5p2hx6TF3JnQHDtZr
 f7I5A==
X-ME-Sender: <xms:8hgnaEz-S4-S7rBt9taqNBcKZkd-nhzKZjIr5JEnDBspRPfBTHkgyg>
 <xme:8hgnaISq2ef8Vq2_DoesR_esKZRn5TBbWXzQQuRWLg3sRUGEFWcsDmFtT5o24cqPy
 govwP__wvqTO2iLQw>
X-ME-Received: <xmr:8hgnaGWK8OdE-lPPvNXTeHy0Qpzm7ie5P3AqMz03A3QFWMklMj3xEDGMTHwHawi8MXiX3KCqZ7ZV9bGSB9l0QX4-g4onlmxeo5z1UXejpXdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvheeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
 htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
 keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrh
 grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
 tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
 gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
 tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
 drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
 thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
 esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
 gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:8hgnaCgXwU3FeUKRte36WrQprsojc2zSdJsFaCw_Qg89lELLAiRXpQ>
 <xmx:8hgnaGCQKNs_kCoJDxhGVbk68d5KGQ0BxJf3I7dT1ShpgbPoniqA-w>
 <xmx:8hgnaDJVYpt_h6rbtXQxovLVsWOLnZNfFP-lU3cgCbqdhqLH9OJvFQ>
 <xmx:8hgnaNDDHtroBswPy7hpeezK0PCwGLw4PazPrIpT2H0AfHcUMUZlLQ>
 <xmx:8hgnaLoMaCA7wyL2x72GswB86XudcDgMs2hB4gUmY2dN257IxHFnxSsv>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 06:52:27 -0400 (EDT)
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
Subject: [PATCH v11 7/8] drm: sun4i: de33: vi_scaler: add Display Engine 3.3
 (DE33) support
Date: Fri, 16 May 2025 22:44:24 +1200
Message-ID: <20250516105101.11650-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516105101.11650-1-ryan@testtoast.com>
References: <20250516105101.11650-1-ryan@testtoast.com>
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

The vi_scaler appears to be used in preference to the ui_scaler module
for hardware video scaling in the DE33.

Enable support for this scaler.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Maxime Ripard <mripard@kernel.org>

--
Changelog v10..v11:
- Convert de_type enum to uppercase
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 20 ++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 +++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7a21d32ff1e4..f97be0040aab 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -94,12 +94,24 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		sun8i_ui_scaler_setup(mixer, channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase);
-		sun8i_ui_scaler_enable(mixer, channel, true);
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase,
+					      state->fb->format);
+			sun8i_vi_scaler_enable(mixer, channel, true);
+		} else {
+			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase);
+			sun8i_ui_scaler_enable(mixer, channel, true);
+		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_ui_scaler_enable(mixer, channel, false);
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+			sun8i_vi_scaler_enable(mixer, channel, false);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index bd03607c8b7f..82df6244af88 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,9 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		return sun8i_channel_base(mixer, channel) + 0x3000;
+	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
-- 
2.49.0

