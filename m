Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D40370136
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 21:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962046F5AE;
	Fri, 30 Apr 2021 19:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB586F5A6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 19:31:09 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso2297414pjn.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n2cccSkj7JXebjAACv3dY79CWkpF/3vnYkH0432vsN0=;
 b=lH+/t/xPez2h4UyesO9uFDNP4GndJvI8J25vCSNCbTSgYOm6a0n/oOU5sBKuVgOt/P
 eCGeKtjeGDaYJY1E+VCKIWGZ+qL+b21CQaaBmQYEva1JC5cnDwOMMhYT1RaUMgXgDlBQ
 ptm9KcFyPmY2Ac5hrtyDopsPvM3H004fDXyAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n2cccSkj7JXebjAACv3dY79CWkpF/3vnYkH0432vsN0=;
 b=mM4gsll2Y66vStUydX2OGlG+SJ2cYJ4XRh9aRWkoi/5vGfpGX18lKdBvawE+hEMVOH
 2gGo9cXav8XIJHieSCfI4RmBQzMqbIMGBybsIeQIAf31SuCn+fKqWyqdaAswDiq5EKiv
 5kHaK1jEOBxd863CMqpvmfrbmyWhPm/jNbh43QDmSyhLEKm30rcgaWBT3QtZ/yW5INSd
 /nfpcz5pDDmHEsWWHBhcbYVESY5IKZXwjxAt0uAxALOOb+WCUncD3sSocw7EGZ++9T/B
 a9Z110eJjYkUoi+C6cpKMCGeE0S3Y6y4HGOyNU5WjQcAabp0IdwflD68rqW6c5x7tJ9O
 geHw==
X-Gm-Message-State: AOAM533rKpgxMAV1KCnVstumtudopztpy/urJmUPQsA7YIfyPwQREkmY
 ILNUMvMyoslaHFppaWky5hLvIw==
X-Google-Smtp-Source: ABdhPJyCL+jzIviQs/sOUYaRU0bRw66UdTUP1twbpmgKv5DySUDv82iy4rCXRtq7Yo2AvxS/Z9LxiA==
X-Received: by 2002:a17:90a:d184:: with SMTP id
 fu4mr16218726pjb.79.1619811068914; 
 Fri, 30 Apr 2021 12:31:08 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
 by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 12:31:08 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/6] drm/msm: Use VERB() for extra verbose logging
Date: Fri, 30 Apr 2021 12:31:00 -0700
Message-Id: <20210430193104.1770538-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
MIME-Version: 1.0
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These messages are useful for bringup/early development but in
production they don't provide much value. We know what sort of GPU we
have and interrupt information can be gathered other ways. This cuts
down on lines in the drm debug logs that happen too often, making the
debug logs practically useless.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c      |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0f184c3dd9d9..b5072cec982d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -408,7 +408,7 @@ int adreno_hw_init(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret, i;
 
-	DBG("%s", gpu->name);
+	VERB("%s", gpu->name);
 
 	ret = adreno_load_fw(adreno_gpu);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 84ea09d9692f..cad65ec2acac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -24,7 +24,7 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 	struct dpu_irq_callback *cb;
 	unsigned long irq_flags;
 
-	pr_debug("irq_idx=%d\n", irq_idx);
+	VERB("irq_idx=%d\n", irq_idx);
 
 	if (list_empty(&irq_obj->irq_cb_tbl[irq_idx])) {
 		DRM_ERROR("no registered cb, idx:%d enable_count:%d\n", irq_idx,
@@ -85,7 +85,7 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
 	}
 
 	enable_count = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]);
-	DRM_DEBUG_KMS("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
+	VERB("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
 	trace_dpu_core_irq_enable_idx(irq_idx, enable_count);
 
 	if (atomic_inc_return(&dpu_kms->irq_obj.enable_counts[irq_idx]) == 1) {
@@ -96,7 +96,7 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
 			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
 					irq_idx);
 
-		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
+		VERB("irq_idx=%d ret=%d\n", irq_idx, ret);
 
 		spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
 		/* empty callback list but interrupt is enabled */
@@ -120,7 +120,7 @@ int dpu_core_irq_enable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
 
 	counts = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idxs[0]]);
 	if (counts)
-		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
+		VERB("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
 
 	for (i = 0; (i < irq_count) && !ret; i++)
 		ret = _dpu_core_irq_enable(dpu_kms, irq_idxs[i]);
@@ -148,7 +148,7 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
 	}
 
 	enable_count = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]);
-	DRM_DEBUG_KMS("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
+	VERB("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
 	trace_dpu_core_irq_disable_idx(irq_idx, enable_count);
 
 	if (atomic_dec_return(&dpu_kms->irq_obj.enable_counts[irq_idx]) == 0) {
@@ -158,7 +158,7 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
 		if (ret)
 			DPU_ERROR("Fail to disable IRQ for irq_idx:%d\n",
 					irq_idx);
-		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
+		VERB("irq_idx=%d ret=%d\n", irq_idx, ret);
 	}
 
 	return ret;
@@ -222,7 +222,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EINVAL;
 	}
 
-	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
 	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
@@ -257,7 +257,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EINVAL;
 	}
 
-	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
 	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
-- 
https://chromeos.dev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
