Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397AEA2DA88
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 04:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BE910E472;
	Sun,  9 Feb 2025 03:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uC2+I+YW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B937F10E472
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:37 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54504f29000so901020e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071296; x=1739676096; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l8PD0IqrAGE2oYpbwGvaPQf/cJok7PeI2X9zpMbZbMA=;
 b=uC2+I+YWLHwxyGW4t3KaMf1pDRP+z+Dq4YN+0vSIQVfQZJeiswFyAYuagRBrt6UP+P
 HxVq7HpT2Nq2mnGIJuOZ3f9lZh5w29LaiaRD0WYD43MPSOnhcmAU7knvdyE8jnnSrtQ/
 3KPhcii6ZuOoSKvctehUdH0/Tp9AIk3LFNbB5CIegdRyCTqYRM/rJ/4SSUUqnPbHWxDx
 v89RyupLihBWsmH8Ab+T0bA+RpaHGE/w3QeQqtgcXUMX+cRw2cU9lGyrE16jyBbHaQhI
 qC1LUfky4DzdzBqmlQiLudMkC91rlhsWcC2Nr6Vpn01t9VSxlq0LSrGrvuFehsVh70po
 L7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071296; x=1739676096;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8PD0IqrAGE2oYpbwGvaPQf/cJok7PeI2X9zpMbZbMA=;
 b=utFaIo06H1NZJQ1fLG019wO4pvhe7HuWfrG6uUcGlRHmRquVQ7eO0DzZ5ycuxUs2OX
 ZT4iYp1dZQiHOTVcEOkzNsEUOqsfrTthPUoW5ugJVxZgpSHQl+gPv+Su5NQogemBpRy8
 7qIgXlHJDiL5r7PpCDbtLWnk2H516VFWd/p/H0O5qDK2s/AwzpXeGby16JLv2BpTbYQc
 JmTiQNFzrulsZTNV/7CREB/zVg3c5OO6553H8AP5UVqyvJIXsTlNM4kHSfb1qfUd19W7
 XqSYQH0HLhIK5TuD0ykp06mPhFyIAYitZQ8JZ375wa603de1GqGiesqSR2nlHtWpD0NN
 /hpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgqZoZW1wdfFqhmp2bjx4Qxwet9NwzutBtVUHTehxGXLi5NQ6hUvoEJW3nTcWPk4R800uURm4z5rc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcCi7exsrRv9dlboT1KBcXXUwsRYuXs6DVBAeskC06Nso0tzl5
 3KoShlRhwrSuatSZkJErwY11om4NVoofI8YTSlomjVk3Q6uFAUkQguOZ0YgkhM0=
X-Gm-Gg: ASbGncvLl9sHesmCLVxBqyfRSPq6tFuCQCgcDINUApUvoqJOJGXmCAE9FSJu8llYwnC
 JlyEWQs3PMtlSN7C4ExQPayktPkM3azAhGJSxHYfjH+loN0QQV+kpgDgve9CjrNep4vFhknX4Mz
 ZcJhUhwevM8WvhAuyFiTsJY+zwcc6uDqSgQxrH2pgjlxmsykOrga0VctV6sFkGzqhnyFo/nj6q4
 GN9NC4CfNRCwcQRoDU+5GIPbEVm9/fJOaa1PU+2B0b37nzpL/1lknYYeK/LcKvrGTltOt8EnPXc
 TPvYv24YOoEISRbkDFr2gyo=
X-Google-Smtp-Source: AGHT+IFaywdtzcVxRpRasataZ5TzvhFAkmqRc+3xEcB2W31nSu5sSrJNfgtxxqaJuGVD/E/Q+1m4ow==
X-Received: by 2002:a05:6512:3052:b0:544:f93:6902 with SMTP id
 2adb3069b0e04-54414a9d22bmr3196055e87.22.1739071296027; 
 Sat, 08 Feb 2025 19:21:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:15 +0200
Subject: [PATCH v5 5/8] drm/msm/dpu: also use KBps for bw_ctl output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-5-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lJN1ZWQbA0MEI3JAi+kHjKIQi/CZ9+YkFP59ireKkPs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8xogycCD/CtLU5spQjunXyA2yQ228CTHlDh
 9fHZ7ZOPxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMQAKCRCLPIo+Aiko
 1QxfB/0edAg30o+RX8k53oWUGA7So0JNIGqiaOvFrKH3V4FKGNAb44E9W6t2RrnxRzsp4OIVQ1c
 VFkOH3/zQfLpaxlogiPh4CQptNkc+qe03nJj8/XhaRqVHLZL+gaykXWjSelVoVBGebF25gJJWf4
 mYVMuK7pGwHQ54T14CBozrhewL8Z0lSYhfDoFMwHeHiRMJPD4pLMTdy/yhn12fyd44N8wcMUV1b
 PUpA4OjMEs3ZOYFq8GQvsCyOSNAAa6+V4GO8BFAmZAIHVgFLxBa22ON/U7T8uwIOUPEmg9N5aQo
 65VEsbMCS2nHkfdz7UZqmUp+HeuNbwuo16nkKCSkmVY7oLjJ
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

Change debugfs and log entries to use KBps / u32 for bw_ctl and similar
data.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7cabc8f26908cfd2dbbffebd7c70fc37d9159733..b93f7556f187d46b325a689ad01ec177cecbc37a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -135,9 +135,10 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 	}
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
 			crtc->base.id, perf->core_clk_rate,
-			perf->max_per_pipe_ib, perf->bw_ctl);
+			perf->max_per_pipe_ib,
+			(u32)DIV_ROUND_UP_ULL(perf->bw_ctl, 1000));
 }
 
 static void dpu_core_perf_aggregate(struct drm_device *ddev,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8a523eb308630943871c2e075d3d0d9094606d05..ac3c6c5ad1cec3856f0eff2ed71153d3c2dc279e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1486,7 +1486,8 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "intf_mode: %d\n", dpu_crtc_get_intf_mode(crtc));
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
-	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
+	seq_printf(s, "bw_ctl: %uk\n",
+		   (u32)DIV_ROUND_UP_ULL(dpu_crtc->cur_perf.bw_ctl, 1000));
 	seq_printf(s, "max_per_pipe_ib: %u\n",
 				dpu_crtc->cur_perf.max_per_pipe_ib);
 

-- 
2.39.5

