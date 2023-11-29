Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28727FD9E8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B79010E5EC;
	Wed, 29 Nov 2023 14:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB5310E5E2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:44:12 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a00ac0101d9so932063366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701269050; x=1701873850; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H+pZ3XAdsVueNoWE7iUbXVGwfYWqTolu2H2HJ2DSPkw=;
 b=v7sZfzHbamtlL8AWbIuovPl/939tCRz/4uzDyO7jY9xuTsE9A1mimKrE6KlUHwFabc
 qeS5v6XBYDw0kV24NWiJBNjSOaGEDdR5BkfhmlG3vusDfUITHsyMU29FRW4z2PNjoO51
 zw3CJ83i5ucbcoZBT6kU57CO5lx2bOmZrLZJiKPhNgXtulXNYMQ4pAiCfMSAzuy598pV
 GtBCFkbwV6X93n/pnbgMi4J9Ma/eQeS+VjuCUI069+e8FhqE5/CpsaFhSUI6rkfmccvX
 ZEMxwREg6eDTPUVUoURphhJz2itaiRwQbtxOLCaTScojlYyE79PgP1fGWGblOKf1nBcv
 vdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701269050; x=1701873850;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+pZ3XAdsVueNoWE7iUbXVGwfYWqTolu2H2HJ2DSPkw=;
 b=UW+1OAfp7pUCdOeNm7tZEt3fhDY6nOuXaBAHAKIgxJrwA3XlxDwkOjmyhJVvFx2h+D
 lxVBetmrMdqkP96aqwQo/lLD0ZOJPpYpRdPjKkrNZIhZojOpO2QuQs1mIuzAHY2ZnoZ+
 8Qd+WbMLFByihq5dzT3qD03nBZY9dpUzmsHqEd1YsSIuDZmrVqvTb5dKRjJ6E5bV20q6
 fCyvVwCH/uil2zZPO9bNLjznt0u9wA7+Lp6OGKeN+oYsaQ+1ur44ette/3alCyNkyhen
 EAygmszLCgDiTVftib7VqxZFWech9319BKfTWttYLixq3WpEYxusGOnriYZmlVmORxKW
 RcxQ==
X-Gm-Message-State: AOJu0Yxnj18qZ1t1zeqwKGN187YLkrA3iOySIHKjEGCBtEHfQIaE8Bya
 9F1EoLfuM+tsWt/gZI1ALs+2kg==
X-Google-Smtp-Source: AGHT+IFURYRN3Yij4y5ft90nlDPEV1BNLexcpwu9tBs3tNyDBBwPthgG8Q+ABWb8eufV7YLwTjIF0A==
X-Received: by 2002:a17:906:510:b0:9be:30c2:b8ff with SMTP id
 j16-20020a170906051000b009be30c2b8ffmr12348644eja.61.1701269050628; 
 Wed, 29 Nov 2023 06:44:10 -0800 (PST)
Received: from [10.167.154.1]
 (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm7913738ejh.79.2023.11.29.06.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:44:10 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 15:43:58 +0100
Subject: [PATCH v3 01/12] dt-bindings: display: msm: qcm2290-mdss: Use the
 non-deprecated DSI compat
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v3-1-4cbb567743bb@linaro.org>
References: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701269042; l=1541;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=l4+kOWFmXlWpi0xa3oCnZKgfHtaUhcfrj2zIVLkYkxw=;
 b=OWgPkJLJLGOOEg/SuBCEfCvzf9y60IwA2WztWt4bBigKVglnHm9CAi7xNYwNozaUtbSvibwxq
 GHrhQZK30uaB89OofoKFMMcdG8oy58DjqfC9DacVEB+qkpCn7d8tK5Y
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
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "qcom,dsi-ctrl-6g-qcm2290" has been deprecated in commit 0c0f65c6dd44
("dt-bindings: msm: dsi-controller-main: Add compatible strings for every
current SoC"), but the example hasn't been updated to reflect that.

Fix that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml         | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 5ad155612b6c..d71a8e09a798 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -56,7 +56,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        items:
+          - const: qcom,qcm2290-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -136,7 +138,8 @@ examples:
         };
 
         dsi@5e94000 {
-            compatible = "qcom,dsi-ctrl-6g-qcm2290";
+            compatible = "qcom,qcm2290-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
             reg = <0x05e94000 0x400>;
             reg-names = "dsi_ctrl";
 

-- 
2.43.0

