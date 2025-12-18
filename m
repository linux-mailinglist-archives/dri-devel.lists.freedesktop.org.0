Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87748CCB757
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E567710EE12;
	Thu, 18 Dec 2025 10:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BBcBI2nC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7457E10EE13
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 10:46:06 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7f0db5700b2so471897b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 02:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766054766; x=1766659566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6IWwV37obkeTNwRLtikEMk+ZnED99GBbg/P6oJvfXDY=;
 b=BBcBI2nCs5HJQ4IbV3XKZ1FkIomCgRqJk50OtrMxUdOjiCnaoIx0ZF+O8tEio2nldb
 KSsRRcusd6woZO/P3k7mJMnJVI0Tn/fDiiz7NY+J7ctt6AgMSCZy2L19WDs2Sy8t903y
 q2TLbwcnXbsl2PwJBrpUrwsnKlRUP182C1iRO3llblt7+GtUOGpx2iFypIriPt6VpqK/
 zCYyj7oU1CTGJZITqx82IZxhCB902X38P8wTTOn1K+peX8CDstyvC4SbkQMe310OHgya
 gfc4FW+Ck2UMczAGwB13zy9SAikLhSQyCof4Rk5uRLNrfASjC6Rj80/NDPgXLndMAH6z
 zRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766054766; x=1766659566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6IWwV37obkeTNwRLtikEMk+ZnED99GBbg/P6oJvfXDY=;
 b=aSiZnK4+HPifWFIAqt1HcrS1e9Tpnw5D4LURpLiBY0hr5arUPd04VuMGtFubRRmS1Y
 HBVmcvv61NSGIKqhxzNkGYrGb9ZWODREdTSapvp+cPMrQ6eYSWMKolF1nM8zkiH7M6Ts
 ChVOFsi+T1F8AOTmZ0Mc4VFO8OXSZ/240WUkf0k05kA0B68kGkhibnwrv2d3bChfbwdN
 JL1wgUlwSov4L4VAaqeGsh81D62VdWSEV3uGLo/JJ/TNqoGCAyXygan7MEG1oWR9YbnQ
 xXAlYyrqp/i54yccF61VDrwE1QfDJKCuMzD2k5rcfxwRry6qMEo26bhKeChLFwBBH8ab
 p3Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoPpoG3t//S0PjUwQUhNFW1DETqlWZ0LO8LnJkwMy2/IpqFx0BsR0ps1XpwHZT959r+FHcbC2pvF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6LOR+D7/chGAMDpJhEXS33q74Ur8DVWzXENwJXHz87tohASrT
 BmCjrQM6ZI2Tv43mSeERQmR1LlRb+gigI5tiHvvyT8ryCzCwNU8jYhcW
X-Gm-Gg: AY/fxX483+JSY0xa0Uz9n67Wc7jCYs/setgsVGDHCQI5FMTEBOa17fRX6E5dPrDaqBq
 5wmcHJcp2e6wlYIi2yCD5WMQu3+fPiDu7WccR2LmZlE1awLH8d1g/osaPetYwvG5QePpnt3i1YA
 g+WTpv6EA/FBVDfVjnyoMZt/rbHVa5hKQ9X1Uw6nyVC2oN2FrT4wW8X62rtPo113Tk8MzwXfzo1
 P5HhEB8ZzXl74w6yhuy00u0tN9mnbX06gr9SQlnlMuAmz58MPqQ/F+WFscNgNEBaXIKzttDD+0K
 BcUuU5Gksbj6yGNDW7+0W+iAWbO1pKM/wGAiDXDYRE9KdLKqlB12bnb+uw7jdOXfE6rRGBtc/8H
 2bydzjx2Z2JD2seXMTPK3mvnHiHqIc38VUVJAEP1cWoEpit1tS2GwMu71k84jVzo3X+d4c7YF+0
 CCLGDfarDo4zwTnz6N7RS1FWtNAbpIkebS
X-Google-Smtp-Source: AGHT+IGYqG4oHEa6FdY8jOkOX6Rg7hkcvaZznQh7jAqoK3JmX9MEirAXLKIqNrsxA/G8fgQU6xoWQg==
X-Received: by 2002:a05:7022:7e84:b0:11f:2c69:32 with SMTP id
 a92af1059eb24-11f34bd9069mr14658428c88.7.1766054765669; 
 Thu, 18 Dec 2025 02:46:05 -0800 (PST)
Received: from titanite-d300.amd.com ([165.204.154.57])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061ef3383sm7410594c88.0.2025.12.18.02.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 02:46:05 -0800 (PST)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org
Cc: siqueira@igalia.com, mario.limonciello@amd.com, wayne.lin@amd.com,
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH v4] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
Date: Thu, 18 Dec 2025 18:45:33 +0800
Message-ID: <20251218104533.1551352-1-suryasaimadhu369@gmail.com>
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

v3:
- Pass struct amdgpu_device to helpers instead of struct drm_device
- Compact drm_* logging statements

v4:
- Drop newly added parameter validation logs

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
index 0a2a3f233a0e..07d1d3b9d49a 100644
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
 
@@ -315,7 +309,7 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
 
 	handler_data = kzalloc(sizeof(*handler_data), GFP_KERNEL);
 	if (!handler_data) {
-		DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+		drm_err(adev_to_drm(adev), "DM_IRQ: failed to allocate irq handler!\n");
 		return DAL_INVALID_IRQ_HANDLER_IDX;
 	}
 
@@ -396,8 +390,8 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
 		/* If we got here, it means we searched all irq contexts
 		 * for this irq source, but the handler was not found.
 		 */
-		DRM_ERROR(
-		"DM_IRQ: failed to find irq handler:%p for irq_source:%d!\n",
+		drm_err(adev_to_drm(adev),
+			"DM_IRQ: failed to find irq handler:%p for irq_source:%d\n",
 			ih, irq_source);
 	}
 }
@@ -596,7 +590,7 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
 		/*allocate a new amdgpu_dm_irq_handler_data*/
 		handler_data_add = kzalloc(sizeof(*handler_data), GFP_ATOMIC);
 		if (!handler_data_add) {
-			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+			drm_err(adev_to_drm(adev), "DM_IRQ: failed to allocate irq handler!\n");
 			return;
 		}
 
@@ -611,11 +605,11 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
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
@@ -720,10 +714,9 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
 	struct amdgpu_crtc *acrtc = adev->mode_info.crtcs[crtc_id];
 
 	if (!acrtc) {
-		DRM_ERROR(
+		drm_err(adev_to_drm(adev),
 			"%s: crtc is NULL at id :%d\n",
-			func,
-			crtc_id);
+			func, crtc_id);
 		return 0;
 	}
 
-- 
2.43.0

