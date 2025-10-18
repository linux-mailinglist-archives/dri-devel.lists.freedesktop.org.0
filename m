Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C50BEC847
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 07:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E6610E365;
	Sat, 18 Oct 2025 05:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.b="Gjr6tysT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7DE10E1D7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:45:05 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-789fb76b466so2380496b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 22:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1760766305; x=1761371105; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQOTysCBScI2CzYaQCtToYUiGDVsPF1DI/yzJf9rUmc=;
 b=Gjr6tysTObc/jzjh/3h1vMengPF9rs+JiTONUzaspIJny0og3Bn50rPiS+yUxQnH/d
 gl7WE0FDXi9Z1I1y6hqvfPnyl0FvQCh3f/xEsTFc1La3OcDyXODi1mV76OjsU3yCU0PV
 rQiK47Tjoq2IXab1L2cfMrUj5tzFLzvTR8xtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760766305; x=1761371105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQOTysCBScI2CzYaQCtToYUiGDVsPF1DI/yzJf9rUmc=;
 b=JddF1luZ5jqbdM7bG4wTik9oUM30/+y3V9WFLGTyY9s4kjB8vMtpB3FMwfX89KTnnl
 PIFBnMHUViFn61ssVMXMwp2ybvzX+xh7UG9mHJlgYllNQ4SfYpXhmXEpSlUy7qQBsUaa
 v5YYSzPAQhs4tnK9H5McGVueKxVRHnFBst23trxP2QbxD7JpqCC/97v1plqqUOO2SeDx
 2IQkwzq3Nwo7BBlIM5HkEx+lcILNle+1oy2cuij5bQSWTeN8n+WKLARe26mc3GdQM2Mk
 vgedeWNE6p32Y3svDEtFfEIGvHUG6Yv+jycxWgS673s39oDPvn5sUw0o9Ad0DqqgT2Ky
 ClgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX91mQwZ5Am4dl27IN0t5T64o0qb1USbRPEkwZNa2Y8yHmTR5btoq//Rwgp6k8EeXsw9iMwMh/XedA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIB7FM3gV870kK18r/Ot0eVyxC0WUgf/QZKrsjqix+I+yEZw9y
 xrE9yQJoB3+2y21S8C5KRlhGLsbRycA0JITTpktQS1/tHdV6XwLe8hxlT5TIxJ/8Jro=
X-Gm-Gg: ASbGnctw45o/pSiUIMqtND+8ab46KfZACYAa5JWZb/sjtJUh9rU1jXmjdl5AdBkdHuZ
 y/H69FFcjhrbKuTViLMZibgnib7DL+H8ZAtWgFLoM+PyjZCtmx7902HRref6mh2sRAl5PnEhikD
 3+wFQwXI4srnDSP32N1yaTps91XNDr0io+BesMtL9hMqPZnDITTN3ZRWy+u4kP7zfbyzoL89EqR
 tdiDIzt3Bh0wQ2icbGrjUtO5XhpUL9d+1s+2UrLt4o+GA0UsOcPDk6VVg4dk46AqG9hL2p+ncRQ
 U3OKLTZVClMtyagHR3gd2uarIAv40F5yHI5/kuQsvTBEZoVLiSxxKsaCJp6JXqF7N06sLMDn5uo
 GOvmeharhhOiryEqgIF3a58t99QKCzBcnDnmNEDQ77gvN5ZRFRxxi6kXKDiaKC37c6eyC5xK8cU
 E6XwElyS605Bm0IEJsC0jK05MUd9jrln/CP8yxtbV60Ifn9jBWWAg=
X-Google-Smtp-Source: AGHT+IGy3J41ApbLMLRcrOO9pkHemkNxPjtpkJmBEBFlBmY9XVIw/TLuT/llEZB3A4RXYe9syKnQyg==
X-Received: by 2002:a05:6a20:b38a:b0:334:aa54:bb2c with SMTP id
 adf61e73a8af0-334aa54bbd2mr5825208637.8.1760766305361; 
 Fri, 17 Oct 2025 22:45:05 -0700 (PDT)
Received: from shiro (p1391188-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp.
 [153.222.3.188]) by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-b6a76645c61sm1657222a12.3.2025.10.17.22.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 22:45:04 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, wuhoipok@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/3] drm/radeon: Remove calls to drm_put_dev()
Date: Sat, 18 Oct 2025 14:44:51 +0900
Message-ID: <20251018054451.259432-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018054451.259432-1-daniel@0x0f.com>
References: <20251018054451.259432-1-daniel@0x0f.com>
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

Since the allocation of the drivers main structure was changed to
devm_drm_dev_alloc() drm_put_dev()'ing to trigger it to be free'd
should be done by devres.

However, drm_put_dev() is still in the probe error and device remove
paths. When the driver fails to probe warnings like the following are
shown because devres is trying to drm_put_dev() after the driver
already did it.

[    5.642230] radeon 0000:01:05.0: probe with driver radeon failed with error -22
[    5.649605] ------------[ cut here ]------------
[    5.649607] refcount_t: underflow; use-after-free.
[    5.649620] WARNING: CPU: 0 PID: 357 at lib/refcount.c:28 refcount_warn_saturate+0xbe/0x110

Fixes: a9ed2f052c5c ("drm/radeon: change drm_dev_alloc to devm_drm_dev_alloc")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index eb5138da8d5b..350f88af888d 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -315,17 +315,17 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 
 	ret = pci_enable_device(pdev);
 	if (ret)
-		goto err_free;
+		return ret;
 
 	pci_set_drvdata(pdev, ddev);
 
 	ret = radeon_driver_load_kms(ddev, flags);
 	if (ret)
-		goto err_agp;
+		goto err;
 
 	ret = drm_dev_register(ddev, flags);
 	if (ret)
-		goto err_agp;
+		goto err;
 
 	if (rdev->mc.real_vram_size <= (8 * 1024 * 1024))
 		format = drm_format_info(DRM_FORMAT_C8);
@@ -338,30 +338,14 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 
 	return 0;
 
-err_agp:
+err:
 	pci_disable_device(pdev);
-err_free:
-	drm_dev_put(ddev);
 	return ret;
 }
 
-static void
-radeon_pci_remove(struct pci_dev *pdev)
-{
-	struct drm_device *dev = pci_get_drvdata(pdev);
-
-	drm_put_dev(dev);
-}
-
 static void
 radeon_pci_shutdown(struct pci_dev *pdev)
 {
-	/* if we are running in a VM, make sure the device
-	 * torn down properly on reboot/shutdown
-	 */
-	if (radeon_device_is_virtual())
-		radeon_pci_remove(pdev);
-
 #if defined(CONFIG_PPC64) || defined(CONFIG_MACH_LOONGSON64)
 	/*
 	 * Some adapters need to be suspended before a
@@ -614,7 +598,6 @@ static struct pci_driver radeon_kms_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
 	.probe = radeon_pci_probe,
-	.remove = radeon_pci_remove,
 	.shutdown = radeon_pci_shutdown,
 	.driver.pm = &radeon_pm_ops,
 };
-- 
2.51.0

