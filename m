Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0698DA372FB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2501B10E28C;
	Sun, 16 Feb 2025 09:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="caTdgyjp";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="fQTiDOn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C7E10E283
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:07:43 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id E9E36114012A;
 Sun, 16 Feb 2025 03:57:41 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 03:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696261; x=
 1739782661; bh=kZ9Uzv86ybQZFZyTdhZ/s15g0zn12UtC1p/M6eL3cGg=; b=c
 aTdgyjpq5Kdjbz70167GLpJAiG+A4J/aq2a6mlxk5PfomR/mVQZCg0jb3SIimDPB
 w+AXS4DGWH9wzoaExkJaq0gmABm1F7h4sCTJw434L3IeJD4q5NPcghZ4+X2TKKBP
 ajn70UCWdXWPRRD2O4EXKt+yzBNXe2c5XFEbmmjk8d22err8CbpCaTfwfyIJli8t
 dP1mO5p0Utclw4dnv5pM1rOCshLo9/vVJ+8u4qNQ24Ng3Yw6l0BvVBZPgIvTEwWK
 cMXR8JtJX/KuarwmqyiHvFzupihZJnYK4qzwuyYaXNp4eTygc1TiVWiJBqW89xYP
 UOuEQIhYeZdJSDO9DL8Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696261; x=1739782661; bh=k
 Z9Uzv86ybQZFZyTdhZ/s15g0zn12UtC1p/M6eL3cGg=; b=fQTiDOn2WW4+DHhP3
 Z+aB+DvJklhnU7+h+gNxK/mHPXf6kXWtq+m+8LhuWgFltaI08wlJ6UG9MibemqZx
 VQbi1j42cWw1nXQUrpoFJ7P+ptpjDX3vtDrkkeW3EBxUAqvba/Nhcg4lfCUF2Y3X
 QRQW/3aoaRie4yCEzcP+xAg25csan1GaZZtnY5DUwSOt2HTlH/zzN53YuvK6iXUI
 b8gII7TLeXSGRSYBTXupLvr5/MnN940yBg+9U2q1qIpYzlMLWx6hrqmWbKnW+FB6
 AZ7AqhFKn88SmjnFteeZqWTxq1ti56MPpS39bAenWYthg8OWH+RJixrqvcCkNeUA
 eq0gw==
X-ME-Sender: <xms:haixZ3gQ9JtnkCR3DiWSPVHJwqeUyzrufy92PifQxFUt9FRU-CKhpw>
 <xme:haixZ0DvTDR0iU-ga5dswS0KkAYMH1Qeq9N7lGsUKrZxxgcdvhhfoh4vj_U-O77-e
 XDzyddluNDQrcIuhA>
X-ME-Received: <xmr:haixZ3G2FWqCZLn_CVvEHyilY4QdVz2R2fLZKz4dZ2yozdHUJaUUEpVfoakwNowz6yk_HqnCUlNSatnh-oxZIBaNrV7yEBLxfChgUh5p-XXn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:haixZ0SgNyDlzg6CK09-IPM0mIW1GkyynGHMxgmKxXI975A2z4oaTQ>
 <xmx:haixZ0wZoKS0lz9NTDT6h_yYDCGhOO2q_QfSEHFaJbiFFUGVIYtKZg>
 <xmx:haixZ66p26nb6BKLynEb4g8oSwIViXZ_TBbSgySvEijgKDrOLNGaFg>
 <xmx:haixZ5wk_29oF5nAy2wGiCkX-dAOYnKYUKemj64cKqqENJ03NrPlzA>
 <xmx:haixZxiltX8dcIozOD1Uuluf6QnLJZ7N4OWvPZ6dEnJLJvccqr0qjpXr>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:57:34 -0500 (EST)
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
Subject: [PATCH v6 16/27] drm: sun4i: vi_scaler refactor vi_scaler enablement
Date: Sun, 16 Feb 2025 21:50:47 +1300
Message-ID: <20250216085432.6373-18-ryan@testtoast.com>
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

If the video scaler is required, then it is obligatory to set the
relevant register to enable it, so move this to the
sun8i_vi_scaler_setup() function.

This simplifies the alternate case (scaler not required) so replace the
vi_scaler_enable() function with a vi_scaler_disable() function.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  3 +--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 21 +++++++++++----------
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4647e9bcccaa7..e348fd0a3d81c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -156,10 +156,9 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		sun8i_vi_scaler_setup(mixer, channel, src_w, src_h, dst_w,
 				      dst_h, hscale, vscale, hphase, vphase,
 				      format);
-		sun8i_vi_scaler_enable(mixer, channel, true);
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_vi_scaler_enable(mixer, channel, false);
+		sun8i_vi_scaler_disable(mixer, channel);
 	}
 
 	regmap_write(mixer->engine.regs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index aa346c3beb303..e7242301b312c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -933,20 +933,13 @@ static void sun8i_vi_scaler_set_coeff_ui(struct regmap *map, u32 base,
 			  &table[offset], SUN8I_VI_SCALER_COEFF_COUNT);
 }
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_vi_scaler_disable(struct sun8i_mixer *mixer, int layer)
 {
-	u32 val, base;
+	u32 base;
 
 	base = sun8i_vi_scaler_base(mixer, layer);
 
-	if (enable)
-		val = SUN8I_SCALER_VSU_CTRL_EN |
-		      SUN8I_SCALER_VSU_CTRL_COEFF_RDY;
-	else
-		val = 0;
-
-	regmap_write(mixer->engine.regs,
-		     SUN8I_SCALER_VSU_CTRL(base), val);
+	regmap_write(mixer->engine.regs, SUN8I_SCALER_VSU_CTRL(base), 0);
 }
 
 void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
@@ -982,6 +975,9 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 		cvphase = vphase;
 	}
 
+	regmap_write(mixer->engine.regs, SUN8I_SCALER_VSU_CTRL(base),
+		     SUN8I_SCALER_VSU_CTRL_EN);
+
 	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		u32 val;
 
@@ -1027,4 +1023,9 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 	else
 		sun8i_vi_scaler_set_coeff_ui(mixer->engine.regs, base,
 					     hscale, vscale, format);
+
+	if (mixer->cfg->de_type <= sun8i_mixer_de3)
+		regmap_write(mixer->engine.regs, SUN8I_SCALER_VSU_CTRL(base),
+			     SUN8I_SCALER_VSU_CTRL_EN |
+			     SUN8I_SCALER_VSU_CTRL_COEFF_RDY);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 68f6593b369ab..e801bc7a4189e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -69,7 +69,7 @@
 #define SUN50I_SCALER_VSU_ANGLE_SHIFT(x)		(((x) << 16) & 0xF)
 #define SUN50I_SCALER_VSU_ANGLE_OFFSET(x)		((x) & 0xFF)
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable);
+void sun8i_vi_scaler_disable(struct sun8i_mixer *mixer, int layer);
 void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
-- 
2.48.1

