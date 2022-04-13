Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F35001A6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D7C10F136;
	Wed, 13 Apr 2022 22:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A596D10F136
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 017155C0337;
 Wed, 13 Apr 2022 18:19:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Apr 2022 18:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888377; x=1649974777; bh=tY
 YXooyzfoVASIVFw46sk2jtQuSFQj7O0CjADjvQKS4=; b=fnbQiRCWZKoa6P2AFl
 UCN2cUs8hriQsg+DTZJBhg6fKGCwumuG62IEDgTeIiEx9yd5Y1F2hMRzmAcFysU5
 cS5hbbwRvTDrqSiI42YGA1xc24+rimiICmi7tDg7maQ+IZmLT79JX6fRm2/kIlnX
 AdnUOwD50xQ/TZGy5Gk/gMqwVhyiKLYduZRYZ36jurBvH52iY4pT3Nl2aod3hUc5
 6iGJqiTgMBuhEAHhi1wcQ/oUMksynJiu0PMEoflM0ten8rn0ZVXh2BO+hHQiVrIB
 +4BmFZAJ1a7YP5ChIryCqaxBdjOabDNj1b7qNr4rtu3rdHfBlbYicnlssHQHBNvl
 0AXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888377; x=1649974777; bh=tYYXooyzfoVASIVFw46sk2jtQuSFQj7O0Cj
 ADjvQKS4=; b=JN/u/DVSKTUMgkOEo/iiZMZiOEglinf5P/JGht+fnQMEX2vTL6r
 O8uAgoyL3b3P8vqeTD6RQk37E9K/+khwTK14Lb31637ClNaOGPkF+em+6t7aBayA
 eJ/b0tyMz8afdMlBiDmDzZLzCIoHbYvyrFE3iy7fAqjgzemvzHdEPcIhlEwhDlez
 VKMjbIU8z3XpSxUByu4aKmIosWw+sncCKB2cxPzO32OYF1vrtoEOFEmeU6yHDszL
 BoNSU8UuuTaEEqA8kMhNz815ly6AKTi5c1Ep8EoYIDNrc1/Ecr2OZ6GBMpO0Z7BJ
 2B0/IA6LoAqWwKojy5gqAufaOx4Q9tQ/8MA==
X-ME-Sender: <xms:eUxXYu9OYNvQGclWWjORrBXpPd1NN9mLBU6k3xxUcdQRC5vt3nrzOg>
 <xme:eUxXYutxNj3VchCYStPIfUzD0la9ta1Nqu9QG_EN1Cp9t6YrU4WrabBh0LDMMF9iu
 KySpTIqK2w109KxAg>
X-ME-Received: <xmr:eUxXYkD7i8AQxF957Z6G6t3AEWuJdi4W-VArYJk9Tye1Qi9yHpMjfJDtpi2fgm7P3YOAhSsWKHShCz-5yt822dxnadZKNpsch_AGBVWTRhfAcKMA_U_iVZiKYgjREnKdKUt_3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:eUxXYmfmOCMWEQpfK6gw9Kzh2-7QIzj9Fm8E1dPD-UiFMaKiEBX8lA>
 <xmx:eUxXYjNochNR33-cJMl04LvxOoB5KaHysOJ8mksnVYnf0LD_bqpl_A>
 <xmx:eUxXYgnMPtv_MKMf5wXzICajXp3n4gAbS8bHm2MryfU-AsxEOgeFzA>
 <xmx:eUxXYmOzqQIxC8JW6qNOB_kQY9bBDLJVVGOtaiXnAa6zXBQNG7jf6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:37 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 08/16] drm/rockchip: ebc: Add LUT loading
Date: Wed, 13 Apr 2022 17:19:08 -0500
Message-Id: <20220413221916.50995-9-samuel@sholland.org>
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

The EBC contains a 16 KiB SRAM which stores the current LUT. It needs to
be programmed any time the LUT changes or the hardware block is enabled.
Since both of these triggers can happen at the same time, use a flag to
avoid writing the LUT twice.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/rockchip/Kconfig        |  3 +-
 drivers/gpu/drm/rockchip/rockchip_ebc.c | 76 +++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 9d3273a5fd97..efe4476e336d 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -94,7 +94,8 @@ endif
 
 config DRM_ROCKCHIP_EBC
 	tristate "DRM Support for Rockchip EBC"
-	depends on DRM
+	depends on DRM && IIO
+	select DRM_EPD_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
diff --git a/drivers/gpu/drm/rockchip/rockchip_ebc.c b/drivers/gpu/drm/rockchip/rockchip_ebc.c
index 095d66e67c2f..ca3173b28d1c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_ebc.c
+++ b/drivers/gpu/drm/rockchip/rockchip_ebc.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/iio/consumer.h>
 #include <linux/irq.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
@@ -122,6 +123,7 @@
 #define EBC_WIN_MST2			0x0058
 #define EBC_LUT_DATA			0x1000
 
