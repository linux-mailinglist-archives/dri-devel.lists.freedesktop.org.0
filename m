Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BD7BA5F7D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 15:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976DC10E0DC;
	Sat, 27 Sep 2025 13:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RZCzPc7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4430B10E0DC
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 13:02:45 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so29328465e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758978164; x=1759582964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5S/zRBKTkSInAQ7R7zklKxxLF5akYgcZwi1P/3w8im8=;
 b=RZCzPc7sPJuNgCq1hdybKEfj3lAe4Xb2R6lr/BtaGZMvFz5kyyGpOGtvsdY6Jx8Pt3
 gzLqBPiCPeBPcZEQlfmh3jTGrbZjJXRpb+U4IlDABpo6VbH/PVnyHoHDanub0C5dZtQ8
 xM3QaUswZ9Wy14dRKFf2KQwBtewO2QNuWkTutVcvT6/jcANnwMo1w6Mg5xoK3ugJAISA
 27FDXd8TgIuBwcNBwEp5/Zt17YOUzi+5lUg8VYBrUFg26gYfN2GfrlcofJtg2jZF+IIf
 C1EjkKizxtiMUGMf5x3UqfbVgN/mlcTnLVfB4f2/XB0CEGpP2rbWNxVNofaBQoUXKiCy
 Kflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758978164; x=1759582964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5S/zRBKTkSInAQ7R7zklKxxLF5akYgcZwi1P/3w8im8=;
 b=JMw/IFYY0NNiWCPLBxx+b35VJH9st9Ug1bY/Sjvebl3w3dySNVe+DhkTVUuhxVO6OR
 m+Dh52mDnutQvmcmAz7mwgTnv652m55obHN+N2NPF4DleaiZc4fs21KkNg70jjjNYj49
 SsQtrFlIBD25hsag413DCHOrXtiR3K/rvGI4Sumfjh+JsQbOO6i+zjwPjGbuWFnS9Jc5
 g+Txsx9IMwSfl2w9+362sDRrY2OeYijPPKGNktJ+hzoVxjPWpsbH7J34+e/TiwNsCbkA
 659KisgIO+3UMNJrSWOFlVU6Sjn7Oq5soiYtTp2eK9mxmMC4oaIVa0MSySMFpTy2A3A5
 IVTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7uBhJJTaHbRakGq0CK8ExJEslKLZdFr6G527bV6vLSun/OpQ1pX2zdZ+I5IIgXb/JUUIbWoL8tOY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAl4Vu+CzdqlxTZusV5WhiM6e90uECKWEsDf2awnC0R2kdfINu
 26KwQsf2MILfDArmpgTDZ0ryOoonvZKs+OQH4GVfs0RVHkiacwARexWV
X-Gm-Gg: ASbGnctebLfO0OGcJEG4p15QiYBGX0q0F/9s2sM9S+grkz3qxeNz4qxvrUMUfAl7RVp
 eK/GVMuGxTf4KUUsI+JPnLzY96sF7Oy6VIPt9zCNS8kygS1epNBGn161naH28g7OORSJFi8CPGS
 SWZ1T2JOAl5BSyOZVI9hjPV6uGO8bL7pUW8BcFhzBrb5KZiJPg/eMHiEQEduPeDrKwh59INmH5/
 RTr2+snEt6cAQScR26kM5+5rksfT3GyHXH4WtT8S5FPHSqmTGSoDfrkCAWxuD7Fii4ZJGx5rtpQ
 iokSBQcbY7cHtc136xP8jWe/ej+xTyrXwO3lGB4T2AucopdYMHUGAhwKA8xRL6Nl21RjJyfjnWM
 h0GBiyYTZ795enuq9uX+dTThaBhkrOoSnQ4tMRg==
X-Google-Smtp-Source: AGHT+IEylPzuTSyMe4S/LKg6ZM9MgQ/hgdwD1nLSuiRnhYfLcu58MW722RoLbdkug9nm8AiwOWmzHg==
X-Received: by 2002:a05:600c:3105:b0:46e:1fb9:5497 with SMTP id
 5b1f17b1804b1-46e329e4d87mr104992895e9.18.1758978163470; 
 Sat, 27 Sep 2025 06:02:43 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9ac5basm177274005e9.7.2025.09.27.06.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 06:02:43 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH] drm/meson: add support for 2560x1440 resolution output
Date: Sat, 27 Sep 2025 13:02:39 +0000
Message-Id: <20250927130239.825060-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Dongjin Kim <tobetter@gmail.com>

Add support for Quad HD (QHD) 2560x1440 resolution output. Timings
have been adapted from the vendor kernel.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index dfe0c28a0f05..f5385b3e3796 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -357,6 +357,8 @@ enum {
 	MESON_VCLK_HDMI_594000,
 /* 2970 /1 /1 /1 /5 /1  => /1 /2 */
 	MESON_VCLK_HDMI_594000_YUV420,
+/* 4830 /2 /1 /2 /5 /1  => /1 /1 */
+	MESON_VCLK_HDMI_241500,
 };
 
 struct meson_vclk_params {
@@ -467,6 +469,18 @@ struct meson_vclk_params {
 		.vid_pll_div = VID_PLL_DIV_5,
 		.vclk_div = 1,
 	},
+	[MESON_VCLK_HDMI_241500] = {
+		.pll_freq = 4830000000,
+		.phy_freq = 2415000000,
+		.venc_freq = 241500000,
+		.vclk_freq = 241500000,
+		.pixel_freq = 241500000,
+		.pll_od1 = 2,
+		.pll_od2 = 1,
+		.pll_od3 = 2,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
 	{ /* sentinel */ },
 };
 
@@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm *priv,
 			m = 0xf7;
 			frac = vic_alternate_clock ? 0x8148 : 0x10000;
 			break;
+		case 4830000:
+			m = 0xc9;
+			frac = 0xd560;
+			break;
 		}
 
 		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
-- 
2.34.1

