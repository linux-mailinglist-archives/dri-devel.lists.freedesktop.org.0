Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AD09E80BA
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2EF10E48A;
	Sat,  7 Dec 2024 16:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="guzRKycV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0FA10E484;
 Sat,  7 Dec 2024 16:18:05 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2ef748105deso1173002a91.1; 
 Sat, 07 Dec 2024 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588285; x=1734193085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXke5IvCE9wZOiP+FCq6Xvomp2+4wRzsSagcwog/vHw=;
 b=guzRKycVGH2jIX6bNM0yWvpMlJx19v+qbDl7LoqJnZz6lvpFKHlw9qkaVMrjPA9CJH
 Bse9qu1jqw2YmCYoeLlXQAI9y3CgmwpTRPU7oI4oIrHlf5E69AarKECiUuuMDU3QGAiw
 /lNdwwc99Ya/17JPQleAkBjUq/F4c7Ih1aAYp03HRBGfM7hSO2TUWoipv4e1u5LkHkN5
 KrkdTq3u2wtu6oNqjXlrrMBWO7a0psFw3exsPm3vNVQfVxsD8PdVoNr4kPT3z0dUDrwC
 XRttVHj0q7f+J/KMFn6wX8xmYwebycOEw5mEhTT4Py34JmQM0SA2Vss4kkCe73bovK3B
 n/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588285; x=1734193085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXke5IvCE9wZOiP+FCq6Xvomp2+4wRzsSagcwog/vHw=;
 b=kgyZQb8J0WI6ErBGblj+bY0KvgOGQu1/67jCUhwobLIml5AqB/nZ2k/GNIZ4ahR4VR
 hcqpBxSKrYU76bwpmxrmYbC6RIQGRsQuvPLedHeeMlEnEt5fn8/Tw84MVq43/lHRwNN9
 IB3qEn9fz6M+nZnKPau+JJ8U2CmMh6Ann++HA9XzzlvnYVgUqFH1ba+uK8SGSk2ujNSj
 rFuQgxUFC1HrZ7ame/fUDNLGwjVaSWb8FD537OpgEd+XnILXbh6KQC0JpTNUztsBHT/v
 q3Vj3RVEI1MI4frjWjRC8RlcozoZCJBqIrg/axXeM86qZK1J3TlKbdiojWz6gCQnGENi
 2y0g==
X-Gm-Message-State: AOJu0Yz8vhJPrhD9pVqhVjrMMkfL+0Fq32zFDIx9//Qf/NbcU1pB+RgT
 TfkCw+Q+cVS77Hmr2KeNfti8xgxiJxO/rWMwuBKbaevRZScnLoMS1xBYMA==
X-Gm-Gg: ASbGncuGyBJhYTzuLAKGmrPjVFrhdum6aukNNdJtWxLQBg7PqHExHV1SPmcJQlarKNV
 V2uLC39vUJKRbs7HfeYw2BcZzswmbf0cM+QA3SjOAXEb9HLzDRVKV+Dpz2OkAYwo0rNGdv9sozu
 X9z0Azrvy79VSbAsntLMYKjsUZk3Zo7Gyl6vEhknVnGQuBA9mmIGq70yOSgLpmO/aOSOV1KnROI
 7SBKD1YaksO/1JjHYlxvrbZBj6+5EbGP1FQcRk1uxLFaQSJ3IJ8BcnivYkxbMvLhOsKYBgfkW1e
 dMVbi5iU
X-Google-Smtp-Source: AGHT+IHSa++PBWaXO+f4dEH83U9tiDUIyMo+WVP1SNHlXxU8XN/RM6foAtjSKMWkqB9vnXfqmdxvmg==
X-Received: by 2002:a17:90a:c106:b0:2ee:f076:20f1 with SMTP id
 98e67ed59e1d1-2ef69199e7dmr10174908a91.0.1733588284796; 
 Sat, 07 Dec 2024 08:18:04 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef7dd1f583sm1967668a91.14.2024.12.07.08.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:18:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC 15/24] drm/msm: Mark VM as unusable on faults
Date: Sat,  7 Dec 2024 08:15:15 -0800
Message-ID: <20241207161651.410556-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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

If userspace has opted-in to VM_BIND, then GPU faults and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index acb976722580..7cb720137548 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -82,6 +82,23 @@ struct msm_gem_vm {
 
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
index 5e37e1dad5bb..79bbe552f23e 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -668,6 +668,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 5def12abac6c..72e5ad69a08c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -377,8 +377,20 @@ static void recover_worker(struct kthread_work *work)
 
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
2.47.1

