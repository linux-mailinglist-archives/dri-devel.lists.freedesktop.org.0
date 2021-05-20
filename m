Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D038B27D
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A516F472;
	Thu, 20 May 2021 15:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1474F6F472
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 15:04:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 84D72166B;
 Thu, 20 May 2021 11:04:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 20 May 2021 11:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Zpxq5v0tG5hhw
 jgR/68xsWJDvi1qsDN0rRHvdVKecSI=; b=cOE0gGWm+YXq7PJ24EQ5s0nbWAw3K
 /wPun/Q6aKKiQEvhpobORLkJGW3BbRAzw6ZKQ5a/XHcNN9hlKNYdFLrEvxYbxLuu
 +lRw1pfQK1n3J6YYLfrF6alKW9Y9xY2z28uqXGAMxhgIXj+JurmTg4cN6fdIAFD+
 X9mRjRgIHgyhNGen61EdXSDXRxNjpIg69bFdO63dHoMeYR7f+52lFM0UbSyR5VNp
 U6f1znSwk10eWQtj+0aZH0X+wZmK/wWzO3LoFue4eWXCUzgjY15c7FXA0u03RreC
 VKGSCXT6FADi7T1inzGSDGgV2QeQS4Au0xskBybD7lA3xwUYZ+sGNkqOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Zpxq5v0tG5hhwjgR/68xsWJDvi1qsDN0rRHvdVKecSI=; b=Hd/wCaiq
 MLec/uU5imBmeM76062oHI1KiWc4yTR2cb/Arx3xFYwSs4ERr7OdRoVzpFCfDcV9
 5YHI2BrqdaibvsLrVpHOOJ2LCaTaV6kt5NH8+bTPA1/9L5oUd7bBKG6P/15nScsK
 uHiqE79r/dbMKMd91M/iOjh1NatMfbECqolORVyfaEXS2BKOq0yqVmbREmAdzOgE
 k+Tfpf15hIfdANyC79vj5dcKPsV2U0Y1TMTkFRZ6Bejanqrlr322ga2IAfnJppNP
 vfxhkgdmsVaqDy+n1zGFu0wiZWmBSX2YY2rSyH4AIFbJH648kWCyL6i+Sw11vjTM
 i2A0NuI3zm3D2A==
X-ME-Sender: <xms:Y3qmYA9QaK3ufbKUM_obfo5z2UgDGG2lYuQlRJjum1BPt-MozeGlWw>
 <xme:Y3qmYIusIaVhajfAj1t4kV1oz58cLOUTwBGy29QqYP1jqeTWaiygXbYYgVZs1E0nj
 sTPPvvX5p9r1KFZ5PM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Y3qmYGCx3yEMEs5wkvbqR-NIZ-gyd5a1xUYUPdVcuygI80HYhicDQw>
 <xmx:Y3qmYAcy_m4uHt4SGI34QtKO5_EYmLmaCJqf0ChQBISHBJA9LyEiIw>
 <xmx:Y3qmYFNb5Q88IW3uQLvfkqS2eH17PmvMFooKDIBCa82AdJokpLP93Q>
 <xmx:ZXqmYGxF5EabN4T49fMoSBmCTRPk4EqXZmyaT6KylXQpYDVKBIPKD3hajDo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 11:04:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/4] drm/vc4: Separate VEC compatible variants
Date: Thu, 20 May 2021 17:03:43 +0200
Message-Id: <20210520150344.273900-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520150344.273900-1-maxime@cerno.tech>
References: <20210520150344.273900-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

The VEC's DAC on BCM2711 is slightly different compared to the one on
BCM283x and needs different configuration. In particular, bit 3
(mask 0x8) switches the BCM2711 DAC input to "self-test input data",
which makes the output unusable. Separating two compatible variants in
devicetrees and the DRM driver was therefore necessary.

The configurations used for both variants have been borrowed from
Raspberry Pi (model 3B for BCM283x, 4B for BCM2711) firmware defaults.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index bd5b8eb58b18..a467ceba75e4 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -154,9 +154,14 @@
 #define VEC_DAC_MISC_DAC_RST_N		BIT(0)
 
 
+struct vc4_vec_variant {
+	u32 dac_config;
+};
+
 /* General VEC hardware state. */
 struct vc4_vec {
 	struct platform_device *pdev;
+	const struct vc4_vec_variant *variant;
 
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
@@ -451,10 +456,7 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 	VEC_WRITE(VEC_CONFIG2,
 		  VEC_CONFIG2_UV_DIG_DIS | VEC_CONFIG2_RGB_DIG_DIS);
 	VEC_WRITE(VEC_CONFIG3, VEC_CONFIG3_HORIZ_LEN_STD);
-	VEC_WRITE(VEC_DAC_CONFIG,
-		  VEC_DAC_CONFIG_DAC_CTRL(0xc) |
-		  VEC_DAC_CONFIG_DRIVER_CTRL(0xc) |
-		  VEC_DAC_CONFIG_LDO_BIAS_CTRL(0x46));
+	VEC_WRITE(VEC_DAC_CONFIG, vec->variant->dac_config);
 
 	/* Mask all interrupts. */
 	VEC_WRITE(VEC_MASK0, 0);
@@ -507,8 +509,21 @@ static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
 	.atomic_mode_set = vc4_vec_encoder_atomic_mode_set,
 };
 
+static const struct vc4_vec_variant bcm2835_vec_variant = {
+	.dac_config = VEC_DAC_CONFIG_DAC_CTRL(0xc) |
+		      VEC_DAC_CONFIG_DRIVER_CTRL(0xc) |
+		      VEC_DAC_CONFIG_LDO_BIAS_CTRL(0x46)
+};
+
+static const struct vc4_vec_variant bcm2711_vec_variant = {
+	.dac_config = VEC_DAC_CONFIG_DAC_CTRL(0x0) |
+		      VEC_DAC_CONFIG_DRIVER_CTRL(0x80) |
+		      VEC_DAC_CONFIG_LDO_BIAS_CTRL(0x61)
+};
+
 static const struct of_device_id vc4_vec_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-vec", .data = NULL },
+	{ .compatible = "brcm,bcm2835-vec", .data = &bcm2835_vec_variant },
+	{ .compatible = "brcm,bcm2711-vec", .data = &bcm2711_vec_variant },
 	{ /* sentinel */ },
 };
 
@@ -546,6 +561,8 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	vec->encoder = &vc4_vec_encoder->base.base;
 
 	vec->pdev = pdev;
+	vec->variant = (const struct vc4_vec_variant *)
+		of_device_get_match_data(dev);
 	vec->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(vec->regs))
 		return PTR_ERR(vec->regs);
-- 
2.31.1

