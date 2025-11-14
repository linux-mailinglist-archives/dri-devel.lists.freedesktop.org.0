Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8BC5C36E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 10:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8287910EA1C;
	Fri, 14 Nov 2025 09:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ea66EYFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5D810EA1C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 09:20:09 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7a9c64dfa8aso1569099b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 01:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763112009; x=1763716809; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=upQ6k0ymMV64RoZHGvzsGjrMnXxpx5/qvt/YZyCe3QI=;
 b=Ea66EYFzcbIyQwsrHkUUVjuXe4OFin0+n1wtDlaa8J3H2QWVzi6kMklWpc4ICk/B5W
 fC9LgiV3vX/KWwZUnHOVTlbxjXXMLBSYvGPknr//drJofH1vWMkzXnN7qHCLunTcWv4b
 QSo7NQ+sDCommZdwdfOtwIgqVRY7vsacXy196XyLe9jAIintJUjFijjJL2urGuV/FuEL
 th1wwruN8/iwZ8F/iqRd4UxMyKtP0sg9bYC0cz0M/NahqR/D286RmScivnTJsHH+dII0
 ywMLzDzBDiHk1FU1P7vf8mrp9lYMbobM+Ff5z/cUO1GGAfCVJhB8IBQ9uXiqSyVvWVZv
 Z2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763112009; x=1763716809;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upQ6k0ymMV64RoZHGvzsGjrMnXxpx5/qvt/YZyCe3QI=;
 b=e0lEM3fUCTlENN7FyWJ84m2XJ5rBvtiVaSiYxPM5VAbKSeVLQbvd6cRB7FgskF4a52
 CD/XkkcYdW7x8hbSEAqkxn+dEBe7my4CNdRkI34WSIOjNpGaon8aWCCrrBDdqlYPbD96
 KkIiALNm7UGq96E/4Cf9ZtH9+ZNs3+l8zfrVQnR7PO4TZ1Zy74axdYhHIZBDEhcsHZWO
 zNs7SiSnrnL/3bEKInsQrVqqle8q7/C3PL92jq6W9wzfQGi+mryo+14rx8UvhKi0KFUT
 vHsFp+tmeDXa1QDc4WqE3raQ+QxJEKxFiSlE9Xyy+8Cuz5R24/nGx/G0/qTUIQHZ7WwT
 x92Q==
X-Gm-Message-State: AOJu0Yz7KYfis37AeE9k0Ed1rqkYi5RXN20HIopLgqt3cLJQKhnFzGtW
 q5rOTPjt07mHb994bAYaSatMjy9hVuwwgu6qc5pisKRF/zElDdansnYf
X-Gm-Gg: ASbGncsUOklMhYbf+lxz6VEW0g7v03eizfUQWmlQ6LP/zcZ0tzgNDtU5Ollhxe0wgua
 QF+tCxSSsvxEW27Evo1qz+6Jmjqry3g3LoEqtEtt8AQrJA7qCMzaP18Jhb0Et9R64S30e3tZTcp
 ReDmT4HGo4zCuIVKTKUNIXKiSXTE97I8ig6kS+kF3KZm24pl5cWB/Oe5Qclg2VZksa0/QHPE6Vy
 xww+GkEz0a45myUuWIBpMcIX/jW3ON+il+VqoXbeG68MddQYBEHITMwTN+eZLw3hnmGD2I5GNHL
 cTbLsZpkd47hMCRDdHfRIssUzyToTOe4mqG5gYDnTQGCHeQjTf8XxNRFiNw1XNOyXoq2ReJx/QV
 +LkikdBwBrsjzx8VuAm071l4hLLdQkOHF7xN1Gl5SzxFZCybiuSUGEdeg6lu9/rQS78nBe960lc
 AtgKU1FNa2b3pB+g==
X-Google-Smtp-Source: AGHT+IG01bMGoXNahT9eZC/VPV0DHkm50SvIboUMeSog9zQmBqNCxWmBrQq7RTt4z02SPkqGCn4fyg==
X-Received: by 2002:a05:6a20:244e:b0:358:dc7d:a2b3 with SMTP id
 adf61e73a8af0-35ba278d151mr3402179637.44.1763112008746; 
 Fri, 14 Nov 2025 01:20:08 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b92772e713sm4477682b3a.54.2025.11.14.01.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 01:20:08 -0800 (PST)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rk0006818@gmail.com
