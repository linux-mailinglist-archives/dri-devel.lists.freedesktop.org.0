Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E15D692CD1
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F267710E312;
	Sat, 11 Feb 2023 02:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBACF10E2D5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:10:58 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id m2so20174709ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yshUYPatWwyLRv6Ypl6xWjr9pik+/Tjx9/mnhNZ9UhQ=;
 b=lmTxjkX+fXOSQlmuNE8y6JE3FW+lr8tI9vXv48RcHjLSiBWeyu0sUc9I9+Rx93BFGb
 l2bcrkgX1zhdBaquz2cYL9rVoJDTg7TPGmvVGlMQ/ylUvYGotvcPGtgCqFCYTQYLa1D1
 uhJT2yHIXZiHMIaDFKutoDjR0UbI3uc9jP5w5f6GUHSdMW9tjokWpfQKSXZy2LH072GN
 zcpKoG1LR5yPbvHXYSpBvcxduXc4VORg326aN9aFAhgAxkLQsc3MuS1O2XI4nvjdexkz
 eVXL/+Sx8oUiy+HrIrTAbbfT/KX9wBC3YGXTbsWowiTino/R+slZTpvOeCMdS3YsMdg7
 ipPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yshUYPatWwyLRv6Ypl6xWjr9pik+/Tjx9/mnhNZ9UhQ=;
 b=mbjm0KO8/TpRdpwun6dfnoZIT4dGuts4THHVReH7RG5epTk6tF7xSB74BrbRmz7wRz
 0n5FtUz2IQKq51YhfCA2rE6+UZn6+JYiY1ej4408Vsx1c9U/jqe8wXi762mibFIIYMtG
 81j+V+bN2xfnZ9v7+Q5rMfaa2tIWU4pExO7IbDycYHyI6c7OP4xcBJXo7Aw4WwKhuDv6
 bqR8yqrmrrf4dRiO2s1LTuDFH+w16L++J7p287s5jQhvuik8T/g4qIkZltk7Ns7IoPB/
 +ZePIufQV/SfzwdS1NzVnDT+dcNrb1cHZSVtEFFTWTmij3X1o4Ap0fQNp0uWSh+oA6nT
 GA9Q==
X-Gm-Message-State: AO0yUKVu/729waKvKwGXvQkUh7atdBZGYhP2AxjxvCuAJty7Bqh9TQSV
 SIeKNKAfs502cv5xKNY+sxgWJQ==
X-Google-Smtp-Source: AK7set+8MnqxLz2kT+PdecZKpqRDXT9Yf3O8lKo/FoMTihB4zlc5w9wOVRVCamQL0cjpLwT4vQ15JQ==
X-Received: by 2002:a17:907:3e27:b0:86c:a3ed:1442 with SMTP id
 hp39-20020a1709073e2700b0086ca3ed1442mr22150842ejc.4.1676081457330; 
 Fri, 10 Feb 2023 18:10:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:10:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 02/43] drm/msm/dpu: mark remaining pp data as const
Date: Sat, 11 Feb 2023 04:10:12 +0200
Message-Id: <20230211021053.1078648-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

Fix several leftover _pp strutures and mark them as const, making all hw
catalog fit into the rodata section.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5c393a822ff1..ed6076dc2b43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1654,12 +1654,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
 };
 
-static struct dpu_pingpong_cfg sc7180_pp[] = {
+static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
 };
 
-static struct dpu_pingpong_cfg sc8280xp_pp[] = {
+static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -1723,7 +1723,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
-static struct dpu_pingpong_cfg qcm2290_pp[] = {
+static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-- 
2.39.1

