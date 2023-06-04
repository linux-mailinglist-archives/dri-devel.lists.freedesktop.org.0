Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F177219BB
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9DF10E0CD;
	Sun,  4 Jun 2023 20:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E925210E044
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:36 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so5076648e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910936; x=1688502936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HrSOemd05FoINZSG/bKVXkgtRW9ZPoVMcZ1xEFU5Tgo=;
 b=lhF+d6BUhx73tz72Tq4RhmNmP07HV54XfdOhfkXTyDlQ1zgFKrrTgWulFXAH/IwhCK
 kqnNtl0CzsOySVzeR8Ut3BGkS5Vf+n6ZRL9sHylQJ7fxnQj9bDVjk4ZOwx4R1BQyEFee
 WqMdhPa6w5CTjpY+oFV9J9yynLp8xl/3aytqKosbcTSk/aOvOfYnrzeSKJ33oo0yspBv
 cXpwpHpPE8gFtl964kJkk7BG/jhnb5vhxSVH/4Gq+JfOvyr3uiaLVLKGyxBIEpVwj2Ld
 /ChH58Etspnc8T72pDOwEZ3rURNYNsCQU3Yhqlyz/XzYFZUG47SXNwgUfV/6H8Dv6yTn
 rhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910936; x=1688502936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HrSOemd05FoINZSG/bKVXkgtRW9ZPoVMcZ1xEFU5Tgo=;
 b=YgWdnFKqy4gSNWbq1qcKXxgAbDFp994MzIB2Yg9JNpTZGQEJhH/XXv4/AKsyqT1WzF
 xi2bndsWYuJkgGxICrhROTFsdVQwmIop3bAq48rJ9tqCfBgR7ThnMraukwSoBlnc28DB
 nR+Xc1uTRHNcZ/Ab2gOS/RSRlnbaAboXf2FWnmugW61bHpAhXquI2F6/blDliW9HsuIt
 hwUWZjuhdxNmwUHzHNxfEGBhJI2uD9OU3UhYmhZNLRLdtYNLQziP4rgnXSHa4dF3CFve
 VpZ8MQKBWuRRMlwtiy3n8DqZjOJYg+caHK7qUdBebUjahHOQg12knggzqF+LKNNYlvmk
 1Qjg==
X-Gm-Message-State: AC+VfDxFw75AduUcLv3VUYdEBBCqwem2itPA8S76Pj4U4DnlpZOvB6ZX
 YYukufTiRR0WeXyEBC2x4B4+ZQ==
X-Google-Smtp-Source: ACHHUZ48uDmDSEcJbp+P7kju0MdcIk71jozZ9uskbWX9pOjjmQzk0+B6+9OzTQWxI1d7kyMUk6TiPg==
X-Received: by 2002:a05:6512:376f:b0:4f1:3eea:eaf9 with SMTP id
 z15-20020a056512376f00b004f13eeaeaf9mr3862098lft.24.1685910936496; 
 Sun, 04 Jun 2023 13:35:36 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 02/22] drm/msm/dpu: remove unused INTF_NONE interfaces
Date: Sun,  4 Jun 2023 23:35:12 +0300
Message-Id: <20230604203532.1094249-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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

sm6115 and qcm2290 do not have INTF_0. Drop corresponding interface
definitions.

Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Fixes: 5ce224840b9e ("drm/msm/dpu: expand sm6115 catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 99dfc6d4522d..ba115770d3b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -65,7 +65,6 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index aa0489898552..8363df17509e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -62,7 +62,6 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-- 
2.39.2

