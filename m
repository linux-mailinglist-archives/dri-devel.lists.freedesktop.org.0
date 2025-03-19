Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1013A69161
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2813910E52F;
	Wed, 19 Mar 2025 14:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OScqQo18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3086410E52E;
 Wed, 19 Mar 2025 14:55:39 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-225b5448519so134861155ad.0; 
 Wed, 19 Mar 2025 07:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396138; x=1743000938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nim9kjrkjGdIN6eNBZAhPnqJ/xfEPzPRp5Qv43ty7PU=;
 b=OScqQo181Fe0T9GScctGqhqBWMkz4mwE8XsH4nrOJ3KNiiubRVTI8wkIYSgt3ljs/F
 /CVk61MRl+kXXeb1Ae0DZoCLZiKf5VgUeWWwrPx3H++F2d1z6MtHjVcY6mVyJyJ8/0Uz
 p/y01zoNSCWnPihT9oxalkF89xYbPSSsRqXsZthScNLR93ByhNbApTwrKB1DOHT4/hlA
 lmyaq+xTh9p0nCAodAYPEFyowVC9J/0wgDigmueZBYOCeTVyfpJkGFyydb3HA8YSulOM
 RDw15I+aMCWGB9FGLrON3dQefUcpF84uhJZRItI8Ow2B6c28qyk7wR2pU6A+eU/8tRb5
 YwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396138; x=1743000938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nim9kjrkjGdIN6eNBZAhPnqJ/xfEPzPRp5Qv43ty7PU=;
 b=mtokSpo7Nmx9haHs6d/miL+jp4fkKzHaqSQEV0odkQ07nisyml42cboQ+BgQTDUHvY
 8LBJ70A+nPODfvPm8cjMmKzMDTbYUOy5fMxSx1cF77Gv3Bvqfb1fv4PNVK2P8dyxg7Cm
 zI9tdxi9GublnVGzmmQ7Vk9Fo/7vvMoixhqKkLhgKkUKEyjQfoPSYMOS02iexoBOvPtZ
 7EF9N5OaQNVstzPyubRl12eLd75sZO+WGkpEvFifKr6dTb3P8zUMsBwwvKUXqCwvQVwG
 na6wfYXqQ/IjZop+l8/eE9yH6hOFIvoJJ27BUd0Ew3Zu17Dc3/8jek1sk0IPyBK+vobN
 OxSA==
X-Gm-Message-State: AOJu0YzODajs3/5WUZrytzLzBU/mooxE8NC8AyTYfFhA/GKBA2zB7+uk
 vcwdIm972r+GgLoFER3Othmfaq2kyJkB3fMgbfHbnRDAgRm0gz9xQ6h23Q==
X-Gm-Gg: ASbGnct/hES+ZU2Jcdv7CPB7NGAiYwLb+8hvfQkfXhGfTUG+Eqp3qxhvumps9ZYl+xL
 VfVuwthuLOqbxLGGL8uNNhvh2x8bdayS5fjB/4G8F4iYXKoS0EUTs+NvCPw9bsPr1YElKTlpv17
 04jD+cHPU99FkECPfMBYSkEQ702z2pJszHDAm9hKW5+pV0Fg20QRMU7YztkQkTtjY1a4NXgY/dR
 BsYzyujcu6PD/Rkx/TTK7jCftehxtqaR4+8octMwwh325sFVU3hwaIqlttXkbNGjfcmE/RxmeL/
 sfXD/a1tEATaZwr+FxLKhsgV4aYLtB3j5iVNO42NqFMjgHVjnOxtE8FiKgrHC67F76+GQIue5Gd
 zM0XPh/OrplyeDVEcxJo=
X-Google-Smtp-Source: AGHT+IGArp2n3VmhersmP5Pj7DoCKt1FlM2hckfmyKddMEM26QCObFWqRh+c2PJFcEiciG90iToiIQ==
X-Received: by 2002:a17:903:1d2:b0:21f:85d0:828 with SMTP id
 d9443c01a7336-22649c8f940mr50284065ad.41.1742396138086; 
 Wed, 19 Mar 2025 07:55:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c68ab4c6sm115203605ad.77.2025.03.19.07.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 16/34] drm/msm: Mark VM as unusable on faults
Date: Wed, 19 Mar 2025 07:52:28 -0700
Message-ID: <20250319145425.51935-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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
index 9731ad7993cf..9cef308a0ad1 100644
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
index 503e4dcc5a6f..4831f4e42fd9 100644
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
2.48.1

