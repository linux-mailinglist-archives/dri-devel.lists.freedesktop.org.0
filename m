Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3013D98A5EF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E56B10E501;
	Mon, 30 Sep 2024 13:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iiFrfIbe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E6810E500;
 Mon, 30 Sep 2024 13:52:44 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c883459b19so3727424a12.2; 
 Mon, 30 Sep 2024 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727704362; x=1728309162; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MLrAGGRIrPLNX0fIU3MHlAkZUYfcrMnizkIk1EY/dAY=;
 b=iiFrfIbedI8YgB6n1IBL2WG4vr9ADLdNVbfcUC87T3eWcXOzSIR6OEpyVOwR8Rkeun
 bNUEBOi0605mIw1FnbOe8rNfoX9m2MxyQp10ozQ4LsWrfDUZDlEg5vqQ92sqiO50fM9T
 w7YedBJFuE/7gMioKpcpOlXKCT2eVSMQjGF2iidiYJvAw1ikj2N/FqiHGELvUuMlkOET
 ivwK+pURhL0ErKZmVl1AVkMXlFhxZeHgE421v655XIkGeWtwlmycKzh2zMRexfcFLYM3
 dxVVqYTmljNolEGoWWdcjcRP97I+rbL1LshvEajXXe9kJccgbDH7hwPQPininS7lbcy2
 ZNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727704362; x=1728309162;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLrAGGRIrPLNX0fIU3MHlAkZUYfcrMnizkIk1EY/dAY=;
 b=Ubsk7FfoYLHr/n1oC2TLvnRpgLvwKBpKsxuyygpIl5Clw4eQx37HcM+YTCv5IqKWvT
 c3kHBNc5YRpvYbbl6FiGA4atU+f3SPU5R+9HYCvjzYgRgIigsM9qRBv8i4FC990hklIR
 lHrxihBdGEFztGRnqOh6l4ILF6Mj8soi1WdaDW8IQhHEFIeYm+5MT1yzq9IEDSiYIiU5
 HaDFaG+XV4X/ljoo1vTMBJDwREdgUHUlkax3dEJ2MZ0g4uRcFL5+uABNRvjW+iGwb+Zo
 hVIebqFhmA3Hpd3lFQ3+IPwPAaCV6lIWjcmDa1cm4NvPKTp1SidNWcGqU9y4ra7KWmhk
 8DzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT6J1W0Uu8K3xaGOwW+UOLt8fTq2bb5rZWKCeu2k9K3dJJ7eN6Iibrw94Ln5+miczujB1kCm38pik=@lists.freedesktop.org,
 AJvYcCXbX1N5XJ8j64ACKUNEhbmnOaHSIMdexKtCX554Sy3D8mo4FEis0qn8rqRt1iJADB/ey3CPpFEz9UIR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEHDGzYf3igFgs1cqlDBCEyBh07+U96bux9R5T3jx4JS9bOUnt
 OgPJ+s8zq6zVTFWOkPJDs+YigEKOdfDj8w4muq7a2C9DFU349kpP
X-Google-Smtp-Source: AGHT+IEFwDfI/yyd85ivmRYj59a+IDIZDYGFuKouqmE64yOQiR05oWwF2sdSrNbu7DDgzfcifNS3kw==
X-Received: by 2002:a05:6402:1ece:b0:5c8:9f44:a24d with SMTP id
 4fb4d7f45d1cf-5c89f44a2femr1198181a12.9.1727704361914; 
 Mon, 30 Sep 2024 06:52:41 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it.
 [95.250.55.22]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:52:40 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:36 +0200
Subject: [PATCH v7 01/12] drm/msm: Fix bv_fence being used as bv_rptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-1-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=1862;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=a7i9oji+Kb0tTlTXnErd/GxgUbRIJJuFO80e+whAz5c=;
 b=8RLHfSwmKTKKYIKNjHZtEWAuGYdw62UTNn2WYfVTjtQN2MI6YKOgdgL/t97WnkqA9PvydBoyX
 x5k4icV35nrDXQKKh9xUJbaUtjVv5cUD2YpFFwtzb6XwEPKxQusJI5q
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

The bv_fence field of rbmemptrs was being used incorrectly as the BV
rptr shadow pointer in some places.

Add a bv_rptr field and change the code to use that instead.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a5c90544922372cd46fbdd8cf359e..32a4faa93d7f072ea6b8d949f4dc9d2a58cec6b9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
 	/* ..which means "always" on A7xx, also for BV shadow */
 	if (adreno_is_a7xx(adreno_gpu)) {
 		gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
-			    rbmemptr(gpu->rb[0], bv_fence));
+			    rbmemptr(gpu->rb[0], bv_rptr));
 	}
 
 	/* Always come up on rb 0 */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 0d6beb8cd39a7b297e73741d2018915246a710d4..40791b2ade46ef0e16e2a4088291a575d3be9e82 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -31,6 +31,7 @@ struct msm_rbmemptrs {
 	volatile uint32_t rptr;
 	volatile uint32_t fence;
 	/* Introduced on A7xx */
+	volatile uint32_t bv_rptr;
 	volatile uint32_t bv_fence;
 
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];

-- 
2.46.1

