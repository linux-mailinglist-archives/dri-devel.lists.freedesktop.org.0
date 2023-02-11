Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4B4692D19
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B30D10EE6C;
	Sat, 11 Feb 2023 02:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9192F10EDAF
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:18 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id m2so20175717ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVEAHbit9HVr0SMJIWM3WcLEnURTHDRR5IlFfdrX698=;
 b=v4FWAlrhZ8qY1vmvSs15iWsn3X79USyE6x69pYDEipOlJUWglhd1TJOO/rLzoKXomx
 UTXQpNmlSvYDreaCBaMBijtg2V95d6TDJRW2gdpuL/aavhD4loD2K5LEpx9gu2b1k7yh
 xxfDOkGZm3H8qaK0q+F9JDZkOO7rzxX7Sj+QA7cYvZJxrL6iv7Fw869hMzCAv2HFNROz
 7YPwwfCUaI2pDIHN1rpV0MgtAxTAz6SJQ1DlrBNrN+IAjCBsbmeU4OgcIjDDxyRNdFbv
 gSMrqJi7byd5EL16eG6llxDrmIZR4Ohg8teuZsQOBIenQDe4oeQfv4xNYKSujen1MRYG
 /qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jVEAHbit9HVr0SMJIWM3WcLEnURTHDRR5IlFfdrX698=;
 b=geldJ25yMeYAUZyuU2qzZCfUWQMmDNEyd5/tJ3Y+67qRtkIGqDOFBHIVR/lsb+1NMs
 LcioFoOwtmKCaXxkkLmPo3Rr/aUUpRX5hYz3ek32UcUOTSiS6pMaf2VKPnSx7az65PEg
 6WalesGoXyJryoTd/N+HdBM2hpVvdifcBB+dw1Rum64tkzBllFWPa253J+Qe2yCm5XJ4
 fFIn9jS3MisclikQjWN7hQS3JBTImFOA1Lqs4kdtyOuvy4VrsUYl4F2JZRJ82H+I4Vrr
 boNMXQ9RWkmq4GRq1INEqDXiTe46N6/apF3y5jk58P5yMYjkAtah+opMLX1CJ/BYv+dR
 TiNw==
X-Gm-Message-State: AO0yUKU6zGX/Rlpu17XYUz2jxZLsBS0Y3hslsPKAopkiuBpBCXAvlGQy
 Ql2iBkkf4tmFOpt8lkQOXbmefg==
X-Google-Smtp-Source: AK7set/WG7ZMKG+x4O5+wEtXgz5P8czBMuU7wVJR7oGnPy/CnrHtfVyDusTKpW3KBC6HJG9zrUXffg==
X-Received: by 2002:a17:906:fd8e:b0:8aa:f74:3252 with SMTP id
 xa14-20020a170906fd8e00b008aa0f743252mr22089269ejb.2.1676081478181; 
 Fri, 10 Feb 2023 18:11:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 22/43] drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
Date: Sat, 11 Feb 2023 04:10:32 +0200
Message-Id: <20230211021053.1078648-23-dmitry.baryshkov@linaro.org>
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

Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
the value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9e2724ff6b65..56c9a38790bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,7 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = 2560,
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-- 
2.39.1

