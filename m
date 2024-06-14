Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EBF9093D2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 23:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50610E2AC;
	Fri, 14 Jun 2024 21:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="H+2ZPte4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp52.i.mail.ru (smtp52.i.mail.ru [95.163.41.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C42810E2A9;
 Fri, 14 Jun 2024 21:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=YRfmrlSAG1o7NawUa22Nx3XW4t7ypdZTzjWy+qu4DYg=; t=1718402349; x=1718492349; 
 b=H+2ZPte4kXWWKNIikjcCqN9k2eBBLvX3luOUF1Jc3aRHEf+WPV6GZ2kg/RahZyg5zImBcRwELac
 td51XTNwC7N3v1T9XinC9FGNaR5mZXpLUiQyqDXyHzYBB+cN1MJxfuCaW2xW/8TgbAl0gIWsMZ0m+
 f1Mk7hLw3n8fbdFgCgA=;
Received: by smtp52.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1sIEws-0000000DQt7-3bj2; Sat, 15 Jun 2024 00:59:07 +0300
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
 linux-kernel@vger.kernel.org, Danila Tikhonov <danila@jiaxyga.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: display/msm: Add SM7150 DPU
Date: Sat, 15 Jun 2024 00:58:52 +0300
Message-ID: <20240614215855.82093-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614215855.82093-1-danila@jiaxyga.com>
References: <20240614215855.82093-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp52.i.mail.ru;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FAC18EB3A2E2B665D18D0A906C7426507600894C459B0CD1B9089DB9BC875F3A5FBC1E996D91BF8BA8AEF0188E5373AAF531FC8F41566DE797EC456C66D2279EA7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F39A5B56EAAA70A1EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063732727FD5A4355FD18638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C3422B98B184AD5F1367D1A1BD11C48D9154528A4E5C71A7CC7F00164DA146DAFE8445B8C89999728AA50765F79006372A3B24BF85B2E607389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8B861051D4BA689FCF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDB8A315C1FF4794D76E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B028AECD13B03DE2FEC76A7562686271ED91E3A1F190DE8FD2E808ACE2090B5E14AD6D5ED66289B5278DA827A17800CE7A03E8F3C2D3812562EB15956EA79C166176DF2183F8FC7C0F43AACC0BCEB2632725E5C173C3A84C3A0CC8883A33FD9CD35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A58081AAD022DAD2765002B1117B3ED696DB0784778D3E15D3E99897350C7C491E823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFF88EDD65AF0B8EB7BBE1870A5B2F6A3A37299E9CE4A8AAF8BC033117675AC73E8135B9CF208C7BB7BC11D93875BCBCAC3A2CA635D3AF4C890A7495B692C6454FCFC8435D09458BCF8FC4A39FA5EEE4B702C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojF87fI4pLnoBC+D/FlbnyYw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981941D1884D218BFB805E38EDE555C2806C07F6138EAF1DB0703BFD0DECFC2333F2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/qcom,sm7150-dpu.yaml | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
new file mode 100644
index 0000000000000..c79b2d4428003
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm7150-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM7150 Display Processing Unit (DPU)
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

