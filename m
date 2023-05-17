Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3046706E92
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAE610E1A9;
	Wed, 17 May 2023 16:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0285C10E127
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 16:50:17 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ac87e7806aso9744731fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684342216; x=1686934216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TYnjMvr3c+U3gEgGMSSumyjYrLuRnotb/3F/SfKgnsc=;
 b=H3+H6CK9OlvzfGPyRfjrVtlkNebZoZL80kYdFo90TWG3Kza3b1d9b0thw7XjQDCR5/
 QkvT8L0j0o8qGLCDCGQydU8iLbrdgtBDsW/ZpYiw2JhmMT0g1laPA8k4AE8MPwwq9SUk
 RFBJBgrSlZyEVJZGtGhHlAHp7V4GjGM1CocFggbadNioiBCmT/lIrG3io2TYa6jaTHtf
 W7jlVRcCHeAfglEIhiR2G3LWrbrCCdPGgcNeuPdR0RxlTU803i06zS97/SN/P6dXHOIk
 ppAkxOddvRR+SZINU9HvalMy8Z4cJi2uMAe6i9RPVuZaTf1TBz0wwKx0lDggHVYH41EP
 NpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684342216; x=1686934216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYnjMvr3c+U3gEgGMSSumyjYrLuRnotb/3F/SfKgnsc=;
 b=aEVuFBHl+ElLFSIDIYTGocRxO831fyuPeeLZbvKKHO2A+vJDD8BVMhjs5qZtHY/yXj
 LdYShlaOoUgZHyTkb1+gvk8tzpojKxrkvJhPBs2XWNOfQ5OIJOJIhYuqlytMBhxXKest
 54oBVEuPnh56mjUkdI6P0CIKdQ3hPPqhXiHUVXkMsQZZyZ8pqBGONgVHOjZfgK1U9ed1
 WUyYto3Vg8ZfGwHDHoS0WQ9yj86FenTizGIFHE2aoabyxCe66ZJia5mNSVz48+h3LPan
 qwF9TWz1e1+kBrnf8l+EMFMKExfFZCtXJKjZVWRC/DgeEmsDIhiSBKTV9aWq02LzA7og
 UDlQ==
X-Gm-Message-State: AC+VfDxzXx7y1jJTjtsyfFoFHxXlBOPTbxognY28wrfX6KelXOZlboPl
 irJBfDZUKAaeDK1Kj9RmzR+sbQ==
X-Google-Smtp-Source: ACHHUZ4ZBHxs0qZdACjv7XhqFKvDKZRmJWH5/RJd5SJTyuDnOfv+PHn0AlDitJ+0f/L2xUrKaDZNng==
X-Received: by 2002:a2e:3211:0:b0:2a8:ba15:eb6f with SMTP id
 y17-20020a2e3211000000b002a8ba15eb6fmr9431605ljy.6.1684342215787; 
 Wed, 17 May 2023 09:50:15 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a2e9cc6000000b002af0e9abaf6sm159224ljj.131.2023.05.17.09.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 09:50:15 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 May 2023 18:50:08 +0200
Subject: [PATCH 1/6] drm/msm/a6xx: Explain CP_PROTECT_CNTL writes in
 a6xx_set_cp_protect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v1-1-7a964f2e99c2@linaro.org>
References: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684342212; l=1118;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=aeaKOCz5rng2fUAGM03IzdiKTh6ymb1woS+RnpEksJ8=;
 b=kDW/wsHgJ4Xp1eVrDnOZAzxAODW5ws6Zqm/96IDWguKJ8oITdolvZOvBjyGjQEJPILzMHfobA
 T5r2ncZOohjCdxOLtmFco0HTV27E/+hyiab/rQ4ovzpEwkkpSRj6m5y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have the necessary information, so explain which bit does what.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9fb214f150dd..deed42675fe2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -771,9 +771,10 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	}
 
 	/*
-	 * Enable access protection to privileged registers, fault on an access
-	 * protect violation and select the last span to protect from the start
-	 * address all the way to the end of the register address space
+	 * BIT(0) - Enable access protection to privileged registers
+	 * BIT(1) - Enable fault on an access protect violation
+	 * BIT(3) - Select the last span to protect from the start
+	 * 	    address all the way to the end of the register address space
 	 */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3));
 

-- 
2.40.1

