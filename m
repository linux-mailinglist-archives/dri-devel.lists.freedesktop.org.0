Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41EDBB9A10
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 19:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2639110E083;
	Sun,  5 Oct 2025 17:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F69rnG1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35EF10E083
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 17:38:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso27304175e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759685909; x=1760290709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OLqw9GQUx0cKuTKkHqUH8puvEr9wdfKsNFqEgyMKdRs=;
 b=F69rnG1HbROx+YicfOaHr4vQAYAUdZSaGuPZGhW9I3VQFiAeoPHMM7z3JsxzFEMydI
 YaBmRKVWlSTVhtdPuVIvg1oO4VreLwQGTztHky843b/0lvSaul1QR2MihhFvhYYgV1PZ
 G4EK3aiwDOKI+5AsdKAfBJtx4K50jUWq+1WPQSLA6TOH3kfqwPW8mIV1ynHCMOGYmB+l
 k57tw0Y1K0Uq42fmtyaYesAW2HAiu2xZxbfBzn4J3xlxMadXooIvRuoVtucr9gPts8d4
 8oOcMnNBaM/jiRuJRWGRs8/UZLkmD0rC4TuPF2/q3zt//2RB2/h4vCX1rMWO2SUeHN6Z
 cw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759685909; x=1760290709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OLqw9GQUx0cKuTKkHqUH8puvEr9wdfKsNFqEgyMKdRs=;
 b=otue/R7vLaL4CrVvFuuhxxyzYHbNeTrxbVXgNb6cREEEet8e20k6xP10CeN8FyYzsR
 OFUjzZvWYDimUS5q1WDka5K9m7Cc5TVJgMtzRXq7g0tcwUn9Q7ZRjCChqGTpfJdvREIA
 KTlzoegaJ6iaW3iyJoA83AFdwBWcYSGbK1bqSDKrSK24FmY+8eLws5lqYXYc4i5TeYTP
 NLxgB4xL40YngZGFfphFf0RBwWVpi4iNkzW5HZmB7QrUnQTPtoGX/tGR+ALXjZ5EGVhe
 jI+uEAne9/hiCIe4da6JNhGk+bijpf26YL37+YkXsUfIpCYG8KucdqBUJ+OJ9KLZXP3B
 qWcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB4lDSClWmaO4hAR4TUhXBM+4tUYrWN67BciDpwHbqJHjKwko0YWnf0JQDFRcjW+Lp4HAIbL/0Rlk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFpfZXObafz7/TfU64tts8wERLP23fy9s8mTdLzURs0OCBPgkj
 FISXdfKU0utq/uirXZav+Ytv4YFbCfsa9BS68AzIAuy5MDHSIqTpQvVQ
X-Gm-Gg: ASbGncuQU3QxZzJUjW8h2JAJ0FqD3yMCXbLewst6gOMiIiOyTq588PTuw2bL+LtLXNT
 AMgB+ECn1hqEvAj+Z4QkfrmiUelruSTCM7mPWK2OLNWBMv8Z2RoIdri9fA749U0vg8GJVXcxWL1
 iqi5evCQZleWULkvbrXdFND+Vvz/whi27IAeYyOPRXct6o/2gVJpNnzDlV03dVxPzGwkbbISZHU
 4cYR/4C+dwUTC/v9AavyNc+r811tFyc+8jcyccq4gpOO5BwEd9Ql6AJUZu80FW6RQEeCNTSzj0z
 twXg/a9tP/EHrH50WH6shvcsO8EQhX86RrXJmiDNivio31F7zOL1tigqpYAYi5jxu0xdGPMR88X
 RCrpLgD4PkAUagGBgU5M3gHeS9u7b5sAF8u7xAli7WsYVFtc84hVI1WiIX9yoqjZD19lLrQGriL
 IJyATNO0LzBvZocg==
X-Google-Smtp-Source: AGHT+IEaKsxZHPdAaOgp5BYREYT6BZzg4XKffxkJUb2CuHtMDt5MPcCAPn47vcTvw2YbfoQe/z3Ccw==
X-Received: by 2002:a05:600c:c162:b0:46e:5100:326e with SMTP id
 5b1f17b1804b1-46e711440bemr64476335e9.23.1759685908971; 
 Sun, 05 Oct 2025 10:38:28 -0700 (PDT)
Received: from dell (117.red-81-33-123.dynamicip.rima-tde.net. [81.33.123.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46f9c8873f1sm19335655e9.8.2025.10.05.10.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 10:38:28 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de,
	u.kleine-koenig@baylibre.com,
	tzimmermann@suse.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
Date: Sun,  5 Oct 2025 19:38:12 +0200
Message-ID: <20251005173812.1169436-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
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

This patch wraps the relevant code blocks with #ifdef CONFIG_FB_DEVICE,
allowing the driver to be built and used even if CONFIG_FB_DEVICE is not selected.

The sysfs only give access to show some controller and cursor registers so
it's not needed to allow driver works correctly.

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index ade88e7bc760..a691a5fefb25 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -530,6 +530,7 @@ static int mb862xxfb_init_fbinfo(struct fb_info *fbi)
 	return 0;
 }
 
+#ifdef CONFIG_FB_DEVICE
 /*
  * show some display controller and cursor registers
  */
@@ -569,6 +570,7 @@ static ssize_t dispregs_show(struct device *dev,
 }
 
 static DEVICE_ATTR_RO(dispregs);
+#endif
 
 static irqreturn_t mb862xx_intr(int irq, void *dev_id)
 {
@@ -759,9 +761,11 @@ static int of_platform_mb862xx_probe(struct platform_device *ofdev)
 
 	dev_set_drvdata(dev, info);
 
+#ifdef CONFIG_FB_DEVICE
 	if (device_create_file(dev, &dev_attr_dispregs))
 		dev_err(dev, "Can't create sysfs regdump file\n");
 	return 0;
+#endif
 
 rel_cmap:
 	fb_dealloc_cmap(&info->cmap);
@@ -801,7 +805,9 @@ static void of_platform_mb862xx_remove(struct platform_device *ofdev)
 	free_irq(par->irq, (void *)par);
 	irq_dispose_mapping(par->irq);
 
+#ifdef CONFIG_FB_DEVICE
 	device_remove_file(&ofdev->dev, &dev_attr_dispregs);
+#endif
 
 	unregister_framebuffer(fbi);
 	fb_dealloc_cmap(&fbi->cmap);
@@ -1101,8 +1107,10 @@ static int mb862xx_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, info);
 
+#ifdef CONFIG_FB_DEVICE
 	if (device_create_file(dev, &dev_attr_dispregs))
 		dev_err(dev, "Can't create sysfs regdump file\n");
+#endif
 
 	if (par->type == BT_CARMINE)
 		outreg(ctrl, GC_CTRL_INT_MASK, GC_CARMINE_INT_EN);
@@ -1151,7 +1159,9 @@ static void mb862xx_pci_remove(struct pci_dev *pdev)
 
 	mb862xx_i2c_exit(par);
 
+#ifdef CONFIG_FB_DEVICE
 	device_remove_file(&pdev->dev, &dev_attr_dispregs);
+#endif
 
 	unregister_framebuffer(fbi);
 	fb_dealloc_cmap(&fbi->cmap);
-- 
2.50.1

