Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74128B3DD2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6C510EAD3;
	Fri, 26 Apr 2024 17:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OicFOEJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2133710ECC4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:22:56 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2db2f6cb312so37410451fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 10:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152174; x=1714756974;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GUTru9dNvbOZnap79Kg3Bs9o0ntjZ8kzNc6IEqec/oQ=;
 b=OicFOEJM1ZhkO+uEO516LTscEVkmce0Zmn1fFQgrHc/CdmUNZFAGGnWmWP/ZiDZyvB
 Lr600MyuVhVHE4E92i9yG/C+x9ITlcWYCtsxdA8olFNIpWuQ4+vDwUL3I8pt+mjVK3T1
 PA/W7tfB/kGPe1rQMLCOXAKk7vJuXNBVe5huIocMJ8m2iRILL9WJVdON1/bjnxpfKDyz
 eXmsmH5u5X5rJQIM9yoWtLF03fjoGU4pW+ms9fYT6YwMDMLeB3J9I+sXLv7YAInafJ+j
 S+vI1GOB+rNYTLUf4eeLu7rqAABQ/SCZa7zZ0UUa7HVRS3mfQpzVtWmgKpA6bQ4R/4pV
 is+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152174; x=1714756974;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUTru9dNvbOZnap79Kg3Bs9o0ntjZ8kzNc6IEqec/oQ=;
 b=Ms6ivjil7eeBNvmtD/oHARCkEIzItjHQs2lguH7tVem0bx6/AD9azcNhipmJrlGIGV
 UXJUwn9ZgXmB063NaD+GqK4C0zpIKAdA0F55a6HF9Tr631J2jeXygcgYT7xcSnzqkLBL
 R77jIeiPYyKWSihz45u4y3zq7KR6ggnlmfWZn/M7b8MlnEhGJGaemEbePGAOLHYvvHxs
 wdNbi5feV8jrtAvYcsf7Kw1YyW4JynVmQx6q6UZ+ABrmC0k9krAHFP7viMxjnFdsLcdA
 CJl0lhYSpdd1zj0Jkubjpm9KOd1deIiciUQLtmKo5Zj4dPfz19Y92b3U0suodWW4lA5a
 Y8XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9rdfQdpnkdw0hKcN6FhYvPD9xdo+LXNIKSj1tyjdaHmsHPtH/4UhS6VddT2cx6hp1wsECQAw9/fivq7qCcHDEx709Ui0j1du7ratPV4JX
X-Gm-Message-State: AOJu0Yzl7Ynh/R0htuuNv4uBWtYeK08XSdVpxv/HFu2TAnzmxCHkyqK7
 qp9qAIHaTygh3TIqzJfC9f7jlSE0FJ+mKp1NA4Fmn+RnUqmxflA420ez1Er1HY8=
X-Google-Smtp-Source: AGHT+IE9Quwpp+FijGTfbiWDErxuCbULqiEH0XE97aZl1m+CkKfz3I7b0B2fblJfORGtiH2amWMFmw==
X-Received: by 2002:a2e:240c:0:b0:2da:7934:768e with SMTP id
 k12-20020a2e240c000000b002da7934768emr2603827ljk.36.1714152174199; 
 Fri, 26 Apr 2024 10:22:54 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:22:53 -0700 (PDT)
From: amergnat@baylibre.com
Date: Fri, 26 Apr 2024 19:22:39 +0200
Subject: [PATCH v4 10/16] ASoc: mediatek: mt8365: Add a specific soundcard
 for EVK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-10-082b22186d4c@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
In-Reply-To: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10412;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=0UPcZkgr308KuygIWUDkwBxgLyTPcSFCeyaFlNvD8aw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaZm4+fKYL2jgxyCW+j7vR8Wp/wfh720tHw+mq
 tnYFJ5eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURS3rD/
 sF/dxL32T+Agesz7v2ESjvQ/2Yvx2D82rwYUQZunaSXcrkqsATwnEVEe/GdD1TIkIb//d6bpforZj2
 KVln7Vaoh2Ikgz1mvtYf9dYjNErv2muEqArqLUUkoreldsZmwqeNFyW0XzzOPrhRP63y0wz4QYCTI4
 wPI44eOQeXzCb2kQdPl4uVN4OOfqy9lxzr7AAkFLU06oAHmzAGzMPXyakh2yzQ9G5sNgAy4CGFmyPn
 XYcSeg++p6xLOm3bzwO54NEH3SG/wHH4SB7lhehU26c+qV5XWeIu6CPcAOEWtAMaHPbH2sfOePkmkJ
 Yl1EurGIgh2iC5MRupsNMmnkvrkI/nL5IXFqggBgxLGNI/gvY/sUkzGtHG2Ay2kcjdjrMTL9H/jPjc
 G4Yo/OQqghqI85Gq2sp187e9zebMHqDBuz+mAHG8guQSXMswE9Igm/k6Eaq3OSJtexcZiR1z6w4mqk
 1E2t95nJm75nKEW2wHQI0AJOs980r4R0wDz8iqFqk9ZScJ9wC503i0RraHjkGxzpIRv5uxuiDW87Oh
 gsn8Kny0eec5VoKk9f/1mNs7XYFQTjkMwLtoCnXji5SVARBG0mFwKfOSGfa3LRaws8uvgHZ44BCIvH
 Sw+2xqOCzbhkoZuFrur2a65XMn15WXxVKjUXvQLG4TPJqFCEIDmXMg0678qg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

