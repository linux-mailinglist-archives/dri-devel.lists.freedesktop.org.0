Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008AD9B0976
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C5310E3E7;
	Fri, 25 Oct 2024 16:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kGOqlJ3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443E210E3E7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:14:54 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2fb56cb61baso18208651fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1729872892; x=1730477692;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GN13PFFztO+RVXylp070AHdpchWjZze0aJo+onIOSo0=;
 b=kGOqlJ3pLoCwxZyvhwIh9nSxZJxO+9hT6teJ/HleZ2IXpVOGpyt5I1kcku2hguiajq
 8UBHcr5svkqw9ZxigA970/l4Z6lCXJs/eUimXn0YlVVoL5cv2VA6VP16qhColHHTIUq1
 Yyli6v56XnRnTtKH65tV7xA+Id3SVE10svOO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729872892; x=1730477692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GN13PFFztO+RVXylp070AHdpchWjZze0aJo+onIOSo0=;
 b=w/YUDkuaTWiRB3pXnqTBaH/SH30MfIkGZx/Uim4diPhrBJ0lGVOTXj799FfmCuTkQt
 NGgSNL+OkQNJADkQ8DjZbp5rkfZxWOOXNgKZR7R+CyCtK2ZPUcMfClFqn9T/iUZVqhd4
 ugDlxdar2Oh2sJsmaZCsJ1C0ZzRaAn1qwgbjWEILebi4y+xfHeV3gkmcDypSl0Uz7/mQ
 r2yD3Nzu9Fc3U3XioaXq3QT7IDUhHdUD/nuU0bHAJHvy1XPs/8/hId8WA/bEr+kGPXkC
 ikaFYz89nRXfKtKtQRVBTPqs0POAsOoWJXibpw2Guk/1p/VX65Zhw2hrd68TNP6Mf93O
 p6iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVNSfO+/PRapJFjo/K4OYU9O+1E9lFAByvY0TGb7CCGXe7Q1CTQNSstSrQVyiJY4ySF3IrRJ6hxhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO+kKybtvfmv5S5FFW+VEmgIDgnzSwnIzFcDRtRnPSJNfyGp3W
 s9Hr5MrEzl/rwKDagWeZV0kQH8FnKuNkTtEZlbvs87WiTTSF+cGzKIQrVJLmK9Q=
X-Google-Smtp-Source: AGHT+IG7Ko0ZaVVixb42kGSXnwInD9+MTWs4okp1RbVG6KUd/qf/uSPa2qcn+su4qqA0sbbCFTHNBw==
X-Received: by 2002:a05:6512:3054:b0:535:6992:f2cb with SMTP id
 2adb3069b0e04-53b1a36c6f3mr6404231e87.42.1729872892194; 
 Fri, 25 Oct 2024 09:14:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b579613sm51759005e9.38.2024.10.25.09.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 09:14:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Fri, 25 Oct 2024 18:14:25 +0200
Message-ID: <20241025161435.4114877-1-dario.binacchi@amarulasolutions.com>
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

Use aperture helpers to remove all generic graphics drivers before
loading mxsfb. Makes mxsfb compatible with simpledrm.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Use aperture_remove_all_conflicting_devices() instead of
  drm_aperture_remove_framebuffers().

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index cb5ce4e81fc7..d140984923fd 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -360,6 +361,15 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free;
 
+	/*
+	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
+	 * located anywhere in RAM
+	 */
+	ret = aperture_remove_all_conflicting_devices(mxsfb_driver.name);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't kick out existing framebuffers\n");
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;
-- 
2.43.0

