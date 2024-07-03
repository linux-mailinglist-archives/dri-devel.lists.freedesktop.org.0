Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5A925A4B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6B310E7A2;
	Wed,  3 Jul 2024 10:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="F2E/TmD1";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="fr3SV5WR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD8610E7A2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:56:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 072C0114031E;
 Wed,  3 Jul 2024 06:56:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 03 Jul 2024 06:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004171; x=
 1720090571; bh=v7/QPBaef27qO3Fuk6Oz00U/sG9TRk9vVhD1a2tNWjU=; b=F
 2E/TmD1+6cFmVXp+mCY7mAijvlpFgHIsu+1TK8T4wW//rPD3X7SZ76fROgvMP4gP
 fQLwBqn91BWfl3p8jB7IMA7AmCqPd+dh9nlfeoGrGUdYS/W2J/VU/rQZwHpLj+7/
 cWB7LEDhHn+MezIt04JWhsVWG8f8k9m35Lmnjn87Jc3s9EwhroGsquQjeoBmQxpV
 PplxsnU/1QFbolgesP+NWG5BE3tolziU6ng6QVgq7ieXWsols4HsrmRDPq9ZAfZo
 muY1MbmeyOlN1k72CAjCPaa/0mszpxnQXowaxqN2e47Ilvtowsb2dHanQXPg6cnW
 4x0z3GdwBMsNCCN+2qT0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004171; x=
 1720090571; bh=v7/QPBaef27qO3Fuk6Oz00U/sG9TRk9vVhD1a2tNWjU=; b=f
 r3SV5WRrGkfjCdkXZCyRmjiGVcSOCUvKG9c0mVrqfdW555ObIv9Go/aG7kQglpd/
 ZPKHtvLkk/fSoU8zEri+kHtuCCEM6iLZUZKyznxou8gL2kI0Nc0rED2lkc7OHPSg
 D7XcLlJj8gxdEWq9rImz1kZEiUV4YGYfIxmIXocpxnYAHtYLfD05TAy2lGUmPzzQ
 K5erJlgaM81gf47prkMfrkAQE1uxlaisHF1n8laInDk5yxJN9xUIiXJZH+RZO2oB
 Vh/DLUoNc/bQnoeaQS0fMwxxC8dv19ThgNsCa3Gq78BS8Hj65WeWGuq/yvyxkC1M
 86RMlshtMawZD2vipsZrg==
X-ME-Sender: <xms:Si6FZoKscWy5pI0lXs-GGqqIVMtx6L-UH7HXsfXQCcp745gicgyGUg>
 <xme:Si6FZoJbMVkocl6ehJ-unO6dfczCbSEjDMgMOSGif6lfH1105lp4f6pptlw1EeFNy
 W11oW8fpBmSTmk0CA>
X-ME-Received: <xmr:Si6FZosac2FiTLZG5hfCLs4rOIJRKbYwzmD3yFgUlN-ip6Zqtr8bq8S5tpw2-TUmz9sF6u6rV3uCsfhU-WXl6X3_ZZAd102PpWtNTUB1-nDwaxLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:Si6FZlab4i4itp7nl_02brOmq6Cty7EqO3OYCFroTqzxiwomLH2r6g>
 <xmx:Si6FZvYrl5HHcWKNbOesbE-iH3_m7IRoBKazZvsRg1pWt97IFLbnjQ>
 <xmx:Si6FZhBYiyr5hcJSgmd-pyhE4PblIZJzjNH7eNVYeZf0Pdf4ZkTQtQ>
 <xmx:Si6FZlZw0M_DCIZAJ0DgT1XTDcJTI6uRqmv4WVRS-p61ZeTyZ0Kw4A>
 <xmx:Sy6FZsIvEVs-rr8ZliRxD9XphjLY7M07nLJi3q-zs5EhBG4V47FHmDgo>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:56:05 -0400 (EDT)
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
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 09/23] drm: sun4i: de3: pass engine reference to ccsc setup
 function
Date: Wed,  3 Jul 2024 22:50:59 +1200
Message-ID: <20240703105454.41254-10-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
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

Configuration of the DE3 colorspace and dynamic range correction module
requires knowledge of the current video format and encoding.

Pass the display engine by reference to the csc setup function, rather
than the register map alone, to allow access to this information.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 68d955c63b05b..8a336ccb27d33 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -148,17 +148,19 @@ static void sun8i_csc_setup(struct regmap *map, u32 base,
 	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 				 enum format_type fmt_type,
 				 enum drm_color_encoding encoding,
 				 enum drm_color_range range)
 {
 	u32 addr, val, mask;
+	struct regmap *map;
 	const u32 *table;
 	int i;
 
 	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
+	map = engine->regs;
 
 	switch (fmt_type) {
 	case FORMAT_TYPE_RGB:
@@ -204,7 +206,7 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 	u32 base;
 
 	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+		sun8i_de3_ccsc_setup(&mixer->engine, layer,
 				     fmt_type, encoding, range);
 		return;
 	}
-- 
2.45.2

