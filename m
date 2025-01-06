Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA8A01E6D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 05:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92E110E12B;
	Mon,  6 Jan 2025 04:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E9VDqo2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1616210E12B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 04:07:54 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so241721a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 20:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736136413; x=1736741213; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V2frQ7frjJisKF4fY9Mlmay17Gex/iMexCWUihejiXI=;
 b=E9VDqo2PNWYJAnyoU3m4E48UXeS7ig2Dci+pS7SnhJo6EQo6lNl3abiyXef5zJiJPK
 FB/wyMVa5ayQphsn1hW3b3WLoRw/n4BQHBFVeihmvYkQNidElmtcvtMr8+0ikM2CZFgr
 terb2xSlaIZzmDM1IUdTPuvQ0xGus+jFxhDXIjk18PIHhSgS2m2aNhgrd3uFg1YGjJLN
 bXEe7FIrkxB4e0Fnw00LomPyhRPqWCblYPoJdy8PTMQQLImF0h8B2Ha2fFweRfwKEpJj
 ip5NkRazOJy2r+gHRsaJC61Rxxyskqwi7V585p1sVlLDhAplcDzrBzBZmBGwFilTzVDI
 +hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736136413; x=1736741213;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V2frQ7frjJisKF4fY9Mlmay17Gex/iMexCWUihejiXI=;
 b=YcrhoPNI1DAEIZLRyHyqvpp75R0BojZbVMfFYplsR/FnYeN5HOEcEKVk5+kVMMf4jA
 LQO27qdGNf+uI6ie/Ql05VIiNPJpPEzU01SkACFzfXr0TM9vY0wGAWwMXxinWZLOmIWd
 96FdjubtaRY/Dmdxmw1U9IwZEp//VXCpbNUco3j4S8iCX8kv+rD8Ch9H1JQdE5ycYB6g
 rohBupgb/L7Ejl4zpaDSrmBTxW4+JEUfGpRe35mHiOqHfSYsDZ9mkXv2/1ZWN8cj5r7k
 AsXGU2W8SeJcL5QoVXM9FB7KIEIWpwnbmvZTyK4I2BjsWVTgY8sA+fpdT79ZeF6HZIbs
 v23A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhJoPvhtsRhfd+agbRPsOvQE/mAtfFP6WlFEUcgTP2CXHquwWOz/XA86NjdNLvtON2qZbJ3etR/I8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCstwOGYCvDYKxPUkSDbGwKTkKHlZWGRPvfcnca7YLv2PlF33x
 t4bPpJh0teeQ0+seylFBR8+PYw2DjDdN4ASC290R+w9g590ANj8qk5s6wgCncf/fCtMTdPdFAkn
 bdsI=
X-Gm-Gg: ASbGncsp+JvXFoRD2QcXW2VuAgSETQlivHPkJbhx0dFqq7BXGB9cDoAd+pbqAS50Boc
 Q018Xp0qZLiSIaXAwGhb1CktDhysIHaALMpyjXQtiv/fzjNy26ag9VRsICBjfu41ZZ6zBBpcSI0
 FWB+XN8I+0cjU6D9GCQWcpC3RGUcQV9mO92Ecc40Zb9mAbcIOPVuXAoQ4dN3+YTHYRklqRlhKLr
 OZrfrSITr5esdSx5EG5GNvSu+hqnR5crMtUVirmILJhg9XOVt6GVnC9I78RuNZ4
X-Google-Smtp-Source: AGHT+IGoFsQl+dE5DLTgXkjBCinLyHxxWlry1wlU/1uPByNsy3ri1wr2sp6D9riVVoPCTLcSQPRJig==
X-Received: by 2002:a05:6512:1055:b0:53f:167e:390f with SMTP id
 2adb3069b0e04-5422956bd7dmr17510177e87.53.1736132865280; 
 Sun, 05 Jan 2025 19:07:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:36 +0200
