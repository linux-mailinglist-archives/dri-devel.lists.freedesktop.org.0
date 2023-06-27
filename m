Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77BF7404B9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 22:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDC010E331;
	Tue, 27 Jun 2023 20:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A5A10E09F;
 Tue, 27 Jun 2023 20:14:28 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2D6813F4E7;
 Tue, 27 Jun 2023 22:14:25 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 27 Jun 2023 22:14:18 +0200
Subject: [PATCH v2 03/15] dt-bindings: clock: qcom,dispcc-sm6125: Require
 GCC PLL0 DIV clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-sm6125-dpu-v2-3-03e430a2078c@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
In-Reply-To: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
be passed from DT, and should be required by the bindings.

Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index 8a210c4c5f82..8fd29915bf2c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -29,6 +29,7 @@ properties:
       - description: Link clock from DP PHY
       - description: VCO DIV clock from DP PHY
       - description: AHB config clock from GCC
+      - description: GPLL0 div source from GCC
 
   clock-names:
     items:
@@ -39,6 +40,7 @@ properties:
       - const: dp_phy_pll_link_clk
       - const: dp_phy_pll_vco_div_clk
       - const: cfg_ahb_clk
+      - const: gcc_disp_gpll0_div_clk_src
 
   '#clock-cells':
     const: 1
@@ -72,14 +74,16 @@ examples:
                <&dsi1_phy 1>,
                <&dp_phy 0>,
                <&dp_phy 1>,
-               <&gcc GCC_DISP_AHB_CLK>;
+               <&gcc GCC_DISP_AHB_CLK>,
+               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
       clock-names = "bi_tcxo",
                     "dsi0_phy_pll_out_byteclk",
                     "dsi0_phy_pll_out_dsiclk",
                     "dsi1_phy_pll_out_dsiclk",
                     "dp_phy_pll_link_clk",
                     "dp_phy_pll_vco_div_clk",
-                    "cfg_ahb_clk";
+                    "cfg_ahb_clk",
+                    "gcc_disp_gpll0_div_clk_src";
       #clock-cells = <1>;
       #power-domain-cells = <1>;
     };

-- 
2.41.0

