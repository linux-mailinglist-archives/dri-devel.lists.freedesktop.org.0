Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0BAB9A7F
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BCB10EA4A;
	Fri, 16 May 2025 10:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="GCBPCmo7";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="rS+fInvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D208710EA47
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:52:04 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B54EB25400CA;
 Fri, 16 May 2025 06:52:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Fri, 16 May 2025 06:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1747392723; x=
 1747479123; bh=XVjXcxxMsdmEbJ+VsOzVro/u94OYEqvrEHHHDKDTkw8=; b=G
 CBPCmo7VklvWGJCQBgTxwB/e6qtKSXXHu514YgWNvmj7XCTF5ZL5MFRcdlvgP8y9
 6D4z1tl4NtS9l/OTOJrwd+g0pTH+GG+ZBAA9nJD7wfSKka1x0ghNdKoaX71bykN2
 mgkMNI5afW3K9W2ZmWziocuFJoN+3O5vYh6F3z8dH/WBFv2jjhjCWaUd6ZlxP0FX
 mO3Wg8xCl5nrQowaUUYJ3He6Z6Rx4dl97Eqhsurrn1aJiKrRbjY2+gomysKXFmke
 eON9luXErmOUJtTRKJaqrKWG5vx1jD7rk2fLrwSKbqcP3Svk1CAWBE8/hhtA37oR
 Q4NObS/OdZX9W60EQm2Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1747392723; x=1747479123; bh=X
 VjXcxxMsdmEbJ+VsOzVro/u94OYEqvrEHHHDKDTkw8=; b=rS+fInvp2K+hBp/Ya
 TsBjO3hwUtWiluTgVmCupFgdqM5fmJ4vPvquiV2rfBMnoGq51gXruYjZVgBMvvor
 +jD0i1CA0OR+N8IB5uUHJSp2xdBZHZqmnRKa492MgzPtTjV9Rl93nwszpZeYD8Ao
 az69qUiXGjyym3C94keYL/q6V3a87BqvmaIiM1UzPpCCg2YXIcduvp58A3Z7ZdqH
 8Ykh0ASU8BoP4pntFS6eZJmSQzioe3vohdoC0feT+JGk/DgsMupMZGOsWkaXmOz2
 c5hZiyEZPHXbp2EIyB2wr6ukiAR8uwBjXaVKvMrmO6FER5+zIh2SermubPGky1jT
 Ai1Nw==
X-ME-Sender: <xms:0xgnaPo0Dt7hokraqSkbxz5cQnlDzFmmN19Gzxa0saZvNgY6imxngQ>
 <xme:0xgnaJpGEzo5UAokSQRzlT6wgBWX2LVK7-wfPuWUIvbUQfaCXIQA4CturC414I8T5
 2nTXU_GVCKa8uw6tA>
X-ME-Received: <xmr:0xgnaMPD-6SuBc72ndI8BWIGXP0GfmEwqWEOjQnwPbqTEkAman-_zZak3MaEH6l6YJZqV4ryvgAB5pNPxnOQ_xvngz7qUO82HeAGt4g0SCos>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvheehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:0xgnaC74ukcGm0zpnDnbfsB7XSRkg9i-cVbDZWR9zIqqiWLAg6XK4w>
 <xmx:0xgnaO7DQHA6Z-b1v86OL0Hw2VXOAyREv4AqRSwtOcGK34kcusZlWg>
 <xmx:0xgnaKjc6X-EEHWzTQVj4BFE3hZ-_jHBSOCCr-5GVdmYrKGigdwm6w>
 <xmx:0xgnaA51TyB55tZ8Q27kyJzFJeMM83z_7_ph5tmDZMemkBXdTFPT7A>
 <xmx:0xgnaCTTfbNlCg18X-Is3OIa4zKkTJdkmv6kkeTzhYSzLlzREF5L4Bst>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 06:51:57 -0400 (EDT)
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
Subject: [PATCH v11 3/8] drm: sun4i: de2/de3: add generic blender register
 reference function
Date: Fri, 16 May 2025 22:44:20 +1200
Message-ID: <20250516105101.11650-4-ryan@testtoast.com>
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

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group.

Prepare for this by adding a function to look the blender reference up,
with a subsequent patch to add a conditional based on the DE type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d34e7fb3143a..b75008d05fc9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -222,6 +222,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == SUN8I_MIXER_DE3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->engine.regs;
+}
+
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-- 
2.49.0

