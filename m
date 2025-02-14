Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65427A360F6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5275C10E15A;
	Fri, 14 Feb 2025 15:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="a99HlAHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D0810E15A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:05:41 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5dee07e51aaso1589952a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739545539; x=1740150339;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
 b=a99HlAHWr2EfkDJu8e+3+vUeiOgfRgxHRO3lpi+X7E3gM1Ty1e9ZCCpy4Zc6xl+8HP
 LqQBC1ZEIFvDGwItclMu4WJ6qUGTnYQLPNYkVXCDVziakmGDUI0dtvpZx7GFd5EvMcY9
 g5yCWt6Ep6H29PqFOYLCKAgL60As6nF7s4b3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739545539; x=1740150339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
 b=GBBUvu8Fnl89kO3pNbtAVbVqi18rRl3iJ9Wa+EyUqHgyZUmy4MeiQR8PPD7fS1nI6a
 I3UdYSi/XYePLVpixw1smzkHI2N/n6H7J7Ac+vXBrmIJ6nxWQ1hGD+A3Q7fijBsDxxRm
 w0sywCZfM5XqiE3BJHJj2L+chLVuHx0KzloExttrMrAZGjDvDVpdmMlY6vQwW+tEISOy
 p3MfBeS0GGrArA7BEVkaAyfUGb12pq8hI85VsHnhYGD39PFhdU2fhHTVaU8k8tyOJJG3
 nvnTHhj/3nS0AbQnXlegrVrEK7uAaIExaZIaMf5agTQEgsX1quuCyAG4tY+0tBAe1sgI
 /jEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX9QnRg+Zn9gaVNb0b4z38t9g/ZyL5Q6Sih5EQHXK+xdnfm6iaTZNDxjne07UJIrJ3QI5RTeJPYbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw0OqoDcvitm2tnctVkoZpDhhBhyqGok50S4UGBU+0jU5ezahQ
 ai2GNX8882uJ3q5LYNzGH7Nr+dymVWb+PI7aU3CTXDEHfOjNQz6ydycxHBw6Iw8=
X-Gm-Gg: ASbGncsTKGz7tLlK9QnsXxa3UPlcNLXo1eEkZTFj8xjQLzi6ZxTlS9wgLFjhdVo0Dgw
 bUaramaMYAY7TI3Ayhpj24kULylicvhkk2xKxi5aB5LX3PoomzDuja0V00vQl6BrGmw0WoS9pFD
 IqoV5KY+90veT+8lxqM9PzNu/ZzaQPNIXvWnX3fbyMAZJUbwphbDdYmspKFtkQkSk0YdFRwx8TS
 SNk6oworzmQ7yzzP5UZ7oGViVEOurinrDMwxuTbbObeQLcqiVjDzrXgv2sPC91m84VLd+nyPOZE
 zjLesK6zLZFqZhBX1YMSAXPBJTkKprRXW23Q9BwbijhOt5QhufXc3lR1
X-Google-Smtp-Source: AGHT+IFZ+c7+go5Wo3r0b5Kv+36ob4O06Y3nn1YLZvsFSFjUvUi9yBoXLR53Qg4HfytiBB896uYB9A==
X-Received: by 2002:a17:907:2cc5:b0:ab7:d179:24a2 with SMTP id
 a640c23a62f3a-ab7f37149dbmr1273515166b.1.1739545530075; 
 Fri, 14 Feb 2025 07:05:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([176.201.8.20])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dedddd5b82sm1421906a12.30.2025.02.14.07.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:05:29 -0800 (PST)
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
Date: Fri, 14 Feb 2025 16:05:19 +0100
Message-ID: <20250214150525.1505210-1-dario.binacchi@amarulasolutions.com>
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

