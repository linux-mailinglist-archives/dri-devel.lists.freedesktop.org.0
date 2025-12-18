Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1DCCA7D1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 07:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B96410E0A5;
	Thu, 18 Dec 2025 06:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JfK9p9/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F098E10E0A5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:35:54 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-11b6bc976d6so2089045c88.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 22:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766039754; x=1766644554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Thn9rn7gE9antg1NpSTp2xr5SDEVaOuwKGs07QhbG4A=;
 b=JfK9p9/MdaIvbniD81HArnSTGKF3Ja+pE+KBRwYQdCuPvnygNrCiv/6ZPw/VN8BsWx
 ibVTqmKMCTVTYc66Gug1V37wsiwfJAPKp0nhNWJFiUsnVOAgsiX9+qiZ3z3HqCe1/jsK
 fS7yHx8blDDwFqfUmUXcwLbF+lcY9mTQc2mMJrYZIoiuzyxsZ36hR/iQzkIlccazXQON
 MhJClEKj5BOyEFGIo3KnfHptOn9dI2+1s1HCFhPc3QJlIeVX+Adrc/h9nhe0Uccfl9Sl
 6BBaWqOGOI4Fmci3leJWvO7cXaofPjbTb802c7hiNMxb7Km9kwBtlxhFga+5/2ruMryQ
 DPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766039754; x=1766644554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Thn9rn7gE9antg1NpSTp2xr5SDEVaOuwKGs07QhbG4A=;
 b=G38r9dIk4cElYF/UnrQiQutWhDJuta+N6Qx9xZHgIOIjy9XugLtT/aXqZ2zNkNye4/
 cjYUkgtKIEsAZrqUuKdc+ijrHo3UszgxPBZ2T+QjLAS08HqvJfZrGT7L1y314ReJuELf
 nKmMgYeLt5PScKh4RbeiyB1hK75jAPSK6/Y9W1E7bbt3giqmXjod53adfMmsQ2meubJW
 D4ndv8G62PxgqpYACmk1WDS27hUcgmBRb08H0/esMkODCTQy4DA5YU/NUcSTDbS7Wf7K
 agv6zQ8VwHn+0bcvfavxinOqjftbIlt8IWpjZkaQTslWo2vulEaHTUW+XGh97FsQBsQU
 g6TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkQiUxw/t3MQQvlzES2WGa3N6ffbQmWiKalknGYNe8HizK1N/cuWguk0pxneAAS4bXe3cr/JxioKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy+MEETHWpnMZtMOmgxQHKX93ZGqlPcsS5XcDgf5rsHXi85+4v
 PJa8IIAf6DrseCfXEDxuMy/RUbfOdgg9BM27Bn57durWhheDjiq+Chad
X-Gm-Gg: AY/fxX54mR8Zw8VrbYphQiYZOBiBxZ2x9pTVAw73wrI28rCXbL5iD2q/9yad6xnmofN
 SwG4rFmRH8zINVUy7byFbtGP26Pnorha1qmAZibjlkuItsz7rthNSQO9NnHk5E05/0IXxvDJFB5
 DeC2OzTdtYtDU6qZ1EuNaSUvtb3l95QDbFm6wt2fO0VXSS6uKntq8mG6dnwS5ZHTLpIF92zmrpC
 O6/HgQhdeuSU57JmSX6Q/qPDHJbhNWSB4Ljn4ZOTuWcx2yVywWcEMFDNwVNG96K/fUaIf6nMkVb
 QlbM5opTcBgCoKcUhgo3gVjFScyMpne5wq+DSm7Kr0KBjFDp+o8o9uhAS38ueR9Fj5mFkGPW+vR
 TmoP1kemgNlWykXw8MfSDAHla5rfxQNjvzwtul8UmOeF6AtoFvTlghdBXmpnGrkXaCLcs8wLUFg
 5Hi8Fpo1XkJWv0EGaOrgSrtolKY0BGy6zO
X-Google-Smtp-Source: AGHT+IHqT32jTbFGZMBVzT/uAPnbJ5NJrx5Wxvi4Ox8yJljxGA5EZFJPy5+Fl4TkIutq/eej3fKBPQ==
X-Received: by 2002:a05:7022:7e08:b0:11e:3e9:3e8f with SMTP id
 a92af1059eb24-12061965882mr1586882c88.24.1766039753964; 
 Wed, 17 Dec 2025 22:35:53 -0800 (PST)
Received: from titanite-d300.amd.com ([165.204.154.57])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061fcef8esm5062055c88.14.2025.12.17.22.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 22:35:53 -0800 (PST)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org
Cc: siqueira@igalia.com, mario.limonciello@amd.com, wayne.lin@amd.com,
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
Date: Thu, 18 Dec 2025 14:35:12 +0800
Message-ID: <20251218063512.4572-1-suryasaimadhu369@gmail.com>
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

Replace DRM_ERROR(), DRM_WARN(), and DRM_INFO() usage in
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c with the
corresponding drm_err(), drm_warn(), and drm_info() helpers.

The drm_* logging helpers take a struct drm_device * as their first
argument, allowing the DRM core to prefix log messages with the
specific device name and instance. This is required to correctly
differentiate log messages when multiple AMD GPUs are present.

