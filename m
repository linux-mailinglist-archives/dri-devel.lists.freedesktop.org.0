Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8379FA3E8
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 06:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C455510E2E2;
	Sun, 22 Dec 2024 05:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZG1Ju+rF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2908410E2E2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 05:01:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso3868891e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 21:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734843660; x=1735448460; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8Z+rBahjAbnRzsWwhl3RN6A6WwHfHM88b39CtT7CZn0=;
 b=ZG1Ju+rFTbeoZC106zlpOuUuCdB7T2qRQazBdRlOyTPo7RXWLV2jTuB/pzV+9oa23G
 RC7iMk6hWGpriSECI1IMjcB/VkYxBcML5FQIa8QcroGUNP8k6KVwGsc0/UVD/Glkyytv
 N+iufowQv5Z8K2L3GXSp51OG6Lwc8jB2g1YmwDiUk7H2I9wJAfZD5u1OAPKGsYQ+Wmk9
 k2pG3nzI5Pm4YhzJoRIH0Os59ZWa+z+zuQW6Rc0gbB1YN3hQw87YfbCeCEstD6ZZm8e7
 lJU64dHrSWzJvXN0K0cqN2OGsOPuStSDn7li4+8hfmgvaY/T7NuJUWRCBIwiiIMlbbmY
 aU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734843660; x=1735448460;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Z+rBahjAbnRzsWwhl3RN6A6WwHfHM88b39CtT7CZn0=;
 b=dnkCfEgrMeRsG9kjgB6ZiaZOlzdwGem8YaEDp6E+/0nXQwfEF6b5ck0KRmLbqFBAWs
 szNhrNHex15BSWVoje5Qz4Sno7g3mJVRY2qwRg6Nar+MVLdUkynvppGNIlQLsIXiTA1M
 IqBGkW/5azYhvWEbiIK3/oottcdFYG3wj2LIOrGxc8kqMrUzAPDccMfTn6E/pVnftqq9
 alJyy1cHM8olTNJlgXVB24YNSi/OuYcf6ZClcO7Tz/bSZVCMzncOAF0BiVOfHYqXG2O0
 bYNq/iF45EG66EV52vn4sDdvNvfXMyUSZm2RcF5Ru82RBziDFFt07srXqdysL9HREVnU
 s1Eg==
X-Gm-Message-State: AOJu0YxJwpu90PZPP7+IVAJMUrEakcsKyzbQGRhk4M3XLztigQp3fb4i
 iPDnYdsGOO6tR3Exqypsh8Eva0NyYi+pj515AJafXwzhX8iPKLn79GVvS9PWJKE=
X-Gm-Gg: ASbGncs3b813CNW+t92kHvIgeSsidUDLMje6vWH/PZ/Vuar0jLDwmOBoCze3RTlmtC0
 xA/ydVqdz10WoUfrV47xVUFDy7Lum2pDl0DAqJKpTHzvBgmjRhqUG4rSy21ag04PWL5/bql12uH
 foc3n9ZH1f1JVDxM7OHRaFAMN8SCtZ24TkwT0Liz0bByvIOkvUDsgxQr34cioUVgQUSd+wa+eir
 lF0xbEq855nSaPtfcoASvJ8CEsoHNDnFIW5+B/fw7hdoleYTrSuudDXy4XEONVl
X-Google-Smtp-Source: AGHT+IG9PLc2TgcP5V5DNr8mxT3YMz7GDwhcZ2v5XDciS5lADg8+jcgwoscaaLV0JLE5hmtyxk69hg==
X-Received: by 2002:a05:6512:1055:b0:542:232a:7b2c with SMTP id
 2adb3069b0e04-54229548e22mr2561331e87.29.1734843660430; 
 Sat, 21 Dec 2024 21:01:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2024 21:00:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:46 +0200
