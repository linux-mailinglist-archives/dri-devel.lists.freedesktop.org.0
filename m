Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DEE692D42
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2562D10EE96;
	Sat, 11 Feb 2023 02:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CE210EE87
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:40 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lu11so20241826ejb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXrZAAMcbS02VPRHpSg/5kqN0f51nQe0BfxjseY+MyU=;
 b=xOPVhIK4At5K2KcDfwmPHUW+vbHPihQk6RZhUjO/6rX5wKORB+EnoDrNyLoWnuCIwx
 loDlYZe+E50vDrbCDgYKEdTwXtFUBUS1K/Q+8lMVJbga/k329eb0Joyg3na3RgDyoOsF
 N6paWNmxD+EeLv2lRFMFEzBImwaUbohsNL5j+8sbu7x3fk+6BrIgYJQbgZCp5+62WfWM
 z1ugm2PKfzU0e/1LNCf+Gjtte/5ijYeTT75XwNW7CeRtTrN5GPOy2rXuXvHkIB81yk0v
 ydsJZle+9CzdAKN0qZDR0usswYk7d1WgZdiqGwz45SbotZoJ6G+QEE36V26HM+FqsSuD
 fxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXrZAAMcbS02VPRHpSg/5kqN0f51nQe0BfxjseY+MyU=;
 b=aGYU/da32lXDJJXSXBoDOkwNjiKbG4Kx5G4W429sMjyv6wPIMGf/sTy4w/NnRtZWBC
 5lB/paH+ZJyTc7keMFb9Yh8Av1xAdiXP7fDrVc5oF2aQss3VNTosPQgYfj13LkihgXGK
 MbyThuFvyk5DOpGBuzCQWiL64cG4IwthU2VI7FWsYhPSWnaj4XGrnYNe9KMtRmXo3XeO
 fcDZH8R5nFt/1eegWQq3qlcnccuu4FjK/hOTWiSNSVDLbz4yDv9D4gwlpngzhXnzGQnI
 kvYMlJqO8OdfNxAlV7SrBehA8T2Z7E5FHrPQ0JPPYr5maK70zq4OzDr7jRmKwkEaLEO0
 01mA==
X-Gm-Message-State: AO0yUKVk4bMyQ7whDxtTGqkjdQuvkpa+HEK8+h/Csj+sfGm7fnZLvmET
 dvhKj3TE1JWVmyG543BGyR5dSA==
X-Google-Smtp-Source: AK7set/WWCG0Y19dBysdVZMG8J7kAJ3fT3s4OMXvHdfKLy502BLRGMbQhEoWIcN1F4+XTrcfWuul+Q==
X-Received: by 2002:a17:907:208c:b0:878:8249:bef6 with SMTP id
 pv12-20020a170907208c00b008788249bef6mr15641953ejb.59.1676081500334; 
 Fri, 10 Feb 2023 18:11:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 43/43] drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major
 DPU version
Date: Sat, 11 Feb 2023 04:10:53 +0200
Message-Id: <20230211021053.1078648-44-dmitry.baryshkov@linaro.org>
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

To ease review and reuse rename MERGE_3D feature masks to contain base
DPU version since which this mask is used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 45f9be9665ae..f377598c75ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -70,7 +70,7 @@
 #define CTL_DPU_9_MASK \
 	(CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define MERGE_3D_SM8150_MASK (0)
+#define MERGE_3D_DPU_5_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
 
@@ -507,7 +507,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x100, \
-	.features = MERGE_3D_SM8150_MASK, \
+	.features = MERGE_3D_DPU_5_MASK, \
 	.sblk = NULL \
 	}
 
-- 
2.39.1

