Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B36520B9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B36410E3C2;
	Tue, 20 Dec 2022 12:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D8210E3A6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso8649097wmp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SX3uqIEBtLbM8AShYXDZOlc86/fdUP6gKtohgAJFYSs=;
 b=YdSKneixm0ez93NqPoqLdgFPkMzAxBHSiA7cXMlRegqM5dZx+HXvKtMWX+pi41XGZj
 LN6PCU81t68w6Xusx2f+PWdgee7qfG8HFWMvYGCxgTma6TAYSSbidtFuvkoUSDcH51XE
 eqjxAQryegnHAtS7+5PeawVkYY8m4izm1s5UIFqqZePbKInwAl4QAeZrhhgcQ6gNAhzY
 vbEWaFZq/MVSZAgFEN+xHvj28sh39OFjKRpEnywG8MB8BdVZ/up8f3fhEiG8BEJV9/Le
 VR4mesS9XapH09xB6HEdgSH7LekvckReyOIcUdz3mpxiBuUPVxuRIHH+tc3g4IthPD5o
 wkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SX3uqIEBtLbM8AShYXDZOlc86/fdUP6gKtohgAJFYSs=;
 b=p88eRmxzEoZl2XTdmAmT2yusINjuiiBxYthSYcBKxwtnhGRLfIMsSBLjfsC76vWjLc
 nhq2S6wRJdVojmEvt2xuLkcrmtBHHgkAT/T0nvGL8yzS8HWwvZHdEOgqIJ3W7OenAZUL
 7K3kzn/qLbucWCVSvTw2UQyX6vpwD2j/UsnmHHoG1XDsSb/J1ukuDLNEVvkIv82hBBdY
 XPXllgJn7Z8Q1O9OB8/oSCtif0HzjTR/uO0DSFs/mcba/U10gKcqobEuNGWQtdCSw10d
 ntKBBq7bBdXeDFP6Mon6OmziqP67e7GsBjGzgZxTOTpvno0/3cyfKrjCYTrhriF7sKUh
 5yDw==
X-Gm-Message-State: ANoB5pktqRdKuuHyGcmrGFKCySSCvrBTbJfNSO62u1YaBHSLMff2s9V4
 JzDUXMiBUFZSZcXC5RUt4tqOZw==
X-Google-Smtp-Source: AA0mqf58I+Xg+OpAQV1uuLmLHCOt1STn3J9rzx6P0tmgKcfPwtMywcv7jnoP+lFeUIgI+nlESDkgvA==
X-Received: by 2002:a05:600c:3508:b0:3c6:e63e:816f with SMTP id
 h8-20020a05600c350800b003c6e63e816fmr33464232wmq.38.1671539801903; 
 Tue, 20 Dec 2022 04:36:41 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:41 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 04/21] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Date: Tue, 20 Dec 2022 12:36:17 +0000
Message-Id: <20221220123634.382970-5-bryan.odonoghue@linaro.org>
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
- qcom,sm8250-dsi-ctrl

Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6e2fd6e9fa7f0..01afa9e9c4b3c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,9 +14,21 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,mdss-dsi-ctrl
-      - qcom,dsi-ctrl-6g-qcm2290
+    items:
+      - enum:
+          - qcom,apq8064-dsi-ctrl
+          - qcom,msm8916-dsi-ctrl
+          - qcom,msm8953-dsi-ctrl
+          - qcom,msm8974-dsi-ctrl
+          - qcom,msm8996-dsi-ctrl
+          - qcom,msm8998-dsi-ctrl
+          - qcom,dsi-ctrl-6g-qcm2290
+          - qcom,sc7180-dsi-ctrl
+          - qcom,sc7280-dsi-ctrl
+          - qcom,sdm660-dsi-ctrl
+          - qcom,sdm845-dsi-ctrl
+          - qcom,sm8250-dsi-ctrl
+      - const: qcom,mdss-dsi-ctrl
 
   reg:
     maxItems: 1
@@ -149,7 +161,7 @@ examples:
      #include <dt-bindings/power/qcom-rpmpd.h>
 
      dsi@ae94000 {
-           compatible = "qcom,mdss-dsi-ctrl";
+           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
            reg = <0x0ae94000 0x400>;
            reg-names = "dsi_ctrl";
 
-- 
2.38.1

