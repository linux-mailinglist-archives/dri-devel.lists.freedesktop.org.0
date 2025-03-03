Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60661A4C484
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0F610E44A;
	Mon,  3 Mar 2025 15:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HuVY/9AG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1AB10E457
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:15:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2233622fdffso87225675ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 07:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014917; x=1741619717; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WVHIeMwosUPS7NCbAFkat8Xssywx3I7J7mm+tnW6eUI=;
 b=HuVY/9AGHfZcrQFNlOyOyY0jm0rwA/zfThiJBGacTLCj8OwpybLvRt8mTpTvBFpDZr
 CxIgsPP3hHKm/M06roFRyKhn7nyD4c41gkqgsngU79PfEJNuqrMC5cpKvs3QaBEIQs7L
 +8riOY57TKZEHcQHf09cwcLy1By16/Ua1/a4Nq1nyNMr4HYWfU6F8nhBDj7ov4VeVgtm
 OhFeA9miFTwSZqNA8LMt6bKcd93jGf5JUvebuK/dI6icas8yRtn9+/g12hdBzwkKaQLa
 2o0uPiOkz8aljrieT0qHwLOBm0jdDDx1PlIWRhbytnOFMwu9uxrItIokk5qBe89yT7o9
 OltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014917; x=1741619717;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVHIeMwosUPS7NCbAFkat8Xssywx3I7J7mm+tnW6eUI=;
 b=nycQiXYyFAwWzFcrxlr9rHl6Jn/6ZvKb0uEUR5mRkBhds1J/2IuoVFrBodYwok+8Zk
 HlYBBCi/Dvf0EOeV6I9fSk4ApS1TMMlGEhhR4eZyaQ7j7cQZ2+4cl6Az2QGvVDNIcvP5
 uFHosXxlZtQI2t+NzBuUmIJa0Q/SItHHMOH8eFGL1t0mAejmr5Bs02WIkuybpO+tnO1X
 3UmQvBxnHAzgaQSTfoKOjcV/dnjxDOnM1nlVG8inASm6HP93G7kgvBrBpW2LM9bWb3WB
 p82nqnneTbJTmRi7cNaxQvZcFNdkKJGcgd2e6dYykJZ0v5177hXBMDP8JsBlhniC+VXW
 bsOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ4YXspuxJb6GeZyjnrzDJ6+O6Uv8r3kQhMGK+7m8+HYkFQMbGC1EG0dLQSCWbCbMlnoss6bEhgAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQoBjl0+D3qA4txP08DEqiHOvnhyJsYQdnTLiU/Nan2s4MkdGu
 xOaLWtpUB2+gJv7W8RN2Mx7mVy51Sshf9gvhLDNr+bh2H4rR6ED1N40N6oXDzHY=
X-Gm-Gg: ASbGncuh0YvP8TgriB2H/ok0MnJs3Uirm4eUDhdmSMZ2Y6Wqf4BAnMNxNDHpFtH0DxD
 7oocCfs1L0jk/BEejtRKTNJ/4XXNVycL3pxSN/7nncxmE53IeYzd1UzuCsK9LplCXSsYLfB9iah
 MuHpzHm+LHKikpymm8+U1fOsaKzVXuNIBsijjCwrrnun2f5olfO7jIV4hSJ5rq5apTdFIwIRQPp
 nfBV3HiIovYRiFAX8xDeUHusr9Iq801aZcTvZ4RdmHkLHf+2tljt+sKUmgtzXYIDddiXoHyddY9
 T+KvzyGQtzYP5IFcFw8IvGpDd6L1DTlvX0WO6DwSTA==
X-Google-Smtp-Source: AGHT+IEDCCxneyDGrxpoVa1e/lVrsWKBTEfTydvZL1WgtRjC43I4z0Oh76p6iCNwl8fDaA8IUbPUsQ==
X-Received: by 2002:a05:6a00:23c4:b0:736:65c9:918d with SMTP id
 d2e1a72fcca58-73665c992b7mr2534582b3a.8.1741014917092; 
 Mon, 03 Mar 2025 07:15:17 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:15:16 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:33 +0800
Subject: [PATCH v8 04/15] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-4-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=2320;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=80huhgGXFEbENAM104XVYwfft3r9+sKb5+LZQUUxkp8=;
 b=IbXsTCj9eEmPtD1AnyWyOeyRklNL6/w5i/ZK87g7/5tkipc8JeXMZmfHHBbvcawzwQ6ZQn44i
 xX0VT/Un90HBQaDQH1FPpRZd/PyrWnD8Jh8B5kV4ILQAVktUgA9hjUn
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

