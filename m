Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA796D6239
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521BD10E2D2;
	Tue,  4 Apr 2023 13:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486E010E303
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:24 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bx10so15434701ljb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3Fx3sk6Vn5lZzb/pUoNHIe5WMfmNRaGDKPmYFHhJvI=;
 b=GBCLKiFtcawE3NWz82ifekpZfkzi6SZJzphv4ONq67WMTNMc0Xs7+xCHUsy78IhbfV
 kfWpmu9OY52ApNyBeOTfvsOYePmk7TDsx41qsj0T0sa4k/64JxZhzi+Tc1oqtobMmoxX
 b0V4ptP5H/6r7SSEp6YzO9C16yRIBK2M5CUhQ+xFXhjq3lIY4sBmGw5gI1VZnb5zhkfY
 Y5pTmOkApc+LIFaSynPxyOZxjSre3ryWmnZSK2ZfVk3D9pGiFpw80CNUHzBQkkhtMUy2
 ApUMA9n5iFmpEmkNox7ahwcychsRi9kp9tALElZ3oP+hGWQ4txV5agorewOo5mqyNz2G
 U5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3Fx3sk6Vn5lZzb/pUoNHIe5WMfmNRaGDKPmYFHhJvI=;
 b=VI6NBG19T95zPK+sR+bOyEXsMAIzm9GkVbfpsnPBBhuFQ+PyzBxN0XHEOOlkf0F2b2
 kS5a4cxVUfJDy9EXPQju3OT5H54M82LKNUmosCuND1x4Bp/AJuGNuDiJE0N7HcwWu+gL
 rp0x6Jd+oo+y+zIRNY9HWBqnD56q+oLm04471Sv1ZLMTAeaGV0Bj1Rgvh3dQrnOaqukF
 tMQfZ7dB9kDHr8Q0dMUYVvLm15PoggrIwh4FkYSrvQ+Prc6BA4mVXBIww9/8KCZqDbzX
 YRGjcVTm4sMA96Hc+rqQUNfPYImavL1Woc2syxqb+jP+uHveoXWepwIgpIqZSbD2yevj
 f2rw==
X-Gm-Message-State: AAQBX9c+3qMtY5P/WySYN0/s/LTPaWcy38Coh+tYkttmH4lPZkMobu5/
 0BWn/3IlXb0iuaQ0k9jneER8pw==
X-Google-Smtp-Source: AKy350YymQmNmYx7ky4qkixUz5KwnKiqsiPqms3ZBxxlMT3nOM/mz6XPYUJkzXNXdJUH3d8I+z6Jlw==
X-Received: by 2002:a2e:b046:0:b0:298:b333:4267 with SMTP id
 d6-20020a2eb046000000b00298b3334267mr960471ljl.18.1680613763866; 
 Tue, 04 Apr 2023 06:09:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 29/42] drm/msm/dpu: use defined symbol for sc8280xp's
 maxwidth
Date: Tue,  4 Apr 2023 16:06:09 +0300
Message-Id: <20230404130622.509628-30-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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
index 39894cbf456d..d30b797e90e0 100644
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

