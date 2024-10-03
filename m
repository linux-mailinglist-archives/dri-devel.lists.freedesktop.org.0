Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1798EB30
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 10:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4210E7D3;
	Thu,  3 Oct 2024 08:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DPzRLg81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD9610E7D2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 08:14:37 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42ee66c2c49so1027275e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 01:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727943276; x=1728548076; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yjGjFpVi6DoXujtHm3muxy156XMe7cgV5oZmQeg5Uh4=;
 b=DPzRLg81k2zcGsxcwLtkxemMhCVWTslA0fsumbzJ1wWYACy0E3g7D95c3UFBigRf6e
 WA4NufJ0NQX+gcPORmvwb6OI8yqVd6tFASY34KZIlPMWJtrh75Cgwh0OZg4ZDU2x5Mbl
 vC0XAhf44SuLm23SE0CamhnPIreG9+nbFxw7cZaY+FnnPDz/k0BPG40Vo6ahqA9ldLTR
 zlDKCLL90tvL84KewOwbw72B1Iadg8+Ktm6ccj+88gs9i4dlHlMVfRfl+ANIj+f0lVzF
 jIFwds7Ypkt0VOQ/Aoj0J3zonGUz3nlH8F1EOMu35xvAZbQ6GA4hnDV+t+kKCQyX3zvN
 Rg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727943276; x=1728548076;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yjGjFpVi6DoXujtHm3muxy156XMe7cgV5oZmQeg5Uh4=;
 b=SrfES3suZrNCEdlg+vb6zRY1JtCBPV1vC8LXs9DZnOU9lYc308Eluh4cSrbFUWpQG4
 /24IU+R4cEOJajtnOO8sjpDJSpm/oCOIYE9tDOcy21XwInnwYPSV2ymbFX6niwhswUcQ
 vJ35+1vN5VPT5+UX7cDeC6T/Z6gVkA/P1rb4MjdiOpzHTDwZBPskxkyYydNXbjokeMTz
 7Z37/zyY9FFo61qMFMkXMHRIF54tQjMRlAhHujnIdILizErMl3soPVn0LIEfzGIMkqJK
 W7FRU1jPt4MhkjIklKqKES9RfRbr2psBgoUlcv4FEE8hKhtsB6YQR2ltas7ngG0awUV+
 AMYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc1aVyIQ8Phqd0sGN1BZUGx6EclQ1H0N2rvMm3HYYUbrC2BWqZfS/29fVqnu+YiJCYHsnwaYGU9Js=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUUOQffiB7tuGNmPRaI7RYkuVk7JqusxkK6/5M2Mc0vTVoSMCZ
 rBvvLieYWm/89JmQssnDBbHWlve+MzRjzQjY0/ZfmyqL6AN6MhT4/hPIVkMEDY0=
X-Google-Smtp-Source: AGHT+IHNfyTynFWJjVKHkFdbF55NsYmFJ72O5u3SCiEQBvJwWPSRzqEazUj7I33c8ZpWwWaIFNc7vQ==
X-Received: by 2002:a05:600c:74a:b0:42c:aeee:e604 with SMTP id
 5b1f17b1804b1-42f7795431cmr21343885e9.8.1727943275636; 
 Thu, 03 Oct 2024 01:14:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082d230dsm702027f8f.94.2024.10.03.01.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 01:14:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 03 Oct 2024 10:14:20 +0200
