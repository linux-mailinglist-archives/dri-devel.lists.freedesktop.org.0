Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01961F0E8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 11:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611AC10E2CE;
	Mon,  7 Nov 2022 10:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2C110E2C9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 10:37:52 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id d3so15553207ljl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 02:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rZ789OFHN1lvkUIK4iYOi8r4E8Mj/5sPrWBtspHEEYc=;
 b=SUU5GZV7PxILUP+Mvtd2gP7xXAx6ujr9uOXhF0uRH18a/r9aUS17lPy8XCXLXzrYcn
 OpaiT/FZHxf4x/y8yR3DErFyw+neNuH72Y+DTt0CT0WLPTq/WJklySeLcUEg7gx5IRpe
 8y5BdR8D11K9jR2//LWrt7NHSkCT/LzI/hP+MN2nus/SNmy2YIzVgorK4g6UOwA17l8W
 fRFqDujR2f+GmM7agUH4AJZD8QmrM8R7W149HIysl4HkUNvOnnRo6jICyGkwd5L5ulrb
 j9lypNP+Fgjlb8+EMOa4YIPdPQ59nmfxuuMuIqNnwW9CuZiaOOEFUMWq2q17nX+ckBlC
 mAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZ789OFHN1lvkUIK4iYOi8r4E8Mj/5sPrWBtspHEEYc=;
 b=srYeJE7kAh/GOS0U4l9+dDsGv/ZDyLMHmYUmFRSB3f+ojWnRkDDIE/z2jUdx2b8afR
 dLxOHA6ivYBUx9TK4WPNKhSRdEDdI/Gr8Udzrw0RAuNkALQW8BmwOxSk86eWSYcT/2OG
 lsV2Msk4czxCEjuLXhG6tEkdSR2M9auL5MuBWIfyVjr74vFAksaP21xpCQuR5V+rQmQz
 QKDnun0q60Ngqr7Y7DX9yN+aWe05LeSl8qArA43GgANTduzPUolZ1foyR8mmYtgxOHVn
 aaUttH768UIjMA465uGYvhKbgyHwOnqpyr6rzm5aqo8j3WE/wZnc4ka1x7pc9znhthL4
 8QPA==
X-Gm-Message-State: ACrzQf1eDBh1kYjVe8MshRe9uXCrmVepsmUh3kkOS/oLe626TMemy2s1
 62+EoQhVz14IwLIE6ImWi41ZYg==
X-Google-Smtp-Source: AMsMyM4YYYeo3vxWbYCQB8vu+0ohY5wwmclDKz+L3YLGxETCqfM+qAO9cHNmUNcZAtCYoM5dtUPOkg==
X-Received: by 2002:a2e:9ca:0:b0:276:ac05:b821 with SMTP id
 193-20020a2e09ca000000b00276ac05b821mr5561542ljj.84.1667817470535; 
 Mon, 07 Nov 2022 02:37:50 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a056512200e00b004979ec19387sm1162599lfb.305.2022.11.07.02.37.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 02:37:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH] drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ mask
Date: Mon,  7 Nov 2022 11:37:36 +0100
Message-Id: <20221107103739.8993-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Loic Poulain <loic.poulain@linaro.org>, patches@linaro.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@somainline.org>

SDM845 only has INTF0-3 and has no business caring about the INTF4 irq.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 27f029fdc682..06897a497eb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -86,7 +86,6 @@
 			 BIT(MDP_INTF1_INTR) | \
 			 BIT(MDP_INTF2_INTR) | \
 			 BIT(MDP_INTF3_INTR) | \
-			 BIT(MDP_INTF4_INTR) | \
 			 BIT(MDP_AD4_0_INTR) | \
 			 BIT(MDP_AD4_1_INTR))
 
-- 
2.38.1

