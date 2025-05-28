Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0133AC65D2
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266A410E5C8;
	Wed, 28 May 2025 09:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="KA7wtjNb";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Th8PIpkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA88E10E5D0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:25:25 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id 6D9011140181;
 Wed, 28 May 2025 05:25:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Wed, 28 May 2025 05:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1748424324; x=
 1748510724; bh=zEUpIG2TzgpcOyqfojuCbarLrMaxkRzVmGHH2WlKz20=; b=K
 A7wtjNbGt2fpB2AqGZN357lVU5m8U8D68RNrocol23/uhXCukDxSl/JR6gDPyfh4
 kE7O4tgCkG08VByHTIf6wUJCM7r65zXLJTLYXDxOyXP2nSwMZw427B4ZuDhPExoa
 T+4JjirXWELt1OG6+tBjTRvmwnV9BLNFpBKR8PfT8wa6mLwQ+29aVLaZQ+IoZKHi
 gZa3KmVLz3BCsoo+9tyDve8n8ASlTd/Ll5HxlCh53KjY4IZ6B9DH3oD1Vehr6FSa
 FmT9uKCw0JL/ajkwWhtY7KPQjBCExdQwjC6v+kAJ3iqAVHtzYu2W0bXHtWEr70vq
 zBalVNC964dE0NNMcTyhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1748424324; x=1748510724; bh=z
 EUpIG2TzgpcOyqfojuCbarLrMaxkRzVmGHH2WlKz20=; b=Th8PIpkpA/nKgI3CT
 puM+o51wSOPkr7kfWJFtsPx1ZPuqasFzEbU7bn/dg7lnn740NlD18BK61fqfKuSF
 DAv42p94MZZ2RXLdXxyY867VjMQSS5mmz5rMizRPo6VoWO+YWYyAzhdApmy0nW3q
 pEoop+56MuInMb5z4rltzvc9ck9x50LiNOjMl93EEVbclMOMKliY7FyJM+HyclXV
 AOdZTb89Hkb6Q9WxeDuh9RkkkWY0RmoZgHV8ejOY2zBybcJhhsesqxrYld+eXdoy
 SM0X+vrYSL9hz+W3Z95W0m/5wyU30gai73+lrOMIqDB70vcNmbBX7ABJYB9bOYpv
 DiIKg==
X-ME-Sender: <xms:hNY2aO4f-piaEKYPZTtXRit0McU95jdtdFVYY-4d45NzeDjx5JcijQ>
 <xme:hNY2aH6Ijfb7n4niAeq78yAM2aiegYpS4KH7z7stMANJWGZnKW0kUe4AxzNukrpC3
 5sA2O08Bc74ihV5YA>
X-ME-Received: <xmr:hNY2aNepbDJy1hWDwB4tXiL-2Q2O5fv4md5Pu2t7RuiaX6W3S5zea81GgfUECAgJCnhOzrzrGi6nbqoLNPYYh6qKmBAdzaQyuVvG_y6hluGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdekleculddtuddrgeefvddrtd
 dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
 fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
 dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
 jghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhi
 grnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvghrnhepffehieffgedt
 gfffjeetveegfeekleeileekveeuteffteetudffveegieeiheetnecuvehluhhsthgvrh
 fuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
 shhtrdgtohhmpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtg
 hpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhs
 segtshhivgdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtse
 hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhes
 shhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtg
 hpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdr
 shhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhoh
 hllhgrnhgurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hNY2aLLm8mHxIaDPUw1xZXvWOagIrT5VgB18xrBRJYSz-0dfyxSiPA>
 <xmx:hNY2aCLqCzRAiR8KWGSSmofdtDPRUEEbvohz7JAdCa9ckf6xlYb6_w>
 <xmx:hNY2aMzYq7HJvnjF8UpUP4BmeBKCqN2AvEQsNj4I9oiAolmtGg7Cww>
 <xmx:hNY2aGIooEEonFlMLZVASSWkKW3_lRQfQuJ29QMqVEMpaNYtT79b-w>
 <xmx:hNY2aEzI1Zrn_rspazwDSD-WLH8_ydUq1-xz82GovN6HlDoCxHMnHC0R>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:25:17 -0400 (EDT)
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
Subject: [PATCH v12 3/8] drm: sun4i: de2/de3: add generic blender register
 reference function
Date: Wed, 28 May 2025 21:22:08 +1200
Message-ID: <20250528092431.28825-4-ryan@testtoast.com>
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

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group.

Prepare for this by adding a function to look the blender reference up,
with a subsequent patch to add a conditional based on the DE type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
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

