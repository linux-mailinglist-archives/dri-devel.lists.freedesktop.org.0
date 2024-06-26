Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC42B9183DB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D6A10E8D7;
	Wed, 26 Jun 2024 14:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vOCcSQJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B46710E8D7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:22:34 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so77209141fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719411752; x=1720016552;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSOqd6xFtwNmB6/la0EhwilFZVmFb3e1mPm8GFnYuuc=;
 b=vOCcSQJgqs6EzrKmpdJDI1yuFQPgoDxRSM+SyAMHyJaDswIcNQkjH5BURIUeyGs24R
 YhpadhIqkBUL6+Sulmwe/9yxhqhoU4SpljtqSkiXNZ/BRuScqrpxHiRnNTSEspz+HTKP
 8riQULtxBWrjS/y+0kjC/VBF9pnZFHbVCbcmMxJRKixHq5l7XxSzq3tC7uGx7XApBiYH
 FhD+W58R9uMbqm/FXqtkyTu+uZhdgrWLiFZLHUvDyu8SUztU5S8EPbUOa2tQZCB/GbGy
 XccdTEbheg4axI05adOjt+2ovz/4/ipOG04waov9r1gULREMSxByjM+Dj7nsHoaotRJB
 py/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719411752; x=1720016552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSOqd6xFtwNmB6/la0EhwilFZVmFb3e1mPm8GFnYuuc=;
 b=oFq43V7WGP7cfU/5BE0+05FEhcm+71jsEKZUQWikwja6+MrkOh6oe8o1EWupv1PfST
 JjmQTINTR4w6fXzxBuLrtbGiRpVQJrJ1YGHEVIjCTZ7BKkWV5C4J19fYd5qf2gyXs290
 hSOIPD3VIYYa4TPtvccjSLGc068RVRubUbPRDkDhJwavBdF5kSOsj1d9VQQa5rhVeMrG
 6bMb6qB8TSmOPUYxwjrpg7mvmj1tMlwDYzwQgxnmoiwZ2ZhHGYYAtZXewKQQRMqxp9uF
 i/vnzGBFhFuOzMmBFb+SjkVmeLV9zmBPHhAeU45DpFYsO2KnWrnoh2qkkZ20F97+VyAB
 PsHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUbZuHuPJYDgNcZHurLHz2Uu9ldVeRj2/xLqzUy3Yj3bYSzt1FU32xlXmSmwBnMOUCfFdNgfZflut4D0sBnFsoFV0/h/s8L8T5K9cQwTnA
X-Gm-Message-State: AOJu0YwtukUzDV/lnWIdNx0v4Sph4GRl9qxSmMGs6keWMSbXOr9Ko78M
 NVUoubKg0+ZkG53RteI9x+k3CTUSsKNoIQ6hP8mnp/unxqoSX1LCPQ1bEZu92D4=
X-Google-Smtp-Source: AGHT+IG5doh7ICzMm/NrOTR59CEuv2r+Q5IA9UA8wl9i2JaEBBV0vUoMwj/zrNmZXpgh5C2T/Pl7CA==
X-Received: by 2002:a2e:9b12:0:b0:2ec:559d:991 with SMTP id
 38308e7fff4ca-2ec579ffb28mr70805581fa.50.1719411752241; 
 Wed, 26 Jun 2024 07:22:32 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7be7:aef1:af9e:fff6])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-424c823c28asm27141105e9.5.2024.06.26.07.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 07:22:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/3] drm/mipi-dsi: add mipi_dsi_usleep_range helper
Date: Wed, 26 Jun 2024 16:22:08 +0200
Message-ID: <20240626142212.1341556-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626142212.1341556-1-jbrunet@baylibre.com>
References: <20240626142212.1341556-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

Like for mipi_dsi_msleep(), usleep_range() may often be called
in between mipi_dsi_dcs_*() functions and needs a multi compatible
counter part.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/drm/drm_mipi_dsi.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 71d121aeef24..0f520eeeaa8e 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -10,6 +10,7 @@
 #define __DRM_MIPI_DSI_H__
 
 #include <linux/device.h>
+#include <linux/delay.h>
 
 struct mipi_dsi_host;
 struct mipi_dsi_device;
@@ -297,6 +298,12 @@ ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			msleep(delay);	\
 	} while (0)
 
+#define mipi_dsi_usleep_range(ctx, min, max)	\
+	do {					\
+		if (!(ctx)->accum_err)		\
+			usleep_range(min, max);	\
+	} while (0)
+
 /**
  * enum mipi_dsi_dcs_tear_mode - Tearing Effect Output Line mode
  * @MIPI_DSI_DCS_TEAR_MODE_VBLANK: the TE output line consists of V-Blanking
-- 
2.43.0

