Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85BDB0B2D4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DAF10E111;
	Sun, 20 Jul 2025 00:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Re+zU7Eq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E1010E43E
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:02:06 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-236470b2dceso25968155ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752969726; x=1753574526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Kw76Jz9i353hbrop8cGWiVe9vi282Q4+/utlvXSv3b8=;
 b=Re+zU7EqLzKG9XxtlScFmk2JCWdVqflkuo+FLtLbdIbiMP+3+PGBJjv7tmG5Fnjgyz
 XRrJxJNS9Whgct5EIoW33paveLSNlKgUQQN6ad9AiLd69mX3zBn6d6UYJCp0p0xw3e0/
 oKmlO3JHvHlwMOWqIZBSDrxaCyFHdQigyWuDMF5CYTHS2isiPpEtdB5wY1DCNKjiy8lp
 bvxlqYWhUTKdx8KdYP7vufgmiHEoI4huIN57AUp2nPA8bPxeZL6KPuzt75F6NbKNlG3v
 b+MKw6c0qP/PRQ2Dzowi69y3j90VGCcg4cZq5zsPpmLukP3lPXrqku8nXwEBCbgpMf+g
 Fllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752969726; x=1753574526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kw76Jz9i353hbrop8cGWiVe9vi282Q4+/utlvXSv3b8=;
 b=PEcf47+j7EMQqpVfxBL5R3/zd58DKlQqZhMpvfA1dijmWyKpOw7TuiA8DIxlL9wJJQ
 hgbSaPZoxTA1A1v/DOUr3sfIlRJfE/ABW2dyvL2ubhJRHwpwo1EcrcsJdQhSAVUrGlZ4
 Jzk1P8L8OXxrkQuFHj5FjojMBCHk8yD51Gk8IQ1/IWZG7y31wf3vndWGPezTO6jNejfy
 Y9suXbxkaH84eUhgdcbp33H7uzqiAHyDC7Ku0DPjAtxUz6EIYmaR8CXQvHN97XAGLKag
 3VPomDD5xnzbMywzPATfZOLt3e7ndXX4nGjlFDhs86uqwX1NdvsnRgjmSvYoUeMxHy+p
 wPWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVel2pFnzOonhAWcU46Wo+CklaxPsc/G+2qYkmoCMW0EpskuKHhRU06Y3s1BXUKn+eUhXCFM0FEHbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9YEwMWJOGVqCfKFxSVhk5cJgd2iFLPawwPcxSr32YVGaFd4zx
 Xo/1F1aKkLj3GPj+x0L1tL0aoLCLYUiU4+piR8V4C78dC4+/mWTMMiGL
X-Gm-Gg: ASbGnctpwfhs6by4rw+x18WVBnX4/RXQ2AcvdWdQb2uS7qLcyp9QK31OlB+dD38nyz1
 95Zd7mdg4QVFPplaWouMLC3MiKIrhg17sW1tCqYaAHt0lbA+BoVmEnnAWvFg3BpDXq0cIEWP7sS
 Nq40aaI3urSVCcIz1v2vfg4Z9HL74h9+/yKlKRTI52v1MRrVtdWk0uJQ0P4Z3FPfVJjhOtvDvYR
 ZJWZZ88oFvb4uBcOKhKK2gJBmmbG9s3dc9W5iAnI5hewps9eMEoi8qiGPvTIBfEAhQ1O1buI1ln
 bgr7269plg12UbCiHQIaXt9WxjY+6XNbjSGo6FeW8bIknCD5DOsIXsEiRahLB80mOPquFRHFFii
 WKGU55j9dMMep0u0VhOcS/dcd6jj3zAwI63xcKz60cfEIMWq6Jjye
X-Google-Smtp-Source: AGHT+IGlu7vwH4vb6IK8SrRyjdHZdH5dvylEyVKd3I8vsGLrRQ7fxBW5rkDN3rKRn6mncsVcnVib+Q==
X-Received: by 2002:a17:903:166e:b0:234:c5c1:9b63 with SMTP id
 d9443c01a7336-23e256b73f3mr172523095ad.18.1752969725966; 
 Sat, 19 Jul 2025 17:02:05 -0700 (PDT)
Received: from localhost (111-252-5-201.dynamic-ip.hinet.net. [111.252.5.201])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23e3b5e2e3bsm34010605ad.31.2025.07.19.17.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 17:02:05 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/panthor: capture GPU state for devcoredump
Date: Sat, 19 Jul 2025 17:01:39 -0700
Message-ID: <20250720000146.1405060-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250720000146.1405060-1-olvaffe@gmail.com>
References: <20250720000146.1405060-1-olvaffe@gmail.com>
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

Capture interesting GPU_CONTROL regs for devcoredump.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_coredump.c | 85 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_coredump.h | 16 ++++
 drivers/gpu/drm/panthor/panthor_regs.h     |  6 ++
 drivers/gpu/drm/panthor/panthor_sched.c    |  6 ++
 4 files changed, 113 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_coredump.c b/drivers/gpu/drm/panthor/panthor_coredump.c
