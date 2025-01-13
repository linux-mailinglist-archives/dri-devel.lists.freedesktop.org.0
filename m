Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D40A0B39E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285B610E60B;
	Mon, 13 Jan 2025 09:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QJl5Vr5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9C810E603
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:53:51 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-540218726d5so3826441e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736762029; x=1737366829; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oXs1vUKOp07Lh7MvZmn/kX1druV2/H8ljgw6d1TArsU=;
 b=QJl5Vr5LqxPvc9SJI0McU4YL/6sNKlraRJc3mowT7Bjk7WweqYnISUhLroZ4uYT6ra
 31UrLftQwnMjp9QSdKQ0Kplyikhuxefquc+QpdjBTUDQMpxVAPtYo8awF61CbinoLKuQ
 deicIyt8pyBLZyFmBXqiB8SlxjPE17TSItHUzKEjYuTGikamPI11lyVLUxNpiiqSzbMB
 K4IITDSzCKCogy4pvtNRIHvsJG61lJ/k9eVId903e4gdRntAfHVVkQNUwHoQ6P6U76g8
 Tk1Wq23dWM0Iy1V6xu51kTtAlJHm3Lq8IYBS3sAlmUjYLFwIEKa8GhFPDQ0IDsfNAwh0
 OnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736762029; x=1737366829;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXs1vUKOp07Lh7MvZmn/kX1druV2/H8ljgw6d1TArsU=;
 b=ijHRNLjavm/6ugvYzrtAtyKMYin7WvSGoXq1hNCM9Ec4w6Eet+T1IzCtkBoii/sbKX
 YsQ0bqSANRuBMx89uU/5oGWtEzWqDgx989kQNvVx6bTrEwsNinXHn3HARpmwp5nsvecl
 v4sGX10mrZcwqdcxa8Q+UdmO74mOj4Ght4fyfw4TjlfARxbn3k3wckY2B0tu27sYBgJ5
 XwTbCwOcney/QXDU9nuy0qyE6F2vze+gr5OTl9y1AAG4WSa7Qfi2kiyNJq8dOLK6hsvN
 ILUXNqdFrsBzRubR3nf9nffDkIsL6PSL3T9JguDooA7CKLrUjvPiG9QwccIFiUOEFSlu
 i83g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Af/qFmx+AqTg23hoBDgdBysPefSHY7ADK7f97nVIYebPZwmYCF7JfR0SbaZYmbGYZWn/KTk6ggY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIYaidYWQh1+NSGhCYZSAFZ58d3HGzxj9uYZwuNaVOBkmpHKVz
 AU1kC0+3FxRXDcVGsz49AWtQJD+Hzf/tibsjiv5XEDeWnMNZyr+iA22Ydvfe6gg=
X-Gm-Gg: ASbGnctHT7xzZx1V/aqo6K7r0CAqeWQqtIjsqXRCaJ4E2wOboR7+zJyJUJnscKNU/FY
 yEQlIobF4Y2BTMDHCMH4ADl/aj0qTFTjqBGaaz27DCb/Bn/NurqTJllGmTrvyg/vZqabl5rCj+7
 Uo5nr5Pu4rEI5rcEXh1o9eM2S1ZxpnViAPAvYJN0EgvR7qyO+AhG1cg+enOgDjn1sCHeL3uzFoY
 k4vT0kJygSwwdKwbXWcoIRaXH/uq+fgJNVTb8qtTn+5CfagoK/vUJpwxHIWpt/W
X-Google-Smtp-Source: AGHT+IF+h31WfsFmobpodKgDnSta6YnhkeQaVEHS4krRz0FXT9qy9HA9r3wcFLj2hsHiFB0Tc/xx2Q==
X-Received: by 2002:a05:6512:3ba8:b0:540:1f7d:8bc0 with SMTP id
 2adb3069b0e04-5428481d028mr6641931e87.49.1736762029457; 
 Mon, 13 Jan 2025 01:53:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6a67sm1287085e87.167.2025.01.13.01.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:53:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 Jan 2025 11:53:45 +0200
