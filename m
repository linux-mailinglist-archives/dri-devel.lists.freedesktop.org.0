Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE78ABB63
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 13:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E862810E43F;
	Sat, 20 Apr 2024 11:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vhwh4mjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A56610E43F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 11:28:44 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-78f03917484so185032585a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713612523; x=1714217323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tKoATs+ZIoHNDyy8oxy4Gs6SKIXsj2sSrJmnOyn8fCY=;
 b=Vhwh4mjDlR2FoF3N1jFbu8zUoDeWPn6aHg96rEgYhwYGmtK011zt9yY+obOVXPU9e5
 Z/QQXiKpKyRwKmOiO08W5CKAl2s1wtvC80zSEqO3yFjF25zFlO8U7VYqNz6rRO4fv38Q
 Arx5llfPduxeYfkSngi/PBH2rtKrm3gbzg2lV68F0UrWYv66dz4HbJztKSIdlNTOgu9n
 DVruQBfrv7WROi9tTgfpd745UWgb8pTX9tYuKpN7BBFZRXVmDDvtr/6SWy2OJPcPY0pl
 HKM7LJWxeT+0/f83slFqnF6bK8TlvYdXzOIkN36onarpRISlbkJ46mEjDf1Wbw67FfHQ
 Qqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713612523; x=1714217323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKoATs+ZIoHNDyy8oxy4Gs6SKIXsj2sSrJmnOyn8fCY=;
 b=weEglXcKcvSAeMfywK0v8UkJBCSTpZwOJPEOeHTNHLaR/7wHlD7Umcgz44/7kdmNL2
 qi0kCAlk0Hz5z/1vvTB18BH9PTBsoDNg7OXOMDW0QnUpBGpCEY9upkHVXV+JaGadHhd2
 g/G+tgC+YCJvV0gatfscOZH5p8pVcSIbR7eEOYpUAuabPxRwMlrq3EMams3EzfggUdUV
 zgBL7ZL+8StRq9nrVPrnouP8ZkLsNJ6E3VDBSwpPXU/gkyl7CuYmq9YG7WCSP5/1EflL
 uh3OyD43rcWc3/2QUVogqqOWQ5Xn6XNML72P5PIV/ptYe20VAGZFshW/burRz0/To1C1
 onjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY2QHCMamP7inaXAAZQ+HVt9XyMoKUiWi8Pl7+uSigXJpPbYoyO0iTJvORURHYwq9URXTCDlYQ0CGi9HT3+0Mtxfd3LvTpFnwxt3yRPGh3
X-Gm-Message-State: AOJu0YzKFB6OIPOCkTQG0yeMO5ew3wL+Pgb8oTmVpLQIQzW384vG+kSV
 KClnch7ISnV6cp+L6Zn9FGN+zuFNwmF713EMolpzMvGtzNjyWtAr
X-Google-Smtp-Source: AGHT+IHUv7Gq5Bx5h+ndQV7V3ptdOzZY46MxtRUHLR0evtc/5NlIjWXFLv7Vys6xP0NpfUZZlbibsw==
X-Received: by 2002:a05:620a:2987:b0:790:676d:b7c6 with SMTP id
 r7-20020a05620a298700b00790676db7c6mr532426qkp.67.1713612522545; 
 Sat, 20 Apr 2024 04:28:42 -0700 (PDT)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:8379:f9d5:1d94:be66])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a0d4f00b0078ee090baa3sm2422559qkl.10.2024.04.20.04.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 04:28:41 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 kernel test robot <lkp@intel.com>, Liu Ying <victor.liu@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: imx: Fix unmet depenency for
 PHY_FSL_SAMSUNG_HDMI_PHY
Date: Sat, 20 Apr 2024 06:28:31 -0500
Message-ID: <20240420112831.5942-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When enabling i.MX8MP DWC HDMI driver, it automatically selects
PHY_FSL_SAMSUNG_HDMI_PHY, since it wont' work without the phy.
This may cause some Kconfig warnings during various build tests.
Fix this by implying the phy instead of selecting the phy.

Fixes: 1f36d634670d ("drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404190103.lLm8LtuP-lkp@intel.com/
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 7687ed652df5..8f125c75050d 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -9,7 +9,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 	depends on DRM_DW_HDMI
 	depends on OF
 	select DRM_IMX8MP_HDMI_PVI
-	select PHY_FSL_SAMSUNG_HDMI_PHY
+	imply PHY_FSL_SAMSUNG_HDMI_PHY
 	help
 	  Choose this to enable support for the internal HDMI encoder found
 	  on the i.MX8MP SoC.
-- 
2.43.0

