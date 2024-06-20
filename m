Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C909102D5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9548C10E93F;
	Thu, 20 Jun 2024 11:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="5UJF7jPr";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="LvjgOaeI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2934710E93F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:34:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 8D8F51140247;
 Thu, 20 Jun 2024 07:34:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 20 Jun 2024 07:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1718883253; x=
 1718969653; bh=V6kXhDOR28GY7K17QHJNbJAm+pQYGaOIMaC93g+Xacc=; b=5
 UJF7jPrqhbOsSgtcIVDRcY1YliRM291ahaQ2R0wPah3KTa3ERV2i/6elLmwY9qJx
 n0CbkvmuQgWmkYAbRTiYGMT5zSpIUTwVfaKvj7StX0J96Z16gKirE2b9VM4avIMd
 tESHYosJyTvGDAfTBAwu0oWjIkD3M0noONvZH/vyDz/jyqIqcehtS25G4mNUPQk4
 SOU3c0fYkZs7R7jVmuORRThxKOVBLbO0Qr4HXNdGzkP2r41dho5UK9jwuAsOzZb6
 qWLD2UlsbkCW7zo/6CI89CjkT9q3jCI1+54TuQfu0jS4ya9+zI5R585NmTeE2TpO
 ycaOevsqbLVnyOhavfgcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883253; x=
 1718969653; bh=V6kXhDOR28GY7K17QHJNbJAm+pQYGaOIMaC93g+Xacc=; b=L
 vjgOaeI6hcaT1uiC5g7epGhMjj86Z7s9PLTuGAS5kEgFkURlYBPkkwAjQpsjSfmr
 qeAnR9PXRWwk0ifYEoXwS73rmHmbsCsWIoJ5b7CwrGo9ojG0ZkYMlSK9rU+g5+q1
 t+h1cGJxNQt92OdZXUShMNxAj9pJaTdgDoHfBSXZaKqgb5Txv9pdz0Wtq4kuTqPj
 ittpHGFt0hGulE/F6vPENtUr5kgll9CiP0Mg8uWP0eKiHO3QmP9aum2+ssWKCDuT
 oBEZAvwKGybADmlSgASgZwZjV9RNsE2v6s7sSffhR1aXRAKOGpGjP3d0IQIzRtCR
 rdaJJV0pUI6BE1Q72JKsw==
X-ME-Sender: <xms:tRN0ZjWfhB2mXlc6b22x2y-woXznHfgOQGFQMmuAQgsq6VLTKpxS0Q>
 <xme:tRN0ZrmDU7vN_k17ct-56etSZTYYLtp8xgD_emZt6WRr9exqJfkNEx5F6zOJd_aBQ
 KOHzmBEvd2fUBDUXw>
X-ME-Received: <xmr:tRN0Zvaj056ur1MdMDYO2_v0UV2Rr6zrPEzhKtFxkQ749tu_oSxD_yX5FRVE5P5JjmG4qZcJ6DAv9TRxL7_m8UYMPNyPR2Y7DScuhMgKWYYg3Wu1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:tRN0ZuU_F4X3I1KN-jiFfB1ZrzEePExm2XLRO4Wx52-TbGnLgyQFWw>
 <xmx:tRN0Ztm2rUdfYI2Bnu0p2FMfOqynUrRXWIblhrRUW42xcmRU0nPdRQ>
 <xmx:tRN0ZrdsMNZomo6fEnXiV8K8CBf8spCTIWE1ZlEWn4CJ-xnPXrtRGQ>
 <xmx:tRN0ZnFFnBHLhlewkKEFnWQrjc2YIN2QHYtR6Lnw6hjwY2hIvpyE4Q>
 <xmx:tRN0ZvV3Sv6JpVbtbLjjwnquVdNVq61iRqY4zOQy5nS3HxiUWMND3Mbj>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:34:08 -0400 (EDT)
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
Subject: [PATCH 22/23] drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33)
 support
Date: Thu, 20 Jun 2024 23:30:00 +1200
Message-ID: <20240620113150.83466-23-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
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
2.45.2

