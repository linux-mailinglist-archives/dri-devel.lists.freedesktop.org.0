Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E896ABC661
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94A610E45C;
	Mon, 19 May 2025 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="giNQ4sx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA8210E45C;
 Mon, 19 May 2025 17:58:27 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-af548cb1f83so4295020a12.3; 
 Mon, 19 May 2025 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677507; x=1748282307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkF3rncj/rkQO6FWsPGasU3HuIPXC7SuBq50xwp/TTg=;
 b=giNQ4sx3th7EnZVTWPT5eq8sZLsgvIbjAh3tQlWKj7vOhiJjRvnx7P8lCvtRFaZFeE
 GZtmEYhbcvJ+ynkc4yYcBulfGpHO3/yXfPIriWt9GUbT51A62FZKcJsWNQP0IpLhFRD3
 cTiS4hODRyYWRyljTHJrhMHmxlZbMqg57gjOb6wbjisrhvjEmqGYsl3DxSNl4ZB692jR
 lerocf90URBzrNoKPZvClkX/Cjtm3w+xmmLQM+vUB74KN3VdVBA4wHBF00scAH9c+Bzm
 pzHFdOc/Et9YQ+BtuNgxePg2bFUAmxEvAYMr5VUWMwRYQNxbe7l4yvHfPwGeKr1wPUHG
 ASOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677507; x=1748282307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HkF3rncj/rkQO6FWsPGasU3HuIPXC7SuBq50xwp/TTg=;
 b=fJZOJ3QntpRCx393nwSOZ2rBPhoDzpLn45f7VHCkR/4A3myaZwlJW2L41HKp57SlbO
 jXUxeBho2PWj9udIcdyZEPRATU3LFKEUxbjaLyEM8G6NjDqGAQ4uDqLPSq0GDg0kvm1g
 g8BOOMVCk7Bn8KBQDBJ944PXRLKSbpuTVI5D+gOmrVMtEU3o3qmNwDeerPCuqbcH43xc
 +Et6KparNDJl974X/xhinHJ7zY7v8SADTJC6la/WPmUbbH3MnzgPUYlCWmICxsNgzNp1
 hhpXcTul92U41ut4s81EFor3jlOj70N3amokGdNZl3mCv0j00lHE5TPFO4mVHQ+nMcjV
 SQ5w==
X-Gm-Message-State: AOJu0YwikmPiUgC30sK8cnJF0N72nhDvCXzFRGNgzvFSAPAhvsZIo4pg
 C5ihXAo+fJZjVG185Mrm6Cu56EF9khn1uo6tbCJ65eSIPPDvz0opBl608XYgOw==
X-Gm-Gg: ASbGncvl/6oDP3MW8j8nSUh7E7ZLnweIpO8MlQ10RmsdnctNAnjVbkz7proyvxlmVpQ
 7fh3fjUwklGvBYorQ6RD92D5p1Z5b3Bt109xAJjxit7TWusGfcqJQnUOE4hr4zlhGfNiDS/RD9v
 /A2DRq5LRptvBEpvg3pMegKRYroRtfmtyBgDoC0vTezSx0b62sO4hg7ZhBwZfsQL+HVfBX+WSin
 0j3iKC5nhm8GcFR9qV0F3oa3DGNSNrSCAaCb6yX1pESBzSkynQaqm7VMZOHd39eZWaTj3CIeag6
 sbxaAo8JUVFqCqJtHvTsrDZ7V9gnfDE1sI6CeYvk9rJBs6JyVJ3XLWiQ2NJFkcPt0ToxJ4RBC1U
 uHV2JQge+Mm2tItUXN/xc+96Eng==
X-Google-Smtp-Source: AGHT+IEpah7ZiizvtAX0mFUqc0dXE4qmNDG9i9hxm1u0++6a0TW5fE3lhDJFlLqIxbd53kB+MIFJnw==
X-Received: by 2002:a17:902:ecd2:b0:231:d143:745c with SMTP id
 d9443c01a7336-231de35f0f8mr162321705ad.13.1747677506687; 
 Mon, 19 May 2025 10:58:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ebb0f5sm62714445ad.192.2025.05.19.10.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:25 -0700 (PDT)
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
Subject: [PATCH v5 23/40] drm/msm: Mark VM as unusable on GPU hangs
Date: Mon, 19 May 2025 10:57:20 -0700
Message-ID: <20250519175755.13037-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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
index 7a9bd20363dd..f282d691087f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -676,6 +676,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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

