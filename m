Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D0B654AC9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7122610E5AB;
	Fri, 23 Dec 2022 02:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9283610E1A0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h16so3364676wrz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZ5FGEbeDjrL2iWfMvLI1z2BArYg+1UZFUEu8QW81ho=;
 b=supY+mfnxqFaJyer79O9fEoRFD0NXuUOGQo44W5PWoNhbHjq2dkvvn/jk1ar+GfoXV
 hM1zc90iFahzKFcPibxs7mxx6RJrGOa4tilzUdevl2Zk9vJVD+FfqqB55um3QqBEW0xP
 wpDE9IBBxfV46QsGjq8wrBQWqd8NFv2LKFh7KGPXjzm1HUDO4MQ5XzAbjg8kDDCEVHQR
 WzhDvMb3nhDjqmCHvk/YcWPYGYw1wUbYkgwo88WyvD4p6t03yACJenWikkz+8fc44uNk
 8b+lfBTZXK17n6oC+LKcTRg5ov1Jpqquzg/aXE4ThfC99pTrR5OmUOw9SgKUaZx2VRT4
 XBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZ5FGEbeDjrL2iWfMvLI1z2BArYg+1UZFUEu8QW81ho=;
 b=q4rBSRlpjuVHfTdgTpsIacxi9mJGxSmHE5Mmb0wzFRbR6VmUov73RsPtiK26akPOSd
 QfSZgnvGe/CWhWZHTtS1o1TlsaHl2DlKQ/R+AUSwqKiPoJwsQcUAFMU/97bcUgVGEeMS
 q9dghhikeXVZlvDwBoqZXh6garNiKxo5y7WOqYzooZbJrRaMF4nbmlcrs3hqT6F2S1r7
 1f5aRKGidEkxvVeLU3yxobPCet0P5jwvtMe8UhFFuv8haexy1qc+GXtsPaq9U+oIBXjF
 YiKtBZkUK6rFw6IJO7RQiZNwfbENOaZWAk1S7AHnA0nBX+bIxBA9tkSW25GpE4kzSWQC
 bOoQ==
X-Gm-Message-State: AFqh2kp5WLe0mm5LIRbrsp7pkarzPa4a773mMfQVVbnoK/4fVlyYZywN
 PUyJmrGbkx260GpycH9bUsJpyA==
X-Google-Smtp-Source: AMrXdXuEgXFTiwZz66Yi+3vrH5961pBWHMBNODkS/ydRMqAhyQ7UZ+RbgrVlhFyy4k9u1box64gbWQ==
X-Received: by 2002:adf:ec05:0:b0:260:6dca:f239 with SMTP id
 x5-20020adfec05000000b002606dcaf239mr5260070wrn.22.1671761433188; 
 Thu, 22 Dec 2022 18:10:33 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:32 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 04/18] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Date: Fri, 23 Dec 2022 02:10:11 +0000
Message-Id: <20221223021025.1646636-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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
- qcom,sm8250-dsi-ctrl
- qcom,qcm2290-dsi-ctrl

Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format while we
do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 26 ++++++++++++++++---
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6e2fd6e9fa7f0..98d54a7ee28d4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -14,9 +14,27 @@ allOf:
 
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
+              - qcom,sm8250-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+      - items:
+          - enum:
+              - dsi-ctrl-6g-qcm2290
+          - const: qcom,mdss-dsi-ctrl
+        deprecated: true
 
   reg:
     maxItems: 1
@@ -149,7 +167,7 @@ examples:
      #include <dt-bindings/power/qcom-rpmpd.h>
 
      dsi@ae94000 {
-           compatible = "qcom,mdss-dsi-ctrl";
+           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";
            reg = <0x0ae94000 0x400>;
            reg-names = "dsi_ctrl";
 
-- 
2.38.1

