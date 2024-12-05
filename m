Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45369E5B40
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 17:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5874B10EEFE;
	Thu,  5 Dec 2024 16:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="c7cwODXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FAA10EEFE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 16:24:37 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aa545dc7105so193854466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 08:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1733415875; x=1734020675;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q+EB++J/yowUMrD7IvepBqWDVig6KUMpfQ1WpjD4ens=;
 b=c7cwODXhHf/R9WVFDqI7CpK+3JfIKFep5C2y8ODCymfrq0ys6+crkM6ZtspubUbJsV
 vzb98fNYO4kubGKpt8QjYE+6rbPrtD8CK9JKQQ1MBs5ursH5FDePyokmws0pKOY4ToPr
 L56D8KHQTC5oeqhIHyqmlC+0iSlzymgNWicmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733415875; x=1734020675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q+EB++J/yowUMrD7IvepBqWDVig6KUMpfQ1WpjD4ens=;
 b=l0LPOS14ndRXSl1NJ9PdZ691qTkHebUcixPuLL3RjlY3p5RKvqgz8gIiwTe3qPpO2v
 JNVh1qC7KxEt5gxTLgoEGAF2BxmBPxf/XUE0WrA4NL9urgRPba8fdoYrCogLLhFUu3Z3
 pb3goQGXWMMjCbjsx/lv61xVG8yi+sYzWj4sDsu1mX4n92f/rdTfaxFnArfW5V9u7tqV
 Yxt1UhYW6OL2wMirLRAfSqXQynp2jBP7xssQCLTnQB9FmNMfbcYm0Vl3xoenY+LkHHkx
 b/4Neej5wVBMvmOVh5H06V/Np+ijdNh9a/5QmdDw1NwbFPPW0v+srf+kHYIQOivvWSZB
 /Jmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBamIvcAUkUx8FoRByC2xXr1hqKEQnqGn5zmgkh56H9TWidMdzGrGmd/96A+J+NvYp4V2Rpji8i9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRpmsoGcmxFRVk85EJtMW3sr0jTmh5pI0EqEzIigytp5iK0f82
 04L8MfrPqknxV5/Q1Nn2ugYRohbjMUz+HPE89PQO3IcECpfm9FVsMslIM67KbTo=
X-Gm-Gg: ASbGncvL5zmH0X+paeFcglyNYqImszZLmztz/uOwsmFCAcGSvZwScsmhXiEsB2nKuGK
 yI6KxhRg9AiQtrWJ11bdvFlr5m/QWkwp6PiNsaeDy1Kq6NPXwJh1ANmEmaSUyT4ht+H5BJZvF2c
 Mr9XMe7vJzfebqR02o8YbRvmMXp5gu3UvqaVM2nVQgQ+u7odGojZsCem6vmzA/acLg4kgKgVjyP
 3A+6X6bug5RTjRLpq+DF4dxn5bO/zN0jUCig3TuNXYAxPLUOVlPIGh7goUCe+0Pnqq0D+rbrKVd
 ogLRgdFSMvFXbv/tsTyBf+NqhVm3zrlXR2/JEgvVkQmGug==
X-Google-Smtp-Source: AGHT+IGADqZ1DS4WW7fjZME67XfYyJ9/Ms38VwzFpIjDiSj4wLXET1zw9ysNdFxbGcj293rTqfarbw==
X-Received: by 2002:a17:906:9c0f:b0:aa6:24a2:697b with SMTP id
 a640c23a62f3a-aa624a27056mr315906766b.27.1733415875558; 
 Thu, 05 Dec 2024 08:24:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625e4dee6sm112286566b.32.2024.12.05.08.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 08:24:35 -0800 (PST)
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
Subject: [RESEND PATCH v2] drm/mxsfb: Remove generic DRM drivers in probe
 function
Date: Thu,  5 Dec 2024 17:24:23 +0100
Message-ID: <20241205162432.1803869-1-dario.binacchi@amarulasolutions.com>
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
index 6b95e4eb3e4e..10da8b54f4c6 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -362,6 +363,15 @@ static int mxsfb_probe(struct platform_device *pdev)
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