+#define EBC_MAX_PHASES			256
 #define EBC_NUM_LUT_REGS		0x1000
 #define EBC_NUM_SUPPLIES		3
 
@@ -134,11 +136,15 @@ struct rockchip_ebc {
 	struct drm_crtc			crtc;
 	struct drm_device		drm;
 	struct drm_encoder		encoder;
+	struct drm_epd_lut		lut;
+	struct drm_epd_lut_file		lut_file;
 	struct drm_plane		plane;
+	struct iio_channel		*temperature_channel;
 	struct regmap			*regmap;
 	struct regulator_bulk_data	supplies[EBC_NUM_SUPPLIES];
 	struct task_struct		*refresh_thread;
 	u32				dsp_start;
+	bool				lut_changed;
 	bool				reset_complete;
 };
 
@@ -282,10 +288,59 @@ static void rockchip_ebc_refresh(struct rockchip_ebc *ebc,
 				 bool global_refresh,
 				 enum drm_epd_waveform waveform)
 {
+	struct drm_device *drm = &ebc->drm;
+	struct device *dev = drm->dev;
+	int ret, temperature;
+
+	/* Resume asynchronously while preparing to refresh. */
+	ret = pm_runtime_get(dev);
+	if (ret < 0) {
+		drm_err(drm, "Failed to request resume: %d\n", ret);
+		return;
+	}
+
+	ret = iio_read_channel_processed(ebc->temperature_channel, &temperature);
+	if (ret < 0) {
+		drm_err(drm, "Failed to get temperature: %d\n", ret);
+	} else {
+		/* Convert from millicelsius to celsius. */
+		temperature /= 1000;
+
+		ret = drm_epd_lut_set_temperature(&ebc->lut, temperature);
+		if (ret < 0)
+			drm_err(drm, "Failed to set LUT temperature: %d\n", ret);
+		else if (ret)
+			ebc->lut_changed = true;
+	}
+
+	ret = drm_epd_lut_set_waveform(&ebc->lut, waveform);
+	if (ret < 0)
+		drm_err(drm, "Failed to set LUT waveform: %d\n", ret);
+	else if (ret)
+		ebc->lut_changed = true;
+
+	/* Wait for the resume to complete before writing any registers. */
+	ret = pm_runtime_resume(dev);
+	if (ret < 0) {
+		drm_err(drm, "Failed to resume: %d\n", ret);
+		pm_runtime_put(dev);
+		return;
+	}
+
+	/* This flag may have been set above, or by the runtime PM callback. */
+	if (ebc->lut_changed) {
+		ebc->lut_changed = false;
+		regmap_bulk_write(ebc->regmap, EBC_LUT_DATA,
+				  ebc->lut.buf, EBC_NUM_LUT_REGS);
+	}
+
 	if (global_refresh)
 		rockchip_ebc_global_refresh(ebc, ctx);
 	else
 		rockchip_ebc_partial_refresh(ebc, ctx);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 }
 
 static int rockchip_ebc_refresh_thread(void *data)
@@ -708,6 +763,15 @@ static int rockchip_ebc_drm_init(struct rockchip_ebc *ebc)
 	struct drm_bridge *bridge;
 	int ret;
 
+	ret = drmm_epd_lut_file_init(drm, &ebc->lut_file, "rockchip/ebc.wbf");
+	if (ret)
+		return ret;
+
+	ret = drmm_epd_lut_init(&ebc->lut_file, &ebc->lut,
+				DRM_EPD_LUT_4BIT_PACKED, EBC_MAX_PHASES);
+	if (ret)
+		return ret;
+
 	ret = drmm_mode_config_init(drm);
 	if (ret)
 		return ret;
@@ -810,6 +874,13 @@ static int rockchip_ebc_runtime_resume(struct device *dev)
 	if (ret)
 		goto err_disable_hclk;
 
+	/*
+	 * Do not restore the LUT registers here, because the temperature or
+	 * waveform may have changed since the last refresh. Instead, have the
+	 * refresh thread program the LUT during the next refresh.
+	 */
+	ebc->lut_changed = true;
+
 	regcache_cache_only(ebc->regmap, false);
 	regcache_mark_dirty(ebc->regmap);
 	regcache_sync(ebc->regmap);
@@ -919,6 +990,11 @@ static int rockchip_ebc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ebc->hclk),
 				     "Failed to get hclk\n");
 
+	ebc->temperature_channel = devm_iio_channel_get(dev, NULL);
+	if (IS_ERR(ebc->temperature_channel))
+		return dev_err_probe(dev, PTR_ERR(ebc->temperature_channel),
+				     "Failed to get temperature I/O channel\n");
+
 	for (i = 0; i < EBC_NUM_SUPPLIES; i++)
 		ebc->supplies[i].supply = rockchip_ebc_supplies[i];
 
-- 
2.35.1

