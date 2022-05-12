Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2652E52586F
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 01:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E957A10ED2A;
	Thu, 12 May 2022 23:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF110ED24
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 23:36:52 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i10so11658566lfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i1goeg2wYzcHMfXO9CDFGJF9XLqANUBaSoksUz5XNRc=;
 b=X3LHZVoKx/IHv7Ini1Y3dYLp8M7uyC0RZiERWt3pMoULdXqVrVHZggMQMIPfrPtF8V
 /IGe+F1554dHMvA4Ofm87+iFxPr0aiiYA2jSn5qp3oGvtrAc7F/Hs8bJE+bVbNia/U85
 pII+jH+Vr4nEsO+l0Z+j3ygVX97CVFOeNDl1kcoc0SA7TcjZf4b0GNyROQNkYoVLwXn1
 PzDDWkvwYjkVxrdJHsy9U7EoWvc9ehA1NrkzlepJOGHN2/dla7NVig3LEB1bO2ubAxYz
 i/0iu6pswFhG/ZevKdlUtJVl8Im1rW0mo0mgA1vuKUWge7U2DU+IFD6uM9r15WsephHA
 1UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i1goeg2wYzcHMfXO9CDFGJF9XLqANUBaSoksUz5XNRc=;
 b=JIhk8YOIGq5Om5dSkZOSwoJ7SUT5lm2WKsySedqWFnDb/pohPM2VYOH94fVV0D/ypy
 IOt3QgndXdDMcQRLIb/FE3+o+6+Wv54H0kBViVl3cfGP3eLpDmEYUVNwPi6jajbzmSbw
 yMlYkwrNRloH1dMtKDnAuNgBBsagUbY8aRo6qqBLLM8dXsJ0PSTld0CfeGs2m9DwAD5R
 GXHWywTxdThSV08xhUa5jf18bc0eG55XcEqbh1TqT6md15QPTsrKWybjOjConFV5TkvA
 dlHOTdHoAl0tdM7/vciBXUDzKJnWMoGZqqRTApR+rhBqXH6E6nNdJ4h+Let76tKm+gRK
 s9vQ==
X-Gm-Message-State: AOAM5317rWyBpbJBa/0FRgIeJQDyZ0HFjzsmOoKJzu2hTz75htIFafg0
 vysWChy+29Lg7G64umxuQgnD2Q==
X-Google-Smtp-Source: ABdhPJyzdJYvPj0AkVnv7w7nwDsyWQeF24SHe/E4f8AaPGTqUAz7rhU1DRRUEWq3JfYUPpVIUs3HcQ==
X-Received: by 2002:a05:6512:2399:b0:473:a82d:cfde with SMTP id
 c25-20020a056512239900b00473a82dcfdemr1413328lfv.375.1652398610434; 
 Thu, 12 May 2022 16:36:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:36:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 3/8] arm64: dts: qcom: sdm630: disable GPU by default
Date: Fri, 13 May 2022 02:36:42 +0300
Message-Id: <20220512233647.2672813-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SoC's device tree file disables gpucc and adreno's SMMU by default.
So let's disable the GPU too. Moreover it looks like SMMU might be not
usable without additional patches (which means that GPU is unusable
too). No board uses GPU at this moment.

Fixes: 5cf69dcbec8b ("arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration")
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8697d40e9b74..e8bb170e8b2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1050,6 +1050,8 @@ adreno_gpu: gpu@5000000 {
 
 			operating-points-v2 = <&gpu_sdm630_opp_table>;
 
+			status = "disabled";
+
 			gpu_sdm630_opp_table: opp-table {
 				compatible  = "operating-points-v2";
 				opp-775000000 {
-- 
2.35.1

