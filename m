Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD359E574
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 16:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A93A10E17E;
	Tue, 23 Aug 2022 14:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E436E10E758;
 Tue, 23 Aug 2022 14:57:33 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so9955549oti.9; 
 Tue, 23 Aug 2022 07:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=X3oSNHfhYN1D8nj/Tus+6OMR/7Xdc3qc/TG8fQDrSaM=;
 b=YAboZEvnoKzkqkH6ZI8DkxYWPSTI0BUxWE2Xo4LBCQHDIN3iwpcQzNdDs+G1y4zqLl
 HYKjdibh/7qDPlw5apLdW3mywlAHTz0GHiz6vxCKlZ62Sv8V6S/xcsKP7weYLsKqtcZt
 m1IBLPa1Ib5EmAyC1kxQQ8xdAe2ksZdmvGP0KhRcn+MZ2HnzhBOcxBAsPDQWou/caTiB
 tSuf9owfjZMpG2qBF/bAxaBejEUiB/NNhmvis7kJ0VX/Ue6CJWLMRPSHsyE2cJ+zuPG2
 o16rMIC4pyL3nSS19yz01228AjGNbkt84ZnKkmaWeeYic5vsymE6Jt5TFeV3r/nOSyaF
 FKfQ==
X-Gm-Message-State: ACgBeo2HLDxJRt0wuWTk3BopVSzEkwO02KY1S8Yy8z/+LQBhfVvYUN5L
 eUqndF6Joxq3PDqllyUERg==
X-Google-Smtp-Source: AA6agR7DQBou8qC5N4MzG6OFDfSyxvUBlmCTQHSauVZ73UWGC8xCB14yWHMhag68xgrM7MZHRX63/g==
X-Received: by 2002:a05:6830:6999:b0:61d:26f8:94c1 with SMTP id
 cy25-20020a056830699900b0061d26f894c1mr9511714otb.278.1661266653059; 
 Tue, 23 Aug 2022 07:57:33 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 07:57:32 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: "James (Qian) Wang" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] dt-bindings: display: Add missing
 (unevaluated|additional)Properties on child nodes
Date: Tue, 23 Aug 2022 09:56:42 -0500
Message-Id: <20220823145649.3118479-11-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to ensure only documented properties are present, node schemas
must have unevaluatedProperties or additionalProperties set to false
(typically).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/arm,komeda.yaml        | 1 +
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/gpu.yaml           | 1 +
 .../bindings/display/samsung/samsung,exynos7-decon.yaml          | 1 +
 .../devicetree/bindings/display/samsung/samsung,fimd.yaml        | 1 +
 5 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/arm,komeda.yaml b/Documentation/devicetree/bindings/display/arm,komeda.yaml
index 9f4aade97f10..3ad3eef89ca8 100644
--- a/Documentation/devicetree/bindings/display/arm,komeda.yaml
+++ b/Documentation/devicetree/bindings/display/arm,komeda.yaml
@@ -58,6 +58,7 @@ properties:
 patternProperties:
   '^pipeline@[01]$':
     type: object
+    additionalProperties: false
     description:
       clocks
 
diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 3a8614e0f627..84aafcbf0919 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -51,6 +51,7 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: |
           For LVDS encoders, port 0 is the parallel input
           For LVDS decoders, port 0 is the LVDS input
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3397bc31d087..0179c816fa6d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -81,6 +81,7 @@ properties:
 
   zap-shader:
     type: object
+    additionalProperties: false
     description: |
       For a5xx and a6xx devices this node contains a memory-region that
       points to reserved memory to store the zap shader that can be used to
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
index 969bd8c563a5..dec1c9058876 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
@@ -37,6 +37,7 @@ properties:
 
   i80-if-timings:
     type: object
+    additionalProperties: false
     description: timing configuration for lcd i80 interface support
     properties:
       cs-setup:
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
index 5d5cc220f78a..7593938601bb 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
@@ -40,6 +40,7 @@ properties:
 
   i80-if-timings:
     type: object
+    additionalProperties: false
     description: |
       Timing configuration for lcd i80 interface support.
       The parameters are defined as::
-- 
2.34.1

