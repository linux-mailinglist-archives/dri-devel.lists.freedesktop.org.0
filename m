Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394C5001AC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB99D10F158;
	Wed, 13 Apr 2022 22:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ADF10F147
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E12FD5C0325;
 Wed, 13 Apr 2022 18:19:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Apr 2022 18:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888379; x=1649974779; bh=Dm
 EyWFCtmS1CP/NJfSjamUUamIi9FMNiWBV0XLSX5tI=; b=mk4goxXUJrAIBWW089
 dPCf4FzqENNN0V90qnVFG3Nb+06XXWnUrXuZ+EZ6KlLvmQlaXV9aLyBEheUsB0ew
 L5IA+VDexu9UDz6dGM6mmgxkKvzzLYGjP3cMHo+hVZIF9kC4V64sjU8qx/jOcs5L
 jlN3BOhlSz0a0f8q0SsMtOtEcWU+yNnikHz1LQO4RRSxkHIRCE10BA5ek86yu7kT
 YGh49nlDZ1paW0U8O6XzmoK5UGs8+a9UjY3n4SLqsWmX0JGaC9H0+lMli/eqGBVM
 cVPioWFJsFXzAiGrvp8NspW1xYpvIJB3aadgENPWLfBujOblEA6ajcicj3TfRgLF
 hqAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888379; x=1649974779; bh=DmEyWFCtmS1CP/NJfSjamUUamIi9FMNiWBV
 0XLSX5tI=; b=p2cP5wLcgSeBDjXtnvHzgbPSPk4yR/i4fCkA7ZcCtNYo63XOpfs
 MCD6IQpVv1+Dvi4dKKDfk+b8QKvo5zbtk2n5xvgts/v2zX/asrYoVUsHHdKl9HFe
 JMyLH2eL4Wed7wNTe/mHykvgiIexwOTkhsl1xC7ch91CbBfLRCmRojvmG3ULGkcE
 81bnvhj5CVzIrQwrXEOlTtS2CmAek3tdrY1DYseSt/Qy+M/F9XzVk7cV+73LN0j7
 LXhmz0c/y0R+OnY/q2gBsADIuhWFUhCq+nKEuOlqY/X61x3YGdggRtcCqiea/L4Y
 VKkfy76tni9n76SXAE+h/l2bjLPG34bnGXw==
X-ME-Sender: <xms:e0xXYpjNv2TLkCAN0ztJaT6sjH0fDjHeSWwRgq_8nje2n0E-4CXSeA>
 <xme:e0xXYuA1d9jB5klSZr1FdEyHfvv309eMymxBGGDuXDDUVMl8Svxj6USb1PY_LOwnO
 U9Nvh4-v13Mf3-zJQ>
X-ME-Received: <xmr:e0xXYpGICScmidQ751I2zEVrgcmICfg6GMyBfWFVmwA4NSdG_SSJVW4ZF3YVPdqqVfbKCrk3Q3zrObvekNgB92Bf0ClBbd64y4eR_7JRVFpMsTYaJ8D4MXSGv7HkmLBXl7I9RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:e0xXYuTXUBj21HJUYOB-GkPGdH2BjGFLMzboDNKacR4CYk0gUm7Qvw>
 <xmx:e0xXYmyI1vbSLz3zB_qRDsWiicF3jx1qmWkagTmuqc2TQMt7Hjvyfg>
 <xmx:e0xXYk66X8RQzFm7TlNNA09AZOUb5UYkDxuG9gepNhfvI8YvI7bfeg>
 <xmx:e0xXYtiVbAlbtckkQb7xm_dem_FoAspGpsqPLzLzjpUQX9jP50CS0w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:38 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 09/16] drm/rockchip: ebc: Implement global refreshes
Date: Wed, 13 Apr 2022 17:19:09 -0500
Message-Id: <20220413221916.50995-10-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <x@xff.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The global refresh mode is used to initialize and clear the screen.
It is the most efficient refresh mode. It uses two pixel buffers (old
and new) and a frame count. The frame count is set to the number of
phases in the waveform. The hardware then looks up the combination of
(old pixel value, new pixel value, frame number) in the LUT and sends
the resulting polarity value to the display.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/rockchip/rockchip_ebc.c | 48 ++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_ebc.c b/drivers/gpu/drm/rockchip/rockchip_ebc.c
index ca3173b28d1c..cb6dc567e94c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_ebc.c
+++ b/drivers/gpu/drm/rockchip/rockchip_ebc.c
@@ -127,6 +127,7 @@
 #define EBC_NUM_LUT_REGS		0x1000
 #define EBC_NUM_SUPPLIES		3
 
