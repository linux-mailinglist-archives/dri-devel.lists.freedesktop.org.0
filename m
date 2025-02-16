Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B40A376CD
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 19:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0FC10E2EC;
	Sun, 16 Feb 2025 18:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="b58uyOyq";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="TsSF14+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B4210E2EE
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 18:39:51 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 67CBA25400C3;
 Sun, 16 Feb 2025 13:39:50 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 13:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739731190; x=
 1739817590; bh=hVbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=b
 58uyOyqJ5jv9OsllnTaGcbf0ahweqov/I7rhV6tq5guHoiXk5PfnqjH5ASMjK7Gz
 o7ISZP77bh7lCmWU0sBH9bBWb46xQpfN35tSA8sAmvP0F7TcIMepiyUoiV7wykQl
 DKdcZd/e7j+BtEK8GnclsXplA2LSWc+sofn65cDxIqtCbAIpciMS1x7Q60FPb7II
 Az9aWERfqC0trXttTMl54x3wGBofxvBjPwLeEZ7xuaGgjmrW8F+lRCdBh5vuNrrY
 4XVWLbik+ZiN7jg+MjlgFkR/wC26XxUnN7NnUERrQLHyNkejwXbfcXH54Nn4wIBw
 fGcmRMgbGASgAEDyjZtUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739731190; x=1739817590; bh=h
 Vbx/e/0O8lGVMfw6nGdAuWIs0CL+nJx0lLTRkCftPw=; b=TsSF14+ssyzaTz07+
 5uF87Ooh98jX/TJ4BYzO0jc/V62b7cc9SiRzdDAbYxL5vUGgP7qWawOsOLgvqhSj
 0HcqJv0xiAveWWoCZJUjglNfGehh1uNe+bIguzsUtK/qO78/KiiOzJYcYQcB48sK
 oJ6sYvQ0laYVmUuZJqHn3pE9LRoPAK1KjNdpUkpNlj5b7K+s9fTh37B1sopPEpqp
 QtkE7VDLar2+yJ4OVy/SwlJqr8ENlaXM0kuU6Y6HkiQmtVORba4ZccOXEtqpTW4X
 c89LdM1RcApYcHydKaB4W1ewZ58cwXXMlPKnOMVhbWHrR5YNtAqNhwbdDHRcovuu
 GclUg==
X-ME-Sender: <xms:9jCyZ4LPvjVcTAndkLKEWxpV9YrI5eoUv60O4YABpfOKV2sfPeQQAA>
 <xme:9jCyZ4JCe6CkGGMsqexDHf-yabvcTtyc-GPbcpVZiIX07_jjHWSm-DqIZq9Ef-5AU
 xdG034CDOD6RW5gWw>
X-ME-Received: <xmr:9jCyZ4t1dBXZ1DRY-z71rGCIabEvc8Z2kjZhMopLFnxnlUfCJO0b0z4VHQcJlVcB12yC8OReJ_ZM_Pm9nHp4Nfno5-AylRuTngAHNCtny9fo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9jCyZ1ZaOO_uxuw_ufHHBLWYIRn_kN7f3LFu71i_ogor4AW-ng6pwQ>
 <xmx:9jCyZ_Z-s5MmE_ry4rRtcmkPbIFYJQiwqbCTeeGTinzPZiDcIVrBGg>
 <xmx:9jCyZxCvLAdSz8SgnyNgq5RKgeG2pYtNivnhc1fWR1vfUzU2fA-30Q>
 <xmx:9jCyZ1Z7rOhTjVXFW-7ALPMmfdn522JuuPHmtaIf_xzwCyWYfiIO9w>
 <xmx:9jCyZzL5c7DAoxy5EHq3kRzu-IHNUt56RKK-2OquLlBu3tC9RgMm0f5C>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:39:43 -0500 (EST)
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
Subject: [PATCH v7 17/27] drm: sun4i: de2/de3: add generic blender register
 reference function
Date: Mon, 17 Feb 2025 07:36:17 +1300
Message-ID: <20250216183710.8443-18-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
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

