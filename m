Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7AC6D1184
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D037A10F08E;
	Thu, 30 Mar 2023 21:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F59010F050
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:14 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c9so15965156lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQg9gpgrgVlfYanPGfaFL5CdShLYRg1QG1Vs9Bge6BQ=;
 b=buVeILSRsPRyJmyFUcd/k7r5bad61fwfiTTztaWYs9KYSWGPXYLmUR1TpD/W6WgqKQ
 p5mVJx135gTwH5ttAyZv/SDFHdIUo+0b0j3+svD2tVZkGdn9XwKiI8OUL9C6MIz+pCa7
 LobilbzS+VoSO+JF3/RTrG4J50rEzjoFV7o2Ug5+ZJhmRrGmin44vGty5qtugRNApNBL
 f7JCvadQxLffmzyvsoc9BU9iCJ3MZnJ+2+aPXukp31FhnwQLDPqp9v3rQs054rBvG+C6
 /XFzH2UQbSbnclx5uATZtqdY1ifkRFHsPnO5JMv2Ul21zCzJwtJgbM9K8ZdcBsdMICuY
 YRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UQg9gpgrgVlfYanPGfaFL5CdShLYRg1QG1Vs9Bge6BQ=;
 b=d3Z5bV+CdT2+mZbWcBosPwzeJIv3QI0Otj3xEQdnWobnnNxnXL/h+yfUR0+RGWir2P
 /DGPn0dYlFWE9y0UjFNrv7kJZNeKtkDKwxwElWojIBXkMZWrFYvkYI7IxaXOSrfxB8vV
 EenHlEy6FYoHZF+Sg42EwqAIHHSWNbIA3gNEKbZGI5K+3CY8pcQV1KdZBuzJn5a2hIvM
 OA8/L92+4qAr7+1r4HF8z9zFtt5/tOqNof+z+UUhtjeQ0UvyAdyAKcuThwWuHU1I6aK/
 L3+534le37xHCqMh9qJ1O9PIp2N464yrJu6yJpt7neIDpRaE9ZRAt2qp34Bt5wJjbVfq
 FlZg==
X-Gm-Message-State: AAQBX9d5q/h5OR+4uGoBzjL3tLY9i2IX/GwidCyTNKqxnM9+xDlMZAa1
 N7HX8waM9vY2TvEi7tImCxUC7QBZGSFEMSqay5Q=
X-Google-Smtp-Source: AKy350YfnMlZQYphWeK+HJeNSvZZY9bLbPg3wSTRKq34/0Ihq0HD8jNRBjkv+sxiGoHCcqJe6lXWZw==
X-Received: by 2002:ac2:5e83:0:b0:4ea:f6f2:7a7f with SMTP id
 b3-20020ac25e83000000b004eaf6f27a7fmr7154807lfq.34.1680213252906; 
 Thu, 30 Mar 2023 14:54:12 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 23/38] drm/msm/dpu: use defined symbol for sc8280xp's
 maxwidth
Date: Fri, 31 Mar 2023 00:53:09 +0300
Message-Id: <20230330215324.1853304-24-dmitry.baryshkov@linaro.org>
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

Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
the value.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 8a2991c48af8..01ef4115ee4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,7 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = 2560,
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
-- 
2.39.2

