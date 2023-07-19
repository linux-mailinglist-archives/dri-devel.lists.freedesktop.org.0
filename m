Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA4175A0C7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 23:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E0C10E12F;
	Wed, 19 Jul 2023 21:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB13B10E056;
 Wed, 19 Jul 2023 21:52:40 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 12D6F20388;
 Wed, 19 Jul 2023 23:52:36 +0200 (CEST)
Date: Wed, 19 Jul 2023 23:52:33 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 10/15] dt-bindings: msm: dsi-phy-14nm: Document SM6125
 variant
Message-ID: <wr2f6uzgam72ykgrjgalmo2h2ye2xlzgh4v3utxqed4isyfkau@aarofkuvysuk>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-10-03e430a2078c@somainline.org>
 <285facd1-bf20-aff2-b680-f796e8830038@linaro.org>
 <yzz4dddlh2no3lmuxrkuxhsuaf3brruo635pgfpnaxwffmnl6j@uk3jxtoarg7w>
 <d5f925e4-fbfe-cbb2-c3e6-8e806761d61e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5f925e4-fbfe-cbb2-c3e6-8e806761d61e@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-19 01:01:54, Dmitry Baryshkov wrote:
> On 19/07/2023 00:00, Marijn Suijten wrote:
> > On 2023-06-29 13:54:13, Dmitry Baryshkov wrote:
> >> On 27/06/2023 23:14, Marijn Suijten wrote:
> >>> Document availability of the 14nm DSI PHY on SM6125.  Note that this
> >>> compatible uses the SoC-suffix variant, intead of postfixing an
> >>> arbitrary number without the sm/sdm portion.  The PHY is not powered by
> >>> a vcca regulator like on most SoCs, but by the MX power domain that is
> >>> provided via the power-domains property and a single corresponding
> >>> required-opps.
> >>>
> >>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>> ---
> >>>    .../devicetree/bindings/display/msm/dsi-phy-14nm.yaml         | 11 +++++++++++
> >>>    1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> >>> index a43e11d3b00d..183a26f8a6dc 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> >>> @@ -19,6 +19,7 @@ properties:
> >>>          - qcom,dsi-phy-14nm-2290
> >>>          - qcom,dsi-phy-14nm-660
> >>>          - qcom,dsi-phy-14nm-8953
> >>> +      - qcom,sm6125-dsi-phy-14nm
> >>>    
> >>>      reg:
> >>>        items:
> >>> @@ -35,6 +36,16 @@ properties:
> >>>      vcca-supply:
> >>>        description: Phandle to vcca regulator device node.
> >>>    
> >>> +  power-domains:
> >>> +    description:
> >>> +      A phandle and PM domain specifier for an optional power domain.
> >>> +    maxItems: 1
> >>> +
> >>> +  required-opps:
> >>> +    description:
> >>> +      A phandle to an OPP node describing an optional performance point.
> >>
> >> I'd rephrase this to be something more exact, like 'desribing power
> >> domain's performance point'.
> > 
> > Sure.  I'll leave out the word "optional", that becomes obvious from
> > maxItems:1 without minItems, together with referencing a PM which itself
> > is already optional.
> 
> no, default minItems is equal to maxItems. It is not listing this 
> property under the required what makes it optional.

I thought it was both.

Magic.

- Marijn