Subject: [PATCH v3 2/3] media: cec: move driver for TDA9950 from drm/i2c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-drm-move-tda998x-v3-2-214e0682a5e4@linaro.org>
References: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
In-Reply-To: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2981;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=18CnAyxjLuzT65z1y3huWbOQwdYExGvyWFR+pnRfSqM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnhOKqiJ4twX8bcD10UooMtxQ99Ns/x9mvJ+v2v
 Kzz8MW494aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4TiqgAKCRCLPIo+Aiko
 1b9UB/4n5SnoZc7cCIp92otesK+Heqeq+wluKL7rk4XbgQ9hQwSjrtqgB09Y67E5tndPI0qZHI8
 vU7O7F4YptLo/rQDV4LMK8ZLnDHgGhMw8YpwzbtarzBxXJa3lBzSouVliNzvjIo4osZ/6tizyIa
 K8SrAsGisdsilo183vplQN1/5pSgRdagFEpmjbdGRfOGrozfFkOwU+L/uvQiIusA+cdUIpXaMXz
 qE83C/yL/1s/Y/IxnK3MtlFbLBNrgqdVzbC9Dh+5r9XHghE5oOYnxF97nT3RK+0b8vZYRF226EQ
 RJB39Bn0wbRytlwLEGdHo7FYKmG/qJwDiFVFlXDvFRS2vDl8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Move the driver for NXP TDA9950 / CEC part of TDA998x together to
drivers/media/i2c, close to other CEC drivers. Specify 'default
DRM_I2C_NXP_TDA998X' in order to simplify migration from old config
files as the Kconfig name has been changed to follow media/cec style.

Acked-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i2c/Kconfig                  | 5 -----
 drivers/gpu/drm/i2c/Makefile                 | 1 -
 drivers/media/cec/i2c/Kconfig                | 9 +++++++++
 drivers/media/cec/i2c/Makefile               | 1 +
 drivers/{gpu/drm => media/cec}/i2c/tda9950.c | 0
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
index d5200f67958e68a8ec73401f1d3b79cbe0aa303d..1aa2a0bf5cc183b4ce92fc4f7eb61fd0065250d1 100644
--- a/drivers/gpu/drm/i2c/Kconfig
+++ b/drivers/gpu/drm/i2c/Kconfig
@@ -10,9 +10,4 @@ config DRM_I2C_NXP_TDA998X
 	help
 	  Support for NXP Semiconductors TDA998X HDMI encoders.
 
-config DRM_I2C_NXP_TDA9950
-	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
-	select CEC_NOTIFIER
-	select CEC_CORE
-
 endmenu
diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
index 31fd35527d99d7eb23851d290175a3ff0c756772..45791fbfae983eecf58565109cf8eecb6431643b 100644
--- a/drivers/gpu/drm/i2c/Makefile
+++ b/drivers/gpu/drm/i2c/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 tda998x-y := tda998x_drv.o
 obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
-obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
diff --git a/drivers/media/cec/i2c/Kconfig b/drivers/media/cec/i2c/Kconfig
index d912d143fb3129c6b3d0133dbfceffdd48bd543d..b9d21643eef1892ccff508b1864db30e83570212 100644
--- a/drivers/media/cec/i2c/Kconfig
+++ b/drivers/media/cec/i2c/Kconfig
@@ -13,3 +13,12 @@ config CEC_CH7322
 	  generic CEC framework interface.
 	  CEC bus is present in the HDMI connector and enables communication
 	  between compatible devices.
+
+config CEC_NXP_TDA9950
+	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
+	select CEC_NOTIFIER
+	select CEC_CORE
+	default DRM_I2C_NXP_TDA998X
+	help
+	  This is a driver for the NXP TDA9950 CEC controller and for the CEC
+	  controller block integrated into several NXP TDA998x HDMI encoders.
diff --git a/drivers/media/cec/i2c/Makefile b/drivers/media/cec/i2c/Makefile
index d7496dfd0fa49631299ff56c20e946757e50cdb2..95c9eda5258361c4d9196acb527e0c1b4351dbe0 100644
--- a/drivers/media/cec/i2c/Makefile
+++ b/drivers/media/cec/i2c/Makefile
@@ -3,3 +3,4 @@
 # Makefile for the CEC I2C device drivers.
 #
 obj-$(CONFIG_CEC_CH7322) += ch7322.o
+obj-$(CONFIG_CEC_NXP_TDA9950) += tda9950.o
diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/media/cec/i2c/tda9950.c
similarity index 100%
rename from drivers/gpu/drm/i2c/tda9950.c
rename to drivers/media/cec/i2c/tda9950.c

-- 
2.39.5

