Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 744936934C6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F47310E3C9;
	Sat, 11 Feb 2023 23:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A57F10E3B7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:06 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id rp23so23927220ejb.7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qpRHeykuYnGtrJrQTjeyDukXXpYgYvcamyG7oYZbhNc=;
 b=mzLtcLtqPWVRH1+dG2SBh5AQuzDqXtfKVj95OSok/4qEFGsnNrrB0U5s3BIgTsBDqc
 I7Q2xs5zbW5RCPIB0x4qzDNGYSZ6VhNuEDjPN/Q6t7FwZKMRra9rA67fLX24mBPEgpOi
 RJMkTXkyKqeAFwxkQoJIYDZuUXO6fGPcSe6lZvaszv0yuaHPdYOq4dFhCPutZXurYhZD
 P4+mj/vUM2hgK7Tb9aiUB050dQCon2XEhfJ/1itD/NbV9nMSBE3ycJXCz3E5DPZoYlob
 AKof5hXEnsic8WwvFEzNF9oMqN19mRmSPnVGLLv26UVNlyJLdxAcrWiUd7DiQw9Ud/dN
 S1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qpRHeykuYnGtrJrQTjeyDukXXpYgYvcamyG7oYZbhNc=;
 b=I0xQodp3iZPqi6Zq33ZjP+LASE7t7Ee8Q5gdr4tnMkz7Fuf+VWCIZ68WWUD0Gvq4QA
 iiQ379w6qrFT005h9v4OvlanbAhoWSoX1ARGPwzjcssi9hhqoYYQF6LwWNzW+oqaSR+t
 L7o3uDUSLg6sjuuXwP+/zbSZtMSCIWzeZQX7TVSYSiA3/f41fYA9YOiLvWOBV+ojsZDN
 3793t7pkBFQwSSZnZrMyymLj4yyh6WeLduvoJLrmZn4Ofl8qwC7E2WohU2Kz5FQdVzzL
 y7w2OcRbyy5i2QmOzNgF8GCcX6v1YXJpE3heJIDSqjyg7j3DVIUleC5UuffuECtcqI/o
 uUMg==
X-Gm-Message-State: AO0yUKVyHDOHWKmWT1EsAsV2P5qJ+n5EIyuzAjWxjxYe6FpImi9svmpt
 X0k9kf10q5wukQotxLyzrnx2kQ==
X-Google-Smtp-Source: AK7set8kNrKur4FNkMftn3tZK5DxOpYVgBQMHUSuhq88BZQ5h65lNJhmhq7RcP4W72AZl0L2E3M9VA==
X-Received: by 2002:a17:906:fb98:b0:870:3c70:8c8d with SMTP id
 lr24-20020a170906fb9800b008703c708c8dmr18590015ejb.17.1676157185648; 
 Sat, 11 Feb 2023 15:13:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 03/50] drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
Date: Sun, 12 Feb 2023 01:12:12 +0200
Message-Id: <20230211231259.1308718-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

Fix typo if the name of the sblk structure for the sm8550's dma_sblk_5.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index eea026cf3ac2..e8b12788dc94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1309,7 +1309,7 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
-static const struct dpu_sspp_sub_blks sd8550_dma_sblk_5 = _DMA_SBLK("13", 6);
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
 static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
@@ -1331,7 +1331,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
 		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
 	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
-		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
-- 
2.39.1

