Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFDA98EB2E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 10:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9318210E7CD;
	Thu,  3 Oct 2024 08:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BQW6kGA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803A610E7CC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 08:14:35 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-37cd2cb5615so48897f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727943274; x=1728548074; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eXlZz7rmb9UIZ/1Ho16Xy2pZAX3UIBne7+DPquCei2E=;
 b=BQW6kGA0o9CM29usu5zboHmEHhO9ghgwh6BkhuC4ren2VmD9I2TRCyRUBHNqb+MSbw
 U9HUCr5kXVgNoQxnOspwQyKYGg6mWgaKh6ghOG8J5AvImqO2BtpjmbCGpzqo9QkHWniq
 RzJNW26HHc3yEyBGQIw4twtbhE3q25/pdPao7L3T+Or15oPO+dL/y4C6wu6RZDEc6SHh
 NgH1ziY55m6d4cIrhxrE5M85nzNUt4xophVTeJvZkbAMpN1E0cmubhD35BF1ML/0VwV/
 3HyB6C99pZ8ZOioVSYpPOq7zCfFZP2/tHIwZETQ+a0axMWKeOCKKIyLgIYTmuq7d5L/R
 TRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727943274; x=1728548074;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eXlZz7rmb9UIZ/1Ho16Xy2pZAX3UIBne7+DPquCei2E=;
 b=RHeEmZL+SDbFkn2E9QAo+8aH1NRxstyuEUPou0fr9a/Z3F9+a5f74fL7dTUyvw7PmM
 swVrsjgc0Qk5OA8fEUi1O8YdrojzELgTdWvsTto4qIC4KT93mJa4xjn+1zjvI0lL19Rg
 zJ7m8br3sj0oKAqrP5Gs+nqueQAr9VRv4l7+HO8hH64jEnMP5lOpg7nLYvbCm0XzfBvz
 SKSlsmYztDC7Om+k1AtakTfDNFvadwnSwlw7wkNqrrbI/MLM2qJoDErhuQwQILkdHe92
 4CX50EEZynWzfqscD5Us28I9qB9J1ZpKXddzKsnoXOUlHdnDfEcGDRswAukY/7/eWfjq
 zKhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQfN4q6lES8xH5vBCB4yj5kUVYjI9rPuN/DnXhCcjpTqLRAoGLzQ20mispe/ZmpCnLdMk8hDDhqyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyB7tKcCsoiTcqBlVK4VE9QaCJff4xsw/xXLOSboN887CU8Ezd
 bRbQO5kqGfEcspdir7AIzcN3GSnNkCiw8jBcHiPWc25XcU7pxhxjehcGweRwRIQ=
X-Google-Smtp-Source: AGHT+IHORvrlXJ4uwjpyybGVAb6MaxVx88Mqx74c5eN9Gw4NoGknhvyMYnh6Ke8vQdMc9xQqHr1VSg==
X-Received: by 2002:a5d:59a8:0:b0:375:bb30:6518 with SMTP id
 ffacd0b85a97d-37cfb8b6238mr1902193f8f.1.1727943273759; 
 Thu, 03 Oct 2024 01:14:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082d230dsm702027f8f.94.2024.10.03.01.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 01:14:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 03 Oct 2024 10:14:19 +0200
