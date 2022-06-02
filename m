Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9053B737
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9472C112DFF;
	Thu,  2 Jun 2022 10:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43079112DFF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:31:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB2F5615C7;
 Thu,  2 Jun 2022 10:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBF2C385A5;
 Thu,  2 Jun 2022 10:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654165865;
 bh=+xjiJhmCyJSXO3D1bZ+ifnto2dlV06bjvs8tuO5RbCs=;
 h=From:To:Cc:Subject:Date:From;
 b=ozqqnFWNHUlj/+abXBwP96OpyVcDvsqhZvtumvaoj4kgT+PmCGFClhpToI4PqTD0l
 JZ1J18qe8fu87EUrGHFX5nILiUaSKz7EDO+KIYHfy6swQZUh+4MyW57Ha9CPnIHIJS
 F6dtl+7ytdDfsnEvsVebSz5Wk/SBZaGfS9ZZwPPTWrZz18KTKFPzCt6D4qegrH2mwU
 unA7SAP2fyvhr883Eg24rsY5HHnRYDSgZqutdFwUD6uXqtUsmSVPw3WNHWc4XJ6G6m
 /Zuc3MlL/+gVDwmb8vFqjbAv5G2UhPJ9K1F1Lzuupei10eGSG/xLyrAY3Ns4nDnSUZ
 ZmLsCKRI+G6Sw==
From: Mark Brown <broonie@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Russell King <linux@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: hdmi-codec: Update to modern DAI terminology
Date: Thu,  2 Jun 2022 12:30:29 +0200
Message-Id: <20220602103029.3498791-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6407; h=from:subject;
 bh=+xjiJhmCyJSXO3D1bZ+ifnto2dlV06bjvs8tuO5RbCs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimJBbPr2F/iGON8Bp/xtXObpjb+ZzfkH4OpUOqoj2
 B8Z5NcaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpiQWwAKCRAk1otyXVSH0MzwB/
 4lRO/4xm5W3+hynHMEo9ICEPPreAMk5qE4LaTOTFyvtETIKe1WGE6Df1mOecr6oU+gGdBwbgo4qrVe
 ZQgTTSC0cZtCCRnG3IY7n+23w3SS5PzX+D3onq8bumqinV/hOkhjlsdrR+nEmREkm9NE+8STbdpFnT
 YY5aLB6baZcdovbROMz0U5wGHbTsR4FgTJIwcY1amVD87yQKmbj/dEDE6bKwwaKWwjBMPDXb5g/3bN
 Dtw0ZfooSOejuksYBjgvfjXGOD1kW3KEDpqrCaITNNOl21pc+RT6ls3AUpIbeA3MfAtG7/Jx807ONc
 seq5P46tBNsy+E8Ed6oZc4e0yNRcc0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As part of retiring the old defines used to specify DAI formats update the
hdmi_codec driver to use the modern names, including the variables in the
struct hdmi_codec_daifmt exported to the DRM drivers.

In updating this I did note that the only use of this information in DRM
drivers is to reject clock provider settings, thinking about what this
hardware is doing I rather suspect that there might not be any hardware
out there which needs the configuration so it may be worth considering
just having hdmi-codec support only clock consumer.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/bridge/sii902x.c               |  5 +++--
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |  2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c           |  8 ++++----
 drivers/gpu/drm/i2c/tda998x_drv.c              |  6 +++---
 drivers/gpu/drm/sti/sti_hdmi.c                 |  8 ++++----
 include/sound/hdmi-codec.h                     |  4 ++--
 sound/soc/codecs/hdmi-codec.c                  | 18 +++++++++---------
 7 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 65549fbfdc87..be9736f67542 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -549,8 +549,9 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
 	unsigned long mclk_rate;
 	int i, ret;
 
