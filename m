Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6BAAAC9D9
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0C910E6C4;
	Tue,  6 May 2025 15:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YahiTdIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E0B10E6E8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:48:08 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b0b2d1f2845so4223709a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546488; x=1747151288; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
 b=YahiTdIK6I0xLpuzYTNsk5k0ojmnttWPGMCKzbxGLE+lOrm5XnbkiscNjQaB54TWKJ
 9CdhEoeU71ptOU5ETYm1sd61ItDndHx5VbVLGoFVNi1PH/zo+2t9f6JYO264XKovrvUp
 yzCCxYeppqb1qi469J6gIx/93hVG0SLO2fXL/yuIL76q5VhQhsMHY8VDPv7+EOIIYMR9
 j4/5OGi9WypHYqFhr8B/hBh6+L+5lQsa57ndD7EwUFs3W+Em821ilUdtxxVhrIVUFW5b
 laK+YdAgcF4+jIz9rYDapDwkZ5tktaOhTh5OfPG15EuSphQvywkCBgDLnmOhCogFF9qP
 ZTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546488; x=1747151288;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
 b=Gcznz4fB0i29tq69J9bfupAjNG1HDHxyi97+R5m9yv934umfX0yQRm2PT60KrlRk7m
 Dccp89oFqoJgDfeTAxfidnil/nuBS6SnfvW20H8eExRhYsFYNEUkfKqgRXX40mxMf70R
 ccfxsd5g0NBWahgr9QY4ecKnXjtuDMnE3cDl1XD6Jqy+ZoNBVuOt2gIGwkBXPiOe751u
 xjtUztTkqfOEnKyy8AGNzzweTNnvT0YxGRU7iRWsr89zxswZYWw0Ea1qM+QqnfuX4PJF
 nouVErq7DsA8xbYMgO540J0JbX9RhGT8EBY8WYJlSEw9Bbn0GfZpDN3f0iqgmMlHQmAN
 4chQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRGE0K8B0VEDhlOoqJRpJ8iHmFNxQtmunCOIHCBlXOTr8+XrVCxb5t3W7/gX4IfxwGek7fs23lPro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXhNNInrXBxIZhP6KXpMBRwPPxqehZQT3Ntg+0ktLHyoH+q6j7
 WSfcMZkXqRfTOyz2JE2gfnLh/XQVtm7W/ULOmuIym5EyzMV5OlZPdVpa6PNH3rc=
X-Gm-Gg: ASbGncuZ8bZzrzX60SMtIjcflY3te/fkXhSOS0kc/kINiAVGcEoG3cPzLV7gLK70Pmb
 5DC/TVExVZpk+aYWJsiO8ZY/quHySPf+QWNPUsjZPITgBaYCoWvE38Fov6pUIt3ucYcP2NCzLob
 fYXrvnX7K/AGm5RhVtzpR6xuUpjibxAde74tu3m1F42eESRqaER+zhicFH5w0Z5xfj3vGO/2I1s
 Hz/HUXblPduIPTrS9GIdbDaHdKT0Jq5Dr+t5S2jUjGHkt4sWsBvhji6MbRUAAyCRVhlbly3CB1W
 jcZyjmNl7qoVtzxL+Pb/ExFfilNRebWwciurOFt46t/YMClI
X-Google-Smtp-Source: AGHT+IHFnX+o2nRs6PiAJQ+M/4Myfc9A4VCD1dMDlWNAgzLHxrW1ODuhrQWlbAIrmPukBYmSBfVpTQ==
X-Received: by 2002:a17:90b:3c43:b0:2ff:5e4e:861 with SMTP id
 98e67ed59e1d1-30a4e622775mr26468833a91.24.1746546487995; 
 Tue, 06 May 2025 08:48:07 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:48:07 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:33 +0800
Subject: [PATCH v9 03/14] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-3-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2tgdYLNBOLqvrFN89J2Z5WKCnyYFo8/7L7F+T0zCRyk=;
 b=JtV2qtTQ1bo0l3o+ig+MQ18Sv4GmdmhOn3SvnpALB6vADW+/Z8VvzKg777kclcOGctKDVG9jD
 SS0llAeD0JGAph4iYlLEke77vbl4IF6X4/C1VYk1Gnpo9PPhUdWm7MA
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
index 2e296f79cba1437470eeb30900a650f6f4e334b6..2d8ff4b524715c658188fe56bc337e3ffa831c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
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
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

