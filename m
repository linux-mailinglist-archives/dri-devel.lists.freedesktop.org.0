Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F185A16AC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 18:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AD510E7CB;
	Thu, 25 Aug 2022 16:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727F210E7CB;
 Thu, 25 Aug 2022 16:27:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09F8C2B3;
 Thu, 25 Aug 2022 18:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661444834;
 bh=Jia0FRh1rO7ns0vJdDk2RVbMJz6ELVXmn8iQUk4lGH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pmf6ItrEGPVynig39smn1gxFCAdOnqEaKcA3Ne6NFSkl3PYeoB1FHqSFjAWWFAQM9
 VwY8zxrWIpHtOHTLDc7H1CjMb3FzimbqDZarEKL5EykPPtcOVHODKjPRd3lDTke0Nx
 rLCwqiCI2Ueu/Yql7ai47z0DW+6bBrMbV8Dk+7CE=
Date: Thu, 25 Aug 2022 19:27:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: socionext,uniphier-system-cache: drop
 minItems equal to maxItems
Message-ID: <Ywei272RbxYZa7lO@pendragon.ideasonboard.com>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
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

On Thu, Aug 25, 2022 at 02:33:30PM +0300, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../bindings/arm/socionext/socionext,uniphier-system-cache.yaml  | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-system-cache.yaml b/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-system-cache.yaml
> index 7ca5375f278f..6096c082d56d 100644
> --- a/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-system-cache.yaml
> +++ b/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-system-cache.yaml
> @@ -22,7 +22,6 @@ properties:
>      description: |
>        should contain 3 regions: control register, revision register,
>        operation register, in this order.
> -    minItems: 3
>      maxItems: 3
>  
>    interrupts:

-- 
Regards,

Laurent Pinchart
