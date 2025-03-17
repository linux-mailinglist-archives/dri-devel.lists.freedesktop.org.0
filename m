Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54484A65A05
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A40810E433;
	Mon, 17 Mar 2025 17:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YihcIVyy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCAC10E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:13:36 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so15010315e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1742231615; x=1742836415;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IDlaYwRgBjONniOC+WQROb7al/p94+af7oPPA6nLeCw=;
 b=YihcIVyyblReoxmXB5FLwOPPvWpkUYzYEPs0phXRVKJAYSvXVujRNGSKBJvlru8MmO
 SpwLmTzjWwpjoKeqY9iSPBBbFvw2hpgzxhoNNd2DEk3JvpinyFjhJXgKjCpFc41VIqvT
 w2ONZFh8wAk2tFvSHQ2KZKUq6km81p1ljkxX3YD317Wrq09MStBAObF6uBNS2EYLKQ+8
 uOAJGLB6lZNRcy4p5QTWcV31YG39QuaVLHCWgf0h2y2R32Ocb29JIrOjBKnPa3GydEk1
 PMfNMlLeihEmEKw+9flCDWz2kt3wt63SVO2wmHdwG8fc96kZb0PJGmIh2HDL/dITdtRR
 pQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742231615; x=1742836415;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IDlaYwRgBjONniOC+WQROb7al/p94+af7oPPA6nLeCw=;
 b=ixZsnplSO4vRwwM00vDfwjJFj+5mNT1nG1P5aG1fuVK2WEXjdBpvMS+aV34OumqpYu
 y01yP/yLWwOMrzXSDKu4awYqhFs3kAoTs3PwdSb6PRjE1afnMzLpE2AdOFtI+gQZZaR2
 avcR+ydyXQ4FiPAQhd/i3pyS1wEVYVoWz8TEGSeBjHkW3iV9hTFDAEfGNT433uQX81Bm
 zHpJokS00PfEOmzVL20vectKdKOrYedRKWT7DQbBBakBAtCOycUUM45nvi39GRRa5OqK
 h5Uk38tSy3se9knbD2W/doblEqBMpfhDHP70LZtIu0W6gdcW1UI/4zuRuUN4a4rMgb2j
 t0lw==
X-Gm-Message-State: AOJu0YwIellh1jQRGXqUdNWvZPmZgF0hHTmFyG/faro8607BfyIFpner
 XC7Aih3wS/gpT7MlJbvfN5R7joStV6NoCWb5A6bxUp5XHpMDH7qKIdCmbrLy7Xc=
X-Gm-Gg: ASbGnctnCZUV9XWEyeVLyIL9DYUspA/nGajh5z6L5a+kcUqAI6CVJFqKdYqFsl9F2yD
 lo5Ul/bo6qQtvtipnLsMf4aTikccGohpJIL2oNVompPgMrQ0U3rv/+xwTSLXFtSz2NRd5SA2+uJ
 4jXpIQAMH0C1/zMJg4lpgN/furgk6us9gvE7KM/rEPE5TftXivM85a0X7F7AiMIobXvWS7zBKDJ
 OlWuY/c9WSGms/o1xlrugJSZLpuHLhmUU9lgOpkVfBg/67SJYobTjyw3zjxgjh/AMl/4sY/LiXL
 PYnYx6XoVP64M+aSq84V8qYXOIcNFJ+kPA==
X-Google-Smtp-Source: AGHT+IFvMG8C/DswjrgMcrIcB5vcUNJhIfY6inhq7RlXMQ5STO4yZJWkrfjDg2k3WPUIILjObGT+xQ==
X-Received: by 2002:a05:600c:511c:b0:43c:fbba:41ba with SMTP id
 5b1f17b1804b1-43d1ecd60c1mr126561595e9.28.1742231614956; 
 Mon, 17 Mar 2025 10:13:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdda15dsm112003365e9.3.2025.03.17.10.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:13:34 -0700 (PDT)
From: David Turner <david.turner@raspberrypi.com>
Date: Mon, 17 Mar 2025 17:12:24 +0000
Subject: [PATCH v4 3/3] drm/vc4: hdmi: Add jack detection to HDMI audio driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-vc4_hotplug-v4-3-2af625629186@raspberrypi.com>
References: <20250317-vc4_hotplug-v4-0-2af625629186@raspberrypi.com>
In-Reply-To: <20250317-vc4_hotplug-v4-0-2af625629186@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Turner <david.turner@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>
X-Mailer: b4 0.14.2
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

Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
when to add/remove HDMI audio devices.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: David Turner <david.turner@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 18 ++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 37a7d45695f236d3ab281d9a8676921fd434955c..a29a6ef266f9a5952af53030a9a2d313e2ecdfce 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -51,6 +51,7 @@
 #include <linux/reset.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/hdmi-codec.h>
+#include <sound/jack.h>
 #include <sound/pcm_drm_eld.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -2175,6 +2176,22 @@ static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
 	.shutdown = vc4_hdmi_audio_shutdown,
 };
 
+static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct vc4_hdmi *vc4_hdmi = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &vc4_hdmi->hdmi_jack);
+	if (ret) {
+		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NULL);
+}
+
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =
@@ -2288,6 +2305,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	dai_link->cpus->dai_name = dev_name(dev);
 	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_audio.codec_pdev->dev);
 	dai_link->platforms->name = dev_name(dev);
+	dai_link->init = vc4_hdmi_codec_init;
 
 	card->dai_link = dai_link;
 	card->num_links = 1;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..a31157c99bee6b33527c4b558fc72fff65d2a278 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -4,6 +4,7 @@
 #include <drm/drm_connector.h>
 #include <media/cec.h>
 #include <sound/dmaengine_pcm.h>
+#include <sound/hdmi-codec.h>
 #include <sound/soc.h>
 
 #include "vc4_drv.h"
@@ -211,6 +212,12 @@ struct vc4_hdmi {
 	 * KMS hooks. Protected by @mutex.
 	 */
 	enum hdmi_colorspace output_format;
+
+	/**
+	 * @hdmi_jack: Represents the connection state of the HDMI plug, for
+	 * ALSA jack detection.
+	 */
+	struct snd_soc_jack hdmi_jack;
 };
 
 #define connector_to_vc4_hdmi(_connector)				\

-- 
2.34.1

