Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC26D1125
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1BB10F05E;
	Thu, 30 Mar 2023 21:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7092D10F051
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:53:29 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bi9so26352993lfb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZJWk/sms01Zh3ZBIBe2mmcsugNs8WbGB7AtvX58eRI=;
 b=F5knO7bj9cY/4llO0nO0kn3LAwwlaZmz9s532YaFxnTUHOdr+ga+VtTwGX0/bIIax+
 lkoqIaJBnmeFQ3BJD/xk991/8XcbnOdKENou3/06PGAZdrUwra/lyiBn3Lkmb1yirIkL
 e5cAQq+QNCWmmhikkuYaUhZ9hiNWTIhvV78T3pfBCHkPtYcwm50Ffd1vVnWlTRzVZVxy
 5jne5Bpf4h1mn/7TFSLOYLRf2JD0UmNow/Dquu+LFxr7f3YKOJhL7UZ/svccPPb55ZPU
 RG2xl7Jlb/aq8e45Icv8R+VF89TNT1xBikS042XhMLh7yRKmU2LKBOvJEIzTOtpB9/Fv
 fMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZJWk/sms01Zh3ZBIBe2mmcsugNs8WbGB7AtvX58eRI=;
 b=bXoMzfB2dX9dHaXKZ1jlLcWi1qac7Kx37AXPACnTf3j30KgPEd05kOJt32iKyQ7L5J
 kOpH2TvPbMZE3HBEIHi7jJnBZ6fwaXOGGh2qWd+kr1I6bWBdQgYIxDxlHSRssyG7EXa5
 QCwOQ3Cg3sUskDTxiSuDAlU4QU+3XSgM3iifwrd0FOwfYHVITWjxJCVgYUj9lr2e4FuK
 uIXoNAkcbLww3z4Pjh/m3dEILNT2oc2dVvXFtqJkpRlLakJ7w9B+DYk8s5Nn81Wt5Mcz
 dDT78DSIuoro+GPqH+2N13b2QhOG0Oat3zDC8MvlVvdL/9IKTm3UuvhO2OfoGfkd0aUt
 4ZkA==
X-Gm-Message-State: AAQBX9dHO9EYuc8VxPM4RQW6SIPgUXSa6+bnQL3zRVbyizWpWWktjrpP
 NcGwIsvEEJv00kcQvXWt7S/rHw==
X-Google-Smtp-Source: AKy350bDkBUh9ZGKLdSM7Z6eAaQyTFkqyZ/IPOIJdzCkrgbNawk1N1Jn7qH+35dyL+j2JKqxbxFOtw==
X-Received: by 2002:ac2:5096:0:b0:4a4:6af4:43b7 with SMTP id
 f22-20020ac25096000000b004a46af443b7mr6042896lfm.69.1680213207462; 
 Thu, 30 Mar 2023 14:53:27 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:53:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 03/38] drm/msm/dpu: mark remaining pp data as const
Date: Fri, 31 Mar 2023 00:52:49 +0300
Message-Id: <20230330215324.1853304-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix several leftover _pp strutures and mark them as const, making all hw
catalog fit into the rodata section.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index be9b9f8f143b..a3fd5dc5f368 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1660,12 +1660,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
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
@@ -1729,7 +1729,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
-static struct dpu_pingpong_cfg qcm2290_pp[] = {
+static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-- 
2.39.2

