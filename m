Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87795907F00
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D0110EBEB;
	Thu, 13 Jun 2024 22:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RZHFrm/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E4010EBE3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:36:30 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e724bc46c4so16883521fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718318188; x=1718922988; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J8NGTZXoOFTfLmhsazwKT2UsGEPrRF8ia337hm+GXXs=;
 b=RZHFrm/Miy/Lvgr4mxhVen0E69BvkbxIMgjHYiXJJBDog07axWyBm7HhnZy6OagQqa
 ARUtXYarnHE9Lbd9oHrFytfNQBg7dPlU1ZtXxRQVcV9AKJV+V/yhWB0IOvJ+pgbW13BZ
 XjMpfiWqU4eSENyh6KtexWjJuurlCjCGXe8STA+ZzKtPjL909PUO0szpu7ezHy/NylUV
 0nPjDwH/zdNP0nK97ZY0ErMJZAHYZal6loyiw/v8yNplbeqGGnf3jQodakgVjrSNZ0Zk
 OeJCQb1CAg+zbUu8t6WuaFkIcewvHQ3aSCU/BQZta4KudkTqHJIQeSR4NPqjYO0tQ+qO
 ZeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718318188; x=1718922988;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8NGTZXoOFTfLmhsazwKT2UsGEPrRF8ia337hm+GXXs=;
 b=mFdvsLSvNN9PLrJQYoRpy4U/UBRQZ7qnTLYHCDPW7CJQnAYvWSphLR5ue+gON/2sSn
 v0OJppiGCk16FholOoK6iVR3T8FyKWc1zkI+KpH+bmHnNBc+xCrOvx+h88HkMjrNPruL
 SHZd8vIj/nqfmTXXhHvMDhXzr1VPpxEQXssVV0Sn1d/ArjCEfNtHn442TN1ZQjFUbyJ0
 9uXBaW/blMMkk09AV9an+nxNfdNx74sqt/R9vMySMKeRGlK2+F2Z+zDm644laU50IMBb
 2ipu75XdDA77JAIhwq5QfR3AJHysDN9upD5/cIdT9HILPrnpLS9sun+ZooCN8XhYL2dj
 ZloQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZn1NCt5rvKya6jSOTwCAOnwrtVSGCBNsOqbT0Uc8ybsL3ECT4GYkClj82YxWtOS8541ODiu8Ult0yjbp+0VTQMWsLWP4aIC7eVq+vWM4v
X-Gm-Message-State: AOJu0Yz26Q7sUYxboe2w0nJ6BcP/MmHr8NCDC4pJCkH1eOx7gW1GGcus
 L52DmHzjOgOI7SPSyv60xQ2m9limbGAVaLeAPybYLDzdaTI+yOQD7ZuUY9YqYrEeOGphnsFK20H
 vFbM=
X-Google-Smtp-Source: AGHT+IHjnAgMZOb126beQwLBaABOMPxG56SlKC98+RTdmKWdSV+pY6of3i2I3dGzuV4k1XNP+EZZWQ==
X-Received: by 2002:a2e:904c:0:b0:2eb:eb0f:a822 with SMTP id
 38308e7fff4ca-2ec0e5d0c7emr5470821fa.24.1718318188647; 
 Thu, 13 Jun 2024 15:36:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 15:36:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:07 +0300
Subject: [PATCH v3 6/9] drm/msm/dpu: check for the plane pitch overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-6-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4803hWNpcHudkouDSAWKTu5smpjA3R/H+DmuPg5Dn0I=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1p2SdqUL53vFQ8s+nGjaJruG+mDfzqnZZ8/Xbg/ycrll
 nDa7ZeqnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyKVuDoYF5r4B6/xFP2/Q
 dtF0MfL9WPRA+f0xnwznNWssGSfLW1dO/7CCQ1JJT/j1k5tVHzPcNrpF1Tt5zlK5nNq4yU/73NN
 8LX0J7nn7prk5a3oun+8eFd/2wi1UbpdYdYt8TeT/RS35xbHtfw6fnaAYJP2ktixjW+K/q/aLzq
 qZlLVk86w4lPzLZpb75vkOavHvU2a0TOESUS39w5CilLv+pWJGmrXhGm+X7iChg47nmxpZL5xa1
 JLof033UXSCoMXJvG/WZ+TPv9GY7tIRYvUmcxp/odAT6/6IAzGbJ8/McNoRHewVKVeVtmBhsVBa
 afIBfZXHKiVPnr6qdw5eFBfKdrrx91s2g5SNHzbxmSUDAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4a910b808687..8998d1862e16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -12,6 +12,8 @@
 
 struct dpu_hw_sspp;
 
+#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
+
 /**
  * Flags
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 927fde2f1391..b5848fae14ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -791,7 +791,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -865,6 +865,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 	}
 
+	for (i = 0; i < pstate->layout.num_planes; i++)
+		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
+			return -E2BIG;
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2

