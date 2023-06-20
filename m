Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE50C736A74
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFB410E2C3;
	Tue, 20 Jun 2023 11:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9271C10E2C2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:10:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so2755830e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259443; x=1689851443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QubfL4PWG3Qkdn7Jup1M3+20t3ogTcgbRp6X+RErkfY=;
 b=ZvW5wJKlc0ib7KLmbQKG/rVpS9HZS9jYvVSEj8JYRVn4eObHkRHOkkm7crkF6kLM8b
 3SR4fcwtGmnUgO6rOCh6N+vlVj0NSbWMpbPc/GNj9GwlXjKiJ0FA/L/kgsChGliYhdMt
 MZFBBGOL8Byoh/wdNP/CdTYmFU/a7zxS30LiA+yi1PpyavL4BwW7GAtXqCFIB7/WZilg
 PcxSufEtzt57Fb1GiaFrXh59KDCX2lYy0XxhzLDvxUkNQN04g5XeHpAxBzEjXSV5o102
 tZrLrIEdf357gW2sw1Y+vXdTOMTHjl5GroN4pkjXPqXzyylG+gMLVm3ElPGxudkxYY8a
 XYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259443; x=1689851443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QubfL4PWG3Qkdn7Jup1M3+20t3ogTcgbRp6X+RErkfY=;
 b=djVfTRElSvvx7N5YfIhxprW096G1nILMjtqB3dBXTVS2JAGwA582k2V0/Gh2v1y3Ry
 2YsUsWvwsCmJm4ZvMBjihGkVF9u277Y14H/+Th1LmLvhRTWDZvaJ2XNob+amK4ev//Kn
 oNrpUyommvo5fGO9XEPuVmFfoIO/RSVZBdJhJSbno7oiEj2nhMWuCRMYl1s4bX5zudr+
 Qq7YLwjraL5TJ5oFySj0HjF5dJ3U5x/lIeI4m4Ja0J4BnPcrVXclIg7gHhTD5g1wgvIb
 jdN4a+vMf9XFOsnkM6+6oyfZXR2jQKx3aqnApoeEOn45lpwxLtXuURusaaxVUiuJRqKW
 uP3Q==
X-Gm-Message-State: AC+VfDwJWpzLbv1I0L5bC1WeA2xmur/y4+IeMS3G7CUt9N+IXqkcHZPF
 DUdeoVlzfLOKtl001VcXZs+hog==
X-Google-Smtp-Source: ACHHUZ4cLmiB2n46o0d35DMgPZGWuixYgUZon5/AJjYU5NyBvxkp8RnPYyge3jvjiOeQ6yEOMx05ew==
X-Received: by 2002:a19:4f12:0:b0:4f8:6253:540 with SMTP id
 d18-20020a194f12000000b004f862530540mr3086610lfb.19.1687259442875; 
 Tue, 20 Jun 2023 04:10:42 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a056512041a00b004f764716afdsm314395lfk.257.2023.06.20.04.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:10:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:10:37 +0200
Subject: [PATCH v4 2/6] drm/msm/a6xx: Use descriptive bitfield names for
 CP_PROTECT_CNTL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v4-2-b16f273a91d4@linaro.org>
References: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259438; l=1047;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=M+YceCSQbhF8BD7s1Uycd683ewMShr4OUbGYlX/cKSo=;
 b=Xf8hG5l+ir4khCTVmKbLCZnf4B5dK4hruBv6ZR33xJp5az1Bv32pwYt6r/ytPDp6yrEHct+hI
 KhUiDXIjdShDMyyvJymRLqYM0VWGJt1rbRunrDvooo1y6+oYXaH6RDa
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have the necessary information, so explain which bit does what.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b3ada1e7b598..cd0c9bccdc19 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -930,7 +930,10 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	 * protect violation and select the last span to protect from the start
 	 * address all the way to the end of the register address space
 	 */
-	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3));
+	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL,
+		  A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN |
+		  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
+		  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
 
 	for (i = 0; i < count - 1; i++)
 		gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);

-- 
2.41.0