Subject: [PATCH] drm/komeda: Convert logging in komeda_pipeline.c to drm_*
 with drm_device parameter
Date: Fri, 14 Nov 2025 14:48:25 +0530
Message-ID: <20251114091825.3591430-1-rk0006818@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace DRM_ERROR/WARN/INFO() and DRM_DEBUG() calls in
drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c with the
drm_err(), drm_warn(), drm_info() and drm_dbg() helpers.

The drm_*() logging macros require a struct drm_device * parameter,
which allows the DRM core to prefix log messages with the device
instance. This is important for distinguishing logs when multiple
Komeda or other DRM devices are present.

This conversion follows the DRM TODO entry:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 .../drm/arm/display/komeda/komeda_pipeline.c  | 53 ++++++++++++-------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
index 81e244f0c0ca..88d24b074e5e 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
@@ -18,16 +18,18 @@ struct komeda_pipeline *
 komeda_pipeline_add(struct komeda_dev *mdev, size_t size,
 		    const struct komeda_pipeline_funcs *funcs)
 {
+	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_pipeline *pipe;
 
 	if (mdev->n_pipelines + 1 > KOMEDA_MAX_PIPELINES) {
-		DRM_ERROR("Exceed max support %d pipelines.\n",
-			  KOMEDA_MAX_PIPELINES);
+		drm_err(drm, "Exceed max support %d pipelines.\n",
+			KOMEDA_MAX_PIPELINES);
 		return ERR_PTR(-ENOSPC);
 	}
 
 	if (size < sizeof(*pipe)) {
-		DRM_ERROR("Request pipeline size too small.\n");
+		drm_err(drm, "Request pipeline size too small.\n");
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -71,6 +73,8 @@ static struct komeda_component **
 komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
 {
 	struct komeda_dev *mdev = pipe->mdev;
+	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_pipeline *temp = NULL;
 	struct komeda_component **pos = NULL;
 
@@ -88,7 +92,7 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
 	case KOMEDA_COMPONENT_COMPIZ1:
 		temp = mdev->pipelines[id - KOMEDA_COMPONENT_COMPIZ0];
 		if (!temp) {
-			DRM_ERROR("compiz-%d doesn't exist.\n", id);
+			drm_err(drm, "compiz-%d doesn't exist.\n", id);
 			return NULL;
 		}
 		pos = to_cpos(temp->compiz);
@@ -107,7 +111,7 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
 	case KOMEDA_COMPONENT_IPS1:
 		temp = mdev->pipelines[id - KOMEDA_COMPONENT_IPS0];
 		if (!temp) {
-			DRM_ERROR("ips-%d doesn't exist.\n", id);
+			drm_err(drm, "ips-%d doesn't exist.\n", id);
 			return NULL;
 		}
 		pos = to_cpos(temp->improc);
@@ -117,7 +121,7 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
 		break;
 	default:
 		pos = NULL;
-		DRM_ERROR("Unknown pipeline resource ID: %d.\n", id);
+		drm_err(drm, "Unknown pipeline resource ID: %d.\n", id);
 		break;
 	}
 
@@ -169,6 +173,8 @@ komeda_component_add(struct komeda_pipeline *pipe,
 		     u8 max_active_outputs, u32 __iomem *reg,
 		     const char *name_fmt, ...)
 {
+	struct komeda_kms_dev *kms = dev_get_drvdata(pipe->mdev->dev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component **pos;
 	struct komeda_component *c;
 	int idx, *num = NULL;
@@ -187,14 +193,14 @@ komeda_component_add(struct komeda_pipeline *pipe,
 		idx = id - KOMEDA_COMPONENT_LAYER0;
 		num = &pipe->n_layers;
 		if (idx != pipe->n_layers) {
-			DRM_ERROR("please add Layer by id sequence.\n");
+			drm_err(drm, "please add Layer by id sequence.\n");
 			return ERR_PTR(-EINVAL);
 		}
 	} else if (has_bit(id,  KOMEDA_PIPELINE_SCALERS)) {
 		idx = id - KOMEDA_COMPONENT_SCALER0;
 		num = &pipe->n_scalers;
 		if (idx != pipe->n_scalers) {
-			DRM_ERROR("please add Scaler by id sequence.\n");
+			drm_err(drm, "please add Scaler by id sequence.\n");
 			return ERR_PTR(-EINVAL);
 		}
 	}
@@ -240,27 +246,32 @@ static void komeda_component_dump(struct komeda_component *c)
 	if (!c)
 		return;
 
-	DRM_DEBUG("	%s: ID %d-0x%08lx.\n",
-		  c->name, c->id, BIT(c->id));
-	DRM_DEBUG("		max_active_inputs:%d, supported_inputs: 0x%08x.\n",
-		  c->max_active_inputs, c->supported_inputs);
-	DRM_DEBUG("		max_active_outputs:%d, supported_outputs: 0x%08x.\n",
-		  c->max_active_outputs, c->supported_outputs);
+	struct komeda_kms_dev *kms = dev_get_drvdata(c->pipeline->mdev->dev);
+	struct drm_device *drm = &kms->base;
+
+	drm_dbg(drm, "	%s: ID %d-0x%08lx.\n",
+		c->name, c->id, BIT(c->id));
+	drm_dbg(drm, "		max_active_inputs:%d, supported_inputs: 0x%08x.\n",
+		c->max_active_inputs, c->supported_inputs);
+	drm_dbg(drm, "		max_active_outputs:%d, supported_outputs: 0x%08x.\n",
+		c->max_active_outputs, c->supported_outputs);
 }
 
 void komeda_pipeline_dump(struct komeda_pipeline *pipe)
 {
+	struct komeda_kms_dev *kms = dev_get_drvdata(pipe->mdev->dev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	int id;
 	unsigned long avail_comps = pipe->avail_comps;
 
-	DRM_INFO("Pipeline-%d: n_layers: %d, n_scalers: %d, output: %s.\n",
+	drm_info(drm, "Pipeline-%d: n_layers: %d, n_scalers: %d, output: %s.\n",
 		 pipe->id, pipe->n_layers, pipe->n_scalers,
 		 pipe->dual_link ? "dual-link" : "single-link");
-	DRM_INFO("	output_link[0]: %s.\n",
+	drm_info(drm, "	output_link[0]: %s.\n",
 		 pipe->of_output_links[0] ?
 		 pipe->of_output_links[0]->full_name : "none");
-	DRM_INFO("	output_link[1]: %s.\n",
+	drm_info(drm, "	output_link[1]: %s.\n",
 		 pipe->of_output_links[1] ?
 		 pipe->of_output_links[1]->full_name : "none");
 
@@ -274,6 +285,8 @@ void komeda_pipeline_dump(struct komeda_pipeline *pipe)
 static void komeda_component_verify_inputs(struct komeda_component *c)
 {
 	struct komeda_pipeline *pipe = c->pipeline;
+	struct komeda_kms_dev *kms = dev_get_drvdata(pipe->mdev->dev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *input;
 	int id;
 	unsigned long supported_inputs = c->supported_inputs;
@@ -282,7 +295,7 @@ static void komeda_component_verify_inputs(struct komeda_component *c)
 		input = komeda_pipeline_get_component(pipe, id);
 		if (!input) {
 			c->supported_inputs &= ~(BIT(id));
-			DRM_WARN("Can not find input(ID-%d) for component: %s.\n",
+			drm_warn(drm, "Can not find input(ID-%d) for component: %s.\n",
 				 id, c->name);
 			continue;
 		}
@@ -306,6 +319,8 @@ komeda_get_layer_split_right_layer(struct komeda_pipeline *pipe,
 
 static void komeda_pipeline_assemble(struct komeda_pipeline *pipe)
 {
+	struct komeda_kms_dev *kms = dev_get_drvdata(pipe->mdev->dev);
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	struct komeda_layer *layer;
 	int i, id;
@@ -324,7 +339,7 @@ static void komeda_pipeline_assemble(struct komeda_pipeline *pipe)
 
 	if (pipe->dual_link && !pipe->ctrlr->supports_dual_link) {
 		pipe->dual_link = false;
-		DRM_WARN("PIPE-%d doesn't support dual-link, ignore DT dual-link configuration.\n",
+		drm_warn(drm, "PIPE-%d doesn't support dual-link, ignore DT dual-link configuration.\n",
 			 pipe->id);
 	}
 }
-- 
2.43.0

