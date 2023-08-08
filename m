Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5140774C16
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 23:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA93D10E112;
	Tue,  8 Aug 2023 21:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D266010E213
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 21:02:56 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe11652b64so9538400e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 14:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528575; x=1692133375;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YiSVmhvbZ5wDLNmlxl7Dw8tGNwgQ0Tshc2ZD4z2JryU=;
 b=qBya5IN2zpvucFsRjFYq9wlTNOUXihOSSMVK6BC5+NdXjn27jik6Ao/7upPuSRpt4R
 D12ocbHVYF0NH1hWo9clSgd4EJT395Ktvd7hyoGQhoSaHVaP2z8K5dlMKHfnOyV0rzRj
 2iWyKfFXaznQAnzinzfL7BF/x0u0VOWnFXx6e/M0fzL+uYa3cz9QjBZGAnHpy2+gSHh7
 azSQuN/EjdL3ElMCR69zRdZ7hHs4LGs5fQ59vKjUfn5axTYjmij82XD09rkmM7kYeTk0
 uizjom5WLv7df8gkMucfh3flNvOyqNb+5YWOJYQIu5e+15xTLBALoU0dGYSW2t7LAGHg
 2NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528575; x=1692133375;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YiSVmhvbZ5wDLNmlxl7Dw8tGNwgQ0Tshc2ZD4z2JryU=;
 b=Vw16iLlq86PqRXBzqiqg1LqCgehdcmlWWljA4h9k535wqDCws1QNZmjrXGF8DJTWeR
 /4Wk13ft/vGYLGQ22qjyq9duj5sichqThD1gAv8468nZENpUXO5col/NQp3OMZqK9CKS
 CDTX2VAQNYVLXX7DJWQbvwbc3ohcfFaCGAXuRUOPOEfditD/DEkEE4Co0l1tuI/AGhID
 SoiD6igcBxiOXPtkTYgtOvWa4GH5m71Q9CWUKtkfKu9c/qmhWbLt4p8CNqlV7EPg8ugQ
 zyTNHwFOvAIly9yVNWDvw458MQkBn5fp56nX5QsC44psw6bz+Y/wXUAMgz9JHztntRZe
 btCw==
X-Gm-Message-State: AOJu0Yz4hRvdF98MITG74jeqF1qTEc3UsA0BRldOOHNc46BwFCVJrCR8
 B7dT4DahYoOIHKrLyx41JFxbnw==
X-Google-Smtp-Source: AGHT+IFxAKQT5MUfj+PHAERXrFF2Y6Hvxy828nnXyA1PkhOB5PJNVuwwuMhstbA4gcEqnszu3et7Ww==
X-Received: by 2002:a2e:7e06:0:b0:2b9:c5fd:d649 with SMTP id
 z6-20020a2e7e06000000b002b9c5fdd649mr459172ljc.24.1691528575195; 
 Tue, 08 Aug 2023 14:02:55 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:02:54 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:42 +0200
Subject: [PATCH v2 04/14] drm/msm/a6xx: Add missing regs for A7XX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-4-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=2751;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qjjhDjYdtW67El5WC1tRT4syRzMoZ1olgqU/rNJYQOA=;
 b=KhMeG9bzNskqMk1YYRADJEC9kZlT9P7Z3UpXir4Ee0NVVfrqFNiQ8blcPO9scWtlWqs0h/NNl
 k3V2wwAtXwIAcJFD4FBNY+mnmg/AbXa9BU1X5um5eDiUKgVcHA/Gg4s
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some missing definitions required for A7 support.

This may be substituted with a mesa header sync.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h     | 9 +++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 1c051535fd4a..863b5e3b0e67 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1114,6 +1114,12 @@ enum a6xx_tex_type {
 #define REG_A6XX_CP_MISC_CNTL					0x00000840
 
 #define REG_A6XX_CP_APRIV_CNTL					0x00000844
+#define A6XX_CP_APRIV_CNTL_CDWRITE				0x00000040
+#define A6XX_CP_APRIV_CNTL_CDREAD				0x00000020
+#define A6XX_CP_APRIV_CNTL_RBRPWB				0x00000008
+#define A6XX_CP_APRIV_CNTL_RBPRIVLEVEL				0x00000004
+#define A6XX_CP_APRIV_CNTL_RBFETCH				0x00000002
+#define A6XX_CP_APRIV_CNTL_ICACHE				0x00000001
 
 #define REG_A6XX_CP_PREEMPT_THRESHOLD				0x000008c0
 
@@ -1939,6 +1945,8 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
 
+#define REG_A7XX_RBBM_CLOCK_HYST2_VFD				0x0000012f
+
 #define REG_A6XX_RBBM_LPAC_GBIF_CLIENT_QOS_CNTL			0x000005ff
 
 #define REG_A6XX_DBGC_CFG_DBGBUS_SEL_A				0x00000600
@@ -8252,5 +8260,6 @@ static inline uint32_t A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1_BYTEL15(uint32_t val)
 
 #define REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1			0x00000002
 
+#define REG_A7XX_CX_MISC_TCM_RET_CNTL				0x00000039
 
 #endif /* A6XX_XML */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index fcd9eb53baf8..5b66efafc901 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -360,6 +360,12 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GMU_GENERAL_7					0x000051cc
 
+#define REG_A6XX_GMU_GENERAL_8					0x000051cd
+
+#define REG_A6XX_GMU_GENERAL_9					0x000051ce
+
+#define REG_A6XX_GMU_GENERAL_10					0x000051cf
+
 #define REG_A6XX_GMU_ISENSE_CTRL				0x0000515d
 
 #define REG_A6XX_GPU_CS_ENABLE_REG				0x00008920
@@ -471,6 +477,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_RSCC_SEQ_BUSY_DRV0				0x00000101
 
+#define REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740			0x00000154
+
 #define REG_A6XX_RSCC_SEQ_MEM_0_DRV0				0x00000180
 
 #define REG_A6XX_RSCC_TCS0_DRV0_STATUS				0x00000346

-- 
2.41.0