index 767f3327e3e8..a41d0bbcb4f1 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.c
+++ b/drivers/gpu/drm/panthor/panthor_coredump.c
@@ -7,11 +7,13 @@
 #include <generated/utsrelease.h>
 #include <linux/devcoredump.h>
 #include <linux/err.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 
 #include "panthor_coredump.h"
 #include "panthor_device.h"
+#include "panthor_regs.h"
 #include "panthor_sched.h"
 
 /**
@@ -19,6 +21,7 @@
  */
 enum panthor_coredump_mask {
 	PANTHOR_COREDUMP_GROUP = BIT(0),
+	PANTHOR_COREDUMP_GPU = BIT(1),
 };
 
 /**
@@ -46,6 +49,7 @@ struct panthor_coredump {
 	u32 mask;
 
 	struct panthor_coredump_group_state group;
+	struct panthor_coredump_gpu_state gpu;
 
 	/* @data: Serialized coredump data. */
 	void *data;
@@ -78,6 +82,63 @@ static const char *reason_str(enum panthor_coredump_reason reason)
 	}
 }
 
+static void print_gpu(struct drm_printer *p,
+		      const struct panthor_coredump_gpu_state *gpu,
+		      const struct drm_panthor_gpu_info *info)
+{
+	drm_puts(p, "gpu:\n");
+	drm_printf(p, "  GPU_ID: 0x%x\n", info->gpu_id);
+	drm_printf(p, "  L2_FEATURES: 0x%x\n", info->l2_features);
+	drm_printf(p, "  CORE_FEATURES: 0x%x\n", info->core_features);
+	drm_printf(p, "  TILER_FEATURES: 0x%x\n", info->tiler_features);
+	drm_printf(p, "  MEM_FEATURES: 0x%x\n", info->mem_features);
+	drm_printf(p, "  MMU_FEATURES: 0x%x\n", info->mmu_features);
+	drm_printf(p, "  AS_PRESENT: 0x%x\n", info->as_present);
+	drm_printf(p, "  CSF_ID: 0x%x\n", info->csf_id);
+	drm_printf(p, "  MMU_FEATURES: 0x%x\n", info->mmu_features);
+
+	if (gpu) {
+		drm_printf(p, "  GPU_STATUS: 0x%x\n", gpu->gpu_status);
+		drm_printf(p, "  GPU_FAULTSTATUS: 0x%x\n",
+			   gpu->gpu_faultstatus);
+		drm_printf(p, "  GPU_FAULTADDRESS: 0x%llx\n",
+			   gpu->gpu_faultaddress);
+		drm_printf(p, "  L2_CONFIG: 0x%x\n", gpu->l2_config);
+	}
+
+	drm_printf(p, "  THREAD_MAX_THREADS: 0x%x\n", info->max_threads);
+	drm_printf(p, "  THREAD_MAX_WORKGROUP_SIZE: 0x%x\n",
+		   info->thread_max_workgroup_size);
+	drm_printf(p, "  THREAD_MAX_BARRIER_SIZE: 0x%x\n",
+		   info->thread_max_barrier_size);
+	drm_printf(p, "  THREAD_FEATURES: 0x%x\n", info->thread_features);
+	drm_printf(p, "  TEXTURE_FEATURES_0: 0x%x\n",
+		   info->texture_features[0]);
+	drm_printf(p, "  TEXTURE_FEATURES_1: 0x%x\n",
+		   info->texture_features[1]);
+	drm_printf(p, "  TEXTURE_FEATURES_2: 0x%x\n",
+		   info->texture_features[2]);
+	drm_printf(p, "  TEXTURE_FEATURES_3: 0x%x\n",
+		   info->texture_features[3]);
+
+	if (gpu) {
+		drm_printf(p, "  DOORBELL_FEATURES: 0x%x\n",
+			   gpu->doorbell_features);
+	}
+
+	drm_printf(p, "  SHADER_PRESENT: 0x%llx\n", info->shader_present);
+	drm_printf(p, "  TILER_PRESENT: 0x%llx\n", info->tiler_present);
+	drm_printf(p, "  L2_PRESENT: 0x%llx\n", info->l2_present);
+	drm_printf(p, "  REVIDR: 0x%x\n", info->gpu_rev);
+	drm_printf(p, "  AMBA_FEATURES: 0x%x\n", info->coherency_features);
+
+	if (gpu) {
+		drm_printf(p, "  AMBA_ENABLE: 0x%x\n", gpu->amba_enable);
+		drm_printf(p, "  MCU_STATUS: 0x%x\n", gpu->mcu_status);
+		drm_printf(p, "  MCU_FEATURES: 0x%x\n", gpu->mcu_features);
+	}
+}
+
 static void print_group(struct drm_printer *p,
 			const struct panthor_coredump_group_state *group)
 {
@@ -111,6 +172,10 @@ static void print_cd(struct drm_printer *p, const struct panthor_coredump *cd)
 
 	if (cd->mask & PANTHOR_COREDUMP_GROUP)
 		print_group(p, &cd->group);
+
+	/* many gpu states are static and are captured in drm_panthor_gpu_info */
+	print_gpu(p, cd->mask & PANTHOR_COREDUMP_GPU ? &cd->gpu : NULL,
+		  &cd->ptdev->gpu_info);
 }
 
 static void process_cd(struct panthor_device *ptdev,
@@ -137,6 +202,19 @@ static void process_cd(struct panthor_device *ptdev,
 	print_cd(&p, cd);
 }
 
+static void capture_gpu(struct panthor_device *ptdev,
+			struct panthor_coredump_gpu_state *gpu)
+{
+	gpu->gpu_status = gpu_read(ptdev, GPU_STATUS);
+	gpu->gpu_faultstatus = gpu_read(ptdev, GPU_FAULT_STATUS);
+	gpu->gpu_faultaddress = gpu_read64(ptdev, GPU_FAULT_ADDR);
+	gpu->l2_config = gpu_read(ptdev, GPU_L2_CONFIG);
+	gpu->doorbell_features = gpu_read(ptdev, GPU_DOORBELL_FEATURES);
+	gpu->amba_enable = gpu_read(ptdev, GPU_COHERENCY_PROTOCOL);
+	gpu->mcu_status = gpu_read(ptdev, MCU_STATUS);
+	gpu->mcu_features = gpu_read(ptdev, MCU_FEATURES);
+}
+
 static void capture_cd(struct panthor_device *ptdev,
 		       struct panthor_coredump *cd, struct panthor_group *group)
 {
@@ -146,6 +224,13 @@ static void capture_cd(struct panthor_device *ptdev,
 		panthor_group_capture_coredump(group, &cd->group);
 		cd->mask |= PANTHOR_COREDUMP_GROUP;
 	}
+
+	/* remaining states require the device to be powered on */
+	if (!pm_runtime_active(ptdev->base.dev))
+		return;
+
+	capture_gpu(ptdev, &cd->gpu);
+	cd->mask |= PANTHOR_COREDUMP_GPU;
 }
 
 static void panthor_coredump_free(void *data)
diff --git a/drivers/gpu/drm/panthor/panthor_coredump.h b/drivers/gpu/drm/panthor/panthor_coredump.h
index dd1fe1c2e175..9e30c02ab962 100644
--- a/drivers/gpu/drm/panthor/panthor_coredump.h
+++ b/drivers/gpu/drm/panthor/panthor_coredump.h
@@ -40,6 +40,22 @@ struct panthor_coredump_group_state {
 	int csg_id;
 };
 
+/**
+ * struct panthor_coredump_gpu_state - Coredump GPU state
+ *
+ * Interesting GPU_CONTROL regs.
+ */
+struct panthor_coredump_gpu_state {
+	u32 gpu_status;
+	u32 gpu_faultstatus;
+	u64 gpu_faultaddress;
+	u32 l2_config;
+	u32 doorbell_features;
+	u32 amba_enable;
+	u32 mcu_status;
+	u32 mcu_features;
+};
+
 #ifdef CONFIG_DEV_COREDUMP
 
 struct panthor_coredump *
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..062f939e075c 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -65,6 +65,8 @@
 #define GPU_FAULT_STATUS				0x3C
 #define GPU_FAULT_ADDR					0x40
 
+#define GPU_L2_CONFIG					0x48
+
 #define GPU_PWR_KEY					0x50
 #define  GPU_PWR_KEY_UNLOCK				0x2968A819
 #define GPU_PWR_OVERRIDE0				0x54
@@ -81,6 +83,8 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
+#define GPU_DOORBELL_FEATURES				0xC0
+
 #define GPU_SHADER_PRESENT				0x100
 #define GPU_TILER_PRESENT				0x110
 #define GPU_L2_PRESENT					0x120
@@ -126,6 +130,8 @@
 #define MCU_STATUS_HALT					2
 #define MCU_STATUS_FATAL				3
 
+#define MCU_FEATURES					0x708
+
 /* Job Control regs */
 #define JOB_INT_RAWSTAT					0x1000
 #define JOB_INT_CLEAR					0x1004
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index eb45b5ad9774..a9fd71fa984b 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3670,6 +3670,7 @@ static void panthor_sched_coredump_locked(struct panthor_device *ptdev,
 					  struct panthor_group *group)
 {
 	struct panthor_coredump *cd;
+	int pm_active;
 
 	lockdep_assert_held(&ptdev->scheduler->lock);
 
@@ -3678,7 +3679,12 @@ static void panthor_sched_coredump_locked(struct panthor_device *ptdev,
 	if (!cd)
 		return;
 
+	pm_active = pm_runtime_get_if_active(ptdev->base.dev);
+
 	panthor_coredump_capture(cd, group);
+
+	if (pm_active == 1)
+		pm_runtime_put(ptdev->base.dev);
 }
 
 void panthor_group_capture_coredump(const struct panthor_group *group,
-- 
2.50.0.727.gbf7dc18ff4-goog