Subject: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7162;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DYgtDJQPVbedGxDbDp9oOhz2z6FzJGN9bVgSpfs5T1A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z8q5ZLE91hpI9bKURtnooCKOkRd5GgQ1zBl
 zIpLTUQ90aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec/AAKCRCLPIo+Aiko
 1YdFB/9Tz+IdZGx7nLZX9BeA60xx2fLspau9frJKY4ko3gNUUbQU/cwT136wnAD1ttr9w1J2Qr5
 JjbKLIeY7wZMujTDAZEGbftU/AxzoO4wv/RLT19oZjTUfaHEY6CputmywtH75xjAh2J1GozOxwL
 cczIqw7M/abx+wncedvtjA9yao+zXq46ZJaIui07sbmn17EQ4oMx7DUuAuMweOq9auMCMhTY2Gl
 A6zs1jORwpjWrBJOoGRsXwSkLNBFgad2oUtwqdoWOecRlT7XIoT12p16dRxwS3YfoJHRixmFMkN
 6PNecUwIQSZ3xPz51fnT7xA4C2oi6yq3ve+Eelxerl7s2QCk
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

The MSM driver uses drm_atomic_helper_check() which mandates that none
of the atomic_check() callbacks toggles crtc_state->mode_changed.
Perform corresponding check before calling the drm_atomic_helper_check()
function.

Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
 drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
 5 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -753,6 +753,34 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
 	cstate->num_mixers = num_lm;
 }
 
+/**
+ * dpu_encoder_virt_check_mode_changed: check if full modeset is required
+ * @drm_enc:    Pointer to drm encoder structure
+ * @crtc_state:	Corresponding CRTC state to be checked
+ * @conn_state: Corresponding Connector's state to be checked
+ *
+ * Check if the changes in the object properties demand full mode set.
+ */
+int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	struct msm_display_topology topology;
+
+	DPU_DEBUG_ENC(dpu_enc, "\n");
+
+	/* Using mode instead of adjusted_mode as it wasn't computed yet */
+	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
+
+	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
+		crtc_state->mode_changed = true;
+	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
+		crtc_state->mode_changed = true;
+
+	return 0;
+}
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
@@ -786,10 +814,6 @@ static int dpu_encoder_virt_atomic_check(
 
 	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
 
-	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
-	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
 	/*
 	 * Release and Allocate resources on every modeset
 	 */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 92b5ee390788d16e85e195a664417896a2bf1cae..da133ee4701a329f566f6f9a7255f2f6d050f891 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -88,4 +88,8 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
+int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index dae8a94d3366abfb8937d5f44d8968f1d0691c2d..e2d822f7d785dc0debcb28595029a3e2050b0cf4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -446,6 +446,31 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
+static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
+
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
+		struct drm_encoder *encoder;
+
+		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
+
+		if (!new_conn_state->crtc || !new_conn_state->best_encoder)
+			continue;
+
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
+
+		encoder = new_conn_state->best_encoder;
+
+		dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
+	}
+
+	return 0;
+}
+
 static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -1049,6 +1074,7 @@ static const struct msm_kms_funcs kms_funcs = {
 	.irq             = dpu_core_irq,
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
+	.check_mode_changed = dpu_kms_check_mode_changed,
 	.flush_commit    = dpu_kms_flush_commit,
 	.wait_flush      = dpu_kms_wait_flush,
 	.complete_commit = dpu_kms_complete_commit,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a7a2384044ffdb13579cc9a10f56f8de9beca761..364df245e3a209094782ca1b47b752a729b32a5b 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -183,10 +183,16 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
 
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
-	int i;
+	int i, ret = 0;
 
+	/*
+	 * FIXME: stop setting allow_modeset and move this check to the DPU
+	 * driver.
+	 */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
 				      new_crtc_state, i) {
 		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
@@ -196,6 +202,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 
+	if (kms && kms->funcs && kms->funcs->check_mode_changed)
+		ret = kms->funcs->check_mode_changed(kms, state);
+	if (ret)
+		return ret;
+
 	return drm_atomic_helper_check(dev, state);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index e60162744c669773b6e5aef824a173647626ab4e..ec2a75af89b09754faef1a07adc9338f7d78161e 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -59,6 +59,13 @@ struct msm_kms_funcs {
 	void (*enable_commit)(struct msm_kms *kms);
 	void (*disable_commit)(struct msm_kms *kms);
 
+	/**
+	 * @check_mode_changed:
+	 *
+	 * Verify if the commit requires a full modeset on one of CRTCs.
+	 */
+	int (*check_mode_changed)(struct msm_kms *kms, struct drm_atomic_state *state);
+
 	/**
 	 * Prepare for atomic commit.  This is called after any previous
 	 * (async or otherwise) commit has completed.

-- 
2.39.5

