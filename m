Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82E8A757B0
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 20:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E5D10E2D8;
	Sat, 29 Mar 2025 19:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="e6auzWai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6F110E2D8
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 19:14:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e673822f76so5394325a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 12:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1743275682; x=1743880482;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k4qdQmtdze7x4J+KlNeJtAH6STgJ/ut+25HlOxXn6Nc=;
 b=e6auzWairuo8Z/olzPgG599h3zYYrqoK9n3oIIhV8nIkXuJWB/5+Nzcrgms2v/hqsy
 eYoanMmuFq8TG5H1JAkrYonRydlSCJrJh7ITY+Ufn8SDl8q6J9OkT5n+e34gCpksBH4E
 PdFrmqCMJHLSmfnE5i8XFi2D55tk9IYxtCtOEGlyJvibSmLZQ7qou+JWyUobtgsEniLG
 R4DQW+koWA02OkOjyoj6Ksqq+8x7qm0EtPyEUp+bu8fyoB5eBszgFfvdz8c85CnTgEov
 y8Sogmsuoq05A3JEnsz4OYuz4U7vQrh7tol66wa2iIbSozq0Lvz1FBM3YTikje/sfXbC
 OBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743275682; x=1743880482;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k4qdQmtdze7x4J+KlNeJtAH6STgJ/ut+25HlOxXn6Nc=;
 b=S59PoGhun5ft2FRahNhSCLNf4HgKH2us88i56d7tdyB6Rjwieue6ON0CBjW/jOX+gI
 apJNQGLiGTUr768J9e3P5Q+AIa5l116wA260hq7Vg1ljculwm3FqDkqZZ/rqQYwF4cWE
 nGSXQ2CU6qquMU/3+XrnIot+lhjbzI6UhcPAT/JhIQ+IPx0E99M4c85hCLBVJZrM5GPd
 dMSyrIqFWDNxPcki8i4TAmek+LVNK4E0CEaCMIRFStpqcgtGkUmh8OBji8YYoblFci5g
 Fqsht3TJjm0BRAUyxpFondQbkieVKo3Ehv2uRW3xOwRqx4SMZ9Dwx9WoUXbyvoJNTZ8G
 AdYA==
X-Gm-Message-State: AOJu0YxGr272GCNNo08XgRxbGxsltmabsv87L/jSj1byILq9AxdDNfLr
 LUCKzdWSpgnMqJsWPRMuuM52OL/8LY9ad76zQR+A8d1F1bYpx7jU1fck3w==
X-Gm-Gg: ASbGncsob1eUomX6v/j39F+v0KOj6ur6yUPy2Kv+GnYXjvurU6G3N2uwcU578rtXxpL
 1+uHM5D6+jzCc7pdAzz2zqTog7Q19WfBWUxfLOlhc49bt/myShzLTbEsvSal5W47/sX3EmFLK2O
 rSkCty6tSiVLgJYs2FqXs8oH9zq4yqSc/E9eh65+XJqjHgbpQ5Cs8quABiYS8pZU8ctiFtnzYxN
 G2kog7xO++0ED1cWWeYqRh9bBkiAneUImsZf3EGr7p/EfZumcwWeBy9ARxv9wubHCqGoZLxs0hd
 K2O/UIxJ4XzaN0NX/EmDymFqvVvUsaRr/kScQCTzLS6HDh1GZFD9yoyivojqFxnBTn/1/hebrxK
 +e1cRRHlzQZfUEbTCNX4mQ+Rih1nXPRl6WAu7vK9qW24eEOC/BpQ8YcsfyMSo6UXclYdLqBAnGd
 B27ac2
X-Google-Smtp-Source: AGHT+IGKSSVjR4jmVEM1dPlaS/R+l5YVQlq5r7CWXRElqfgt1HNgA0wl2mVf2UCJ7eOqQ2c6wzoLXw==
X-Received: by 2002:a17:907:7e82:b0:ac1:effd:f2ea with SMTP id
 a640c23a62f3a-ac738a82f63mr347131966b.24.1743275681354; 
 Sat, 29 Mar 2025 12:14:41 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de.
 [2a02:3100:ad73:6800::e63]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc17b2ab3sm3327592a12.52.2025.03.29.12.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 12:14:40 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org
Cc: mperttunen@nvidia.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2] ASoC: hdmi-codec: wire up the .prepare callback also for
 SPDIF DAI ops
Date: Sat, 29 Mar 2025 20:14:33 +0100
Message-ID: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
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

Commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare hook") added a
prepare implementation. Back then the new callback was only integrated
with hdmi_codec_i2s_dai_ops (which is used by the I2S input code-path).
It was not added to hdmi_codec_spdif_dai_ops (which is used by the SPDIF
input code-path).

With commit baf616647fe6 ("drm/connector: implement generic HDMI audio
helpers") the DRM subsystem has gained a helper framework which can be
used by HDMI controller drivers. HDMI controller drivers are often
tightly coupled with the hdmi-codec because of the so-called HDMI audio
infoframe (which is often managed by the display controller).

To allow the new DRM HDMI audio framework to work with the hdmi-codec
driver for SPDIF inputs we also need to hook up the prepare callback to
hdmi_codec_spdif_dai_ops. Just hooking into the hw_params callback would
not be enough as hw_params (is called too early and) doesn't have access
to the HDMI audio infoframe contents.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1 at [0]:
- re-sending since there was no feedback


The following three upstream drivers can use the hdmi-codec with SPDIF
inputs:
- drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
- drivers/gpu/drm/rockchip/cdn-dp-core.c
- drivers/gpu/drm/tegra/hdmi.c

It would be great if any of the maintainers of these platforms (Cc'ed)
could confirm that this patch doesn't break anything.

Mark, Dmitry: who of you would take this patch (Mark via the ASoC
tree or Dmitry via drm-misc)?


[0] https://lore.kernel.org/dri-devel/20250105162407.30870-1-martin.blumenstingl@googlemail.com/


 sound/soc/codecs/hdmi-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 17019b1d680b..8bd125e18a7f 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -1010,6 +1010,7 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 	.startup	= hdmi_codec_startup,
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
+	.prepare	= hdmi_codec_prepare,
 	.mute_stream	= hdmi_codec_mute,
 	.pcm_new	= hdmi_codec_pcm_new,
 };
-- 
2.49.0

