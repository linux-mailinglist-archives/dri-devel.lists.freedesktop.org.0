Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F3671271
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690AD10E66F;
	Wed, 18 Jan 2023 04:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A237710E667
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:12:49 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id vm8so80236171ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlAOuwT6a0+kLlug0pSdWU2MG7aHOg98XkEv7Zhzzdk=;
 b=HnMtNU4Y8dkcp72PJN26efwS6aMQk0M30koPe6RBIgDg9Q+6WF+95IATz1M8FvE03K
 HaEslUbJIvBfgSy+xl4dMJ9N+Zus439odBrmdXF73gfx+PfdXohykJahlEfg20Tv/uxo
 8qHH+bk0t1S9phZFhC2R1TitG2M0g8YFLOTgWGuSuUpd73UYxVDp5xA1eAZc2MvxeihJ
 aWfAXqg+MOF00/7bBjDxWmmcRMnH+97ADBKZaCCEHRCpp0w5AzBk6zaiOAmNHXuxK2ns
 WQTtdKgEUlwy5ALxpn0zsLI9zKZFPh0vhRufSo9BzdhQhhABlb/U71EUIj1vgLWH3GQT
 LM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlAOuwT6a0+kLlug0pSdWU2MG7aHOg98XkEv7Zhzzdk=;
 b=bT09y4OOLoHEG1vMzwBf3ZXp9b0ftuEP8P6zi8vnZ3fZFbUVr2ZiyWEoW5V2lAlMDl
 zldGhUBnzS1Ui1Fu2taSvCRNcoIEHK6KEmpxZzcSduuOzZJ4luFgftD5MqsUcPvD9wdi
 z6p05zp/asiHNjIU361f6kh9WGewWz963om1M/6+BIpJRpQR/+2JQKoy2CBBcgudUF5X
 xZMcpEo9oM2HAv4EgWQWUxCaJf7tsqQ99m3+QTnyhGpFB7tw+8ZOE6F5Qacgyvv+3Xq5
 WM87bjp+nXTxOj7wO6AUUd/REjkNEkq3iGEKF+7MGno9GUluDJFSzs+BPYdbPKpS9zx2
 /PAQ==
X-Gm-Message-State: AFqh2kq5CrsADxIeedNqCwtDCI9UpfpC67Dt02FIm1u2coGmrOHaS9rV
 T9jncjvjXHCb99qStCqi/48hGg==
X-Google-Smtp-Source: AMrXdXsS5MGtLfe/3lDjhg6BD1CRnNYyo8jZwtVgfKoSIPFG+TmSJn/SOyLf1YcMgbL3Ax8ssAnIPQ==
X-Received: by 2002:a17:907:2096:b0:7c1:2075:199a with SMTP id
 pv22-20020a170907209600b007c12075199amr5586276ejb.76.1674015169276; 
 Tue, 17 Jan 2023 20:12:49 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:12:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 03/11] dt-bindings: display/msm: add core clock to the mdss
 bindings
Date: Wed, 18 Jan 2023 06:12:35 +0200
Message-Id: <20230118041243.1720520-4-dmitry.baryshkov@linaro.org>
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

Add (optional) core clock to the mdss bindings to let the MDSS driver
access hardware registers before MDP driver probes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdss.yaml       | 32 +++++++++++++------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index d09842db3825..461cb13c7092 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -44,18 +44,30 @@ properties:
       The MDSS power domain provided by GCC
 
   clocks:
-    minItems: 1
-    items:
-      - description: Display abh clock
-      - description: Display axi clock
-      - description: Display vsync clock
+    oneOf:
+      - minItems: 3
+        items:
+          - description: Display abh clock
+          - description: Display axi clock
+          - description: Display vsync clock
+          - description: Display core clock
+      - minItems: 1
+        items:
+          - description: Display abh clock
+          - description: Display core clock
 
   clock-names:
-    minItems: 1
-    items:
-      - const: iface
-      - const: bus
-      - const: vsync
+    oneOf:
+      - minItems: 3
+        items:
+          - const: iface
+          - const: bus
+          - const: vsync
+          - const: core
+      - minItems: 1
+        items:
+          - const: iface
+          - const: core
 
   "#address-cells":
     const: 1
-- 
2.39.0

