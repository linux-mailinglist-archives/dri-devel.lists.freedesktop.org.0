Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399426B9306
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2616C10E7B1;
	Tue, 14 Mar 2023 12:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C761B10E7AA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:14:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id r27so19705928lfe.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678796064;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1P1pYiyEYMVUL7yAvgwa0bBv+0t1+WV+M8Z/f6qqjH0=;
 b=Wj48vVXbGkSyiDgbqj/+GLMCeSmwtEdP9xLi1GDEjC0foSiirrqPTM8MmurLYFDOa1
 8V9y12UczeF8AqE4scC7rXbILCZ5Ag5/dA7USPab4qedLSSF4eq28dm0Ug0Cv3xxtULe
 heYmPh4yyncyXr5h4fAv9RZQlzbyN1XxBxKQyKVLju0NytI5lZw6ITEUP2Xr71RctWPM
 hJ2iC9BhILPgpOfdgBuywNPkpSY1MmfbhioRZ4wdnlOXN65nC1adDrwvi+Stj7l0ETFL
 1pBh0Ys+H5w2eM6x9TW4L4vBGRkzUyJQXtfhUR+iItTz+GLWhcrQwOlZtXxYg9y3Si1H
 eWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796064;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1P1pYiyEYMVUL7yAvgwa0bBv+0t1+WV+M8Z/f6qqjH0=;
 b=KOzTkooEod9VkwVHaMn0zaje641DgWXhIZ9vSy1FggGVLLoSo2+x8tvsBioHKeDJqy
 8S9enkhRgG1u1EK3vTaBGkMCHGKso5yLp5DyMr8k+x5+SVSBWAU5SQOqmV4cJ9BgA95Y
 wIAhzq+H6aav40KkdFbbyfwnb10nRoNMQn/7PwOB9gMVM9RPSCFYYuB8eaoE15SxZDVz
 sRAI6nCe3x1v7DNCKraspdYbldZefgilPVhAASSdMmPXe3Ijhss8Cygvf0zDR2ywuXOv
 l1Evva10DYc814ei+V2JeZsmLAwrt1rxyxi2dcEkbZI3UCOq3u3pANykB256RdtsHKQY
 0uew==
X-Gm-Message-State: AO0yUKUI6mSncxEKpA31Evq2tQlSS8/0dzc2v/XHjbaF0BVAUO2bLSkW
 Hn+nV8hD/q1/HinLqLjhjpt24A==
X-Google-Smtp-Source: AK7set+I8lQgNzPkz4L9M7HgnX9W/1AiS8lb8kOzmpsng+dz3rICh2GeR0Q7ovbC8CBNyaTNzhVZ5g==
X-Received: by 2002:ac2:5596:0:b0:4e8:49fa:ec1d with SMTP id
 v22-20020ac25596000000b004e849faec1dmr755500lfg.66.1678796064168; 
 Tue, 14 Mar 2023 05:14:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:14:23 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 13:13:47 +0100
Subject: [PATCH v4 09/10] dt-bindings: display/msm: dsi-controller-main:
 Add SM6115
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-9-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=2294;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SrFjrl3hjjd6jTZmTfeOIcB1iG8ZWHw//K7P30Y1IYE=;
 b=ilkdJdfqSf8IuJJOZxOWUoZY9G+1PFVahC6fWUEls2j/8BN3zw1uAzrxxAWELiTwTmpCpmmv3vqv
 FMBevoo8DD5DaJ+8WB/H2V5y+tC3QOcMI0Y1Qbqetx0EcahBejA4
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
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible for the DSI on SM6115.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   |  2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml      | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 94f4cdf88c95..d534451c8f7f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -351,6 +352,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
     then:
       properties:
         clocks:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..b9f83088f370 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -40,7 +40,13 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        oneOf:
+          - items:
+              - const: qcom,sm6115-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - description: Old binding, please don't use
+            deprecated: true
+            const: qcom,dsi-ctrl-6g-qcm2290
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -114,7 +120,7 @@ examples:
         };
 
         dsi@5e94000 {
-            compatible = "qcom,dsi-ctrl-6g-qcm2290";
+            compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x05e94000 0x400>;
             reg-names = "dsi_ctrl";
 

-- 
2.39.2

