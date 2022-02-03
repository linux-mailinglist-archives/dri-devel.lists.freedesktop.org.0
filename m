Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06904A8060
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA4010EC3B;
	Thu,  3 Feb 2022 08:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203E910EBE3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:26:18 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n8so4389984lfq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 00:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jvPULXIIzR0qzqGPTTUmR7uSAA4jIsRkWAFzhKA5wM=;
 b=tN0CX3/x7KyOve+6YH7O2t+7rzfSwiG1JieGaG3cot3ESYYaTQPzOiBTSJcddDGrGu
 6XXmb0J2mgAZP0KUWm0gmibjzp2sQtYdn56B5nzOVLlD0JawY9XHDp3+Tu1NVo7Qiwc7
 g1Yt/9LvRaXH6LVUABbpiVhwWy8CVDf8hfYw7RQXmFJrzEQOX9ODxgIEIonVvZJeiZwN
 jbDXGHwCeyW31ec1X/fr43svDoj4/UweZP4f9ot3pWxNyMAcEnc19LPxC7l3q8h6k926
 B20Zb1t4UzxgGFItkm5VtE5tDMvcAYTKHtR9KFrh8Q/Wsj8q3LyTLwXZ2hB7/YptARIK
 nDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jvPULXIIzR0qzqGPTTUmR7uSAA4jIsRkWAFzhKA5wM=;
 b=Wqk8k6AfIph81gkVM7d1hn17u/TZqGFzVtr/xCRjVQ9M1WCdXNwpOz68ncin+vvkmB
 rEG7hQs2GIzxGGiQyOpqItOMS6sZwhsCw4lpOwDCbb0ImpDwEqNt2WTcdO115a6mLrW6
 /OeWhAUk6AdYdAgbXHKI1g8ew2NyEG7xZQ8RKW2olVTf3Y1H6uWOXhZ0yeQDdUG/jIVY
 owNKrJu8g8KaIwwyC9JDtaZiiw+M3BRbBKAJ6WWNYgZHkyvymASlhwLmug9L2tvB/uS0
 /CpKuOnW3w7CVGrRNLaIJgnlZHYWO/dQ/hAndDQzi3jskSM1d4iRd+Ja+gvGPSD1i8Ei
 jRmA==
X-Gm-Message-State: AOAM532U/GNReCIYczqNMdDKi9/ZOiFzdbwOr64D8Y3bqWh0VOcW0LOp
 YDKO5Tqud1GAEAxI59trE6Darg==
X-Google-Smtp-Source: ABdhPJwuwmzDXKRStTl6JDYpRGB0zgxUC0uB1/DK/DFZh/CLhIJD8ZlQjWrCzxvWGGVl3nx+hjosVA==
X-Received: by 2002:a05:6512:1292:: with SMTP id
 u18mr25527911lfs.360.1643876776338; 
 Thu, 03 Feb 2022 00:26:16 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 00:26:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 4/7] drm/msm/dpu: drop bus_scaling_client field
Date: Thu,  3 Feb 2022 11:26:08 +0300
Message-Id: <20220203082611.2654810-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We do not use MSM bus client, so drop bus_scaling_client field from
dpu_encoder_virt.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6c1a19ffae38..4530549850f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -127,7 +127,6 @@ enum dpu_enc_rc_states {
  *	Virtual encoder registers itself with the DRM Framework as the encoder.
  * @base:		drm_encoder base class for registration with DRM
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
- * @bus_scaling_client:	Client handle to the bus scaling interface
  * @enabled:		True if the encoder is active, protected by enc_lock
  * @num_phys_encs:	Actual number of physical encoders contained.
  * @phys_encs:		Container of physical encoders managed.
@@ -172,7 +171,6 @@ enum dpu_enc_rc_states {
 struct dpu_encoder_virt {
 	struct drm_encoder base;
 	spinlock_t enc_spinlock;
-	uint32_t bus_scaling_client;
 
 	bool enabled;
 
-- 
2.34.1

