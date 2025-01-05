Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB1A01A8E
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 17:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC31710E03B;
	Sun,  5 Jan 2025 16:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="LEnzgZuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1152610E03B
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 16:25:39 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aab925654d9so2398248266b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 08:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1736094277; x=1736699077;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2QXCym+qURZLKUjiCAQJjwuz9Yk/HpcW0NRBFsoncNQ=;
 b=LEnzgZuwijYAr8SAO3xGEIMioJmfsOqgkJK+jA9NX0qSFvG0CtSM1plFoSEiVEhMMm
 MwoHLi87TiqgMI4O4DRPPTfiNAEcNL1TxfxZVG1s0PXHP0Ahr2rmufuNakpy4NSrYwur
 qxPWs6bAGURepqkBA0wtYV/22n7BmP3i5pufW7igdOYKFvRDdL4g22kW2CeDh9SlD2qK
 duMI/e/Uq08+kYNVUY8KQS7GTmVewCi6nS9TDd3VMj/88zJuMY3dZsg2xPi1LwYy+q0W
 77cRfe2YzswiacLlmieliFbh/dufkiOOkxib9m4j34Zgta5hts1Frgr+vY/1pBekFQ+f
 FG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736094277; x=1736699077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2QXCym+qURZLKUjiCAQJjwuz9Yk/HpcW0NRBFsoncNQ=;
 b=k8yT6FClZfV+gdZGrlTraAjB8Kk8RRxu6f2JxJpXFv/EQCCvNr7N1R9gAY0093Y9n+
 +NFAyZm+q3+HsAXs7v19YeWzWkC+9uEzt+S9YoWFSPzwXB2v3xRqsYgNSSRwOBY/XozC
 5yl/iMrLGwY4Ajl/r4YzXcLhWIDgD+hYbsc3BqEkoelz6G1hIIz1ttNMASEpxtRM+8sd
 tnKrMDhsM3pa8Xe6SO0qWmcyCcI7wLE2dSwYkYCcnFj9ldVzo0VKT4pnC2yhwkBj/LSZ
 13SYkgZ+shqx3Ozo8LeoqmsXtqxBzduVtbbcRSAD69MwQPB8K88HGwdWKlxnHj5ZpPUU
 gY1A==
X-Gm-Message-State: AOJu0Yw1tHgyRXZJZS074t47B8sSxMcmQ+GSZigty8HjwLUymlWZirU4
 XJ2Fr5wKH1FkOtbbxMEYXif40SF9x+QA1eInTssnZ1lG9xumaeAOgLr1pg==
X-Gm-Gg: ASbGncvJ+qp7rYcP7f3KiwqUskmc7sw1v1dwb2ASbQmzsuNk7yoI4J3gXwxdZDOwHa/
 +/LJv8wjTw4aawkzWr3zkFZBZtcarimlkn6tmFf3paWNAC6Xjj++XtpWlUnAdNj8xmZg08vjGDk
 Vhlc1e7f9+aGFXvZWBo21Zhv92TlupKWt4NgPvv/SUFu2rkCGW0GpOAXC3wOw8B18IMADGqUSJ8
 NrRPJJovdZdkeEIGIOPMceBpe9mzhXMMYLgrSMBzw94WvFD79eWWJLHwBgxplCMJLafdqXowVFl
 q5kA4wA+IEQYgHE9ngL6GQoPj4Hrr8csfIfLZH4PzJquTTVv3HyHOhYyNJgVlUM3BriYNI39ijn
 qhbNw08I=
X-Google-Smtp-Source: AGHT+IHOgRt1x/8zuainB/CGlv8dqT970cd91R3y1Tf4vEV7SB96d0jKzjWhEjt5kmSD26M8WWxk9g==
X-Received: by 2002:a17:906:730f:b0:aab:de31:52d0 with SMTP id
 a640c23a62f3a-aac2b28ee4dmr6142740866b.18.1736094276643; 
 Sun, 05 Jan 2025 08:24:36 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a02-3100-ac0a-d800-0000-0000-0000-0e63.310.pool.telefonica.de.
 [2a02:3100:ac0a:d800::e63]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-aac0e8953b6sm2164707666b.65.2025.01.05.08.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 08:24:36 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org
Cc: mperttunen@nvidia.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFT PATCH v1] ASoC: hdmi-codec: wire up the .prepare callback also
 for SPDIF DAI ops
Date: Sun,  5 Jan 2025 17:24:07 +0100
Message-ID: <20250105162407.30870-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
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
The following three upstream drivers can use the hdmi-codec with SPDIF
inputs:
- drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
- drivers/gpu/drm/rockchip/cdn-dp-core.c
- drivers/gpu/drm/tegra/hdmi.c

It would be great if any of the maintainers of these platforms could
confirm that this patch doesn't break anything.

Mark, since there are a few minor hdmi-codec changes in the drm-misc
tree: will or take this patch through your tree or should Dmitry take
it (he added the other hdmi-codec changes with your Ack in drm-misc)?


 sound/soc/codecs/hdmi-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 69f98975e14a..f485f26b9f57 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -942,6 +942,7 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 	.startup	= hdmi_codec_startup,
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
+	.prepare	= hdmi_codec_prepare,
 	.mute_stream	= hdmi_codec_mute,
 	.pcm_new	= hdmi_codec_pcm_new,
 };
-- 
2.47.1

