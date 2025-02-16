Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3E8A372EB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AC310E233;
	Sun, 16 Feb 2025 09:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="ZzJUdmS+";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rk7Bwwjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F9310E22D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:02:44 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id D21611140114;
 Sun, 16 Feb 2025 03:56:47 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Sun, 16 Feb 2025 03:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696207; x=
 1739782607; bh=aSpdqmQhmaEaEyQnbvHD5WvuW8sxRaHfdBO7i1cX1dg=; b=Z
 zJUdmS+TrTqhb3NhpyIK2vqBLiyQXf+pvykUO6x//LqY8dbREFjIq8cmZ380t4yg
 rgrS665Xj2F6Ckm6aIEK52DPi6uIvAnvFGkgIqUXspxHNSnYyTJz1kyZbIS0Z7tE
 bFZxvuBbJmbmHNsifnLp5hm9c87yb01o8HmiYbO34+u4tgLn4keUbSG845l5MUUM
 lVrjRALRcY345CtdXqeTxkxnote30vhpXeuF7VaQhr4u/0eM7QzytB+DoYw9fJd6
 obHH+Z6sfxAotD2aT71WMriVLMTiHBJwR9KpYhNX0sIzAYIQslT/3BOZKi8aQa+1
 ue5lShXWUU76+Kd7JDEMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696207; x=1739782607; bh=a
 SpdqmQhmaEaEyQnbvHD5WvuW8sxRaHfdBO7i1cX1dg=; b=Rk7BwwjqvKj5f3del
 hwB56ktS3m5s6nrucyxaZHPF+OazdjJTiy8jQB5DELMNMLEYA8//y3FHRXk4jiMq
 tmZeZ4HNYq+ygN6vuA076nb2/hjR6uCPscJ4v8NWqBCu+PXhPjVXeo3lSWx59Tv4
 602gf0rUX9ZPfY2MGnSA/cCTXuW12YG14ZQDE9J95eMw88bvTlNPnrT7xckpV+0c
 dLOttJ3PXg40uuYUtC/esy5YrShJOKVpbm21y6YAwMmNfWhdZuYTIb/+T7SV/vES
 A5HSHgMfyMFTuG4Gu1LymmAGMX6rKkS9NNz2ML1coM1un6Kmm207poa1anq09doh
 8l78w==
X-ME-Sender: <xms:T6ixZ6TMU3xLv_IrJaBl9TAa1Dc3p2fDtDPKdblYO1PDh4e-659hWA>
 <xme:T6ixZ_yVr2CKUkft7X_nvC7melgvFGS7yrICAr9WwU6lXU4Jy-7_btQHkp0ShtuVV
 xPGy2Hiay6DBQSpTQ>
X-ME-Received: <xmr:T6ixZ32cM6-P8FBASVSlYVJS36kdqZTeY_PLMU_7PgItSqaNYiVMEthIZwUHm_gtBkMYWbtZEdcBurdVEc5SJ0LPa0kj0pxV7cRRXRtmjdl8>
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
X-ME-Proxy: <xmx:T6ixZ2BbseXATJVcq3ahMReke1vaPySnO93oN9QAtk8jIJAPyD80Ww>
 <xmx:T6ixZzjsX92nP6oV2tnx5yeAG1psUVGxigmXIA1g2jjuDwSiWemaAg>
 <xmx:T6ixZyqAmERG1n_xyO5GpZECf33Hfnj5IeWP8St7W0u_w9m8NDm8jg>
 <xmx:T6ixZ2jfaT26lxu7uSsnbyMtvoDWApvhpz_qN7ZqUmfmwid9oba88g>
 <xmx:T6ixZySB2xqSV08ke-5ApWsYszDtgnQ5A8g5BnoxAyqahIq3xUFTpCrT>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:56:41 -0500 (EST)
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
Subject: [PATCH v6 09/27] drm: sun4i: de3: refactor YUV formatter module setup
Date: Sun, 16 Feb 2025 21:50:40 +1300
Message-ID: <20250216085432.6373-11-ryan@testtoast.com>
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

Because the format is stored in the mixer configuration, the formatter
module setup function no longer requires the color format to be passed
separately.

Remove this from the setup function declaration and access the format
via the mixer object.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v5..v6:
- Add this commit updating the sun50i_fmt_setup function
---
 drivers/gpu/drm/sun4i/sun50i_fmt.c  | 5 +++--
 drivers/gpu/drm/sun4i/sun50i_fmt.h  | 3 +--
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 3 +--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
index 050a8716ae862..376a3c9b993f4 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.c
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -51,13 +51,14 @@ static void sun50i_fmt_de3_limits(u32 *limits, u32 colorspace, bool bit10)
 	}
 }
 
-void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
-		      u16 height, u32 format)
+void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width, u16 height)
 {
 	u32 colorspace, limit[3], base;
 	struct regmap *regs;
 	bool bit10;
+	u32 format;
 
+	format = mixer->color_model.format;
 	colorspace = sun50i_fmt_get_colorspace(format);
 	bit10 = sun50i_fmt_is_10bit(format);
 	base = SUN50I_FMT_DE3;
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
index 4127f7206aade..dd6816c90dfcd 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.h
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -26,7 +26,6 @@
 #define SUN50I_FMT_CS_YUV422    1
 #define SUN50I_FMT_CS_YUV420    2
 
-void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
-		      u16 height, u32 format);
+void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width, u16 height);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index bc934186bfd6f..3069329210085 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -405,8 +405,7 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
 
 	if (mixer->cfg->has_formatter)
-		sun50i_fmt_setup(mixer, mode->hdisplay,
-				 mode->vdisplay, mixer->color_model.format);
+		sun50i_fmt_setup(mixer, mode->hdisplay, mode->vdisplay);
 }
 
 static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, u32 *num)
-- 
2.48.1

