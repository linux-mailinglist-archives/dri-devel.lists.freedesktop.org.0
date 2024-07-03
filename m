Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE8925A56
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEAD10E7A8;
	Wed,  3 Jul 2024 10:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="ICvn+K8h";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="sUJRxH/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA3810E7A8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:56:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 395EE1380501;
 Wed,  3 Jul 2024 06:56:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 03 Jul 2024 06:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004209; x=
 1720090609; bh=F9Mpyw6J6uyl7UWCXabNIDrsg+2F+FimJS3Njbqv/sg=; b=I
 Cvn+K8hbe4yUQCPjQiVmk9FI3DDpjf5RAIjAJiyHizMYb+VRuFLAh7u9yd96kp4q
 4ajB18yUJcEXIvfsxQWeNnhAWCY9CvxUZ9aeQ5X1DahSJKQtKtWl9L7xvOWbX7pY
 uyCMusGU1DguvUf5dSu3RI1yxPm45UHenHDqEvNJ3YhiH19+oDHG/xvaD8XNBXIT
 oaq7X1pntFR5skfoajZvi2giwbFGHWtNHGJ9SUzxS3eJbhE2bQNhcBc0EEUtTvls
 JqMiVxZ6jC+j/qW2K9bXI2L5cLiiOTZsCdtl4Mwit+aOk1Mmrf3d+b0bFhDJVaE1
 AXlJJ1JTeXJtmWf9jqSqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004209; x=
 1720090609; bh=F9Mpyw6J6uyl7UWCXabNIDrsg+2F+FimJS3Njbqv/sg=; b=s
 UJRxH/Pb34TZUSgAd4+d4F2Ez2/MJTEssBMnPSvf3UP0UeV1+LmW/NdN797zm5bw
 Cqc7kdxJfZ35FMBOybIRiqyjEIhA/YP3luqvhpbZS65aDQjEOAb+qmLplxDR3E3A
 c1F6jYOJ+uzG5IK3XAvPrSYQI1VQJe3VwF5I4JwUbyAUNwLf1nGTRhOehce4n1DJ
 SsQ3U718Y9RkjbOOm7/s+OS0bHnm2QF052B9Xm7z4ZtkGohcjuBwvQJNOOjDHY8Y
 58AS0YTFJ80MK7LmGi9mq97vG1xnsjv3NcHNwWQMlc2LsY7Jh+0s20vEErDNfclz
 wBAbMQ5cMmiTB4qUDWzQQ==
X-ME-Sender: <xms:cS6FZrLuquQFrL4UKRuegw2waeDp2kv7K56BlElAJYC4P7TVXBUK8Q>
 <xme:cS6FZvKpSZ9oL8l4Ov_54_kawLmR-Dp1mkdcemXsmsmH35drTkgantXL2Dealt797
 kBICt7B9zyS5Ubw2Q>
X-ME-Received: <xmr:cS6FZjsghX8h3Ngu0h8g28DDq2e57XNHPlaqUTG9lHTF3qxBpgPfdwRPiE1HPFHNM-qr3sJFe32jTk8cjZV6llmTYb24OQjNqU1QXtJiv9X9hHfZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:cS6FZkYn6wslsInppEN9uCZW4VEHdjwxz3KXLaLa42CS_xTdrw8ANA>
 <xmx:cS6FZiZhNH2DfSXuBtrh4dBpSQquyp77m2pYSo8sUjKVuLD-Z8MtHg>
 <xmx:cS6FZoAdhGI1b2Di9lkslVMRqJgj14PoZ7B2VNtv8TZqyF_BXGUmjA>
 <xmx:cS6FZgYhX0nLs6KOdBj5fWEGkvDICsoKSMLr_2X99fWH7-QBQayH6g>
 <xmx:cS6FZvJJh49XLeRv9OCFI4eXIQzaFou27rFeMCdX3SqYRi7jTYCVOuUo>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:56:43 -0400 (EDT)
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
Subject: [PATCH v2 15/23] drm: sun4i: vi_scaler refactor vi_scaler enablement
Date: Wed,  3 Jul 2024 22:51:05 +1200
Message-ID: <20240703105454.41254-16-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
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
index 866ed04fa0a14..3cc387c248619 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -205,10 +205,9 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
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
2.45.2

