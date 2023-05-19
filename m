Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815F709841
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 15:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9486F10E226;
	Fri, 19 May 2023 13:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C13F10E151
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 13:29:20 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ad819ab8a9so36995161fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684502958; x=1687094958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GBhLY1RBB0gRiRHK2AH+Ew8caVNbMAw5AWStImZv0V4=;
 b=fUM9Sf1CFj5DJCwIfKnYJ6R5zl2ELQpvHxg4T+Iq5cQR/PQng4wmMYRSvNbvO0eJF4
 g1aJ16Uo40Ktef25eTPMWy7PLk/e4lk0O7uzoFvJijUxf2WNmZH2NZ2qRkB0Mur02YQA
 Y0smjgE3TKcczJMI+A+vKHWYDmX7T2ymW9XE+s3OX3BXUvMr9HyUZEuuTbr2KpvXOaMg
 zVWvUitWelt2i0IR9pbfz+CV2DAb4b9q3QHQkWnXuTtkRzGs+ooL+1FZpwchKUT+SHbk
 oPnMUS+41ypDb3YT4X1ZI+OrN4BOy1xBKrC/1QGxmP09N4gucmGIs1Bn/c4FmMNwGcP8
 ZVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684502958; x=1687094958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBhLY1RBB0gRiRHK2AH+Ew8caVNbMAw5AWStImZv0V4=;
 b=KnMwGI1nf3IOkgV4fYNU8NnE5CEYtRnejlBMEShv5JCW/XvV5lM1obL/7gNag0tudJ
 BzkWlqcqDEv9tqU2JBPulLzavgFI6ld1F8FK+JgQiYZFdWRanUyNbCRnUeGqiq7wPSlW
 5e+TVi6AdI272VzVfKY7W2AGgX7tUazLB9sQNF169BYAf3kc3A2ruDgFbWt0rxdaiwCs
 pnQD269t0KP7dAXArC8i3pDVjejq/DjCsup64OmvP3cy192ZmLuik7mJAI3pfgpTyvFq
 hj1R0AbI6bTmPIOkn4kESRhIGfdk0qWBl6E1wD7TRviu0m+M1JSCFJDGP4LM4nWUfhkJ
 7O0Q==
X-Gm-Message-State: AC+VfDxwamYMefL3XZooKLwcKrRJd1gz9hosgBPCivZaK9676fg4UtCt
 KXLGvq7al0iQLZxAz4MSNhF/Tw==
X-Google-Smtp-Source: ACHHUZ6uaEACa/UT3gr/SiNQfbb6FOw6oRFeaCYBpZwcDkzIPTSrPcUwE474KRv/cAapDm8pCG8H1g==
X-Received: by 2002:a2e:8695:0:b0:2ae:db65:2d01 with SMTP id
 l21-20020a2e8695000000b002aedb652d01mr795280lji.23.1684502958286; 
 Fri, 19 May 2023 06:29:18 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 06:29:17 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 15:29:06 +0200
Subject: [PATCH v2 1/6] drm/msm/a6xx: Add REG_A6XX_GMU_AHB_FENCE_STATUS_CLR
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-1-5b9daa2b2cf0@linaro.org>
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=867;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OCiKX/I/i3QBFBCW7ZU+1vuahZ35pMyKYqaVhGEDcJM=;
 b=mg01xARFIrulLxUI9/I/yVrcCgcgVFbSedvUodXJrTp6m2XCaCM/yiyj5pgGMeTbKrWXmVHu9
 zyYpddTSpXVAJBKkYpPZaAmHxLlmc3SwrXNoWJEA65Ga9aAO20VxL6E
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

Add a definition of the REG_A6XX_GMU_AHB_FENCE_STATUS_CLR register.
This may be substituted with a mesa header sync after MR22901 is merged.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 9ab15d91aced..fcd9eb53baf8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -425,6 +425,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GMU_AHB_FENCE_STATUS				0x00009313
 
+#define REG_A6XX_GMU_AHB_FENCE_STATUS_CLR			0x00009314
+
 #define REG_A6XX_GMU_RBBM_INT_UNMASKED_STATUS			0x00009315
 
 #define REG_A6XX_GMU_AO_SPARE_CNTL				0x00009316

-- 
2.40.1

