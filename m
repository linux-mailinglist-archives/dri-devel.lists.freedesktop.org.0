Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8371F671261
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB1110E66A;
	Wed, 18 Jan 2023 04:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F71C10E65F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:48 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kt14so21368874ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GIyuJnQD498muXVqSb8DedJYfl5A4JrvBcZkaYGB5JM=;
 b=YFkqeAcAiFVwaUiZH+QhFxq6iOrOnKPJoAaer4DjvNMBst6aMt3dhhhHxsq7wQlv67
 1c7z1wk+/VNMj2rIzHihNz0AYVleQbn3+l6UR7t+YhFe3uO/Qq/FCTRXmAeFIp2tRIeJ
 /J/Y7vYjdi6dHlzFd8/Vd1FWPSkVBYeq8/RoNj1BVYBiC8JCfO1y5eI87VDfe4va4xcT
 1n/O3e4SIvJY65eHCJDJ+RXIfYP71DsQ+R1QA2l9obBXJEyqGfCRxncP6m4hlRU4Fe9L
 sqhDEN4+EGfaR6Q/e+gOpiez8CfZHkirFglp2e0/tnpcUDcANEIQgaVhQaaj9tCKig+m
 2+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GIyuJnQD498muXVqSb8DedJYfl5A4JrvBcZkaYGB5JM=;
 b=T92hkk3iyJJKO16e3HAQ1SMcqFOX1xgcN/rVL3N+cK1YJagyQ72qz7kYUMjDLj5l98
 VilzSQrKhf2aJl6luT0TpFmi/AwVys2yIvvUsERJj9lHxouhH8GE6gRlSB++1i/g/HfL
 n98Yzl7LXsV9WCIhpxTotgEBz+9bhZ2OGahla4pCV6coX5cA1E0GWZUEE5dE+I89L+GI
 TzrwTNKBTokm77naAAFHuZ3iQ8wEiyxmPC9fshjQi+wp/vthOtzyEa8pXzuVwBoQ2x2L
 gfxsE/+QEQ2aY4ezOodvhsugSd/8b3hUcVus8dDgmakr7R4qScDxCIz4L34WztoRM6MI
 uTzA==
X-Gm-Message-State: AFqh2kr0aXX4FYxDUGdGBybTIbEeGtqaDiqyYsZRegc9VQ+7EMiXAo8q
 mSFfSHsrQXPTRsu9HMkcM1NUhg==
X-Google-Smtp-Source: AMrXdXvOt533A3OI/xj5g7SBPehNuG3/BkHWvbsgSYiSiB203N2XrDqddr3Bqy8RqxrML0sx94UNaw==
X-Received: by 2002:a17:906:3e0f:b0:7c0:dac7:36ea with SMTP id
 k15-20020a1709063e0f00b007c0dac736eamr1335969eji.66.1674015168098; 
 Tue, 17 Jan 2023 20:12:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 02/11] dt-bindings: display/msm: add SoC-specific compats
 to qcom, mdp5.yaml
Date: Wed, 18 Jan 2023 06:12:34 +0200
Message-Id: <20230118041243.1720520-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
distinguishing between various platforms.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
 .../bindings/display/msm/qcom,mdss.yaml         |  3 ++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index 5e3cd7abf046..cb7bf48c3a58 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -16,7 +16,22 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,mdp5
+    oneOf:
+      - const: qcom,mdp5
+        deprecated: true
+      - items:
+          - enum:
+              - qcom,apq8084-mdp5
+              - qcom,msm8916-mdp5
+              - qcom,msm8917-mdp5
+              - qcom,msm8953-mdp5
+              - qcom,msm8974-mdp5
+              - qcom,msm8976-mdp5
+              - qcom,msm8994-mdp5
+              - qcom,msm8996-mdp5
+              - qcom,sdm630-mdp5
+              - qcom,sdm660-mdp5
+          - const: qcom,mdp5
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 7479cd96fdec..d09842db3825 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -88,7 +88,8 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdp5
+        contains:
+          const: qcom,mdp5
 
   "^dsi@[1-9a-f][0-9a-f]*$":
     type: object
-- 
2.39.0

