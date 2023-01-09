Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B50F661E4E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 06:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A751310E27F;
	Mon,  9 Jan 2023 05:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E515310E02E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:05 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bq39so11321707lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6j3S7ZfZt79laxcOO2PFYBLa/Z6A+qmxeC1KDED7sL8=;
 b=oSyQG4xjghAFe5BeNAxkXrPHviyt2PqKW+Ydrulyja+wQRiM4a2yljXPu1wpgeZNI2
 JNbmB7OxB6v9P1zX4ugqS249veH4ZksCgaWuaUX8O3vlyceDaziXumO3QZCPeUGukCqh
 LYjCQSZ8exPZaLvWl0KThLL38DK9mOEZSp0BHYiV/ksdUcPX1Xb59anr+34U82kNMOSj
 37wfYHpHeLcmyQH0w7uq3zx3UU4XHbNefRv4BwV7meqaXP2sqwYJjIbR9Ar9GTSWCQ+F
 XYm7DWgr427XkQEC/DoSZiPYfiA3JYqrQneZgAlnXyHuvDSYZADt9onIq5m/duYMggzu
 RahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6j3S7ZfZt79laxcOO2PFYBLa/Z6A+qmxeC1KDED7sL8=;
 b=6TOB92PCxqUqWSMOuuJns1eNaDyZp77NWo+MOMcMLgXXb/LW5+itFDMOjqPwucDOdY
 5K7FeORTxaysdHV+0ph7xSzlSAOw5nRvCB+NaRNpSY/x/8kTdeVzPxGj2QmYGSnicRrR
 eagK3/XM2ku7OS4MDUVeYEECgPsdjHLi04gjWLpOPANxCPVvBB4OZrJhgrhEU/IWxmYZ
 Am0NYq3/brjubcKBMdREME3HTMg61ZyL0vXij68FXjLLsbTC2XpcHx9RO5UrJ8jVOx+m
 sVQrCC3qC8tvlikt6xqBdMh0wGXQgMlFSJRkOp3zCfv8IGLljX7FcbZBIfQ29AAkKrO5
 a0XQ==
X-Gm-Message-State: AFqh2koFSwNgcwGr0H1baaFzwDNnO2GtOExTdr2EiU59ajI3O3HvbcnK
 7/ePqgzEH+v0k00z2GuXE68GFQ==
X-Google-Smtp-Source: AMrXdXu0isL5foK19ys8/rnpFm9CLtEupl4pSAdxmmS6kYIT5Rkrj89T3++VRmHu4Q/xP9vkzzEVCQ==
X-Received: by 2002:ac2:5088:0:b0:4b5:688e:ee10 with SMTP id
 f8-20020ac25088000000b004b5688eee10mr18850976lfm.16.1673241244314; 
 Sun, 08 Jan 2023 21:14:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/6] dt-bindings: display/msm: rename mdp nodes to
 display-controller
Date: Mon,  9 Jan 2023 07:13:58 +0200
Message-Id: <20230109051402.317577-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
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

Follow the 'generic names' rule and rename mdp nodes to
display-controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-common.yaml       | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml        | 3 +++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 6 +++---
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 870158bb2aa0..3f953aa5e694 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -13,7 +13,15 @@ maintainers:
 description: |
   Common properties for QCom DPU display controller.
 
+# Do not select this by default, otherwise it is also selected for all
+# display-controller@ nodes
+select:
+  false
+
 properties:
+  $nodename:
+    pattern: '^display-controller@[0-9a-f]+$'
+
   interrupts:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index 681d6ac48d33..cbe4d3597f26 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -33,6 +33,9 @@ properties:
               - qcom,sdm660-mdp5
           - const: qcom,mdp5
 
+  $nodename:
+    pattern: '^display-controller@[0-9a-f]+$'
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 47fde9b6779f..1a2f639f8a9a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -105,7 +105,7 @@ required:
   - ranges
 
 patternProperties:
-  "^mdp@[1-9a-f][0-9a-f]*$":
+  "^display-controller@[1-9a-f][0-9a-f]*$":
     type: object
     properties:
       compatible:
@@ -180,8 +180,8 @@ examples:
         #size-cells = <1>;
         ranges;
 
-        mdp@1a01000 {
-            compatible = "qcom,mdp5";
+        display-controller@1a01000 {
+            compatible = "qcom,msm8916-mdp5", "qcom,mdp5";
             reg = <0x01a01000 0x89000>;
             reg-names = "mdp_phys";
 
-- 
2.39.0

