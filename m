Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB0894677
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 23:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F62A10F56F;
	Mon,  1 Apr 2024 21:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UKVyQrvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F35210F569;
 Mon,  1 Apr 2024 21:20:35 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3417a3151c4so4222670f8f.3; 
 Mon, 01 Apr 2024 14:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712006434; x=1712611234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kD3x2Vpv4rRRlg0UeJbdnpqKNVktjGi2JfkyckAf+U=;
 b=UKVyQrvtzFWHzNvAya1oNHhPF7M1SBw95MTqdp4QvbMZyAER6UkbsgGwIqnxJuDbkO
 QYSbVVyX/n+JdNuG+Ek1tS+bUvAW/dXW3ABa3GZ0WD0podQV6eAvm7dg83qh7p0ugDRm
 beTcZfMGFvNYHOfhB2LbTSzMBECzN6Nr/4N2qLlGlZHMJbNL1Jk+KkVkuGRmtYlAhjQc
 gBwksw0qD2aqwzD+frxUkdwuEgLGLXuFrMaXjqCPLzReQifwoUGyWB9kpREAMH2MX/oX
 btIuJmL6R8VhMHm9RksUwM0E4V2assUYdFns3gOz7agytcxA4fZyFoUJrLchZKmm4Y03
 lWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712006434; x=1712611234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5kD3x2Vpv4rRRlg0UeJbdnpqKNVktjGi2JfkyckAf+U=;
 b=MwQ1PLV0nm/DDcCbdMzP3onvqlHllBdx44K0AxW5BMcxXpw80qNK6PuaKWHYhObA5V
 RSjC556H64MfhNo3+6tJ9dB/x0ss0XekNXOqcU1AMp8D4JzIWblQ5t+/RnDzHVfCzl2W
 J33QIjWuQGejsJUqXZMxgTgK3qDJWwFvXGL91fO6obtDpVhx1QBy5dLBPfwo8LfsXhY2
 8YEwq3Mv5OxHAUYzCVNEjtijxrVgQQC21eC7gG1xQkahnnsNJhIULlTU2qG/PviO0jB6
 9HCqH0MZOlpJwTPrrXpJGGtoWcuE5fAnN6RiMFijgNInDsRnx1psZ/i/AKpseXDzNRRe
 +5CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE2C9E4S21edC3w7EAl2mEEBfnsGON4uKeX9h7OiKCJ3Zn4sxsDlzLVSa0MiylMOR1gg86/X5lTB6XoagC5BNBgMdaIpMpQngiXY6libvDOfpqQEzets8H0K6uM7dFhjTDBTRFpo3oFcTSwg==
X-Gm-Message-State: AOJu0Yzwm+APoYY27YuIa0ApMLNl93pME3a0VWc5XBBRE6rmtdaH9yW7
 jDh5ndcxSJjPGpcCjywK4th2PzaIipgENZ5b0rNAmcYiybTMNLOe
X-Google-Smtp-Source: AGHT+IF+9DM2EH3iIHWHuUvHmkzQfQ0dzdotG5pPDIp6nR8wbDWj9i3ddRzNZY64OvElr9drec7iMw==
X-Received: by 2002:adf:e30d:0:b0:341:dedd:9726 with SMTP id
 b13-20020adfe30d000000b00341dedd9726mr8829521wrj.3.1712006433571; 
 Mon, 01 Apr 2024 14:20:33 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n12-20020a1709061d0c00b00a4da28f42f1sm5737881ejh.177.2024.04.01.14.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 14:20:33 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com, megi@xff.cz,
 linux-kernel@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 1/2] drm/lima: add mask irq callback to gp and pp
Date: Mon,  1 Apr 2024 23:20:01 +0200
Message-ID: <20240401212002.1191549-2-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240401212002.1191549-1-nunes.erico@gmail.com>
References: <20240401212002.1191549-1-nunes.erico@gmail.com>
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

This is needed because we want to reset those devices in device-agnostic
code such as lima_sched.
In particular, masking irqs will be useful before a hard reset to
prevent race conditions.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_bcast.c | 12 ++++++++++++
 drivers/gpu/drm/lima/lima_bcast.h |  3 +++
 drivers/gpu/drm/lima/lima_gp.c    |  8 ++++++++
 drivers/gpu/drm/lima/lima_pp.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_sched.c |  2 ++
 drivers/gpu/drm/lima/lima_sched.h |  1 +
 6 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_bcast.c b/drivers/gpu/drm/lima/lima_bcast.c
index fbc43f243c54..6d000504e1a4 100644
--- a/drivers/gpu/drm/lima/lima_bcast.c
+++ b/drivers/gpu/drm/lima/lima_bcast.c
@@ -43,6 +43,18 @@ void lima_bcast_suspend(struct lima_ip *ip)
 
 }
 
