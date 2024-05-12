Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F218C3529
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 07:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FE810E0DA;
	Sun, 12 May 2024 05:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Anx9Q2LB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1747910E0DA;
 Sun, 12 May 2024 05:50:39 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-34d7d04808bso2475892f8f.0; 
 Sat, 11 May 2024 22:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715493038; x=1716097838; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L1XpgzHw/Nytzeexk8L71Zuu6UpL2KUJOeWc+Pl9H0M=;
 b=Anx9Q2LBYYdGG/wHGY0GXH+a+vfO4hYBBZBuHtM/XA/m5FlfafOTQWZTBEKh93BCWh
 +8MhRUZyTUk8aDhoYUlykDn+fZPuKQ6rx9WBV7JFN9iYIcE97ou7563+iCV6gPnwBcL1
 cvNKBrcVIfdeuXjAwa2R10gT/H5z24Z4W5N+0+SWIldGIN14q095lJvNzbivwvllIMOv
 h0VwiLQIdRA38aEaCJ247xbr7dHD72OdXF/tPfKoeGwwA80eVSiH6zecvZkvlejGSrXU
 /3uRDK4BvfyKDyHTn7xGF01dvI/ls/LhV/05x7LZ+/vvsZUMt2FWYUTTz0/gch/nmVCi
 7CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715493038; x=1716097838;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1XpgzHw/Nytzeexk8L71Zuu6UpL2KUJOeWc+Pl9H0M=;
 b=wBH3uq/rFPRWoj9YHs8pSe9HsYQ38bMnN7t8I/vHZf6jS1hin08Cu++tYwaKXTeHt7
 uPKLNuzHKurBjdFwc+xBDapA7rLIPc19hdjt5CF1uVJ/LG7yOyf30FuaIcFAfyl1H+En
 D/LOCCAxAtw53Caft3tHt2YPBm+/rl1zOmDHFpUfQ961RimbL/G5sAylMv8jAzwHyNnr
 odtE5aKAGUWwN/C483gLq59w5kbfdzYCJRXIMDc1DvTWoLEfZCmifDfvJ2hwvrk4/1x0
 pEgFuzWLXtE1yKmppT9e79eyW5UmomuVnGg4KjgGoqOidt15do3zIETJ0QFw/EVXiZz0
 BeUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw+KHbisb2k2p2cFFQT80dNbYjk1GelxYtHqiLSvuZ6K//wUfWF7mL5bgU375rCxSOgVMEfWeVBzGvZTwI0fOfzSlZpvUIpECGOQ1MebPiYiMcU9D23GqvR9NpGxBJB+FUajOYXcm/Th/r1CBxztAm
X-Gm-Message-State: AOJu0Yz/p9noU/bdnesEVvLVxzubetlww2TcPdmdE4IxXQa3WXo3x3vX
 II9sdYJsadZ0bJnm8ikH+JqJI18JqeSAa7Uc+c4XJ7RJvZqC/ziV
X-Google-Smtp-Source: AGHT+IGIegRhuRPR8A8oUnqlzeg+u+kIoiZi/2RatA7tPrm34L76cljbxtIM6JSDvoiVm0RVB2cSvA==
X-Received: by 2002:a05:6000:1d9b:b0:351:b7c8:3efe with SMTP id
 ffacd0b85a97d-351b7c83f88mr680423f8f.3.1715493038023; 
 Sat, 11 May 2024 22:50:38 -0700 (PDT)
Received: from kali.localhost ([5.208.126.127])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbde1sm8233658f8f.97.2024.05.11.22.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 22:50:37 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sun, 12 May 2024 01:49:39 -0400
Subject: [PATCH v3 2/2] drm/msm/a6xx: request memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>
References: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
In-Reply-To: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715493029; l=2351;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=Kt2K7zMmwsE77jHHj+rr+4K04ypr7zZgiyA3hJnQQlw=;
 b=+D9LeDZ7VE3tcvVCJr9j4KAbxEFaFEkYeJj75Ut20EejIA44pc07J/vbovudnIqib5kWvfbPZ
 l7q0Nf+92GNAVKmCJr9YUBXVhTeQMFS6KPXkILP3ksfLfCoehZPdvbg
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=
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

The devm_iounmap function is being used unnecessarily,
managed resource mechanisms (devres) are handling resource cleanup automatically

This commit removes the calls to devm_iounmap and relies on devres

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aa83cb461a75..d64bf6212d6f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -524,9 +524,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	uint32_t pdc_address_offset;
 	bool pdc_in_aop = false;
 
-	if (IS_ERR(pdcptr))
-		goto err;
-
 	if (adreno_is_a650(adreno_gpu) ||
 	    adreno_is_a660_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu))
@@ -540,8 +537,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	if (!pdc_in_aop) {
 		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
-		if (IS_ERR(seqptr))
-			goto err;
 	}
 
 	/* Disable SDE clock gating */
@@ -633,12 +628,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	wmb();
 
 	a6xx_rpmh_stop(gmu);
-
-err:
-	if (!IS_ERR_OR_NULL(pdcptr))
-		devm_iounmap(&pdev->dev,pdcptr);
-	if (!IS_ERR_OR_NULL(seqptr))
-		devm_iounmap(&pdev->dev,seqptr);
 }
 
 /*
@@ -1635,7 +1624,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
 	}
 
 	gmu->initialized = true;
@@ -1645,9 +1633,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
-err_mmio:
-	devm_iounmap(gmu->dev ,gmu->mmio);
-
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
@@ -1825,9 +1810,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	devm_iounmap(gmu->dev ,gmu->mmio);
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		devm_iounmap(gmu->dev ,gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

-- 
2.43.0

