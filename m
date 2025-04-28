Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37444A9FB15
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B7710EA4F;
	Mon, 28 Apr 2025 20:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jpyom8eM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEC910EA4C;
 Mon, 28 Apr 2025 20:57:33 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-306bf444ba2so5095909a91.1; 
 Mon, 28 Apr 2025 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873852; x=1746478652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aiBf+M9AevSRFbcDBRImMhNuMe0eP7btRUGjQl2g/hw=;
 b=Jpyom8eMtLxVCkKRLjt0s+ZPFQ6N98iUXW+wPsMVwRIqK4ARX0vEsUC8iS4YsdXXOJ
 9vJ/2PdjNjQafmBBhSwBdRczwQsp9Nvnpp0S9lfxRIRBHBCi1rhlVSE1ZdUiYLHDLhkd
 tVNZhqyCtg4xOT3e79FZw7+06eW50mXIXxNV8CiNNmIiv2ZNOSaGJhkeu95TJDkrLeIP
 9ri3jeCo9RzVrh8HODCCT1F+Vi57kPtRBZ7OlIxWZ13AHdYLP+rY8PTcykj9EDzqdPPR
 I78zOELO5IMnd2AQhve7XfLAiW3Ms3QryB6R0pKXowCTDVSnmQ7nJfMvScFzV1uAYFA4
 DJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873852; x=1746478652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiBf+M9AevSRFbcDBRImMhNuMe0eP7btRUGjQl2g/hw=;
 b=AbaskRlBT5LebO/eQASxE/oUCOXyR4PmBNP2vNMltzeWaKtmzd4DjUdFOMWLzYXfNZ
 icdtox0VufRkjgGFickyPN7vMbiXEc7OwuewESkm/01ouWsjlaTVRw6dICgPpniNVFbn
 yhlPkfDDqL65ciQroTg0sa1DSk7szbloZLkcUMK8UlwYdbF6PEvMLzqleobc9D2TE4Zc
 i/suh1tFi8VjX0wbMSJSsaB3gevCQGU3+o18lNWUi02LvAyLJih8oWV368Qu8rHTsm/Q
 bcJlYQSlrrzYrKYV/KTfWbHrPjOaDRJJYKCHdUa/PC7W7x0FpnH4iJbWeuS7kmz9fLAt
 d+tQ==
X-Gm-Message-State: AOJu0YzTu6ujko8z2EZvBUYQ45a+x6+GYLYF5zClMbm6xcEKLyY79ywf
 jT9Axvm1lioJYBXDEZu1LJtpR40sNCrYrQ/8VYenJW84A6porQyRZjzYow==
X-Gm-Gg: ASbGncsgupwo+Aw3/yPkADI+UyytlYrc3dclnFQ/u4NJSAgfkGHh4bTXoGdzydSKP+Z
 1Ik1HEqHsSxL2ad/dZaHLG4Wg2TSB/m0P2BhrLKFKzK4el8wdfumb2b/QkR3VFGICl43vM5RWK1
 /eSiJcSSRx1rX0RBalSCQ3P5p2SWR3qyF2d/wbEArSb527HMc5t+imOssjB1HOMHV5o7v1+kY4l
 o6/kiHaQTKr29WoOCfUqp6X4FKC90365XOr1n/YOiWco3okbFVf4kZzUlczrCtD3LTrgU9U5293
 ZuRVuXX1sK92J5eOXh0sP+hEtH7Nrm+G8fGjnVwFDNYJhR3odLbfLYzknbPG84R5YsbESJ6yZrb
 JzAR0d8HyLBlUqfngiut8TCCbPA==
X-Google-Smtp-Source: AGHT+IFXdzKrihExIBvfqNHYg+m/uQ//CudivqgcbuhjkyCtbbngu/oafymvsQox+HO003yzXlg4tg==
X-Received: by 2002:a17:90b:3911:b0:2ee:b875:6d30 with SMTP id
 98e67ed59e1d1-30a21551d3emr1804846a91.9.1745873852186; 
 Mon, 28 Apr 2025 13:57:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309ef1246d2sm9520720a91.36.2025.04.28.13.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 20/33] drm/msm: Mark VM as unusable on GPU hangs
Date: Mon, 28 Apr 2025 13:54:27 -0700
Message-ID: <20250428205619.227835-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index da8f92911b7b..67f845213810 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b7c7f6460aa3..375d89f23cd1 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -666,6 +666,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0314e15d04c2..6503ce655b10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.49.0

