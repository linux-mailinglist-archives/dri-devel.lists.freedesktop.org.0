Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D4A376C8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 19:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B8110E2EB;
	Sun, 16 Feb 2025 18:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="N6sA/xGZ";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="TfB98W7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1038010E2EB
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 18:39:44 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id C598725400EC;
 Sun, 16 Feb 2025 13:39:42 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 13:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739731182; x=
 1739817582; bh=kZ9Uzv86ybQZFZyTdhZ/s15g0zn12UtC1p/M6eL3cGg=; b=N
 6sA/xGZCrrsYSbChuSfJNM+yuRtvAv09O8TlPrbDrR8vjS/bL+cq6BqoVtawWV0h
 VoA0tvtdoBpq13GiRfpi2v2PtPKgRr2mY0ZM1tpnzqgJo03sQ5sKG8E7yhDxqxY3
 /dlvU/z3qZDuq0Yoj5GZWN7jgz4MFuPDvqppHScu5q6PAlIT58IprAVO0IFdT8ZX
 v7i5HqaLGyQgDlK/3H/PRX5BDvOS8Ci44HJ47bf3UTljc8gybA0yWTitkRa/oSnN
 uNRFANsxBJfq0kI9CRTmKb5TkVfw30ftwDAOJX+GLF20MalxdFfwfdRyJriIKQIi
 YJLUPL5jp3jbQ+vO3OfAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739731182; x=1739817582; bh=k
 Z9Uzv86ybQZFZyTdhZ/s15g0zn12UtC1p/M6eL3cGg=; b=TfB98W7sPOQW8E/kW
 MvoEoP/fLvlJigxd/kHuROXSFf4KISXAYZoJbRLA6rhw70u353vxM0qoHVlgcAnM
 02A9E+sC+DIVeqy38B1w8VGgPz4kvpBSU1wCqOh1NtpDpxeDQgz8qryshTBM2PIr
 irGzVEf9ytbGoy7NZWr6RTHe2liHcR+K/XFyQoWPs+R6Wvmaq1FOT7XdWTaf0PZt
 Jic0kXjpb7f6e/u8CiQ4c/OTcNtV9n3Fy9n9PKNdFGr+PGXM6s+WBr0gNXoriBkf
 hFN81Yno5bGUMs9Ea7rPgNW0gXyriCknJYqWMP04SpSw2m7xkLKKL78+y6C/1jfe
 r/T9A==
X-ME-Sender: <xms:7jCyZyJ5HJpqKZOXZmXrsKtN9CvGsZvUf5Z8ITTSWk6-il-ackXDzw>
 <xme:7jCyZ6I7QqKy5SKRcZ9O9jbcF3VtFs30pRWoXJjRycatUJrx5gGjqGIzhX8In-V9B
 fCxFurLtr2inwhWBA>
X-ME-Received: <xmr:7jCyZytIfwQqWurkCD9ZHmZKIPACuSYO-1nTkoL1Stctghm45cLJL_cYKMJ0cR0NoSgm3Wtn166nsY7HBkxXxfNGj-jVaegjtQPvXlQM6MTJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7jCyZ3bIj1vpWFArVrO4N3w2pC8RlIH2aZ2QuAq47iV09HHDBrmxeg>
 <xmx:7jCyZ5YiXoe3IbCEixmrpEVsMR9nHMVfcgPwRw5asVemDqzLQ481HQ>
 <xmx:7jCyZzAaVq1ied-I03InWrJ_hTt4TCGoKckDdeh-Pu_bq4eOsSMRmA>
 <xmx:7jCyZ_bXDWAujHMB0_1p-3DlmIGsE3wHny5KhNPaQ54UvyvYQbxzVw>
 <xmx:7jCyZ9KbfDsMbkLvJ8aXrTkFmXC9KEctlC78rrU0Gr1AxuijVbXCTqsd>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:39:36 -0500 (EST)
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
Subject: [PATCH v7 16/27] drm: sun4i: vi_scaler refactor vi_scaler enablement
Date: Mon, 17 Feb 2025 07:36:16 +1300
Message-ID: <20250216183710.8443-17-ryan@testtoast.com>
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