This aligns amdgpu_dm with the DRM TODO item to convert legacy DRM
logging macros to the device-scoped drm_* helpers while keeping
debug logging unchanged.

v2:
- Keep validation helpers DRM-agnostic
- Move drm_* logging to AMDGPU DM callers
- Use adev_to_drm() for drm_* logging

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>

diff --git a/Makefile b/Makefile
index 2f545ec1690f..e404e4767944 100644
--- a/Makefile
+++ b/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 VERSION = 6
-PATCHLEVEL = 18
+PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = -rc1
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index 0a2a3f233a0e..60bf1b8d886a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -242,35 +242,29 @@ validate_irq_registration_params(struct dc_interrupt_params *int_params,
 				 void (*ih)(void *))
 {
 	if (NULL == int_params || NULL == ih) {
-		DRM_ERROR("DM_IRQ: invalid input!\n");
 		return false;
 	}
 
 	if (int_params->int_context >= INTERRUPT_CONTEXT_NUMBER) {
-		DRM_ERROR("DM_IRQ: invalid context: %d!\n",
-				int_params->int_context);
 		return false;
 	}
 
 	if (!DAL_VALID_IRQ_SRC_NUM(int_params->irq_source)) {
-		DRM_ERROR("DM_IRQ: invalid irq_source: %d!\n",
-				int_params->irq_source);
 		return false;
 	}
 
 	return true;
 }
 
-static bool validate_irq_unregistration_params(enum dc_irq_source irq_source,
-					       irq_handler_idx handler_idx)
+static bool validate_irq_unregistration_params(
+	enum dc_irq_source irq_source,
+	irq_handler_idx handler_idx)
 {
 	if (handler_idx == DAL_INVALID_IRQ_HANDLER_IDX) {
-		DRM_ERROR("DM_IRQ: invalid handler_idx==NULL!\n");
 		return false;
 	}
 
 	if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {
-		DRM_ERROR("DM_IRQ: invalid irq_source:%d!\n", irq_source);
 		return false;
 	}
 
@@ -305,17 +299,19 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
 				       void (*ih)(void *),
 				       void *handler_args)
 {
+	struct drm_device *dev = adev_to_drm(adev);
 	struct list_head *hnd_list;
 	struct amdgpu_dm_irq_handler_data *handler_data;
 	unsigned long irq_table_flags;
 	enum dc_irq_source irq_source;
 
 	if (false == validate_irq_registration_params(int_params, ih))
+		drm_err(dev, "DM_IRQ: invalid registration parameters\n");
 		return DAL_INVALID_IRQ_HANDLER_IDX;
 
 	handler_data = kzalloc(sizeof(*handler_data), GFP_KERNEL);
 	if (!handler_data) {
-		DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+		drm_err(dev, "DM_IRQ: failed to allocate irq handler!\n");
 		return DAL_INVALID_IRQ_HANDLER_IDX;
 	}
 
@@ -371,11 +367,13 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
 					enum dc_irq_source irq_source,
 					void *ih)
 {
+	struct drm_device *dev = adev_to_drm(adev);
 	struct list_head *handler_list;
 	struct dc_interrupt_params int_params;
 	int i;
 
 	if (false == validate_irq_unregistration_params(irq_source, ih))
+		drm_err(dev, "DM_IRQ: invalid unregistration parameters\n");
 		return;
 
 	memset(&int_params, 0, sizeof(int_params));
@@ -396,7 +394,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
 		/* If we got here, it means we searched all irq contexts
 		 * for this irq source, but the handler was not found.
 		 */
-		DRM_ERROR(
+		drm_err(dev,
 		"DM_IRQ: failed to find irq handler:%p for irq_source:%d!\n",
 			ih, irq_source);
 	}
@@ -596,7 +594,7 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
 		/*allocate a new amdgpu_dm_irq_handler_data*/
 		handler_data_add = kzalloc(sizeof(*handler_data), GFP_ATOMIC);
 		if (!handler_data_add) {
-			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+			drm_err(adev_to_drm(adev), "DM_IRQ: failed to allocate irq handler!\n");
 			return;
 		}
 
@@ -611,11 +609,11 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
 		INIT_WORK(&handler_data_add->work, dm_irq_work_func);
 
 		if (queue_work(system_highpri_wq, &handler_data_add->work))
-			DRM_DEBUG("Queued work for handling interrupt from "
+			drm_dbg(adev_to_drm(adev), "Queued work for handling interrupt from "
 				  "display for IRQ source %d\n",
 				  irq_source);
 		else
-			DRM_ERROR("Failed to queue work for handling interrupt "
+			drm_err(adev_to_drm(adev), "Failed to queue work for handling interrupt "
 				  "from display for IRQ source %d\n",
 				  irq_source);
 	}
@@ -720,7 +718,7 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
 	struct amdgpu_crtc *acrtc = adev->mode_info.crtcs[crtc_id];
 
 	if (!acrtc) {
-		DRM_ERROR(
+		drm_err(adev_to_drm(adev),
 			"%s: crtc is NULL at id :%d\n",
 			func,
 			crtc_id);
-- 
2.43.0

