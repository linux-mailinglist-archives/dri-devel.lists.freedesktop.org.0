Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1666C385
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 16:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D3110E2AE;
	Mon, 16 Jan 2023 15:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCDD10E084
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 15:21:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r2so27801946wrv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipy7aLx0VwQlNfAPQLDup1F5SBfWJdQz4FY6bwFHuGc=;
 b=S2uwb2b8BLVVzGbiBGjRSt09lvDYJKv/MTgNZb6TDZSThobAD5VuERDnzC8F9cOSlp
 0GiBxIXYNJXIDrm8ryJeSxUN4MyVCEvi6vQYdDLsZNvU4h7nrj1GNBOmE8wqQTZmLx8P
 1HulAz0E1H4ERGEdGc977PynVl3uL4N1uJMMPjT/T4kQIX+okN0dTGyKD/gdy/lsrG4V
 3cYBA6N+nGdr6Bfa6+28K7WZYYCVXnE9v/K7Dm8I9vccXGCZz61+LwlZwJ9uxRRMvTG6
 lIKRLVlHTAg7Azg6EYzg6QSv47lK25qI24/Qq8UxELibZzMNFpMIAB5pP2k1ouVJGVDE
 wsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipy7aLx0VwQlNfAPQLDup1F5SBfWJdQz4FY6bwFHuGc=;
 b=Rw4Fo9zFyoYN8kh1ONHgkJJTILs4w7ajxCaxMMBw03Do3cVHOZa8WBmGZVC2WEangw
 4acvaf+corOTLUBEaGFs5cI53kwqLVmbcnQf9KgFgeC//BCmviontmWZuRhjifoORXWd
 7bqxJ2caupZ168kxhCqBIYJYBoUsIhc2hWe55MHAsC6CU3d2Hs+WN88gbWu5G7Ffm7t4
 OyEMH0YIsWRn96xX6EAZAdH6IzxTCqnvN7RszErKmryeXYFuqKckE8fpm2bKv+RySw9m
 Y8THImYT/v1+I0vfaGSKoUJMpbu7cOeUXuF2BzFZH+2glRtN/cdvFnAo6LOTDbFJTsq5
 ycrA==
X-Gm-Message-State: AFqh2kpocUaiTDffyWdWkbO4/7Dyq4hXjpKJuRZYjBDHO1hqpGRTs2Sy
 bDlDAtTdLBIPpW7jCSIOEl/xEA==
X-Google-Smtp-Source: AMrXdXsrBq9Eua99FPGOxxh5Vws09TzxkzR4rxCItnJMKRlM2+1lUIpRsU6LmmoWschXWnjoED2FHA==
X-Received: by 2002:adf:e987:0:b0:2bb:e891:1829 with SMTP id
 h7-20020adfe987000000b002bbe8911829mr22933080wrm.4.1673882492423; 
 Mon, 16 Jan 2023 07:21:32 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 u18-20020adff892000000b002bded7da2b8sm6874686wrp.102.2023.01.16.07.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:21:32 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v7 1/4] dt-bindings: msm: dsi-controller-main: Add compatible
 strings for every current SoC
Date: Mon, 16 Jan 2023 15:21:25 +0000
Message-Id: <20230116152128.909646-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
References: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we do not differentiate between the various users of the
qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
compatible string but, the hardware does have some significant differences
in the number of clocks.

To facilitate documenting the clocks add the following compatible strings

- qcom,apq8064-dsi-ctrl
- qcom,msm8916-dsi-ctrl
- qcom,msm8953-dsi-ctrl
- qcom,msm8974-dsi-ctrl
- qcom,msm8996-dsi-ctrl
- qcom,msm8998-dsi-ctrl
- qcom,sc7180-dsi-ctrl
- qcom,sc7280-dsi-ctrl
- qcom,sdm660-dsi-ctrl
- qcom,sdm845-dsi-ctrl
- qcom,sm8150-dsi-ctrl
- qcom,sm8250-dsi-ctrl
- qcom,sm8350-dsi-ctrl
- qcom,sm8450-dsi-ctrl
- qcom,sm8550-dsi-ctrl
- qcom,qcm2290-dsi-ctrl

Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format while we
do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6e2fd6e9fa7f0..35668caa190c4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,9 +14,31 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,mdss-dsi-ctrl
-      - qcom,dsi-ctrl-6g-qcm2290
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
+              - qcom,sm8150-dsi-ctrl
+              - qcom,sm8250-dsi-ctrl
+              - qcom,sm8350-dsi-ctrl
+              - qcom,sm8450-dsi-ctrl
+              - qcom,sm8550-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+      - items:
+          - enum:
+              - dsi-ctrl-6g-qcm2290
+          - const: qcom,mdss-dsi-ctrl
+        deprecated: true
 
   reg:
     maxItems: 1
@@ -149,7 +171,7 @@ examples:
      #include <dt-bindings/power/qcom-rpmpd.h>
 
      dsi@ae94000 {
-           compatible = "qcom,mdss-dsi-ctrl";
+           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
            reg = <0x0ae94000 0x400>;
            reg-names = "dsi_ctrl";
 
-- 
2.38.1

