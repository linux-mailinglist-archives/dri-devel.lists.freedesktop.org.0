Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C08ABBCA
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 15:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AF9112057;
	Sat, 20 Apr 2024 13:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZHmgCeed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8D2112056;
 Sat, 20 Apr 2024 13:42:05 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-56e37503115so2595581a12.1; 
 Sat, 20 Apr 2024 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713620523; x=1714225323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xUWMQtOMtHcstc/cIjPR41dHaXRQKi9outRFsvRo7/4=;
 b=ZHmgCeedLzojPuv11h/j3p4JIOT+SSrrAUdDEer1hdKGo6mHbJ0RBUAv0Vr0QJURQZ
 4e1XkxGYHg/WlMwBQyMs0XV/QKJuujsnDnqWB5lgkOwVi7C2RS4A0EbAYpFlO/DuciaI
 vxZZ8CfyFVqLCw/ORCYZ1Mzur3ZNbe7zDtg72cdHlPp4gAmOlWIV4oun+cpA+E3ASmdS
 mcDrXxdB4mfJwX1vlDtAFRYPaY094f9vpp93JzJcOsxXbYwOt6/gQVgTVH0bMCp3pHnQ
 nu/gNljUy8h72hhIMXGBTiVRA+hJjMTFiN3Mj4b99EAxVUUaa2tdPfII4WtJlO7s7xFx
 8C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713620523; x=1714225323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xUWMQtOMtHcstc/cIjPR41dHaXRQKi9outRFsvRo7/4=;
 b=KIGiOSYPuOEoVC+ehgUO+/zQbTLgLpeO1PbGXwSLu9pqD+DFY3UugmMVpZ8InWcKWQ
 //OJ8Q4IijZPRBpJSut5poRsCVJgZMXyphwrJywxC3j4ofzU1HbaE39nnNg8i9V8wW6u
 Hmsfebmy7lxrZ19FhYP4Y5feF0/PdNCRc6MZMHCiiTFm7dKrK54CJC+MzyXk9NHlGc7n
 uyjjAIanNaFTYB0JJocYHjRZ8xkG/ilr+px/LrynRzv5x3FqeSAbgszd4AARETV8kPs2
 u7PZZFFBaDtPjD7jiACctHrIuo2dCkQs1giR36yTtjxveIyRktGMkgTPjXy4VpGhJfV4
 gQpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVK5xtkjCASlgV7h6xUbFnTS2gWYqq6whZ9o+ZbXbx2q/CTIBmg3aZRmQgjCrvpLtv/NJOKnHKJCAGrV9MDLXiOfAz/RI53Nwbkgeuewa2gDkpUBzURB4aZR7vVhvfEfr9uCCBcrLg2IksvvkURA==
X-Gm-Message-State: AOJu0Yy0YaVG4RU8Ry/ZagJ5EpNc/MeJBPDGp+gy8gJtblk+qweU8uKB
 c6eaw2RqjGNhulf08OBKSxIgLH4Htv6VtxOMUAitv3NvGOupLgf1
X-Google-Smtp-Source: AGHT+IHH4R60EIxELY/Wj8xRTZADYWhGrR4yjgB29K8+ermTi0DbqyVVI4gtEkMLOuV4PYDPtk0lCw==
X-Received: by 2002:a50:d6c5:0:b0:56e:3175:6065 with SMTP id
 l5-20020a50d6c5000000b0056e31756065mr3067740edj.9.1713620522735; 
 Sat, 20 Apr 2024 06:42:02 -0700 (PDT)
Received: from localhost.localdomain (80-108-76-242.cable.dynamic.surfer.at.
 [80.108.76.242]) by smtp.gmail.com with ESMTPSA id
 fd21-20020a056402389500b0056e2495f92esm3347042edb.59.2024.04.20.06.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 06:42:02 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: tomeu@tomeuvizoso.net, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christian Gmeiner <cgmeiner@igalia.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "drm/etnaviv: Expose a few more chipspecs to userspace"
Date: Sat, 20 Apr 2024 15:41:58 +0200
Message-ID: <20240420134159.110509-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.44.0
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

From: Christian Gmeiner <cgmeiner@igalia.com>

This reverts commit 1dccdba084897443d116508a8ed71e0ac8a031a4.

