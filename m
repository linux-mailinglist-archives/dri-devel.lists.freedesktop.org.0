Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F80ACC9A90
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 23:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AA510E557;
	Wed, 17 Dec 2025 22:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JYcZPy/x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E67910E1B8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 17:01:32 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b6ce6d1d3dcso5701088a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 09:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765990892; x=1766595692; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6FnQNORbcR1WLbdHKHjLa8M7Ar6HdGiq8Ari4GpdKG8=;
 b=JYcZPy/xEf8Y5eLviAx5wD7uLBhoekBTu4XJufFL93q7OAVszeuREi+K6sQGA1Lxa2
 bwxrK9flwEG+mPDbV2JVNKunmOCrjcJbi81vq4Z98IS6IbE8A+I8wHtPiDcC5fh4vIyc
 ur2ejSNOeBJHjmH6g0L5YUTNzhQSZP/p4l+BcDWZHmsk60W1Zo5722NDU94+6onxk3+0
 1j9DUax3vgOQCugmZB9nuTIfWDp1EG7lLnFU19jR5xZjNTK6peNkmQtBm9FbckswCmJv
 N68bztXD1WdiHyDxVC71JMfKtTTsPilFW7uYnruJM4Vl1H3gmu5ALYrafUPDOC7g9meU
 U97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765990892; x=1766595692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6FnQNORbcR1WLbdHKHjLa8M7Ar6HdGiq8Ari4GpdKG8=;
 b=dMJzJSa4A2ZE7WXxNafVQ+PSkdYFYpcdHGsv2Xdnbt5fGkCOCGIKWxr7sSrPd2CRS4
 CiOTaZ+S3PsIUpb2vofqFhPyy9fVdjoIG1ugIxOvYWKwfJaCmdLIOmDCxPjGm1g6D2gS
 vElJiZCLHfkEhepZ0I25Sa8eJs6P5kWIW+a2D91HpGWet7h73YSzzXCz19AiiAIOPOYv
 96S+Jo2s2z2WoMEhVTt460S68o/KACxBwMsbKpsB5iR+mn5prtxKSq7oDyoG99JaWcF8
 wGyNVwyVXJ7wmcyao5G1Htgw0/Hc/AnJoDZ7AegVYYqg4RFp22bgXAfVu/NjvHfSxRcN
 pqZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqnSRE0OcbRCfztKbJUPBVLNfHS1DxFNac2k9iW5Cf7v75mTc4IIIxkxKGgV7sxk41eaK09b+g2y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgQmNuWkzNBmW6P4U4lXRRoajbd9jog2c56BPIdLouKYOQPzYa
 0rxgzDVRI7QCSHGHyko2rOBMcsV/C80V9ECkraQaFjrTVfZZNaM2/jv2
X-Gm-Gg: AY/fxX5qLMJKt1rddAyNVosPyLt6RGCJRwSFan4m74+TXO7nnqg1Icd40Z/fWWKx2YO
 Ot1Bg1eJMf0LCMN1EjE0bb+q/GEFEyuGeuztOCelo94mjSGr0jdMOFdLYLV7yrIz55ra1N/fAGw
 3+SI7KykQavelpQv+29s/6Bz2K4GIoHeZenvIFEeJBrLuIIJRTicOSc3C+NarcPMgd7YfL4t5wC
 kikDP/zqUTX6fZkEIR/mh9wNYnT/6HI1MnsmRYwPUCqu8LzsvHe1sZRL4+3iF8vg15u8o1RS/Sm
 2ym1IpoHyUMhFF9ejRwlaNaJCMDrX0JIBq9OxwUPi5z8A9f29WUfyE5pLl7vmtlpNrRckPfRh5f
 20I5gIJLZaFfDsZcs3GHwFz17RMkf9zQ5FseN5uZxK9U7BgDoB3e8dqH7/xoNJmh4ShgBhPH0gD
 H8XA+SA5WrHYCBEPY4HacsccwZrAJJVFm7
X-Google-Smtp-Source: AGHT+IHgy7dAE6tdAYJ5bkfbiGPj9Q9dIxu/KGDPFxDiWInDLoQjwzJpN2xyM4ZeC2WztgMAkRT3fg==
X-Received: by 2002:a05:693c:40cc:b0:2a4:8aaf:d6b9 with SMTP id
 5a478bee46e88-2ac2f899a5bmr13266243eec.13.1765990891160; 
 Wed, 17 Dec 2025 09:01:31 -0800 (PST)
Received: from titanite-d300.amd.com ([165.204.154.57])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ae56eec6cdsm2354065eec.35.2025.12.17.09.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 09:01:30 -0800 (PST)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org
Cc: siqueira@igalia.com, mario.limonciello@amd.com, wayne.lin@amd.com,
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
Date: Thu, 18 Dec 2025 01:01:04 +0800
Message-ID: <20251217170104.2767939-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Dec 2025 22:02:44 +0000
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
index 0a2a3f233a0e..4401059ff907 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -238,22 +238,22 @@ static void unregister_all_irq_handlers(struct amdgpu_device *adev)
 }
 
 static bool
