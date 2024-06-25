Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614719170A4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 20:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26B110E71D;
	Tue, 25 Jun 2024 18:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aAbVCyd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489FB10E71D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 18:54:50 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57d044aa5beso6817781a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719341688; x=1719946488; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RslMOok7+SRb0tZIuuUneQKJy4llxQByohMGQm6a7lg=;
 b=aAbVCyd1QvPpGO0ujdxzrwWFd9p9riBZhE3UBjgPMa/OkO29Rvx9GqSGHkU/O3PIuU
 LQw/ECqCFpXceXjrMs9VVxkGjnUXkiqc9jCr9Yr6ywGQLjxZiSvSh0BErfwqHt4m+LB1
 HfGARYfkh25eqIpXD4Mi1nslukfMHAHTD4PAF2IGhMvi4UpqWkCj3DjGEL1SeFR2NDCI
 BHRbR2nIbNnodXSEhEMNaoSVNF87jIUdcLkA3kC78oH9R9zHn2lTBINiVaoquy7cwEBA
 V9G1yn00skh8GS2Nt2TqgZV/xm1TtmtnLAlTaUJUVjpFerzXMz6aCo7XFIexmCcRhVWh
 bWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719341688; x=1719946488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RslMOok7+SRb0tZIuuUneQKJy4llxQByohMGQm6a7lg=;
 b=NZnUKTNJxjVz6ist3Qtj2NcG5n1gFq2z4Z/hMEfbILL4UUXY2gJqL3qh+Wj0IxPjw9
 41YwQpWwF4Y+dsaI7GgnKIG1YwXpjA7ixCKE6RsU5i+yQRndvYG+zXYc0SIgjuIzEOou
 e+BinH4s7UlKUFi8PW8i+2JSN0BK3rPfE/FbMt+ehxYBfUtYY8pS0hL4yKSykIkHeGiy
 aOZb6wtlmJIM1CEWZFGPhurgVWy6Dew9tAMlp3aSMFIlFyLk/XD/MX+ZLBdRLnSAEaZJ
 Hg5quM2gOxuf0Vq6CmnBvdqa+b+GppNK/agqMK5Wrkesc+k1rUe2k7pNVZe3BQpGVJ4l
 DTXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeiKPAKti/Y+4U++kxsYT7hc4UJ5YdussDnMlsku69hgIyaLE7ZBWrVWfVf9JkqSejWwiKcZLiuV0WiMbFz9wohfBZX/mJwPjuTRdA9cjO
X-Gm-Message-State: AOJu0YwQU4AUhIj3SB6cxD60if8jCOz6psLi0uxB1jCqV0+f1JNxVW/3
 8cyhtkobLVsHAisaExchxN/BSgOmbULd3OkAxaqFb4+mqBxkGen/vaEr7lTnzk8=
X-Google-Smtp-Source: AGHT+IGgV5XNEHZlscPIUwGZlGHAvsdbFXvfBd3MkXeqG+BdMPDfhtOjj2M3SWB0pI6uYjgg1nm5bQ==
X-Received: by 2002:a50:c343:0:b0:57c:7ce3:6cd9 with SMTP id
 4fb4d7f45d1cf-57d4bd8173amr6264270a12.23.1719341688229; 
 Tue, 25 Jun 2024 11:54:48 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30583e93sm6206332a12.96.2024.06.25.11.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:54:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 25 Jun 2024 20:54:42 +0200
Subject: [PATCH v2 2/2] Revert "drm/msm/a6xx: Poll for GBIF unhalt status
 in hw_init"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-adreno_barriers-v2-2-c01f2ef4b62a@linaro.org>
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
In-Reply-To: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719341683; l=1182;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IqxT/XaY/qre3pbFCzxDe2dM3jXz5RZUhwZonz27NSw=;
 b=bf4fOmgiiY9wBmlPLmScoY7M3PVhXAq9z2YI3hCMleizQn83eYlbtCBhdiLjMkanneiBIOPKC
 IrQh0EQxtzKBYdtR/m9m5FMJSE+oheGuEHORh4MyKpSMMYSeCtNfD4f
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Commit c9707bcbd0f3 ("drm/msm/adreno: De-spaghettify the use of memory
barriers") made some fixups relating to write arrival, ensuring that
the GPU's memory interface has *really really really* been told to come
out of reset. That in turn rendered the hacky commit being reverted no
longer necessary.

Get rid of it.

This reverts commit b77532803d11f2b03efab2ebfd8c0061cd7f8b30.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4083d0cad782..03e23eef5126 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -867,10 +867,6 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
 	}
 
-	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
-	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
-		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
-
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

-- 
2.45.2

