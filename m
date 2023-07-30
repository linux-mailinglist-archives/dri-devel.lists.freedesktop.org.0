Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB07682E0
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 02:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD15610E235;
	Sun, 30 Jul 2023 00:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4108010E240
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:27 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9b6e943ebso52853661fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677325; x=1691282125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ft+lcYPkOD2X5Cy6eIa14FthuLC+uz/Nzwlggwr4hDE=;
 b=eenDRTCNw9tcFwjxwb0nO3oaZl3JXWAXLTSSAP0a0pejWlcUfPTDIDtmPv1x796Q97
 j/ANf+82FD8Byb/FlsRI9jVig3G0QysbBgz9HqRJb4FtB/iKBb2vF4+z9pJs4ay7owJo
 xSAtp/MSWfZHNW+RAY1xioTbjDFjEZmiStJinXaWbTtqKlMfsC8k08wXKVYdDWsZnbcO
 MUpnsjVDSCQvV88N/xZeTZiUKVjbHKG+tW3PEWHlTktlSFalCcUuXt9pVERb5q7bjdAU
 owoOJ5BQy72ZoYGBSXfOpWekK86TtBR9393TrhNkWznElXQRLZX/jAx6cHNgRKDO04ud
 LrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677325; x=1691282125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ft+lcYPkOD2X5Cy6eIa14FthuLC+uz/Nzwlggwr4hDE=;
 b=Nlv6sA61zqzRd+Fg4ph/9Naob3HmWy0fVmnMVpJmIWuOU2hV9Ni3sol/OYMCz3tLCI
 Hrh2iX5a1/gkRpp+wMCLl+5RVWWeCIXF0EpewXiLri223UDdt7JZhEg5PgA7jXX7Sccw
 ZDKRdS/FCl4QUIaZV3FnTkKpoJBPK+qEAV5A4HNlrLOgDMYg4lJ8VYhEgIOV8e/HBX/z
 3m+nAI7DVXgw71POCZKFkQ+qlE/awJ2Q2Cl7wjLTjlDdEdqchqDvAK1jFQmfJPUrFT1D
 TNorFDax+RPWEZtPnnSO8c8FE0tIUgdj+lW/emlQxYBRIQ49N0ha8IWcdmVlNZal5Lag
 ApNQ==
X-Gm-Message-State: ABy/qLZTO4dKc8pF97P8pBsIj9FJ9KB1aR1JwNY9k65VJ/uut0zj7m+a
 wzaXW/ZmgAs6NAsCZl6Z/4v9okYEIDiVXRHphsc=
X-Google-Smtp-Source: APBJJlEYfgh+CNI4jN67nxwSyQTAdHekeCgdRvKPdgT3atYqVpm7UWXcS2p7/pBLpXjKZbYt1DfE6g==
X-Received: by 2002:a05:6512:1112:b0:4fd:d254:edc6 with SMTP id
 l18-20020a056512111200b004fdd254edc6mr3258073lfg.26.1690677325620; 
 Sat, 29 Jul 2023 17:35:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 6/8] drm/msm/dpu: drop DPU_INTF_TE feature flag
Date: Sun, 30 Jul 2023 03:35:16 +0300
Message-Id: <20230730003518.349197-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the only user of the DPU_INTF_TE feature flag with the direct
DPU version comparison.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 9589fe719452..d1f309f45fa1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -776,8 +776,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
-	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
-					 &phys_enc->hw_intf->cap->features);
+	/* DPU before 5.0 use PINGPONG for TE handling */
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
+		phys_enc->has_intf_te = true;
 
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c19dc70d4456..17426f0f981e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -100,7 +100,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index a6f8eee58b92..69c9099cf5a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -175,7 +175,6 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_TE                     INTF block has TE configuration support
  * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
  *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
@@ -183,7 +182,6 @@ enum {
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_TE,
 	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
-- 
2.39.2

