Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF1E6C7B5C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1CD10EBB7;
	Fri, 24 Mar 2023 09:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6515910EBA5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 09:28:52 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j24so1090110wrd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679650131;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YClmJDKz6cZns1Ia5c/sLtO34LHFlQQl6zHxRMVgDX8=;
 b=mr6ClSCp6Tr1hWXkuQ+WvJcUgf8qbHXaE6mQqhEasdKrCz/keIHhDzxYvqHBKKjZGE
 WmzNct1x11dzJMvPVuGjXkHyA2g2wVnTMH8bZITHLp6EDB6HsiaAhOHkGuBaWvEpCXgC
 8a/73zAqmcAo8Jq44FpiAPL2hXvBp777qRpMasj4dOSz0eMHTYSras+6/MALwDFhib0a
 bkuWyakWMjpD05mlRHr/9oJgW44oIDJvnKaYD+glDArKfsrDbtmS4j0BFC+bCb4Olu+i
 kuPtTBEE/xP1dtHkkQvvQic4fOFxw/C8a4iEekioF0f0WU3h69lhmOcI2pNEd4z4bZ9t
 qc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679650131;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YClmJDKz6cZns1Ia5c/sLtO34LHFlQQl6zHxRMVgDX8=;
 b=POv4UPSIrma/49GSIpAOTHVvOBGmBkugsb3MhIvleEx8oBQ3sDWjeh0yidsW9/AE56
 PRc2fBXE0E/otCdRs5kLR7LAr/szKaUDouOGhws6Z8Zg4Sx2XwrGD2vce9JxTXmp2/h6
 zihuXMGJxX/kKb+MosKUYXN+Z3Eco+0bYcvWa6dxpQkIg78fw5W21xuIdTEpEfvaaP5/
 aBD3HdP+EH68GJHdZ/ROYSEDiQBTJi5V/Gj2uFG+Ts3OzIn10x9L2CUbaIetyRrdXHmQ
 8rEVFtdy9pfKWTLciG/7W6ah+Ut8qZ8Q2YsLqH6ASGtvj7kp59defhUFBDhfzErvAjUE
 wcxw==
X-Gm-Message-State: AAQBX9cprUPCguOC6Avmnme0giUT4+ngjNq8M74QbVY4g+dnJ5rmLbLc
 qbpuA6vp9niAjzDKPMhtLYFRHw==
X-Google-Smtp-Source: AKy350YPqtf7wMdZLg60x7SHKleSr8f4qz+JIvgKdsMXSPhn/X6wC4nfLVIdzdPM+av+LAOKJUEokQ==
X-Received: by 2002:a5d:570b:0:b0:2dc:d670:5351 with SMTP id
 a11-20020a5d570b000000b002dcd6705351mr1690298wrv.62.1679650130755; 
 Fri, 24 Mar 2023 02:28:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b002c5a790e959sm18029980wri.19.2023.03.24.02.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:28:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Mar 2023 10:28:46 +0100
Subject: [PATCH v2 1/4] dt-bindings: display: msm: sm8450-mdss: Fix DSI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-1-0ca1bea1a843@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI compatible changed between patchset revisions, but that wasn't
reflected in the bindings. Fix it.

Fixes: 0eda3c6cb1c5 ("dt-bindings: display/msm: add support for the display on SM8450")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 4c6929e2534c..f26eb5643aed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -54,7 +54,7 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-phy-5nm-8450
+        const: qcom,sm8450-dsi-phy-5nm
 
 required:
   - compatible
@@ -254,7 +254,7 @@ examples:
         };
 
         dsi0_phy: phy@ae94400 {
-            compatible = "qcom,dsi-phy-5nm-8450";
+            compatible = "qcom,sm8450-dsi-phy-5nm";
             reg = <0x0ae94400 0x200>,
                   <0x0ae94600 0x280>,
                   <0x0ae94900 0x260>;
@@ -325,7 +325,7 @@ examples:
         };
 
         dsi1_phy: phy@ae96400 {
-            compatible = "qcom,dsi-phy-5nm-8450";
+            compatible = "qcom,sm8450-dsi-phy-5nm";
             reg = <0x0ae96400 0x200>,
                   <0x0ae96600 0x280>,
                   <0x0ae96900 0x260>;

-- 
2.34.1

