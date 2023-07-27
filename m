Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEAC7655AA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCFA10E592;
	Thu, 27 Jul 2023 14:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA55B10E591
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:13:34 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 43D5B20443;
 Thu, 27 Jul 2023 16:13:30 +0200 (CEST)
Date: Thu, 27 Jul 2023 16:13:28 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 00/17] drm/msm: Add SM6125 MDSS/DPU hardware and
 enable Sony Xperia 10 II panel
Message-ID: <zvmz7i5jgrx27ildrc3tpcnrfgeivr3itv5qlwidsbr5iu5wwa@y3v2sehpw3vy>
References: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
 <169046051039.1413710.12901529844343078449.b4-ty@linaro.org>
 <6c5197c9-e24d-70ac-fd75-2c72369d8b7f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c5197c9-e24d-70ac-fd75-2c72369d8b7f@linaro.org>
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

On 2023-07-27 16:34:49, Dmitry Baryshkov wrote:
> On 27/07/2023 15:22, Dmitry Baryshkov wrote:
> > 
> > On Sun, 23 Jul 2023 18:08:38 +0200, Marijn Suijten wrote:
> >> Bring up the SM6125 DPU now that all preliminary series (such as INTF
> >> TE) have been merged (for me to test the hardware properly), and most
> >> other conflicting work (barring ongoing catalog *improvements*) has made
> >> its way in as well or is still being discussed.
> >>
> >> The second part of the series complements that by immediately utilizing
> >> this hardware in DT, and even enabling the MDSS/DSI nodes complete with
> >> a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).
> >>
> >> [...]
> > 
> > Applied, thanks!
> > 
> > [01/17] drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/a7e3fda5948a
> > [02/17] arm64: dts: qcom: sm6125: Pad APPS IOMMU address to 8 characters
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/b7d35a8eae54
> > [03/17] arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/2be52ca96a71
> 
> Of course, these two patches sneaked in by the mistake, dropped them now.

Lovely, glad to have that resolved so quickly.  Thanks!

- Marijn

> 
> > [04/17] dt-bindings: display/msm: Remove DSI1 ports from SM6350/SM6375 example
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/4be2c19261fc
> > [05/17] dt-bindings: clock: qcom,dispcc-sm6125: Require GCC PLL0 DIV clock
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/4f86e343f3c6
> > [06/17] dt-bindings: clock: qcom,dispcc-sm6125: Allow power-domains property
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/91043642f28c
> > [07/17] dt-bindings: display/msm: dsi-controller-main: Document SM6125
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/cf5859476e5d
> > [08/17] dt-bindings: display/msm: sc7180-dpu: Describe SM6125
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/04a664dffd19
> > [09/17] dt-bindings: display/msm: Add SM6125 MDSS
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/3bde3b8f8a04
> > [10/17] drm/msm/dpu: Add SM6125 support
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/76c5dffd0bc4
> > [11/17] drm/msm/mdss: Add SM6125 support
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/de50357565d3
> > [12/17] dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/cdac445883cc
> > [13/17] drm/msm/dsi: Reuse QCM2290 14nm DSI PHY configuration for SM6125
> >          https://gitlab.freedesktop.org/lumag/msm/-/commit/7638d8059ace
> > 
> > Best regards,
> 
> -- 
> With best wishes
> Dmitry
> 