-validate_irq_registration_params(struct dc_interrupt_params *int_params,
+validate_irq_registration_params(struct drm_device *dev, struct dc_interrupt_params *int_params,
 				 void (*ih)(void *))
 {
 	if (NULL == int_params || NULL == ih) {
-		DRM_ERROR("DM_IRQ: invalid input!\n");
+		drm_err(dev, "DM_IRQ: invalid input!\n");
 		return false;
 	}
 
 	if (int_params->int_context >= INTERRUPT_CONTEXT_NUMBER) {
-		DRM_ERROR("DM_IRQ: invalid context: %d!\n",
+		drm_err(dev, "DM_IRQ: invalid context: %d!\n",
 				int_params->int_context);
 		return false;
 	}
 
 	if (!DAL_VALID_IRQ_SRC_NUM(int_params->irq_source)) {
-		DRM_ERROR("DM_IRQ: invalid irq_source: %d!\n",
+		drm_err(dev, "DM_IRQ: invalid irq_source: %d!\n",
 				int_params->irq_source);
 		return false;
 	}
@@ -261,16 +261,18 @@ validate_irq_registration_params(struct dc_interrupt_params *int_params,
 	return true;
 }
 
-static bool validate_irq_unregistration_params(enum dc_irq_source irq_source,
-					       irq_handler_idx handler_idx)
+static bool validate_irq_unregistration_params(
+	struct drm_device *dev,
+	enum dc_irq_source irq_source,
+	irq_handler_idx handler_idx)
 {
 	if (handler_idx == DAL_INVALID_IRQ_HANDLER_IDX) {
-		DRM_ERROR("DM_IRQ: invalid handler_idx==NULL!\n");
+		drm_err(dev, "DM_IRQ: invalid handler_idx==NULL!\n");
 		return false;
 	}
 
 	if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {
-		DRM_ERROR("DM_IRQ: invalid irq_source:%d!\n", irq_source);
+		drm_err(dev, "DM_IRQ: invalid irq_source:%d!\n", irq_source);
 		return false;
 	}
 
@@ -310,12 +312,12 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
 	unsigned long irq_table_flags;
 	enum dc_irq_source irq_source;
 
-	if (false == validate_irq_registration_params(int_params, ih))
+	if (false == validate_irq_registration_params(&adev->ddev, int_params, ih))
 		return DAL_INVALID_IRQ_HANDLER_IDX;
 
 	handler_data = kzalloc(sizeof(*handler_data), GFP_KERNEL);
 	if (!handler_data) {
-		DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+		drm_err(&adev->ddev, "DM_IRQ: failed to allocate irq handler!\n");
 		return DAL_INVALID_IRQ_HANDLER_IDX;
 	}
 
@@ -375,7 +377,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
 	struct dc_interrupt_params int_params;
 	int i;
 
-	if (false == validate_irq_unregistration_params(irq_source, ih))
+	if (false == validate_irq_unregistration_params(&adev->ddev, irq_source, ih))
 		return;
 
 	memset(&int_params, 0, sizeof(int_params));
@@ -396,7 +398,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
 		/* If we got here, it means we searched all irq contexts
 		 * for this irq source, but the handler was not found.
 		 */
-		DRM_ERROR(
+		drm_err(&adev->ddev,
 		"DM_IRQ: failed to find irq handler:%p for irq_source:%d!\n",
 			ih, irq_source);
 	}
@@ -596,7 +598,7 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
 		/*allocate a new amdgpu_dm_irq_handler_data*/
 		handler_data_add = kzalloc(sizeof(*handler_data), GFP_ATOMIC);
 		if (!handler_data_add) {
-			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+			drm_err(&adev->ddev, "DM_IRQ: failed to allocate irq handler!\n");
 			return;
 		}
 
@@ -611,11 +613,11 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
 		INIT_WORK(&handler_data_add->work, dm_irq_work_func);
 
 		if (queue_work(system_highpri_wq, &handler_data_add->work))
-			DRM_DEBUG("Queued work for handling interrupt from "
+			drm_dbg(&adev->ddev, "Queued work for handling interrupt from "
 				  "display for IRQ source %d\n",
 				  irq_source);
 		else
-			DRM_ERROR("Failed to queue work for handling interrupt "
+			drm_err(&adev->ddev, "Failed to queue work for handling interrupt "
 				  "from display for IRQ source %d\n",
 				  irq_source);
 	}
@@ -720,7 +722,7 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
 	struct amdgpu_crtc *acrtc = adev->mode_info.crtcs[crtc_id];
 
 	if (!acrtc) {
-		DRM_ERROR(
+		drm_err(&adev->ddev,
 			"%s: crtc is NULL at id :%d\n",
 			func,
 			crtc_id);
-- 
2.43.0

