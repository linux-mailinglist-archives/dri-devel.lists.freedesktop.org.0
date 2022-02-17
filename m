Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E694B96D5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF95F10E72A;
	Thu, 17 Feb 2022 03:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B552410E745
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 03:45:06 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r20so6376824ljj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dysF/AP9QrJMWquX5SIkWcaQNfAWXARtu2Y4zNfbQ6Y=;
 b=rfKoIO/TT0FpbBVRgmJfnMsCvEmVCEunaz/kfpFZYAHnEjxFUgxcRn1yUIRvovksaZ
 DPkxdpMLFLpZy1IZ2fVtV3qpo+0GYk3gCtuqYezuvY3ykyxYvd5RmhoLWu1IjEFFWGLh
 NZVnoYNn4G9L7Wdv0fTE67lJFr11EO1tfPeUFy57IvJ3sbaqSZ438/0UvniSUUEHrLh1
 G3ps85iIUOuizIMBF8clZrlJZT6Ec5kfo6REQgSucJQr28gXnLhlaE3L8/MUb7shYDmQ
 86S1F2M6Ajc96UPr0yB8+/+jcVzb4ce1LEh+7wxa7nlOUb2cwABxlTQ3GruYfMO3cMw0
 cyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dysF/AP9QrJMWquX5SIkWcaQNfAWXARtu2Y4zNfbQ6Y=;
 b=Zcnovo5uQq+/lHyjQ9DTShfJXhtHvWImW2+pYHYpynOsjEWX5Z9A03aEljGyhoGq8Q
 xsQPyIQBN6plNFrOllPtT51hmyprvx2nokv6y87DsO15B2jQwXK/6oNmKGWQykkf2XZV
 DUTwCIwlrgOUFegGgVGtQ4fOwtd7UFp/Y8n0do8gWpzwvA6ddVpFVu24nns6L76NCyuk
 kTi1IEyaLAlqly0rkrIr8cJQN91h1+blu15lfK1fYbcduXtHKa6kzO80L7atH6p2P9N0
 JUg1EkCaZFVFcIpJVAUd10x94614MdLRaM8d9rC04XLqQ2QeX3nlryYWCbtnLocp8qwo
 UieA==
X-Gm-Message-State: AOAM532Kqhfs0HGOA/VBLP/h++Zm5DUn2c4o9gNOGKXOUSi6UmREXEm1
 VOcoNrmGgc52jGWtXoisraUBzg==
X-Google-Smtp-Source: ABdhPJzfd57r9AWVvQJ8QO+NOokrQNuI0VwdfIaOHr76fIVGnFwYUeNEfRwB6fP+WoBxyt3FZ44uWg==
X-Received: by 2002:a05:651c:307:b0:244:c6a1:167d with SMTP id
 a7-20020a05651c030700b00244c6a1167dmr833196ljp.263.1645069504902; 
 Wed, 16 Feb 2022 19:45:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c25sm822268lfc.22.2022.02.16.19.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:45:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/3] drm/msm/dpu: drop VBIF indices
Date: Thu, 17 Feb 2022 06:45:02 +0300
Message-Id: <20220217034502.464312-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
References: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We do not expect to have other VBIFs. Drop VBIF_n indices and always use
VBIF_RT and VBIF_NRT.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  6 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 36 ++++++++++++-------
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa4d20762ccb..dbb853042aa0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1115,7 +1115,7 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 
 static const struct dpu_vbif_cfg msm8998_vbif[] = {
 	{
-	.name = "vbif_0", .id = VBIF_0,
+	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.default_ot_rd_limit = 32,
 	.default_ot_wr_limit = 32,
@@ -1144,7 +1144,7 @@ static const struct dpu_vbif_cfg msm8998_vbif[] = {
 
 static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	{
-	.name = "vbif_0", .id = VBIF_0,
+	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index bb9ceadeb0bb..598c201ae50d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -254,11 +254,9 @@ enum dpu_wd_timer {
 };
 
 enum dpu_vbif {
-	VBIF_0,
-	VBIF_1,
+	VBIF_RT,
+	VBIF_NRT,
 	VBIF_MAX,
-	VBIF_RT = VBIF_0,
-	VBIF_NRT = VBIF_1
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index cbbf77b17fc3..c011d4ab6acc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -19,6 +19,18 @@ static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif v
 	return NULL;
 }
 
+static const char *dpu_vbif_name(enum dpu_vbif idx)
+{
+	switch (idx) {
+	case VBIF_RT:
+		return "VBIF_RT";
+	case VBIF_NRT:
+		return "VBIF_NRT";
+	default:
+		return "??";
+	}
+}
+
 /**
  * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
  * @vbif:	Pointer to hardware vbif driver
@@ -50,12 +62,12 @@ static int _dpu_vbif_wait_for_xin_halt(struct dpu_hw_vbif *vbif, u32 xin_id)
 
 	if (!status) {
 		rc = -ETIMEDOUT;
-		DPU_ERROR("VBIF %d client %d not halting. TIMEDOUT.\n",
-				vbif->idx - VBIF_0, xin_id);
+		DPU_ERROR("%s client %d not halting. TIMEDOUT.\n",
+				dpu_vbif_name(vbif->idx), xin_id);
 	} else {
 		rc = 0;
-		DRM_DEBUG_ATOMIC("VBIF %d client %d is halted\n",
-				vbif->idx - VBIF_0, xin_id);
+		DRM_DEBUG_ATOMIC("%s client %d is halted\n",
+				dpu_vbif_name(vbif->idx), xin_id);
 	}
 
 	return rc;
@@ -95,8 +107,8 @@ static void _dpu_vbif_apply_dynamic_ot_limit(struct dpu_hw_vbif *vbif,
 		}
 	}
 
-	DRM_DEBUG_ATOMIC("vbif:%d xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
-			vbif->idx - VBIF_0, params->xin_id,
+	DRM_DEBUG_ATOMIC("%s xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
+			dpu_vbif_name(vbif->idx), params->xin_id,
 			params->width, params->height, params->frame_rate,
 			pps, *ot_lim);
 }
@@ -141,8 +153,8 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 	}
 
 exit:
-	DRM_DEBUG_ATOMIC("vbif:%d xin:%d ot_lim:%d\n",
-			vbif->idx - VBIF_0, params->xin_id, ot_lim);
+	DRM_DEBUG_ATOMIC("%s xin:%d ot_lim:%d\n",
+			dpu_vbif_name(vbif->idx), params->xin_id, ot_lim);
 	return ot_lim;
 }
 
@@ -242,8 +254,8 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
-		DRM_DEBUG_ATOMIC("vbif:%d xin:%d lvl:%d/%d\n",
-				params->vbif_idx, params->xin_id, i,
+		DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
+				dpu_vbif_name(params->vbif_idx), params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
@@ -263,8 +275,8 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 		if (vbif && vbif->ops.clear_errors) {
 			vbif->ops.clear_errors(vbif, &pnd, &src);
 			if (pnd || src) {
-				DRM_DEBUG_KMS("VBIF %d: pnd 0x%X, src 0x%X\n",
-					      vbif->idx - VBIF_0, pnd, src);
+				DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
+					      dpu_vbif_name(vbif->idx), pnd, src);
 			}
 		}
 	}
-- 
2.34.1