Subject: [PATCH 2/5] dt-bindings: display/msm: merge SM8250 DPU into SM8150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-dt-binding-display-msm-merge-v1-2-91ab08fc76a2@linaro.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4033;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dH+SVdLskeQZiYIROK71JDfiS/rRfhCzgnVtQVskFbE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm/lJg0f/7YyApnEY8pSbuulkztqOe3u+5CTTNw
 NTupL6zl1uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZv5SYAAKCRDBN2bmhouD
 11hbD/415N1kKo/l9YBKsL0cydlNj3GtPjC2ZZfex3cZjVPKMyQW9dXJJ1WhWI5dIVUToYmeSVp
 ZTfm3jqW+96yurBGDecwRoJ8/B/Zwim1uWApF4WygfyZKEAOgesBtb8FYMJ1hSbPUaZVNcSZKzJ
 Iyb482ktA9vGrGkHlyInPWds7pr7vw/JIDUuU/I8xNRd+3KJBl0N+KhcHFN6WxGl/+8FEqkKC7S
 Qyjee5Py3vzAt7GlaP2MAFz9ut68mmHZpYxkeGnUl0ZiWMESRIOYDZeoqVuuLex/YQkj/UVzgOm
 ngrcfQMqJEg6Q/zzf9pybylBtVvJuEBWrnC9nJ7vSsDB6v8+L2b0LT2O8X5W+ZSRpdmP9DyUvbw
 nT9vtIjahfdCxic8tyAuEW7TuoTDM68syCRVwjy2y3RHCCtuQlFQOhKp9bH/BiEe7fFKFnoq5EC
 yScWAgoh8GRtGDMa7WrsvG6ECThhiRPfdpZR7KwhA0y0KPysZa86F5lFLOqwxkZcje6dCj9yXJW
 L0JrbOEfSO5oMwrKSNMoUHzt0MZAt0QELr7iK6oNTsbKXNSB8UJa5x6NAfcNqCMpPaoDjKDvgUw
 HIn1cBl+3Ua37RFoakIXN2ASKUT4/YpkLLV749XHhZIqcU7r/MvlvSIHxvaspMGiqw3JirEbGIv
 tgLUfaTwPxLZ4hg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split of the bindings was artificial and not helping - we end up with
multiple binding files for very similar devices thus increasing the
chances of using different order of reg and clocks entries.

Unify DPU bindings of SM8150 and SM8250, because they are the same.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  4 +-
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      | 99 ----------------------
 2 files changed, 3 insertions(+), 100 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
index 13146b3f053c..a88d22f30a60 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8150-dpu
+    enum:
+      - qcom,sm8150-dpu
+      - qcom,sm8250-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
deleted file mode 100644
index ffa5047e901f..000000000000
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
+++ /dev/null
@@ -1,99 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/qcom,sm8250-dpu.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SM8250 Display DPU
-
-maintainers:
-  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-
-$ref: /schemas/display/msm/dpu-common.yaml#
-
-properties:
-  compatible:
-    const: qcom,sm8250-dpu
-
-  reg:
-    items:
-      - description: Address offset and size for mdp register set
-      - description: Address offset and size for vbif register set
-
-  reg-names:
-    items:
-      - const: mdp
-      - const: vbif
-
-  clocks:
-    items:
-      - description: Display ahb clock
-      - description: Display hf axi clock
-      - description: Display core clock
-      - description: Display vsync clock
-
-  clock-names:
-    items:
-      - const: iface
-      - const: bus
-      - const: core
-      - const: vsync
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - clock-names
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
-    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,sm8250.h>
-    #include <dt-bindings/power/qcom,rpmhpd.h>
-
-    display-controller@ae01000 {
-        compatible = "qcom,sm8250-dpu";
-        reg = <0x0ae01000 0x8f000>,
-              <0x0aeb0000 0x2008>;
-        reg-names = "mdp", "vbif";
-
-        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                 <&gcc GCC_DISP_HF_AXI_CLK>,
-                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-        clock-names = "iface", "bus", "core", "vsync";
-
-        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-        assigned-clock-rates = <19200000>;
-
-        operating-points-v2 = <&mdp_opp_table>;
-        power-domains = <&rpmhpd RPMHPD_MMCX>;
-
-        interrupt-parent = <&mdss>;
-        interrupts = <0>;
-
-        ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            port@0 {
-                reg = <0>;
-                endpoint {
-                    remote-endpoint = <&dsi0_in>;
-                };
-            };
-
-            port@1 {
-                reg = <1>;
-                endpoint {
-                    remote-endpoint = <&dsi1_in>;
-                };
-            };
-        };
-    };
-...

-- 
2.43.0

