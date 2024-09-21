Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE40F97DCC1
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 11:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D07B10E316;
	Sat, 21 Sep 2024 09:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Xp9UVTua";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="JFc9gXJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B191710E316
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 09:55:01 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 218361140254;
 Sat, 21 Sep 2024 05:55:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Sat, 21 Sep 2024 05:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1726912501; x=
 1726998901; bh=t/hGwFMygrSXn+HOCQW8wOfax07KyzMGRR0fPCScM44=; b=X
 p9UVTuaTTv1Fz579RR+OR7JFIRoSpqDoqQZIHaylbrrFiwbzf2/hLYqE2Dr65wSu
 eX0MFUykyiDPBnQ355A77kKU+pWt9B274wLdNXwGCOIWIfu4eI8lYA0SdVGUitvw
 Rk+HTHhNqiW5hsoara4TVoT/xHMA3Ferq09F1XMxqrgA8AUyV7OcjsXyFK+aVrz0
 LvLMku1YpITXTRVrLFKebRJ5wxKRPzvKvkAP9itWoQAnYHR6T0VazIBKUp2PlNsc
 DgvvnnVNPuixxA4f323tIqfsPNMowQi3NxLiXbuFwEEtaWoMhJuV3tWPHC8RaaPM
 mTvfsyNqR3zQ3pINaYH9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912501; x=
 1726998901; bh=t/hGwFMygrSXn+HOCQW8wOfax07KyzMGRR0fPCScM44=; b=J
 Fc9gXJ8fWtUbLG1N+lYdsyhOr7MjuQUmqgMLNGR8pNTjz7wMwgYwsDgaqJmq63AY
 jdPnbkG9oKQAGaENwVwlJEVMENjU4HYNNCVt2IfRAkN+Gnlxaim5WArWzUAc/2yF
 vrtioqJhSuvN99W706NTV11paJQj9nn/FbkghtN3i+PH+YZs7jhVo40kEyICUw7o
 pnH6D+N65CPYWYqNs6KYJaE/yAVLQUxr3DpuVn5vAckRW+aKJYQUGdbT4uSPM04S
 ayzdeSAp6cOonFJEWraa7UYLQsb07qBumFM5qTyOFF5yoG1VyM7k1Hu+1dDP1qDg
 3+2zMSEtyaKEzBqTPmhSg==
X-ME-Sender: <xms:9JfuZtBxpa5MOOXevpcmxWpWrCb_fYeptn9uD7OZ9nZxuFPzZSKPSQ>
 <xme:9JfuZrhxaJRykaVy9KE3AWVRWSSFX5K3HXQgNJN8FgUAwuGrx_AFOIfsVGMGmCT2i
 fWFv55oG53BygqsOw>
X-ME-Received: <xmr:9JfuZokTpGNwr3MEZFw_3CZYlqIG4fX7reijM2I9417citL6KtuHBWy_luo5qxY-1UBF4qPIFQKN9Nx-ClEaJgf6RaP3he5zHqCnRQnPfDNnbcD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9ZfuZnzTmOuyfQ8-um67sj7OZEGvAmt3IQ0V6qHdy3PkfOtnRWmxPg>
 <xmx:9ZfuZiQ4p1iwrixh_VZEQ8si3cdEggw51jiG9HhtANCEKMmYYNWb1w>
 <xmx:9ZfuZqbbuXV582X6h97YWYvPAz3aeZc-vWoLvgHweAlG96csqzvqhQ>
 <xmx:9ZfuZjQ7H_-3-hNXLAkB2ravF5ERdDkGV9WN514bvTqW9K2atU0pWw>
 <xmx:9ZfuZhC0x_fCD_7E-cc0IQwdPfsiDURsW_lgNTHCCLQHSM3hLYPrkYEm>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:54:55 -0400 (EDT)
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
Subject: [PATCH v4 25/26] drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33)
 support
Date: Sat, 21 Sep 2024 21:46:14 +1200
Message-ID: <20240921095153.213568-26-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921095153.213568-1-ryan@testtoast.com>
References: <20240921095153.213568-1-ryan@testtoast.com>
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

Like the DE3, the DE33 has a FMT (formatter) module, which
provides YUV444 to YUV422/YUV420 conversion, format re-mapping and color
depth conversion, although the DE33 module appears significantly more
capable, including up to 4K video support.

Add support for the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun50i_fmt.c | 21 +++++++++++++++++++--
 drivers/gpu/drm/sun4i/sun50i_fmt.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
index 050a8716ae862..39682d4e6d208 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.c
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -51,6 +51,19 @@ static void sun50i_fmt_de3_limits(u32 *limits, u32 colorspace, bool bit10)
 	}
 }
 
+static void sun50i_fmt_de33_limits(u32 *limits, u32 colorspace)
+{
+	if (colorspace == SUN50I_FMT_CS_YUV444RGB) {
+		limits[0] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[1] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[2] = SUN50I_FMT_LIMIT(0, 4095);
+	} else {
+		limits[0] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[1] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[2] = SUN50I_FMT_LIMIT(256, 3840);
+	}
+}
+
 void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
 		      u16 height, u32 format)
 {
@@ -60,10 +73,14 @@ void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
 
 	colorspace = sun50i_fmt_get_colorspace(format);
 	bit10 = sun50i_fmt_is_10bit(format);
-	base = SUN50I_FMT_DE3;
+	base = mixer->cfg->de_type == sun8i_mixer_de3 ?
+		SUN50I_FMT_DE3 : SUN50I_FMT_DE33;
 	regs = sun8i_blender_regmap(mixer);
 
-	sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
+		sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	else
+		sun50i_fmt_de33_limits(limit, colorspace);
 
 	regmap_write(regs, SUN50I_FMT_CTRL(base), 0);
 
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
index 4127f7206aade..3e60d5c788b39 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.h
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -9,6 +9,7 @@
 #include "sun8i_mixer.h"
 
 #define SUN50I_FMT_DE3 0xa8000
+#define SUN50I_FMT_DE33 0x5000
 
 #define SUN50I_FMT_CTRL(base)   ((base) + 0x00)
 #define SUN50I_FMT_SIZE(base)   ((base) + 0x04)
-- 
2.46.1

