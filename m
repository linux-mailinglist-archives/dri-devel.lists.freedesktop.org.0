Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F528655D0B
	for <lists+dri-devel@lfdr.de>; Sun, 25 Dec 2022 13:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8738810E0A1;
	Sun, 25 Dec 2022 11:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC21510E0A1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Dec 2022 11:59:29 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id z26so12877769lfu.8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Dec 2022 03:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QoHjYxSm5ByPPU3rXPqyaHILsigyYZJ74qAbEPSVB+M=;
 b=J7FufkiDRkEINC8Gt58nisN3rje7VKzHjm0Y2nZuZVFaYMYaTGbRb+rcZdc5da46CZ
 sPOS/8nakYHqukyrflPdqAyB1obF5iGCpcBpY+1rqpgSOBBTCjwuZtbbkdUhgltHQ5oa
 3jP3QK1koo2KflWO2fcI4ZZYJKHaYs85cKu8MeYs+ujzJie0TSebSIqqtvkNCff6tb/o
 uVneopfiux86OrxcojwKgd/MXvZS0a7ZabtoPIrTtE9EBt6WMkb9zYfV3VYwFanBUiuT
 2DY2GYpyG0vMZJ6zcSEl8z3ScLMp122UZEAdKBp/rXODTspllPQg5PZblJlVlVwcQ0ua
 f0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QoHjYxSm5ByPPU3rXPqyaHILsigyYZJ74qAbEPSVB+M=;
 b=AjM16NnhereR5x8ILmsv/4gOxsHeb93MdMsbdIyFpIWhSTLgsSyDu+/enJTRhKQ9h0
 AqgRTfZMBrkJVo/E8mJ9Q8pEkrK+4helpEORxXKTKI9ob7QfF7T6jtS8VkCWi1e6M+DN
 MIi8tPxrUwLyydUzcqJSipZ/E8bnFgvVx3SSBBPC7IcEeShHhrIIyUcDzzfjXCa6g1xo
 +bWEFNPPQGjfS1JDwK6QmsIkyC8eGf+dBpgIu0uzGQvH3/DC/YjwRQrcGmG9NVMcXAu0
 U4eoticpX9rqP/bELGY7QcDsOVHekeXVTF4odX48e8RbgENmJIfyROJaBbwaZjGP3iaM
 Ng6g==
X-Gm-Message-State: AFqh2ko4rfwidIyuHIroCMZi/q1e8gf6hbRwI1VM2fb+1AmTCnEoqdfL
 ay4SZj/OXkgfqwZ2dYcZuwcUTQ==
X-Google-Smtp-Source: AMrXdXusR/1RsR/BHNuTxneqZxl75p5aLUZv3Za4nw34vAwEdgg+Lu/pyBTVHUxbme3k1Tt8tMmW6w==
X-Received: by 2002:a05:6512:1514:b0:4b5:7054:3b55 with SMTP id
 bq20-20020a056512151400b004b570543b55mr4884300lfb.68.1671969567857; 
 Sun, 25 Dec 2022 03:59:27 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 r4-20020ac252a4000000b004a25bb4494fsm1336911lfm.178.2022.12.25.03.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 03:59:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: msm: drop redundant part of title
Date: Sun, 25 Dec 2022 12:59:24 +0100
Message-Id: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Devicetree bindings document does not have to say in the title that
contains "DT properties", but instead just describe the hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-phy-common.yaml    | 7 +++----
 .../devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml  | 2 +-
 .../devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml  | 2 +-
 .../devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml   | 2 +-
 .../devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml   | 2 +-
 .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml   | 2 +-
 .../devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml   | 2 +-
 7 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
index 76d40f7933dd..0f6f08890e7e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
@@ -4,14 +4,13 @@
 $id: http://devicetree.org/schemas/display/msm/dsi-phy-common.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Description of Qualcomm Display DSI PHY common dt properties
+title: Qualcomm Display DSI PHY Common Properties
 
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
-description: |
-  This defines the DSI PHY dt properties which are common for all
-  dsi phy versions.
+description:
+  Common properties for Qualcomm Display DSI PHY.
 
 properties:
   "#clock-cells":
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
index b02adba36e9e..727a20c4375c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,msm8998-dpu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display DPU dt properties for MSM8998 target
+title: Qualcomm Display DPU on MSM8998
 
 maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index a7b382f01b56..a2fd9f8e456c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-dpu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display DPU dt properties for QCM2290 target
+title: Qualcomm Display DPU on QCM2290
 
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
index bd590a6b5b96..2ade94a216a8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,sc7180-dpu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display DPU dt properties for SC7180 target
+title: Qualcomm Display DPU on SC7180
 
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 924059b387b6..9481f68d50d7 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,sc7280-dpu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display DPU dt properties for SC7280
+title: Qualcomm Display DPU on SC7280
 
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index 5719b45f2860..a2f305b04ee1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,sdm845-dpu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display DPU dt properties for SDM845 target
+title: Qualcomm Display DPU on SDM845
 
 maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
index 4a39a3031409..6ad828a20332 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,sm6115-dpu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display DPU dt properties for SM6115 target
+title: Qualcomm Display DPU on SM6115
 
 maintainers:
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
2.34.1

