Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC7912967
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A0210F1F4;
	Fri, 21 Jun 2024 15:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MXlEvh8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f97.google.com (mail-lf1-f97.google.com
 [209.85.167.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1B310F1ED
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:47 +0000 (UTC)
Received: by mail-lf1-f97.google.com with SMTP id
 2adb3069b0e04-52caebc6137so2322504e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983306; x=1719588106;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyhyZNYzJZMWcEKkEtqu/zIYQbwwWQ2taIlhFuVwBgI=;
 b=MXlEvh8UR6y9zJhRZ+no7ePdlZoO8d8nXGWE8jcwLUau96sCX8Az3Uf+lm7YQpsFnc
 1VOaOBnIqP1cfAKXg4wRWbTrPD42Trpv9wDC1uIll66QBPVlzhoUJKQFIbdRjqL3UtrJ
 hTC0FrbIDOrfGj0H9tPT61pnEGGSJ/XYLM/53e+7mBth0pnhSPvInB8ORMosxAOb5cx/
 D1D7gOMCO51dldHG6AnZeyx346ibOypZPKuCElcDRRe/VdgYD+bqMAZ/8XC4QLAHFGZs
 twombbaEtyYXtkOTabK3a8E/FNsP1/gAWknwtWRTSU+cyQolTvMVCVYmCy10TjKokGQl
 0vdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983306; x=1719588106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UyhyZNYzJZMWcEKkEtqu/zIYQbwwWQ2taIlhFuVwBgI=;
 b=Vgd2Obpyr7C88NeCnne3fZtdYQ1u4WM+Vt5DTFLSHuHM7vUG0YfsgW62pfkuZRqka8
 bzA4GRLnhAxvH3mTXBiKhZPgg5O65WwMAJgdXrFmFtEq3JOO5gfOS+86W7OIz8I762Zl
 m4fq2vh8ml6ezPkFXVW6pihttfbWEaKGidmt54kQNdMaCdHeghjjhmwOA2ENyaMphuuf
 5qjPGa5gdDGYK/Byuprkn5pVVMlrnEixD5mmvlc5Ix1UAwgy7vT3huHpo8DKIz4yPPEu
 1IwErsG0u71saP8dlRcM/ivdeLVkHlBZRE4XgfiljIbaB2HQeJmS3k4mBbdNZVfgFiQP
 yxaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+KjKJSfYAOR+3P8LdW4yBGXuVm0uu8l6N0zf2/fKAn9xyCi/zmf/3HiPrC7g5KRiRk5lhWeecUauJLf7WSqa/tNJU/0HgZwoHETrpF9aq
X-Gm-Message-State: AOJu0Yw2s37acpzLx1S5mrORD5DCSPLgGV9pe8UEq15ofN1tFbN8alCA
 fymkZ5U6YB14XATcetmwKkVc8YGPJdsAQi6ng65L1pStReFNdUVpHwgPxerD7B67M935wNkNleM
 zctXck5GUro4HT0tWL94GLU5/xl6nkW5x
X-Google-Smtp-Source: AGHT+IEzy0c9btukGFJ6okUY0C7VRXsWiZ5aEIO9glf3DhUD0vyjrHsCm+LtrR+ygU8xzrB3haUht0N5lPPd
X-Received: by 2002:a05:6512:1190:b0:52c:c9d3:a30c with SMTP id
 2adb3069b0e04-52ccaa62164mr6413916e87.29.1718983306094; 
 Fri, 21 Jun 2024 08:21:46 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4248179d31esm1117325e9.16.2024.06.21.08.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:46 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 28/31] drm/vc4: hvs: Change prototype of __vc4_hvs_alloc to
 pass registers
Date: Fri, 21 Jun 2024 16:20:52 +0100
Message-Id: <20240621152055.4180873-29-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

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

