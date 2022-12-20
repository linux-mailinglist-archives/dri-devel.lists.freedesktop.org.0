Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D586520BE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F328C10E3C3;
	Tue, 20 Dec 2022 12:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AD610E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id co23so11606442wrb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1hPXPEXckffBNlwumvAsC5HqSCurGTcNG8EXU4Ej48=;
 b=n/v13EGg/iN9FZMV6JCSrqQEo4iGxTaj9VvSyhHUftlDJeqbBE9KVPNQqczSz0oIGA
 TCQ53qdHf2bfD+ZNPQdlcHRo7LjsMDYkZNmMf0fax0CPqAlZ8f9SyWGLixvNetZUs4/2
 UYarwp1h26Hk/WQ4ALc7Qwie9Zsf/O1p+3Pi91uuhlk7zoxm//Hp1PmXw++w+7JJZSVu
 a/P9Hr8Yr8NZ8bd7MZBAULRiJAmu79gcBJBwDGCA2o9DhrGPmsunqhKUfZIasQp3n2Ce
 Y0tNd0Zmaej7gBhGrt0BetZ55A9b4HA3RtQX0qyCcIrhBAVv22tukpcF5QphF/nZuF6A
 E0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1hPXPEXckffBNlwumvAsC5HqSCurGTcNG8EXU4Ej48=;
 b=XSE9ehXXBmjF8OMuqvlK6OhKGfhxbD2EzDA54TLtTBEae8taRsgCaWeOT2TerGWP/W
 syk9oeNKYjZCJhufiAlLN1K0dnYOKP3aF26hLFpcC2sX8ZFqmw6jfwK9YqAepycad18t
 XmfMZY7KWj9HJO9JSyLMXaa5e95vNowy+EqGsDX/1A1/E3FPXt0bHj3VIlq1Ro36GRU/
 HDCVKvIfgSruVAZxyd0icjRNSA4JzhURJ+OiXdPw8toXSfecRKd9EXZPlZ3XcS4iQ0qi
 XZzfsv+jjAgSxLVNd63D5ElBgFCM6Lxq/h6OpYfYUPeIZj/svWqsAv3BmR7HU/JCLxqY
 NxwA==
X-Gm-Message-State: ANoB5pkBZn50UOF5hWqkFmO5KvxWvpghaK4yvaoU29fhjT+SDzeyYwtP
 GZM2b5kT6ZMPXMS8qGUBSM4Hyg==
X-Google-Smtp-Source: AA0mqf5B5ECh+ggJRZRYmz1pdLlaVcCEONfCV05NNyl9HT9G3Cq7sziOYBCuqSJnIDq9c1qbB4NMCg==
X-Received: by 2002:a05:6000:38b:b0:242:69f4:cb6a with SMTP id
 u11-20020a056000038b00b0024269f4cb6amr32222320wrf.9.1671539803010; 
 Tue, 20 Dec 2022 04:36:43 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:42 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 05/21] dt-bindings: msm: dsi-controller-main: Deprecate
 qcom, dsi-ctrl-6g-qcm2290 in favour of qcom, qcm2290-dsi-ctrl
Date: Tue, 20 Dec 2022 12:36:18 +0000
Message-Id: <20221220123634.382970-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format
qcom,qcm2290-dsi-ctrl.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 36 +++++++++++--------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 01afa9e9c4b3c..98d54a7ee28d4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,21 +14,27 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,apq8064-dsi-ctrl
-          - qcom,msm8916-dsi-ctrl
-          - qcom,msm8953-dsi-ctrl
-          - qcom,msm8974-dsi-ctrl
-          - qcom,msm8996-dsi-ctrl
-          - qcom,msm8998-dsi-ctrl
-          - qcom,dsi-ctrl-6g-qcm2290
-          - qcom,sc7180-dsi-ctrl
-          - qcom,sc7280-dsi-ctrl
-          - qcom,sdm660-dsi-ctrl
-          - qcom,sdm845-dsi-ctrl
-          - qcom,sm8250-dsi-ctrl
-      - const: qcom,mdss-dsi-ctrl
+    oneOf:
+      - items:
+          - enum:
+              - qcom,apq8064-dsi-ctrl
+              - qcom,msm8916-dsi-ctrl
+              - qcom,msm8953-dsi-ctrl
+              - qcom,msm8974-dsi-ctrl
+              - qcom,msm8996-dsi-ctrl
+              - qcom,msm8998-dsi-ctrl
+              - qcom,qcm2290-dsi-ctrl
+              - qcom,sc7180-dsi-ctrl
+              - qcom,sc7280-dsi-ctrl
+              - qcom,sdm660-dsi-ctrl
+              - qcom,sdm845-dsi-ctrl
+              - qcom,sm8250-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+      - items:
+          - enum:
+              - dsi-ctrl-6g-qcm2290
+          - const: qcom,mdss-dsi-ctrl
+        deprecated: true
 
   reg:
     maxItems: 1
-- 
2.38.1

