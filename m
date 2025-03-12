Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC567A5E0AE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 16:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF8110E2C5;
	Wed, 12 Mar 2025 15:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NnEdsyWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A690710E315
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 15:41:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso27425355e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1741794082; x=1742398882;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1oEmtbJbAjDfE5NhrrJZgMsbc4ZNOupTbBSety67qvQ=;
 b=NnEdsyWTXrlKpuJuNqjnL/r6h3lgwm0FX8qS8WTJY7iKL2bnQ0qOl9jzaOirqhKgjR
 Elie7hR7LlyxKJfP/1/Dl9ceNNpGLFwe3F1zncKr1a3EgHa6/AU/epJZX5+pwpTnjV/y
 WADzQKN90YFtLmxZ0XhP2d3jhm2ZoSKQLrohEQ3JMvxCw11zXa9PSRnCJVQ+8m1wctu9
 VAh2Sux+xNSyuE6oPkM1093afBqCEittoLiOACpjlfLbCqVP4CzXDfbqopCetFkz6qAq
 e4B81QbC2/H+c4/kEkZhKisezTV0k6ki93ScuwT3AqDZXq++qVgFauXk7/kQR8aKC5rD
 EJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741794082; x=1742398882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1oEmtbJbAjDfE5NhrrJZgMsbc4ZNOupTbBSety67qvQ=;
 b=weECIj9Y+qco3Fi1zqlrJ0xRTaUjQrn1uajz+DmSDezHR47u0Xx+lyqDqBTEaCuNtA
 EozcgUfudIkjZlthhzFEIjGo5/UhgbRA5KaAloXTj4Fm5LB9TPRPslyw2lmZM9gbCMnl
 qOgp4JLzaKFEyb5WVuj7QKUIeAHkwQWyakXVL3eJlT0uIZWKacRD/kJfYFq+tKWEoGd0
 A3yhvKWhLkT2EqKRA5jvIPXfWR3BsCKa94KbxvPVBF11dmbqgvRmvsM1TIrFx9kAVMtn
 DbGp7sdjC9bx8QZm439iqXenEZeGvfDjD0LcO3szz/IoNyuiLTzCL22UV4hbbXPngM7q
 NB+Q==
X-Gm-Message-State: AOJu0Yxjdnu8qkqFLl1drmVJr8UzoXk9zjE4FrPK3l0VzP5Ou5EU8X93
 0mpuErVFyPNMAY4gmwFpp4XiBvwwHMUgq8KH3MfG6jtuFEhCCCXjBqjXbqE+7O0=
X-Gm-Gg: ASbGncvFyChQuVT5IiJLbDiZVRzSxVv6KqrxBLTtQKxlzXrIxnAHfKH3JGfkDgIWaIa
 ZfrqPH7Fu+IRvebPFEuTjZ2jegkDYAq9iXCIXOHdwTrh7YiwBezEmlwHGQ8ryrfOtHWxWBFndgy
 O/wGFyISuY+cP1UQC1yTMAMt0HhjjIk310DUXN3rU9BaiGe0hCiq11HaoEYgk8QawonWInqbFK0
 tF2KYcg5caaYBn2Cbtb0WzK9N+1hqKCw0Iz1LeUvC6GslqsCAJHcZwCRYdXeYfIFDnXns/cCyrV
 5nS8aGNe+i2uSGJ4IGoxSARz9j7bL19qlmv/bA4x5TEV
X-Google-Smtp-Source: AGHT+IEuj+E29WQ/OOpJvqQ3EDVSbJiu5HyHbTRxHeTQ9s89qRgpRlIWvsn6eHPGJl3Ru6tmiOdhpg==
X-Received: by 2002:a05:600c:3b94:b0:43c:f8fc:f69a with SMTP id
 5b1f17b1804b1-43cf8fcf902mr113708705e9.4.1741794082171; 
 Wed, 12 Mar 2025 08:41:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a78bdbfsm24374915e9.25.2025.03.12.08.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 08:41:21 -0700 (PDT)
From: David Turner <david.turner@raspberrypi.com>
Date: Wed, 12 Mar 2025 15:40:56 +0000
Subject: [PATCH v3 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-vc4_hotplug-v3-2-d75878677de8@raspberrypi.com>
References: <20250312-vc4_hotplug-v3-0-d75878677de8@raspberrypi.com>
In-Reply-To: <20250312-vc4_hotplug-v3-0-d75878677de8@raspberrypi.com>
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

