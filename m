Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4B49102AF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5AF10E931;
	Thu, 20 Jun 2024 11:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="0MyMjDbF";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="r23KsAA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3ED10E92C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:33:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id C577713800B7;
 Thu, 20 Jun 2024 07:32:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 20 Jun 2024 07:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1718883179; x=
 1718969579; bh=v7/QPBaef27qO3Fuk6Oz00U/sG9TRk9vVhD1a2tNWjU=; b=0
 MyMjDbFvbSUSYpoyh483rfGEA7gSBDCVtJgK/XOcP6XMYrg86yf5//zuPkmud7EO
 pBFHI3ND8PuEeI330GO+WUfyhzvw2SsydKusFC9dPtg0sJe8WwKeyNrCdKtb4Aj8
 WWl6FoKLi+8uQfdlX9rk7bqzUEAzU7Xr+Nqd6UM8bGLVEayhEFmZfTtAQtuj1aZP
 0ioJHaoZK2jT6otudNamMtaZsXktcieL2CPBRa42b9Xf1slOrd0/JrV6LJn0QPqt
 bL3T4IsWOJLpe8fgzbO5Yuz+mhIFgdkUrJG+LcyEBFLXzCKZgcsaqia7gwMJxw25
 FQ5XElk7/yhnHYahmyjyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883179; x=
 1718969579; bh=v7/QPBaef27qO3Fuk6Oz00U/sG9TRk9vVhD1a2tNWjU=; b=r
 23KsAA/WfBUfrdBA6mYRLm9pCmv/HAlj0lYb6zlcLVkveTtMo6Yx+F0e3somsQr0
 RP7iFASv3VsLY3CfM/9emJowCtb/gRmCUiSRIyMP60QAezbPqRHPGWaJDGX8zgH5
 Pcy5ccxsfkPQmfjEBiMxDSfUMcMWLDpaIibBRsNUJ2A4RTSuIeQa2+8hYvjmj6IS
 QdklS6AXPbSJBEWEkW7NAqIdqWy5c2zwL1iTT36EWBkUf+lNZO8dgNjvrA8qOaYH
 egmnE7DrPD5xSHAbB1cO44WzUC+Sfn5hH1cQ5xa3P4nFCSAc3NCtCqJKCCgfljI2
 ERD22em0UR0vUof8D6n7A==
X-ME-Sender: <xms:axN0ZodN8AA79bBvaYs6MNOvX_g_NpYfQhShhyw1BQL_XtfxROCZug>
 <xme:axN0ZqNoYh5iHc58YH95UpnYEQPi-GEDjibfyJYbWwDtqwEAaOajWLmGOJKAQC1Im
 K2oJvfoZ-NENqk2zw>
X-ME-Received: <xmr:axN0ZphXjSHPLAfNePw-mTa_iYnydjWCn2z5kYbKxNuh2DeaQDz5dhEp3LsDnTAT0R22R4y1kyoooglK5vRFtioPWW9EODneVj8iV-K3bVpfnPBL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:axN0Zt9H5BqNdupl_dZ9_z3KV2bF2S5pLv4Cm9n2sBGICfxO9ZPkNA>
 <xmx:axN0Zku4nGsp05iH72ccFh9FyQ7QK3MDfc8cDDTnj-3WZ2LP7Tvksg>
 <xmx:axN0ZkF2WA-wg0uChhmiv5wKGloFUSqoUDLPlSSwrUBifO3bLtZfAg>
 <xmx:axN0ZjNRctdi9tI8SojPNN7Zp1NFPCziQ0htRGGHo2bqyFTeeHK_Og>
 <xmx:axN0Zke3FRduIaTx7o9V4jwA-_aZSW9zeKA29aoQR-vsy1815U7YBXAj>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:32:54 -0400 (EDT)
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
Subject: [PATCH 09/23] drm: sun4i: de3: pass engine reference to ccsc setup
 function
Date: Thu, 20 Jun 2024 23:29:47 +1200
Message-ID: <20240620113150.83466-10-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
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

