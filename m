Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E080A58F90
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A4F10E3D4;
	Mon, 10 Mar 2025 09:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="kxyabCu0";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="m3l+9H4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED2510E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:25:30 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 27804114011F;
 Mon, 10 Mar 2025 05:25:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 10 Mar 2025 05:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1741598730; x=
 1741685130; bh=pQyWylFAyJnMLkqiKKSxQk8VM67tzXzIRvPkj3Li65k=; b=k
 xyabCu0FH+tpmKT5FbxWp1SVxkWf5jFtHIRAiLJEeJtks6sRsS8v/GsrzYAk7Ol4
 +dv0gXeQ/36ZzgaOI9baiGW/jcb3QxEx2b4jyOiHTqkztSNzLUlgHTSAqdhqFRlP
 uSccfHBFvmwvcRRKQ8e4zhVrMLkOUdRdQAQdzUTgA1BR/VmBWhusqKukKcsQ44TF
 QwPvJo1LYAH5I0/y0hpGVKUMxaEEuAwrZA/d4bYSo5rXU5vWVbo3N63dbtjydLwN
 qF9cefmHalT1cQ/fV8y8HY5uRnKkLz3xKA3lxbHJXqmTrXwbiMJGRJgpftPYiCKN
 9EcoZ6g1CWR5gBMJBzw8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1741598730; x=1741685130; bh=p
 QyWylFAyJnMLkqiKKSxQk8VM67tzXzIRvPkj3Li65k=; b=m3l+9H4HDOzcYApdz
 1U4ALKcqQg3TcahdWFBvxn73eqkZxZ2QF4WhU35NhZUJPuqFHs6RYZpSeefrmcNs
 01sEA+ILI5uM0Yrpfeh/lK8+QOPqtmSkXMF/2601wYNb6ILDZje+RR8hoeiHQwjF
 KVmeHB6KPedOsCAKL59akfVclOPQfOoWWMIBc1D0iH3elbf3w14Sy031DTV3e9Yz
 UgQ57RTV5LxdyUp01DPWcESiOO3KF4Swwn5vs76V4BumG4BcMW0vMiIVyyrznqQO
 L4X7hjQB0EjRcLyQOJCd/oODVSBldS7xGBfUYlaT+gqS7xQ4T1SZfUa6DxED3rrb
 PXr+g==
X-ME-Sender: <xms:CbDOZyHSPnFjnKtAa3B7TlIEuC7DjqIetGT-3IJfK1PJ-nuU5_g9Rg>
 <xme:CbDOZzU660R9SB4Ctu_Ypm47fuA_2NHxZNr0raQO0RGd7eWnRwEvDYPOa5bAl1FmQ
 9RdYo9yBtk5mj3cjg>
X-ME-Received: <xmr:CbDOZ8K-r0RLjGGcK-y5uF42S1eXuSA839Lp29QqERBQephBvM1U4YNV9rP_MANg0zYKRqsmmPdMzDTR5NwjsPpshGaSmySIcJ3k9fUylP_0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
 htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
 keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
 tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
 gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
 tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
 drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
 thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
 esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
 gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:CbDOZ8Hw8X-6wMvozKlgNsFJUeZvvHg3uL0HJId7qNmgX05C71kjZQ>
 <xmx:CbDOZ4WsgGTunXqN7PtPOG1V3pknYOw4KtZxA-c2x2Du770mMgUq2g>
 <xmx:CbDOZ_OOS0cqihFHMUgAcqK8OIlcSPOKB3zWtwUUj57X5_JY_Zg3qQ>
 <xmx:CbDOZ_3AOzIe08lYuy7kuASxhGwbVV5f5BWIMV1uwTAOyJhUg5dxWA>
 <xmx:CrDOZ-kp90zEwP8XxCXCbO1M8XzFgTj4SrIV5SCysGZ2L5ZQxYhYHIr7>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:25:22 -0400 (EDT)
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
Subject: [PATCH v8 11/11] drm: sun4i: de33: mixer: add mixer configuration for
 the H616
Date: Mon, 10 Mar 2025 22:09:57 +1300
Message-ID: <20250310092345.31708-12-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
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

--
Changelog v7..v8:
- Separate DE33 support and H616 enablement in the mixer.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 0bfd4b28b283..c9211a173a13 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -799,6 +799,17 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de33,
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
2.48.1

