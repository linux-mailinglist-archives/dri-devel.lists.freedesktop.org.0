Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D51732368
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15F510E586;
	Thu, 15 Jun 2023 23:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D602910E577
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:45 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so11307484e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871304; x=1689463304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dc6/XqCeUuMLD90IMPpV+vPMqBRNYNN2pYcIpUptGVM=;
 b=OkRl7pZbjuDj11gUKKRzut/ej6pLmDzTndWR19Y8LlvqWvXNPNFUgPi2L9eJMwydvv
 crmo4HamIW9Snrxf7J5XTNyWLZ+B13ZrpBdkEeA39msQ6jrYQ1HkRjVEt6uv0tw3BvvO
 kRWrjrn1QTnq8YHc8USEljhbHotDd0p4G/Xa9KA1YkHLpJcQtN+vbUGSMkW+QyD5xDBO
 44Kg54SjEx7Wj9jLJ7j/8MxkJg8tcIB+tihit2bNXzwuCcCVumFrb/3sCBQ6rei3GyrT
 LEv0xtYeb2/zdesgyQAKlmlA1oywkPNe+7AO7kPNu0pERDsvTRJ57qa7ZtbDgLp/us9B
 6fjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871304; x=1689463304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dc6/XqCeUuMLD90IMPpV+vPMqBRNYNN2pYcIpUptGVM=;
 b=gizP7CotsCupEAF0JJ+KmgmiS0cchePQNnAG4RBtgJtWd5VwDCJM0gp7zrjI2ZO2ZE
 3IF8qSP6ARMWtXs8Eol4r3p9ULLtyLdPlOG4kObC7dDwqstwWj2w5CNh2cf9QVbPt+2C
 Fd53vOaWTkcIWaRqtXasWcI4MBasbal4+wLyLVfSNB4EBw+DN9cnxtyn/MfIBkhhR5GI
 Xy1/QzEA/snJ3Pfz1t1PG2eAxGLqPkAyN52BEo6jW9qkchIZb5iLPXXqAG9bzKcRsvlj
 Js9Zwnl+hgOhV6B5uokH+NVbd/tHoSWBGIiH84hRY+HBDIqBMIRiIRnwYFSE7QVghACe
 h9lg==
X-Gm-Message-State: AC+VfDyaaS87drYWXgNoYQb2QIcqHSjet1t9Km069+ww04ebasfvDtd+
 jo41kz4umW8ZDVeuF0HH6djDGA==
X-Google-Smtp-Source: ACHHUZ5wa3FIk3WqUXtN8QjH/SMq7+LoUWWAIre/XBEl18/iuPObvkhqcAhzM7o1iLwG6Ih1odoo3A==
X-Received: by 2002:a19:6743:0:b0:4f6:2dbd:1e23 with SMTP id
 e3-20020a196743000000b004f62dbd1e23mr109620lfj.29.1686871304242; 
 Thu, 15 Jun 2023 16:21:44 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:43 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:58 +0200
Subject: [PATCH v9 17/20] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-17-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=1490;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=b8LS5q9YvSCzB73Uar1eH42Lv4QsJyCePzskZmQchAE=;
 b=CNAsUfQ7uGCvtpgiJ1tOWQ0c0LOfaa0E+6D+fWNOJT3Q1OF7ippRfWtWP8itV+fZ9fKYtIjWq
 B+aOjwCBfiXC3YpgUlHnvl4ioZdNTy2W+DJ7Ck1mxzov3pMMJivUk66
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 97e261d33312..d0ba0844079c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2276,16 +2276,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {

-- 
2.41.0

