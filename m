Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458CA45F24
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CA410E23E;
	Wed, 26 Feb 2025 12:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gi2vFrCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E2810E23E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:32:45 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2fc0d44a876so10766857a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 04:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573165; x=1741177965; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WVHIeMwosUPS7NCbAFkat8Xssywx3I7J7mm+tnW6eUI=;
 b=gi2vFrCmS/upExP56wUdDEM+NRHuDuDaavLyowGEkKee/ibnnqCNDwod65vHu2+Ch8
 6scGsWl5ijnGhlKYakHKPZP9Y3Xsi9gdSJMHViG+YKp8BCYqMKFwFzvE4UwLIPGrLyuR
 u0kAU4KatAuG32RzSQankJM9y6jRwZUl2XdcSE2frO2I+eKiS8qm8MWN7zw+OvBBpgZk
 duXZ4qRySSK7bAbmsQOrD4drI/VPWovwJUeg/tpgS5r3XmRhtF+Vp6k4jpjSiXDrQbLL
 Fszd9rEjQscyi6P3lXn124vHRpCPvPi8W8PFfyS4KHZbXPDOkwjymkctZmIyprXrnZb/
 5mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573165; x=1741177965;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVHIeMwosUPS7NCbAFkat8Xssywx3I7J7mm+tnW6eUI=;
 b=XoYGbJzXrBc9DYKFdlfAOGazjhY1vMt9TWeJDFUuJyjQIqttjVUr0VDB3WZsNu5RSp
 C3IxHPNEEZSaG7oGIdht9xQJoHVyw4amH5dtlUErMzW56Qq2qhf9wLnH+PBlUynCYU0R
 0IovaFwsnkRIsOSMHJU979GXeITUi4pd5QCKS6ROG6tAFwubjjsrQPNxVlJ77R7Qer3k
 Cy79kN9duLRiFeB7YdiDAVfh8sY2n4hL40hUv7prjrUOZIacLxniHLTUnOlMQxCNH8jh
 ehkY2LWgDm8p2LtWlXvdcCmnqRagt6CeKU2kYEps9QIAlaKv6TsDJosbnLnv59xn5nJ4
 zlbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRy2nY4XX7gdrs9d1Z937rja/9CDG0hBIv1HaGo4z+5UiYoRW43iwv7NWQwmmImBHgM2v3nlFEB/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8oyblYUb2iwW4ExGc7oNaEMX/T+NFspRBqbAuPKLeFx9Hz/IO
 XIt1xYuogBHqWQiZRnosttlgwfptMMD4AzSgnuD2igyK5LQ4QYS5Bg8QCn+Ikyg=
X-Gm-Gg: ASbGnct1787F3LTx+mnsoMQ+UfV2+liVSnRy8Khf3TrjBRaLwmSjfphJfWlgwB7+MXV
 WwpFF9VYU2+RZAxJLhl1k1rhzf3Kfez1XNv7+kE3+Lcfz5FowPnPS8D/6B09hZrInV+OU5Ll1t7
 C9MsM87shG7IE11B3wAka4yRuQTnLmMjErubkPVHEIRR9FJCRhBoTHRfYiAiFl6g8wrDr9aFZtE
 X0mGxadbYlDGB/W7jUVnNyyhJiDFpCxe2UMvjmBL+s3GxidR8IuEID23zenIMeSFbGOXyB7Eg0i
 3BBkFJzClI8ixxxpKRYftko=
X-Google-Smtp-Source: AGHT+IHHnvY3kAo8md724TLX/w1JYETJEQRhRXOPcyrnv9Hw68j0FgOVTVXm6m2F1RCRi5C6CxILig==
X-Received: by 2002:a17:90b:2551:b0:2ee:a583:e616 with SMTP id
 98e67ed59e1d1-2fe68ada3ccmr12141180a91.9.1740573165406; 
 Wed, 26 Feb 2025 04:32:45 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:32:45 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:53 +0800
Subject: [PATCH v7 04/15] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-4-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=2320;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=80huhgGXFEbENAM104XVYwfft3r9+sKb5+LZQUUxkp8=;
 b=N800EMJxkM870hTlh1d1YNwghKBAv8eUi9PS91ZMRhMCmx8xuZNr/cf+VD5ktphz+UCqq2yKS
 rz/q1cuzprYDmmKZsf4SJJ0WuTvxyJq32Zs41gIjKoZyWTEGbOZvkPm
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

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f5c14b9ec34806b83c7a58b71e16..24e085437039e677e0fb4bbd755a8cb3852300a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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

