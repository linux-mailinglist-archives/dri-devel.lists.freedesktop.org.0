Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9493D4BB6
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 06:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B5F73802;
	Sun, 25 Jul 2021 04:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C218737FE
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 04:26:30 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 i39-20020a9d17270000b02904cf73f54f4bso4593716ota.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 21:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
 b=T4ZvBinIYvzQj0wWKnaURygYFC2E8hXmRZ1ZtD4KlsPvtaZ0cFoZfK0iRpA8KWTzLF
 CIbCxifoBvbYOZVB97EkjwgnLgzyC+SwnJKlzG0JDrqag/Ri8ZAO1YgIe0MInyV0rBBQ
 AgO5NCpTP1bTaBjQUienFQi8F9Tdqt9Zqoup4M7jy/4tNtdQ4x6dZw2ZGjcmVGdm2gzU
 ZAEx8G3ft3CUzTeoUHLzsJZEcqxrcD2Fa5M4Ia8Pz2QS8D3I1Bwm3U6M1t/TrbtLEMZ9
 2V2i+KpfabqUX5eh9vinXE8LjV//GvsaLvmISWVyFnpalEri1aC4/JXOD5nAVQQRr3Q8
 JqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lr0HLKbGMfhvgQzbBYGum6ThIOLWrTxgc/XRrqS7TI=;
 b=jF1kVad5/v7t+Hx1vNsLscvE6BtMo38mROl1v0nA8XqxCw/IPpYKXYg3I3JdigCNpi
 AO0sC1yU8ES4jgFkRQMwDfRJ9xpOcHdm663RLgnV6bCoAscfheCblpomW2DXTNL3AU5U
 kVliC2fu8vWDBOYvv1DujpH3Aaei26qsgKfdC02mKMbliT9HhLsMtYRfKyjjUmdiLT35
 3Ljw+nmNINJdjAz7aKrtunJ39WMtrKRFsIwxIKzCAUaiuoZdMuUAkvdx3h2pTLDYqGof
 3nxdQ3TJGrFADY69CPcaSa9u+LweBcCl63GTZcmFQG3XV/TCLlVVbKp3578JsqSYlNkQ
 b7GA==
X-Gm-Message-State: AOAM530V6RXw+HHlnV0CsjAJW8aWMiWBBD1qCGW5uSyaKTrpLxK1ji85
 Xm/fCBUa1dVRBs41Heu7qdQBPg==
X-Google-Smtp-Source: ABdhPJwzlSIVW2aW5cAHty03J7MuoqU0oXzGi7uz1brYzycm4HpPSCcTzEv7utPTS/ArSjZlgLegPw==
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr8032327otb.281.1627187189689; 
 Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH 5/5] drm/msm/dp: Add sc8180x DP controllers
Date: Sat, 24 Jul 2021 21:24:36 -0700
Message-Id: <20210725042436.3967173-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Link: https://lore.kernel.org/linux-arm-msm/20210511042043.592802-5-bjorn.andersson@linaro.org/
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 92b7646a1bb7..c26805cfcdd1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -129,8 +129,20 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_dp = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0 },
+	.num_dp = 3,
+};
+
+static const struct msm_dp_config sc8180x_edp_cfg = {
+	.io_start = { 0, 0, 0xae9a000 },
+	.num_dp = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg },
 	{}
 };
 
-- 
2.29.2

