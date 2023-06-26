Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A373E21A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 16:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958DD10E21B;
	Mon, 26 Jun 2023 14:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85AB10E20D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 14:26:29 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DDFC63F494;
 Mon, 26 Jun 2023 16:26:25 +0200 (CEST)
Date: Mon, 26 Jun 2023 16:26:24 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom,dispcc-sm6125: Require
 GCC PLL0 DIV clock
Message-ID: <dp2ucgmql2jff52nbxti2hwjchtgjkbrwcgpx3p7ruodz7adnj@635pcqr6fv4x>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
 <edrftxqhywiaxvbonyh25cmubrg77y4dryqoy7id4ndan2lfa7@rhvcoavtg5vl>
 <f62d750e-da73-fece-c3de-0dac1fbb9827@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f62d750e-da73-fece-c3de-0dac1fbb9827@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-26 11:43:39, Konrad Dybcio wrote:
> On 25.06.2023 21:48, Marijn Suijten wrote:
> > On 2023-06-24 03:45:02, Konrad Dybcio wrote:
> >> On 24.06.2023 02:41, Marijn Suijten wrote:
> >>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
> >>> be passed from DT, and should be required by the bindings.
> >>>
> >>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> >>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>> ---
> >> Ideally, you'd stick it at the bottom of the list, as the items: order
> >> is part of the ABI
> > 
> > This isn't an ABI break, as this driver nor its bindings require/declare
> > a fixed order: they declare a relation between clocks and clock-names.
> Bindings describe the ABI, drivers implement compliant code flow.

That is how bindings are supposed to be...  However typically the driver
is written/ported first and then the bindings are simply created to
reflect this, and sometimes (as is the case with this patch)
incorrectly.

That, together with a lack of DTS and known-working device with it
(which is why I'm submitting driver+bindings+dts in one series now!)
makes us shoot ourselves in the foot by locking everyone into an ABI
that makes no sense.

> > This orders the GCC clock just like other dispccs.  And the previous
> > patch dropped the unused cfg_ahb_clk from the bindings, so all bets are
> > off anyway.
> Thinking about it again, the binding has not been consumed by any upstream
> DT to date, so it should (tm) be fine to let it slide..

Exactly, I hope/doubt anyone was already using these incomplete
bindings.  And again: the ABI here is the name->phandle mapping, the
order Does Not Matter™.  So I hope we can let it slide (otherwise the
previous patch shouldd have been NAK'ed as well??)

(Unless you are SM6115 which uses index-based mapping and does not
 define clock-names at all)

- Marijn

> Konrad
> > 
> > - Marijn
> > 
> >>
> >> Konrad
> >>>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> >>> index 2acf487d8a2f..11ec154503a3 100644
> >>> --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> >>> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
> >>> @@ -23,6 +23,7 @@ properties:
> >>>    clocks:
> >>>      items:
> >>>        - description: Board XO source
> >>> +      - description: GPLL0 div source from GCC
> >>>        - description: Byte clock from DSI PHY0
> >>>        - description: Pixel clock from DSI PHY0
> >>>        - description: Pixel clock from DSI PHY1
> >>> @@ -32,6 +33,7 @@ properties:
> >>>    clock-names:
> >>>      items:
> >>>        - const: bi_tcxo
> >>> +      - const: gcc_disp_gpll0_div_clk_src
> >>>        - const: dsi0_phy_pll_out_byteclk
> >>>        - const: dsi0_phy_pll_out_dsiclk
> >>>        - const: dsi1_phy_pll_out_dsiclk
> >>> @@ -65,12 +67,14 @@ examples:
> >>>        compatible = "qcom,sm6125-dispcc";
> >>>        reg = <0x5f00000 0x20000>;
> >>>        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> >>> +               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> >>>                 <&dsi0_phy 0>,
> >>>                 <&dsi0_phy 1>,
> >>>                 <&dsi1_phy 1>,
> >>>                 <&dp_phy 0>,
> >>>                 <&dp_phy 1>;
> >>>        clock-names = "bi_tcxo",
> >>> +                    "gcc_disp_gpll0_div_clk_src",
> >>>                      "dsi0_phy_pll_out_byteclk",
> >>>                      "dsi0_phy_pll_out_dsiclk",
> >>>                      "dsi1_phy_pll_out_dsiclk",
> >>>