Subject: [PATCH 3/5] dt-bindings: display/msm: merge SM8350 DPU into SC7280
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-dt-binding-display-msm-merge-v1-3-91ab08fc76a2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4802;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=M70OZAtivNRGOLcaQJi4OpyfB+gup8mxOQUxCSAPC3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm/lJhOPfdZ5V1aYsZIliza2UvaapHm8tgeUCrw
 olfeMvDH1qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZv5SYQAKCRDBN2bmhouD
 18DeEACG12eR34P9hg1YN3zIF9k5PLLvau56aXFJnH9mm5fk6+FQcDOphwIqZo6K7LJpBGMYCdq
 /952tDwVpCfoegkyc9mCXLl5K4YNM+MdpdqF430dOaYnmvN2XcCGy+1pxU7EbFB0Q1ke1UofYhV
 hRYe+1PhZ7kJwKUX99uN+r1NhIIoZ+wwO3KgS+I0fMSsgpCknJ4SI6T9ztvCDd4e1T5CwS4GzdQ
 Dhw2TjTKvk9pHKMwE0avmYZWIva7YsO7do/bVJvSmbR6F7DEvT53O6rforR0Tuzd7WAGhV095eT
 v5CgBQegilINyggMwZWWRzL/JTcY/O4fU84k0kywgc/wm2/CkeYOD9ZbqHnFp7/lqgvhjdlRRbu
 UcUA3FFdlzZd2KkABBwfYeeXotA0cARexYYVOQ0NMYWfkaHR+fnkBp2KWCpzqogzbLIXQetopGX
 GXdSEHumIM5hVna/wAjh5mV+PH1WzIWGaeODimGNt2d5EJ1cV4KMq1/dKam13yaCHbPwi+76wwo
 KTUk2bQzqA/xOpXb/lOUiP7nc1Vh6ahSqb+RvmO5ZpfL+cXVmZKnI0YVixDURlStmwh4ThjwprW
 8KtdH47jcqHqjosUBR0Cqrw+1ZL/ndaoTW254d3CtefHenxJla9+zt2ivWC9Uu/33V2XPT3aZtI
 c0VZ2PozLhr9FXw==
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

Unify DPU bindings of SC7280 and SM8350, because they are the same.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8350-dpu.yaml      | 120 ---------------------
 2 files changed, 1 insertion(+), 120 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index fab7a3b9a20e..3d69a573b450 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
+      - qcom,sm8350-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
deleted file mode 100644
index 96ef2d9c3512..000000000000
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
+++ /dev/null
@@ -1,120 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/qcom,sm8350-dpu.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SM8350 Display DPU
-
-maintainers:
-  - Robert Foss <robert.foss@linaro.org>
-
-$ref: /schemas/display/msm/dpu-common.yaml#
-
-properties:
-  compatible:
-    const: qcom,sm8350-dpu
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
-      - description: Display hf axi clock
-      - description: Display sf axi clock
-      - description: Display ahb clock
-      - description: Display lut clock
-      - description: Display core clock
-      - description: Display vsync clock
-
-  clock-names:
-    items:
-      - const: bus
-      - const: nrt_bus
-      - const: iface
-      - const: lut
-      - const: core
-      - const: vsync
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
-    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,sm8350.h>
-    #include <dt-bindings/power/qcom,rpmhpd.h>
-
-    display-controller@ae01000 {
-        compatible = "qcom,sm8350-dpu";
-        reg = <0x0ae01000 0x8f000>,
-              <0x0aeb0000 0x2008>;
-        reg-names = "mdp", "vbif";
-
-        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
-                 <&gcc GCC_DISP_SF_AXI_CLK>,
-                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
-                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-        clock-names = "bus",
-                      "nrt_bus",
-                      "iface",
-                      "lut",
-                      "core",
-                      "vsync";
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
-                dpu_intf1_out: endpoint {
-                    remote-endpoint = <&dsi0_in>;
-                };
-            };
-        };
-
-        mdp_opp_table: opp-table {
-            compatible = "operating-points-v2";
-
-            opp-200000000 {
-                opp-hz = /bits/ 64 <200000000>;
-                required-opps = <&rpmhpd_opp_low_svs>;
-            };
-
-            opp-300000000 {
-                opp-hz = /bits/ 64 <300000000>;
-                required-opps = <&rpmhpd_opp_svs>;
-            };
-
-            opp-345000000 {
-                opp-hz = /bits/ 64 <345000000>;
-                required-opps = <&rpmhpd_opp_svs_l1>;
-            };
-
-            opp-460000000 {
-                opp-hz = /bits/ 64 <460000000>;
-                required-opps = <&rpmhpd_opp_nom>;
-            };
-        };
-    };
-...

-- 
2.43.0

