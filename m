Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815E671275
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9AB10E670;
	Wed, 18 Jan 2023 04:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6083D10E66D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:53 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id vw16so17122134ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HSpGY8OBvDU8g61I7cBvuZvlMJBnz3vM71dI47Sckdk=;
 b=umPE4AvJFzFup1YJdR8FYgH42QOyavUcFUC8NPvQKGxr3o7xpeudm/Ij+fszy0rbqb
 PnulAkgYVI0Bc2nWvA5vjgUph6b8dW62AgRAVSIf3hvr1FqH7kCE/FRtiePG/D3l5LNI
 M0AoRiy3dck2kHv64qPbwORMNqv1R7bK7VajLm/sk+vhRxbiU07RiMSJ5q7LZ1VtKMn3
 lX2KDny1CLvQH24Ta/qg31vXSFwwm1yRgByDLhi4Tz5/+VzfTvT0RM9Izi1p1na2gwbf
 L27vd/zaz3qT+zbN8mjGI4SqRyixOIs/WQuDvlDka0bfx+h+KZWhpyIcHayAiGw98YBj
 Ut3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HSpGY8OBvDU8g61I7cBvuZvlMJBnz3vM71dI47Sckdk=;
 b=wT9mkv6YPjOXqoTuaz9r/AXVcs0rD6HDvAfCf63F+Tui5KwoICqf6FHdsTaIAM+nuh
 3BMfziN9b+RpXqwsYLNLNmW9dJCWLgy2DM/ds2Ug2o2f412MibaD5ZqSBiZbOsw984oT
 oZameuqpYxHT+LScUmhWcTqhGoazdxse89EcylHOgP+ih6N6YqCRUHJ9XfoHY7HuZ1th
 heVQ/UvHpOn62nSTIEsjMI02AK44zVI52NsxNo72DtUa1botpowl+at61h2LId4psxA4
 ePQtdj7kWAmldVD3NJ1yVqGRmF8Vcaf4gPQAOWfHQPe31DLIro68tQKjv+sdyqHBP28w
 roqA==
X-Gm-Message-State: AFqh2kpOCLnCavb07OFPZ73o1a95u0SAEQKBJbpf1NkMplSDmq7KcHI5
 xNK9zQkkV0Lf1S+2UpmzaiVD8Q==
X-Google-Smtp-Source: AMrXdXsmismhuZGGoEJBSVO9ZjZwCqvTZ81ImsssxstGyCA74xmfyOyZnQoGM+ZlY2SAYD9ODu+/CQ==
X-Received: by 2002:a17:907:c30c:b0:86c:cbfd:936 with SMTP id
 tl12-20020a170907c30c00b0086ccbfd0936mr6616799ejc.11.1674015171724; 
 Tue, 17 Jan 2023 20:12:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 05/11] dt-bindings: display/msm: rename mdp nodes to
 display-controller
Date: Wed, 18 Jan 2023 06:12:37 +0200
Message-Id: <20230118041243.1720520-6-dmitry.baryshkov@linaro.org>
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

Follow the 'generic names' rule and rename mdp nodes to
display-controller.

Reviewed-by: Rob Herring <robh@kernel.org>
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
index cb7bf48c3a58..ef461ad6ce4a 100644
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
index 7dceb2c54edd..ef89ffe9b578 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -99,7 +99,7 @@ required:
   - ranges
 
 patternProperties:
-  "^mdp@[1-9a-f][0-9a-f]*$":
+  "^display-controller@[1-9a-f][0-9a-f]*$":
     type: object
     properties:
       compatible:
@@ -171,8 +171,8 @@ examples:
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