In userspace a different approach was choosen - hwdb. As a result, there
is no need for these values.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 ---------------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 12 ---------
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 34 --------------------------
 include/uapi/drm/etnaviv_drm.h         |  5 ----
 4 files changed, 71 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 734412aae94d..e47e5562535a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -164,26 +164,6 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
 		*value = gpu->identity.eco_id;
 		break;
 
-	case ETNAVIV_PARAM_GPU_NN_CORE_COUNT:
-		*value = gpu->identity.nn_core_count;
-		break;
-
-	case ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE:
-		*value = gpu->identity.nn_mad_per_core;
-		break;
-
-	case ETNAVIV_PARAM_GPU_TP_CORE_COUNT:
-		*value = gpu->identity.tp_core_count;
-		break;
-
-	case ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE:
-		*value = gpu->identity.on_chip_sram_size;
-		break;
-
-	case ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE:
-		*value = gpu->identity.axi_sram_size;
-		break;
-
 	default:
 		DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 7d5e9158e13c..197e0037732e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -54,18 +54,6 @@ struct etnaviv_chip_identity {
 	/* Number of Neural Network cores. */
 	u32 nn_core_count;
 
-	/* Number of MAD units per Neural Network core. */
-	u32 nn_mad_per_core;
-
-	/* Number of Tensor Processing cores. */
-	u32 tp_core_count;
-
-	/* Size in bytes of the SRAM inside the NPU. */
-	u32 on_chip_sram_size;
-
-	/* Size in bytes of the SRAM across the AXI bus. */
-	u32 axi_sram_size;
-
 	/* Size of the vertex cache. */
 	u32 vertex_cache_size;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index d8e7334de8ce..8665f2658d51 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -17,10 +17,6 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 128,
 		.shader_core_count = 1,
 		.nn_core_count = 0,
-		.nn_mad_per_core = 0,
-		.tp_core_count = 0,
-		.on_chip_sram_size = 0,
-		.axi_sram_size = 0,
 		.vertex_cache_size = 8,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -52,11 +48,6 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 256,
 		.shader_core_count = 1,
-		.nn_core_count = 0,
-		.nn_mad_per_core = 0,
-		.tp_core_count = 0,
-		.on_chip_sram_size = 0,
-		.axi_sram_size = 0,
 		.vertex_cache_size = 8,
 		.vertex_output_buffer_size = 512,
 		.pixel_pipes = 1,
@@ -89,10 +80,6 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 512,
 		.shader_core_count = 2,
 		.nn_core_count = 0,
-		.nn_mad_per_core = 0,
-		.tp_core_count = 0,
-		.on_chip_sram_size = 0,
-		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -125,10 +112,6 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 512,
 		.shader_core_count = 2,
 		.nn_core_count = 0,
-		.nn_mad_per_core = 0,
-		.tp_core_count = 0,
-		.on_chip_sram_size = 0,
-		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -160,11 +143,6 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 512,
 		.shader_core_count = 2,
-		.nn_core_count = 0,
-		.nn_mad_per_core = 0,
-		.tp_core_count = 0,
-		.on_chip_sram_size = 0,
-		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -197,10 +175,6 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 1024,
 		.shader_core_count = 4,
 		.nn_core_count = 0,
-		.nn_mad_per_core = 0,
-		.tp_core_count = 0,
-		.on_chip_sram_size = 0,
-		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 2,
@@ -233,10 +207,6 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 256,
 		.shader_core_count = 1,
 		.nn_core_count = 8,
-		.nn_mad_per_core = 64,
-		.tp_core_count = 4,
-		.on_chip_sram_size = 524288,
-		.axi_sram_size = 1048576,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -269,10 +239,6 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 256,
 		.shader_core_count = 1,
 		.nn_core_count = 6,
-		.nn_mad_per_core = 64,
-		.tp_core_count = 3,
-		.on_chip_sram_size = 262144,
-		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index d87410a8443a..af024d90453d 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -77,11 +77,6 @@ struct drm_etnaviv_timespec {
 #define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
 #define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
 #define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
-#define ETNAVIV_PARAM_GPU_NN_CORE_COUNT             0x1f
-#define ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE           0x20
-#define ETNAVIV_PARAM_GPU_TP_CORE_COUNT             0x21
-#define ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE         0x22
-#define ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE             0x23
 
 #define ETNA_MAX_PIPES 4
 
-- 
2.44.0

