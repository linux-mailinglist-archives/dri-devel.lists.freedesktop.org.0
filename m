Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C96AB27D9
	for <lists+dri-devel@lfdr.de>; Sun, 11 May 2025 12:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1CF10E136;
	Sun, 11 May 2025 10:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="pvtqAqrB";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="kkNLWRUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB9010E069
 for <dri-devel@lists.freedesktop.org>; Sun, 11 May 2025 10:51:06 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id AB96D2540073;
 Sun, 11 May 2025 06:41:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Sun, 11 May 2025 06:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1746960105; x=
 1747046505; bh=XtwvmT3ILxwmenRSwnAPhEfiZJxNC6NRedG1CH+5ZFg=; b=p
 vtqAqrBk4TkBe7Jx9Uk+0zLZXG+eBlB0STdmOzNu3XCKSNie0uJb7W5J8iSkHG2H
 FlUSEHKC+J6djLY54m08+PjOZFMnoSIZwgsS+WtZxRXjtQ44sxY/lTv/h2iT71Tc
 acZ9c+sR/lNZ/XM+dJjEepqOtOPf3KHHkUJISaMwfHVt3Zn3Y9nRTVGXK2bzTIOP
 Q+dMALZb2/reUOTuWhsk3NGzkkb/4P4cFa1OXt9Yt4WuDIRC81GMshsb32bL4tQQ
 utdfwtoFIprrAurGNuhdY6pw5oNxdqg06APppdyWapODI/kQLHbuUl3PF/JfqZtL
 +bkzrWtTdOsQ7D53M0pfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1746960105; x=1747046505; bh=X
 twvmT3ILxwmenRSwnAPhEfiZJxNC6NRedG1CH+5ZFg=; b=kkNLWRUNY99wPOtW+
 7BCPLAFzCiCRG9b0WRdFaXAZEguW4vBuIRBWHf+h77XDf6YPT2zaKMOFAJwSdqQ/
 E1bWRq6q1brRWFMPxj8txnz61wmbWIKDzRS81AOt9dAsagAbAZooy8hroNgzm4pP
 QhyqRLzol7H8pBIyz+JcU7ftxJYx/l9BoNuYbXToXPSj5d5fjI6wxbmY6sk2Plpz
 h4NLLk+PWxe9f+R9gcSOCwxEZxpyJlSGpoIhbn9oJJpGIyiRK5WFXXvn3+lD9EaS
 ufi6vkJeb4ZynXNy3wXajuIFk8SUodhQ4b+/AjqN+y+R188pHvWIGR/eo0AM9BLk
 0djxA==
X-ME-Sender: <xms:6X4gaNBt0XBGDJRuqA-YiDEzpdjikpk4BtE5lSNy33w2MdKi2wuVtw>
 <xme:6X4gaLi9ihWC65GRBycPTa1TCFtSjGy6HKSWqYDShbnTZmAWG9kGel9Msns00Hfb2
 6d2WmR85Aiz9hVOvg>
X-ME-Received: <xmr:6X4gaIlvhj_hQ3XJhdz93ifjYmb8CZgrBeNfP6q5UCs6WfCUoGUxgFm38dSzN6EZVnTN4XMWBTCLo8SxiXPyfCxHdqGmQzGiwVLxVx5IOWHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:6X4gaHz_obla813hv5iDa_gQUC6OKRTmVVMJzK4-MWpC5kAKeJZNiw>
 <xmx:6X4gaCT0FuA0sWHqWP49O21EByBnbSi1wEdj7cMj-YpORngM03biZQ>
 <xmx:6X4gaKbnNNPdIgOWhoLcWAjau5EclRnQk4mbQg55I2W8vZijn2hAgg>
 <xmx:6X4gaDRXS2kp6wO-kfOnCMAoUq3F1ZwZd5p9gCRTTyI1iw4trKv0DQ>
 <xmx:6X4gaB4u3FHfWYH48uOkZPHQyZj2MtGW5x7whyBs33U-TBhRn_a5ewa3>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:41:38 -0400 (EDT)
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
Subject: [PATCH v10 03/11] drm: sun4i: de2/de3: add generic blender register
 reference function
Date: Sun, 11 May 2025 22:31:12 +1200
Message-ID: <20250511104042.24249-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
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
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 7fe5ce20082a..43c413052a22 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -217,6 +217,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
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

