Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6068C33C8
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 22:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A0210E139;
	Sat, 11 May 2024 20:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j1VoofTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDBF10E1E2;
 Sat, 11 May 2024 19:56:31 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a59cc765c29so685752266b.3; 
 Sat, 11 May 2024 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715457389; x=1716062189; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NGvm3p9bLyz+wL65ct/g8IDZ6ekVX//stBZqTjD+xqQ=;
 b=j1VoofTs02H5ZHhVK2GEXJPBiFGAJEBmNzmcABfjLW1+TxVTE9f11cFyHx8LPR83Qq
 jriSnrpdtuUgUUqe/jmDrJO3wtgNFXacLWIyAtTWYdS4g5s3LmgazDgLM5/xfVBgSTZa
 3RyDRNLBMbYDj8bi9n+x8/5enMeZMie7YuBxlLZQ8oDrqOqwiKYZbetGvzB4c/hAiidr
 01XqocRrp3PYps2R++8vBXODdr1bw14iOCNjwcPiXOWpxDAr9tE+pNKiD3SXsoSAxypq
 UoI0Pe4e1KfFNptxDTeTdLR5s3BtqQC5HbZico2oC7vlrPvWFR1ZtjXBzcgDnY7beoAh
 NFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715457389; x=1716062189;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NGvm3p9bLyz+wL65ct/g8IDZ6ekVX//stBZqTjD+xqQ=;
 b=B08xcGHNIKURW/55uhGIMSMF6hgqxeR9I6ixNaoHNRfK1JSYAcSeD/8y5gMYXSY4Io
 89XwVrYJIBfRQv95DJ6NIydPYSepkUAX7pcbM6LQeoNzgQ3irb+C9/jKDrF0F48ftQ+d
 sD/3Ip7mmfY5hMrLeFW2k51hdrsmFirasPMHuyvHCFWyK9swlYHzpxZkpwCgkekff57G
 UXDJb1k3Mc8UMrFoJksUXMLFlAyuWSmk1MMRcmMDqURLWAjXJUQuO/Vx5m3v6C893iFh
 J01VNHZP/fHwzyz1NCA8TeUqRh28bsW68q0C2tOu2gTmXouATYq84P8dblq7ExtxVsT/
 fvbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcnfAuNAcjJS7PyHeJv7oWrdiKxBQnrF0+uwhPCdsmPJgozEcyvQiMuNVCcXyo/tUK7DsF1oaLowXVOK9gIpn4NaL9vsYQZnlpnqpW4/q/XAC6RPz9PQGRnMk+TDmytObm9r1Fo6Qlhf4wCGNbFr31
X-Gm-Message-State: AOJu0Yy8aQdfZjDv2EOZjBuBi37klmbhk2lGgU99lf2g0/sv8emj+rAJ
 G8x3HUrFHoAttee390ydlRJwcSmr3TN2gZY2ug9m+flPPvhf4bmj
X-Google-Smtp-Source: AGHT+IF8McTVHedPSuIB5wsij8lnSLuLWg+aOftSh+YKkOPAG0g0Grl8ZL0aSd4tj4HMdc84OnD5Eg==
X-Received: by 2002:a50:d583:0:b0:56c:5a12:ac53 with SMTP id
 4fb4d7f45d1cf-5734d5e5066mr3799708a12.24.1715457389039; 
 Sat, 11 May 2024 12:56:29 -0700 (PDT)
Received: from kali.localhost ([5.208.232.15])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfe87sm3807787a12.53.2024.05.11.12.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 12:56:28 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sat, 11 May 2024 15:56:21 -0400
Subject: [PATCH v2] drm/msm/a6xx: request memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-msm-adreno-memory-region-v2-1-9f33f42e7b99@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGTNP2YC/42NQQ6CMBBFr0Jm7RimghVX3sOwgHYsk9iWtIZoC
 He3cgKX7+e//1fInIQzXKsVEi+SJYYC6lCBmYbgGMUWBlWrpm6J0GePg00cInr2MX0wsSsSqtG
 MZLr2clYERZ8TP+S9T9/7wpPkV6nvTwv90j9GF0JCq0+drjVp26ib84M8jyZ66Ldt+wKh85jfw
 AAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715457385; l=2298;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=k+MAjMj2wjU9VF/M8E+gsqgzopHilvL8N0NCA8TcfwY=;
 b=8s0VghrWWMpg7z31JDCVg/sR31wkqzyAuwh28K4fosIOnRkovI7Y2k1290HSp/JzJa8vLFzPL
 LSYW88pVFd2CImMLgi1L7Qo+HLPRU9qcyYCYui7I272Bu+pnYMGSHk2
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
Changes in v2:
- update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
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

