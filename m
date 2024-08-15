Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F326E9542E6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 09:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814C310E5B5;
	Fri, 16 Aug 2024 07:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FfIUkfIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B12F10E4E9;
 Thu, 15 Aug 2024 18:27:48 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a7d26c2297eso150262666b.2; 
 Thu, 15 Aug 2024 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723746466; x=1724351266; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VIguaDw6K3AjrU3ab+I5U80CnBvjwafBtu7HcwHufJ0=;
 b=FfIUkfIlYGGI+Khy71v+Ym9vzskU0PmYKkZruJ78BOa8wk3D9h5sPXJl6xWDk/+YLL
 W2NarWABAbCCukEUGSh95doP0U1w8BWvrtwmBYowimSTIo14aQ2ZxhDVHvW3r3gIMQIL
 AqCz5tngzppQrsZ92jPxvD0aUKeEaIg0Zk6ixes/gpzf+nCclC+uf2omti0m3Lz4B7Ya
 +AF8fP3Mljvch6H8LkuDOak2hG7i+AikpNIEpJFRi/TaYeoyxGeUtd78VyL9mx4Td/0t
 5bgXsylN9w7n54aLrFPLhSkxveJaVVKKZF8c5FwyDL1SplJq5YpmwK7NVobhnRwsL+wE
 o8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723746466; x=1724351266;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VIguaDw6K3AjrU3ab+I5U80CnBvjwafBtu7HcwHufJ0=;
 b=CaaNFhHOQxU5w1ync8VrNXQhkz/yuvTJt4fj8ka5iq5sfkjNvA5DFZPpoJ92YffRk2
 GgMUmYOjH3Iublkv7FpZThRrvqfV2zeM8gfh8rHR0ZIWjojcW+dwwPsm5aeIjE+/eg5k
 l1qh5AmgJ8eeNct9NpaPEfBjWh03WUeSaRsgdVvRm9oqqhSinOAX69UACfUH5/fb9duX
 A7ZiaGxqhOBmhjhvD21RxVPrQ7OVvd6tWf9SI2TGu8FpJkgLPr+R2+JypV3vcu1GJ6hB
 MWIIBGvtH96vT+JQXrUrxEySBV/rN6pClj+YWoGiievzHfSgmAAtCuBbvPQGncptMzRb
 RKyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy8cZzyLMp6h/M2T2McugmlaGJHz5n8TTsgrp+XydT+xrPsXoXYnYNEmQ8WIP3dGntqLA4MkpzNXWIiV6p5Se4iM4vsCnKGh5JMXfMwjHVaix5lXHYKpMaxjq8fb431fkbjesbnGo/dbNKpxGT96E4
X-Gm-Message-State: AOJu0Yzbz3qLFBOvM4jbDC+bOgP8pc6pMTi2jWJbGwiUFrCqnnohfMBr
 EIUE8l7lvzdn25CXl3MOrp+ZT4zjWf7kcWsEJkEHS4Dgzh56XIfv
X-Google-Smtp-Source: AGHT+IGwoWk5WigfEZ1u01jT4wrcamE5rN3NcH4p3UsMjt+Xgy/YrHe3X+lScoeKehIQ0Q1UjZVh6Q==
X-Received: by 2002:a17:907:6d2a:b0:a77:d773:54ec with SMTP id
 a640c23a62f3a-a83928a35abmr32107066b.8.1723746466408; 
 Thu, 15 Aug 2024 11:27:46 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it.
 [79.35.172.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 11:27:46 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:17 +0200
Subject: [PATCH 7/7] drm/msm/A6xx: Enable preemption for A7xx targets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-7-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=810;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=F0OWbgiTE8fXGsmJh+q0opfj9AJfdT04FvOWvOdcCSQ=;
 b=BFztRTD/A4FOBfCMtIL+mnc65TjK9/VuvpVb9pb+7bPx7c+q5F8Yozv2Fh++miUCLueSfzHDl
 jiVeUjL6PywDxlHahr7xKLG9M5lR4H+maEVZooy3X2FuQINLuCThaxb
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Mailman-Approved-At: Fri, 16 Aug 2024 07:39:16 +0000
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

Initialize with 4 rings to enable preemption.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 86357016db8d..dfcbe08f2161 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2598,7 +2598,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	}
 
 	if (is_a7xx)
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
 	else

-- 
2.46.0

