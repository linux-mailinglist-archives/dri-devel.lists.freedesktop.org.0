Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC193A79B92
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 07:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70A910E905;
	Thu,  3 Apr 2025 05:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D8kiySLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7245310E905
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 05:52:17 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5e5c9662131so867400a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743659536; x=1744264336; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKTRZmv77HTmpqOJnfj99p0xYiAgz1IADbNWkm67q0w=;
 b=D8kiySLaq7xHdSWQVeUV7ebmsHHHMF5LZJAjSaS4P4j1BOf20snpSrrBia0Gy3jeSD
 mXhGjHd6+xBchATXLRooTiG3A0tSyVuIMd2wi+KmCnMAZbZc5mCfX3QTerPHy2FLG8xk
 oyl2bWWjSaA+21ZMgB0pXb1f/m3NsY/bxAhmm8bNNeUMUHK+8Jio5WHwUnvNu3EcmaOq
 g7499+qTUOhxGpIWskiGXgxzdKL2gyGPhCrZ2IFmtTCJKPIEzmxhbJw6Y9+677gUsAjI
 UHKp3zbhvb7CmJvbLLyOfIwNscvLCwNY3xSk5XZT0lYi2IubKN1N12oUOqmqlTaAboW0
 HCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743659536; x=1744264336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKTRZmv77HTmpqOJnfj99p0xYiAgz1IADbNWkm67q0w=;
 b=H90j4CSVlzSoTrvcx9va/U+Nv0SIkeVQbpVtgK7r4kYL4ajNgChdlmExGGcLn0Ll0K
 ZmW2khJeAd0DuZy4PTzIjbPA8w4QL5A6cIK149R6INU2x0EFW3vpcuBQHS0/WIIDRMOl
 bDDc9zJ5VSmOJIFDNnmCM0zj1485wuO0NDlHip4huv1+Ix0LvW85HlzD+6LjIGdx9tvl
 fNBk0UXQSVliyq19Oz9lPNB0D+jxisxjbIICL12LglARHxRGHhSY9JwuCHuHAieKzaD5
 7UpvQgLPOmb4Mz6PV08Vj6p75e3egJ9pAIj7hzF7pCBpmdq8PTl34mDdTJl7Nan5R+SF
 TzKg==
X-Gm-Message-State: AOJu0YyZLsHStbW2DIRr/XC1sYNt7peuWT3HfieZxTPjCEkVn9z2E4vm
 IbEVmAiOeog6z6fWb2Z/pEkaGTT2ABPd4yT4Ck8Z8UgwLP/gUUqy
X-Gm-Gg: ASbGncvJTdE9m1jO9A+ewGBMwRskcmVYh9U2ODyxLfSbZzCJyU3wyxb4Oiv0ROuDcci
 GsYTo9r0I9MjTNcISwIVmGhkVgeMysh6BmyH2fcyM0+0qJ8s26YmsCpchfMjAv3ks/h1vrcopOk
 X7nkHvSEWvlaS+Xea5QzJU2qJ43uOqal7WfSliz19kzyOAfmFtAvDhiqOs2K4J3NMJTEr1KoCVh
 1eIAC87GYBtEs+Jwf16Or58THT/89UUKWKoKZl8G/aR/YSheLqMhnCiDMFBEwkZBLGEeGjq2ykK
 0TroPmHBN/rJISlTE+d9TNDwRvpiavXBI5SdpYbVcH18OxveMpS7J/yaEyeExAPo6tP6RD8KUBr
 aYjuIrHCyVr8AMbwwaxcYyGvkFbRHuSU=
X-Google-Smtp-Source: AGHT+IErNtuWo09KLUdY+qpohmLzPpx+EJwT2QrMD64lmhMArDMJQJ6Z7Gp9MWYxCImCbb3JWo9XhQ==
X-Received: by 2002:a05:6402:510a:b0:5e7:97d2:6d10 with SMTP id
 4fb4d7f45d1cf-5edfdf190cdmr16383892a12.28.1743659535771; 
 Wed, 02 Apr 2025 22:52:15 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be.
 [81.240.10.146]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 22:52:14 -0700 (PDT)
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] drm/panfrost: reorder pd/clk/rst sequence
Date: Thu,  3 Apr 2025 07:52:10 +0200
Message-ID: <20250403055210.54486-4-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403055210.54486-1-simons.philippe@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
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

According to Mali manuals, the powerup sequence should be
enable pd, asserting the reset then enabling the clock and
the reverse for powerdown.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 93d48e97ce10..5d35076b2e6d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -209,10 +209,20 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	spin_lock_init(&pfdev->cycle_counter.lock);
 
+	err = panfrost_pm_domain_init(pfdev);
+	if (err)
+		return err;
+
+	err = panfrost_reset_init(pfdev);
+	if (err) {
+		dev_err(pfdev->dev, "reset init failed %d\n", err);
+		goto out_pm_domain;
+	}
+
 	err = panfrost_clk_init(pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "clk init failed %d\n", err);
-		return err;
+		goto out_reset;
 	}
 
 	err = panfrost_devfreq_init(pfdev);
@@ -229,25 +239,15 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 			goto out_devfreq;
 	}
 
-	err = panfrost_reset_init(pfdev);
-	if (err) {
-		dev_err(pfdev->dev, "reset init failed %d\n", err);
-		goto out_regulator;
-	}
-
-	err = panfrost_pm_domain_init(pfdev);
-	if (err)
-		goto out_reset;
-
 	pfdev->iomem = devm_platform_ioremap_resource(pfdev->pdev, 0);
 	if (IS_ERR(pfdev->iomem)) {
 		err = PTR_ERR(pfdev->iomem);
-		goto out_pm_domain;
+		goto out_regulator;
 	}
 
 	err = panfrost_gpu_init(pfdev);
 	if (err)
-		goto out_pm_domain;
+		goto out_regulator;
 
 	err = panfrost_mmu_init(pfdev);
 	if (err)
@@ -268,16 +268,16 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	panfrost_mmu_fini(pfdev);
 out_gpu:
 	panfrost_gpu_fini(pfdev);
-out_pm_domain:
-	panfrost_pm_domain_fini(pfdev);
-out_reset:
-	panfrost_reset_fini(pfdev);
 out_regulator:
 	panfrost_regulator_fini(pfdev);
 out_devfreq:
 	panfrost_devfreq_fini(pfdev);
 out_clk:
 	panfrost_clk_fini(pfdev);
+out_reset:
+	panfrost_reset_fini(pfdev);
+out_pm_domain:
+	panfrost_pm_domain_fini(pfdev);
 	return err;
 }
 
@@ -287,11 +287,11 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
 	panfrost_job_fini(pfdev);
 	panfrost_mmu_fini(pfdev);
 	panfrost_gpu_fini(pfdev);
-	panfrost_pm_domain_fini(pfdev);
-	panfrost_reset_fini(pfdev);
 	panfrost_devfreq_fini(pfdev);
 	panfrost_regulator_fini(pfdev);
 	panfrost_clk_fini(pfdev);
+	panfrost_reset_fini(pfdev);
+	panfrost_pm_domain_fini(pfdev);
 }
 
 #define PANFROST_EXCEPTION(id) \
-- 
2.49.0

