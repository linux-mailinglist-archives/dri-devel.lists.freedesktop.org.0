Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AA17D634C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C80110E579;
	Wed, 25 Oct 2023 07:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33DD10E56E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:35:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32dcd3e5f3fso3710255f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698219310; x=1698824110; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FeVaWNnyeNRSIzE+gpNieFC+q7WQJWKZkR02hpS08iA=;
 b=qHBuDR57etjvxuKAOq3j5WRw7PE3rAXoP6pADMP/9cpMFfJU8UeBzsqHzZGL66tOs2
 xOgO4pnrdmRrt+dmMRXb6bqApQzhHpyolAfW0oW4Ls/+Ocd2RxB/VQ09RyV5DGc4wGJa
 m10mSnor8IPnmdgCe6Uv0Wx6sq39Sr9THpOsmk4QJUAfc0XW2Vun2CIFUee1vN/TJPP3
 4hzrSBrBuvE1ZYN9vk1jptq5KbAig3FHa7rVE032VoNCTK0VQqin4jx65gAipwvzfUhD
 Zdq+Olm3cvBvPGq4mcYRSjCWrxIkrKLpdZ/R8ZLzlIXzTSqNSA8Xt7Xoa1IHBMY2HVhl
 sCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698219310; x=1698824110;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FeVaWNnyeNRSIzE+gpNieFC+q7WQJWKZkR02hpS08iA=;
 b=nDDNIVmSkhW/wAu6nkUCEfU2fQjYPQ6ZCARTPQZHZ9RelirlfZgvW1ib6AUTONt7rg
 6rlJHzRUWi1KkQk76FC/Vmy/KAtUy0ev85jOM2n1lxazO1GQtAfmJfkDE2PFZayEA2uZ
 p/l2cwUYbBBzAmhQeT/cgX8zghdevtpIv8xb2K3ekNkZpF9idxjzca26pSNC1qR30Leb
 gwvqWkQy6S+Cyc448bBfrM6UESGqLBq5Dt+IsSN3Z3xDglpQArN+SpFzSFWSaPDM4T9c
 NrSA9NPX/fNYS8DIa3IlumUCuEyP1TAvtuJdGby4gD0zSHkLooZijQ6yaDCY4voci2XJ
 IlEw==
X-Gm-Message-State: AOJu0YxIW+4oHXuiyaXBwFXIiOCexkuCtR7GLP0qgjMZKQBPX8JOEXJa
 SBJueRsQHpkAMuku7LIWRVn24Q==
X-Google-Smtp-Source: AGHT+IEoONYynpBbhg6LTU7YNc9309l0erhRMfCJ4DvMaMUvjthqw2ltUmMX7x/deOmgOiYmoeIoQA==
X-Received: by 2002:a5d:654a:0:b0:32d:95dc:c065 with SMTP id
 z10-20020a5d654a000000b0032d95dcc065mr10482391wrv.19.1698219310309; 
 Wed, 25 Oct 2023 00:35:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a5d60d2000000b003248a490e3asm11449058wrt.39.2023.10.25.00.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 00:35:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Oct 2023 09:35:01 +0200
Subject: [PATCH 3/8] dt-bindings: display: msm: document the SM8650 DPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-mdss-v1-3-bb219b8c7a51@linaro.org>
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3887;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=A8kBi2PrODlpOXZ493WRi1fPCLR+VF/HPHoWKYNttUE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMUmzT1vJJHda3TnDlgizA2nyQee2qiYeQfMv3gj
 b9KHq6WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjFJgAKCRB33NvayMhJ0YmOD/
 0Wy6xv8g7QDKWntJIJYjxPBFwl9LLdnNGSqpTiVNiq3N2NjSJqCz/6aBrvNuko5n2A1BkrPW0bkN5T
 HcBeeU6VPjvMhILDwzAgp85FVmE9UdwjKpjhJ5XLETt7Ds4Ib3orhz6jvFzEk67mtSzO0AO/U8YVob
 ZbvGRM9cuW3SJbB/LkgZAbZRf2M/Bb8EDA+zbiPtBnewMPH1El0mItaqn9t/YYgL3Dw+LwuyziSO2L
 +K3JdM90d0zBQWG3huUV8/wAUSFQtrSSTnEiLrLgRdjzg6zNnKfVe0UU80cuXJvNafb9lBn/RiwDEp
 0NEa1JGd8nedr22ZPDJHAatQMe+gSeizmOZCgf5bGYrarFQSvO2/9Pk3xrY3eRZ6NQoPRIy8iJAwH5
 HGSTrWIsFGg6VKDMh5QT+izBqdRSV0THi4wZpxjeoYqItPLYOfqkkVcPCCaM39ol1kAXiUOd9KDNbQ
 4XIw2ymN/fejn7/M4cGIORldAgzHP4DM49RvMXJBfjLM6CckuMmJpoy7KJzWFZ6ptpySVlSH1Ipyps
 46xfd52NZEVQ7AIt+G7h9e3uugYgQYF/2DcmDfbGHs/wKPRCsNkfYrKcl75y/USDZxCXcyKLTd4jIE
 4XISf78x+oEHdsTKDrJamtofLsiveiFShHPqRemtvXg/5hfW8+n/YXUstxjA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the DPU Display Controller on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
new file mode 100644
index 000000000000..a01d15a03317
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8650 Display DPU
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8650-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf axi
+      - description: Display MDSS ahb
+      - description: Display lut
+      - description: Display core
+      - description: Display vsync
+
+  clock-names:
+    items:
+      - const: nrt_bus
+      - const: iface
+      - const: lut
+      - const: core
+      - const: vsync
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm8650-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc_axi_clk>,
+                 <&dispcc_ahb_clk>,
+                 <&dispcc_mdp_lut_clk>,
+                 <&dispcc_mdp_clk>,
+                 <&dispcc_vsync_clk>;
+        clock-names = "nrt_bus",
+                      "iface",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc_vsync_clk>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf1_out: endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu_intf2_out: endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-325000000 {
+                opp-hz = /bits/ 64 <325000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-375000000 {
+                opp-hz = /bits/ 64 <375000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-514000000 {
+                opp-hz = /bits/ 64 <514000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
+...

-- 
2.34.1

