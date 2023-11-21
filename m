Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89557F2829
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358C010E2B5;
	Tue, 21 Nov 2023 08:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0197E10E0D0;
 Tue, 21 Nov 2023 06:33:14 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so372141866b.1; 
 Mon, 20 Nov 2023 22:33:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700548393; x=1701153193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvjdYWDUQL/+wmBH18eiqXCBZYsxF5Z3RXYOTGL5eUc=;
 b=r8Yr011/EbZEBNL9gu/mAb6u9bF40yX5MMp/szuApRrjUyA7GrCFYru95XMee8hkV9
 Bj/EKsZrcDo5omkZFZ9P4ugLBiYwaElHXww5/4/J+dey779MLc4iaUzXiWiiJW5HgoXt
 a1BWoZOAwwGbrvFz//3EcQ7XCj4U1FUlA+d3R+OZTbNAaDB1qPKBVt+mNeKJV717IKgm
 mTDqK49x6GRdDZJ1SRefbjChltNjHKRmCU2CzI0mCJfzNijHyqpekRFOziC+SNWUniGn
 lZF3XL6EiwNQCzaYTFlMFOrkmbUyF/L4iYHRpAHhGoubDbPYewZDbkOrFHDUuVgez/Bz
 zMgg==
X-Gm-Message-State: AOJu0YyPifGU0lhp3ubWYV+jUv9xIERi+8dRoC6h8dAXvQaIAf05Cimg
 sp0S137Ss5KhtI1UEC+b/BQ=
X-Google-Smtp-Source: AGHT+IHtTyLZCJ/dY518qrOgeTGFkoHi2OffXz76jdWCQad8c8CQ5ieMvXLhAt0x7bRpaNTxSINdyg==
X-Received: by 2002:a17:906:9c93:b0:9e3:85c9:11dc with SMTP id
 fj19-20020a1709069c9300b009e385c911dcmr7175910ejc.32.1700548393032; 
 Mon, 20 Nov 2023 22:33:13 -0800 (PST)
Received: from ramallet.home (cst-prg-38-127.cust.vodafone.cz. [46.135.38.127])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a1709064f0200b009eff65e6942sm4780857eju.197.2023.11.20.22.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 22:33:12 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/etnaviv: Expose a few more chipspecs to userspace
Date: Tue, 21 Nov 2023 07:32:59 +0100
Message-ID: <20231121063300.2273522-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116140910.1613508-1-tomeu@tomeuvizoso.net>
References: <20231116140910.1613508-1-tomeu@tomeuvizoso.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Nov 2023 08:54:58 +0000
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
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These ones will be needed to make use fo the NN and TP units in the NPUs
based on Vivante IP.

Also fix the number of NN cores in the VIPNano-qi.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v2: Update a few chipspecs that I had missed before. (Christian)
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 +++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 12 +++++++++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 34 ++++++++++++++++++++++++++
 include/uapi/drm/etnaviv_drm.h         |  5 ++++
 4 files changed, 71 insertions(+)

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
index 67201242438b..9eb8ca7c5034 100644
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
@@ -48,6 +52,11 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 256,
 		.shader_core_count = 1,
+		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 8,
 		.vertex_output_buffer_size = 512,
 		.pixel_pipes = 1,
@@ -80,6 +89,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
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
@@ -112,6 +125,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
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
@@ -143,6 +160,11 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 512,
 		.shader_core_count = 2,
+		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -175,6 +197,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
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
@@ -207,6 +233,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
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
@@ -239,6 +269,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
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
2.42.0