Subject: [PATCH v4 2/9] drm/msm/dpu: remove duplicate code calculating sum
 of bandwidths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-2-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4681;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=e5UbVaT7LzeJrygH1gMv3eM7lgsU2vrSsGS5cybMORE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3q1x4/tO/YoBR99nD9lue3PU76Sf5M3JCip6nVdz2VpT
 LvNy1fayWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ9D9l/ytTuOb11BL3f8uY
 ArvuJyi3NmzfasejxH5yK8e8C9rPppu5LukUe81mW/U9WWvawQk3lD5vN0g3fBdefa1Pdm7bUi0
 B0+oJsbphRxp2VeWxcFTfUJG2DDps/n7TkXTJvd26Ust+hKo9zFpVXfpt4hWBPWJ9bjxxwVW2D2
 4kVabd6G+WWFagc36qQsT5A1dDquR/hLFuDWC7/6WaxdRxQfrXDf+4PgSfVz3C1ODzVztiRdgPr
 obYrO3H2vIYZvK6++1UiNO+L7FW1f0zd0Z/qHLTlNuyH3pWLKnilLLcuemo9aPj1+4Inzhb8TY8
 bF9h25kao3o2rsCehdo2Rb/fCDR5WXKekLT8euvZN/lvAA==
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

The code in dpu_core_perf_crtc_check() mostly duplicates code in
dpu_core_perf_aggregate(). Remove the duplication by reusing the latter
function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 94 +++++++++++----------------
 1 file changed, 38 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index c7ac1140e79dbf48566a89fa4d70f6bec69d1d81..f0d490afb53be2f4bc706af91da05bb893a5fe34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -140,6 +140,30 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 			perf->max_per_pipe_ib, perf->bw_ctl);
 }
 
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
+{
+	struct dpu_crtc_state *dpu_cstate;
+	struct drm_crtc *tmp_crtc;
+
+	drm_for_each_crtc(tmp_crtc, ddev) {
+		if (tmp_crtc->enabled &&
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
+			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
+
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
+
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
+
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
+		}
+	}
+}
+
 /**
  * dpu_core_perf_crtc_check - validate performance of the given crtc state
  * @crtc: Pointer to crtc
@@ -150,11 +174,9 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
 	u32 bw, threshold;
-	u64 bw_sum_of_intfs = 0;
-	enum dpu_crtc_client_type curr_client_type;
 	struct dpu_crtc_state *dpu_cstate;
-	struct drm_crtc *tmp_crtc;
 	struct dpu_kms *kms;
+	struct dpu_core_perf_params perf;
 
 	if (!crtc || !state) {
 		DPU_ERROR("invalid crtc\n");
@@ -172,68 +194,28 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	/* obtain new values */
 	_dpu_core_perf_calc_crtc(&kms->perf, crtc, state, &dpu_cstate->new_perf);
 
-	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
-	curr_client_type = dpu_crtc_get_client_type(crtc);
-
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
-		if (tmp_crtc->enabled &&
-		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
-		    tmp_crtc != crtc) {
-			struct dpu_crtc_state *tmp_cstate =
-				to_dpu_crtc_state(tmp_crtc->state);
-
-			DRM_DEBUG_ATOMIC("crtc:%d bw:%llu ctrl:%d\n",
-					 tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
-					 tmp_cstate->bw_control);
-
-			bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;
-		}
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
-		/* convert bandwidth to kb */
-		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
-		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
+	/* convert bandwidth to kb */
+	bw = DIV_ROUND_UP_ULL(perf.bw_ctl, 1000);
+	DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->perf.perf_cfg->max_bw_high;
+	threshold = kms->perf.perf_cfg->max_bw_high;
 
-		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
+	DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
-		if (!threshold) {
-			DPU_ERROR("no bandwidth limits specified\n");
-			return -E2BIG;
-		} else if (bw > threshold) {
-			DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
-					threshold);
-			return -E2BIG;
-		}
+	if (!threshold) {
+		DPU_ERROR("no bandwidth limits specified\n");
+		return -E2BIG;
+	} else if (bw > threshold) {
+		DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
+				threshold);
+		return -E2BIG;
 	}
 
 	return 0;
 }
 
-static void dpu_core_perf_aggregate(struct drm_device *ddev,
-				    enum dpu_crtc_client_type curr_client_type,
-				    struct dpu_core_perf_params *perf)
-{
-	struct dpu_crtc_state *dpu_cstate;
-	struct drm_crtc *tmp_crtc;
-
-	drm_for_each_crtc(tmp_crtc, ddev) {
-		if (tmp_crtc->enabled &&
-		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
-			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
-
-			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
-						    dpu_cstate->new_perf.max_per_pipe_ib);
-
-			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
-
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
-					 tmp_crtc->base.id,
-					 dpu_cstate->new_perf.bw_ctl);
-		}
-	}
-}
-
 static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 					  struct drm_crtc *crtc)
 {

-- 
2.39.5

