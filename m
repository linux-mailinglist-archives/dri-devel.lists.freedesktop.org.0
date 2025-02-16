Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BFA372CC
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 09:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0098D890EA;
	Sun, 16 Feb 2025 08:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="U8qY5pFD";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="kP5lt/Tg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C699310E222
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 08:57:50 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A37B525400DB;
 Sun, 16 Feb 2025 03:57:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Sun, 16 Feb 2025 03:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696269; x=
 1739782669; bh=hVbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=U
 8qY5pFD4WOPJYBWIxAs5lHDtuuJNBxP0uAA1VDwyb5+OfezqaTQ2f/wwvN8/AJhW
 XTInR+kG1tTVQQ6gVzNuCaF8Mw4SSE7OHyobIOMWD53654AO1Elx/FsCS1ZXnezF
 izKL1jjhb6lwwksi8XfchtOO2ShVlSdw178kxhUseLK//L/TYAEuJs0DtkdLFgbb
 jUEHRrQP8eCPTpR1e0GedGumA5rch+1gNMuECtlo+5psf4JA31vKT+0cgGYo2rH+
 IKSMh4P//917PJ8Vj+ub7g7rRTeMq85CKVmoM004Kv6ai2APvRB7w25T8YzpuYUE
 pMKWWGG43q/tb8xHKoyUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696269; x=1739782669; bh=h
 Vbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=kP5lt/TgaN5MF6+rt
 tv9ioyhqfeNp9MID4xAAeSYaR9a8ZqMSjBslSdk5ur3SVyMPKHlx7alcfhlKIEt4
 MSwMlF77ifz4tAwL+oZhS2NilDAGdG5v6j3wNPkVYAM6nufHz6w7tVeXcjiZLosS
 bqx+zMkTynT3G7jHg+lvgdzzhXrU0GFg6lmrYFDvw0RbLYMaqoRrtrhyOfyetol6
 ijI2WRzEXVMC2B1HTUbnbib0pocVXOkME6ZJwB6k8cc7hxV+6KjLgvyOiee/kzIM
 kIZW3g4NkakcP8dOCrNYqTeLhxSctPS8bk2EqCK2VfF+0DgyZD3AxlSGX4rhrDcl
 GWAnw==
X-ME-Sender: <xms:jaixZ1IEKv9WevpFpC_oShQ4WItojSJn8NWJ-cYQIJk52InqlXg9XA>
 <xme:jaixZxKfU8R6nhl1oQyrOQ_AarVLiP0zYdrJwJblUoA7AbJeA1Ob_HlXGtVZOjtmJ
 kTYyz_Yh6aKuwq3ow>
X-ME-Received: <xmr:jaixZ9s-ffDDyEl9Z7cZzd4x_vcQPYw5wUJQoVUfvqIOv6GUNuAERlJRyiPehNioNyWCSilwN3ySZ3brBRUqLmTygeVg9eb-fO82wlNmNyr->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jaixZ2bxkwziwoYYPCeKMNXFeHuZl19tkvJLLGN8DC-uOuKcI5rzgg>
 <xmx:jaixZ8YwK4B6jQJJI9UcGi4QGqLq8PxANI7unN1D9n52bZykldb11g>
 <xmx:jaixZ6BEpIv9ebaQxKZJUl-kSQmf7FOozYQAIx7vhdzrT49dEa505Q>
 <xmx:jaixZ6aJtoDldwk6XcM7sbYNOHY38QUrxdES5KkxaVziSkRyuLmQUw>
 <xmx:jaixZ4Kqqz7BAL8xleGy8fzcvpzI6Sa8VC4lOc5JS82b_BGA82S1AZ94>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:57:42 -0500 (EST)
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
Subject: [PATCH v6 17/27] drm: sun4i: de2/de3: add generic blender register
 reference function
Date: Sun, 16 Feb 2025 21:50:48 +1300
Message-ID: <20250216085432.6373-19-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
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
index baf2d024898a9..db962ccd66964 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -235,6 +235,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
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
2.48.1

