Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8076692D29
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E5810EE7A;
	Sat, 11 Feb 2023 02:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52B710EE62
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:21 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id c26so15413857ejz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tC8smASMYq63xSpQbKtrSp+tdzlAe8iUGu+97bMfkfk=;
 b=N6NQiLcX29/R4SzvnAJ27syJ22wy2ddvxeta24GTTte31zSP/GL/IMpHleStWPWT78
 aSnTeVUx0H7hiLWmeI7OmhP/ecsduWr41IaC9I3aQDOMRc7syZl3BrigFnNHrv5/qwI/
 YPNUW5ofrVZqYfHjNhOTT9HHPd3Kbd5B8EqLTHwdBwGPhFw+ZEsBeie/DlKaUM1aftmT
 i1pusciXS7RNLhdkd7ywf5tH12cjU4GWoAPQg5eRi1KuvRVCLjVhJOl+Ucr+I2YKmhiZ
 bvRbrM5qIKsUr9Fn/foqXlPqCeiB54avo+PaFiZ6391spYa+BnMVTim/45xxzkjOcbD6
 y/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tC8smASMYq63xSpQbKtrSp+tdzlAe8iUGu+97bMfkfk=;
 b=BRV+BSytREEvJnvDaRBaC6L6DX7N/lzMLgZHuj2V8vNKyZIG/E8IuYxZWcKR0uqL9R
 AGkHSZBtn6/B0s0anV5XEa7uKQpljC/UH6c4l5hQ1BmyxE+A6K+VJmqAl7rc/4wDz9qA
 IQzjd/Lf8gqGf5u9NQx4XxW9qoy4EjcFJGjN6611nc86EQ3xHvm+5mcJtWWsPZP+qTaw
 zVsGO58DHrhKPE67hiFBOWdS6LpHWqJCRlOUHFfvDdQzkRGJA4PaR1Sm0mv9zJLgOUvB
 7vgxzgb1EleGJz/B67NeQK/iPn9MksWs+9qDqjP0jF1m7UveeSS+SEwcxXKLUFr2QKTR
 VIRw==
X-Gm-Message-State: AO0yUKWFlLjz4prk8GfhhoxAVUIDp+Hx4Sf9v/OALLGC7V0kOxfW9dZb
 G1wQOgOhD6OXIvzWisAdvkobOw==
X-Google-Smtp-Source: AK7set8n2sVpsBzcvgTanvr6FdAaLyJCVdqNc9WJgor1dNZQSyLtWUYfIQIgWlXBaYr20TR9uROPEw==
X-Received: by 2002:a17:907:6e17:b0:8af:2af5:1191 with SMTP id
 sd23-20020a1709076e1700b008af2af51191mr11684529ejc.18.1676081481418; 
 Fri, 10 Feb 2023 18:11:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 25/43] drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
Date: Sat, 11 Feb 2023 04:10:35 +0200
Message-Id: <20230211021053.1078648-26-dmitry.baryshkov@linaro.org>
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

Fix typo if the name of the sblk structure for the sm8550's dma_sblk_5.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f8495cd723e9..2103ccfc22f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -103,7 +103,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, DMA_CURSOR_SDM845_MASK,
 		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
 	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, DMA_CURSOR_SDM845_MASK,
-		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
+		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
 static const struct dpu_lm_cfg sm8550_lm[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b979d06f8180..ff507acc6ff6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -432,7 +432,7 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
-static const struct dpu_sspp_sub_blks sd8550_dma_sblk_5 = _DMA_SBLK("13", 6);
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
 				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
-- 
2.39.1

