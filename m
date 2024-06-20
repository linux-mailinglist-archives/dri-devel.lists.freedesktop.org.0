Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DFE910A83
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0827710EAA3;
	Thu, 20 Jun 2024 15:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aWLBoLPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f98.google.com (mail-lf1-f98.google.com
 [209.85.167.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EFB10E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:18 +0000 (UTC)
Received: by mail-lf1-f98.google.com with SMTP id
 2adb3069b0e04-52bc3130ae6so1019981e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898436; x=1719503236;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ag1Gkygj9CnQzSM7zTNcU3JRjPry+I54iitUiQnXGYI=;
 b=aWLBoLPI9obykwhJH4qaZXUXt/YEb9+UZXE0mbYChV1hAwp9KObTyJ/seGU0srWdAS
 xmS8qZchjj0t63bm3f/4RWro22lB84UrmpuBtttUqeh6p6cXphKBXYH80uxwzqg6XPWf
 h1nbM+x1Q0foyQXhFSt2PTI8sqCWFRSp9wTq/QjPZNULlUSxmp//OVh3XMzRFt/6/4qn
 bviraPVrMvw5KB47BhUI4zAf6OmPAJr7PPdwEfy2bOVYim3Nz6VTXc6oHSoqtMRXTF/i
 vxD3qUyyp307JxOhjhyshro712rRgMF3daVtXguSDmrg+hONyLJFl65qNBNmIp1FbhiZ
 H+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898436; x=1719503236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ag1Gkygj9CnQzSM7zTNcU3JRjPry+I54iitUiQnXGYI=;
 b=ilIpsBdziA/Psr4qIUnTEXmaNKZjbGW5IyQmQvtgP/gqCGK27dwEtDBHsuXKxOfxfK
 ekIa3n5QDgehhm39c4QvNAal9Q4w6Z07yxoeSXjVxLlfNTmkK8zreggwaKw1SuNEio0i
 nC2wb9TvqjBZ0OhnK95NTrjzkLc9IJSVaJefX3cv8+bJlF3obtVEv+Qru5cwZOoaC/dj
 GS0KuJWeYiWLIeqUxptIY8svsoojq8UlmYTz5aUGaQdIh1iCTdb5hH71Qw0tfDXPlWl/
 3I7pfXeZpGh4LGVtry94BAZ4leShikEBYa47TN4y4l2/odWb6M0RJXzuLNujxlpz1dcg
 SkEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNXh7ifGsxeNP+CdkOZBd80m99kd75yMjBtP5xlrReuUrM3KtjIsmfhQ2KcwCXdbBSxB7+CZJSo5SE8bmlsqN+gGdOsfLnTP+EgCVE4Ogg
X-Gm-Message-State: AOJu0YyEIRORiFgxToe6nRwL5Jfaka6nHUj4w1EgNcVaJvlw9aHeT+qB
 +9/nGi+AA+DgrEQmmv1f+6/iKkyrI0g+1THgugX+MY9GxDn+ObCF57zzDCJgM1h1ezqLH6O7X4r
 51yBFroAY1hnv1UOKgdq8C9l4donkco5J
X-Google-Smtp-Source: AGHT+IEst78xQLYCbYe5ULXTN8GHUDjFSmNI6dsOa1pHMe/xM9aJDxzG/qaU7k5VIp3X5bRA3ewcDgvx5EgC
X-Received: by 2002:a05:6512:3c97:b0:52c:89b5:27b3 with SMTP id
 2adb3069b0e04-52ccaa5461dmr4241306e87.42.1718898434504; 
 Thu, 20 Jun 2024 08:47:14 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-36075123910sm838548f8f.68.2024.06.20.08.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:47:14 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 29/31] drm/vc4: hvs: Change prototype of __vc4_hvs_alloc to
 pass registers
Date: Thu, 20 Jun 2024 16:46:30 +0100
Message-Id: <20240620154632.4125308-30-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

The BCM2712 HVS has registers to report the size of the various SRAM the
driver uses, and their size actually differ depending on the stepping.

The initialisation of the memory pools happen in the __vc4_hvs_alloc()
function that also allocates the main HVS structure, that will then hold
the pointer to the memory mapping of the registers.

This creates some kind of circular dependency that we can break by
passing the mapping pointer as an argument for __vc4_hvs_alloc() to use
to query to get the SRAM sizes and initialise the memory pools
accordingly.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.h        |  4 +++-
 drivers/gpu/drm/vc4/vc4_hvs.c        | 16 ++++++++++------
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index 922849dd4b47..6527fb1db71e 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -175,7 +175,7 @@ static struct vc4_dev *__mock_device(struct kunit *test, enum vc4_gen gen)
 	vc4->dev = dev;
 	vc4->gen = gen;
 
-	vc4->hvs = __vc4_hvs_alloc(vc4, NULL);
+	vc4->hvs = __vc4_hvs_alloc(vc4, NULL, NULL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4->hvs);
 
 	drm = &vc4->base;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 559118824bf7..7a9faea748e6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -1004,7 +1004,9 @@ void vc4_irq_reset(struct drm_device *dev);
 
 /* vc4_hvs.c */
 extern struct platform_driver vc4_hvs_driver;
-struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pdev);
+struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4,
+				void __iomem *regs,
+				struct platform_device *pdev);
 void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output);
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 3f323a9d5e9a..fc147aff53c3 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -811,7 +811,9 @@ int vc4_hvs_debugfs_init(struct drm_minor *minor)
 	return 0;
 }
 
-struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pdev)
+struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4,
+				void __iomem *regs,
+				struct platform_device *pdev)
 {
 	struct drm_device *drm = &vc4->base;
 	struct vc4_hvs *hvs;
@@ -821,6 +823,7 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pde
 		return ERR_PTR(-ENOMEM);
 
 	hvs->vc4 = vc4;
+	hvs->regs = regs;
 	hvs->pdev = pdev;
 
 	spin_lock_init(&hvs->mm_lock);
@@ -1017,16 +1020,17 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_hvs *hvs = NULL;
+	void __iomem *regs;
 	int ret;
 
-	hvs = __vc4_hvs_alloc(vc4, NULL);
+	regs = vc4_ioremap_regs(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	hvs = __vc4_hvs_alloc(vc4, regs, pdev);
 	if (IS_ERR(hvs))
 		return PTR_ERR(hvs);
 
-	hvs->regs = vc4_ioremap_regs(pdev, 0);
-	if (IS_ERR(hvs->regs))
-		return PTR_ERR(hvs->regs);
-
 	hvs->regset.base = hvs->regs;
 	hvs->regset.regs = vc4_hvs_regs;
 	hvs->regset.nregs = ARRAY_SIZE(vc4_hvs_regs);
-- 
2.34.1