-	if (daifmt->bit_clk_master || daifmt->frame_clk_master) {
-		dev_dbg(dev, "%s: I2S master mode not supported\n", __func__);
+	if (daifmt->bit_clk_provider || daifmt->frame_clk_provider) {
+		dev_dbg(dev, "%s: I2S clock provider mode not supported\n",
+			__func__);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index f50b47ac11a8..a2f0860b20bb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -45,7 +45,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	u8 inputclkfs = 0;
 
 	/* it cares I2S only */
-	if (fmt->bit_clk_master | fmt->frame_clk_master) {
+	if (fmt->bit_clk_provider | fmt->frame_clk_provider) {
 		dev_err(dev, "unsupported clock settings\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 7655142a4651..10b0036f8a2e 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1594,12 +1594,12 @@ static int hdmi_audio_hw_params(struct device *dev, void *data,
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
 
 	if (daifmt->fmt != HDMI_I2S || daifmt->bit_clk_inv ||
-	    daifmt->frame_clk_inv || daifmt->bit_clk_master ||
-	    daifmt->frame_clk_master) {
+	    daifmt->frame_clk_inv || daifmt->bit_clk_provider ||
+	    daifmt->frame_clk_provider) {
 		dev_err(dev, "%s: Bad flags %d %d %d %d\n", __func__,
 			daifmt->bit_clk_inv, daifmt->frame_clk_inv,
-			daifmt->bit_clk_master,
-			daifmt->frame_clk_master);
+			daifmt->bit_clk_provider,
+			daifmt->frame_clk_provider);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index b7ec6c374fbd..c4fadaecbb2d 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1095,11 +1095,11 @@ static int tda998x_audio_hw_params(struct device *dev, void *data,
 
 	if (!spdif &&
 	    (daifmt->bit_clk_inv || daifmt->frame_clk_inv ||
-	     daifmt->bit_clk_master || daifmt->frame_clk_master)) {
+	     daifmt->bit_clk_provider || daifmt->frame_clk_provider)) {
 		dev_err(dev, "%s: Bad flags %d %d %d %d\n", __func__,
 			daifmt->bit_clk_inv, daifmt->frame_clk_inv,
-			daifmt->bit_clk_master,
-			daifmt->frame_clk_master);
+			daifmt->bit_clk_provider,
+			daifmt->frame_clk_provider);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index b3fbee7eac11..622d0dfe7bb9 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1175,12 +1175,12 @@ static int hdmi_audio_hw_params(struct device *dev,
 	DRM_DEBUG_DRIVER("\n");
 
 	if ((daifmt->fmt != HDMI_I2S) || daifmt->bit_clk_inv ||
-	    daifmt->frame_clk_inv || daifmt->bit_clk_master ||
-	    daifmt->frame_clk_master) {
+	    daifmt->frame_clk_inv || daifmt->bit_clk_providre ||
+	    daifmt->frame_clk_provider) {
 		dev_err(dev, "%s: Bad flags %d %d %d %d\n", __func__,
 			daifmt->bit_clk_inv, daifmt->frame_clk_inv,
-			daifmt->bit_clk_master,
-			daifmt->frame_clk_master);
+			daifmt->bit_clk_provider,
+			daifmt->frame_clk_provider);
 		return -EINVAL;
 	}
 
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 4fc733c8c570..48ad33aba393 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -32,8 +32,8 @@ struct hdmi_codec_daifmt {
 	} fmt;
 	unsigned int bit_clk_inv:1;
 	unsigned int frame_clk_inv:1;
-	unsigned int bit_clk_master:1;
-	unsigned int frame_clk_master:1;
+	unsigned int bit_clk_provider:1;
+	unsigned int frame_clk_provider:1;
 	/* bit_fmt could be standard PCM format or
 	 * IEC958 encoded format. ALSA IEC958 plugin will pass
 	 * IEC958_SUBFRAME format to the underneath driver.
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index b773466619b2..7d1e351f863a 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -606,18 +606,18 @@ static int hdmi_codec_i2s_set_fmt(struct snd_soc_dai *dai,
 	/* Reset daifmt */
 	memset(cf, 0, sizeof(*cf));
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		cf->bit_clk_master = 1;
-		cf->frame_clk_master = 1;
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		cf->bit_clk_provider = 1;
+		cf->frame_clk_provider = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
-		cf->frame_clk_master = 1;
+	case SND_SOC_DAIFMT_CBC_CFP:
+		cf->frame_clk_provider = 1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
-		cf->bit_clk_master = 1;
+	case SND_SOC_DAIFMT_CBP_CFC:
+		cf->bit_clk_provider = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.30.2

