Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762CFAB9A8D
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D392F10EA4D;
	Fri, 16 May 2025 10:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="V8cO4/4j";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="NYjJvXj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C11910EA4D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:52:43 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E0110254009B;
 Fri, 16 May 2025 06:52:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 16 May 2025 06:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1747392761; x=
 1747479161; bh=SPH/wuuGSMdDk2e/1NsetZyGIDEN5dTgWZ7weWTf6ag=; b=V
 8cO4/4jd1Oo2Gyyy4YdH3j4kYVAXb5UvJKM6HcuI8GXNgiyTrUSn+c2xvvFHm4UE
 pEClPzdI8o9T6Bk46WMb3XljNsYRmEXRVJwX5nuTA3yfCKTLx1jAsMsOTOxPSxCD
 HLD7A028rx/q0p3yzQYGrOB6dZHhqErUbTZ95/cUyUMYh4gTKBRQNdyBtd7LMNG3
 cbUC9aoGW1D6NgBVGN9aui+EGUTu2Rfc2EzDIpmyEvC2PcB9fRcIw/vb1g2IDg2W
 1imbUbyFmkLgMHDq2jH4fguTbM+COMuu06yHQdw0RWlhDXZEB5D9FHEkm4WDs1YC
 lysUraTdFALc1vMyVi1rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1747392761; x=1747479161; bh=S
 PH/wuuGSMdDk2e/1NsetZyGIDEN5dTgWZ7weWTf6ag=; b=NYjJvXj7K1BE/DYBb
 u6BLWi/bE64JsV6kiHSMX56MACqtZG04d4YXfb3GCgsPngMBHoGoCyI+bsxNu5L3
 kARfCDrgq6/hcAZEGOpX20tPKcSVioQmcVFMuux2oagpE24WHJI0BeJpgUpOiDCk
 qG+tNz6i+fjc5sTXJizQheZlykBSH/Q1typXKzI6Z1vTBurm8zB7iw5SkMV7DWqw
 G49qWaHkiAKTLNgCsU6ZlypRlfDPqyALE9Qw2OhGxOBndAvCHCwPza6k5FFiZ+i/
 /5rX8A4IWnfgoXlFun8wm1vBGGl6LPBf7aXpAN9Jtyv5S2yvNuzVJp3IwQ4DUMeO
 wzG5Q==
X-ME-Sender: <xms:-RgnaHz_HMZZYk6M6myIyrPfgni-vaSMk4R1ZjpXDkpWBI3IDf4Hyw>
 <xme:-RgnaPRLKL5qcgsM2RTrxp9F94ufCAgzLAr9fqB13Zmoo9MsIvNPsg7USx3vR_XkG
 RtE-qFR_GIzwpFl4A>
X-ME-Received: <xmr:-RgnaBXntb_rnGp0IU4zTXor5pk9OU7AOGdS7ZvMrtWlCOX1RXLUBpeyef0kEU60NVsHq80rE6IaEONn7QW4S4UtYMACn2lIMoHjrGy78D9a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvheehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:-RgnaBiuT5D7c82SZbe9Hv1PVZ_ub9B3K4UbC2n5Ga-eIprm41RjVg>
 <xmx:-RgnaJB0upJvoVTtfHZFgU_muHgb8llwE8QvOGha_bYMnrKffH1rZA>
 <xmx:-RgnaKKdw9OzykW46A2UIAES9fUP1N69mafKzHAL8O7a2chNeASk2w>
 <xmx:-RgnaIA73yl5Ih0axGp3IsaV6tN1PEIttC_7le2z5rH0ChslkCmi5Q>
 <xmx:-RgnaGqs6-aWhtdXRoxRf59iPMtTSnJRKPIaX-Rkr8viAnS_2rVyDjd_>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 06:52:35 -0400 (EDT)
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
Subject: [PATCH v11 8/8] drm: sun4i: de33: mixer: add mixer configuration for
 the H616
Date: Fri, 16 May 2025 22:44:25 +1200
Message-ID: <20250516105101.11650-9-ryan@testtoast.com>
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

The H616 (and related SoC packages sharing the same die) carry the new
DE33 display engine.

Add the mixer configuration and a compatible string for the H616 to the
mixer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Maxime Ripard <mripard@kernel.org>

--
Changelog v7..v8:
- Separate DE33 support and H616 enablement in the mixer.

Changelog v10..v11:
- Convert de_type enum to uppercase
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 13e712382010..31a8409b98f4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -799,6 +799,17 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= SUN8I_MIXER_DE33,
+	.mod_rate	= 600000000,
+	.scaler_mask	= 0xf,
+	.scanline_yuv	= 4096,
+	.ui_num		= 3,
+	.vi_num		= 1,
+	.map		= {0, 6, 7, 8},
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-0",
@@ -844,6 +855,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-de3-mixer-0",
 		.data = &sun50i_h6_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-mixer-0",
+		.data = &sun50i_h616_mixer0_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
-- 
2.49.0

