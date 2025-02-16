Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6ACA376B7
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 19:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD69410E260;
	Sun, 16 Feb 2025 18:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="dxURs7eH";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fy9a6MGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C9B10E260
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 18:38:49 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 2497425400C3;
 Sun, 16 Feb 2025 13:38:48 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 13:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739731127; x=
 1739817527; bh=aSpdqmQhmaEaEyQnbvHD5WvuW8sxRaHfdBO7i1cX1dg=; b=d
 xURs7eHIZJSDD8ALfRKboyDXWphmZ/BGyvN1Vc8ypKj8RBMlbK3bppPCODAoHsD1
 lXdMtEcgjwG5OAF1WtBBqjdiHyAFkR4kuL66kPYs+bzL+YQaxAh9abUQ8FlWkK+N
 tL9D77rNXBJcYymgEsVIaf0leV8q2Go5Qn/Dd5Y3UDAFV579GBRVOhteH4a+1RQ2
 zUJBL1Y4pzQvzVq0ib41/EF6bwvipoNhPxArhNlmbCV9IfXUQbChNcgB0vht1Lw8
 HY8uc5JhxL5B73mVOTIimxrMoQ9BPM6TJkBpw2HxBO+7Rm3sYINlKhYkcRJPXpYy
 33LYzRssqe80oVe5+5sGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739731127; x=1739817527; bh=a
 SpdqmQhmaEaEyQnbvHD5WvuW8sxRaHfdBO7i1cX1dg=; b=Fy9a6MGkq57Wa+BOE
 PSdcrwK5dPIE3wd6HbtljvUBZQrYpa10gb+JKnMTZXFY7gcqPWzDEp7XrEve5bv9
 tIOJXlUhBsqM28mSvH5OGEWka7j3PzRTCxPWbGJME6rBgWoaS/HeozrVUYazE7vO
 JHfBm5pk4NAloGiM7MOraFFX6hgb3A3QHDFaH6zLmkuFdWBI2Akgmo4rlGUxfrc1
 nKTSvA0YMd5kF4+BQd0T648q3HwzldfBtIperwocKI5C8M5MDC5MxgUCYX9vku6y
 2mIvjozLEUjpieOmK2P+Kb+12JwvK8E3/Dc9DWcHFArCtLOkvTbP+GRezuNCI0jU
 SAjRA==
X-ME-Sender: <xms:tzCyZ0ARKQwFxKCNyskMajYYN4s_xhzf8Dnr98BOzic2Eo0dGR1LfQ>
 <xme:tzCyZ2j08cGQf6E0Oc1-aiIcJf9QB9iuQXRG0YQv8U61LsNGpCQDlbTB0AuQ1oD_7
 3Rzacc2-andEqqe2Q>
X-ME-Received: <xmr:tzCyZ3nY2mxNB754AQZ_dhzUphkF9hVdeI6Iex_tazgrlJg3iu_PMdPwq__KSa94C2bFNHYDOEtUDjRHHX0hU3OUQy5T_Dk8OrZtD1VJQnks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:tzCyZ6xNGrqoIHgF_FsCoj_aDzk8Tq2zKMVlBeOaAzxc-dMVFsDlQQ>
 <xmx:tzCyZ5Rez90N5Av4S--7fhKnVib1gvarrnVTQg6VVUYpdNzdChvhLA>
 <xmx:tzCyZ1bZmsk7bR-FWMSp9uSdYG8jQLR8XuBuTDzmTFkXVVKp2hlL3Q>
 <xmx:tzCyZyRfF1hV07S26XsSjKjLLU9NcDxGMPejoeOn63ddlZOX0oYNcQ>
 <xmx:tzCyZyBrHB2OH8UvZdKbVL8V0xHAp5pQQBx664Yt4Oi2v3lN8PR-M3Ty>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:38:41 -0500 (EST)
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
Subject: [PATCH v7 09/27] drm: sun4i: de3: refactor YUV formatter module setup
Date: Mon, 17 Feb 2025 07:36:09 +1300
Message-ID: <20250216183710.8443-10-ryan@testtoast.com>
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

