Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A084A01E43
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 04:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6F710E56B;
	Mon,  6 Jan 2025 03:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SDQMG6VQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD81910E56C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 03:39:09 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5d437235769so5181434a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 19:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736134688; x=1736739488; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=swDuQmaW1jB5oxxfqZCzBvZatK3qx5WhH7+L/hnGQig=;
 b=SDQMG6VQosjLBBICHrt3pW/hrrwgZd08lALHzNKnDcuXZ8x2N+6jYZA6cGpTq9wBPe
 hvd4KS5zssH2ZBK52LdpmgwYCnHBwkWc5hqEER1SiDIPwu6+dVsbNRrIt+iy8QpAOCUb
 3E3ZVT5cmLKjoZ+vsilz59HqsiJpANOFOH+kPbrAKdU3R1nal/VXT4Ibmd0lktt+e1Vl
 kmTbAntAqeMyJvmelM6shL+CVL0bpazivrOq9rWaasuEDoka4pySuHFFdP+PNtP5xvPO
 qqF2NdrOOSbb041w3ehzZWrexW7WwjgbY+QHaci79xj/gUKrgis6GYCqI8RUgwCks6BF
 EB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736134688; x=1736739488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swDuQmaW1jB5oxxfqZCzBvZatK3qx5WhH7+L/hnGQig=;
 b=p8nNC8TrjPKsIap1itsiASCZ2O3yy6+We7iaJEErrHxq8M7poOFhgRV/JywmR5dVtH
 V2hHIs1LvZbrjZvL4R3wd9n/DqMat+ObAyxTBxS6QPOdEKhYukF4r14rN+qmfZbDEZ69
 PBrDc4g5A1wQ6obTNb0OUcTatHr3+Fr8SM7d8Tv8OLh9aieSDiP7nHcjhfv1rBJM2769
 YeIvWZOMA59Gt+imJq4c0+0jvY7LMYi7EE3PA4+J2Cg3l9aiVZSLMNVXsK6ccqxE6Qsr
 lMHZzRLWuwTcTW6Z1yo8A+qrnNTz8giDuV63nj78gYjaCeK0erPewYUJKpBcibM75Y0O
 v4AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTYVlJTU1aotiZMRhXb2jxBUtKL6h6xByC7rUXYDNWJNvJ9bY1vB+umXrhH6qrA+fG7BSjnaQeols=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWBWK3aSQRDKcNJKP2NVYdtdzVAfSmBlHExrphBhyxm+7PA3yf
 VaDogIQUZE3IsbVGiA+LTyow2ZVUe/sg0IpkhSajYt3nJ5FNDXpWuXcpK/O0GXozIPRmhmXmzD9
 /FFc=
X-Gm-Gg: ASbGnctUrhnL0llBiZLC8ouj/BZgBsDhp1a13l330ayUQEe+qlSV4L96Q7eaDJPwTTQ
 IVWoBquyavi+T2zT1hHqmuR+lNv/QFUxFmq3QmLzQQoCSp+IfWrSoXVqjxW7/DmciGfsWD51iVg
 Mfu5q7du99eh6o/oVPTEGDm4bwUb7AqXq1yFTG8Of+APbNBHw7wjcJGdy1AHqtgoUDMH1ekxKpQ
 7vYTR2bh0p3xjYYHq3t7XmZI8yclNPfz0/RMiKMttDhaucMWOwP0bhrdx6OpUgB
X-Google-Smtp-Source: AGHT+IG2M9aFMxTan3YopooGfdGfRiY0x82IbSXTPZPHiw0oye/j77ngPHUTAEzUD74f992i8cdiWg==
X-Received: by 2002:a05:6512:2350:b0:542:1bdd:511a with SMTP id
 2adb3069b0e04-542295322ebmr14373018e87.13.1736132862909; 
 Sun, 05 Jan 2025 19:07:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:35 +0200
Subject: [PATCH v4 1/9] drm/msm/dpu: extract bandwidth aggregation function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-1-00b248349476@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2664;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ranvcf9s/bstJI3Eo8F/WLE+D4NDgHgD/Z08d8sAtcc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j4V7gMlJS+NZnYUb5mxgwM/JXVWs//nPIj4
 PCukzy/PrmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+AAKCRCLPIo+Aiko
 1bVyB/0SPP/7XFYWq88gWJAZjJWFRNQJGXsz8SOcFvxdRxFETxTsGsqNHsA7zgTTuYwj2lldlZx
 +4nNrS/qJc17QHWTeUS5YUguRQOpTIulHxY2JwTiXsYSn9mvHGHWLYKU4yXb4c6R5KYyUkj1itn
 OHfFJerRzaWcdgeJQ2klEC/wRAPUqBq5cOUTxerirAKadMKgc8oPVMV32M09nQfTOOuGL3IOHRj
 xzs5KCKmwOk9xQMbGybB+NFvA+RDMVkgmljgaX93tuyhWEqid4c2BPdMRB/M79pCIQaZ96dFk1A
 DytTmjIzZq5Jy6UdXsdTaADceNhPU0qBv4LUPKTOlFDb+r4g
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

In preparation to refactoring the dpu_core_perf debugfs interface,
extract the bandwidth aggregation function from
_dpu_core_perf_crtc_update_bus().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 45 +++++++++++++++------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..c7ac1140e79dbf48566a89fa4d70f6bec69d1d81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -210,36 +210,41 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
-		struct drm_crtc *crtc)
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
 {
-	struct dpu_core_perf_params perf = { 0 };
-	enum dpu_crtc_client_type curr_client_type
-					= dpu_crtc_get_client_type(crtc);
-	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int i, ret = 0;
-	u64 avg_bw;
-
-	if (!kms->num_paths)
-		return 0;
+	struct drm_crtc *tmp_crtc;
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, ddev) {
 		if (tmp_crtc->enabled &&
-			curr_client_type ==
-				dpu_crtc_get_client_type(tmp_crtc)) {
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
-					dpu_cstate->new_perf.max_per_pipe_ib);
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
 
-			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
-				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
 		}
 	}
+}
+
+static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
+					  struct drm_crtc *crtc)
+{
+	struct dpu_core_perf_params perf = { 0 };
+	int i, ret = 0;
+	u64 avg_bw;
+
+	if (!kms->num_paths)
+		return 0;
+
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/

-- 
2.39.5