+#define EBC_REFRESH_TIMEOUT		msecs_to_jiffies(3000)
 #define EBC_SUSPEND_DELAY_MS		2000
 
 struct rockchip_ebc {
@@ -269,8 +270,23 @@ static void rockchip_ebc_global_refresh(struct rockchip_ebc *ebc,
 {
 	struct drm_device *drm = &ebc->drm;
 	u32 gray4_size = ctx->gray4_size;
+	struct device *dev = drm->dev;
 
-	drm_dbg(drm, "global refresh\n");
+	dma_sync_single_for_device(dev, virt_to_phys(ctx->next),
+				   gray4_size, DMA_TO_DEVICE);
+	dma_sync_single_for_device(dev, virt_to_phys(ctx->prev),
+				   gray4_size, DMA_TO_DEVICE);
+
+	reinit_completion(&ebc->display_end);
+	regmap_write(ebc->regmap, EBC_CONFIG_DONE,
+		     EBC_CONFIG_DONE_REG_CONFIG_DONE);
+	regmap_write(ebc->regmap, EBC_DSP_START,
+		     ebc->dsp_start |
+		     EBC_DSP_START_DSP_FRM_TOTAL(ebc->lut.num_phases - 1) |
+		     EBC_DSP_START_DSP_FRM_START);
+	if (!wait_for_completion_timeout(&ebc->display_end,
+					 EBC_REFRESH_TIMEOUT))
+		drm_err(drm, "Refresh timed out!\n");
 
 	memcpy(ctx->prev, ctx->next, gray4_size);
 }
@@ -289,6 +305,7 @@ static void rockchip_ebc_refresh(struct rockchip_ebc *ebc,
 				 enum drm_epd_waveform waveform)
 {
 	struct drm_device *drm = &ebc->drm;
+	u32 dsp_ctrl = 0, epd_ctrl = 0;
 	struct device *dev = drm->dev;
 	int ret, temperature;
 
@@ -334,11 +351,40 @@ static void rockchip_ebc_refresh(struct rockchip_ebc *ebc,
 				  ebc->lut.buf, EBC_NUM_LUT_REGS);
 	}
 
+	regmap_write(ebc->regmap, EBC_DSP_START,
+		     ebc->dsp_start);
+
+	/*
+	 * The hardware has a separate bit for each mode, with some priority
+	 * scheme between them. For clarity, only set one bit at a time.
+	 */
+	if (global_refresh) {
+		dsp_ctrl |= EBC_DSP_CTRL_DSP_LUT_MODE;
+	} else {
+		epd_ctrl |= EBC_EPD_CTRL_DSP_THREE_WIN_MODE;
+	}
+	regmap_update_bits(ebc->regmap, EBC_EPD_CTRL,
+			   EBC_EPD_CTRL_DSP_THREE_WIN_MODE,
+			   epd_ctrl);
+	regmap_update_bits(ebc->regmap, EBC_DSP_CTRL,
+			   EBC_DSP_CTRL_DSP_LUT_MODE,
+			   dsp_ctrl);
+
+	regmap_write(ebc->regmap, EBC_WIN_MST0,
+		     virt_to_phys(ctx->next));
+	regmap_write(ebc->regmap, EBC_WIN_MST1,
+		     virt_to_phys(ctx->prev));
+
 	if (global_refresh)
 		rockchip_ebc_global_refresh(ebc, ctx);
 	else
 		rockchip_ebc_partial_refresh(ebc, ctx);
 
+	/* Drive the output pins low once the refresh is complete. */
+	regmap_write(ebc->regmap, EBC_DSP_START,
+		     ebc->dsp_start |
+		     EBC_DSP_START_DSP_OUT_LOW);
+
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
-- 
2.35.1

