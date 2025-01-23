Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C969EA1A47D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6ABF10E805;
	Thu, 23 Jan 2025 12:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yp41U//3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E271A10E801
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:45:04 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-306007227d3so8746271fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 04:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737636303; x=1738241103; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zWSHW1AJoo6oeAbFU6nV7ox9IaMy4zb6Gnw53tdjyIM=;
 b=yp41U//3qQaR0zSokdH6+oEboDZvewr+LUYUPZCH+cCJHnIHoTbsJjMHKer23ipQEh
 z56PvN85BRdc5zDvpocQe/Vfl4S3BuetRafwl3cxB7fpW5sGfGrICnamMkGaOaTuIGmV
 IWPVdnt+NMuBMG1cP8tPIfRxGtvWfcEIgrwHk6c7fJqRcqOr20ErofHhDLG4NRE64CHu
 sVBw2GXwspGBM+ETG0byIP+9QPBST8m1eiwnkFNfiVnjT4nv38b7i03Y6KcELLgH8V4Y
 mrcBNxwHOoYc/SggeMphVCmD8Q+40ypubytxIyfqRx4yZiRWD56qrXuLn9c1W/w2LQxH
 mDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737636303; x=1738241103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWSHW1AJoo6oeAbFU6nV7ox9IaMy4zb6Gnw53tdjyIM=;
 b=uXg6p1pI4KGSUmBA7TDp+rmvKMJxVe4vfKaC4PDlMqrjMq/Au3jUhc/z2v8ulkMtSh
 uCquRhduJBV9N1tmlhZ7uzKS1Aw1AtxBMpbh2Mgp7pSLn6KCju2iyz8Rq65ckO6TXy8f
 F/zmSX9iMOZZM+cVqeVAWoRY+OxEoxFLOIL2on+Kol7qR/0YSLsziVmH4/5hI6Hxq1os
 on28yRELgFuSag6S01t1d12SL6lUmlX2jhJ4psBQfmeey1TyB3PbPDrPb0zBeiGEdLTA
 6SKlrkRh08+o/RQExr9qX3L527UKYvv8WLcK+5Onz8Fboy1gGkzVfphOrR7kCfIYvvdP
 UsAQ==
X-Gm-Message-State: AOJu0YyF979lRhF9m9YlXqbZ2IDE2Mi8yFTTk2yZQpU7A82l6U3LE9f9
 V/c4Q+qbLbv12sEO6PAOMxLbWReWUh/V8XWSH5Zq+8Jtp9gljBWczMC5pbtEwdg=
X-Gm-Gg: ASbGncslvkrWjD8tvm2I9/Zt+v979LQb+2xecKfPeZdn46QHvu9J51zA+qEcAuxAEhk
 LSqaVDgo5wocxH39HpfTRbKD9d+9ZB9Ta9MZ+93sZCBN5dhT7y1l5qTjJ2ZtTy4b0ukFdEzgCAP
 5UX04UUBW8Q0XS/5XpUn2xrs9J64UiUmAKlt3XkU5VDa115AII+hhyaX9432rPjgU/dif32xwcw
 dP46Wn1IUoYfFmW3ks1KIcgEPCUZaTr0AbWlfvOX7FYy+wXNUEfgwUFfJJEjIB17l2Hwe7XMy9q
 5QFJL3Zqtlsd
X-Google-Smtp-Source: AGHT+IE12Ap5wyBvC7HL6i+gKbbzFkPkeoSGT9gE9o+mFgIB89+q5WLPBpsNBRDOdCKVJU5k1SiThg==
X-Received: by 2002:a05:651c:896:b0:306:10d6:28b3 with SMTP id
 38308e7fff4ca-3072ca5da94mr103081071fa.1.1737636303052; 
 Thu, 23 Jan 2025 04:45:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed6f3sm30351661fa.86.2025.01.23.04.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:45:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Jan 2025 14:43:36 +0200
Subject: [PATCH v2 4/4] drm/msm/dpu: don't set crtc_state->mode_changed
 from atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-drm-dirty-modeset-v2-4-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7218;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ywj2QbrIUOhbEqfzeGCGI+2h2YoIF5PaEJb2YvtBcdI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnkjnH5EQ38UX1kFV3dYaP67laFRQ78Drnr8J+p
 ZgzDnFl7GWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5I5xwAKCRCLPIo+Aiko
 1ZxrB/9W3LpBM1MAETuxxqocvZvwhLTJUljEwK3X1NWFwIEAH7If2Ts2Bm7q+C0BgxqciObi0s4
 YKnHN0XiPZM9luNynljyJAO2STnmmdOLIWKfCpK/MByVWrS+NHvRNQg66EpIs+S6hv/Y5hzbEZZ
 eija4PHE1PlAA9NfQKbuuamPKjM5lXki8FcVmRv65y/HNiMAoxfmeEw8BvW+TkPnvhwYAvG3Z9L
 20ZnkhDapHmnneJUiIx/5fmqaG3I1/ePPOmx/Kji8HxqFhBt2XvK/axm1MH0O/mCyHhevJ5OeWd
 jyCDSgsjDOCu9m3MTaDh8jTjZGqK83CaSByWX6yDO2WPZ0HW
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
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
 drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
 5 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index fe139c49823674adf980db5faa3f2acd4c9c20dd..a24fedb5ba4f1c84777b71c669bac0241acdd421 100644
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
index 97e9cb8c2b099f4757169cadf7e941148d2bfb16..9748d24b3ffde45992d28b697a88db5992b00c69 100644
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
@@ -1062,6 +1087,7 @@ static const struct msm_kms_funcs kms_funcs = {
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

