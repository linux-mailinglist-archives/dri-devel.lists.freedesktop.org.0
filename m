Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C172A8C33C7
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 22:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6B710E02D;
	Sat, 11 May 2024 20:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cyIFQzGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14D110E468;
 Sat, 11 May 2024 19:36:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41b2119da94so19672315e9.0; 
 Sat, 11 May 2024 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715456159; x=1716060959; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rk1GGf5u2kjIs5FRwMwrvHf3FLz3D5a84ZblldMBK6I=;
 b=cyIFQzGoy9OkKRhG3JeDlPPR93Fqi7rJWYheJdTdCAGUoW0jloL48P9hkB31+6aKbT
 60agSuHPxQvobxr5tHLmNwXUV93KXCBxDgIzLmatcvQeG/gbO6M5/1jeNcZeBfyCYQWt
 F2QZrRJieFwOE0C/+QLudfBBfO1Zd8ZC65W89WqIyfV5NNZBgPsbRgQwtKxURHdg7gTk
 S+ynBpry0LbBLgEYoC/U7NC+GCfU9JvVpmZP56yrJPDUd6ycdb6W+WszCQ4EEWCQZMax
 ZyhEcg/OZ018nLPPknzMBgKGTxyCPHMGS+SrMULFI6GM+ly8Vhj+UvjU13L+mx8ZbeQn
 SWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715456159; x=1716060959;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rk1GGf5u2kjIs5FRwMwrvHf3FLz3D5a84ZblldMBK6I=;
 b=gjaGdCscsEe6ZMuxtRdTzbO3zDBSVdpx99kBjTUEGvkMHI+dSbEEjWoRc5CT4lLuSK
 tH+H94ilkP1nyPZSqKZdQZ5AVw3h1HNVzn3W2dGvoqiD7kTMu2P1z93XH0oNQEhaKpm0
 0fk4TEbJGEWlHT9JHkQ/nTnNw5V4XO2xDMhEXXtJvVBxkCtU+WIjn5sGR+8XPvHnUjGf
 8U855kMjfnT/WHnfyShD/CqOJsDF+v9nkt0Z0+OIoxZ2zstP2U0+sv0JLGqeGT30Nn3g
 Lj8ZrAah7BX3U3rmHOa0ovWORgxalNVt/Ken6f9SvLCpSFa7w/KKkwpbiblEfEy2u2Lv
 NBGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfmAZeDEzozCJwbrKjr2wRz/lgNOHGVPF0P7fkj3NAQY0LJT8mj+2SKO4OiXdYLQrvo68U7LDEww04gVZZ/xqSMGrg45sZt8ocKBmH977uxiTPp9qFFEFM8PS0CmMvzXxuPkJke4/scM03axAhaZlC
X-Gm-Message-State: AOJu0YzkUaYu4TU3En09Q+rEnq7cukIgeUQ2IwelUImMMj/Bc233FoxI
 zZX7PPh0l6W8UURdk7pwupLprBaShcct4YS3rS4bNvoflvqFMFLCfenQ9ru5
X-Google-Smtp-Source: AGHT+IHNZr5UOEOlj4LbyMiTffRVh/9Js+pHnWyuPyA8+dZpJwtYVgCLefI1MHZuCCqZvCMlnJBUJQ==
X-Received: by 2002:a05:600c:4686:b0:419:d5cd:5ba with SMTP id
 5b1f17b1804b1-41feaa2f45cmr37412975e9.7.1715456158673; 
 Sat, 11 May 2024 12:35:58 -0700 (PDT)
Received: from kali.localhost ([5.208.232.15])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41facbd295fsm125245835e9.36.2024.05.11.12.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 12:35:58 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sat, 11 May 2024 15:35:41 -0400
Subject: [PATCH] drm/msm/adreno: request memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-msm-adreno-memory-region-v1-1-d73970717d42@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIzIP2YC/x3MMQqAMAxA0atIZgOmqKhXEYdao2ZoKymIIt7d4
 viH9x9IrMIJhuIB5VOSxJCDygLcbsPGKEtuMJWpq4YIffJoF+UQ0bOPeqPylhGa2c3k+qZrDUH
 mh/Iq178ep/f9AM1XAQFqAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715456155; l=2175;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=OiMNVneXw39Z/+zBoGpu2bdamhnv48eIjRCJNeLqROs=;
 b=5UKYF4UqI69vJ0gbgJ/UKLd1lWu7EAUd4vrov1D/sQ4sogduWXDoZtBc4Xe9+JFyIxEhXz98m
 UO9OpHAI4ZWAUuRZuUFQjs2dSfE+hSH/g2IdcyRFdHq2yswd9yXJjd6
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=
X-Mailman-Approved-At: Sat, 11 May 2024 20:45:36 +0000
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
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..aa83cb461a75 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -636,9 +636,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
+		devm_iounmap(&pdev->dev,pdcptr);
 	if (!IS_ERR_OR_NULL(seqptr))
-		iounmap(seqptr);
+		devm_iounmap(&pdev->dev,seqptr);
 }
 
 /*
@@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1646,7 +1646,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
+	devm_iounmap(gmu->dev ,gmu->mmio);
 
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
@@ -1825,9 +1825,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
+	devm_iounmap(gmu->dev ,gmu->mmio);
 	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
+		devm_iounmap(gmu->dev ,gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

---
base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
change-id: 20240511-msm-adreno-memory-region-2bcb1c958621

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>

