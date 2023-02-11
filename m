Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7867569351D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3BD10E400;
	Sat, 11 Feb 2023 23:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2498910E3FF
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:45 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id lu11so23983675ejb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S6N2qRhHnS9cpZnFGuXYwEG4dF/wTRdTqt3cHSvTaPw=;
 b=m8mlB0qsku1rVsZsq3V6dRPYpOrUMeYmnNL64QjhtLvNZor6AxljuXU7vx/qEohpjb
 DF6cymXhMl+EatpXj0ck9EXnxCHymkgYdISM0diSx3ViUHnlv/R1AdMdJQbbOXD4IS5Y
 krHy1R/8+VmQzCubRMlCMnhhAhJDIZNq83V2WaoNrinPoDio99CkRDSZP1Hoap15b9ql
 8dpLSjdBnC+/GW3Ng4LL9U5WWk8TQv/Wr3P6cDS0Ou0dUkv5vLY8iI77AoIVOjCOybqX
 8aAPjXvamCAb/pW2Nk/bRSXJr8uwSBazo79HG1c9T3acx2ZoNKiPPT5JLmoRwxaM3Omt
 JJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6N2qRhHnS9cpZnFGuXYwEG4dF/wTRdTqt3cHSvTaPw=;
 b=gb2GokZdUrAE2OeWNFMVopBtqyiQeTVmNXYlUyYp2KSFJhmyO0zJMTQXeqKElCWLnx
 e8BS/LftFepifHB8sVZUmUjyd8K9gKEeWfJscDzklYwPvMdnUOSfslsyyzNE6ceG8bYP
 kX4KUVymJQSocOBGWJY5xXGTxO+wxR7wHRmoKiLhmOY+nGW/p91dTb9RI0vIKNW9mmr1
 Fob9Lp636etPyRqyhNd4P2TpzuOHBlrcsXcXpIsmwMGwds1MIL3NiwXZ7zut1jAQ2c/e
 PAQRE+GBcs/GEiO5zxe4+nbYPrm4rrjny6wTUoFT/teVIll/P2u7LIVvTYEIKSfG7MEC
 rgqg==
X-Gm-Message-State: AO0yUKUyKTZ2tfgJZEyPqxvgQAb9vj81ZmH61K2RIF6VpeqPrI71qNc5
 2JN3QL9ZzjakOo8cOvJFCcLahw==
X-Google-Smtp-Source: AK7set8XlkAJ8+3hpgFpWzrr8jeG/7tgp0IViewZISWaygfCQr9dvdqmDROW1k3wQX0dxApxySvm3g==
X-Received: by 2002:a17:907:80e:b0:8af:447a:ff8e with SMTP id
 wv14-20020a170907080e00b008af447aff8emr10227312ejb.20.1676157223732; 
 Sat, 11 Feb 2023 15:13:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 36/50] drm/msm/dpu: use defined symbol for sc8280xp's
 maxwidth
Date: Sun, 12 Feb 2023 01:12:45 +0200
Message-Id: <20230211231259.1308718-37-dmitry.baryshkov@linaro.org>
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

Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
the value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0a5d6d9fe751..a3a79d908451 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,7 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = 2560,
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-- 
2.39.1

