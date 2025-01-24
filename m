Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A62A1B482
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 12:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C706B10E90D;
	Fri, 24 Jan 2025 11:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hPSihiqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C168910E90D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 11:14:42 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-304e4562516so19475561fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 03:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737717281; x=1738322081; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O/oxMMFfQ3I3pEj54pjtnXmmwf3LThN/3TdVC/t7tnw=;
 b=hPSihiqSx9tZj84oe/kQdvqwJHmZp08tcGoVINaQ3BEBkGd+n+Qfu+BGErXtwGkkjJ
 J/2EuyfLUv/bGeTC/To0eGZJ1dH1QviT9I1Te+Rv5QIA2Nkrq6ZALpi6KwbB7tqVzWzR
 ojL7FNzVyOpQUAIZLeKyXjlk/7GRK+kSQ7QIYROvLa3Gb1+NSgyG1Ijm/3IIohcvDGHJ
 OU0rIZMdz5xVfvrTMNJVqmxmtRmXGdE79GeiFNTS3Y6YLPZv5ZP0RAQWrREHd+ajddpL
 2+Dfof09dihe/LGVdUOT8XyRT9CParlZBRU8+kcuEiLsLg49WCVmZjhe7TBfPpOIKofw
 kr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717281; x=1738322081;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/oxMMFfQ3I3pEj54pjtnXmmwf3LThN/3TdVC/t7tnw=;
 b=W1n7VKuDdSF+Pi6urquPKxUg+W6CqreSwJUj8vuSRPrhIS3VFAueZmq61ezyOuSn2r
 tXPY8ZbEWGTgqH3LORIAZFBDTjJ0buOmtjAMkM2DjxBCnx82DndmNeJceY/WdMREFNpa
 iQgh8iXby0BrfO/TplsthBbo0eM43WNmlWSg9hSb6+rNvC29lJlDDBn5UWMF/HwfjNYU
 efXH2a2WI5nfNk968Pqz9fVZk7RyqENA6o2GqMoobfKsBdcOLBrn5owOB72ZVXsEqVUD
 /42mGkY3YtboFs8xAMNwRZlFxT06Vq0wXsKs0jsPhwCWifigc3BGDR6l9U6XdinlgO3s
 1vMQ==
X-Gm-Message-State: AOJu0YwgSEeaApAWi+tnEsqKEkls1Di+jrXBIn/N2VFSHtmLYohttPnQ
 HFMUuXGy9n1Kc6NKqvIm2VceVvxVrgNxXhT6l6sgTpxIaSdnt+is4qCgy+zI/LU=
X-Gm-Gg: ASbGncsygsVxFA2htsxKjz+d85tJVBgTZDjC2sO3uINox2ZKEow+gr4cx/Bno0Z9rBs
 FmqJXsKdUfl6PYTwBgp27AVRIbPdUEuI+uBKN9Dlb9HGJDJkxhbuF8uIVOcQfeFmTqcNhFoBOtZ
 rPC6L2cBOSa0EzokmQtRL5vzQ2qZOBPFGGoT28hHFQOLr5X6EIXZkbVB4lterpgNhVPeXet20iP
 zug6uiHbISnCqCPe4egldRkRNBfH9rpAXSroAA5MVEx+tMidgxLfgsBRVjuYJqWdny87RpO/cwA
 vk1i+qWSRcDh
X-Google-Smtp-Source: AGHT+IHVMKQAcRvAe8Ru8jqcnZYt30PR8+TeSYcOpinNZ1wtFZ71833jO2mo4HCWThadfs6F2ffqfw==
X-Received: by 2002:a2e:bcc5:0:b0:306:5c3:b4d0 with SMTP id
 38308e7fff4ca-30761b8ba44mr32377961fa.2.1737717280986; 
 Fri, 24 Jan 2025 03:14:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:14:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:23 +0200
