Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910ADA501A3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74E110E723;
	Wed,  5 Mar 2025 14:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="akN+WSzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59D510E723
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 14:09:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso1787724f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 06:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1741183773; x=1741788573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
 b=akN+WSzbpho9bQFiH+xrlxrwgLi3aznNTMU8dCyCbsh5E/qYxuw7k5uN+V211zB898
 b3wpBELWlo2ygfWHO1RYYOfbbOhzm8QDQkRZxi2IRTn6SywL5z6NkVYcAH8lK9aClPFI
 k4PuXSumVZtkaMTAPHpM+WNo9arert+/CHm7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741183773; x=1741788573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
 b=UTdLdfSp5wRZsGfy0HBOHH+pM05C78fgPYCE6Oy/x3iyWXJ8Xlif/hOny2NazMTOAY
 DSahd89dhF7SyxuWPd1gJmKjIuEa75Xa1jRfMaU4IWzHnAEuBcQQBpM845oP6lHHtMjK
 o7rU4ELzqZzqf54GpFxvcgx0JjkD2miKxgq3sgzHpqZ5OsETwLl9tqyhQDB6MEuVyp5N
 /cCsjfm35nww9j6e6KzmKHOKMU4PFFAer1WwE+GpxD92Oc648zvza8BKQfupmCvBo+hu
 uKB/SdIGDVDZYnuUsWgBNsGQR/LzJDUK+n2XzCuNi+lDfXKI2fRFD/SLEhDJ69Nb7+na
 j5Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZYaEh7QGNjw0QJYdabLs4kNuAODJo2rcDzrn0bTJfoYPTi4ZDsYit+yZxp5uw5i8koQeaMhJHANA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqtXpBJCfhaQQc3k1WfO5nr7F0zzI7uPscEshrI1k87m++n394
 lbBfhzixWZUm+HasaBwurIDLyFD2fZGMDZShAlCvkKf03x1xtNy16xy0z+BmVO8=
X-Gm-Gg: ASbGncs6TTaZPdukZO0SJDwS2pJD/k43wtinRHZKZ3tqyzXieNXoQvGbrHfLvm8Ke0U
 R9YrSC9juIh4NHkWFE/txn3VEmCJATn3eFdOJwalj87wfns+yLkEX2l5r5xd1Q08updmoTvS898
 7LBR3S34zDJ6fJVZTRL7RSz2AG1rZs/p2avurDE7oLf0HlhYDykBzFwgVxrqMGZDrBLprFXgFB/
 YEc8ncEDThvQtu/u91xUu2K0WvTDcnNMZ2AfetxjFPjhUnOM9kTClCpJ26JWMnrHvWJ41KcxcfO
 GBqsNO8mM9o+FHQjC1EVzRpma4xP4V1a0qA1ZGMSqK9TCVA7t4+NcWCi5DLpE/hPSRpNjZuka7t
 ylhRV
X-Google-Smtp-Source: AGHT+IHdccH4w20LAtL5Tnt1zvD+qT2oMJLO3EagpAUtyRarROFNC3ETwO4Ig2JSfhHI6IHFm6KeuA==
X-Received: by 2002:a05:6000:1546:b0:390:df02:47f0 with SMTP id
 ffacd0b85a97d-3911f7bb461mr2279778f8f.42.1741183772882; 
 Wed, 05 Mar 2025 06:09:32 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:334:5d7f:7a52:9e84])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4847e62sm21374802f8f.67.2025.03.05.06.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 06:09:32 -0800 (PST)
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
Subject: [RESEND PATCH v3] drm/mxsfb: Remove generic DRM drivers in probe
 function
Date: Wed,  5 Mar 2025 15:09:16 +0100
Message-ID: <20250305140929.174398-1-dario.binacchi@amarulasolutions.com>
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

