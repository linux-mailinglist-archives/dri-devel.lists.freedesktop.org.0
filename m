Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112405A1790
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 19:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C4410E873;
	Thu, 25 Aug 2022 17:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4350310E86F;
 Thu, 25 Aug 2022 17:02:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82821CF6;
 Thu, 25 Aug 2022 19:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661446924;
 bh=8oeuHbl2FrVXGoNzjN0JRcOQlh9nASs8oJGVUxHhuKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jxBy97F1QAMpAKAkGrBJvTv1tOteCFGyoHs79u45zXuU130HaEIKiKnHvTEEYTCQh
 zkDd96NPUPE4Sc70FY/+59soLy91Jwfjf2bOt4ISwx2e9MLxq4ZxL8kr+aCvfUYbim
 L1HYWc5n2ispGZDDYoJarC6MDYTVa4fqdBG7fF5M=
Date: Thu, 25 Aug 2022 20:01:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 5/5] dt-bindings: display: drop minItems equal to maxItems
Message-ID: <YwerBh08kHEjDjdy@pendragon.ideasonboard.com>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org,
 Marek Vasut <marex@denx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andre Przywara <andre.przywara@arm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thank you for the patch.

On Thu, Aug 25, 2022 at 02:33:34PM +0300, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml   | 1 -
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 --
>  Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 2 --
>  .../bindings/display/samsung/samsung,exynos5433-decon.yaml      | 2 --
>  .../bindings/display/samsung/samsung,exynos5433-mic.yaml        | 1 -
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml         | 1 -
>  .../devicetree/bindings/display/samsung/samsung,fimd.yaml       | 1 -
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml  | 1 -
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml   | 2 --
>  9 files changed, 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> index 2ebaa43eb62e..b19be0804abe 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> @@ -25,7 +25,6 @@ properties:
>      const: ldb
>  
>    reg:
> -    minItems: 2
>      maxItems: 2
>  
>    reg-names:
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 880bfe930830..3b609c19e0bc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -66,13 +66,11 @@ properties:
>        2 DSI links.
>  
>    assigned-clocks:
> -    minItems: 2
>      maxItems: 2
>      description: |
>        Parents of "byte" and "pixel" for the given platform.
>  
>    assigned-clock-parents:
> -    minItems: 2
>      maxItems: 2
>      description: |
>        The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> index 716f921e3532..d9ad8b659f58 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -37,7 +37,6 @@ properties:
>  
>    qcom,phy-rescode-offset-top:
>      $ref: /schemas/types.yaml#/definitions/int8-array
> -    minItems: 5
>      maxItems: 5
>      description:
>        Integer array of offset for pull-up legs rescode for all five lanes.
> @@ -49,7 +48,6 @@ properties:
>  
>    qcom,phy-rescode-offset-bot:
>      $ref: /schemas/types.yaml#/definitions/int8-array
> -    minItems: 5
>      maxItems: 5
>      description:
>        Integer array of offset for pull-down legs rescode for all five lanes.
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml
> index 921bfe925cd6..6380eeebb073 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml
> @@ -24,7 +24,6 @@ properties:
>        - samsung,exynos5433-decon-tv
>  
>    clocks:
> -    minItems: 11
>      maxItems: 11
>  
>    clock-names:
> @@ -59,7 +58,6 @@ properties:
>        - const: te
>  
>    iommus:
> -    minItems: 2
>      maxItems: 2
>  
>    iommu-names:
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml
> index 7d405f2febcd..26e5017737a3 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml
> @@ -24,7 +24,6 @@ properties:
>      const: samsung,exynos5433-mic
>  
>    clocks:
> -    minItems: 2
>      maxItems: 2
>  
>    clock-names:
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> index 969bd8c563a5..c06f306e8d14 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> @@ -22,7 +22,6 @@ properties:
>      const: samsung,exynos7-decon
>  
>    clocks:
> -    minItems: 4
>      maxItems: 4
>  
>    clock-names:
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
> index 5d5cc220f78a..210d856b3b57 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
> @@ -27,7 +27,6 @@ properties:
>      const: 1
>  
>    clocks:
> -    minItems: 2
>      maxItems: 2
>  
>    clock-names:
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
> index dbdf0229d9f6..4755a73473c7 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
> @@ -59,7 +59,6 @@ properties:
>      maxItems: 2
>  
>    power-domain-names:
> -    minItems: 2
>      maxItems: 2
>  
>  allOf:
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
> index 4154ae01ad13..5f4f0fb4b692 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
> @@ -42,11 +42,9 @@ properties:
>      maxItems: 1
>  
>    interconnects:
> -    minItems: 6
>      maxItems: 6
>  
>    interconnect-names:
> -    minItems: 6
>      maxItems: 6
>  
>    operating-points-v2:

-- 
Regards,

Laurent Pinchart