From: Nicolas Belin <nbelin@baylibre.com>

Add a specific soundcard for mt8365-evk. It supports audio jack
in/out, dmics, the amic and lineout.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 348 ++++++++++++++++++++++++++++++
 1 file changed, 348 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
new file mode 100644
index 000000000000..a65f668103da
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek MT8365 Sound Card driver
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Nicolas Belin <nbelin@baylibre.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include "mt8365-afe-common.h"
+#include <linux/pinctrl/consumer.h>
+#include "../common/mtk-soc-card.h"
+#include "../common/mtk-soundcard-driver.h"
+
+enum pinctrl_pin_state {
+	PIN_STATE_DEFAULT,
+	PIN_STATE_DMIC,
+	PIN_STATE_MISO_OFF,
+	PIN_STATE_MISO_ON,
+	PIN_STATE_MOSI_OFF,
+	PIN_STATE_MOSI_ON,
+	PIN_STATE_MAX
+};
+
+static const char * const mt8365_mt6357_pin_str[PIN_STATE_MAX] = {
+	"default",
+	"dmic",
+	"miso_off",
+	"miso_on",
+	"mosi_off",
+	"mosi_on",
+};
+
+struct mt8365_mt6357_priv {
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pin_states[PIN_STATE_MAX];
+};
+
+enum {
+	/* FE */
+	DAI_LINK_DL1_PLAYBACK = 0,
+	DAI_LINK_DL2_PLAYBACK,
+	DAI_LINK_AWB_CAPTURE,
+	DAI_LINK_VUL_CAPTURE,
+	/* BE */
+	DAI_LINK_2ND_I2S_INTF,
+	DAI_LINK_DMIC,
+	DAI_LINK_INT_ADDA,
+	DAI_LINK_NUM
+};
+
+static const struct snd_soc_dapm_widget mt8365_mt6357_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("HDMI Out"),
+};
+
+static const struct snd_soc_dapm_route mt8365_mt6357_routes[] = {
+	{"HDMI Out", NULL, "2ND I2S Playback"},
+	{"DMIC In", NULL, "MICBIAS0"},
+};
+
+static int mt8365_mt6357_int_adda_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	int ret = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MOSI_ON]))
+			return ret;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MOSI_ON]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MISO_ON]))
+			return ret;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MISO_ON]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	return 0;
+}
+
+static void mt8365_mt6357_int_adda_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	int ret = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MOSI_OFF]))
+			return;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MOSI_OFF]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (IS_ERR(priv->pin_states[PIN_STATE_MISO_OFF]))
+			return;
+
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_MISO_OFF]);
+		if (ret)
+			dev_err(rtd->card->dev, "%s failed to select state %d\n",
+				__func__, ret);
+	}
+}
+
+static const struct snd_soc_ops mt8365_mt6357_int_adda_ops = {
+	.startup = mt8365_mt6357_int_adda_startup,
+	.shutdown = mt8365_mt6357_int_adda_shutdown,
+};
+
+SND_SOC_DAILINK_DEFS(playback1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(playback2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(awb_capture,
+		     DAILINK_COMP_ARRAY(COMP_CPU("AWB")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(vul,
+		     DAILINK_COMP_ARRAY(COMP_CPU("VUL")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("2ND I2S")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(dmic,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DMIC")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(primary_codec,
+		     DAILINK_COMP_ARRAY(COMP_CPU("INT ADDA")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6357-sound", "mt6357-snd-codec-aif1")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* Digital audio interface glue - connects codec <---> CPU */
+static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
+	/* Front End DAI links */
+	[DAI_LINK_DL1_PLAYBACK] = {
+		.name = "DL1_FE",
+		.stream_name = "MultiMedia1_PLayback",
+		.id = DAI_LINK_DL1_PLAYBACK,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback1),
+	},
+	[DAI_LINK_DL2_PLAYBACK] = {
+		.name = "DL2_FE",
+		.stream_name = "MultiMedia2_PLayback",
+		.id = DAI_LINK_DL2_PLAYBACK,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(playback2),
+	},
+	[DAI_LINK_AWB_CAPTURE] = {
+		.name = "AWB_FE",
+		.stream_name = "DL1_AWB_Record",
+		.id = DAI_LINK_AWB_CAPTURE,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(awb_capture),
+	},
+	[DAI_LINK_VUL_CAPTURE] = {
+		.name = "VUL_FE",
+		.stream_name = "MultiMedia1_Capture",
+		.id = DAI_LINK_VUL_CAPTURE,
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST
+		},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.dpcm_merged_rate = 1,
+		SND_SOC_DAILINK_REG(vul),
+	},
+	/* Back End DAI links */
+	[DAI_LINK_2ND_I2S_INTF] = {
+		.name = "I2S_OUT_BE",
+		.no_pcm = 1,
+		.id = DAI_LINK_2ND_I2S_INTF,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+				SND_SOC_DAIFMT_NB_NF |
+				SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(i2s3),
+	},
+	[DAI_LINK_DMIC] = {
+		.name = "DMIC_BE",
+		.no_pcm = 1,
+		.id = DAI_LINK_DMIC,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(dmic),
+	},
+	[DAI_LINK_INT_ADDA] = {
+		.name = "MTK_Codec",
+		.no_pcm = 1,
+		.id = DAI_LINK_INT_ADDA,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8365_mt6357_int_adda_ops,
+		SND_SOC_DAILINK_REG(primary_codec),
+	},
+};
+
+static int mt8365_mt6357_gpio_probe(struct snd_soc_card *card)
+{
+	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(card);
+	int ret, i;
+
+	priv->pinctrl = devm_pinctrl_get(card->dev);
+	if (IS_ERR(priv->pinctrl)) {
+		ret = PTR_ERR(priv->pinctrl);
+		return dev_err_probe(card->dev, ret,
+				     "Failed to get pinctrl\n");
+	}
+
+	for (i = PIN_STATE_DEFAULT ; i < PIN_STATE_MAX ; i++) {
+		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
+							   mt8365_mt6357_pin_str[i]);
+		if (IS_ERR(priv->pin_states[i])) {
+			ret = PTR_ERR(priv->pin_states[i]);
+			dev_warn(card->dev, "No pin state for %s\n",
+				 mt8365_mt6357_pin_str[i]);
+		} else {
+			ret = pinctrl_select_state(priv->pinctrl,
+						   priv->pin_states[i]);
+			if (ret) {
+				dev_err_probe(card->dev, ret,
+					      "Failed to select pin state %s\n",
+					      mt8365_mt6357_pin_str[i]);
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+static struct snd_soc_card mt8365_mt6357_soc_card = {
+	.name = "mt8365-evk",
+	.owner = THIS_MODULE,
+	.dai_link = mt8365_mt6357_dais,
+	.num_links = ARRAY_SIZE(mt8365_mt6357_dais),
+	.dapm_widgets = mt8365_mt6357_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8365_mt6357_widgets),
+	.dapm_routes = mt8365_mt6357_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8365_mt6357_routes),
+};
+
+static int mt8365_mt6357_dev_probe(struct mtk_soc_card_data *soc_card_data, bool legacy)
+{
+	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
+	struct snd_soc_card *card = card_data->card;
+	struct device *dev = card->dev;
+	struct device_node *platform_node;
+	struct mt8365_mt6357_priv *mach_priv;
+	int i, ret;
+
+	card->dev = dev;
+	ret = parse_dai_link_info(card);
+	if (ret)
+		goto err;
+
+	mach_priv = devm_kzalloc(dev, sizeof(*mach_priv),
+				 GFP_KERNEL);
+	if (!mach_priv)
+		return -ENOMEM;
+	soc_card_data->mach_priv = mach_priv;
+	snd_soc_card_set_drvdata(card, soc_card_data);
+	mt8365_mt6357_gpio_probe(card);
+	return 0;
+
+err:
+	clean_card_reference(card);
+	return ret;
+}
+
+static const struct mtk_soundcard_pdata mt8365_mt6357_card = {
+	.card_name = "mt8365-mt6357",
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8365_mt6357_soc_card,
+	},
+	.soc_probe = mt8365_mt6357_dev_probe
+};
+
+static const struct of_device_id mt8365_mt6357_dt_match[] = {
+	{
+		.compatible = "mediatek,mt8365-mt6357",
+		.data = &mt8365_mt6357_card,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mt8365_mt6357_dt_match);
+
+static struct platform_driver mt8365_mt6357_driver = {
+	.driver = {
+		   .name = "mt8365_mt6357",
+		   .of_match_table = mt8365_mt6357_dt_match,
+		   .pm = &snd_soc_pm_ops,
+	},
+	.probe = mtk_soundcard_common_probe,
+};
+
+module_platform_driver(mt8365_mt6357_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("MT8365 EVK SoC machine driver");
+MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform: mt8365_mt6357");

-- 
2.25.1

