Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F397DC88
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 11:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4B210E184;
	Sat, 21 Sep 2024 09:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="4GE8xID2";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="UiBUfRW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAEE10E184
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 09:53:02 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id B15621380307;
 Sat, 21 Sep 2024 05:53:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Sat, 21 Sep 2024 05:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1726912381; x=
 1726998781; bh=3QPNGe1zZiKhzuTyCeTHAjPsIfSM0kDD9Pg1n81Bevg=; b=4
 GE8xID2hdln35xOqEq/AcYHgYBvva3nO7OwEx1W1d5W5N2PM9wqbNoqlLRGTyW7P
 idVU69rtYECNZEu17svMM22jJX3iQyYC2ahRh9Tq1pBm0THQYJ6Rg6ZThmahWaG7
 EzzVuqs0rPmuRvSdL5n2yURJB5YqN/ICAMY3iUe2WaKDE2HYAcXnpwW3RtHaTXco
 Ai1erHpIlX+PWw6K6b+kwawePW4z/D783QOHwtoqylUu3xMeLI57aNTGm9Dyz3Ec
 T+ft3ePPMk+VSOBd1ViYuBmiQIus4mNwRGBmFOk7KTd5ruKXp66KF/tJb3HqZakA
 CKYWhNy9nj+YFrBaiATxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912381; x=
 1726998781; bh=3QPNGe1zZiKhzuTyCeTHAjPsIfSM0kDD9Pg1n81Bevg=; b=U
 iBUfRW50ZwClif6HF0PznhjQPqeHx04X46+i+Jr3dWK2MPumwD6o5t4yB8w+jTMZ
 v9ALelBkwvHXjeCJO8KR0FiHL9l0nqXs3VTfelsoc+nKzlihkoPeU4lhPZP15md4
 b7LHf53elkFejV8Z+otcjj1mnQSFM9JwlzfRNMIhXsRGCwMjkrbRZ2YYNkr58WNX
 2FsfVyjD6O9npAWAiWDAlcnyai45C/U+bUcEt1iZ8672pjBIV2P+H103IdIkLrjH
 hbMHS2Jiy34CgBI7EgZna0JwMz0ifxi5qb354D05ZTmtAwnWJEw7bZSCu7NbgTdT
 lwwlVzLGd381+64Q7xvsA==
X-ME-Sender: <xms:fZfuZhHczpwVHKfV5UvYKeq0uQJTgSTeKfCrVU4mCUeIcvmoP-acfw>
 <xme:fZfuZmUVbYO2jQ_XzTvxTLEqkdc2bzQNAwQ6HXlYIj9f6zwURXCmFolgxOyga-rmq
 y8v1KqNUe0pXYE_7w>
X-ME-Received: <xmr:fZfuZjIyJz2hSjXQY3bNU_naQ8RITAbUwRX9sfyWL_IbpM9Lk_sWGRatkMmFOhLYWZffRGN3w1ifaHqMLbCfX1MwsgwoG2BqVW6spHQnGNtcLN7L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fZfuZnG3xCdZUi59RTFyDJcCvWHWnsaLZxm_B7dm9bp5SZNXhMVLzA>
 <xmx:fZfuZnVlAQJn6z6TBslyjrwjiC6yeVSQkncywS-HLyVNO7OOqirS3A>
 <xmx:fZfuZiPtgZoIuIWEydFZc_71piQ3dI8OA5TYT2ftyPGswIJdr3gGoQ>
 <xmx:fZfuZm37QO2hY5KKUz8MPqih5pP9VEpDwpB6jM4C7wIPtjzi3M11_g>
 <xmx:fZfuZtFSIN8wywEdIERsraPlbn9S00H4Rgpvm_lxCGlUXntnfIlSZ9lo>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:52:55 -0400 (EDT)
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
Subject: [PATCH v4 06/26] drm: sun4i: de3: add format enumeration function to
 engine
Date: Sat, 21 Sep 2024 21:45:55 +1200
Message-ID: <20240921095153.213568-7-ryan@testtoast.com>
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

The DE3 display engine supports YUV formats in addition to RGB.

Add an optional format enumeration function to the engine.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sunxi_engine.h | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index ec0c4932f15cf..c48cbc1aceb80 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -123,6 +123,17 @@ struct sunxi_engine_ops {
 	 */
 	void (*mode_set)(struct sunxi_engine *engine,
 			 const struct drm_display_mode *mode);
+
+	/**
+	 * @get_supported_fmts
+	 *
+	 * This callback is used to enumerate all supported output
+	 * formats by the engine. They are used for bridge format
+	 * negotiation.
+	 *
+	 * This function is optional.
+	 */
+	u32 *(*get_supported_fmts)(struct sunxi_engine *engine, u32 *num);
 };
 
 /**
@@ -215,4 +226,22 @@ sunxi_engine_mode_set(struct sunxi_engine *engine,
 	if (engine->ops && engine->ops->mode_set)
 		engine->ops->mode_set(engine, mode);
 }
+
+/**
+ * sunxi_engine_get_supported_formats - Provide array of supported formats
+ * @engine:	pointer to the engine
+ * @num:	pointer to variable, which will hold number of formats
+ *
+ * This list can be used for format negotiation by bridge.
+ */
+static inline u32 *
+sunxi_engine_get_supported_formats(struct sunxi_engine *engine, u32 *num)
+{
+	if (engine->ops && engine->ops->get_supported_fmts)
+		return engine->ops->get_supported_fmts(engine, num);
+
+	*num = 0;
+
+	return NULL;
+}
 #endif /* _SUNXI_ENGINE_H_ */
-- 
2.46.1

