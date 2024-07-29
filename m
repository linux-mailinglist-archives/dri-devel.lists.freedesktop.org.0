Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC793EBA6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D1110E2CA;
	Mon, 29 Jul 2024 02:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="br6Lvn+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2613610E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:48:14 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1fc5549788eso19481465ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722221294; x=1722826094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uws88M38Us6mZwthahlWUK7fM6+CMa7f0lHdNpc5/ec=;
 b=br6Lvn+ZTlJPUggzF0teH/Su8I16hIdWTb3h7XeLYaoO0JzgPu+n4FBaFgeeNujbhR
 ghfEyWAEe0deanyP6bC38zBbkeyo2GHtPcF1AjDOekOj/W57pt5zgzw2jqvOEBAAQbgc
 hZfmMkyp+JXL1RY4MyCZ7687IaYrSsvc6S43y8ifgAJwqGrsKDy1h4o1SYGgHhm9S0Mn
 r5NIbxCeeFK6SHv1HQFraAredUjqk/sqt0nj3zhCn9aYYAQpJ59xQjctTlABqHpSRDVc
 ekIo39b5n/yzoztxl2fIeA+OUgGlahx8arLBjg3IEfDVF+NldZ+bv1c0j2ONP3LRUYKS
 b1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722221294; x=1722826094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uws88M38Us6mZwthahlWUK7fM6+CMa7f0lHdNpc5/ec=;
 b=olFdYvCjObLjE5nT/UQZZMwQ/eQUZALNUkXXHlx3KvCZ7RhSz4P0hTkqpatqNj0Nrg
 XnM+Jjpp0X0IVSsFVte0SerE8b1WzIsrpXF5PGOOOE7XQOoHMsFX9HedRIoii5/ewPf9
 whsCa2JVgpWwfg7ftEbPDjqfs3Tzq2WaI8zDyTyamG/I1FuzjKxiElA4h4JpwJyAEhpV
 Yln0dBgAgXUVAi/DWz8SPFeFZ6jD5oQxzvP7W6tHZ8zAz67DL/fTrHB8POufEb00AR80
 icsHn//urtk1gB9Bli2KY65+fZw560l9aOq3cpVmFTruSkyIg5IHbyQcC7NRcweOAMPH
 cvzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmyls/U4m1/GvHEZ9VSuYNhM/6Fm88/iQjduVXsZAIs7mbNdLwOgc9MmtlzsF+RyfSJ4OD82pG20EYHKLSdTiL40jfNUp7oM0+IqSvzR5I
X-Gm-Message-State: AOJu0YxgTMwEn1M9yqhF87qzYR9e+HSH2eZdB+C1JHnD/4hoEf/mnj48
 EYmeO2Ekm4KIRWGks6i2hpx6JQlDu6yVBAfEsIMmuqHO5ZGCkXtf
X-Google-Smtp-Source: AGHT+IGofcCeds74VK5yzpBY91R2MnaRyI1ieEFwQ1nBe/Bs8+j0QLJHRaMLwHU9stQw4nuIemwGyw==
X-Received: by 2002:a17:90a:888:b0:2cb:55f9:b7c5 with SMTP id
 98e67ed59e1d1-2cf7e1df02dmr7584677a91.12.1722221293603; 
 Sun, 28 Jul 2024 19:48:13 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.47.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:48:13 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Subject: [PATCH v4 11/11] drm: Replace strcpy() with __get_task_comm()
Date: Mon, 29 Jul 2024 10:37:19 +0800
Message-Id: <20240729023719.1933-12-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240729023719.1933-1-laoar.shao@gmail.com>
References: <20240729023719.1933-1-laoar.shao@gmail.com>
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

To prevent erros from occurring when the src string is longer than the
dst string in strcpy(), we should use __get_task_comm() instead. This
approach also facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
---
 drivers/gpu/drm/drm_framebuffer.c     | 2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 888aadb6a4ac..25262b07ffaf 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -868,7 +868,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
 	INIT_LIST_HEAD(&fb->filp_head);
 
 	fb->funcs = funcs;
-	strcpy(fb->comm, current->comm);
+	__get_task_comm(fb->comm, sizeof(fb->comm), current);
 
 	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
 				    false, drm_framebuffer_free);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 625b3c024540..b2c16a53bd24 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1411,7 +1411,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
 	rcu_read_lock();
 	task = pid_task(ctx->pid, PIDTYPE_PID);
 	if (task) {
-		strcpy(e->comm, task->comm);
+		__get_task_comm(e->comm, sizeof(e->comm), task);
 		e->pid = task->pid;
 	}
 	rcu_read_unlock();
-- 
2.43.5

