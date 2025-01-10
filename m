Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701FAA0907C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 13:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE57910E500;
	Fri, 10 Jan 2025 12:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KeHzNfpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D2910E500
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:33:02 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-306007227d3so13767261fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 04:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736512320; x=1737117120; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LNqcxeemu0dTYtSJZLx7nl127aYJDaVFq9hJPsyhj4k=;
 b=KeHzNfpjGAUepm+5djX5ThIKD/+3ZAbiLCSenlm0iCJmvnzo2utYZfxmdZyIA+hyfK
 2tRKl0z1C7Tm9Rn0tUpsApUfANlwGMGBiClN6A16/fjCCpVtLJpaT83e5xjRrtPoMQxc
 ShpDaIcR9qp2PrgtrSykVsLfZ3+jYRmofeU6n49yQQ2b0OpzVJjv+7MaGKHeVjzR+XjW
 mSqGd3WNuaTqtBfBFDO4PboTQKl7A31cVuP2TzlHpFhZiMHNVkewJhd7hza0wqgpENkJ
 PFPPSzFeDB1SwsYanMIRHtDTT7gph1/xIzQGucSItYHb6D+GkuGPNjDlas7jteAjRZRd
 srmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736512320; x=1737117120;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNqcxeemu0dTYtSJZLx7nl127aYJDaVFq9hJPsyhj4k=;
 b=GJnMBWRhvjTcwlzx3y0dHsigk2PoGqqb9jJ1nD2ySL1+8JEVGOL2G/A7j4NwZlKzCb
 LmamlAz6MNG1N/GhXua5/8JS1P44lmVj5IOx25dw5xoYw0eNX8GoYHjMMkQW8HVTH9zq
 MNlcCKNVFiydHLzoQzDl33aVuBjmyXSas9XiOl3L0dKfY4sl/KWGyCRhpJYOtlT/G31a
 5U5XTdahHy++btPe/e9HOxVvtjNVmhm54YjPyEV7BIyfXgsACARewJfkiUk646pBIXMx
 /ngXckocomEvHwIpPpRxc3OIEZSmi+Rcf4XBZkmTmGwNFZuSt9PinFh2AkYl53HueTiI
 zvHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeAnTceGkhhFopCcKVYww/U912YA/w0xROowXHjZ6X/osx6M6Tg8LmM6MzzTew1YYHtJR5YuKQCaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj6aB0k5b9ou264577EI3O/tErWx4AJOY3Dz4PKm+PfXKvRnIh
 YLPxmnI2zXBX5dLvEScm+5Xb4Pq0A/jUm/6ufAkj8t/ejkKTSj6pcRR1vZVoZuY=
X-Gm-Gg: ASbGncvxLyJwAeQlh2lWAy4q5qH02nQxLBToxzrGlh5FzDK7bnO3+dUepx0YMNy+ak/
 A8xKfDQZKu9ahDGK0lJRambezkUMVYaFB7smle9AKaICeTg7HNt/tLrFo1c/0EGSfoGeGn6PXcV
 Y+pznE3NOGQw+8T3z3eGPT8CqvWn8bSjJPZupwqG6OLUgv2LG6ilA95+rEQbTO7nw4EtaThCMzh
 467m55QiR25SE33wx5ElUAptQahT/sQT1njAmszMBnCQ6Bvu0anrCxgHjvJI+pF
X-Google-Smtp-Source: AGHT+IHpCKgjAmWJKiXDpM6QD6fFZBeaBe5TuPx/yke+1hwwlNLWjhZffdT0BC9t/x6+79dRRNucFQ==
X-Received: by 2002:a05:651c:221a:b0:300:38ff:f8d9 with SMTP id
 38308e7fff4ca-305f4533083mr26808201fa.3.1736512320358; 
 Fri, 10 Jan 2025 04:32:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0cedafsm4720691fa.29.2025.01.10.04.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 04:31:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 14:31:54 +0200
Subject: [PATCH v2 2/3] media: cec: move driver for TDA9950 from drm/i2c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-move-tda998x-v2-2-ef2ae5832d21@linaro.org>
References: <20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org>
In-Reply-To: <20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2936;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8laCO1G6C22Qn5+rN+sCPt76jMJ4MGhNPQxJk96BxX4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngRM8PZfvrJ3WUN4XrAgEELpTl91x/xncm8aZ/
 NQ1/RMTwOqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4ETPAAKCRCLPIo+Aiko
 1T1MB/4y9YgyIHmTdSzZpNz5olrK+8CNKOizShHvjLGlppR0+W+ax17g3FhL7KY98otV0YORhmo
 Sw3GHeT/2j3q6C7ptJekboAfZsTCndAeNaVbGFwwRIpQCkRsC0bxm0Z3/WZO1EmO6+0aD/+TKY3
 iybvwPOa8A5/wxZzeFLH/jNecwdDMdPkE4r4X/8WdzRQwV/1ogiMDPqrOSAcCrlEkjsNw2qOjzN
 uy00+Gk8M3J5QYgSAIumS9vL6O0AmcMJ7YOKFnBDJQZw6SkfiNOeEclMupSieWgTL+GX2N+NRVR
 z/+QeClMiNv5z6SXEm6oDk9tMiDgjQPrOPOdLhyWxb3C6KdL
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

