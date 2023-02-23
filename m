Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F2A6A07F8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2A710EB38;
	Thu, 23 Feb 2023 12:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FC010EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:06:47 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id e9so10563362ljn.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 04:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K4YZhIq9YW/FxqiUeK4bZw1x51EA5wPW9LCdn2zDvdc=;
 b=OohLjLKJXyjraOAySmUv+UmUZOeAqv0jpujjxE8+ocLORTL2AXpQkvVd5IKmcnbI14
 SzPbv4PrLCCbBfbotURghv6LoMk+jJH2fADhyx192N1q/Pw0pNNrie1Qw+zFOfad9lx8
 79/2kZG9Y70Zy3UT81Cc/xZX89mwyKmN3/6mDTexIXgQ+GY3CGB8BGsd6aMFvA2/07FJ
 0RR0DmLmij1wb6xEpWSGuB03PdKUSVcbMYDc+H7nti1MEo1cUGrkE9/zZz3NG77iUwOy
 dyYs7MreM4JQO50+Af39oL+xwv+Iu0+0pa1K9eLUYA28MLN2qVYzH6q20kuLsNBBZfBv
 JRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K4YZhIq9YW/FxqiUeK4bZw1x51EA5wPW9LCdn2zDvdc=;
 b=vxcvBuDGxjVpXWleyh4tn8RHt5tyJkQpiVVZeVOrJpjVGoUR4VJoI+Y9pCA9rrByS+
 /o+P01A4BYcKRxYb8fshfuwX5YjcWVSM72hjvptiewtAlunwJZoYe8vwMwyR2XYEnmL6
 xxyMdt9e/uMTkN5jxAhhKgfC/cxaThcjAvXG2NnNQ3OaBfHtcwLCDIujrH2gdC/Ay5Ti
 8FhlI3JiyID0dP1sywJCgocbWZ5j1ulcTv4WGq+g6f360lWGcqKV9ZO0o6BrRmwzlRHV
 pTcPnU5MgorZImthM8q0g5N0hPi0q0XOX2oVafbEN63zPYEiQEC+GNA2AseiznWgIQ89
 lfIg==
X-Gm-Message-State: AO0yUKVlUX09e3UAGJ+cLPa7b3Dhlpor+ViSioLWqr9/kbr0H+bBXi/N
 nznBTu0B9aOHEUQt8a/8MbM89w==
X-Google-Smtp-Source: AK7set/IoyMZjZzt4A4lV3MF5z2ACmTHA5JBD9wWI5PQ1ERTAqq4xAvNRkIyljJW3Fmd0z0wwTGnFA==
X-Received: by 2002:a2e:9c43:0:b0:28b:6f21:d929 with SMTP id
 t3-20020a2e9c43000000b0028b6f21d929mr3786573ljj.32.1677154006004; 
 Thu, 23 Feb 2023 04:06:46 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:06:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:35 +0100
Subject: [PATCH v3 01/15] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=3199;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OIF3FsTi5KZskII9c6hJUDloiyLRqqB5VQtoA0QmTtI=;
 b=dmENyDnriBzpDTZ/hIUGR6DQxTsH8p61XQNnYXfjQwEfZZ9ngl3L7w9SMdpp+lueOdSvjcYs3NXl
 6r1QPtrNAmBbqGp7SUn+vCOg4vhyL0O/ePwkzd4hgzIahrAmm/v0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
specified under the GPU node, just like their older cousins.
Account for that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 63 ++++++++++++++++++----
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index d4191cca71fb..e6d3160601bc 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -36,10 +36,7 @@ properties:
 
   reg-names:
     minItems: 1
-    items:
-      - const: kgsl_3d0_reg_memory
-      - const: cx_mem
-      - const: cx_dbgc
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -147,26 +144,72 @@ allOf:
                 description: GPU Alternative Memory Interface clock
               - const: gfx3d
                 description: GPU 3D engine clock
+              - const: gmu
+                description: CX GMU clock
               - const: rbbmtimer
                 description: GPU RBBM Timer for Adreno 5xx series
               - const: rbcpr
                 description: GPU RB Core Power Reduction clock
+              - const: xo
+                description: GPUCC clocksource clock
           minItems: 2
-          maxItems: 7
+          maxItems: 9
 
       required:
         - clocks
         - clock-names
+
   - if:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
-
-    then: # Since Adreno 6xx series clocks should be defined in GMU
+            enum:
+              - qcom,adreno-610.0
+              - qcom,adreno-619.1
+    then:
       properties:
-        clocks: false
-        clock-names: false
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: gmu
+              description: CX GMU clock
+            - const: xo
+              description: GPUCC clocksource clock
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
+
+      then: # Starting with A6xx, the clocks are usually defined in the GMU node
+        properties:
+          clocks: false
+          clock-names: false
+
+          reg-names:
+            minItems: 1
+            items:
+              - const: kgsl_3d0_reg_memory
+              - const: cx_mem
+              - const: cx_dbgc
 
 examples:
   - |

-- 
2.39.2

