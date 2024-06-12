Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01122905B5C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 20:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1097D10E8DD;
	Wed, 12 Jun 2024 18:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Hd4u9IyW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp17.i.mail.ru (smtp17.i.mail.ru [95.163.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DE510E8D9;
 Wed, 12 Jun 2024 18:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=oDJSK+y7MlSLhZ/LvcO0HWaU8+1rORzIB/Bt1UUfMEI=; t=1718217862; x=1718307862; 
 b=Hd4u9IyWSAm2R6HvXg4i9NO+r9474V/MOCK4rK4E/jrL64jWkGkgQQgb3nfbN1yDvkiEUCTyHAd
 jwNZ9JNyZo6z3PzoglUurzROZW+C+oW14s/8V8Cr3Hkaok866ArMpEW/ZUGPKS/BYnDmViM2zfQtf
 LMbeqwwq0NcgQBnAMIM=;
Received: by smtp17.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sHSxG-0000000D0R6-2Dul; Wed, 12 Jun 2024 21:44:19 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_rmccann@quicinc.com, konrad.dybcio@linaro.org,
 neil.armstrong@linaro.org, jonathan@marek.ca, swboyd@chromium.org,
 quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 3/4] dt-bindings: display/msm: Add SM7150 DPU
Date: Wed, 12 Jun 2024 21:43:35 +0300
Message-ID: <20240612184336.11794-4-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612184336.11794-1-danila@jiaxyga.com>
References: <20240612184336.11794-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp17.i.mail.ru;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA9F827F83B79F671BF8FDA50EA86A90BE00894C459B0CD1B93ACEADE8740ECA7383E6F0B08ED3DBBEE5863BC635110DC757EC9FF7D4E61EADDEB93F7F06BD0150
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D96557C5EC1D5BA4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637C867FEFF36BCDF178638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D855981D9AB637BFEEC0955C639EDBD42E0582AC8FA0D9F7AFCC7F00164DA146DAFE8445B8C89999728AA50765F7900637CAEE156C82D3D7D9389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D2DCF9CF1F528DBCF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C0085B890FD2717DA6136E347CC761E074AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3B8066AFCF2BB2551BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF4964A708C60C975A1DD303D21008E298D5E8D9A59859A8B6E5E764EB5D94DBD475ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5CA6015D3FAE9670B5002B1117B3ED6966EB59F92B501AAB3D57BAD45EC4C5DE1823CB91A9FED034534781492E4B8EEAD09F854029C6BD0DAC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1D16912BF23A4A56F0A17252382C758D9FB7B9884306AE50E5936ACEB49F42A18853F4E7B596232804A26A3878DC1330E86C5904D41BF9B7EB33B4587FF888A3AA68E5D97FF1F9DF54A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojP/c/PTD82AmJOELAp2fpKw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949812BC0DB2261ED536391CF6C6A8F7D6EF617564FC1A491F05FCC02472E05A8A8332C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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

Document the DPU hardware found on the Qualcomm SM7150 platform.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../bindings/display/msm/qcom,sm7150-dpu.yaml | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
new file mode 100644
index 0000000000000..1a44cad131a72
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm7150-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM7150 Display DPU
+
+maintainers:
+  - Danila Tikhonov <danila@jiaxyga.com>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm7150-dpu
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
+      - description: Display hf axi clock
+      - description: Display ahb clock
+      - description: Display rotator clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+      - const: rot
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
+        compatible = "qcom,sm7150-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc_disp_hf_axi_clk>,
+                 <&dispcc_mdss_ahb_clk>,
+                 <&dispcc_mdss_rot_clk>,
+                 <&dispcc_mdss_mdp_lut_clk>,
+                 <&dispcc_mdss_mdp_clk>,
+                 <&dispcc_mdss_vsync_clk>;
+        clock-names = "bus",
+                      "iface",
+                      "rot",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc_mdss_vsync_clk>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
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
+                    remote-endpoint = <&mdss_dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu_intf2_out: endpoint {
+                    remote-endpoint = <&mdss_dsi1_in>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                dpu_intf0_out: endpoint {
+                    remote-endpoint = <&dp_in>;
+                };
+            };
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-19200000 {
+                opp-hz = /bits/ 64 <19200000>;
+                required-opps = <&rpmhpd_opp_min_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-344000000 {
+                opp-hz = /bits/ 64 <344000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-430000000 {
+                opp-hz = /bits/ 64 <430000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
+...
-- 
2.45.2