Subject: [PATCH 5/6] drm/msm/dpu: use atomic_needs_modeset for CDM check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-5-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5402;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RJbY2Rc5XWEYm7DVDGShoSdkiZEDKvsZ6ViiD3b/p6s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YVhnfHs7IeTGIT9ZCw63TSM0or1W73RRqCO
 jM4PlE72l+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FQAKCRCLPIo+Aiko
 1SfjB/4pjKjgrLihmXFuc8/lEhY++xtfarlvxvtlPF7NNTAt8TD2ODkbq65HkGUq3BJhjyWFTg3
 7jjR6lN0Qurx1jhFXRgAaLmwbwhmP1bsNPcdmhkqENq5DwRwoll/5z/6wrfExcbvmypMWhOs4mq
 F1fDmj8fZXSExioEAARKLBBzNzIpFvE9ne8GpThEhuJ/lHuWSlqqbh7u0eSYi9j6PHumwwYVK76
 Z16KvZ6td5a/UJG0JV3k+NUHGtokspzUvmh8h844NmsjDB1soVBgHcvWiCFCNJ8lHof6IFX1muy
 aZ4qXkbEy9LoU7Es/aKBoJ4QF6nQFwyM5M6gd5LygTSMm3F/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Rework the CDM check into using the new atomic_needs_modeset()
callbacks. This removes a need for the dpu-specific check_mode_changed()
callback in the msm_kms_funcs structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 35 +++++++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 ---------------------
 3 files changed, 21 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 84313bc1f9888452914612fab559b390cf38c705..d09a5c682031b840d486cf48871964e395226d33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -753,32 +753,38 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
 	cstate->num_mixers = num_lm;
 }
 
-/**
- * dpu_encoder_virt_check_mode_changed: check if full modeset is required
- * @drm_enc:    Pointer to drm encoder structure
- * @crtc_state:	Corresponding CRTC state to be checked
- * @conn_state: Corresponding Connector's state to be checked
- *
- * Check if the changes in the object properties demand full mode set.
- */
-int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
+static bool dpu_encoder_virt_atomic_needs_modeset(struct drm_encoder *drm_enc,
+						  struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 	struct msm_display_topology topology;
 
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+	if (!connector)
+		return false;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state || !conn_state->crtc)
+		return false;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (!crtc_state)
+		return false;
+
 	/* Using mode instead of adjusted_mode as it wasn't computed yet */
 	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
 
 	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
+		return true;
 	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
+		return true;
 
-	return 0;
+	return false;
 }
 
 static int dpu_encoder_virt_atomic_check(
@@ -2658,6 +2664,7 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
 	.atomic_disable = dpu_encoder_virt_atomic_disable,
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
+	.atomic_needs_modeset = dpu_encoder_virt_atomic_needs_modeset,
 	.atomic_check = dpu_encoder_virt_atomic_check,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index da133ee4701a329f566f6f9a7255f2f6d050f891..92b5ee390788d16e85e195a664417896a2bf1cae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -88,8 +88,4 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
-int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state);
-
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9748d24b3ffde45992d28b697a88db5992b00c69..97e9cb8c2b099f4757169cadf7e941148d2bfb16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -446,31 +446,6 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
-static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
-{
-	struct drm_crtc_state *new_crtc_state;
-	struct drm_connector *connector;
-	struct drm_connector_state *new_conn_state;
-	int i;
-
-	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
-		struct drm_encoder *encoder;
-
-		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
-
-		if (!new_conn_state->crtc || !new_conn_state->best_encoder)
-			continue;
-
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
-
-		encoder = new_conn_state->best_encoder;
-
-		dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
-	}
-
-	return 0;
-}
-
 static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -1087,7 +1062,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.irq             = dpu_core_irq,
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
-	.check_mode_changed = dpu_kms_check_mode_changed,
 	.flush_commit    = dpu_kms_flush_commit,
 	.wait_flush      = dpu_kms_wait_flush,
 	.complete_commit = dpu_kms_complete_commit,

-- 
2.39.5

