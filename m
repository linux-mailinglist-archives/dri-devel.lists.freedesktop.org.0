Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0EFA01E0A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 04:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7FF10E563;
	Mon,  6 Jan 2025 03:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DtCJcLMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9294310E563
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 03:08:51 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e384e3481so13291241e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 19:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736132870; x=1736737670; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oZO2/JK1vJqeJvxJrlYDZUuiJ755Y2NffqKG//AhfG8=;
 b=DtCJcLMdZHKuc3JWxmcxfYrKBz3UGQHxZO0dKv7IPhax3K+C0/e/ug4bG2EcsRZ1ji
 ixE6mff5qkvnq7C4UUZj9InzxPpZKLDRc1e1D4RpawqVD6kdENHKVziv8PA/OBLK4Hoj
 vAvhejarfZjAdFTqW3lxk7CnEYVrNxAL1ewjftoa944y9lrSKdFbART4ZJiR/nMSaEk9
 1iqMcNrjBD+lzqkjUvbZ9OvDJ07nYZqM9uwdi3/8s2Ri1JIuPNcDxnAap6FcmHRJetzm
 4kfg6y048pcEHcfhJtb/pMhIlDOPg58Qe7LigsqzBJyLNgqJgyrejnjT4uJlGE8p5bw2
 fTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736132870; x=1736737670;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZO2/JK1vJqeJvxJrlYDZUuiJ755Y2NffqKG//AhfG8=;
 b=YYe6il6t1IMBjIBer/D+LvvVLEbwZqHzBmY+qTiRcUtOzbpnwLnfzdotJVvo6lpS4+
 k31W720s/A8zEVr3CL4gcStsRUheRmZjW+SCLFRdt1jN8MEHOvJdmYqZqfz+gQuKGDsa
 OfDTNj6mSlsanc59/b9qyCoopHnLbx+sjJMo1he6l+YZRWk6CgHgpGiGRxBGM2AjJsOn
 288AjAKHYQQ3kBgLqyudMneN2JQQtHc6MMtdKPyiCxLQfDCi191qBBP028Rj07A0yhPp
 DYi8813b8q2Opk6J/JJCK8LjL2tbIQDgB92XF61ok0DuGzjISEMXhioC7CIcLRRcTeQC
 2p5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDJ10iODU3FsernenhayLUDGqIaHKtu1wZ80co/GvPxxPsbuvEWR78x1Ib2B6YVKMorXZC01FruWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7WZz3R845IL/S/dMg4SFvr0fEzF2k3XstOl5QVo2U0nImwu0D
 s4g7MtRdoEp4/VcXTVPCFtRu5UTJpqw/b04MfYCtXEZO89wOn2RM2ux9pbxGzMrQ6z74WRJOxi9
 BxOM=
X-Gm-Gg: ASbGncvLrczF2x3qgqL6F5gA/D4/tU8TmKxm09VyXzHZmLhT6DlXjtgdIubaw6DkC9U
 iw2XUWCKKKsAQpdq59ysC+1MpucZHctrAnUJ4GsyOD6HLg68Ife5GNGEmzlWrKcwhaYCliVf01I
 FTR/nLfofZI1nzFHc0J8pf2RxnL7zzedZvye/BKg9y7UQCz5xGZdGDQoYt85LCTbLkrEKGizLoW
 oaiZwiMUxdKxHSS+amL12srtiV0Cq5TNXdct+StbOAOEnJ2EqKa0/z1oJ1N2nyX
X-Google-Smtp-Source: AGHT+IGVNTbTo11ia3rI1vyhLprYs/ETfaR9ehq23gsHe9NwxJ01d9hxUtMjVjVfY/pmtpVerV1+Sw==
X-Received: by 2002:a05:6512:3e1e:b0:540:1d6c:f1bf with SMTP id
 2adb3069b0e04-542295254a0mr16112607e87.11.1736132869972; 
 Sun, 05 Jan 2025 19:07:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:38 +0200
Subject: [PATCH v4 4/9] drm/msm/dpu: make fix_core_ab_vote consistent with
 fix_core_ib_vote
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2302;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JMIpMFmUuSjIWpzC5uW4TfFD57Bcj868StpQVqk4CIM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5yJtIKct8p9ZxKlcKTed0ff/2fXsxmYZkR
 cqjaLxugFmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1QJRB/91HLihkUTCkNJfedXqBJP7HeE1u9hlmhHKfhrQs34HNSx/8F3/rsHVSOHqMSkRKnvOGoG
 nLK6HfX8ZrPrRU7I3hD0nD4AGRkLsA9TjhY4xq3cG+icaLQAbt218LGaW7EyQmd/61/VkFY/Cu4
 iTEB7oMMawkw6Mh7PU6y0acf5owjOVOp4bRFJlm+sXdMwlevTKQIXHL62yYFA0HxfpivnfGuTai
 8Rs/rSfzKrHBJALsCt0IAS3jnkdtlnyfOVquR/lYPYiccngjOxzI5A2J5zWQW7Ww50csO1Y0qbq
 lrMwch96EW9kWy6TJ+aBv3oXAEz9az0/zppFJePMpF9NNuVF
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

The fix_core_ab_vote is an average bandwidth value, used for bandwidth
overrides in several cases. However there is an internal inconsistency:
fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
in Bps.

Fix that by changing the type of the variable to u32 and using * 1000ULL
multiplier when setting up the dpu_core_perf_params::bw_ctl value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbbffebd7c70fc37d9159733 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
 	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote;
+		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
 		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
 		perf->core_clk_rate = core_perf->fix_core_clk_rate;
 	} else {
@@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->fix_core_clk_rate);
 	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
 			&perf->fix_core_ib_vote);
-	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
+	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
 			&perf->fix_core_ab_vote);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index ca4595b4ec217697849af02446b23ed0857a0295..5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -51,7 +51,7 @@ struct dpu_core_perf {
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
 	u32 fix_core_ib_vote;
-	u64 fix_core_ab_vote;
+	u32 fix_core_ab_vote;
 };
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,

-- 
2.39.5

