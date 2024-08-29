Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B479F964141
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EEB10E5BE;
	Thu, 29 Aug 2024 10:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OQY0fPBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DFA10E58D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:19:50 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7141285db14so438523b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926790; x=1725531590; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5XVbg4H7DqUL1wC1sOrarS7KoxsQPZKXglpZrahZaTU=;
 b=OQY0fPBKxVq+Gd23BqPqqwHKWo0PBe5NOFR2PBzKkCntr29ctobilvBqr6P+gRjn+A
 coBXUFUuvZ087jQfXXjRNBsBGoyQN1CQF8yWETHAKTP7E597+hAW3018ks4Kl4a8d78G
 rf+cWzHb35cwsZFisrWk7apor9PKM2q5KDs61/WnnpNeyou9lZLnt6p5omsfrX3X3+vG
 IeNrYy1UVyA8MwdOq/PD8ZpfJPB1yUGQ90on0a3Y0lXe4/oNKqPLNoJl/g4azR+mseSw
 p8Mfffdm4EWuJuegmgpbBfIphU8FkDEo6LVNkBBHzWcfrto4Sphwtgg6ftp8ZrtqDHCO
 WmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926790; x=1725531590;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5XVbg4H7DqUL1wC1sOrarS7KoxsQPZKXglpZrahZaTU=;
 b=uLg9YZqHuIKYje8DLwwNdWM9modgBkq6w+rPDgckbEBSbAY2sgXzCy61zEbMpqaK1H
 /MMvBL08nYs01wXeU1LaNrIdWErDQ3mUoyqhA5MeByda/dPVKlI0wDVneNX9yNRbV/38
 Xx5GzB6sh63GgVVr6m2tdnbQbv3RrqT+Wpcc+c2h2cfDHar1RQFc8JsEbMSoYUfN6aIQ
 +jx0uStxPKoAziEA+FPdb6dwlP7NIou1MpeB0dDMMNWS6uC0OgZPBHhV0uCzoaVAVNRR
 EGgh9Rfm0bsusLY7nqRDuqSDJUQNhlGP+O3ojEhmu/seHtQe507VMtq9IY9zEM8yeSFV
 I6Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTcNzOjtaAmKLSeHMjJ2E77II/tiBT/MaDRtQ2Kt3/JtFOFKadZ4yq98QGt6Mp10mvOcdzY9E1HSs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkJUoIgMo6bagk+qPCemONYH9h/d8TrVzAUhQyZ1K3v6p6nRYO
 2DWkRe/f0qNf2cNWBykVB45gI0p8ETvl7jVizOEwHOYfTEKwKpMOF2B+oFwt9Hk5R5mlYxzyZdx
 4udpOjQ==
X-Google-Smtp-Source: AGHT+IGMiDAlBDPtFQkiAuC1/1Ru4Yek6z8/XGcKf7/UgBC41xY5mzvqMxXMJ8xpjMIYreA+jiSxnw==
X-Received: by 2002:a05:6a20:be1b:b0:1c4:c305:121c with SMTP id
 adf61e73a8af0-1cce10fe4afmr2046484637.42.1724926790096; 
 Thu, 29 Aug 2024 03:19:50 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:19:49 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:34 +0800
Subject: [PATCH 05/21] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-5-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=1882;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=sjBVYTV8i33N2zpmEmydrCOK2azR2M1Z7wjB2RL+G3o=;
 b=KlDubHL67SerBVY8xx5C5rEgv2bphTfdqkLShKTQ6oSJjyiQdRzrnDbHsO7yCoorHxYyrI+d4
 PPKWy5EToqpAUBNS0nw1kQCBCuQTNZkTCn/nz02pzYUcFPn1NzZ7pG7
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Add resource allocation type info.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 15b42a6683639..e219d706610c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -778,6 +778,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "blk_top",
+	[DPU_HW_BLK_SSPP] = "blk_sspp",
+	[DPU_HW_BLK_LM] = "blk_lm",
+	[DPU_HW_BLK_CTL] = "blk_ctl",
+	[DPU_HW_BLK_PINGPONG] = "blk_pingpong",
+	[DPU_HW_BLK_INTF] = "blk_intf",
+	[DPU_HW_BLK_WB] = "blk_wb",
+	[DPU_HW_BLK_DSPP] = "blk_dspp",
+	[DPU_HW_BLK_MERGE_3D] = "blk_merge_3d",
+	[DPU_HW_BLK_DSC] = "blk_dsc",
+	[DPU_HW_BLK_CDM] = "blk_cdm",
+	[DPU_HW_BLK_MAX] = "blk_none",
+};
+
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
@@ -828,13 +843,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

