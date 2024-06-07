Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855529005CC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 16:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BF110EC70;
	Fri,  7 Jun 2024 14:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gyEvcH73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2813110EC70;
 Fri,  7 Jun 2024 14:00:31 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso6610721fa.3; 
 Fri, 07 Jun 2024 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717768829; x=1718373629; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=smHlXdeijHe0Qv4gdPnMjOi/H4/3+n74NUKh1ac6v1Y=;
 b=gyEvcH73v6zVWDfJSAEHHM5N0tn6kXDssPdXq/n5r9vdqDhDT8DaesFvPVmTiCtsnc
 G3iZGlE6OP8/iYXs8enQTDwlUgrQ/uW0dYMASMJIRDJWpsAJKPiDxEar7U0oGDcdcdYr
 XOYOV+5EdN978RPlC6XF8BeGcW0lfyIBvB6mq/AvJ02nQBVM15k0eJaL/9razit2I+E3
 DKbhw6NxX+RLmWqSTK8dxMBAn9FM+X2izT4K0SojQOvANdO/kG6Kjq6WjOXKAhfRe/3G
 rSyUwWhNwTeAnAI89Dih1kCy4O+Uc1fOKn3DCMPs7mV6Ilkp5fMU3qhAWuHQaGGa20XO
 6UDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717768829; x=1718373629;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=smHlXdeijHe0Qv4gdPnMjOi/H4/3+n74NUKh1ac6v1Y=;
 b=Y/eZ6ABwieaIYeMm6sVu1ZqK/9vyfthicPF7iVkXLp2gIOeaIX3oPmgyKLa0L40+xO
 oGPHXemboK7OTCv7MkUTR1ZfPJ/5wSqldj8my0rThrYo385qUPoD9jY2zmxPCD2fDcLl
 MEZ3m2NVIjELIdg/WauA5CScj1+7kTXDQes+OXIKj14OuzZeUhLq+H23cndC8tHcgiUO
 j3EwKikjs7CFhP0mMypnuvSaBJEfo+jBP8AuDyyvaO9EmUHTL6xA07owB7qGTPYKPIhI
 6FDagxYyJpViPwiPx4oxgd8SilAEOlA0OC1uZ4bUMTcUDLQrzW1h1aWSS1tYiE7D4v3E
 lFMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLNuWhRJf9iVNR44hWLbkWQ7/QLIkiVrY44a/KlzGey874UCRu37VWq6eVqjbgPWcd1KEw8lKf/8G/aWsE7Wopg+2H+FVqeCGo8twnMrk453A5H299EkkeYfirsppTDYCPJXiOldCCcsonPHQD1Fql
X-Gm-Message-State: AOJu0Yytw6Fn1lmTU9WHoBlIyKJqjJwCVW9DwyRjOLxjPNYY65e53Ii/
 HXommY3HV2BrW5YZE1NT4hbsZBKtYJEYFHLyG9vsUdnKH3v0rywQ
X-Google-Smtp-Source: AGHT+IHR81iKUplsByiF1E+L/92JPbJTbqeGnU4taIDP/6XaWJzNK7gYiRIkjw6lHphiKZY7veQvQA==
X-Received: by 2002:a05:651c:a0f:b0:2ea:79b2:1839 with SMTP id
 38308e7fff4ca-2eadce281d4mr29893421fa.2.1717768828808; 
 Fri, 07 Jun 2024 07:00:28 -0700 (PDT)
Received: from kali.localhost (static.47.50.88.23.clients.your-server.de.
 [23.88.50.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c806ec844sm252472566b.120.2024.06.07.07.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 07:00:28 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Fri, 07 Jun 2024 10:00:04 -0400
Subject: [PATCH] drm/msm/a6xx: request memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-memory-v1-1-8664f52fc2a1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGMSY2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNz3dzU3PyiSl0T01RD46Qkg+QUQzMloOKCotS0zAqwQdGxtbUAG2Q
 NnlgAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717768825; l=4856;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=19tlOcfJuT/2kVzSY/jYIvVZ6Y8DgteEDTklyfN/YSM=;
 b=LovuAN+Yw05fo0LE4TjWvASYbGMde0nyU+ekFhEVleLCWxzSTpZLgPrOfhHwJkda4m0uefexE
 MQuMdmXQJmgAXSDd4LqRKtWw7WuMsDBrkwMhDt5JBPig0U5aBohe2hn
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

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>

Changes in v5:
    - Fix errorhanlding problems.
    - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com
    
    Changes in v4:
    - Combine v3 commits into a singel commit
    - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com
    
    Changes in v3:
    - Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.
    
    Changes in v2:
    - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..35323bf2d844 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -635,10 +635,12 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	a6xx_rpmh_stop(gmu);
 
 err:
-	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
-	if (!IS_ERR_OR_NULL(seqptr))
-		iounmap(seqptr);
+	if (!IS_ERR_OR_NULL(pdcptr)){
+        return ERR_PTR(-EINVAL);
+	}
+	if (!IS_ERR_OR_NULL(seqptr)){
+        return ERR_PTR(-EINVAL);
+	}
 }
 
 /*
@@ -1503,7 +1505,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1613,13 +1615,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
 	if (IS_ERR(gmu->cxpd)) {
 		ret = PTR_ERR(gmu->cxpd);
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
@@ -1635,7 +1637,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	gmu->initialized = true;
@@ -1645,9 +1647,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
-err_mmio:
-	iounmap(gmu->mmio);
-
+err_cleanup:
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
@@ -1762,7 +1762,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
 		if (IS_ERR(gmu->rscc)) {
 			ret = -ENODEV;
-			goto err_mmio;
+			goto err_cleanup;
 		}
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
@@ -1774,13 +1774,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
 		ret = -ENODEV;
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
 	if (IS_ERR(gmu->cxpd)) {
 		ret = PTR_ERR(gmu->cxpd);
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	link = device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME);
@@ -1824,10 +1824,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
-err_mmio:
-	iounmap(gmu->mmio);
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
+err_cleanup:
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

---
base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
change-id: 20240607-memory-45e13bb0cd16

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>

