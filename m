Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740F3829DA1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173BB10E04E;
	Wed, 10 Jan 2024 15:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA6110E04E;
 Wed, 10 Jan 2024 15:37:58 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5576fae29ffso4371830a12.1; 
 Wed, 10 Jan 2024 07:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704901076; x=1705505876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iiaboqLo4Zo3cNfowQ5RMAqS5wTqzDwqvkE5PMko/Ac=;
 b=PrivQqRlaT7sh+gNGwHCbuuBlaxRTQl4fCYU/+qs44f+jiETd70NDIvIDy2GWVyDrS
 Efkba7qnct7bOSPx5iHc4Hyd/nxR/ZXCoFnepDhnyYRwIq1VGD8ho8CrZOuKfMlVTrQE
 Gy2EOMLJSozjo7QqDgcNviza1Rx3bOuHo2Fa8mJuhicO9IR56YKa87/vwEoYKDtlgPzM
 P1EL9FjxJ7m/spFOsfZReMOPH/eMz/HVNpraltcaMPGHe3w7wiAjumQClNznoZK5EUHC
 MSWD0ZmhBL+d0LRfQK98I7Ne/q2/KOkfWbmyGY4cuiyuDrC4oc9YhKcoTUrTOuqoxIN4
 lKdg==
X-Gm-Message-State: AOJu0Yw8qoKcbL+OF8yb7DH9t1PnzFhUVpR9Q3Vj6+ZqA47f2HzP+B/D
 +kLGGUfuhoaBuH1M1ONhSto=
X-Google-Smtp-Source: AGHT+IGgQGClPW/hJ7k0fe6bnsbTeDHodNvHBE6Vw3EAnD7AP3f1b3CEFOd6xQ1fD9E5b5YtrNbP+w==
X-Received: by 2002:a50:8a96:0:b0:558:2110:5aeb with SMTP id
 j22-20020a508a96000000b0055821105aebmr596143edj.39.1704901076355; 
 Wed, 10 Jan 2024 07:37:56 -0800 (PST)
Received: from ramallet.home (cst-prg-39-31.cust.vodafone.cz. [46.135.39.31])
 by smtp.gmail.com with ESMTPSA id
 da11-20020a056402176b00b0055668ccd9a3sm2113105edb.17.2024.01.10.07.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 07:37:55 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: 
Subject: [PATCH 1/2] drm/etnaviv: Expose a few more chipspecs to userspace
Date: Wed, 10 Jan 2024 16:37:00 +0100
Message-ID: <20240110153704.1364073-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.43.0
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
Cc: Christian Gmeiner <cgmeiner@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Maxime Ripard <mripard@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These ones will be needed to make use fo the NN and TP units in the NPUs
based on Vivante IP.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Acked-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 ++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 12 ++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 24 ++++++++++++++++++++++++
 include/uapi/drm/etnaviv_drm.h         |  5 +++++
 4 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 9276756e1397..9055ed08cd7b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -164,6 +164,26 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
 		*value = gpu->identity.eco_id;
 		break;
 
+	case ETNAVIV_PARAM_GPU_NN_CORE_COUNT:
+		*value = gpu->identity.nn_core_count;
+		break;
+
+	case ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE:
+		*value = gpu->identity.nn_mad_per_core;
+		break;
+
+	case ETNAVIV_PARAM_GPU_TP_CORE_COUNT:
+		*value = gpu->identity.tp_core_count;
+		break;
+
+	case ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE:
+		*value = gpu->identity.on_chip_sram_size;
+		break;
+
+	case ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE:
+		*value = gpu->identity.axi_sram_size;
+		break;
+
 	default:
 		DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 197e0037732e..7d5e9158e13c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -54,6 +54,18 @@ struct etnaviv_chip_identity {
 	/* Number of Neural Network cores. */
 	u32 nn_core_count;
 
+	/* Number of MAD units per Neural Network core. */
+	u32 nn_mad_per_core;
+
+	/* Number of Tensor Processing cores. */
+	u32 tp_core_count;
+
+	/* Size in bytes of the SRAM inside the NPU. */
+	u32 on_chip_sram_size;
+
+	/* Size in bytes of the SRAM across the AXI bus. */
+	u32 axi_sram_size;
+
 	/* Size of the vertex cache. */
 	u32 vertex_cache_size;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 67201242438b..003e5faa1f4c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -17,6 +17,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 128,
 		.shader_core_count = 1,
 		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 8,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -80,6 +84,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 512,
 		.shader_core_count = 2,
 		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -112,6 +120,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 512,
 		.shader_core_count = 2,
 		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -175,6 +187,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 1024,
 		.shader_core_count = 4,
 		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 2,
@@ -207,6 +223,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 256,
 		.shader_core_count = 1,
 		.nn_core_count = 8,
+		.nn_mad_per_core = 64,
+		.tp_core_count = 4,
+		.on_chip_sram_size = 524288,
+		.axi_sram_size = 1048576,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -239,6 +259,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 256,
 		.shader_core_count = 1,
 		.nn_core_count = 6,
+		.nn_mad_per_core = 64,
+		.tp_core_count = 3,
+		.on_chip_sram_size = 262144,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index af024d90453d..d87410a8443a 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -77,6 +77,11 @@ struct drm_etnaviv_timespec {
 #define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
 #define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
 #define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
+#define ETNAVIV_PARAM_GPU_NN_CORE_COUNT             0x1f
+#define ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE           0x20
+#define ETNAVIV_PARAM_GPU_TP_CORE_COUNT             0x21
+#define ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE         0x22
+#define ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE             0x23
 
 #define ETNA_MAX_PIPES 4
 
-- 
2.43.0

