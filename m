Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5316D709D37
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753610E5DB;
	Fri, 19 May 2023 17:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705A10E5B8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 17:04:38 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f1fe1208a4so3992868e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684515876; x=1687107876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Olp/PVXIJr8fEMjOP3fCHDkSYD0xJnBud5aoQtWwMD4=;
 b=P9a3mKGxCtfXzLKVP5SAo8qOjOSf2qX1HaGd/cu8Xc9t6oXlMn3jlr7AlPWcfXUcGc
 uUhl0unwQ+QMiJ6B95v/v6z2cKzszb/5BcyqYLd7UX6POBBNCYBgyiW9RxMBgaN6hejk
 e5D56a96OYOJrhs0upUZj0VDGFDjlBPbXLW5Zn8C16wqz0mPgyN8kUQ3fqDgk7Namlas
 HVeSscM5QregjAWpfKtNE+sc6VScflt0U/8InDCjzdAoRKFZyZmym1t93dB0RircufHa
 bGbO6VyI3Gi0Ao+Ofz035mXiB43bMiH19+BPZ+69ER1Vz9PioKXed9KGziR2h0GuwWKh
 kjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515876; x=1687107876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Olp/PVXIJr8fEMjOP3fCHDkSYD0xJnBud5aoQtWwMD4=;
 b=KEGgViaan7qvCM2EX2hi6bwFnFsSEQM+gJZTxcYWfL4bTfWNf93Q7WQZuG76iNoNjb
 KiSJ2BiCGXsr/SrLcnV/P3nWh2h+ZtuDpavKGRem2WwlPCsEKbzNIQB2bFU15nOOHryV
 sck5w7XavvinC+IsJOpzgNcxl1U3vJkaByPK7Uavtp2Uag32jUojZWucolwVbdDPmUA4
 EcBB0MjB4Cn7NEEUZ6Ho7ItcNn2Ri4h02m834yx5/97ar4PXFDhfqRbhfh7Gg/xHGcx+
 ZDs94yFW84nkMYSuCPvaQqsTQZRRPP2o4RFQqkcIuZKwF3x4NiytN0i/X+1QBJIup+nv
 YXDQ==
X-Gm-Message-State: AC+VfDyer1Oq5jYB2Q/FQuhhVcM+a0NFppGAV7vSDstEaeZ6E/yymhpu
 L1OybUFZvNSkv/YcLJf4oWhfAQ==
X-Google-Smtp-Source: ACHHUZ4IeHr3sqM5Wn5U1+TjNStYTlQDUVag+a9X5qZ3WvOtBOeS4Z5TH4sFCy3lI4XYAyk9EC+kwg==
X-Received: by 2002:ac2:4c90:0:b0:4f1:95cf:11eb with SMTP id
 d16-20020ac24c90000000b004f195cf11ebmr972148lfl.6.1684515876323; 
 Fri, 19 May 2023 10:04:36 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b004f38260f196sm654478lff.218.2023.05.19.10.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:04:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 19:04:23 +0200
Subject: [PATCH v4 02/12] dt-bindings: display/msm: dsi-controller-main:
 Add SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v4-2-68e7e25d70e1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684515870; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VsWoYP7GHCgHOv33piyXwEtJ6/KtKH5SJYQ2EDUVEdo=;
 b=QPzbrNxaTLE/p9WkBiuxekU0fx4pSTlLLWeihi35wm/6b4DUhAxEznO6YIPT1cqT9vE73a++B
 KIBa/uP4RVtC4cpGHCHGC0eyloeNuPrCeuqwfmpNxDSXB2Gr7rCN3Yh
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the DSI host found on SM6375.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6f367a1fabf8..f7dc05a65420 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -354,6 +355,7 @@ allOf:
             enum:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.1

