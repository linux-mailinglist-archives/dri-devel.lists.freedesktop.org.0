Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAE05095B3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 06:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C4510E4B8;
	Thu, 21 Apr 2022 04:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8035910E45C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 04:13:47 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id a10so4366216oif.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 21:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VvonfvZ7LB6aLy4wjty29l8R5C37JLm7o1EML3W0CCw=;
 b=g45lqDkJ/wvyiDbt549UbOl4EexQg+Opiy33qRcMdmUnwYletPFwpZCsTiGUr5H5jE
 NFI8vIDyfZCqrUGKl3w6uzjhnSitd6TMyxCfutUrVDV4AE8zWQ6sMRbQJ5BtSdpo94GM
 ZAgc44FcZm315lDNAEcGmx2Hjr5AcHB/KOxyDJChXjRhScCRifUZiqYsU22hKLN4MqgX
 Guj20eDcjNRZSDR/cJQ+jNz87K7acXrKliJPl0pXfM2HONp5SsH5Qx1JbW14MpdCor0T
 iIbGUTUFcKn1LBJ5TgOCYyxj60HX76l1PFbruft5ftllMsn7gq1IY5VxGNzUeL9lwqHu
 ziXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VvonfvZ7LB6aLy4wjty29l8R5C37JLm7o1EML3W0CCw=;
 b=rhj0jsCA8ZwIZyuiOCSNqSpeWGsDUHr8J/IjxggmXspqwn0VWMLIckNB7Y2zTtnzW3
 7+Jp4rbzEeON8wYGji9Lu0wMQsgzUEEm572nqvmJPa2SAIg0pYW+SXmNgvoocYfZhffI
 YzKH/ed7QfcjC7fBGUh72G2lvsA9GHYR/8rUoVg8tIJPnp4ipBWE+DX6rlY2ZL5MvB1l
 BUO00zv8/3SYH1rHeerPPp5vjJqCJ9Qe9TJYn4gNeeX3JRLVnWm1FGA66p1tH6pNPOPn
 OLL5aVU3K9IUum/e2yzbxPm2wwNSoFZRFqksnCXfcDt1N7hcpIzYoDNjyhHUa9zTUCus
 vCEg==
X-Gm-Message-State: AOAM533DlX50e9lmQaZxXAW5QWkmz+EDaHK/6c21pQ1KwPb0FAKW8P7C
 z+H9URCXcnrGF7S2JS8ynVW/nQ==
X-Google-Smtp-Source: ABdhPJyfAjep5BALu93JuedvIOa2GKA4DK1inJPuUOVfulw9xgmddkM8zQM4uyWjFYtYVy5qA9L1Ow==
X-Received: by 2002:a05:6808:1312:b0:322:7d72:9006 with SMTP id
 y18-20020a056808131200b003227d729006mr3455595oiv.244.1650514426736; 
 Wed, 20 Apr 2022 21:13:46 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 h186-20020acab7c3000000b002ef5106248asm7115512oif.45.2022.04.20.21.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 21:13:46 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: display: msm: Add optional resets
Date: Wed, 20 Apr 2022 21:15:49 -0700
Message-Id: <20220421041550.643964-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an optional reference to the MDSS_CORE reset, which when specified
can be used by the implementation to reset the hardware blocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- None

 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 6fb7e321f011..734d14de966d 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -66,6 +66,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 12a86b1ec1bc..b41991eaa454 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -65,6 +65,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index fbeb931a026e..6e417d06fc79 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -64,6 +64,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 0dca4b3d66e4..1a42491efdbc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,10 @@ properties:
 
   ranges: true
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
-- 
2.35.1

