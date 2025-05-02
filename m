Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F3AA7835
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B0F10E1F4;
	Fri,  2 May 2025 17:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fJjigTRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7B110E1B8;
 Fri,  2 May 2025 17:09:00 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22c336fcdaaso29792905ad.3; 
 Fri, 02 May 2025 10:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205740; x=1746810540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aiBf+M9AevSRFbcDBRImMhNuMe0eP7btRUGjQl2g/hw=;
 b=fJjigTRxVoje9nLmJWkkFjzb8RAsNscmE8SOvl30Vh62hIBaAKSsjn9t1rxgtmSYQz
 mGrki7R8LRhBGevVjZ6ZIPjY5U2kx7EDLq/WrVP16iQV0AcdCYTQJEWICBbHwYRmu5xJ
 EoQhHZzwBxZSrH/MskVyrdTkZ3p8bCg1jj445WSSNWm3oINCe05u5NZLgyG2WhEM9iX/
 nkCvdZaCaBiJD6NupD0mBoZES7+Zap+ux3WWXK91qAdcFLGq2gkxv3Yj3oP42d7vn3qJ
 27M8ZjcDGefjhCX91Ns7vWAzTepXn4ubm9X6AtJ5WdynUp1dwOVAgr9BQHizpMfi91+z
 7Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205740; x=1746810540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiBf+M9AevSRFbcDBRImMhNuMe0eP7btRUGjQl2g/hw=;
 b=tY9Rm9IoW1ffskK9d7YS0opQcCNju1Ny0oI6VuBp9Fj8ruT9QgYVITX7KEeUSeQato
 Ruryz+zfsghKk8ZRu4x3q/a02jhfqRLlc4NcFaQOGpQLhA9wVPdn4KWju2H4Wrlm+BcS
 rsXCHfI7vfl4qco9++42u+BkyrYqr1PKyBLIx+NOAyuquUhKvbVyTCrMHg0j6cVyllEB
 BZl2D8GN8mcuzKtssLMkU0vuDvrL6CrPRBod0tlAHYVLXIlgCFB+SMbmvZJMWmdCAgym
 b28fH79uWLhrYhNaK1zaA+lEPjyUL+fOGdLmFyBlTqg5NPD30SwkK34TYhWF6VdcBLMy
 I6gg==
X-Gm-Message-State: AOJu0YyJlVe9YOG4YBhx6DkZNg8f2ldETFJFtS9BsIr2EsP599tRCA55
 1CyMNPlP7/3Iufmkq+RlzwoLyAbEji6Q3hvQGEzjlR5TzgJTQ5vzIK8u0A==
X-Gm-Gg: ASbGncuLHc9hYm8sM6FzPg8xOywiHmll192G10nJpqMMRw7K9Y2uWmM6SShypmiH3MS
 pFFpfeRhho2ghEC061+MqB9IoUqfd21c5Sa7MBgeyoTm/tcF2Knl7X+XTxF5NHOxTOC7dsjAKL4
 Dkju6ol+N9C1kwB7TN3pym0b0QVDGgC063A5ej6ecc8Sc6EN+Qpr7lrgPlC6zix6PlSAU5LeXSo
 oR+wkTb8O2tVLqElMcPGYEgO6IuIfJJW7jSci0HcqyAU7WdYlnFX4Rmi3Cc6VrLsuMT+Y2Xb3t4
 +BQAjRIgjGS4/LpMh9mNL0iXXFnS5qPp7VDwlg5hXeDb7XCwmm1JY5wLQQM3RZyID11u81JquYw
 XK7z490ymuMOZNvL9w800CNSVnA==
X-Google-Smtp-Source: AGHT+IExsdglzZdSO+tWXuekRlcytOW4+n8JJyCS+4xt+lY90QebJwhnuMOcACjo90XWHTmvQbmCtQ==
X-Received: by 2002:a17:902:d486:b0:21f:507b:9ad7 with SMTP id
 d9443c01a7336-22e10340b69mr52050795ad.25.1746205739689; 
 Fri, 02 May 2025 10:08:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e15229105sm10062055ad.189.2025.05.02.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:08:59 -0700 (PDT)
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
Subject: [PATCH v4 20/33] drm/msm: Mark VM as unusable on GPU hangs
Date: Fri,  2 May 2025 09:56:47 -0700
Message-ID: <20250502165831.44850-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
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

