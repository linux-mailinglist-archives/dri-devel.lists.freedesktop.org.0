Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0306520CB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C5D10E3D9;
	Tue, 20 Dec 2022 12:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2936010E37D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id o5so11607612wrm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7U4CGtf/Ju09Jbzb4QB+ZvkuzO+a1Kfzp82haXBgZc=;
 b=hlBWHxGW3kYwrRrztRl9g25tkWVLHBYLmcG87nCSCI1spGlnexbL7jyKA+6WFeclMZ
 YQZ+lXHITTUBgVALtCHEtkcjOYPZWa2OLvHUWAfrJjM4wmEl8rjrSIrZSbHOddKnXyEk
 PMfifyPmtrSS28zFX8b5wdVw2H/DOUs6aZ8T2ADqf9WmzmFuBKc/9qe7eq1dKRu/ncVR
 S9F+oEY2wUFiEgeH89t3zY8CGn4KZEAcB/L2xs/2XLWHIoVaBVYJPygH5eo3Ilwhze/H
 bBr9b7uHYR93Vhh9K9wrF2zJlncawicAKCkvYMHBUtljR1t36PSAjwHu1Czblk9C6lnu
 0Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7U4CGtf/Ju09Jbzb4QB+ZvkuzO+a1Kfzp82haXBgZc=;
 b=B8kkxHy3jP9rRFRO6iPkkWhcKz7nnwqTF+GuAOoTjvo8NfnDXhcAzHdiDriS6vpZ1E
 Jl5r0c1EMcx7XmA9n1RnDv8t2Q0vnfhP2AkzrGztm8TlIyUWVJVdnzanDVTeZltbEGOV
 u5qxGlxyMBISUM4AEQ1u9tPEy3dzoy6seeiHxV6oVRwXy43SzzrYsu1fge5Un0pRmiwK
 /fPMK6TtpeLMWp9TXBvqT2VaTOAUVthxk4PiaPyB0aj7GJYjBxCIUF7DGpVSulBZAPbz
 pbMVMVfwCwmcU3m0Z0m8aMxiUn2OPi8dhe9BmjETU9ACt1sbwCwpaBbbJlR9OaVakqHh
 IJwA==
X-Gm-Message-State: ANoB5plH9m12jLDEyWd9O59TGYJqD2pdPz3E6VY4Nf6A7e/ATKSiy+1k
 ZAqTCDUWKHb7+OvZybd28ywZWQ==
X-Google-Smtp-Source: AA0mqf4/rduBkEMjCAmyHkOs90ejtZKYKZt/P61s/Qfs66FMjyrUGzd93dJ0vFMqGca2ksOiSp/xzw==
X-Received: by 2002:adf:fb48:0:b0:236:57de:1462 with SMTP id
 c8-20020adffb48000000b0023657de1462mr27175174wrs.29.1671539807669; 
 Tue, 20 Dec 2022 04:36:47 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:47 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 09/21] dt-bindings: display/msm: Add list of mdss-dsi-ctrl
 compats
Date: Tue, 20 Dec 2022 12:36:22 +0000
Message-Id: <20221220123634.382970-10-bryan.odonoghue@linaro.org>
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

Add the list of current compats absent the deprecated qcm2290 to the list
of dsi compats listed here.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/qcom,mdss.yaml          | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index ba0460268731b..86bb43489bf4a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -94,7 +94,21 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdss-dsi-ctrl
+        items:
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
 
   "^phy@[1-9a-f][0-9a-f]*$":
     type: object
-- 
2.38.1