+int lima_bcast_mask_irq(struct lima_ip *ip)
+{
+	bcast_write(LIMA_BCAST_BROADCAST_MASK, 0);
+	bcast_write(LIMA_BCAST_INTERRUPT_MASK, 0);
+	return 0;
+}
+
+int lima_bcast_reset(struct lima_ip *ip)
+{
+	return lima_bcast_hw_init(ip);
+}
+
 int lima_bcast_init(struct lima_ip *ip)
 {
 	int i;
diff --git a/drivers/gpu/drm/lima/lima_bcast.h b/drivers/gpu/drm/lima/lima_bcast.h
index 465ee587bceb..cd08841e4787 100644
--- a/drivers/gpu/drm/lima/lima_bcast.h
+++ b/drivers/gpu/drm/lima/lima_bcast.h
@@ -13,4 +13,7 @@ void lima_bcast_fini(struct lima_ip *ip);
 
 void lima_bcast_enable(struct lima_device *dev, int num_pp);
 
+int lima_bcast_mask_irq(struct lima_ip *ip);
+int lima_bcast_reset(struct lima_ip *ip);
+
 #endif
diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
index 6b354e2fb61d..e15295071533 100644
--- a/drivers/gpu/drm/lima/lima_gp.c
+++ b/drivers/gpu/drm/lima/lima_gp.c
@@ -233,6 +233,13 @@ static void lima_gp_task_mmu_error(struct lima_sched_pipe *pipe)
 	lima_sched_pipe_task_done(pipe);
 }
 
+static void lima_gp_task_mask_irq(struct lima_sched_pipe *pipe)
+{
+	struct lima_ip *ip = pipe->processor[0];
+
+	gp_write(LIMA_GP_INT_MASK, 0);
+}
+
 static int lima_gp_task_recover(struct lima_sched_pipe *pipe)
 {
 	struct lima_ip *ip = pipe->processor[0];
@@ -365,6 +372,7 @@ int lima_gp_pipe_init(struct lima_device *dev)
 	pipe->task_error = lima_gp_task_error;
 	pipe->task_mmu_error = lima_gp_task_mmu_error;
 	pipe->task_recover = lima_gp_task_recover;
+	pipe->task_mask_irq = lima_gp_task_mask_irq;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index d0d2db0ef1ce..a4a2ffe6527c 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -429,6 +429,9 @@ static void lima_pp_task_error(struct lima_sched_pipe *pipe)
 
 		lima_pp_hard_reset(ip);
 	}
+
+	if (pipe->bcast_processor)
+		lima_bcast_reset(pipe->bcast_processor);
 }
 
 static void lima_pp_task_mmu_error(struct lima_sched_pipe *pipe)
@@ -437,6 +440,20 @@ static void lima_pp_task_mmu_error(struct lima_sched_pipe *pipe)
 		lima_sched_pipe_task_done(pipe);
 }
 
+static void lima_pp_task_mask_irq(struct lima_sched_pipe *pipe)
+{
+	int i;
+
+	for (i = 0; i < pipe->num_processor; i++) {
+		struct lima_ip *ip = pipe->processor[i];
+
+		pp_write(LIMA_PP_INT_MASK, 0);
+	}
+
+	if (pipe->bcast_processor)
+		lima_bcast_mask_irq(pipe->bcast_processor);
+}
+
 static struct kmem_cache *lima_pp_task_slab;
 static int lima_pp_task_slab_refcnt;
 
@@ -468,6 +485,7 @@ int lima_pp_pipe_init(struct lima_device *dev)
 	pipe->task_fini = lima_pp_task_fini;
 	pipe->task_error = lima_pp_task_error;
 	pipe->task_mmu_error = lima_pp_task_mmu_error;
+	pipe->task_mask_irq = lima_pp_task_mask_irq;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 00b19adfc888..66841503a618 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -422,6 +422,8 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	 */
 	for (i = 0; i < pipe->num_processor; i++)
 		synchronize_irq(pipe->processor[i]->irq);
+	if (pipe->bcast_processor)
+		synchronize_irq(pipe->bcast_processor->irq);
 
 	if (dma_fence_is_signaled(task->fence)) {
 		DRM_WARN("%s unexpectedly high interrupt latency\n", lima_ip_name(ip));
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 6bd4f3b70109..85b23ba901d5 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -80,6 +80,7 @@ struct lima_sched_pipe {
 	void (*task_error)(struct lima_sched_pipe *pipe);
 	void (*task_mmu_error)(struct lima_sched_pipe *pipe);
 	int (*task_recover)(struct lima_sched_pipe *pipe);
+	void (*task_mask_irq)(struct lima_sched_pipe *pipe);
 
 	struct work_struct recover_work;
 };
-- 
2.44.0

