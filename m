Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC5DA294B2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 16:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1710E1A7;
	Wed,  5 Feb 2025 15:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FLgt9jYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7288A10E1A7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 15:29:48 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38dae70f5d9so1079327f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1738769387; x=1739374187;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
 b=FLgt9jYKPi2NfsN6CpP36+eamgxOj9iiepY2R2l/0hqZM7rFABB8bYN75PFeQXY1jB
 BEeIm3+2iML5MJMv5c7wbVvA3bZDtF6hyovXSKrQRnTx+QCDNx5tRTZ9CitQ39awA8LJ
 oMC2uoJF5hb25foYsh9NmENJCmGlOiDwIWh/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738769387; x=1739374187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
 b=mx23X4f8Sn/qg31JJzVopmnPoLfuCTA7lW5Nq03msV93/8nuCDRf6BFdYWipWNL6Wv
 2fplZ+8tAekCupZISBqEviBwZMCnNldDvTO3VtcZtETaI58DGIzCsiKz2q2Nonw/YsIS
 4oDJ90oj5cUtTL0kGmF0iU9OGOByEeUlLvjuDEJ0NdQxrOnAZZwZOy4e2jSdIM9pmKzs
 rkDU+JVxqa20Cd+rgD/EgVTHEBQx7P4KNTUuGXSc75mJglXHPLRYmyZqP3N2FBcIDXwJ
 0gjCdnPxxDiKQFO9ZhuKQKhD3nWx3InP2ueuGMN5uGt9Cf3OLdOJ0kI/u+Q0u0US5G4Q
 XBYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOICAtiDuguOcN7LGlW4MfWAMPW7opohsQOWKcGrN8JJqW740FuhEdLYlqeYAG0/axJEQNgqePHMI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD0SubbVVGWqBiOILVKIX/iP/8FZjs9Vj0BIn3wFscKSSrOYp3
 LL+ejxIauS9spDijIYeq0CbA8AW+F/ONuYF5lbWHsDJ68gt0hP/xmn3KgnBtuEo=
X-Gm-Gg: ASbGncsasDwLqN3nknT37c0K641/ORviquT3CLSwvo4uaWkKajIpUgCj1n1Snnu03K8
 LM/7He9ciOik2BxNl//P06ZFhOpFT9l0X+7fo43eTt0dJcOqaDj/e8cxP3ahDUr9dkvocWGSgjn
 jnky2ejGzbmSKRWfg8ic9dKf+D7CNp0E5Nycq2gyu9baE+W9SNosQArjp/r9d+3bhKA/KWB0DGn
 f83wwooVLaaywm7cfpu6Q9L312QY8H2WIWwpV1ohrXKwnJFXDi4AFurN3WQxd8PCXf/xPM9DxOh
 3aSzv5Jj/TzgoCrAuWxfNk/Tz9hPImMlcOpsCXVIsMdiilSZjK1Jte1X
X-Google-Smtp-Source: AGHT+IHUegMKoF3Uu+JDrnonpKTLGgAqfUbpAC5vcQvzwsUpc+CNMtcSoxp8JpOvJyhpCCI3zm2NQA==
X-Received: by 2002:a05:6000:1868:b0:38a:4184:151a with SMTP id
 ffacd0b85a97d-38db48fdf85mr2428469f8f.37.1738769386468; 
 Wed, 05 Feb 2025 07:29:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.151])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38daf999747sm4475386f8f.19.2025.02.05.07.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 07:29:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Wed,  5 Feb 2025 16:29:36 +0100
Message-ID: <20250205152942.954381-1-dario.binacchi@amarulasolutions.com>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

---

Changes in v3:
- Add 'Reviewed-by' of  Thomas Zimmermann

Changes in v2:
- Use aperture_remove_all_conflicting_devices() instead of
  drm_aperture_remove_framebuffers().

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65..e5eb644b54ae 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -361,6 +362,15 @@ static int mxsfb_probe(struct platform_device *pdev)
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

